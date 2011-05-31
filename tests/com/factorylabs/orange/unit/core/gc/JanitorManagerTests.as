
package com.factorylabs.orange.unit.core.gc
{
  import asunit.asserts.assertNotNull;
  import asunit.asserts.assertNull;

  import com.factorylabs.orange.core.gc.Janitor;
  import com.factorylabs.orange.core.gc.JanitorManager;
  import com.factorylabs.orange.core.gc.JanitorSoundChannel;
  import com.factorylabs.orange.unit.helpers.MockDisposableClass;

  import flash.display.Sprite;
  import flash.media.SoundChannel;

  /**
   * Generate the test cases for the JanitorManager class.
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
  public class JanitorManagerTests
  {
    private var _manager    :JanitorManager;
    private var _janitor    :Janitor;
    private var _jSound     :JanitorSoundChannel;

    private var _container    :Sprite;
    private var _disposer   :MockDisposableClass;
    private var _sprite     :Sprite;
    private var _soundChannel   :SoundChannel;

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
      assertNotNull( _manager.map.get( _janitor ) );
      assertNotNull( _manager.map.get( _jSound ) );
    }

    [Test]
    public function removeJanitor() :void
    {
      _manager.addJanitor( _janitor );
      _manager.addJanitor( _jSound );
      assertNotNull( _manager.map.get( _janitor ) );
      assertNotNull( _manager.map.get( _jSound ) );

      _manager.removeJanitor( _janitor );
      _manager.removeJanitor( _jSound );

      assertNull( _manager.map.get( _janitor ) );
      assertNull( _manager.map.get( _jSound ) );
    }

    [Test]
    public function cleanUpJanitor() :void
    {
      _manager.addJanitor( _janitor );
      assertNotNull( _manager.map.get( _janitor ) );
      _manager.cleanUpJanitor( _janitor );
      assertNull( _manager.map.get( _janitor ) );
    }

    [Test]
    public function cleanUp() :void
    {
      _manager.addJanitor( _janitor );
      _manager.addJanitor( _jSound );
      assertNotNull( _manager.map.get( _janitor ) );
      assertNotNull( _manager.map.get( _jSound ) );

      _manager.cleanUp();

      assertNull( _manager.map.get( _janitor ) );
      assertNull( _manager.map.get( _jSound ) );
    }
  }
}

