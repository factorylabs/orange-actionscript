
package com.factorylabs.orange.unit.core.net
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertNotNull;
  import asunit.asserts.assertNull;
  import asunit.asserts.assertSame;
  import asunit.asserts.assertTrue;
  import asunit.asserts.fail;

  import asunit4.async.addAsync;

  import com.factorylabs.orange.core.net.FLoader;
  import com.factorylabs.orange.core.net.LoadItem;

  import org.osflash.signals.Signal;

  import flash.display.DisplayObject;
  import flash.media.Sound;
  import flash.net.URLLoaderDataFormat;
  import flash.net.URLRequest;
  import flash.system.LoaderContext;

  /**
   * Generate the test cases for the LoadItem class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    grantdavis
   * @version   1.0.0 :: Feb 17, 2010
   */
  public class LoadItemTests
  {
    private var _imageUrl       :String = 'http://betas.factorylabs.com/Interactive/tests/image.gif';
    private var _textUrl      :String = 'http://betas.factorylabs.com/crossdomain.xml';
    private var _soundUrl       :String = 'http://betas.factorylabs.com/Interactive/tests/sound.mp3';
    private var _brokenUrl      :String = 'http://betas.factorylabs.com/file-does-not-exist.jpg';
    private var _loader       :LoadItem;
    private var _stateSignal    :Signal;
    private var _connectingSignal :Signal;
    private var _completeSignal   :Signal;
    private var _pauseSignal    :Signal;
    private var _openSignal     :Signal;
    private var _initSignal     :Signal;
    private var _progressSignal   :Signal;
    private var _errorSignal    :Signal;
    private var _idleSignal     :Signal;

    [Before]
    public function runBeforeEachTest() :void
    {
      _loader = new LoadItem( new URLRequest( _imageUrl ));
      createSignalReferences();
    }
    private function createSignalReferences() :void
    {
      _stateSignal    = _loader.stateSignal;
      _completeSignal   = _loader.completeSignal;
      _connectingSignal   = _loader.connectingSignal;
      _pauseSignal    = _loader.pausedSignal;
      _openSignal     = _loader.openSignal;
      _initSignal     = _loader.initSignal;
      _progressSignal   = _loader.progressSignal;
      _errorSignal    = _loader.errorSignal;
      _idleSignal     = _loader.idleSignal;
    }


    [After]
    public function runAfterEachTest() :void
    {
      _loader.dispose();
      _loader = null;
    }


    [Test]
    public function constructor() :void
    {
      assertTrue( '_property is LoadItem', _loader is LoadItem );
    }


    [Test]
    public function should_have_created_references_to_signals() :void
    {
      assertSame( _stateSignal,     _loader.stateSignal );
      assertSame( _completeSignal,  _loader.completeSignal );
      assertSame( _connectingSignal,  _loader.connectingSignal );
      assertSame( _pauseSignal,     _loader.pausedSignal );
      assertSame( _openSignal,    _loader.openSignal );
      assertSame( _initSignal,    _loader.initSignal );
      assertSame( _progressSignal,  _loader.progressSignal );
      assertSame( _errorSignal,     _loader.errorSignal );
      assertSame( _idleSignal,    _loader.idleSignal );
    }


    [Test]
    public function should_have_request_with_url() :void
    {
      assertEquals( _loader.request.url, _imageUrl );
    }


    [Test(async)]
    public function should_load_file_with_success() :void
    {
      _connectingSignal.add( addAsync( handleConnectingState, 500 ));
      _openSignal.add( addAsync( handleOpenState, 500 ));
      _progressSignal.add( addAsync( handleLoadProgress, 500 ));
      _completeSignal.add( addAsync( handleImageFileSuccess, 1000 ));
      _errorSignal.add( handleUnexpectedError );
      _loader.start();
    }
    private function handleConnectingState( $loader : LoadItem ) :void
    {
      assertEquals( LoadItem.STATE_CONNECTING, $loader.state );
    }
    private function handleOpenState( $loader : LoadItem ) :void
    {
      assertEquals( LoadItem.STATE_OPEN, $loader.state );
    }
    private function handleLoadProgress( $loader : LoadItem, $bytesLoaded : uint, $bytesTotal : uint ) :void
    {
      assertEquals( $bytesLoaded / $bytesTotal, $loader.loader.bytesLoaded / $loader.loader.bytesTotal );
      assertEquals( $loader.loader.bytesLoaded / $loader.loader.bytesTotal, $loader.percentLoaded );
      assertEquals( $loader.loader.bytesTotal - $loader.loader.bytesLoaded, $loader.bytesRemaining );
    }
    private function handleImageFileSuccess( $loader : LoadItem ) :void
    {
      assertTrue(( $loader.displayContent is DisplayObject ));
      assertNotNull( $loader.displayContent );
      assertEquals( LoadItem.STATE_COMPLETE, $loader.state );
      assertTrue(( $loader.bandwidth > 0 ));
      assertTrue(( $loader.latency > 0 ));
    }


    [Test(async)]
    public function should_load_text_file_with_success() :void
    {
      // kill initial loader
      _loader.dispose();
      // rebuild with new load type
      _loader = new LoadItem( new URLRequest( _textUrl ), LoadItem.TYPE_TEXT );
      createSignalReferences();
      _completeSignal.add( addAsync( handleTextFileSucces, 1000 ));
      _errorSignal.add( handleUnexpectedError );
      _loader.start();
    }
    private function handleTextFileSucces( $loader : LoadItem ) :void
    {
      assertTrue(( $loader.textContent is String ));
      assertNotNull( $loader.textContent );
      assertTrue(( $loader.bandwidth > 0 ));
      assertTrue(( $loader.latency > 0 ));
    }

    private function handleUnexpectedError( $loader : LoadItem, $errorText : String ) :void
    {
      fail( $errorText );
    }


    [Test(async)]
    public function should_load_sound_file_with_success() :void
    {
      // kill initial loader
      _loader.dispose();
      // rebuild with new load type
      _loader = new LoadItem( new URLRequest( _soundUrl ), LoadItem.TYPE_SOUND );
      createSignalReferences();
      _completeSignal.add( addAsync( handleSoundFileSucces, 5000 ));
      _errorSignal.add( handleUnexpectedError );
      _loader.start();
    }
    private function handleSoundFileSucces( $loader : LoadItem ) :void
    {
      assertTrue(( $loader.soundContent is Sound ));
      assertTrue(( $loader.soundContent.length > 0 ));
      assertEquals( $loader.soundContent.bytesLoaded, $loader.bytesLoaded );
      assertEquals( $loader.soundContent.bytesTotal, $loader.bytesTotal );
    }


    [Test(async)]
    public function should_load_with_custom_loader() :void
    {
      // kill initial loader
      _loader.dispose();
      // rebuild with new load type
      _loader = new LoadItem( new URLRequest( _imageUrl ), LoadItem.TYPE_DISPLAY, new FLoader());
      createSignalReferences();
      _completeSignal.add( addAsync( handleImageFileSuccess, 1000 ));
      _errorSignal.add( handleUnexpectedError );
      _loader.start();
    }


    [Test(async)]
    public function should_pause_load_and_resume() :void
    {
      _loader.start();
      _pauseSignal.add( addAsync( handlePauseState, 100 ) );
      _completeSignal.add( addAsync( handleImageFileSuccess, 500 ));
      _loader.pause();
    }
    private function handlePauseState( $loader : LoadItem ) :void
    {
      assertTrue( $loader.paused );
      assertEquals( LoadItem.STATE_PAUSED, $loader.state );
      _loader.start();
    }


    [Test(async)]
    public function should_error_with_bad_url() :void
    {
      _errorSignal.add( addAsync( handleFileError, 500 ));
      _loader.context = new LoaderContext( false );
      _loader.request.url = _brokenUrl;
      _loader.start();
    }
    private function handleFileError( $loader : LoadItem, $error : String ) :void
    {
      assertNotNull( $error );
      assertEquals( LoadItem.STATE_ERROR, $loader.state );
    }

    [Test(async)]
    public function should_return_binary_content_when_data_format_is_set() :void
    {
      // kill initial loader
      _loader.dispose();
      // rebuild with new load type
      _loader = new LoadItem( new URLRequest( _textUrl ), LoadItem.TYPE_TEXT );
      createSignalReferences();
      _completeSignal.add( addAsync( handleCompleteAndCheckBinaryContent, 1000 ));
      _loader.dataFormat = URLLoaderDataFormat.BINARY;
      _loader.start();
    }
    private function handleCompleteAndCheckBinaryContent( $loader : LoadItem ) :void
    {
      assertNotNull( _loader.binaryContent );
    }


    [Test(async)]
    public function should_stop_load() :void
    {
      _idleSignal.add( addAsync( handleIdleState, 100 ));
      _completeSignal.add( handleCompleteAndFail );
      _loader.start();
      _loader.stop();
      assertEquals( _loader.state, LoadItem.STATE_IDLE );
    }
    private function handleIdleState( $loader : LoadItem ) :void
    {
      assertEquals( _loader.state, LoadItem.STATE_IDLE );
    }
    private function handleCompleteAndFail( $loader : LoadItem ) :void
    {
      fail( 'complete method should not have fired.' );
    }

    [Test]
    public function should_dispose_and_remove_references() :void
    {
      _loader.dispose();
      assertNull( _loader.stateSignal );
      assertNull( _loader.completeSignal );
      assertNull( _loader.connectingSignal );
      assertNull( _loader.pausedSignal );
      assertNull( _loader.openSignal );
      assertNull( _loader.initSignal );
      assertNull( _loader.progressSignal );
      assertNull( _loader.errorSignal );
      _loader = new LoadItem( new URLRequest( _imageUrl ));
    }
  }
}

