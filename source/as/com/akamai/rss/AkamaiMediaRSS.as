package com.akamai.rss{

	import com.akamai.events.*;
	import com.akamai.utilities.DateUtil;
	import com.akamai.utilities.StringUtil;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	
	/**
	 * Dispatched when an error condition has occurred. The event provides an error number and a verbose description
	 * of each error. The errors thrown by this class include:
	 * <table>
	 * <tr><th> Error Number</th><th>Description</th></tr>
	 * <tr><td>14</td><td>HTTP loading operation failed</td></tr>
	 * <tr><td>15</td><td>XML is not well formed</td></tr>
	 * <tr><td>16</td><td>XML does not conform to Media RSS standard</td></tr>
	 * <tr><td>17</td><td>Class is busy and cannot process your request</td></tr>
	 * <tr><td>20</td><td>Timed out trying to load the XML file</td></tr>
	 * </table>
	 * 
	 * @eventType com.akamai.events.AkamaiErrorEvent.ERROR
	 */
 	[Event (name="error", type="com.akamai.events.AkamaiErrorEvent")]
	/**
	 * Dispatched when the BOSS xml response has been successfully loaded. 
	 * 
	 * @eventType com.akamai.events.AkamaiNotificationEvent.LOADED
	 */
 	[Event (name="loaded", type="com.akamai.events.AkamaiNotificationEvent")]
	/**
	 * Dispatched when the BOSS xml response has been successfully parsed. 
	 * 
	 * @eventType com.akamai.events.AkamaiNotificationEvent.PARSED
	 */
 	[Event (name="parsed", type="com.akamai.events.AkamaiNotificationEvent")]
	/**
	 * The AkamaiMediaRSS class loads a Media RSS playlist, parses it and makes utility
	 * properties and methods available which expose the contents of that feed.
	 *  
	 */
	public class AkamaiMediaRSS extends EventDispatcher {

		// Declare vars
		private var _rss:XML;
		private var _rawData:String;
		private var _title:String;
		private var _description:String;
		private var _imageUrl:String;
		private var _itemCount:Number;
		private var _itemArray:Array;
		private var _busy:Boolean;
		private var _timeoutTimer:Timer;
		private var _filterFields:RSSFilterFields;
		private var _filterPattern:RegExp;
		private var _filterDate:Date;
		private var _filterDateMatch:int;
		
		//Declare constants
		public const VERSION:String = "1.0";
		private const TIMEOUT_MILLISECONDS:uint= 15000;
		public const FILTER_ANY:int = 1;
		public const FILTER_ALL:int = 2;
		public const FILTER_DATE_LEQ:int = 1;	// For Date filtering; less than or equal to
		public const FILTER_DATE_GEQ:int = 2;	// For Date filtering; greater than or equal to
		
		// Declare namespaces
		private var mediaNs:Namespace;
		
		/**
		 * Constructor
		 * @private
		 */
		public function AkamaiMediaRSS():void {
			_busy = false;
			_timeoutTimer = new Timer(TIMEOUT_MILLISECONDS,1);
			_timeoutTimer.addEventListener(TimerEvent.TIMER_COMPLETE,doTimeOut);
		}
		/**
		 * Loads a Media RSS feed and initiates the parsing process.
		 * 
		 * @return true if the load is initiated otherwise false if the class is busy
		 * 
		 * @see isBusy
		 */
		public function load(src:String):Boolean{
			if (!_busy) {
				_busy = true;
				_timeoutTimer.reset();
				_timeoutTimer.start();
				var xmlLoader:URLLoader = new URLLoader();
				xmlLoader.addEventListener("complete",xmlLoaded);
				xmlLoader.addEventListener(IOErrorEvent.IO_ERROR,catchIOError);
				xmlLoader.load(new URLRequest(src));
				return true;
			} else {
				dispatchEvent(new AkamaiErrorEvent(AkamaiErrorEvent.ERROR,17,"Class is busy and cannot process your request"));
				return false;
			}
		}
		/**
		 * The raw data string returned by the RSS service. This value will still
		 * be populated even if the data is not well-formed XML, to assist with debugging.
		 * 
		 * @return string representing the text returned by the RSS service.
		 * 
		 */
		public function get rawData():String {
			return _rawData;
		}
		/**
		 * The RSS feed as an XML object. 
		 * 
		 */
		public function get rssAsXml():XML {
			return _rss;
		}
		/**
		 * The RSS item at the given index. 
		 * 
		 */
		public function getItemAt(i:uint):ItemTO {
			return _itemArray[i];
		}
		/**
		 * The title of the RSS feed 
		 * 
		 */
		public function get title():String {
			return _title;
		}
		/**
		 * The description of the RSS feed 
		 * 
		 */
		public function get description():String {
			return _description;
		}
		/**
		 * The image URL of the feed
		 * 
		 */
		public function get imageUrl():String {
			return _imageUrl;
		}
		/**
		 * The number of items in the feed 
		 * 
		 */
		public function get itemCount():Number {
			return _itemCount;
		}
		/**
		 * The items as an array of ItemTO objects 
		 * 
		 */
		public function get itemArray():Array {
			return _itemArray;
		}
		/**
		 * The items as an XMLList
		 * 
		 */
		public function get itemXmlList():XMLList{
			return XMLList(_rss.channel.item);
		}
		/**
		 * Returns a filtered play list, allowing text filtering or date filtering. The properties in the 
		 * <code>FilterFields</code> class allow you to specify which RSS fields will be used for the filtering.
		 * 
		 * Calling this method with both <code>filterText</code> and <code>filterDate</code> arguments will essentially result
		 * in a double-filtering: the results of the text filter are then filtered again using the date filter. 
		 * 
		 * For date filtering the <code>filterMatch</code> argument is ignored.
		 * 
		 * @return An array containing the filtered list or <code>null</code> if no matching items were found.
		 *
		 * @param The text string to search for in the item list of RSS feeds.
		 * @param A FilterFields object specifying which fields in the item list of RSS feeds to search. If this argument 
		 * is null, all fields will be searched. 
		 * @param Either <code>FILTER_ANY</code> or <code>FILTER_ALL</code>. <code>FILTER_ANY</code> will find a match if
		 * any string contained in the <code>filterText</code> argument is found in any of the <code>filterFields</code> specified.
		 * <code>FILTER_ALL</code> will find a match only if the entire string is found in any of the <code>filterFields</code> specified.
		 * @param A date to search for in the item list of RSS feeds that contain dates. If the <code>filterFields</code> argument
		 * is null, all fields containing dates will be searched. In order for the 'less than or equal to' comparison to work as expected,
		 * we will set the time of this object to midnight if the hours, minutes, and seconds are all equal to zero. If this is not the
		 * desired behavior, set the seconds to 1 on the this Date object before calling this method.
		 * @param Either <code>FILTER_DATE_LEQ</code> specifying 'less than or equal to', or <code>FILTER_DATE_GEQ</code> specifying
		 * 'greater than or equal to'.
		 */
		public function filterItemList(filterText:String, filterFields:RSSFilterFields=null, filterMatch:int=FILTER_ANY,
										filterDate:Date=null, filterDateMatch:int=FILTER_DATE_LEQ):Array {
			var resultArr:Array = null;
			var useResultArray:Boolean = false;

			_filterFields = filterFields;

			if (filterText && filterText != "") {
				resultArr = filterItemListText(filterText, filterMatch);
				useResultArray = true;
			}
			if (filterDate) {
				var tempResultArr:Array = filterItemListDate((useResultArray ? resultArr:null), filterDate, filterDateMatch);
				resultArr = tempResultArr;
			}
			return resultArr;									
		}
		/** Filter method for finding dates in the item array
		 * @private
		 */
		private function filterItemListDate(arr:Array, filterDate:Date, filterMatch:int):Array {
			var filterArr:Array = arr ? arr : _itemArray;
			
			if (_filterFields == null) {
				_filterFields = new RSSFilterFields();
				_filterFields.pubDate = true;
			}
			_filterDate = filterDate;
			_filterDateMatch = filterMatch;
			
			return filterArr.filter(findFilterDate);
		}
		/**
		 * The date filter method for each individual item in the item list.
		 * @private
		 */
		private function findFilterDate(item:ItemTO, index:int, arr:Array):Boolean {
			if (item.pubDate && filterCompareDate(item.pubDate))
				return true;
			return false;
		}				
		/**
		 * The compare function for an individual date used by the filter functionality. 
		 * @private
		 */
		private function filterCompareDate(rssField:String):Boolean {
			var tempDate:String = rssField.replace(/-/g, "/");
			var ms:Number = Date.parse(tempDate);
			var rssFieldDate:Date = new Date(ms);
			
			// In order for the 'less than or equal to' compare to work as expected with the default time settings of the Date object, we
			// need to set the time to midnight on the date specified.
			if ((_filterDateMatch == FILTER_DATE_LEQ) && (_filterDate.hours == 0) && (_filterDate.minutes == 0) && (_filterDate.seconds == 0)) {
				_filterDate.hours = 23;
				_filterDate.minutes = 59;
				_filterDate.seconds = 59;
			}
			
			var compResult:Number = DateUtil.compare(rssFieldDate, _filterDate);
			if (compResult == 0)
				return true;	// The dates are equal
				
			switch (_filterDateMatch) {
				case FILTER_DATE_LEQ:
					if (compResult == -1)	// Less than
						return true;
					break;
				case FILTER_DATE_GEQ:
					if (compResult == 1)	// Greater than
						return true;
					break;
			}
			return false;
		}	
		/** Filter method for finding text in the item array
		 * @private
		 */
		private function filterItemListText(filterText:String, filterMatch:int):Array {
			if (!_itemArray || !_itemArray.length)
				return null;
				
			if (_filterFields == null) {
				_filterFields = new RSSFilterFields();
				_filterFields.setAll(true);
			}
			// Remove leading and trailing white spaces
			filterText = StringUtil.trim(filterText);
			
			var _tempPattern:String = new String;

			if (filterMatch == FILTER_ANY)
			{
				var _filterText:Array = filterText.split(' ');
				if (_filterText.length == 0)
					return null;
				
				for (var i:int = 0; i < _filterText.length; i++) {
					var _tempString:String = StringUtil.trim(_filterText[i]);
					if (_tempString.length == 0)
						continue;
					_tempPattern += _tempString; 
					if (i != (_filterText.length-1))
						_tempPattern += '|';
				}
			}
			else
				_tempPattern = filterText;
			
			_filterPattern = null;
			_filterPattern = new RegExp(_tempPattern, "gi");
						
			return _itemArray.filter(findFilterText);
		}
		/**
		 * The text filter method for each individual item in the item list.
		 * @private
		 */
		private function findFilterText(item:ItemTO, index:int, arr:Array):Boolean {			
			if (_filterFields.author && filterCompare(item.author))
				return true;
			if (_filterFields.description && filterCompare(item.description))
				return true;
			if (_filterFields.enclosureType && filterCompare(item.enclosure.type))
				return true;
			if (_filterFields.enclosureURL && filterCompare(item.enclosure.url))
				return true;
				
			var i:int;

			if (_filterFields.mediaContentExpression) {
				for (i = 0; i < item.media.contentArray.length; i++) {
					if (filterCompare(item.media.contentArray[i].expression))
						return true;
				}	
			}
			if (_filterFields.mediaContentIsDefault) {
				for (i = 0; i < item.media.contentArray.length; i++) {
					if (filterCompare(item.media.contentArray[i].isDefault))
						return true;
				}
			}
			if (_filterFields.mediaContentLang) {
				for (i = 0; i < item.media.contentArray.length; i++) {
					if (filterCompare(item.media.contentArray[i].lang))
						return true;
				}
			}
			if (_filterFields.mediaContentMedium) {
				for (i = 0; i < item.media.contentArray.length; i++) {
					if (filterCompare(item.media.contentArray[i].medium))
						return true;
				}
			}
			if (_filterFields.mediaContentType) {
				for (i = 0; i < item.media.contentArray.length; i++) {
					if (filterCompare(item.media.contentArray[i].type))
						return true;
				}
			}
			if (_filterFields.mediaContentURL) {
				for (i = 0; i < item.media.contentArray.length; i++) {
					if (filterCompare(item.media.contentArray[i].url))
						return true;
				}
			}
			if (_filterFields.mediaCopyright && filterCompare(item.media.copyright))
				return true;
			if (_filterFields.mediaDescription && filterCompare(item.media.description))
				return true;
			if (_filterFields.mediaKeywords && filterCompare(item.media.keywords))
				return true;
			if (_filterFields.mediaThumbnailTime) {
				for (i = 0; i < item.media.thumbnailArray.length; i++) {
					if (filterCompare(item.media.thumbnailArray[i].time))
						return true;
				}
			}
			if (_filterFields.mediaThumbnailURL) {
				for (i = 0; i < item.media.thumbnailArray.length; i++) {
					if (filterCompare(item.media.thumbnailArray[i].url))
						return true;
				}
			}
			if (_filterFields.mediaTitle && filterCompare(item.media.title))
				return true;
			if (_filterFields.pubDate && filterCompare(item.pubDate))
				return true;
			if (_filterFields.title && filterCompare(item.title))
				return true;

			return false;
		}
		/**
		 * The compare function for an individual string used by the filter functionality. 
		 * @private
		 */
		private function filterCompare(str:String):int {
			var _matchArray:Array = str.match(_filterPattern);
			if (_matchArray)
				return _matchArray.length;
			return 0;
		}	
		/** Catches the time out of the initial load request.
		  * @private
		  */
		private function doTimeOut(e:TimerEvent):void {
			dispatchEvent(new AkamaiErrorEvent(AkamaiErrorEvent.ERROR,20,"Timed out trying to load the XML file"));
		}
		/** Handles the XML request response
		    * @private
		    */
		private function xmlLoaded(e:Event):void {
			_timeoutTimer.stop();
			_rawData=e.currentTarget.data.toString();
			try {
				_rss=XML(_rawData);
				dispatchEvent(new AkamaiNotificationEvent(AkamaiNotificationEvent.LOADED));
				parseXML();
			} catch (err:Error) {
				_busy = false;
				dispatchEvent(new AkamaiErrorEvent(AkamaiErrorEvent.ERROR,15,"XML is not well formed"));
			}
		}
		/** Parses the RSS xml feed into useful properties
		 * @private
		 */
		private function parseXML():void {
			_busy = false;
			if (!verifyRSS(_rss)) {
				dispatchEvent(new AkamaiErrorEvent(AkamaiErrorEvent.ERROR,16,"XML does not conform to Media RSS standard"));
			} else {
				mediaNs = _rss.namespace("media");
				_title=_rss.channel.title;
				_description=_rss.channel.description;
				_imageUrl=_rss.channel.image.url;
				_itemCount=_rss.channel.item.length();
				_itemArray=new Array  ;
				for (var i:uint = 0; i < _itemCount; i++) {
					var item:ItemTO=new ItemTO();
					item.title=_rss.channel.item[i].title;
					item.author=_rss.channel.item[i].author;
					item.description=_rss.channel.item[i].description;
					item.pubDate=_rss.channel.item[i].pubDate;
					var enclosure:EnclosureTO = new EnclosureTO();
					enclosure.url =_rss.channel.item[i].enclosure.@url;
					enclosure.length=Number(_rss.channel.item[i].enclosure.@length.toString());
					enclosure.type=_rss.channel.item[i].enclosure.@type;
					item.enclosure = enclosure;
					if (_rss.channel.item[i].mediaNs::group == undefined) {
						item.media = buildMediaObject(_rss.channel.item[i]);
					
					} else {
						item.media = buildMediaObject(XML(_rss.channel.item[i].mediaNs::group));
						
					}
					_itemArray.push(item);
					
				}
				dispatchEvent(new AkamaiNotificationEvent(AkamaiNotificationEvent.PARSED));
			}
			
		}
		private function buildMediaObject(node:XML):Media {
				var media:Media = new Media();
				for (var k:uint=0;k<node.mediaNs::thumbnail.length();k++) {
					// It is possible for media items to contain mutiple thumbnail definitions.
					// Here we opt to take the first item found.
					var thumbnail:ThumbnailTO = new ThumbnailTO();
					thumbnail.url = node.mediaNs::thumbnail[k].@url;
					thumbnail.height = Number(node.mediaNs::thumbnail[k].@height);
					thumbnail.width = Number(node.mediaNs::thumbnail[k].@width);
					thumbnail.time = node.mediaNs::thumbnail[k].@width;
					media.thumbnailArray.push(thumbnail);
				}
				for (var i:uint=0;i<node.mediaNs::content.length();i++) {
					var content:ContentTO = new ContentTO();
					content.fileSize=Number(node.mediaNs::content[i].@fileSize);
					content.type=node.mediaNs::content[i].@type;
					content.medium=node.mediaNs::content[i].@medium;
					content.isDefault=node.mediaNs::content[i].@isDefault;
					content.expression=node.mediaNs::content[i].@expression;
					content.bitrate=Number(node.mediaNs::content[i].@bitrate);
					content.framerate=Number(node.mediaNs::content[i].@framerate);
					content.samplingrate=Number(node.mediaNs::content[i].@samplingrate);
					content.channels=node.mediaNs::content[i].@channels;
					content.duration=node.mediaNs::content[i].@duration;
					content.height=Number(node.mediaNs::content[i].@height);
					content.width=Number(node.mediaNs::content[i].@width);
					content.lang = node.mediaNs::content[i].@lang;
					content.url =node.mediaNs::content[i].@url;
					media.contentArray.push(content);
				}
				media.title = node.mediaNs::title;
				media.description = node.mediaNs::description;
				media.copyright = node.mediaNs::copyright;
				media.keywords = node.mediaNs::keywords;
				media.thumbnail = media.thumbnailArray[0];
				//
				return media;
			
		}
		/** A simple verification routine to check if the XML received conforms
		 * to some basic RSS requirements. This routine does not validate against
		 * the DTD.
		 * @private
		 */
		private function verifyRSS(src:XML):Boolean {
			var verified:Boolean = true;
			if (src.@version == undefined) {
				verified = false;
			}
			if (src.channel.title == undefined || src.channel.link == undefined || src.channel.description == undefined) {
				verified = false;
			}
			if (src.channel.item is XMLList) {
				for each (var item:XML in _rss.channel.item) {
					if (item.title == undefined && item.description == undefined) {
						verified = false;
					}
				}

			} else {
				if (src.channel.item != undefined && src.channel.item.title == undefined && src.channel.item.description == undefined) {
					verified = false;
				}
			}
			return verified;
		}

		/** Catches IO errors when requesting the xml 
		 * @private
		 */
		private function catchIOError(e:IOErrorEvent):void {
			_timeoutTimer.stop();
			_busy = false;
			dispatchEvent(new AkamaiErrorEvent(AkamaiErrorEvent.ERROR,14,"HTTP loading operation failed"));
		}
	}
}