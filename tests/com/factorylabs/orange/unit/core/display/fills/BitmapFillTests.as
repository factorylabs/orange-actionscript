
package com.factorylabs.orange.unit.core.display.fills
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertNull;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.fills.BitmapFill;

  import flash.display.BitmapData;
  import flash.display.BlendMode;
  import flash.display.Shape;
  import flash.display.Sprite;
  import flash.geom.Rectangle;

  /**
   * Generate the test cases for the BitmapFills class.
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
  public class BitmapFillTests
  {
    private var _shape    :Shape;
    private var _bfill    :BitmapFill;

    [Before]
    public function runBeforeEachTest() :void
    {
      var bmd :BitmapData = new BitmapData( 100, 100, true, 0xFFFFFFFF );
      _shape = new Shape();
      _bfill = new BitmapFill( bmd, _shape, true, true, BlendMode.OVERLAY, null, 0, null );
    }

    [After]
    public function runAfterEachTest() :void
    {
      _bfill = null;
    }

    [Test]
    public function constructor() :void
    {
      var bmd :BitmapData = new BitmapData( 100, 100, true, 0xFFFFFFFF );
      assertEquals( _bfill.bitmapData.width, bmd.width );
      assertEquals( _bfill.source, _bfill.source );
      assertTrue( _bfill.repeat );
      assertTrue( _bfill.smooth );
      assertEquals( _bfill.blendMode, BlendMode.OVERLAY );
      assertNull( _bfill.clipRect );
      assertEquals( _bfill.rotation, 0 );
      assertNull( _bfill.colorTransform );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function bitmapData() :void
    {
      var bmd :BitmapData = new BitmapData( 100, 100, true, 0x00000000 );
      _bfill.bitmapData = bmd;
      assertEquals( _bfill.bitmapData.width, bmd.width );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function source() :void
    {
      var sprite :Sprite = new Sprite();
      _bfill.source = sprite;
      assertEquals( _bfill.source, sprite );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function repeat() :void
    {
      _bfill.repeat = false;
      assertFalse( _bfill.repeat );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function smooth() :void
    {
      _bfill.smooth = false;
      assertFalse( _bfill.smooth );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function blendMode() :void
    {
      _bfill.blendMode = BlendMode.HARDLIGHT;
      assertEquals( _bfill.blendMode, BlendMode.HARDLIGHT );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function clipRect() :void
    {
      _bfill.clipRect = new Rectangle( 0, 0, 100, 100 );
      assertEquals( _bfill.clipRect.width, 100 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function rotation() :void
    {
      _bfill.rotation = 180;
      assertEquals( _bfill.rotation, 180 );
    }

    [Test(description='Checks both the getter and setter.', tracker_id='')]
    public function colorTransform() :void
    {
      _bfill.colorTransform = null;
      assertNull( _bfill.colorTransform );
    }
  }
}

