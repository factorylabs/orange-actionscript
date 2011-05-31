
package com.factorylabs.orange.unit.core.utils
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.utils.Convert;

  /**
   * Generate the test cases for the Convert class.
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
  public class ConvertTests
  {
    [Test]
    public function string_toBoolean() :void
    {
      assertTrue( Convert.toBoolean('true') );
      assertFalse( Convert.toBoolean('false') );
    }

    [Test]
    public function int_toBoolean() :void
    {
      assertTrue( Convert.toBoolean(1) );
      assertFalse( Convert.toBoolean(0) );
    }

    [Test(expects='Error')]
    public function toBoolean_throws_error() :void
    {
      Convert.toBoolean( {} );
    }

    [Test]
    public function convertTime() :void
    {
      assertEquals( Convert.convertTime( 5000 ),  '00:05'  );
      assertEquals( Convert.convertTime( 65000 ),  '01:05' );
      assertEquals( Convert.convertTime( NaN ),  '' );
    }
  }
}

