
package com.factorylabs.orange.unit.core.display.stage
{
  import asunit.asserts.assertEquals;

  import com.factorylabs.orange.core.signals.StageSignal;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.fills.SolidFill;
  import com.factorylabs.orange.core.display.stage.StageBackground;
  import com.factorylabs.orange.unit.helpers.MockCanvas;

  /**
   * Generate the test cases for the StageBackground class.
   *
   * <p>The <code>StageBackground</code> class is pretty self contained and has been visually tested in the demo.</p>
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
  public class StageBackgroundTests
  {
    private var _background :StageBackground;
    private var _signal   :StageSignal;
    private var _canvas   :MockCanvas;

    [Before]
    public function runBeforeEachTest() :void
    {
      _canvas = new MockCanvas();
      _signal = new StageSignal( _canvas.stage );
      _background = new StageBackground( _canvas.stage, _signal, 1000, 500, new SolidFill( 0xFF00FF ), null );
    }

    [After]
    public function runAfterEachTest() :void
    {
      _background.dispose();
    }

    [Test]
    public function constructor() :void
    {
      assertTrue('_background is StageBackground', _background is StageBackground );
    }

    [Test(description='Tests both the getter and setter', tracker_id='')]
    public function fills_are_equal() :void
    {
      var sf :SolidFill = new SolidFill( 0x000000, 1 );
      _background.fill = sf;
      assertEquals( sf.color, SolidFill( _background.fill ).color );
    }
  }
}

