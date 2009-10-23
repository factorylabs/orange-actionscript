package com.factorylabs.orange.core.net{	import com.factorylabs.orange.core.logger.Log;	import com.factorylabs.orange.core.net.events.BandwidthDetectionEvent;		import flash.display.Loader;	import flash.display.LoaderInfo;	import flash.events.Event;	import flash.events.EventDispatcher;	import flash.events.IEventDispatcher;	import flash.events.IOErrorEvent;	import flash.events.ProgressEvent;	import flash.events.SecurityErrorEvent;	import flash.net.URLRequest;	import flash.utils.getTimer;		/**	 * This class loads a specified test file and determines a users bandwidh.	 * 	 * Thanks to Hayden Porter for writing a nice article on testing bandwidth at:	 *	http://www.sonify.org/home/feature/remixology/019_bandwidthdetection/	 * 	 * Copyright 2008 by Factory Design Labs, All Rights Reserved.	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>	 *	 * @author		Grant	 * @version		1.0.0 :: Apr 2, 2008	 */
	public class BandwidthDetection		implements IEventDispatcher	{/* Properties ......................................................................................*/				/**		 * String value of the URL location of a file to download for testing bandwidth. 		 */		private var _fileURL:String;				/**		 * Loader object which will perform the external download. 		 */		private var _loader:Loader;				/**		 * Time, in miliseconds, of when the first bytes have been downloaded.		 */		private var _startTime:Number = NaN;				/**		 * Time, in miliseconds, of when the download completely finished. 		 */		private var _endTime:Number = NaN;				/**		 * The calculated bandwidth, in Kbps, of the user's internet connection speed. 		 */		private var _bandwidth:Number = NaN;				/**		 * Object used for sending BandwidthDetectionEvent messages.		 */		private var _dispatcher				:EventDispatcher;		/* Getters/Setters ......................................................................................*/		/**		 * @return 		the number of kilobytes per seconded downloaded  		 */		public function get bandwidth():Number { return _bandwidth; };				/* Constructor ......................................................................................*/			/**		 * Constructor.		 * 		 * @param file Must be an absolute path to the test file. If the file is local, it will not work.		 */		public function BandwidthDetection( file:String )		{			_fileURL = file;			_dispatcher = new EventDispatcher( this );			init();		}/* Public Methods ......................................................................................*//* Private Methods ......................................................................................*/					private function init():void 		{			// build loader, and load. 			_loader = new Loader();			addLoaderListeners( _loader.contentLoaderInfo );						var url:String;			url = _fileURL + "?seed=" + int( Math.random() * 10000 );			_loader.load( new URLRequest( url ));		}				/**		 * Adds loading listeners to a LoaderInfo object.		 */		private function addLoaderListeners( obj:LoaderInfo ):void		{			obj.addEventListener( Event.OPEN, onOpen );			obj.addEventListener( ProgressEvent.PROGRESS, onProgress );			obj.addEventListener( Event.INIT, onLoadComplete );			obj.addEventListener( Event.UNLOAD, onError );			obj.addEventListener( IOErrorEvent.IO_ERROR, onError );			obj.addEventListener( SecurityErrorEvent.SECURITY_ERROR, onError );		}				/**		 * Removes loading listeners to a LoaderInfo object.		 */		private function removeLoaderListeners( obj:LoaderInfo ):void		{			obj.removeEventListener( Event.OPEN, onOpen );			obj.removeEventListener( ProgressEvent.PROGRESS, onProgress );			obj.removeEventListener( Event.INIT, onLoadComplete );			obj.removeEventListener( Event.UNLOAD, onError );			obj.removeEventListener( IOErrorEvent.IO_ERROR, onError );			obj.removeEventListener( SecurityErrorEvent.SECURITY_ERROR, onError );		}				/**		 * @param sizeInBytes	Number of bytes downloaded to determine Kbps.		 * @return				the number of kilobytes per seconded downloaded 		 */		private function getKbps( sizeInBytes:Number ):Number 		{			var elapsedTimeMS:Number = _endTime - _startTime; // time elapsed since start loading swf			var elapsedTime:Number = elapsedTimeMS/1000; //convert to seconds			var sizeInBits:Number = sizeInBytes * 8; // convert Bytes to bits			var sizeInKBits:Number = sizeInBits/1000; // convert bits to kbits			var kbps:Number = ( sizeInKBits/elapsedTime );// * 0.93 ; // IP packet header overhead around 7%			return Math.floor( kbps ); // return user friendly number		}/* Event Handlers......................................................................................*/		/**		 * Handles errors encountered trying to load the test file.		 */		private function onError( e:* ):void		{			Log.error("[BandwidthDetection] onError");			removeLoaderListeners( _loader.contentLoaderInfo );			dispatchEvent( new BandwidthDetectionEvent( BandwidthDetectionEvent.DETECTION_ERROR, _bandwidth ));			e = null;		}				/**		 * Handles a finished download. 		 */		private function onLoadComplete( evt:Event ):void		{			// record finish time. 			_endTime = getTimer();								// determine the new bandwidth.			_bandwidth = Math.ceil( getKbps( _loader.contentLoaderInfo.bytesTotal ) * 1.25 );						// send event notifying the load is complete.			dispatchEvent( new BandwidthDetectionEvent( BandwidthDetectionEvent.DETECTION_COMPLETE, _bandwidth ));						// kill loader.			removeLoaderListeners( _loader.contentLoaderInfo );			_loader = null;		}		/**		 * Handles connection opening.		 */		private function onOpen( evt:Event ):void		{//			Log.trace( "[BandwidthDetection] onOpen, time: " + getTimer() );		}			/**		 * Handler which fires when bytes have been downloaded. 		 */		private function onProgress( evt:ProgressEvent ):void		{			if ( isNaN( _startTime )) 			{				_startTime = getTimer();			}		}/* * EVENT DISPATCHER HOOKS**************************************************************************************************** */				/**		 * @inheritDoc		 */		public function dispatchEvent( e :Event ) :Boolean		{			return _dispatcher.dispatchEvent( e );		}		/**		 * @inheritDoc		 */		public function addEventListener( type :String, listener :Function, useCapture :Boolean = false, priority :int = 0, useWeakReference :Boolean = false ) :void		{			_dispatcher.addEventListener( type, listener, useCapture, priority, useWeakReference );		}			/**		 * @inheritDoc		 */		public function removeEventListener( type :String, listener :Function, useCapture :Boolean = false ) :void		{			_dispatcher.removeEventListener( type, listener, useCapture );		}		/**		 * @inheritDoc		 */		public function hasEventListener( type :String ) :Boolean		{			return _dispatcher.hasEventListener( type );		}			/**		 * @inheritDoc		 */		public function willTrigger( type :String ) :Boolean		{			return _dispatcher.willTrigger( type );		}			}}