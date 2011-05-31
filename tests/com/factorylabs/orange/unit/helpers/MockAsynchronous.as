
package com.factorylabs.orange.unit.helpers
{
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.IEventDispatcher;
  import flash.utils.setTimeout;

  /**
   * Handles mocking an asynchronous event based on a setTimeout call with and on complete event.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 5, 2010
   */
  public class MockAsynchronous
    extends EventDispatcher
  {

    public function MockAsynchronous( $target :IEventDispatcher = null )
    {
      super( $target );
    }

    public function asyncMethod( $timeout :Number = 10 ) :void
    {
      setTimeout( function():void { dispatchEvent( new Event( Event.COMPLETE ) ); }, $timeout );
    }
  }
}

