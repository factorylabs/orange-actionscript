
package com.factorylabs.orange.unit.core.display.fills
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertEqualsArrays;

  import com.factorylabs.orange.core.display.fills.GradientFill;
  import com.factorylabs.orange.core.display.fills.GradientStroke;
  import com.factorylabs.orange.core.display.fills.SolidStroke;

  /**
   * Generate the test cases for the GradientStroke class.
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
  public class GradientStrokeTests
  {
    private var _gradientFill   :GradientFill;
    private var _solidStroke  :SolidStroke;
    private var _gradientStroke :GradientStroke;

    [Before]
    public function runBeforeEachTest() :void
    {
      _gradientFill = new GradientFill( 0, [ 0xffffff, 0x333333 ] );
      _solidStroke = new SolidStroke( 0xcccccc, 1, 3, true );
      _gradientStroke = new GradientStroke( _gradientFill, _solidStroke );
    }

    [After]
    public function runAfterEachTest() :void
    {
      _gradientStroke = null;
      _gradientFill = null;
      _solidStroke = null;
    }

    [Test]
    public function constructor() :void
    {
      assertEqualsArrays( _gradientStroke.gradientFill.colors, new GradientFill( 0, [ 0xffffff, 0x333333 ] ).colors );
      assertEquals( _gradientStroke.solidStroke.thickness, 3 );
    }

    [Test]
    public function gradientFill() :void
    {
      var gf :GradientFill = new GradientFill( 180, [ 0xff00ff, 0xff0000 ] );
      _gradientStroke.gradientFill = gf;
      assertEqualsArrays( _gradientStroke.gradientFill.colors, [ 0xff00ff, 0xff0000 ] );
    }

    [Test]
    public function solidStroke() :void
    {
      var sf :SolidStroke = new SolidStroke( 0x000000, 2, 5, false );
      _gradientStroke.solidStroke = sf;
      assertEquals( _gradientStroke.solidStroke.color, 0x000000 );
    }
  }
}

