
package tests.factorylabs.orange.core.gc 
{
	import tests.factorylabs.orange.helpers.MockBaseClass;
	import tests.factorylabs.orange.helpers.MockDisposableClass;

	import com.factorylabs.orange.core.gc.Janitor;
	import com.factorylabs.orange.core.logging.Logger;
	import com.factorylabs.orange.core.logging.LoggerEvent;

	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.object.nullValue;

	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Timer;

	/**
	 * Generate the test cases for the Janitor class.
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
	 * @version		1.0.0 :: Nov 19, 2009
	 */
	public class JanitorTests 
	{
		private var _janitor	:Janitor;
		private var _container	:Sprite;
		private var _logger		:Logger;
		private var _timer		:Timer;
		private var _mocker		:MockBaseClass;
		
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
			_container = new Sprite();
			_janitor = new Janitor( _container );
			_timer = new Timer( 500, 0 );
			_logger = new Logger();
			_mocker = new MockBaseClass();
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_janitor.cleanUp();
			_janitor = null;
			_logger = null;
			_container = null;
			_mocker = null;
			_timer.stop();
			_timer = null;
		}
		
		[Test(async,timeout='100')]
		public function addEventListener() :void
		{
			var msg :String = '[JanitorTests].addEventListener()';
			var obj	:Object = { x: 100 };
			var level :String = 'MK';
			var pass :Object = { msg: msg, obj: obj, level: level };
			
			_janitor.addEventListener( _logger, LoggerEvent.UPDATE, onFauxEventListener );
			assertThat( _janitor.listeners[ _logger ][ LoggerEvent.UPDATE ], notNullValue() );
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onLoggerEventFailed );
			_logger.trace( msg, obj, level );
		}
		
		[Test]
		public function removeEventListener() :void
		{
			_janitor.addEventListener( _logger, LoggerEvent.UPDATE, onFauxEventListener );
			assertThat( _janitor.listeners[ _logger ][ LoggerEvent.UPDATE ], notNullValue() );
			_janitor.removeEventListener( _logger, LoggerEvent.UPDATE, onFauxEventListener );
			assertThat( _janitor.listeners[ _logger ][ LoggerEvent.UPDATE ], nullValue() );
		}
		
		[Test]
		public function cleanUpEventListeners() :void
		{
			var sprite1 :Sprite = new Sprite();
			var sprite2 :Sprite = new Sprite();
			
			_janitor.addEventListener( sprite1, Event.COMPLETE, onFauxEventListener );
			_janitor.addEventListener( sprite2, Event.COMPLETE, onFauxEventListener );
			assertThat( _janitor.listeners[ sprite1 ][ Event.COMPLETE ], notNullValue() );
			assertThat( _janitor.listeners[ sprite2 ][ Event.COMPLETE ], notNullValue() );
			
			_janitor.cleanUpEventListeners();
			assertThat( _janitor.listeners, nullValue() );
		}
		
		[Test]
		public function cleanUpChildren() :void
		{
			var sprite1 :Sprite = new Sprite();
			var sprite2 :Sprite = new Sprite();
			_container.addChild( sprite1 );
			_container.addChild( sprite2 );
			
			assertThat( _container.numChildren, equalTo( 2 ) );
			_janitor.cleanUpChildren();
			assertThat( _container.numChildren, equalTo( 0 ) );
		}
		
		[Test]
		public function recurseCleanChildren() :void
		{
			var childspr	:Sprite = new Sprite();
			var childmc		:MovieClip = new MovieClip();
			var childbmp	:Bitmap = new Bitmap();
			var childldr	:Loader = new Loader();
			var gchildspr	:Sprite = new Sprite();
			var gchildmc	:MovieClip = new MovieClip();
			var gchildbmp	:Bitmap = new Bitmap();
			var gchildldr	:Loader = new Loader();
			var ggchildspr	:Sprite = new Sprite();
			
			// formatting denotes nesting of display objects..
			_container.addChild( childspr );
				childspr.addChild( gchildspr );
					gchildspr.addChild( ggchildspr );
				childspr.addChild( gchildmc );
				childspr.addChild( gchildbmp );
				childspr.addChild( gchildldr );
			_container.addChild( childmc );
			_container.addChild( childbmp );
			_container.addChild( childldr );
			
			assertThat( _container.numChildren, equalTo( 4 ) );
			assertThat( childspr.numChildren, equalTo( 4 ) );
			assertThat( childmc.numChildren, equalTo( 0 ) );
			assertThat( gchildspr.numChildren, equalTo( 1 ) );
			
			_janitor.recurseCleanChildren( _container );
			
			assertThat( _container.numChildren, equalTo( 0 ) );
			assertThat( childspr.numChildren, equalTo( 0 ) );
			assertThat( childmc.numChildren, equalTo( 0 ) );
			assertThat( gchildspr.numChildren, equalTo( 0 ) );
		}
		
		[Test]
		public function addConnection() :void
		{
			_janitor.addConnection( _mocker );
			assertThat( _janitor.connections, notNullValue() );
			assertThat( _janitor.connections[ _mocker ], notNullValue() );
		}
		
		[Test]
		public function removeConnection() :void
		{
			_janitor.addConnection( _mocker );
			assertThat( _janitor.connections, notNullValue() );
			
			_janitor.removeConnection( _mocker );
			assertThat( _janitor.connections[ _mocker ], nullValue() );
		}
		
		[Test]
		public function cleanUpConnections() :void
		{
			var mocker2 :MockBaseClass = new MockBaseClass();
			
			_janitor.addConnection( _mocker );
			_janitor.addConnection( mocker2 );
			assertThat( _janitor.connections, notNullValue() );
			assertThat( _janitor.connections[ _mocker ], notNullValue() );
			assertThat( _janitor.connections[ mocker2 ], notNullValue() );
			
			_janitor.cleanUpConnections();
			assertThat( _janitor.connections[ _mocker ], nullValue() );
			assertThat( _janitor.connections[ mocker2 ], nullValue() );
		}
		
		[Test]
		public function addDisposable() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			_janitor.addDisposable( disposer1 );
			assertThat( _janitor.disposables[ disposer1 ], notNullValue() );
		}
		
		[Test]
		public function addDisposables() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			var disposer2 :MockDisposableClass = new MockDisposableClass();
			var disposer3 :MockDisposableClass = new MockDisposableClass();
			_janitor.addDisposables( disposer1, disposer2, disposer3 );
			assertThat( _janitor.disposables[ disposer1 ], notNullValue() );
			assertThat( _janitor.disposables[ disposer2 ], notNullValue() );
			assertThat( _janitor.disposables[ disposer3 ], notNullValue() );
		}
		
		[Test(description='Only removes the IDisposable from access to the Janitor, does not call the dispose method')]
		public function removeDisposable() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			_janitor.addDisposable( disposer1 );
			assertThat( _janitor.disposables[ disposer1 ], notNullValue() );
			_janitor.removeDisposable( disposer1 );
			assertThat( _janitor.disposables[ disposer1 ], nullValue() );
			assertThat( disposer1.isDisposed, equalTo( false ) );
		}
		
		[Test(description='Removes the IDisposable and calls the dispose method')]
		public function cleanUpDisposable() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			_janitor.addDisposable( disposer1 );
			assertThat( _janitor.disposables[ disposer1 ], notNullValue() );
			_janitor.cleanUpDisposable( disposer1 );
			assertThat( _janitor.disposables[ disposer1 ], nullValue() );
			assertThat( disposer1.isDisposed, equalTo( true ) );
		}
		
		[Test]
		public function cleanUpDisposables() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			var disposer2 :MockDisposableClass = new MockDisposableClass();
			var disposer3 :MockDisposableClass = new MockDisposableClass();
			
			_janitor.addDisposables( disposer1, disposer2, disposer3 );
			assertThat( _janitor.disposables[ disposer1 ], notNullValue() );
			assertThat( _janitor.disposables[ disposer2 ], notNullValue() );
			assertThat( _janitor.disposables[ disposer3 ], notNullValue() );
			assertThat( disposer1.isDisposed, equalTo( false ) );
			assertThat( disposer2.isDisposed, equalTo( false ) );
			assertThat( disposer3.isDisposed, equalTo( false ) );
			
			_janitor.cleanUpDisposables();
			assertThat( _janitor.disposables[ disposer1 ], nullValue() );
			assertThat( _janitor.disposables[ disposer2 ], nullValue() );
			assertThat( _janitor.disposables[ disposer3 ], nullValue() );
			assertThat( disposer1.isDisposed, equalTo( true ) );
			assertThat( disposer2.isDisposed, equalTo( true ) );
			assertThat( disposer3.isDisposed, equalTo( true ) );
		}
		
		[Test]
		public function addTimer() :void
		{
			_janitor.addTimer( _timer );
			assertThat( _janitor.timers[ _timer ], notNullValue() );
		}
		
		[Test]
		public function removeTimer() :void
		{
			_janitor.addTimer( _timer );
			assertThat( _janitor.timers[ _timer ], notNullValue() );
			_janitor.removeTimer( _timer );
			assertThat( _janitor.timers[ _timer ], nullValue() );
		}
		
		[Test]
		public function cleanUpTimer() :void
		{
			_janitor.addTimer( _timer );
			assertThat( _janitor.timers[ _timer ], notNullValue() );
			_timer.start();	
			_janitor.cleanUpTimer( _timer );
			assertThat( _timer.running, equalTo( false ) );
			assertThat( _janitor.timers[ _timer ], nullValue() );
		}
		
		[Test]
		public function cleanUpTimers() :void
		{
			var timer2 :Timer = new Timer( 1000, 0 );
			
			_janitor.addTimer( _timer );
			_janitor.addTimer( timer2 );
			assertThat( _janitor.timers[ _timer ], notNullValue() );
			assertThat( _janitor.timers[ timer2 ], notNullValue() );
			_timer.start();
			timer2.start();
			_janitor.cleanUpTimers();
			assertThat( _timer.running, equalTo( false ) );
			assertThat( timer2.running, equalTo( false ) );
			assertThat( _janitor.timers[ _timer ], nullValue() );
			assertThat( _janitor.timers[ timer2 ], nullValue() );
		}
		
		private function onFauxEventListener( $e :LoggerEvent ) :void
		{
			assertThat( $e.message, equalTo( '[JanitorTests].addEventListener()' ) );
		}
		
		private function onLoggerEvent( $e :LoggerEvent, $pass :Object ) :void
		{
			Assert.assertEquals( $e.message, $pass[ 'msg' ] );
			Assert.assertEquals( $e.object, $pass[ 'obj' ] );
			Assert.assertEquals( $e.level, $pass[ 'level' ] );
		}
		
		private function onLoggerEventFailed( $pass :Object ) :void
		{
			Assert.fail( '[JanitorTests].onLoggerEventFailed()' + String( $pass[ 'msg' ] ) );
		}
	}
}