/**
 *	Aligns the display object container for the application.
 *
 *	<p>Uses an align property passed in to compare stage width/height to an applications width and height to determine how to position the container view.
 *	Data concerning the alignment can be passed in through CSS or an object by the creator class. The data should primarily overide the existing properties associated here.
 *	This class primarily responds only to the StageInfo class events. It is possible to subclass this to add more details for aligning. 
 *	It is also possible to subclass and overide the redraw method for positioning not only the container, but drawing in a simple background into the container view.</p>
 *
 *	<p>Available alignment properties are:
 *	( TOP || T ), ( TOP_LEFT || TL ), ( CENTER || C ), ( LEFT || L ), ( RIGHT || R ), ( TOP_RIGHT || TR ), ( BOTTOM || B ), ( BOTTOM_LEFT || BL ), ( BOTTOM_RIGHT || BR ). * defaults to TOP.</p>
 *
 *	Copyright 2007 by Factory Design Labs, All Rights Reserved.
 *	<a href="http://www.factorylabs.com/">www.factorylabs.com</a>
 *
 *	@example		The following is an example usage of this class:
 *	<listing version="3.0">
 *		// Get the StageAlignment instance and initialize with the container to align.
 *		StageAlignment.getInstance().initialize( _appContainer );
 *	</listing>
 *
 *	@author 		Matthew Kitt, Grant Davis
 *	@version		1.0.0 :: 10.31.2007
 *	@version		1.1.0 :: March, 9 2009	 :: Removed the dependency to Configuration, initialization must have a width, height, alignment position, and padding provided.
 *	@since			1.0.0
 */
