
package com.factorylabs.orange.performance.core.display
{
  import com.factorylabs.orange.unit.helpers.MockFButton;
  import com.gskinner.performance.MethodTest;
  import com.gskinner.performance.TestSuite;

  /**
   * Generate the performance test cases for the FButton class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 10, 2010
   */
  public class FButtonPerformanceTests
    extends TestSuite
  {
    protected var loops   :uint = 100000;

    public function FButtonPerformanceTests()
    {
      name = 'FButtonPerformanceTests';
      description = 'Testing the memory usage on instantiating Buttons. ' + loops + ' loops.';
      tareTest = new MethodTest( tare );
      initFunction = init;
      iterations = 4;
      tests =
      [
        new MethodTest( adding_a_bunch_of_buttons, null, 'adding_a_bunch_of_buttons' )
      ];
    }

    protected function init() :void
    {

    }

    public function tare() :void
    {
      for( var i :uint = 0; i < loops; ++i )
      {
      }
    }

    public function adding_a_bunch_of_buttons() :void
    {
      for( var i :uint = 0; i < loops; ++i )
      {
        new MockFButton( null, null );
      }
    }
  }
}

