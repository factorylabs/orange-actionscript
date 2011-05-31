
package com.factorylabs.orange.unit.core.display
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.FShape;

  import flash.display.Sprite;

  /**
   * Generate the test cases for the FShape class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Nov 28, 2009
   */
  public class FShapeTests
  {
    private var _sprite   :Sprite;
    private var _fshape   :FShape;

    [Before(ui)]
    public function runBeforeEachTest() :void
    {
      _sprite = new Sprite();
      _fshape = new FShape( _sprite, { x: 10, y: 10 } );
    }

    [After(ui)]
    public function runAfterEachTest() :void
    {
      _sprite.removeChild( _fshape );
      _fshape = null;
      _sprite = null;
    }

    [Test]
    public function constructor() :void
    {
      var fshapeNotOnStage :FShape = new FShape();
      assertEquals( _sprite.numChildren, 1 );
      assertTrue( _sprite.contains( _fshape ) );
      assertFalse( _sprite.contains( fshapeNotOnStage ) );
    }

    [Test]
    public function setProperties() :void
    {
      assertEquals( _fshape.x, 10 );
      assertEquals( _fshape.y, 10 );
      _fshape.setProperties( { alpha: .5, visible: false } );
      assertEquals( _fshape.alpha, .5 );
      assertFalse( _fshape.visible );
    }

    [Test(expects='ArgumentError')]
    public function setPropertiesExpectsError() :void
    {
      new FShape( _sprite, { fail: true } );
    }

    [Test]
    public function remove() :void
    {
      _fshape.remove();
      assertEquals( _sprite.numChildren, 0 );
      assertFalse( _sprite.contains( _fshape ) );
      _sprite.addChild( _fshape );
    }
  }
}

