
package com.factorylabs.orange.unit.core.display
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.FTextField;

  import flash.display.Sprite;

  /**
   * Generate the test cases for the FTextField class.
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
  public class FTextFieldTests
  {
    private var _sprite   :Sprite;
    private var _ftextfield :FTextField;

    [Before(ui)]
    public function runBeforeEachTest() :void
    {
      _sprite = new Sprite();
      _ftextfield = new FTextField( _sprite, { x: 10, y: 10 } );
    }

    [After(ui)]
    public function runAfterEachTest() :void
    {
      _sprite.removeChild( _ftextfield );
      _ftextfield = null;
      _sprite = null;
    }

    [Test]
    public function constructor() :void
    {
      var ftxtNotOnStage :FTextField = new FTextField( );
      assertEquals( _sprite.numChildren, 1 );
      assertTrue( _sprite.contains( _ftextfield ) );
      assertFalse( _sprite.contains( ftxtNotOnStage ) );
      assertFalse( _ftextfield.tabEnabled );
    }

    [Test]
    public function setProperties() :void
    {
      assertEquals( _ftextfield.x, 10 );
      assertEquals( _ftextfield.y, 10 );
      _ftextfield.setProperties( { alpha: .5, visible: false } );
      assertEquals( _ftextfield.alpha, .5 );
      assertFalse( _ftextfield.visible );
    }

    [Test(expects='ArgumentError')]
    public function setPropertiesExpectsError() :void
    {
      new FTextField( _sprite, { fail: true } );
    }

    [Test]
    public function remove() :void
    {
      _ftextfield.remove();
      assertEquals( _sprite.numChildren, 0 );
      assertFalse( _sprite.contains( _ftextfield ) );
      _sprite.addChild( _ftextfield );
    }

    [Test]
    public function multiline() :void
    {
      _ftextfield.multiline = true;
      assertTrue( _ftextfield.multiline );
      assertTrue( _ftextfield.wordWrap );

      _ftextfield.multiline = false;
      assertFalse( _ftextfield.multiline );
      assertFalse( _ftextfield.wordWrap );
    }
  }
}

