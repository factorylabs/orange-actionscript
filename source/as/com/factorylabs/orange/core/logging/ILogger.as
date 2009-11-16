
package com.factorylabs.orange.core.logging 
{
	/**
	 * Basic necessities for capturing incoming messages and objects categorized by levels and a logger's indentifier. 
 	 * 
 	 * <p>Copyright 2004-2010 by Factory Design Labs</p>
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
	public interface ILogger
	{
		/**
		 * @return The name of the logger dispatching events.
		 */
		function get name() :String;
		function set name( $name :String ) :void;
		
		/**
		 * @return Whether this logger is suppressing it's events. 
		 */
		function get isSilent() :Boolean;
		function set isSilent( $isSilent :Boolean ) :void;
			
		/**
		 * @return The string equivalent of this class
		 */	
		function toString() :String;
		
		/**
		 * Handles the basic necessities of logging a message, all class methods are filtered through here.
		 * Precondition:	An optional message, optional object and optional level
		 * Postcondition:	A dispatched log event if there are listeners and the logger isn't silenced.
		 * @param $msg		String message to trace out.
		 * @param $object	Object to be inspected via the debugger.
		 * @param $level	LogLevels constant or custom notification filter.
		 * 
		 * @example The following code logs a command with a custom level. 
	 	 * <listing version="3.0" >
	 	 * var logger :Logger = new Logger();
	 	 * logger.trace( "[AbstractView].initialize()", _data, "MK" );
	 	 * </listing> 
		 */
		function trace( $msg :String = '', $object :Object = null, $level :String = null ) :void;
		
		/**
		 * Logs the message and object through trace with the LogLevels.LOG filter (level 6).
		 * @param $msg		String message to trace out.
		 * @param $object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of LOG. 
	 	 * <listing version="3.0" >
	 	 * var logger :Logger = new Logger();
	 	 * logger.level = LogLevels.LOG;
	 	 * logger.log( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		function log( $msg :String = '', $object :Object = null ) :void;
		
		/**
		 * Logs the message and object through trace with the LogLevels.DEBUG filter (level 5).
		 * @param $msg		String message to trace out.
		 * @param $object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of DEBUG. 
	 	 * <listing version="3.0" >
	 	 * var logger :Logger = new Logger();
	 	 * logger.level = LogLevels.DEBUG;
	 	 * logger..debug( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		function debug( $msg :String = '', $object :Object = null ) :void;
		
		/**
		 * Logs the message and object through trace with the LogLevels.INFO filter (level 4).
		 * @param $msg		String message to trace out.
		 * @param $object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of INFO. 
	 	 * <listing version="3.0" >
	 	 * var logger :Logger = new Logger();
	 	 * logger.level = LogLevels.INFO;
	 	 * logger.info( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		function info( $msg :String = '', $object :Object = null ) :void;
		
		/**
		 * Logs the message and object through trace with the LogLevels.WARN filter (level 3).
		 * @param $msg		String message to trace out.
		 * @param $object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of WARN. 
	 	 * <listing version="3.0" >
	 	 * var logger :Logger = new Logger();
	 	 * logger.level = LogLevels.WARN;
	 	 * logger.warn( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		function warn( $msg :String = '', $object :Object = null ) :void;
		
		/**
		 * Logs the message and object through trace with the LogLevels.ERROR filter (level 2).
		 * @param $msg		String message to trace out.
		 * @param $object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of ERROR. 
	 	 * <listing version="3.0" >
	 	 * var logger :Logger = new Logger();
	 	 * logger.level = LogLevels.ERROR;
	 	 * logger.error( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		function error( $msg :String = '', $object :Object = null ) :void;
		
		/**
		 * Logs the message and object through trace with the LogLevels.FATAL filter (level 1).
		 * @param $msg		String message to trace out.
		 * @param $object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of FATAL. 
	 	 * <listing version="3.0" >
	 	 * var logger :Logger = new Logger();
	 	 * logger.level = LogLevels.FATAL;
	 	 * logger.fatal( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		function fatal( $msg :String = '', $object :Object = null ) :void;
		
		/**
		 * Logs the message and object through Log.trace with the LogLevels.CORE filter (level 0).
		 * @param $msg		String message to trace out.
		 * @param $object	Object to be inspected via the debugger.
		 * 
		 * @example The following code logs a command with a level of CORE. 
	 	 * <listing version="3.0" >
	 	 * var logger :Logger = new Logger();
	 	 * logger.level = LogLevels.CORE;
	 	 * logger.core( "[AbstractView].initialize()", _data );
	 	 * </listing>
		 */
		function core( $msg :String = '', $object :Object = null ) :void;
	}
}
