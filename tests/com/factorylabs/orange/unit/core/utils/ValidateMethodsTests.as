
package com.factorylabs.orange.unit.core.utils
{
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.utils.ValidateMethods;

  /**
   * Generate the test cases for the ValidateMethods class.
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
  public class ValidateMethodsTests
  {
    [Test]
    public function isValidEmail() :void
    {
      assertTrue( ValidateMethods.isValidEmail( 'mk.kitt@factorylabs.com' ) );
      assertTrue( ValidateMethods.isValidEmail( 'matthew.kitt@factorylabs.com' ) );
      assertTrue( ValidateMethods.isValidEmail( 'matthewkitt@factorylabs.com' ) );
      assertFalse( ValidateMethods.isValidEmail( '@factorylabs.com' ) );
      assertFalse( ValidateMethods.isValidEmail( 'm@.com' ) );
    }

    [Test]
    public function isValidUSZip() :void
    {
      assertTrue( ValidateMethods.isValidUSZip( '12345' ) );
      assertTrue( ValidateMethods.isValidUSZip( '12345-1234' ) );
      assertFalse( ValidateMethods.isValidUSZip( '1234' ) );
      assertFalse( ValidateMethods.isValidUSZip( '12345-12345' ) );
    }

    [Test]
    public function isValidCanPostal() :void
    {
      assertTrue( ValidateMethods.isValidCanPostal( 'A1B2C3' ) );
      assertTrue( ValidateMethods.isValidCanPostal( 'A1B 2C3' ) );
      assertFalse( ValidateMethods.isValidCanPostal( '12345' ) );
      assertFalse( ValidateMethods.isValidCanPostal( '12345-1234' ) );
    }

    [Test(description='Needs to support area codes and formatting like 303.666.6666 and (303). Should be able to remove all numeric numbers and test if 10 characters', tracker_id='')]
    public function isValidPhoneNumber() :void
    {
//      assertThat( ValidateMethods.isValidPhoneNumber( '666.6666' ), equalTo( true ) );
      assertTrue( ValidateMethods.isValidPhoneNumber( '666-6666' ) );
      assertTrue( ValidateMethods.isValidPhoneNumber( '6666666' ) );
      assertTrue( ValidateMethods.isValidPhoneNumber( '666 6666' ) );
    }

    [Test(description='Need to refactor to strip all non numeric characters then make sure we have 3 left', tracker_id='')]
    public function isValidAreaCode() :void
    {
      assertTrue( ValidateMethods.isValidAreaCode( '123' ) );
      assertFalse( ValidateMethods.isValidAreaCode( '' ) );
    }
  }
}

