
package com.factorylabs.orange.core.logging
{
	import com.factorylabs.orange.core.logging.events.LoggerEvent;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * Captures incoming messages and objects categorized by levels and a logger's indentifier, broadcasts their log information out to observers.
	 * 
	 * <p>Acts as a facade for capturing logging calls in an application and allows the results to be easily rewired to specific services.
	 * Logger's should be injected at startup</p> 
 	 * 
 	 * <p>Copyright 2004-2009 by Factory Design Labs</p>
 	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
     * 
     * Permission is hereby granted, free of charge, to any person obtaining
     * a copy of this software and associated documentation files (the
     * "Software"), to deal in the Software without restriction, including
     * without limitation the rights to use, copy, modify, merge, publish,
     * distribute, sublicense, and/or sell copies of the Software, and to
     * permit persons to whom the Software is furnished to do so, subject to
     * the following conditions:
     * 
     * The above copyright notice and this permission notice shall be
     * included in all copies or substantial portions of the Software.
     * 
     * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
     * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
     * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
     * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
     * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
     * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
     * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 	 *
 	 * @author		Matthew Kitt
 	 * @version		1.0.0 :: Feb 16, 2009
 	 */
	public class Logger
		implements ILogger, IEventDispatcher
	{
		private var _dispatcher		:EventDispatcher;
		private var _name			:String;
		private var _isSilent		:Boolean;
		
		/**
		 * @inheritDoc
		 */
		public function get name() :String { return _name; }
		public function set name( $name :String ) :void
		{
			_name = $name;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get isSilent() :Boolean { return _isSilent; }
		public function set isSilent( $isSilent :Boolean ) :void
		{
			_isSilent = $isSilent;
		}
	
		/**
		 * Instantiates a logger instance.
		 * Precondition:	None.
		 * Postcondition:	An object ready to be used for dispatching logging messages. 
		 * @param $name		A string identifier for the logger instance.
		 * @param $isSilent	Whether this logger instance should suppress it's events.
		 * 
		 * @example The following code instantiates a logger. 
	 	 * <listing version="3.0" >
	 	 * var logger :Logger = new Logger( '[Core Logger]', false );
	 	 * logger.trace( "[AbstractView].initialize()", _data, "MK" );
	 	 * </listing>
		 */
		public function Logger( $name :String = '[Generic Logger]', $isSilent :Boolean = false )
		{
			_name = $name;
			_isSilent = $isSilent;
			_dispatcher = new EventDispatcher( this );
		}
		
		/**
		 * @inheritDoc
		 */
		public function toString() :String 
		{
			return 'com.factorylabs.orange.core.logging.Logger';
		}
		
		/**
		 * @inheritDoc
		 */
		public function trace( $msg :String = '', $object :Object = null, $level :String = null ) :void
		{
			var hasListener		:Boolean = hasEventListener( LoggerEvent.UPDATE );
			if( hasListener == true && isSilent == false ) 
				dispatchEvent( new LoggerEvent( LoggerEvent.UPDATE, $msg, $object, $level, _name ) );
		}
		
		/**
		 * @inheritDoc
		 */
		public function log( $msg :String = '', $object :Object = null ) :void
		{
			trace( $msg, $object, LogLevels.LOG );
		}
		
		/**
		 * @inheritDoc
		 */
		public function debug( $msg :String = '', $object :Object = null ) :void
		{
			trace( $msg, $object, LogLevels.DEBUG );
		}
		
		/**
		 * @inheritDoc
		 */
		public function info( $msg :String = '', $object :Object = null ) :void
		{
			trace( $msg, $object, LogLevels.INFO );
		}
		
		/**
		 * @inheritDoc
		 */
		public function warn( $msg :String = '', $object :Object = null ) :void
		{
			trace( $msg, $object, LogLevels.WARN );
		}
		
		/**
		 * @inheritDoc
		 */
		public function error( $msg :String = '', $object :Object = null ) :void
		{
			trace( $msg, $object, LogLevels.ERROR );
		}
		
		/**
		 * @inheritDoc
		 */
		public function fatal( $msg :String = '', $object :Object = null ) :void
		{
			trace( $msg, $object, LogLevels.FATAL );
		}
		
		/**
		 * @inheritDoc
		 */
		public function core( $msg :String = '', $object :Object = null ) :void
		{
			trace( $msg, $object, LogLevels.CORE );
		}
		
		/**
		 * @inheritDoc
		 */
		public function dispatchEvent( e :Event ) :Boolean
		{
			return _dispatcher.dispatchEvent( e );
		}

		/**
		 * @inheritDoc
		 */
		public function addEventListener( type :String, listener :Function, useCapture :Boolean = false, priority :int = 0, useWeakReference :Boolean = false ) :void
		{
			_dispatcher.addEventListener( type, listener, useCapture, priority, useWeakReference );
		}
	
		/**
		 * @inheritDoc
		 */
		public function removeEventListener( type :String, listener :Function, useCapture :Boolean = false ) :void
		{
			_dispatcher.removeEventListener( type, listener, useCapture );
		}

		/**
		 * @inheritDoc
		 */
		public function hasEventListener( type :String ) :Boolean
		{
			return _dispatcher.hasEventListener( type );
		}
	
		/**
		 * @inheritDoc
		 */
		public function willTrigger( type :String ) :Boolean
		{
			return _dispatcher.willTrigger( type );
		}
	}
}