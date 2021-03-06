
package com.factorylabs.orange.unit.core.net
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import asunit4.async.addAsync;

  import com.factorylabs.orange.core.net.BandwidthDetection;

  import org.osflash.signals.Signal;

  /**
   * Generate the test cases for the BandwidthDetection class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 12, 2010
   */
  public class BandwidthDetectionTests
  {
    private var _url :String = 'http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif';
    private var _detector :BandwidthDetection;
    private var _signal   :Signal;

    [Before]
    public function runBeforeEachTest() :void
    {
      _detector = new BandwidthDetection( _url );
      _signal = _detector.signal;
    }

    [After]
    public function runAfterEachTest() :void
    {
      _detector.dispose();
      _detector = null;
    }

    [Test]
    public function constructor() :void
    {
      assertTrue( '_detector is BandwidthDetection', _detector is BandwidthDetection );
    }

    [Test]
    public function should_have_created_a_reference_to_a_signal() :void
    {
      assertEquals( _signal, _detector.signal );
    }

    [Test]
    public function should_be_able_to_set_and_get_url() :void
    {
      _detector.url = 'http://www.factorylabs.com/404.jpg';
      assertEquals( _detector.url, 'http://www.factorylabs.com/404.jpg' );
    }

    [Test(async)]
    public function should_load_with_success() :void
    {
      _signal.add( addAsync( onSignal, 1000 ) );
      _detector.load();
    }

    private function onSignal( $type :String, $result :Number ) :void
    {
      assertEquals( $type, _detector.COMPLETE );
      assertFalse( isNaN( $result ) );
    }
  }
}

