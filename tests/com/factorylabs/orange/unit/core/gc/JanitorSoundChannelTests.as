
package com.factorylabs.orange.unit.core.gc
{
  import asunit.asserts.assertNull;
  import asunit.asserts.assertNotNull;

  import com.factorylabs.orange.core.gc.JanitorSoundChannel;

  import flash.media.SoundChannel;

  /**
   * Generate the test cases for the JanitorSoundChannel class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Nov 22, 2009
   */
  public class JanitorSoundChannelTests
  {
    private var _soundChannel :SoundChannel;
    private var _janitor    :JanitorSoundChannel;

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

