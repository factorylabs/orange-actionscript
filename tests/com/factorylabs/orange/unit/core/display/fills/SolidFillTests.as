
package com.factorylabs.orange.unit.core.display.fills
{
  import asunit.asserts.assertEquals;

  import com.factorylabs.orange.core.display.fills.SolidFill;

  /**
   * Generate the test cases for the SolidFill class.
   *
   * <p>The <code>begin()</code> and <code>end()</code> methods are not tested since they are only hooks into native <code>Graphics</code> methods.
   * Visual tests have been performed to ensure these are working.</p>
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Dec 3, 2009
   */
  public class SolidFillTests
  {
    private var _fill :SolidFill;

    [Before]
    public function runBeforeEachTest() :void
    {
      _fill = new SolidFill();
    }

    [After]
    public function runAfterEachTest() :void
    {
      _fill = null;
    }

    [Test]
    public function constructor() :void
    {
      assertEquals( _fill.color, 0xff00ff );
      assertEquals( _fill.alpha, 1 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function color() :void
    {
      _fill.color = 0x000000;
      assertEquals( _fill.color, 0x000000 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function alpha() :void
    {
      _fill.alpha = .5;
      assertEquals( _fill.alpha, .5 );
    }
  }
}

