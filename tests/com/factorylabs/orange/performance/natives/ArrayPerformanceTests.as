
package com.factorylabs.orange.performance.natives
{
  import com.gskinner.performance.MethodTest;
  import com.gskinner.performance.TestSuite;
  /**
   * Generate the performance test cases for the Array class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Jan 26, 2010
   */
  public class ArrayPerformanceTests
    extends TestSuite
  {
    protected var loops   :uint = 100000;

    public function ArrayPerformanceTests()
    {
      name = 'ArrayPerformanceTests';
      description = 'Tests performance on Arrays. ' + loops + ' loops.';
      tareTest = new MethodTest( tare );
      initFunction = init;
      iterations = 4;
      tests =
      [
        new MethodTest( instantiate_array_with_brackets, null, 'instantiate_array_with_brackets' ),
        new MethodTest( instantiate_array_with_new_operator, null, 'instantiate_array_with_new_operator'),
        new MethodTest( reset_array_with_brackets, null, 'reset_array_with_brackets'),
        new MethodTest( reset_array_with_new_operator, null, 'reset_array_with_new_operator'),
        new MethodTest( reset_array_with_length, null, 'reset_array_with_length')
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

    public function instantiate_array_with_brackets() :void
    {
      for( var i :uint = 0; i < loops; ++i )
      {
        var a :Array = [];
      }
    }

    public function instantiate_array_with_new_operator() :void
    {
      for( var i :uint = 0; i < loops; ++i )
      {
        var a :Array = new Array();
      }
    }

    public function reset_array_with_brackets() :void
    {
      for( var i :uint = 0; i < loops; ++i )
      {
        var a :Array = [];
        a.push(1);
        a = [];
      }
    }

    public function reset_array_with_new_operator() :void
    {
      for( var i :uint = 0; i < loops; ++i )
      {
        var a :Array = [];
        a.push(1);
        a = new Array();
      }
    }

    public function reset_array_with_length() :void
    {
      for( var i :uint = 0; i < loops; ++i )
      {
        var a :Array = [];
        a.push(1);
        a.length = 0;
      }
    }
  }
}

