
package com.factorylabs.orange.core.display 
{
	import com.factorylabs.orange.core.collections.Map;

	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;

	/**
	 * Summary.
	 * 
	 * <p>Description.</p>
	 *
	 * <hr />
	 * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
	 * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
	 * 
	 * <p>Permission is hereby granted to use, modify, and distribute this file 
	 * in accordance with the terms of the license agreement accompanying it.</p>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Feb 8, 2010
	 */
	public class FButton
		extends FMovieClip
			implements IFButton
	{
		protected var _enabled		:Boolean = true;
		protected var _selected		:Boolean = false;
		protected var _highlighted	:Boolean = false;
		protected var _style		:IFButtonStyle;
		protected var _map			:Map;
		
		override public function get enabled() :Boolean { return _enabled; }
		override public function set enabled( $enabled :Boolean ) :void
		{
			super.enabled = $enabled;
			_enabled = $enabled;
			mouseEnabled = $enabled;
			buttonMode = $enabled;
			useHandCursor = $enabled;
			// set some button state
			// should the button state define the characteristics?
		}
		
		public function get selected() :Boolean { return _selected; }
		public function set selected( $selected :Boolean ) :void
		{
			_selected = $selected;
			// set some button state
		}
		
		public function get highlighted() :Boolean { return _highlighted; }
		public function set highlighted( $highlighted :Boolean ) :void
		{
			_highlighted = $highlighted;
			// set some button state
		}
		
		public function get style() :IFButtonStyle { return _style; }
		public function set style( $style :IFButtonStyle ) :void
		{
			_style = $style;
		}
		
		public function FButton( $style :IFButtonStyle = null, $container :DisplayObjectContainer = null, $init :Object = null ) 
		{
			mouseChildren = false;
			enabled = true;
			_style = $style;
			super( $container, $init );
			init();
		}
		
		override public function toString() :String 
		{
			return 'com.factorylabs.orange.core.display.FButton';
		}
		
		public function displayState( $type :String ) :Boolean
		{
			if( _map.hasKey( $type ) )
			{
				var func :Function = _style.map.get( $type );
				func( this );
				return true;
			}
			return false;
		}
		
		protected function init() :void
		{
			_map = _style.map;
			_style.init( this );
			addListeners();
		}

		protected function handleInteraction( $e :MouseEvent ) :void
		{
			displayState( $e.type );
		}
		
		protected function addListeners() :void
		{
			var keys :Array = _map.keys;
			var len :uint = keys.length;
			
			for( var i :uint = 0; i < len; ++i )
			{
				addEventListener( String( keys[ i ] ), handleInteraction );
			}
			
//			Do we need a separate map for states?
//			Is there a special case for MouseEvent.CLICK -- especially if we make it a signal?
//			Need to make sure we remove listeners as well. do we use a janitor?
			
//			addEventListener( MouseEvent.CLICK, handleInteraction );
//			addEventListener( MouseEvent.MOUSE_DOWN, handleInteraction );
//			addEventListener( MouseEvent.MOUSE_MOVE, handleInteraction );
//			addEventListener( MouseEvent.MOUSE_UP, handleInteraction );
//			addEventListener( MouseEvent.MOUSE_OVER, handleInteraction );
//			addEventListener( MouseEvent.MOUSE_OUT, handleInteraction );
//			addEventListener( MouseEvent.ROLL_OVER, handleInteraction );
//			addEventListener( MouseEvent.ROLL_OUT, handleInteraction );
//			addEventListener( MouseEvent.DOUBLE_CLICK, handleInteraction );
//			addEventListener( MouseEvent.MOUSE_WHEEL, handleInteraction );
		}
	}
}
