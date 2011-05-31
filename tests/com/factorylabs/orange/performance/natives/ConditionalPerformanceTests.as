
package com.factorylabs.orange.performance.natives
{
  import com.gskinner.performance.MethodTest;
  import com.gskinner.performance.TestSuite;

  /**
   * Generate the performance test cases for the Klass class.
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
  public class ConditionalPerformanceTests
    extends TestSuite
  {
    protected var loops   :uint = 100000;
    protected var array   :Array;

    public function ConditionalPerformanceTests()
    {
      name = 'ConditionalPerformanceTests';
      description = 'Tests performance differences on long conditionals. ' + loops + ' loops.';
      tareTest = new MethodTest( tare );
      initFunction = init;
      iterations = 4;
      tests =
      [
        new MethodTest( switch_statements, null, 'switch_statements' ),
        new MethodTest( ifelse_statements, null, 'ifelse_statements' ),
        new MethodTest( ifelse_strict_equality_statements, null, 'ifelse_strict_equality_statements' )
      ];
    }

    protected function init() :void
    {
      array = ['TOP','RIGHT','BOTTOM','LEFT' ];
    }

    public function tare() :void
    {
      var value :String;
      for( var i :uint = 0; i < loops; ++i )
      {
        array[ Math.floor( Math.random() * 4 ) ];
      }
      value = '';
    }

    public function switch_statements() :void
    {
      var value :String;
      for( var i :uint = 0; i < loops; ++i )
      {
        var str :String = array[ Math.floor( Math.random() * 4 ) ];

        switch( str )
        {
          case 'TOP':
            value = str;
          break;

          case 'RIGHT':
            value = str;
          break;

          case 'BOTTOM':
            value = str;
          break;

          case 'LEFT':
          default:
            value = str;
          break;
        }
      }
    }

    public function ifelse_statements() :void
    {
      var value :String;
      for( var i :uint = 0; i < loops; ++i )
      {
        var str :String = array[ Math.floor( Math.random() * 4 ) ];

        if( str == 'TOP' )
          value = str;
        else if( str == 'RIGHT' )
          value = str;
        else if( str == 'BOTTOM' )
          value = str;
        else
          value = str;
      }
    }

    public function ifelse_strict_equality_statements() :void
    {
      var value :String;
      for( var i :uint = 0; i < loops; ++i )
      {
        var str :String = array[ Math.floor( Math.random() * 4 ) ];

        if( str === 'TOP' )
          value = str;
        else if( str === 'RIGHT' )
          value = str;
        else if( str === 'BOTTOM' )
          value = str;
        else
          value = str;
      }
    }
  }
}

