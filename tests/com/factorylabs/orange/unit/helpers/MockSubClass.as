
package com.factorylabs.orange.unit.helpers
{
  import flash.display.Sprite;

  /**
   * Basic necessities to mock a subclass.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: May 26, 2009
   */
  public class MockSubClass
    extends MockBaseClass
  {
    public static var myStaticVar :String;
    public const CONST1       :String = 'Const1';
    public var myVar        :int;
    public var sprite       :Sprite;
    private var _param1       :Number;
    private var _param2       :Sprite;
    private var _param3       :Array;

    public static function get staticAccessor() :String { return myStaticVar; }
    public static function set staticAccessor( $staticAccessor :String ) :void
    {
      myStaticVar = $staticAccessor;
    }

    public function MockSubClass( $param1 :int, $param2 :Sprite = null )
    {
      myVar = $param1;
      sprite = $param2;
    }

    override public function toString() :String
    {
      return 'tests.factorylabs.orange.helpers.MockSubClass';
    }

    override public function method( $param1 :Number = NaN, $param2 :Sprite = null, $param3 :Array = null ) :void
    {
      _param1 = $param1;
      _param2 = $param2;
      _param3 = $param3;
    }

    public static function staticMethodSub() :String
    {
      return 'test';
    }
  }
}

