
package com.factorylabs.orange.unit.core.display.graphics
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.fills.SolidFill;
  import com.factorylabs.orange.core.display.graphics.FPolygon;
  import com.factorylabs.orange.unit.helpers.MockCanvas;

  import flash.display.Shape;

  /**
   * Generate the test cases for the FPolygon class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Jan 8, 2010
   */
  public class FPolygonTests
  {
    private var _canvas   :MockCanvas;
    private var _shape    :Shape;
    private var _fpoly    :FPolygon;
    private var _magenta  :SolidFill;

    [Before(ui)]
    public function runBeforeEachTest() :void
    {
      _canvas = new MockCanvas();
      _shape = new Shape();
      _magenta = new SolidFill( 0xff00ff, .8 );
      _fpoly = new FPolygon( _shape.graphics, 0, 0, 5, 50, 0, _magenta, false, false );
      _canvas.add( _shape );
    }

    [After(ui)]
    public function runAfterEachTest() :void
    {
      _shape.graphics.clear();
      _canvas.remove( _shape );
      _magenta = null;
      _fpoly = null;
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function gfx() :void
    {
      assertEquals( _fpoly.gfx, _shape.graphics );
      var tmpshape :Shape = new Shape();
      _fpoly.gfx = tmpshape.graphics;
      assertEquals( _fpoly.gfx, tmpshape.graphics );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function x() :void
    {
      assertEquals( _fpoly.x, 0 );
      _fpoly.x = 100;
      assertEquals( _fpoly.x, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function y() :void
    {
      assertEquals( _fpoly.y, 0 );
      _fpoly.y = 100;
      assertEquals( _fpoly.y, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function width() :void
    {
      assertEquals( _fpoly.width, 100 );
      _fpoly.width = 100;
      assertEquals( _fpoly.width, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function height() :void
    {
      assertEquals( _fpoly.height, 100 );
      _fpoly.height = 10;
      assertEquals( _fpoly.height, 10 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function sides() :void
    {
      assertEquals( _fpoly.sides, 5 );
      _fpoly.sides = 3;
      assertEquals( _fpoly.sides, 3 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function radius() :void
    {
      assertEquals( _fpoly.radius, 50 );
      _fpoly.radius = 10;
      assertEquals( _fpoly.radius, 10 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function angle() :void
    {
      assertEquals( _fpoly.angle, 0 );
      _fpoly.angle = 90;
      assertEquals( _fpoly.angle, 90 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function fill() :void
    {
      assertEquals( _fpoly.fill, _magenta );
      var sf :SolidFill = new SolidFill( 0x000000, .4 );
      _fpoly.fill = sf;
      assertEquals( _fpoly.fill, sf );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function center() :void
    {
      _fpoly.center = true;
      assertTrue( _fpoly.center );
      assertEquals( _fpoly.x, 50 );
      assertEquals( _fpoly.y, 50 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function autoRedraw() :void
    {
      assertFalse( _fpoly.autoRedraw );
      _fpoly.autoRedraw = true;
      assertTrue( _fpoly.autoRedraw );
    }

    [Test]
    public function draw() :void
    {
      _shape.graphics.clear();
      _fpoly.draw( { radius: 25 } );
      assertEquals( _shape.width, 45.25 );
      assertEquals( _shape.height, 47.6 );
    }

    [Test]
    public function setProperties() :void
    {
      _fpoly.setProperties( { radius: 25 } );
      assertEquals( _fpoly.radius, 25 );
    }

    [Test(expects='ArgumentError')]
    public function setPropertiesExpectsError() :void
    {
      _fpoly.setProperties( { fail: true } );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function redraw() :void
    {
      _fpoly.autoRedraw = false;
      _fpoly.radius = 25;
      assertEquals( _shape.width, 90.45 );
      assertEquals( _shape.height, 95.1 );
      _fpoly.redraw();
      assertEquals( _shape.width, 45.25 );
      assertEquals( _shape.height, 47.6 );
    }
  }
}

