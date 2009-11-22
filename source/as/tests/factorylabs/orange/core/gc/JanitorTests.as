package tests.factorylabs.orange.core.gc 
{
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

	/**
	 * Summary
	 * 
	 * <p>Description</p>
	 * 
	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 19, 2009
	 */
	public class JanitorTests 
	{
		private var _janitor		:Janitor;
		private var _container		:Sprite;
		private var _logger			:Logger;
		
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
			_container = new Sprite();
			_janitor = new Janitor( _container );
			_logger = new Logger();
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_janitor.cleanUp();
			_janitor = null;
			_logger = null;
			_container = null;
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
			Async.handleEvent( this, _logger, LoggerEvent.UPDATE, onLoggerEvent, 100, pass, onFault );
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
		
		[Test(description="Only removes the IDisposable from access to the Janitor, does not call the dispose method")]
		public function removeDisposable() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			_janitor.addDisposable( disposer1 );
			assertThat( _janitor.disposables[ disposer1 ], notNullValue() );
			_janitor.removeDisposable( disposer1 );
			assertThat( _janitor.disposables[ disposer1 ], nullValue() );
			assertThat( disposer1.isDisposed, equalTo( false ) );
		}
		
		[Test(description="Removes the IDisposable and calls it's dispose method")]
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
		
		private function onFault( $pass :Object ) :void
		{
			Assert.fail( '[JanitorTests].onFault()' + String( $pass[ 'msg' ] ) );
		}
	}
}