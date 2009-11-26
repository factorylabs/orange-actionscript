
package tests.factorylabs.orange.core.logging 
{
	import com.factorylabs.orange.core.logging.LogLevels;
	import com.factorylabs.orange.core.logging.Logger;
	import com.factorylabs.orange.core.logging.LoggerEvent;

	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	/**
	 * Generate the test cases for the Logger class.
	 *
	 * <hr />
	 * <p>Copyright 2004-2009 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p>
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
	 * @version		1.0.0 :: Nov 16, 2009
	 */
	public class LoggerTests 
	{
		private var _logger	:Logger;
		
		[BeforeClass]
		public static function runBeforeClass():void
		{
			
		}
		
		[AfterClass]
		public static function runAfterClass():void
		{
			
		}
		
		[Before]
		public function runBeforeEachTest():void
		{
			_logger = new Logger( '[Test Logger]' );			
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_logger = null;
		}
		
		[Test]
		public function isSilent() :void
		{
			assertThat( _logger.isSilent, equalTo( false ) );
			_logger.isSilent = true;
			assertThat( _logger.isSilent, equalTo( true ) );
		}
		
		[Test]
		public function name() :void
		{
			assertThat( _logger.name, equalTo( '[Test Logger]' ) );
			_logger.name = '[TEMP NAME Logger]';
			assertThat( _logger.name, equalTo( '[TEMP NAME Logger]' ) );
		}
		
		[Test(async,timeout='100')]
		public function trace() :void
		{
			var msg :String = '[LoggerTest].trace()';
			var obj	:Object = { x: 100 };
			var level :String = 'MK';
			var pass :Object = { msg: msg, obj: obj, level: level };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onLoggerEventFailed );
			_logger.trace( msg, obj, level );
		}
		
		[Test(async,timeout='100')]
		public function log() :void
		{
			var msg :String = '[LoggerTest].log()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.LOG };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onLoggerEventFailed );
			_logger.log( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function debug() :void
		{
			var msg :String = '[LoggerTest].debug()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.DEBUG };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onLoggerEventFailed );
			_logger.debug( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function info() :void
		{
			var msg :String = '[LoggerTest].info()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.INFO };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onLoggerEventFailed );
			_logger.info( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function warn() :void
		{
			var msg :String = '[LoggerTest].warn()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.WARN };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onLoggerEventFailed );
			_logger.warn( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function error() :void
		{
			var msg :String = '[LoggerTest].error()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.ERROR };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onLoggerEventFailed );
			_logger.error( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function fatal() :void
		{
			var msg :String = '[LoggerTest].fatal()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.FATAL };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onLoggerEventFailed );
			_logger.fatal( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function core() :void
		{
			var msg :String = '[LoggerTest].core()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.CORE };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onLoggerEventFailed );
			_logger.core( msg, obj );
		}
		
		private function onLoggerEvent( $e :LoggerEvent, $pass :Object ) :void
		{
			Assert.assertEquals( $e.message, $pass[ 'msg' ] );
			Assert.assertEquals( $e.object, $pass[ 'obj' ] );
			Assert.assertEquals( $e.level, $pass[ 'level' ] );
		}
		
		private function onLoggerEventFailed( $pass :Object ) :void
		{
			Assert.fail( '[LoggerTest].onLoggerEventFailed()' + String( $pass[ 'msg' ] ) );
		}
	}
}
