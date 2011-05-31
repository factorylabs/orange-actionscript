
package com.factorylabs.orange.unit.core.display
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.FSprite;

  import flash.display.Sprite;

  /**
   * Generate the test cases for the FSprite class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Nov 27, 2009
   */
  public class FSpriteTests
  {
    private var _sprite   :Sprite;
    private var _fsprite  :FSprite;

    [Before(ui)]
    public function runBeforeEachTest() :void
    {
      _sprite = new Sprite();
      _fsprite = new FSprite( _sprite, { x: 10, y: 10 } );
    }

    [After(ui)]
    public function runAfterEachTest() :void
    {
      _sprite.removeChild( _fsprite );
      _fsprite = null;
      _sprite = null;
    }

    [Test]
    public function constructor() :void
    {
      var fspriteNotOnStage :FSprite = new FSprite( );
      assertEquals( _sprite.numChildren, 1 );
      assertTrue( _sprite.contains( _fsprite ) );
      assertFalse( _sprite.contains( fspriteNotOnStage ) );
      assertFalse( _fsprite.tabEnabled );
    }

    [Test]
    public function setProperties() :void
    {
      assertEquals( _fsprite.x, 10 );
      assertEquals( _fsprite.y, 10 );
      _fsprite.setProperties( { alpha: .5, visible: false } );
      assertEquals( _fsprite.alpha, .5 );
      assertFalse( _fsprite.visible );
    }

    [Test(expects='ArgumentError')]
    public function setPropertiesExpectsError() :void
    {
      new FSprite( _sprite, { fail: true } );
    }

    [Test]
    public function remove() :void
    {
      _fsprite.remove();
      assertEquals( _sprite.numChildren, 0 );
      assertFalse( _sprite.contains( _fsprite ) );
      _sprite.addChild( _fsprite );
    }
  }
}

