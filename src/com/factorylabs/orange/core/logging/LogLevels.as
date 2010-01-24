
package com.factorylabs.orange.core.logging
{
	/**
	 * LogLevels is a static class for level properties accessed by a logger instance.
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
	 * @version		1.0.0 :: Apr 21, 2008
	 */
	public class LogLevels 
	{
		/**
		 * Filter level of <code>Log</code> and custom levels get through.
		 */		
		public static const LOG		:String = 'LOG';

		/**
		 * Filter level of <code>Debug</code>, <code>Log</code> and custom levels get through.
		 */		
		public static const DEBUG	:String = 'DEBUG';

		/**
		 * Filter level of <code>Info</code>, <code>Debug</code>, <code>Log</code> and custom levels get through.
		 */
		public static const INFO	:String = 'INFO';

		/**
		 * Filter level of <code>Warn</code>, <code>Info</code>, <code>Debug</code>, <code>Log</code> and custom levels get through.
		 */
		public static const WARN	:String = 'WARN';

		/**
		 * Filter level of <code>Error</code>, <code>Warn</code>, <code>Info</code>, <code>Debug</code>, <code>Log</code> and custom levels get through.
		 */		
		public static const ERROR	:String = 'ERROR';

	 	/**
		 * Filter level of <code>Fatal</code>, <code>Error</code>, <code>Warn</code>, <code>Info</code>, <code>Debug</code>, <code>Log</code> and custom levels get through.
		 */
	 	public static const FATAL	:String = 'FATAL';
	 	
	 	/**
		 * Filter level of <code>Core</code>, <code>Fatal</code>, <code>Error</code>, <code>Warn</code>, <code>Info</code>, <code>Debug</code>, <code>Log</code> and custom levels get through.
		 */
	 	public static const CORE	:String = 'CORE';
	 	
	 	/**
	 	 * Special Filter for popping JavaScript Alerts. Always comes through. 
	 	 * 
	 	 * @example The following code pops a JavaScript Alert window. 
	 	 * <listing version="3.0" >
	 	 * _logger.trace( "[AbstractView].initialize()", _data, LogLevels.JSALERT );
	 	 * </listing> 
	 	 */
	 	public static const JSALERT	:String = 'JSALERT';
	
		/**
		 * Empty constructor for a class containing only static constants
		 */
		public function LogLevels(){}
		
		/**
		 * @return	The string equivalent of this class.
		 */
		public function toString() :String 
		{
			return 'com.factorylabs.orange.core.logger.LogLevels';
		}
	}
}