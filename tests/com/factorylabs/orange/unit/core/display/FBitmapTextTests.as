
package com.factorylabs.orange.unit.core.display
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertNotNull;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.FBitmapText;

  import flash.display.Sprite;

  /**
   * Generate the test cases for the FBitmapText class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Nov 29, 2009
   */
  public class FBitmapTextTests
  {
    private var _sprite   :Sprite;
    private var _fbitmaptxt :FBitmapText;

    [Before(ui)]
    public function runBeforeEachTest() :void
    {
      _sprite = new Sprite();
      _fbitmaptxt = new FBitmapText( _sprite, { x: 10, y: 10, multiline: true, text: 'Test!' } );
    }

    [After(ui)]
    public function runAfterEachTest() :void
    {
      _sprite.removeChild( _fbitmaptxt );
      _fbitmaptxt = null;
      _sprite = null;
    }

    [Test]
    public function constructor() :void
    {
      var fNotOnStage :FBitmapText = new FBitmapText( );
      assertEquals( _sprite.numChildren, 1 );
      assertTrue( _sprite.contains( _fbitmaptxt ) );
      assertFalse( _sprite.contains( fNotOnStage ) );
      assertFalse( _fbitmaptxt.tabEnabled );
    }

    [Test]
    public function fBitmap() :void
    {
      assertNotNull( _fbitmaptxt.fBitmap );
    }
  }
}

