
package com.factorylabs.orange.unit.core.signals
{
  import asunit4.async.addAsync;
  import flash.events.Event;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.signals.StageSignal;
  import com.factorylabs.orange.unit.helpers.MockCanvas;

  import flash.display.Stage;

  /**
   * Generate the test cases for the StageSignal class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 5, 2010
   */
  public class StageSignalTests
  {
    private var _canvas   :MockCanvas;
    private var _stage    :StageSignal;

    [Before(ui)]
    public function runBeforeEachTest() :void
    {
      _canvas = new MockCanvas();
      _stage = new StageSignal( _canvas.stage );
    }

    [After(ui)]
    public function runAfterEachTest() :void
    {
      _stage.removeAll();
    }

    [Test]
    public function stage_signal_should_have_reference_to_Stage() :void
    {
      assertTrue('_stage.stage is Stage', _stage.stage is Stage );
    }

    [Test]
    public function stage_is_listening_to_resize_event() :void
    {
      assertTrue( _stage.stage.hasEventListener( Event.RESIZE ) );
    }

    [Test]
    public function forceResize_dispatches_a_signal() :void
    {
      _stage.add( addAsync( onResize, 10 ) );
      _stage.forceResize();
    }

    private function onResize() :void
    {
      assertTrue( 'Captured a stage resize signal', true );
    }
  }
}

