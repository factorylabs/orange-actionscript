
package com.factorylabs.orange.unit.core.math
{
  import asunit.asserts.assertEquals;

  import com.factorylabs.orange.core.math.MathMethods;

  /**
   * Generate the test cases for the MathMethods class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Nov 26, 2009
   */
  public class MathMethodsTests
  {
    [Test]
    public function degreesToRadians() :void
    {
      assertEquals( MathMethods.degreesToRadians( 180 ), 3.141592653589793 );
      assertEquals( MathMethods.degreesToRadians( 90 ), 1.5707963267948966 );
    }

    [Test]
    public function radiansToDegress() :void
    {
      assertEquals( Math.round( MathMethods.radiansToDegrees( 3.14 ) ), 180 );
      assertEquals( Math.round( MathMethods.radiansToDegrees( 1.57 ) ), 90 );
    }

    [Test]
    public function percentToDegrees() :void
    {
      assertEquals( MathMethods.percentToDegrees( 1 ), 360 );
      assertEquals( MathMethods.percentToDegrees( .5 ), 180 );
      assertEquals( MathMethods.percentToDegrees( .25 ), 90 );
    }

    [Test]
    public function degreesToPercent() :void
    {
      assertEquals( MathMethods.degreesToPercent( 360 ), 1 );
      assertEquals( MathMethods.degreesToPercent( 180 ), .5 );
      assertEquals( MathMethods.degreesToPercent( 90 ), .25 );
    }

    [Test]
    public function randRange() :void
    {
      var random :Number = MathMethods.randRange( 0, 10 );
      var inBounds :Boolean = ( random >= 0 && random <= 10 ) ? true : false;
      assertEquals( inBounds, true );
    }

    [Test]
    public function randRangeDecimal() :void
    {
      var random :Number = MathMethods.randRangeDecimel( 0, 10 );
      var inBounds :Boolean = ( random >= 0 && random <= 10 ) ? true : false;
      assertEquals( inBounds, true );
    }

    [Test]
    public function sums() :void
    {
      var array :Array = [ 5, 10, 15, 20 ];
      assertEquals( MathMethods.sums( array ), 50 );
    }

    [Test]
    public function average() :void
    {
      var array :Array = [ 5, 10, 15, 20 ];
      assertEquals( MathMethods.average( array ), 12.5 );
    }

    [Test]
    public function getPercentWithinRange() :void
    {
      assertEquals( MathMethods.getPercentWithinRange( 50, 150, 100 ), 50 );
    }

    [Test]
    public function interp() :void
    {
      assertEquals( MathMethods.interp( 10, 20, .5 ), 15 );
    }

    [Test]
    public function remap() :void
    {
      assertEquals( MathMethods.remap( 10, 0, 20, 1, 2 ), 1.5 );
    }
  }
}

