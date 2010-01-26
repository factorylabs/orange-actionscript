
package com.factorylabs.orange.unit.core.gc 
{
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertFalse;
	import asunit.asserts.assertNotNull;
	import asunit.asserts.assertNull;
	import asunit.asserts.assertTrue;

	import asunit4.async.addAsync;

	import com.factorylabs.orange.core.gc.Janitor;
	import com.factorylabs.orange.unit.helpers.MockBaseClass;
	import com.factorylabs.orange.unit.helpers.MockDisposableClass;

	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Timer;

	/**
	 * Generate the test cases for the Janitor class.
	 *
	 * <hr />
	 * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
	 * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
 	 * 
 	 * <p>Permission is hereby granted to use, modify, and distribute this file 
 	 * in accordance with the terms of the license agreement accompanying it.</p>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 19, 2009
	 */
	public class JanitorTests 
	{
		private var _janitor	:Janitor;
		private var _container	:Sprite;
		private var _timer		:Timer;
		private var _mocker		:MockBaseClass;
		
		[Before]
		public function runBeforeEachTest():void
		{
			_container = new Sprite();
			_janitor = new Janitor( _container );
			_timer = new Timer( 500, 0 );
			_mocker = new MockBaseClass();
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_janitor.cleanUp();
			_janitor = null;
			_container = null;
			_mocker = null;
			_timer.stop();
			_timer = null;
		}
		
		[Test(async)]
		public function addEventListener() :void
		{
			var dispatcher :IEventDispatcher = new EventDispatcher();
			var handler :Function = addAsync( onEventHandler, 10 );
			
			_janitor.addEventListener( dispatcher, Event.CHANGE, handler );
			assertNotNull( _janitor.listeners[ dispatcher ][ Event.CHANGE ] );
			dispatcher.dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		[Test]
		public function removeEventListener() :void
		{
			var dispatcher :IEventDispatcher = new EventDispatcher();
			var handler :Function = addAsync( onEventHandler, 10 );
			
			_janitor.addEventListener( dispatcher, Event.CHANGE, handler );
			assertNotNull( _janitor.listeners[ dispatcher ][ Event.CHANGE ] );
			dispatcher.dispatchEvent( new Event( Event.CHANGE ) );
			
			_janitor.removeEventListener( dispatcher, Event.CHANGE, handler );
			assertNull( _janitor.listeners[ dispatcher ][ Event.CHANGE ] );
		}
		
		[Test]
		public function cleanUpEventListeners() :void
		{
			var sprite1 :Sprite = new Sprite();
			var sprite2 :Sprite = new Sprite();
			
			_janitor.addEventListener( sprite1, Event.COMPLETE, onEventHandler );
			_janitor.addEventListener( sprite2, Event.COMPLETE, onEventHandler );
			
			assertNotNull( _janitor.listeners[ sprite1 ][ Event.COMPLETE ] );
			assertNotNull( _janitor.listeners[ sprite2 ][ Event.COMPLETE ] );
			
			_janitor.cleanUpEventListeners();
			assertNull( _janitor.listeners );
		}
		
		[Test]
		public function cleanUpChildren() :void
		{
			var sprite1 :Sprite = new Sprite();
			var sprite2 :Sprite = new Sprite();
			_container.addChild( sprite1 );
			_container.addChild( sprite2 );
			
			assertEquals( _container.numChildren, 2 );
			_janitor.cleanUpChildren();
			assertEquals( _container.numChildren, 0 );
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
			
			assertEquals( _container.numChildren, 4 );
			assertEquals( childspr.numChildren, 4 );
			assertEquals( childmc.numChildren, 0 );
			assertEquals( gchildspr.numChildren, 1 );

			_janitor.recurseCleanChildren( _container );
			
			assertEquals( _container.numChildren, 0 );
			assertEquals( childspr.numChildren, 0 );
			assertEquals( childmc.numChildren, 0 );
			assertEquals( gchildspr.numChildren, 0 );
		}
		
		[Test]
		public function addConnection() :void
		{
			_janitor.addConnection( _mocker );
			assertNotNull( _janitor.connections );
			assertNotNull( _janitor.connections[ _mocker ] );
		}
		
		[Test]
		public function removeConnection() :void
		{
			_janitor.addConnection( _mocker );
			assertNotNull( _janitor.connections );
			
			_janitor.removeConnection( _mocker );
			assertNull( _janitor.connections[ _mocker ] );
		}
		
		[Test]
		public function cleanUpConnections() :void
		{
			var mocker2 :MockBaseClass = new MockBaseClass();
			
			_janitor.addConnection( _mocker );
			_janitor.addConnection( mocker2 );
			assertNotNull( _janitor.connections );
			assertNotNull( _janitor.connections[ _mocker ] );
			assertNotNull( _janitor.connections[ mocker2 ] );
			
			_janitor.cleanUpConnections();
			assertNull( _janitor.connections[ _mocker ] );
			assertNull( _janitor.connections[ mocker2 ] );
		}
		
		[Test]
		public function addDisposable() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			_janitor.addDisposable( disposer1 );
			assertNotNull( _janitor.disposables[ disposer1 ] );
		}
		
		[Test]
		public function addDisposables() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			var disposer2 :MockDisposableClass = new MockDisposableClass();
			var disposer3 :MockDisposableClass = new MockDisposableClass();
			_janitor.addDisposables( disposer1, disposer2, disposer3 );
			assertNotNull( _janitor.disposables[ disposer1 ] );
			assertNotNull( _janitor.disposables[ disposer2 ] );
			assertNotNull( _janitor.disposables[ disposer3 ] );
		}
		
		[Test(description='Only removes the IDisposable from access to the Janitor, does not call the dispose method')]
		public function removeDisposable() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			_janitor.addDisposable( disposer1 );
			assertNotNull( _janitor.disposables[ disposer1 ] );
			_janitor.removeDisposable( disposer1 );
			assertNull( _janitor.disposables[ disposer1 ] );
			assertFalse( disposer1.isDisposed );
		}
		
		[Test(description='Removes the IDisposable and calls the dispose method')]
		public function cleanUpDisposable() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			_janitor.addDisposable( disposer1 );
			assertNotNull( _janitor.disposables[ disposer1 ] );
			_janitor.cleanUpDisposable( disposer1 );
			assertNull( _janitor.disposables[ disposer1 ] );
			assertTrue( disposer1.isDisposed );
		}
		
		[Test]
		public function cleanUpDisposables() :void
		{
			var disposer1 :MockDisposableClass = new MockDisposableClass();
			var disposer2 :MockDisposableClass = new MockDisposableClass();
			var disposer3 :MockDisposableClass = new MockDisposableClass();
			
			_janitor.addDisposables( disposer1, disposer2, disposer3 );
			assertNotNull( _janitor.disposables[ disposer1 ] );
			assertNotNull( _janitor.disposables[ disposer2 ] );
			assertNotNull( _janitor.disposables[ disposer3 ] );
			assertFalse( disposer1.isDisposed );
			assertFalse( disposer2.isDisposed );
			assertFalse( disposer3.isDisposed );
			
			_janitor.cleanUpDisposables();
			assertNull( _janitor.disposables[ disposer1 ] );
			assertNull( _janitor.disposables[ disposer2 ] );
			assertNull( _janitor.disposables[ disposer3 ] );
			assertTrue( disposer1.isDisposed );
			assertTrue( disposer2.isDisposed );
			assertTrue( disposer3.isDisposed );
		}
		
		[Test]
		public function addTimer() :void
		{
			_janitor.addTimer( _timer );
			assertNotNull( _janitor.timers[ _timer ] );
		}
		
		[Test]
		public function removeTimer() :void
		{
			_janitor.addTimer( _timer );
			assertNotNull( _janitor.timers[ _timer ] );
			_janitor.removeTimer( _timer );
			assertNull( _janitor.timers[ _timer ] );
		}
		
		[Test]
		public function cleanUpTimer() :void
		{
			_janitor.addTimer( _timer );
			assertNotNull( _janitor.timers[ _timer ] );
			_timer.start();	
			_janitor.cleanUpTimer( _timer );
			assertFalse( _timer.running );
			assertNull( _janitor.timers[ _timer ] );
		}
		
		[Test]
		public function cleanUpTimers() :void
		{
			var timer2 :Timer = new Timer( 1000, 0 );
			
			_janitor.addTimer( _timer );
			_janitor.addTimer( timer2 );
			assertNotNull( _janitor.timers[ _timer ] );
			assertNotNull( _janitor.timers[ timer2 ] );
			_timer.start();
			timer2.start();
			_janitor.cleanUpTimers();
			assertFalse( _timer.running );
			assertFalse( timer2.running );
			assertNull( _janitor.timers[ _timer ] );
			assertNull( _janitor.timers[ timer2 ] );
		}
		
		private function onEventHandler( $e :Event ) :void
		{
			assertEquals( Event.CHANGE, $e.type );
		}
	}
}