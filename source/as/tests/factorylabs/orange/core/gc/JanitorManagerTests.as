
package tests.factorylabs.orange.core.gc 
{
	import tests.factorylabs.orange.helpers.MockDisposableClass;

	import com.factorylabs.orange.core.gc.Janitor;
	import com.factorylabs.orange.core.gc.JanitorManager;
	import com.factorylabs.orange.core.gc.JanitorSoundChannel;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.object.nullValue;

	import flash.display.Sprite;
	import flash.media.SoundChannel;

	/**
	 * Summary
	 * 
	 * <p>Description</p>
	 * 
	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 22, 2009
	 */
	public class JanitorManagerTests 
	{
		private var _manager		:JanitorManager;
		private var _janitor		:Janitor;
		private var _jSound			:JanitorSoundChannel;
		
		private var _container		:Sprite;
		private var _disposer		:MockDisposableClass;
		private var _sprite			:Sprite;
		private var _soundChannel 	:SoundChannel;

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
			
			_manager = new JanitorManager();
			_janitor = new Janitor( _container );
			_jSound = new JanitorSoundChannel( this );
			
			_disposer = new MockDisposableClass();
			_sprite = new Sprite();
			
			_container.addChild( _sprite );
			_janitor.addDisposable( _disposer );
			
			_soundChannel = new SoundChannel();
			_jSound.addSoundChannel( _soundChannel );
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_janitor.cleanUp();
			_jSound.cleanUp();
		}
		
		[Test]
		public function addJanitor() :void
		{
			_manager.addJanitor( _janitor );
			_manager.addJanitor( _jSound );
			assertThat( _manager.map.get( _janitor ), notNullValue() );
			assertThat( _manager.map.get( _jSound ), notNullValue() );
		}
		
		[Test]
		public function removeJanitor() :void
		{
			_manager.addJanitor( _janitor );
			_manager.addJanitor( _jSound );
			assertThat( _manager.map.get( _janitor ), notNullValue() );
			assertThat( _manager.map.get( _jSound ), notNullValue() );
			
			_manager.removeJanitor( _janitor );
			_manager.removeJanitor( _jSound );
			
			assertThat( _manager.map.get( _janitor ), nullValue() );
			assertThat( _manager.map.get( _jSound ), nullValue() );
		}
		
		[Test]
		public function cleanUpJanitor() :void
		{
			_manager.addJanitor( _janitor );
			assertThat( _manager.map.get( _janitor ), notNullValue() );
			_manager.cleanUpJanitor( _janitor );
			assertThat( _manager.map.get( _janitor ), nullValue() );
		}
		
		[Test]
		public function cleanUp() :void
		{
			_manager.addJanitor( _janitor );
			_manager.addJanitor( _jSound );
			assertThat( _manager.map.get( _janitor ), notNullValue() );
			assertThat( _manager.map.get( _jSound ), notNullValue() );
			
			_manager.cleanUp();
			
			assertThat( _manager.map.get( _janitor ), nullValue() );
			assertThat( _manager.map.get( _jSound ), nullValue() );
		}
	}
}
