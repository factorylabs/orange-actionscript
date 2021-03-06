
package com.factorylabs.orange.performance.runners
{
  import com.gskinner.performance.AbstractTest;
  import com.gskinner.performance.MethodTest;
  import com.gskinner.performance.PerformanceTest;
  import com.gskinner.performance.TestSuite;

  import flash.events.Event;

  /**
   * Logs the performance test results as simple strings for easier legibility when comparing results.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 7, 2010
   */
  public class FTextLog
  {
    public var out :Function = trace;
    public var text :String;

    protected var _div :String;
    protected var _performanceTest :PerformanceTest;
    protected var _currentTestSuite :TestSuite;

    public function FTextLog( $performanceTest :PerformanceTest = null )
    {
      _performanceTest = $performanceTest || PerformanceTest.getInstance();
      _performanceTest.addEventListener( Event.COMPLETE, handleComplete );
      _performanceTest.addEventListener( Event.CLOSE, handleClose );
      text = '';
      _div = '';
      while( _div.length < 100 )
        _div += '–';
    }

    public function toString() :String
    {
      return 'com.factorylabs.orange.performance.runners.FTextLog';
    }

    protected function handleComplete( $e :Event ) :void
    {
      var pf :PerformanceTest = _performanceTest;
      if( pf.currentTestSuite != _currentTestSuite )
      {
        _currentTestSuite = pf.currentTestSuite;
        if( _currentTestSuite )
          formatTestSuiteLog();
      }
      formatCurrentTest();
    }

    protected function handleClose( $e :Event ) :void
    {
      log( _div + '\n\n' );
    }

    protected function formatTestSuiteLog() :void
    {
      var ts :TestSuite = _currentTestSuite;
      var str :String = '\n' + _div + '\n';
      str += ts.name + ' (' + ts.tests.length + ' tests :: ' + ts.iterations + ' iterations)';
      if( ts.description )
        str += '\n' + ts.description;
      str += '\n\n';
      str += pad( 'Method', 42, '.' );
      str += pad( 'Time', 9, '.' );
      str += pad( 'Min', 8, '.' );
      str += pad( 'Max', 8, '.' );
      str += pad( 'Deviation', 14, '.' );
      str += pad( 'Memory', 11, '.' );
      str += pad( 'Retained', 8, '.' );
      log( str );
    }

    protected function formatCurrentTest() :void
    {
      var ct :AbstractTest = _performanceTest.currentTest;
      var str :String = '\n';
      str += pad( ct.name, 42 );
      str += pad( ct.time, 9 );
      str += pad( ct.min, 8 );
      str += pad( ct.max, 8 );
      str += pad( Math.round( ct.deviation / .001 ) * .001, 14 );
      try
      {
        var mt :MethodTest = MethodTest( ct );
        str += pad( mt.memory, 11 );
        str += pad( mt.retainedMemory, 11 );
      }
      catch(error:Error)
      {
        str += pad( 'N/A', 11 );
        str += pad( 'N/A', 11 );
      }
      log( str );
    }

    protected function log( $str :String ) :void
    {
      if( text.length > 0 )
        text += '\n';
      text += $str;
      out( $str );
    }

    protected function pad( $str :*, $cols :uint, $char :String = ' ' ) :String
    {
      var str :String = String( $str );
      if( str.length > $cols )
        return str.substr( 0, $cols );
      while( str.length < $cols )
        str = str + $char;
      return str;
    }
  }
}

