
package com.factorylabs.orange.core.logging
{
	import org.osflash.signals.Signal;

	/**
	 * Captures incoming messages and objects categorized by levels and a logger's identifier, broadcasts their log information out to observers.
	 * 
	 * <p>Acts as a facade for capturing logging calls in an application and allows the results to be easily rewired to specific services.
	 * Logger's should be injected at startup.</p> 
	 * 
	 * <hr />
	 * <p>Copyright 2004-2010 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p>
     * 
     * Permission is hereby granted, free of charge, to any person obtaining
     * a copy of this software and associated documentation files (the
     * "Software"), to deal in the Software without restriction, including
     * without limitation the rights to use, copy, modify, merge, publish,
     * distribute, sublicense, and/or sell copies of the Software, and to
     * permit persons to whom the Software is furnished to do so, subject to
     * the following conditions:<br /><br />
     * 
     * The above copyright notice and this permission notice shall be
     * included in all copies or substantial portions of the Software.<br /><br />
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
		implements ILogger
	{
		private var _name			:String;
		private var _isSilent		:Boolean;
		private  var _signal		:Signal;
		
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
		 * @inheritDoc
		 */
		public function get signal() :Signal { return _signal; }
		public function set signal( $signal :Signal ) :void
		{
			_signal = $signal;
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
			_signal = new Signal( String, Object, String, String );
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
			_signal.dispatch( $msg, $object, $level, _name );
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
	}
}