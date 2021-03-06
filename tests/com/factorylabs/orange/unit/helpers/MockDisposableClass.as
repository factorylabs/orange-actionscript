
package com.factorylabs.orange.unit.helpers
{
  import com.factorylabs.orange.core.IDisposable;

  /**
   * Basic necessities to mock a disposable class.
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
  public class MockDisposableClass
    implements IDisposable
  {
    private var _isDisposed   :Boolean;

    public function get isDisposed() :Boolean { return _isDisposed; }
    public function set isDisposed( $isDisposed :Boolean ) :void
    {
      _isDisposed = $isDisposed;
    }

    public function MockDisposableClass()
    {
      _isDisposed = false;
    }

    public function toString() :String
    {
      return 'tests.factorylabs.orange.helpers.MockDisposableClass';
    }

    public function dispose() :void
    {
      _isDisposed = true;
    }
  }
}

