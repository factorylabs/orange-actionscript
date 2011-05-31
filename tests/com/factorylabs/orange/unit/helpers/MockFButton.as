
package com.factorylabs.orange.unit.helpers
{
  import com.factorylabs.orange.core.display.FButton;
  import com.factorylabs.orange.core.display.fills.SolidFill;
  import com.factorylabs.orange.core.display.graphics.FRectangle;

  import flash.display.DisplayObjectContainer;
  import flash.events.MouseEvent;

  /**
   * Basic display object for mocking an FButton subclass.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 8, 2010
   */
  public class MockFButton
    extends FButton
  {
    protected var _rect   :FRectangle;
    protected var _fill   :SolidFill;

    public function MockFButton( $container :DisplayObjectContainer = null, $init :Object = null )
    {
      super( $container, $init );
      init();
    }

    override public function toString() :String
    {
      return 'com.factorylabs.orange.unit.helpers.MockFButton';
    }

    override public function dispose() :void
    {
      super.dispose();
    }

    override protected function addListeners() :void
    {
      super.addListeners();
      addEventListener( MouseEvent.MOUSE_OVER, onMouseOver );
      addEventListener( MouseEvent.MOUSE_OUT, onMouseOut );
//      addEventListener( MouseEvent.ROLL_OVER, onRollOver );
//      addEventListener( MouseEvent.ROLL_OUT, onRollOut );
//      addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
//      addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
//      addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
//      addEventListener( MouseEvent.DOUBLE_CLICK, onDoubleClick );
//      addEventListener( MouseEvent.MOUSE_WHEEL, onMouseWheel );
    }

    override protected function removeListeners() :void
    {
      super.removeListeners();
      removeEventListener( MouseEvent.MOUSE_OVER, onMouseOver );
      removeEventListener( MouseEvent.MOUSE_OUT, onMouseOut );
//      removeEventListener( MouseEvent.ROLL_OVER, onRollOver );
//      removeEventListener( MouseEvent.ROLL_OUT, onRollOut );
//      removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
//      removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
//      removeEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
//      removeEventListener( MouseEvent.DOUBLE_CLICK, onDoubleClick );
//      removeEventListener( MouseEvent.MOUSE_WHEEL, onMouseWheel );
    }

    protected function init() :void
    {
      _fill = new SolidFill( 0xFF00FF, 1 );
      _rect = new FRectangle( graphics, 0, 0, 100, 25, _fill );
    }

    protected function draw( $color : uint ) :void
    {
      _fill.color = $color;
      graphics.clear();
      _rect.draw();
    }

    override protected function onClick( $e :MouseEvent ) :void
    {
      super.onClick( $e );
    }

    protected function onMouseOut( $e :MouseEvent ) :void
    {
      draw( 0xFF00FF );
    }

    protected function onMouseOver( $e :MouseEvent ) :void
    {
      draw( 0x000000 );
    }
  }
}

