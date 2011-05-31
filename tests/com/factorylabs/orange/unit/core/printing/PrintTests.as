
package com.factorylabs.orange.unit.core.printing
{
  import com.factorylabs.orange.core.display.graphics.FRectangle;
  import asunit.asserts.assertNotNull;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.printing.Print;

  import flash.display.Sprite;

  /**
   * Generate the test cases for the Print class.
   *
   * <p>Testing the rest of the API has been done visually.</p>
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 6, 2010
   */
  public class PrintTests
  {
    private var _print  :Print;
    private var _sprite :Sprite;

    [Before]
    public function runBeforeEachTest() :void
    {
      _sprite = new Sprite;
      new FRectangle( _sprite.graphics, 0, 0, 800, 600 );
      _print = new Print( _sprite, false );
    }

    [After]
    public function runAfterEachTest() :void
    {
      _sprite.graphics.clear();
      _print = null;
      _sprite = null;
    }

    [Test]
    public function constructor() :void
    {
      assertTrue('_print is a Print object', _print is Print );
      assertNotNull( _print );
    }
  }
}

