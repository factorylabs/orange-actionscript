
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
	 * Generate the test cases for the JanitorManager class.
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
