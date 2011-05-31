
package com.factorylabs.orange.unit.core.utils
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.utils.ColorMethods;

  /**
   * Generate the test cases for the ColorMethods class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Mar 15, 2009
   */
  public class ColorMethodsTests
  {
    [Test]
    public function argbToHex() :void
    {
      assertTrue( ColorMethods.argbToHex( 0, 255, 255, 255 ) == 0x00ffffff );
      assertFalse( ColorMethods.argbToHex( 255, 255, 255, 255 ) == 0x00ffffff );
    }

    [Test]
    public function hexToFlashColorNumber() :void
    {
      assertEquals( ColorMethods.hexToFlashColorNumber( '0xff00ff' ), 0xff00ff );
      assertEquals( ColorMethods.hexToFlashColorNumber( '#ff00ff' ) == 0xff00ff, false );
    }

    [Test]
    public function hexToARGB() :void
    {
      var color1 :Object = { a: 0, r: 255, g: 255, b: 255 };
      var color2  :Object = ColorMethods.hexToARGB( 0x00ffffff );

      assertEquals( color1[ 'a' ] == color2[ 'a' ], true );
      assertEquals( color1[ 'r' ] == color2[ 'r' ], true );
      assertEquals( color1[ 'g' ] == color2[ 'g' ], true );
      assertEquals( color1[ 'b' ] == color2[ 'g' ], true );
    }

    [Test]
    public function hexToRGB() :void
    {
      var color1 :Object = { r: 255, g: 255, b: 255 };
      var color2  :Object = ColorMethods.hexToRGB( 0xffffff );

      assertEquals( color1[ 'r' ] == color2[ 'r' ], true );
      assertEquals( color1[ 'g' ] == color2[ 'g' ], true );
      assertEquals( color1[ 'b' ] == color2[ 'g' ], true );
    }

    [Test]
    public function flashColorNumberToHexString() :void
    {
      assertEquals( ColorMethods.flashColorNumberToHexString( 0xff00ff ) == '0xff00ff', true );
    }

    [Test]
    public function rgbToHex() :void
    {
      assertEquals( ColorMethods.rgbToHex( 255, 255, 255 ) == 0xffffff, true );
      assertEquals( ColorMethods.rgbToHex( 0, 0, 0 ) == 0x000000, true );
      assertEquals( ColorMethods.rgbToHex( 0, 0, 0 ) == 0xff00ff, false );
    }
  }
}

