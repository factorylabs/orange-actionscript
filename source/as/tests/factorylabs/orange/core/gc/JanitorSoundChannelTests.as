
package tests.factorylabs.orange.core.gc 
{
	import com.factorylabs.orange.core.gc.JanitorSoundChannel;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.object.nullValue;

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
	public class JanitorSoundChannelTests 
	{
		private var _soundChannel	:SoundChannel;
		private var _janitor 		:JanitorSoundChannel;

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
			assertThat( _janitor.soundChannels[ _soundChannel ], notNullValue() );
		}
		
		[Test]
		public function removeSoundChannel() :void
		{
			_janitor.addSoundChannel( _soundChannel );
			assertThat( _janitor.soundChannels[ _soundChannel ], notNullValue() );
			
			_janitor.removeSoundChannel( _soundChannel );
			assertThat( _janitor.soundChannels[ _soundChannel ], nullValue() );
		}
		
		[Test]
		public function cleanUpSoundChannels() :void
		{
			var soundChannel2 :SoundChannel = new SoundChannel();
			
			_janitor.addSoundChannel( _soundChannel );
			_janitor.addSoundChannel( soundChannel2 );
			assertThat( _janitor.soundChannels[ _soundChannel ], notNullValue() );
			assertThat( _janitor.soundChannels[ soundChannel2 ], notNullValue() );
			
			_janitor.cleanUpSoundChannels();
			assertThat( _janitor.soundChannels[ _soundChannel ], nullValue() );
			assertThat( _janitor.soundChannels[ soundChannel2 ], nullValue() );
		}		
	}
}
