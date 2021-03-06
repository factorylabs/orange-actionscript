
package barebones
{
  import com.factorylabs.orange.core.IDisposable;

  import flash.display.MovieClip;
  import flash.display.Stage;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;
  import flash.events.Event;

  /**
   * Generates a basic hello world class.
   *
   * <hr />
   * <p><a href="http://github.com/factorylabs/orange-actionscript/blob/asunit/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Sean Dougherty
   * @version   1.0.0 :: Oct 22, 2009
   */
  public class Main
    extends MovieClip
      implements IDisposable
  {

    public function Main()
    {
      stop();
      if ( parent is Stage )
        initialize();
      else
        addEventListener( Event.ADDED_TO_STAGE, onStageAdd );
    }

    override public function toString() :String
    {
      return 'barebones.Main';
    }

    public function dispose() :void
    {
      removeEventListener( Event.REMOVED_FROM_STAGE, onStageRemoval );
    }

    protected function initialize() :void
    {
      trace( '[Main].initialize() => initializing application' );
      addEventListener( Event.REMOVED_FROM_STAGE, onStageRemoval );
      setStageModes();
      startup();
    }

    protected function setStageModes() :void
    {
      stage.scaleMode = StageScaleMode.NO_SCALE;
      stage.align = StageAlign.TOP_LEFT;
    }

    protected function startup() :void
    {
      trace( '[Main].startup() => starting application' );
    }

    private function onStageAdd( $e :Event ) :void
    {
      removeEventListener( Event.ADDED_TO_STAGE, onStageAdd );
      initialize();
    }

    private function onStageRemoval( $e :Event ) :void
    {
      dispose();
    }
  }
}

