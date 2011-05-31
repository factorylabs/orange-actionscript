
package com.factorylabs.orange.unit.core.utils
{
  import asunit.asserts.assertEquals;

  import com.factorylabs.orange.core.utils.Locale;

  import flash.system.Capabilities;

  /**
   * Generate the test cases for the Locale class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Mar 16, 2009
   */
  public class LocaleTests
  {
    private var _locale :Locale;

    [Before]
    public function runBeforeEachTest() :void
    {
      _locale = new Locale( Locale.ENGLISH, Locale.US );
    }

    [After]
    public function runAfterEachTest() :void
    {
      _locale = null;
    }

    [Test]
    public function language() :void
    {
      assertEquals( _locale.language, Locale.ENGLISH );
      _locale.language = Locale.GERMAN;
      assertEquals( _locale.language, Locale.GERMAN );
    }

    [Test]
    public function variant() :void
    {
      assertEquals( _locale.variant, Locale.US );
      _locale.variant = Locale.UK;
      assertEquals( _locale.variant, Locale.UK );
    }

    [Test]
    public function languageVariant() :void
    {
      assertEquals( _locale.languageVariant, Locale.ENGLISH + '-' + Locale.US );
      _locale.languageVariant = Locale.FRENCH + '-' + Locale.UK;
      assertEquals( _locale.languageVariant, Locale.FRENCH + '-' + Locale.UK );
    }

    [Test]
    public function reset() :void
    {
      _locale.language = Locale.GERMAN;
      _locale.variant = Locale.UK;
      _locale.reset();
      assertEquals( Capabilities.language, _locale.language );
      assertEquals( Locale.US, _locale.variant);
    }
  }
}

