
package com.factorylabs.orange.unit.core.logging
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import asunit4.async.addAsync;

  import com.factorylabs.orange.core.logging.LogLevels;
  import com.factorylabs.orange.core.logging.Logger;

  import org.osflash.signals.Signal;

  /**
   * Generate the test cases for the Logger class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Nov 16, 2009
   */
  public class LoggerTests
  {
    private var _logger :Logger;
    private var _signal :Signal;
    private var _msg  :String;
    private var _obj  :Object;
    private var _level  :String;
    private var _name :String;

    [Before]
    public function runBeforeEachTest():void
    {
      _logger = new Logger( '[Test Logger]' );
      _signal = _logger.signal;
      _msg = '';
      _obj = {};
      _level = '';
      _name = '[Test Logger]';
    }

    [After]
    public function runAfterEachTest():void
    {
      _signal.removeAll( );
      _signal = null;
      _logger = null;
    }

    [Test]
    public function isSilent() :void
    {
      assertFalse( _logger.isSilent );
      _logger.isSilent = true;
      assertTrue( _logger.isSilent );
    }

    [Test]
    public function name() :void
    {
      assertEquals( _logger.name, '[Test Logger]' );
      _logger.name = '[TEMP NAME Logger]';
      assertEquals( _logger.name, '[TEMP NAME Logger]' );
    }

    [Test(async)]
    public function trace() :void
    {
      _msg = '[LoggerTest].trace()';
      _obj = { x: 100 };
      _level = 'MK';

      _signal.add( addAsync( onCompleted, 10 ) );
      _logger.trace( _msg, _obj, _level );
    }

    [Test(async)]
    public function log() :void
    {
      _msg = '[LoggerTest].log()';
      _obj = { x: 100 };
      _level = LogLevels.LOG;

      _signal.add( addAsync( onCompleted, 10 ) );
      _logger.log( _msg, _obj );
    }

    [Test(async)]
    public function debug() :void
    {
      _msg = '[LoggerTest].debug()';
      _obj = { x: 100 };
      _level = LogLevels.DEBUG;

      _signal.add( addAsync( onCompleted, 10 ) );
      _logger.debug( _msg, _obj );
    }

    [Test(async)]
    public function info() :void
    {
      _msg = '[LoggerTest].info()';
      _obj = { x: 100 };
      _level = LogLevels.INFO;

      _signal.add( addAsync( onCompleted, 10 ) );
      _logger.info( _msg, _obj );
    }

    [Test(async)]
    public function warn() :void
    {
      _msg = '[LoggerTest].warn()';
      _obj = { x: 100 };
      _level = LogLevels.WARN;

      _signal.add( addAsync( onCompleted, 10 ) );
      _logger.warn( _msg, _obj );
    }

    [Test(async)]
    public function error() :void
    {
      _msg = '[LoggerTest].error()';
      _obj = { x: 100 };
      _level = LogLevels.ERROR;

      _signal.add( addAsync( onCompleted, 10 ) );
      _logger.error( _msg, _obj );
    }

    [Test(async)]
    public function fatal() :void
    {
      _msg = '[LoggerTest].fatal()';
      _obj = { x: 100 };
      _level = LogLevels.FATAL;

      _signal.add( addAsync( onCompleted, 10 ) );
      _logger.fatal( _msg, _obj );
    }

    [Test(async)]
    public function core() :void
    {
      _msg = '[LoggerTest].core()';
      _obj = { x: 100 };
      _level = LogLevels.CORE;

      _signal.add( addAsync( onCompleted, 10 ) );
      _logger.core( _msg, _obj );
    }

    private function onCompleted( $msg :String = '', $object :Object = null, $level :String = '', $name :String = '' ) :void
    {
      assertEquals( $msg, _msg );
      assertEquals( $object, _obj );
      assertEquals( $level, _level );
      assertEquals( $name, _name );
    }
  }
}

