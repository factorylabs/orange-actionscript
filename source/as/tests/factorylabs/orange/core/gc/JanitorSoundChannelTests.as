
package tests.factorylabs.orange.core.gc 
{
	import asunit.asserts.assertNull;
	import asunit.asserts.assertNotNull;

	import com.factorylabs.orange.core.gc.JanitorSoundChannel;

	import flash.media.SoundChannel;

	/**
	 * Generate the test cases for the JanitorSoundChannel class.
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
	 * @version		1.0.0 :: Nov 22, 2009
	 */
	public class JanitorSoundChannelTests 
	{
		private var _soundChannel	:SoundChannel;
		private var _janitor 		:JanitorSoundChannel;
		
		[Before]
		public function runBeforeEachTest():void
		{
			_janitor = new JanitorSoundChannel( this );
			_soundChannel = new SoundChannel();
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_janitor.cleanUp();
			_janitor = null;
			_soundChannel = null;
		}
		
		[Test]
		public function addSoundChannel() :void
		{
			_janitor.addSoundChannel( _soundChannel );
			assertNotNull( _janitor.soundChannels[ _soundChannel ] );
		}
		
		[Test]
		public function removeSoundChannel() :void
		{
			_janitor.addSoundChannel( _soundChannel );
			assertNotNull( _janitor.soundChannels[ _soundChannel ] );
			
			_janitor.removeSoundChannel( _soundChannel );
			assertNull( _janitor.soundChannels[ _soundChannel ] );
		}
		
		[Test]
		public function cleanUpSoundChannels() :void
		{
			var soundChannel2 :SoundChannel = new SoundChannel();
			
			_janitor.addSoundChannel( _soundChannel );
			_janitor.addSoundChannel( soundChannel2 );
			assertNotNull( _janitor.soundChannels[ _soundChannel ] );
			assertNotNull( _janitor.soundChannels[ soundChannel2 ] );
			
			_janitor.cleanUpSoundChannels();
			assertNull( _janitor.soundChannels[ _soundChannel ] );
			assertNull( _janitor.soundChannels[ soundChannel2 ] );
		}		
	}
}
