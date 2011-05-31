
package com.factorylabs.orange.unit.core.text
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertEqualsArraysIgnoringOrder;
  import asunit.asserts.assertNull;
  import asunit.asserts.assertSame;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.display.fills.SolidFill;
  import com.factorylabs.orange.core.text.FStyleManager;

  import flash.text.StyleSheet;
  import flash.text.TextFormat;

  /**
   * Generate the test cases for the FStyleManager class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 8, 2010
   */
  public class FStyleManagerTests
  {
    private var _styles   :FStyleManager;
    private var _defaultcss :StyleSheet;
    private var _tempcss  :StyleSheet;

    private var appcss :XML =
    <script>
      <![CDATA[
        .h1
        {
          font-family:Arial;
          font-size:20px;
          text-align:left;
          color:#000000;
        }
      ]]>
    </script>;

    private var tmpcss :XML =
    <script>
      <![CDATA[
        .h3
        {
          font-family:Verdana;
          font-size:12px;
          text-align:left;
          color:#FFFFFF;
        }
      ]]>
    </script>;

    private var _textformat :TextFormat;

    [Before]
    public function runBeforeEachTest() :void
    {
      _styles = new FStyleManager();
      _defaultcss = new StyleSheet();
      _defaultcss.parseCSS( appcss );
      _tempcss = new StyleSheet();
      _tempcss.parseCSS( tmpcss );

      _textformat = new TextFormat( 'Arial', 12, 0xFF00FF );
    }

    [After]
    public function runAfterEachTest() :void
    {
      _styles = null;
      _defaultcss.clear();
      _tempcss.clear();
      _defaultcss = null;
      _tempcss = null;
      _textformat = null;
    }

    [Test]
    public function constructor() :void
    {
      assertTrue('_styles is FStyleManager', _styles is FStyleManager );
    }

    [Test]
    public function get_all_the_keys_in_fmanager() :void
    {
      _styles.addStyleSheet( 'default', _defaultcss );
      _styles.addStyleSheet( 'tmp', _tempcss );
      assertEqualsArraysIgnoringOrder( _styles.keys, ['default', 'tmp'] );
    }

    [Test]
    public function add_and_get_css_to_fmanager() :void
    {
      _styles.addStyleSheet( 'default', _defaultcss );
      var sheet :StyleSheet = _styles.getStyleSheet( 'default' );
      assertSame( _defaultcss, sheet );
    }

    [Test(expects='Error')]
    public function adding_css_same_key_should_throw_error_from_map() :void
    {
      _styles.addStyleSheet( 'default', _defaultcss );
      _styles.addStyleSheet( 'default', _tempcss );
    }

    [Test]
    public function adding_and_getting_multiple_css() :void
    {
      _styles.addStyleSheet( 'default', _defaultcss );
      _styles.addStyleSheet( 'tmp', _tempcss );
      var def :StyleSheet = _styles.getStyleSheet( 'default' );
      var tmp :StyleSheet = _styles.getStyleSheet( 'tmp' );

      assertSame( _defaultcss, def );
      assertSame( _tempcss, tmp );
      assertEquals( _styles.length, 2 );
    }

    [Test]
    public function should_parse_xml_to_stylesheet() :void
    {
      var sheet :StyleSheet = _styles.parseXMLToCSS( tmpcss );
      assertEqualsArraysIgnoringOrder( _tempcss.styleNames, sheet.styleNames );
    }

    [Test(expects='Error')]
    public function should_throw_an_error_on_malformed_css_xml() :void
    {
      _styles.parseXMLToCSS( new XML() );
    }

    [Test]
    public function should_add_a_stylesheet_from_xml() :void
    {
      var doggie :StyleSheet = _styles.addStyleSheetFromXML( 'mansfield', tmpcss );
      var mansfield :StyleSheet = _styles.getStyleSheet( 'mansfield' );

      assertEqualsArraysIgnoringOrder( _tempcss.styleNames, mansfield.styleNames );
      assertSame( doggie, mansfield );
    }

    [Test(expects='Error')]
    public function should_throw_an_error_on_malformed_css_xml_without_adding_it() :void
    {
      _styles.addStyleSheetFromXML( 'sheet', new XML() );
      assertNull( _styles.getStyleSheet( 'sheet' ) );
    }

    [Test]
    public function should_parse_string_to_stylesheet() :void
    {
      var sheet :StyleSheet = _styles.parseStringToCSS( tmpcss.toString() );
      assertEqualsArraysIgnoringOrder( _tempcss.styleNames, sheet.styleNames );
    }

    [Test(expects='Error')]
    public function should_throw_an_error_on_malformed_css_string() :void
    {
      _styles.parseStringToCSS( 'mansfield' );
    }

    [Test]
    public function should_add_a_stylesheet_from_string() :void
    {
      var doggie :StyleSheet = _styles.addStyleSheetFromString( 'mansfield', tmpcss.toString() );
      var mansfield :StyleSheet = _styles.getStyleSheet( 'mansfield' );

      assertEqualsArraysIgnoringOrder( _tempcss.styleNames, mansfield.styleNames );
      assertSame( doggie, mansfield );
    }

    [Test(expects='Error')]
    public function should_throw_an_error_on_malformed_css_string_without_adding_it() :void
    {
      _styles.addStyleSheetFromString( 'sheet', 'malformed css' );
      assertNull( _styles.getStyleSheet( 'sheet' ) );
    }

    [Test]
    public function should_add_and_get_a_textformat() :void
    {
      _styles.addTextFormat( 'textformat', _textformat );
      assertEquals( _styles.length, 1 );
      var tf :TextFormat = _styles.getTextFormat( 'textformat' );
      assertEquals( _textformat, tf );
    }

    [Test]
    public function should_add_and_get_a_generic_style() :void
    {
      var sf :SolidFill = new SolidFill( 0xFF00FF, .5 );
      _styles.addGenericStyle( 'fill', sf );
      assertEquals( _styles.length, 1 );
      var rf :SolidFill = SolidFill( _styles.getGenericStyle( 'fill' ) );
      assertEquals( sf.color, rf.color );
    }

    [Test]
    public function should_remove_a_stylesheet_from_fmanager() :void
    {
      _styles.addStyleSheet( 'default', _defaultcss );
      _styles.addStyleSheet( 'tmp', _tempcss );
      assertEquals( _styles.length, 2 );
      _styles.removeStyle( 'default' );
      assertEquals( _styles.length, 1 );
    }

    [Test]
    public function should_clear_all_styles_from_fmanager() :void
    {
      _styles.addStyleSheet( 'default', _defaultcss );
      _styles.addStyleSheet( 'tmp', _tempcss );
      assertEquals( _styles.length, 2 );
      _styles.clear();
      assertEquals( _styles.length, 0 );
    }
  }
}

