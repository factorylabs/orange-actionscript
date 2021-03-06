
package com.factorylabs.orange.unit.core.net
{
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.net.TextLoader;

  import flash.events.IEventDispatcher;

  /**
   * Generate the test cases for the TextLoader class.
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
  public class TextLoaderTests
  {
    private var _textloader :TextLoader;

    [Before]
    public function runBeforeEachTest() :void
    {
      _textloader = new TextLoader();
    }

    [After]
    public function runAfterEachTest() :void
    {
      _textloader = null;
    }

    [Test]
    public function constructor() :void
    {
      assertTrue( '_textloader is TextLoader', _textloader is TextLoader );
    }

    [Test]
    public function should_have_created_a_reference_to_a_dispatcher() :void
    {
      assertTrue( '_textloader.dispatcher is IEventDispatcher', _textloader.dispatcher is IEventDispatcher );
    }
  }
}

