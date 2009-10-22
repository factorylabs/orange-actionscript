package com.factorylabs.orange.core.logger
{
	import com.factorylabs.orange.core.logger.events.LogEvent;		import flash.events.Event;	import flash.events.EventDispatcher;	import flash.events.IEventDispatcher;	import flash.utils.Dictionary;		/**
	 * Captures incoming messages, objects categorized by levels and broadcasts their log information out to observers.
	 * 
	 * <p>Copyright 2004-2009 by Factory Design Labs</p>
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
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
 	 * @author		Matthew Kitt
 	 * @version		1.0.0 :: Feb 16, 2009
 	 */
	public class Log
		implements IEventDispatcher
	{
/*
 * PROPERTIES
**************************************************************************************************** */

		private static var _instance		:Log;
		private static var _level			:String = LogLevels.DEBUG;
		private static var _appName			:String = "NO APP NAME DEFINED";
		private static var _isDev			:Boolean = true;
		
		private var _dispatcher				:EventDispatcher;
		private var _dictionary 			:Dictionary;	
/*
 * PROPERTY ACCESS
**************************************************************************************************** */
		
		/**
		 * @return	the current global log level.
		 */
		public static function get level() :String
		{
			return _level;
		}
		
		public static function set level( v_level :String ) :void
		{
			_level = v_level;
		}
		
		/**
		 * @return	the current application name used for identification.
		 */
		public static function get appName() :String
		{
			return _appName;
		}
		
		public static function set appName( v_appName :String ) :void
		{
			_appName = v_appName;
		}
		
		/**
		 * @return	the production state of the application.
		 */
		public static function get isDev() :Boolean
		{
			return _isDev;
		}
		
		public static function set isDev( v_isDev :Boolean ) :void
		{
			_isDev = v_isDev;
		}
/*
 * CONSTRUCTOR
**************************************************************************************************** */
	
		/**
		 * The singleton initialization with an EventDispatcher object. 
		 * @param enforcer	Internal type only available to this class. 
		 */
		public function Log( enforcer :SingletonEnforcer )
		{
			enforcer = null;
			_dispatcher = new EventDispatcher( this );
			setLevels();
		}

		/**
		 * @return	The single instance of Log
		 */
		public static function get instance() :Log { return getInstance(); }
		public static function getInstance() :Log
		{
			if( _instance == null ) _instance = new Log( new SingletonEnforcer() );
			return _instance;
		}
		
		/**
		 * @return	the string equivalent of this class.
		 */
		public static function toString() :String 
		{
			return "com.factorylabs.core.logger.Log";
		}

/*
 * PUBLIC ACCESS
**************************************************************************************************** */
		
		/**
		 * Handles the basic necessities of logging a message, all class static methods are filtered through here.
		 * Precondition: A message, optional object and optional level
		 * Postcondition: A dispatched log event if there are listeners, in dev mode and meets the appropriate level.
		 * @param v_msg		String message to trace out.
		 * @param v_object	Object to be inspected via the debugger.
		 * @param v_level	LogLevels constant or custom notification filter.
		 * 
		 * @example The following code logs a command with a custom level. 
	 	 * <listing version="3.0" >
	 	 * Log.trace( "[AbstractView].initialize()", _data, "MK" );
	 	 * </listing> 
		 */
		public static function trace( v_msg :String = '', v_object :Object = null, v_level :String = null ) :void
		{
			var logger			:Log = Log.instance;
			var hasListener		:Boolean = logger.hasEventListener( LogEvent.UPDATE );
			var isCleared		:Boolean = logger.hasClearance( v_level );
			
			if( hasListener == true && isDev == true && isCleared == true ) 
				logger.dispatchEvent( new LogEvent( LogEvent.UPDATE, v_msg, v_object, v_level ) );
		}
		
		/**
		 * Logs the message and object through Log.trace with the LogLevels.LOG filter (level 0).
		 * @param v_msg		String message to trace out.
		 * @param v_object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of LOG. 
	 	 * <listing version="3.0" >
	 	 * Log.log( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		public static function log( v_msg :String = '', v_object :Object = null ) :void
		{
			Log.trace( v_msg, v_object, LogLevels.LOG );
		}
		
		/**
		 * Logs the message and object through Log.trace with the LogLevels.DEBUG filter (level 0).
		 * @param v_msg		String message to trace out.
		 * @param v_object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of DEBUG. 
	 	 * <listing version="3.0" >
	 	 * Log.debug( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		public static function debug( v_msg :String = '', v_object :Object = null ) :void
		{
			Log.trace( v_msg, v_object, LogLevels.DEBUG );
		}
		
		/**
		 * Logs the message and object through Log.trace with the LogLevels.INFO filter (level 0).
		 * @param v_msg		String message to trace out.
		 * @param v_object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of INFO. 
	 	 * <listing version="3.0" >
	 	 * Log.info( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		public static function info( v_msg :String = '', v_object :Object = null ) :void
		{
			Log.trace( v_msg, v_object, LogLevels.INFO );
		}
		
		/**
		 * Logs the message and object through Log.trace with the LogLevels.WARN filter (level 0).
		 * @param v_msg		String message to trace out.
		 * @param v_object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of WARN. 
	 	 * <listing version="3.0" >
	 	 * Log.warn( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		public static function warn( v_msg :String = '', v_object :Object = null ) :void
		{
			Log.trace( v_msg, v_object, LogLevels.WARN );
		}
		
		/**
		 * Logs the message and object through Log.trace with the LogLevels.ERROR filter (level 0).
		 * @param v_msg		String message to trace out.
		 * @param v_object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of ERROR. 
	 	 * <listing version="3.0" >
	 	 * Log.error( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		public static function error( v_msg :String = '', v_object :Object = null ) :void
		{
			Log.trace( v_msg, v_object, LogLevels.ERROR );
		}
		
		/**
		 * Logs the message and object through Log.trace with the LogLevels.FATAL filter (level 0).
		 * @param v_msg		String message to trace out.
		 * @param v_object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of FATAL. 
	 	 * <listing version="3.0" >
	 	 * Log.fatal( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		public static function fatal( v_msg :String = '', v_object :Object = null ) :void
		{
			Log.trace( v_msg, v_object, LogLevels.FATAL );
		}
		
		/**
		 * Logs the message and object through Log.trace with the LogLevels.CORE filter (level 0).
		 * @param v_msg		String message to trace out.
		 * @param v_object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of CORE. 
	 	 * <listing version="3.0" >
	 	 * Log.core( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		public static function core( v_msg :String = '', v_object :Object = null ) :void
		{
			Log.trace( v_msg, v_object, LogLevels.CORE );
		}
		
		/**
		 * @param	v_level The current level of a log object
		 * @return	True if this object's level is greater than the current debug level.
		 */
		public function hasClearance( v_level :String ) :Boolean
		{
			var loglev	:int = ( _dictionary[ _level ] == undefined ) ? ( _dictionary[ LogLevels.LOG ] + 1 ) : _dictionary[ _level ]; 
			return ( _dictionary[ v_level ] < loglev ) ? false : true;
		}	
/*
 * INTERNAL ACCESS
**************************************************************************************************** */

		/**
		 * Creates a dictionary object assigning name value pairs based on an index.
		 */
		private function setLevels() :void
		{
			_dictionary = new Dictionary();
			_dictionary[ LogLevels.CORE ]	= 0;
			_dictionary[ LogLevels.FATAL ]	= 1;
			_dictionary[ LogLevels.ERROR ]	= 2;
			_dictionary[ LogLevels.WARN ]	= 3;
			_dictionary[ LogLevels.INFO ] 	= 4;
			_dictionary[ LogLevels.DEBUG ]	= 5;
			_dictionary[ LogLevels.LOG ]	= 6;
		}
/*
 * EVENT DISPATCHER HOOKS
**************************************************************************************************** */
		
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
/*
 * SINGLETON ENFORCER
**************************************************************************************************** */
internal class SingletonEnforcer {}