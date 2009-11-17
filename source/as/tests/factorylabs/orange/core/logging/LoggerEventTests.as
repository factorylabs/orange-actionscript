
package tests.factorylabs.orange.core.logging 
{
	import com.factorylabs.orange.core.logging.LoggerEvent;

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
	public class LoggerEventTests 
	{
		private var _event :LoggerEvent;
		
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
			_event = new LoggerEvent( LoggerEvent.UPDATE, 'message', { x: 100 }, 'MK', '[Test Logger]' );			
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_event = null;
		}
		
		[Test]
		public function message() :void
		{
			assertThat( _event.message, equalTo('message' ) );
		}
		
		[Test]
		public function object() :void
		{
			var o :Object = { x: 100 };
			assertThat( _event.object.x, equalTo( o.x ) );
		}
		
		[Test]
		public function level() :void
		{
			assertThat( _event.level, equalTo( 'MK' ) );
		}
		
		[Test]
		public function name() :void
		{
			assertThat( _event.name, equalTo( '[Test Logger]' ) );
		}
		
		[Test]
		public function clone() :void
		{
			var e :LoggerEvent = LoggerEvent( _event.clone() );
			assertThat( e.message, equalTo( _event.message ) );
			assertThat( e.object.x, equalTo( _event.object.x ) );
			assertThat( e.level, equalTo( _event.level ) );
			assertThat( e.name, equalTo( _event.name ) );
		}
	}
}
