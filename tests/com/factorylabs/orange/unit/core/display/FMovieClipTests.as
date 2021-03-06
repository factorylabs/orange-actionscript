
package com.factorylabs.orange.unit.core.display
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.FMovieClip;

  import flash.display.Sprite;

  /**
   * Generate the test cases for the FMovieClip class.
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
  public class FMovieClipTests
  {
    private var _sprite   :Sprite;
    private var _fmc    :FMovieClip;

    [Before(ui)]
    public function runBeforeEachTest() :void
    {
      _sprite = new Sprite();
      _fmc = new FMovieClip( _sprite, { x: 10, y: 10 } );
    }

    [After(ui)]
    public function runAfterEachTest() :void
    {
      _sprite.removeChild( _fmc );
      _fmc = null;
      _sprite = null;
    }

    [Test]
    public function constructor() :void
    {
      var fspriteNotOnStage :FMovieClip = new FMovieClip( );
      assertEquals( _sprite.numChildren, 1 );
      assertTrue( _sprite.contains( _fmc ) );
      assertFalse( _sprite.contains( fspriteNotOnStage ) );
      assertFalse( _fmc.tabEnabled );
    }

    [Test]
    public function setProperties() :void
    {
      assertEquals( _fmc.x, 10 );
      assertEquals( _fmc.y, 10 );
      _fmc.setProperties( { alpha: .5, visible: false } );
      assertEquals( _fmc.alpha, .5 );
      assertFalse( _fmc.visible );
    }

    [Test(expects='ArgumentError')]
    public function setPropertiesExpectsError() :void
    {
      new FMovieClip( _sprite, { fail: true } );
    }

    [Test]
    public function remove() :void
    {
      _fmc.remove();
      assertEquals( _sprite.numChildren, 0 );
      assertFalse( _sprite.contains( _fmc ) );
      _sprite.addChild( _fmc );
    }
  }
}

