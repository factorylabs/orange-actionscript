
package com.factorylabs.orange.unit.runners
{
  import com.factorylabs.orange.unit.asunit.ui.FMinimalRunnerUI;
  import com.factorylabs.orange.unit.core.net.NetTestSuite;
  import com.factorylabs.orange.unit.helpers.MockCanvas;

  /**
   * Runs the test suite associated with the <code>orange.core</code> package.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Jan 20, 2010
   */
  public class FNetTestRunner
    extends FMinimalRunnerUI
  {
    public function FNetTestRunner()
    {
      MockCanvas.canvas = stage;  // this is dirty but at least it gives the MockCanvas a reference to the stage for testing visual components.
      run( NetTestSuite );
    }
  }
}

