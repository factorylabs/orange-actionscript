package com.akamai.rss
{
	/**
	 * The FilterFields class is used by the <code>filterItemList</code> method in the AkamaiMediaRSS class.
	 * This class provides the caller of the <code>filterItemList</code> method with a simple way to specify 
	 * which fields to search in a media RSS feed.<p/>
	 * The Media RSS specification can be viewed at <a href="http://search.yahoo.com/mrss" target="_blank">http://search.yahoo.com/mrss</a>.
	 */
	public class RSSFilterFields
	{	
		private var _title:Boolean;
		private var _author:Boolean;
		private var _description:Boolean;
		private var _pubDate:Boolean;
		private var _enclosureType:Boolean;
		private var _enclosureURL:Boolean;
		private var _mediaContentType:Boolean;
		private var _mediaContentMedium:Boolean;
		private var _mediaContentIsDefault:Boolean;
		private var _mediaContentExpression:Boolean;
		private var _mediaContentLang:Boolean;
		private var _mediaContentURL:Boolean;
		private var _mediaCopyright:Boolean;
		private var _mediaTitle:Boolean;
		private var _mediaDescription:Boolean;
		private var _mediaKeywords:Boolean;
		private var _mediaThumbnailTime:Boolean;
		private var _mediaThumbnailURL:Boolean;
		
		/**
		 * Constructor
		 * 
		 */
		public function RSSFilterFields()
		{
			setAll(false);
		}

		/**
		 * Sets all fields to either true or false depending on the argument.
		 * 
		 */
		public function setAll(value:Boolean):void
		{
			_title = 
			_author = 
			_description = 
			_pubDate = 
			_enclosureType = 
			_enclosureURL = 
			_mediaContentType = 
			_mediaContentMedium = 
			_mediaContentIsDefault = 
			_mediaContentExpression = 
			_mediaContentLang = 
			_mediaContentURL = 
			_mediaCopyright = 
			_mediaTitle = 
			_mediaDescription = 
			_mediaKeywords = 
			_mediaThumbnailTime = 
			_mediaThumbnailURL = value;
		}
		
		public function set title(value:Boolean) : void { _title = value; }
		public function set author(value:Boolean) : void { _author = value; }
		public function set description(value:Boolean) : void { _description = value; }
		public function set pubDate(value:Boolean) : void { _pubDate = value; }
		public function set enclosureType(value:Boolean) : void { _enclosureType = value; }
		public function set enclosureURL(value:Boolean) : void { _enclosureURL = value; }
		public function set mediaContentType(value:Boolean) : void { _mediaContentType = value; }
		public function set mediaContentMedium(value:Boolean) : void { _mediaContentMedium = value; }
		public function set mediaContentIsDefault(value:Boolean) : void { _mediaContentIsDefault = value; }
		public function set mediaContentExpression(value:Boolean) : void { _mediaContentExpression = value; }
		public function set mediaContentLang(value:Boolean) : void { _mediaContentLang = value; }
		public function set mediaContentURL(value:Boolean) : void { _mediaContentURL = value; }
		public function set mediaCopyright(value:Boolean) : void { _mediaCopyright = value; }
		public function set mediaTitle(value:Boolean) : void { _mediaTitle = value; }
		public function set mediaDescription(value:Boolean) : void { _mediaDescription = value; }
		public function set mediaKeywords(value:Boolean) : void { _mediaKeywords = value; }
		public function set mediaThumbnailTime(value:Boolean) : void { _mediaThumbnailTime = value; }
		public function set mediaThumbnailURL(value:Boolean) : void { _mediaThumbnailURL = value; }
		
		public function get title() : Boolean { return _title; }
		public function get author() : Boolean { return _author; }
		public function get description() : Boolean { return _description; }
		public function get pubDate() : Boolean { return _pubDate; }
		public function get enclosureType() : Boolean { return _enclosureType; }
		public function get enclosureURL() : Boolean { return _enclosureURL; }
		public function get mediaContentType() : Boolean { return _mediaContentType; }
		public function get mediaContentMedium() : Boolean { return _mediaContentMedium; }
		public function get mediaContentIsDefault() : Boolean { return _mediaContentIsDefault; }
		public function get mediaContentExpression() : Boolean { return _mediaContentExpression; }
		public function get mediaContentLang() : Boolean { return _mediaContentLang; }
		public function get mediaContentURL() : Boolean { return _mediaContentURL; }
		public function get mediaCopyright() : Boolean { return _mediaCopyright; }
		public function get mediaTitle() : Boolean { return _mediaTitle; }
		public function get mediaDescription() : Boolean { return _mediaDescription; }
		public function get mediaKeywords() : Boolean { return _mediaKeywords; }
		public function get mediaThumbnailTime() : Boolean { return _mediaThumbnailTime; }
		public function get mediaThumbnailURL() : Boolean { return _mediaThumbnailURL; }
		
	}
}
