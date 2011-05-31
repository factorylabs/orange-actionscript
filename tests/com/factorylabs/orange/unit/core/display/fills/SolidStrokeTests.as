
package com.factorylabs.orange.unit.core.display.fills
{
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertEquals;

  import com.factorylabs.orange.core.display.fills.SolidStroke;

  import flash.display.CapsStyle;
  import flash.display.JointStyle;
  import flash.display.LineScaleMode;

  /**
   * Generate the test cases for the SolidStroke class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Jan 11, 2010
   */
  public class SolidStrokeTests
  {
    private var _stroke   :SolidStroke;

    [Before]
    public function runBeforeEachTest() :void
    {
      _stroke = new SolidStroke( 0xff00ff, 1, 3, true, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.MITER, 3 );
    }

    [After]
    public function runAfterEachTest() :void
    {
      _stroke = null;
    }

    [Test]
    public function constructor() :void
    {
      assertEquals( _stroke.color, 0xff00ff );
      assertEquals( _stroke.alpha, 1 );
      assertEquals( _stroke.thickness, 3 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function color() :void
    {
      _stroke.color = 0x000000;
      assertEquals( _stroke.color, 0x000000 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function alpha() :void
    {
      _stroke.alpha = .5;
      assertEquals( _stroke.alpha, .5 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function thickness() :void
    {
      _stroke.thickness = 7;
      assertEquals( _stroke.thickness, 7 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function pixelHinting() :void
    {
      _stroke.pixelHinting = false;
      assertFalse( _stroke.pixelHinting );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function scaleMode() :void
    {
      _stroke.scaleMode = LineScaleMode.HORIZONTAL;
      assertEquals( _stroke.scaleMode, LineScaleMode.HORIZONTAL );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function caps() :void
    {
      _stroke.caps = CapsStyle.ROUND;
      assertEquals( _stroke.caps, CapsStyle.ROUND );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function joints() :void
    {
      _stroke.joints = JointStyle.BEVEL;
      assertEquals( _stroke.joints, JointStyle.BEVEL );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function miterLimit() :void
    {
      _stroke.miterLimit = 7;
      assertEquals( _stroke.miterLimit, 7 );
    }
  }
}
