
package com.factorylabs.orange.unit.helpers
{
  import flash.display.Sprite;

  /**
   * Basic necessities to mock a class.
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
  public class MockBaseClass
    implements IMockInterface
  {
    private var _var    :int;
    private var _isTrue   :Boolean = true;
    private var _param1   :Number;
    private var _param2   :Sprite;
    private var _param3   :Array;
    public var baseVar    :Sprite;

    public function set testVar( $var :int ) :void
    {
      _var = $var;
    }

    public function get isTrue() :Boolean { return _isTrue; }
    public function set isTrue( $isTrue :Boolean ) :void
    {
      _isTrue = $isTrue;
    }

    public function MockBaseClass()
    {
      shouldNotShow();
    }

    public function toString() :String
    {
      return 'tests.factorylabs.orange.helpers.MockBaseClass';
    }

    public function method( $param1 :Number = NaN, $param2 :Sprite = null, $param3 :Array = null ) :void
    {
      _param1 = $param1;
      _param2 = $param2;
      _param3 = $param3;
    }

    protected function shouldBeProtected() :void
    {
      shouldNotShow();
    }

    public function method1() :Boolean
    {
      return true;
    }

    public static function staticMethod() :Sprite
    {
      return new Sprite();
    }

    private function shouldNotShow() :void
    {
      method1();
    }
  }
}