package com.factorylabs.orange.core.display.stage
{	import flash.display.DisplayObject;	import flash.display.Stage;	import flash.events.Event;	
	public class StageAlignment 
	{
/* Properties ......................................................................................*/		

		/**
		 * Singleton instance of this class.
		 */
		protected static var _instance:StageAlignment;
		
		/**
		 * Container to align.
		 */
		protected var _container:DisplayObject;
		
		/**
		 * Reference to stage object. 
		 */
		protected var _stage:Stage;
		
		/**
		 * Reference to object which contains information on stage width, and x and y position relative to the 0,0 of the application.
		 */
		protected var _stageInfo:StageInfo;
		
		/**
		 * String reprenstation of the align mode.
		 */
		protected var _align:String;
		
		/**
		 * Width of the application as defined in Configuration.
		 */
		protected var _appWidth:int;
		
		/**
		 * Height of the application as defined in Configuration.
		 */
		protected var _appHeight:int;
		
		/**
		 *	Top offset margin (defaults to 0).
		 */
		protected var _paddingTop:Number;
		
		/**
		 *	Bottom offset margin (defaults to 0).
		 */
		protected var _paddingBottom:Number;
		
		/**
		 *	Left offset margin (defaults to 0).
		 */
		protected var _paddingLeft:Number;
		
		/**
		 *	Right offset margin (defaults to 0).
		 */
		protected var _paddingRight:Number;

/* Constructor ......................................................................................*/
		
		/**
		 * Singleton constructor. 
		 */
		public function StageAlignment ( enforcer:SingletonEnforcer ):void {}
		
/* Singleton Instance Accessor ......................................................................................*/
		
		/**
		 * Singleton accessor method.
		 * 
		 * <p>Use this method to return the single instance of this object. Below is an example
		 * of using the getInstance() method:</p>
		 * 
		 * <listing>
		 * var instance:StageAlignment = StageAlignment.getInstance();
		 * </listing>
		 * 
		 * @return 	The single instance of StageAlignment
		 */
		public static function get instance() :StageAlignment { return getInstance(); }
		public static function getInstance():StageAlignment
		{
			if ( _instance == null ) _instance = new StageAlignment( new SingletonEnforcer() );
			return _instance;	
		}
		
/* Public Methods ......................................................................................*/		
		
		/**
		 * Entry point of the class. This method must be called with a reference to 
		 * a container display object to align. 
		 * 
		 * @param container 	DisplayObject to align to the stage. 
		 * @param v_appWidth 	The default application width.
		 * @param v_appHeight	The default application height.
		 * @param v_align		The string position on how to center the application.
		 * @param v_padding		The amount of left, right, top and bottom padding to provide around the application.
		 * 
		 * <listing version="3.0" >
		 * // first time call to initialize the StageAlignment object:
		 * StageAlignment.getInstance().initialize( _appContainer, 980, 580, "TOP_LEFT", "10, 10, 10, 10" );  
		 * </listing>
		 */
		public function initialize( container:DisplayObject, v_appWidth :int, v_appHeight :int, v_align :String = "TOP", v_padding :String = "0,0,0,0" ):void
		{
			_container = container;
			_align = v_align.toUpperCase(); 
			
			_stageInfo = StageInfo.getInstance();
			
			_stage = _container.stage;
			_stage.addEventListener( Event.RESIZE, onResize );
			
			_appWidth = v_appWidth;
			_appHeight = v_appHeight;
			
			var padding:Array = v_padding.split( "," );
			_paddingTop = ( padding[ 0 ] == null ) ? 0 : padding[ 0 ];
			_paddingRight = ( padding[ 1 ] == null ) ? 0 : padding[ 1 ];
			_paddingBottom = ( padding[ 2 ] == null ) ? 0 : padding[ 2 ];
			_paddingLeft = ( padding[ 3 ] == null ) ? 0 : padding[ 3 ];
			
			onResize( null );
		}

/* Private Methods ......................................................................................*/
		
		/**
		 *	Calculate coordinates for the container based on the type of alignment.
		 */
		protected function calculatePosition():void
		{
			var x:Number = 0;
			var y:Number = 0;
			
			switch ( _align )
			{
				case "TOP" :
				case "T" :
					x = alignHorizontalCenter();
					y = alignVerticalTop();
					break;
				
				case "TOP_LEFT" :
				case "TL" :
					x = alignHorizontalLeft();
					y = alignVerticalTop();
					break;
				
				case "CENTER" :
				case "C" :
					x = alignHorizontalCenter();
					y = alignVerticalCenter();
					break;
				
				case "LEFT" :
				case "L" :
					x = alignHorizontalLeft();
					y = alignVerticalCenter();
					break;
				
				case "RIGHT" :
				case "R" :
					x = alignHorizontalRight();
					y = alignVerticalCenter();
					break;
				
				case "TOP_RIGHT" :
				case "TR" :
					x = alignHorizontalRight();
					y = alignVerticalTop();
					break;
				
				case "BOTTOM" :
				case "B" :
					x = alignHorizontalCenter();
					y = alignVerticalBottom();
					break;
				
				case "BOTTOM_LEFT" :
				case "BL" :
					x = alignHorizontalLeft();
					y = alignVerticalBottom();
					break;
				
				case "BOTTOM_RIGHT" :
				case "BR" :
					x = alignHorizontalRight();
					y = alignVerticalBottom();
					break;
				
				default :
					x = alignHorizontalCenter();
					y = alignVerticalTop();
					break;
			}
			redraw( x, y );
		}
		
		/**
		 *	Position the container to the specified coordinates.
		 *	@param	x		x coordinate.
		 *	@param	y		y coordinate.
		 */
		protected function redraw( x:int, y:int ):void
		{
			_container.x = x;
			_container.y = y;
		}
		
		/**
		 *	@return	offset of the center horizontal position including padding.
		 */
		protected function alignHorizontalCenter():int
		{
			var cenX:int = ( _stageInfo.stageWidth / 2 ) - ( _appWidth / 2 ) + _stageInfo.stageX;
			return int( cenX + _paddingLeft );
		}
		
		/**
		 *	@return	offset of the horizontal left padding.
		 */
		protected function alignHorizontalLeft():int
		{
			return int( _paddingLeft + _stageInfo.stageX );
		}
		
		/**
		 *	@return	offset of the horizontal right padding - the available width.
		 */
		protected function alignHorizontalRight():int
		{
			return int( ( _stageInfo.stageWidth - _appWidth ) - _paddingRight + _stageInfo.stageX );
		}
		
		/**
		 *	@return	offset of the center vertical position including padding.
		 */
		protected function alignVerticalCenter():int
		{
			var cenY:int = Math.ceil( ( _appHeight / 2 ) - ( _stageInfo.stageHeight / 2 ) ) - _stageInfo.stageY;
			return int( cenY + _paddingTop );
		}
		
		/**
		 *	@return	offset of the vertical top padding.
		 */
		protected function alignVerticalTop():int
		{
			return Math.ceil( _paddingTop + _stageInfo.stageY );
		}
		
		/**
		 *	@return	offset of the vertical bottom position - bottom padding.
		 */
		protected function alignVerticalBottom():int
		{
			return int(( _stageInfo.stageHeight - _appHeight ) - _paddingBottom + _stageInfo.stageY );
		}		
		
/* Handlers ......................................................................................*/

		/**
		 * Handles resize events from the stage and properly 
		 * adjusts placement of objects. 
		 */
		protected function onResize( evt:Event ):void
		{			
			calculatePosition();
		}
	}
}
/**
 * Internal type to enforce using getInstance() to create an instance of StageAlignment. 
 */
internal class SingletonEnforcer {}
