
package com.factorylabs.orange.unit.core.display.graphics
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.fills.SolidStroke;
  import com.factorylabs.orange.core.display.graphics.FDashedLine;
  import com.factorylabs.orange.unit.helpers.MockCanvas;

  import flash.display.CapsStyle;
  import flash.display.JointStyle;
  import flash.display.LineScaleMode;
  import flash.display.Shape;

  /**
   * Generate the test cases for the FDashedLine class.
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
  public class FDashedLineTests
  {
    private var _canvas   :MockCanvas;
    private var _shape    :Shape;
    private var _fline    :FDashedLine;
    private var _magenta  :SolidStroke;

    [Before(ui)]
    public function runBeforeEachTest() :void
    {
      _canvas = new MockCanvas();
      _shape = new Shape();
      _magenta = new SolidStroke( 0xff00ff, 1, 3, true, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.MITER, 3 );
      _fline = new FDashedLine( _shape.graphics, 0, 0, 500, 0, 5, 5, _magenta, false );
      _canvas.add( _shape );
    }

    [After(ui)]
    public function runAfterEachTest() :void
    {
      _shape.graphics.clear();
      _canvas.remove( _shape );
      _magenta = null;
      _fline = null;
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function gfx() :void
    {
      assertEquals( _fline.gfx, _shape.graphics );
      var tmpshape :Shape = new Shape();
      _fline.gfx = tmpshape.graphics;
      assertEquals( _fline.gfx, tmpshape.graphics );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function x() :void
    {
      assertEquals( _fline.x, 0 );
      _fline.x = 100;
      assertEquals( _fline.x, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function y() :void
    {
      assertEquals( _fline.y, 0 );
      _fline.y = 100;
      assertEquals( _fline.y, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function endX() :void
    {
      assertEquals( _fline.endX, 500 );
      _fline.endX = 100;
      assertEquals( _fline.endX, 100 );
    }

    [Test(expects='ArgumentError')]
    public function setWidth() :void
    {
      _fline.width = 100;
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function endY() :void
    {
      assertEquals( _fline.endY, 0 );
      _fline.endY = 10;
      assertEquals( _fline.endY, 10 );
    }

    [Test(expects='ArgumentError')]
    public function setHeight() :void
    {
      _fline.height = 100;
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function fill() :void
    {
      assertEquals( _fline.fill, _magenta );
      var sf :SolidStroke = new SolidStroke( 0x000000, .4 );
      _fline.fill = sf;
      assertEquals( _fline.fill, sf );
    }

    [Test(expects='ArgumentError')]
    public function setCenter() :void
    {
      _fline.center = true;
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function autoRedraw() :void
    {
      assertFalse( _fline.autoRedraw );
      _fline.autoRedraw = true;
      assertTrue( _fline.autoRedraw );
    }

    [Test]
    public function draw() :void
    {
      _shape.graphics.clear();
      _fline.draw( { endX: 100 } );
      assertEquals( _fline.endX, 100 );
      assertEquals( _shape.width, 95 );
    }

    [Test]
    public function setProperties() :void
    {
      _fline.setProperties( { endX: 100 } );
      assertEquals( _fline.endX, 100 );
    }

    [Test(expects='ArgumentError')]
    public function setPropertiesExpectsError() :void
    {
      _fline.setProperties( { fail: true } );
    }


    [Test]
    public function redraw() :void
    {
      _fline.autoRedraw = false;
      _fline.endX = 100;
      assertEquals( _shape.width, 495 );    // offset because of segments and gap length
      _fline.redraw();
      assertEquals( _shape.width, 95 );   // offset because of segments and gap length
    }
  }
}

