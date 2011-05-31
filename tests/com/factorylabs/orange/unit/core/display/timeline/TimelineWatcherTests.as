
package com.factorylabs.orange.unit.core.display.timeline
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertNotNull;
  import asunit.asserts.assertSame;

  import asunit4.async.addAsync;

  import com.factorylabs.orange.core.display.timeline.TimelineWatcher;
  import com.factorylabs.orange.core.signals.BeaconSignal;

  import org.osflash.signals.Signal;

  import flash.display.MovieClip;

  /**
   * Generate the test cases for the TimelineWatcher class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 4, 2010
   */
  public class TimelineWatcherTests
  {
    private var _beacon   :BeaconSignal;
    private var _timeline :MovieClip;
    private var _watcher  :TimelineWatcher;
    private var _end    :Signal;

    [Before]
    public function runBeforeEachTest() :void
    {
      _timeline = new TwoFrame();
      _beacon = new BeaconSignal( new TwoFrame() );
      _watcher = new TimelineWatcher( _timeline, _beacon );
      _end = _watcher.endSignal;
    }

    [After]
    public function runAfterEachTest() :void
    {
      _end.removeAll();
      _watcher.dispose();
      _beacon.removeAll();
      _beacon = null;
      _timeline = null;
    }

    [Test]
    public function signals_should_exist() :void
    {
      assertNotNull( _end );
    }

    [Test]
    public function timeline_instances_should_be_the_same() :void
    {
      assertSame( _watcher.timeline, _timeline );
    }

    [Test]
    public function signal_should_dispatch_from_end_of_frame() :void
    {
      _end.add( addAsync( onTimeline, 100 ) );
      _timeline.gotoAndStop( 2 );
    }

    protected function onTimeline( $frameNum :int, $frameLabel :String ) :void
    {
      assertEquals( $frameNum, _timeline.currentFrame );
      assertNotNull( $frameLabel );
    }
  }
}

