
package com.factorylabs.orange.unit.core.display
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.FBitmapSnapshot;
  import com.factorylabs.orange.core.display.fills.SolidFill;
  import com.factorylabs.orange.core.display.graphics.FRectangle;
  import com.factorylabs.orange.unit.helpers.MockCanvas;

  import flash.display.Bitmap;
  import flash.display.Shape;

  /**
   * Generate the test cases for the FBitmapSnapshot class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 8, 2010
   */
  public class FBitmapSnapshotTests
  {
    private var _snapshot :FBitmapSnapshot;
    private var _canvas   :MockCanvas;
    private var _shape    :Shape;
    private var _frect    :FRectangle;
    private var _magenta  :SolidFill;

    [Before]
    public function runBeforeEachTest() :void
    {
      _snapshot = new FBitmapSnapshot();
      _canvas = new MockCanvas();
      _shape = new Shape();
      _magenta = new SolidFill( 0x000000, 1 );
      _frect = new FRectangle( _shape.graphics, 0, 0, 500, 100, _magenta, false, false );
      _canvas.add( _shape );
    }

    [After]
    public function runAfterEachTest() :void
    {
      _snapshot = null;
      _shape.graphics.clear();
      _canvas.remove( _shape );
      _magenta = null;
      _frect = null;
    }

    [Test]
    public function constructor() :void
    {
      assertTrue('_snapshot is Bitmap', _snapshot is Bitmap );
    }

    [Test]
    public function should_take_a_snapshot() :void
    {
      _snapshot.snapshot( _shape, _canvas, NaN, NaN, false, 0xff00ff, null, false );
      assertEquals( _snapshot.width, _shape.width );
      assertEquals( _snapshot.height, _shape.height );
      assertEquals( _snapshot.bitmapData.getPixel( 10, 10 ), _magenta.color );
    }
  }
}

