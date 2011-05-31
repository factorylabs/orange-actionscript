
package com.factorylabs.orange.unit.core.gc
{
  import asunit.asserts.assertEquals;

  import com.factorylabs.orange.core.gc.WeakReference;
  import com.factorylabs.orange.unit.helpers.MockBaseClass;

  /**
   * Generates the test cases for the WeakReference class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Nov 21, 2009
   */
  public class WeakReferenceTests
  {
    private var _weak   :WeakReference;
    private var _mocker   :MockBaseClass;

    [Before]
    public function runBeforeEachTest():void
    {
      _mocker = new MockBaseClass();
      _weak = new WeakReference( _mocker );
    }

    [After]
    public function runAfterEachTest():void
    {
      _weak = null;
      _mocker = null;
    }

    [Test]
    public function get() :void
    {
      assertEquals( _weak.get(), _mocker );
    }
  }
}

