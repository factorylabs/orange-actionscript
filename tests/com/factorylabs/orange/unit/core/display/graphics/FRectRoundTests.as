
package com.factorylabs.orange.unit.core.display.graphics
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.fills.SolidFill;
  import com.factorylabs.orange.core.display.graphics.FRectRound;
  import com.factorylabs.orange.unit.helpers.MockCanvas;

  import flash.display.Shape;

  /**
   * Generate the test cases for the FRectRound class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Dec 16, 2009
   */
  public class FRectRoundTests
  {
    private var _canvas   :MockCanvas;
    private var _shape    :Shape;
    private var _frect    :FRectRound;
    private var _magenta  :SolidFill;

    [Before(ui)]
    public function runBeforeEachTest() :void
    {
      _canvas = new MockCanvas();
      _shape = new Shape();
      _magenta = new SolidFill( 0xff00ff, .8 );
      _frect = new FRectRound( _shape.graphics, 0, 0, 500, 100, _magenta, 10, 10, false, false );
      _canvas.add( _shape );
    }

    [After(ui)]
    public function runAfterEachTest() :void
    {
      _shape.graphics.clear();
      _canvas.remove( _shape );
      _magenta = null;
      _frect = null;
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function gfx() :void
    {
      assertEquals( _frect.gfx, _shape.graphics );
      var tmpshape :Shape = new Shape();
      _frect.gfx = tmpshape.graphics;
      assertEquals( _frect.gfx, tmpshape.graphics );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function x() :void
    {
      assertEquals( _frect.x, 0 );
      _frect.x = 100;
      assertEquals( _frect.x, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function y() :void
    {
      assertEquals( _frect.y, 0 );
      _frect.y = 100;
      assertEquals( _frect.y, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function width() :void
    {
      assertEquals( _frect.width, 500 );
      _frect.width = 100;
      assertEquals( _frect.width, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function height() :void
    {
      assertEquals( _frect.height, 100 );
      _frect.height = 10;
      assertEquals( _frect.height, 10 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function cornerWidth() :void
    {
      assertEquals( _frect.cornerWidth, 10 );
      _frect.cornerWidth = 100;
      assertEquals( _frect.cornerWidth, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function cornerHeight() :void
    {
      assertEquals( _frect.cornerHeight, 10 );
      _frect.cornerHeight = 100;
      assertEquals( _frect.cornerHeight, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function fill() :void
    {
      assertEquals( _frect.fill, _magenta );
      var sf :SolidFill = new SolidFill( 0x000000, .4 );
      _frect.fill = sf;
      assertEquals( _frect.fill, sf );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function center() :void
    {
      _frect.center = true;
      assertTrue( _frect.center );
      assertEquals( _frect.x, 250 );
      assertEquals( _frect.y, 50 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function autoRedraw() :void
    {
      assertFalse( _frect.autoRedraw );
      _frect.autoRedraw = true;
      assertTrue( _frect.autoRedraw );
    }

    [Test]
    public function draw() :void
    {
      _shape.graphics.clear();
      _frect.draw( { width: 500, height: 25 } );
      assertEquals( _frect.width, 500 );
      assertEquals( _frect.height, 25 );
      assertEquals( _shape.width, 500 );
      assertEquals( _shape.height, 25 );
    }

    [Test]
    public function setProperties() :void
    {
      _frect.setProperties( { x: 100, width: 100 } );
      assertEquals( _frect.x, 100 );
      assertEquals( _frect.width, 100 );
    }

    [Test(expects='ArgumentError')]
    public function setPropertiesExpectsError() :void
    {
      _frect.setProperties( { fail: true } );
    }

    [Test]
    public function redraw() :void
    {
      _frect.autoRedraw = false;
      _frect.width = 100;
      _frect.height = 25;
      assertEquals( _shape.width, 500 );
      assertEquals( _shape.height, 100 );
      _frect.redraw();
      assertEquals( _shape.width, 100 );
      assertEquals( _shape.height, 25 );
    }
  }
}

