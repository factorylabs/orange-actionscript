
package com.factorylabs.orange.unit.core.net
{
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.net.DisplayLoader;

  import flash.events.IEventDispatcher;

  /**
   * Generate the test cases for the DisplayLoader class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 15, 2010
   */
  public class DisplayLoaderTests
  {
    private var _loader :DisplayLoader;

    [Before]
    public function runBeforeEachTest() :void
    {
      _loader = new DisplayLoader();
    }

    [After]
    public function runAfterEachTest() :void
    {
      _loader = null;
    }

    [Test]
    public function constructor() :void
    {
      assertTrue( '_loader is DisplayLoader', _loader is DisplayLoader );
    }

    [Test]
    public function should_have_created_a_reference_to_a_dispatcher() :void
    {
      assertTrue( '_floader.dispatcher is IEventDispatcher', _loader.dispatcher is IEventDispatcher );
    }
  }
}

