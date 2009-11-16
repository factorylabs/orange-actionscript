
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
	 * Summary
	 * 
	 * <p>Description</p>
	 * 
	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 16, 2009
	 */
	public class LoggerTests 
	{
		private var _logger	:Logger;
		
		[BeforeClass]
		public static function runBeforeEntireSuite():void
		{
			
		}
		
		[AfterClass]
		public static function runAfterEntireSuite():void
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
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onFault );
			_logger.trace( msg, obj, level );
		}
		
		[Test(async,timeout='100')]
		public function log() :void
		{
			var msg :String = '[LoggerTest].log()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.LOG };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onFault );
			_logger.log( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function debug() :void
		{
			var msg :String = '[LoggerTest].debug()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.DEBUG };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onFault );
			_logger.debug( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function info() :void
		{
			var msg :String = '[LoggerTest].info()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.INFO };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onFault );
			_logger.info( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function warn() :void
		{
			var msg :String = '[LoggerTest].warn()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.WARN };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onFault );
			_logger.warn( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function error() :void
		{
			var msg :String = '[LoggerTest].error()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.ERROR };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onFault );
			_logger.error( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function fatal() :void
		{
			var msg :String = '[LoggerTest].fatal()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.FATAL };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onFault );
			_logger.fatal( msg, obj );
		}
		
		[Test(async,timeout='100')]
		public function core() :void
		{
			var msg :String = '[LoggerTest].core()';
			var obj	:Object = { x: 100 };
			var pass :Object = { msg: msg, obj: obj, level: LogLevels.CORE };
			
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onFault );
			_logger.core( msg, obj );
		}
		
		private function onLoggerEvent( $e :LoggerEvent, $pass :Object ) :void
		{
			Assert.assertEquals( $e.message, $pass.msg );
			Assert.assertEquals( $e.object, $pass.obj );
			Assert.assertEquals( $e.level, $pass.level );
		}
		
		private function onFault( $pass :Object ) :void
		{
			Assert.fail( '[LoggerTest].onFault()' + String( $pass.msg ) );
		}
	}
}
