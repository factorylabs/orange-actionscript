
package com.factorylabs.orange.core.display.graphics 
{	import flash.display.Graphics;
	import flash.errors.IllegalOperationError;
	
	import com.factorylabs.orange.core.display.graphics.fills.IFill;
	import com.factorylabs.orange.core.display.graphics.fills.SolidFill;		

	/**
	 * Graphic handles the basic necessities for creating a shape.
	 * 
	 * This is an abstract base class and is never instatiated.
	 * 
	 * <p>Copyright 2008 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Jun 3, 2008
	 */	internal class Graphic
		implements IGraphic
	{
		
/* Properties ......................................................................................*/
		
		protected var _gfx : Graphics;
		protected var _x : Number;
		protected var _y : Number;
		protected var _w : Number;
		protected var _h : Number;
		protected var _fill : IFill;
		protected var _center : Boolean;
		protected var _autoRedraw : Boolean;
		protected static const DEFAULT_FILL : SolidFill = new SolidFill();
		
/* Getters/Setters .................................................................................*/
		
		/**
		 * @return	x coordinate of the Graphic.
		 */
		public function get x() : Number
		{
			return _x;
		}
		
		public function set x( xp : Number ) : void
		{
			_x = xp;
			if( _autoRedraw ) redraw();
		}
		
		/**
		 * @return	y coordiante of the Graphic.
		 */
		public function get y() : Number
		{
			return _y;
		}
		
		public function set y( yp : Number ) : void
		{
			_y = yp;
			if( _autoRedraw ) redraw();
		}
		
		/**
		 * @return	width of the Graphic.
		 */
		public function get width() : Number
		{
			return _w;
		}
		
		public function set width( wv : Number ) : void
		{
			_w = wv;
			if( _autoRedraw ) redraw();
		}
		
		/**
		 * @return	height of the Graphic.
		 */
		public function get height() : Number
		{
			return _h;
		}
		
		public function set height( hv : Number ) : void
		{
			_h = hv;
			if( _autoRedraw ) redraw();
		}
		
		/**
		 * @return	offsets the drawing of the shape.
		 */
		public function get center() : Boolean
		{
			return _center;
		}
		
		public function set center( vCenter : Boolean ) : void
		{
			_center = vCenter;
			if( _autoRedraw ) redraw();
		}
		
		/**
		 * @return	whether the graphic automatically redraws on a property setter. 
		 */
		public function get autoRedraw() : Boolean
		{
			return _autoRedraw;
		}
		
		public function set autoRedraw( vAutoRedraw : Boolean ) : void
		{
			_autoRedraw = vAutoRedraw;
		}
		
		/**
		 * @return	fill or stroke for the Graphic.
		 */
		public function get fill() : IFill
		{
			return _fill;
		}
		
		public function set fill( vFill : IFill ) : void
		{
			_fill = vFill;
			if( _autoRedraw ) redraw();
		}

/* Constructor .....................................................................................*/		
		/**
		 * Base Constructor for setting and saving properties.
		 * @param gfx			Reference to the <code>shape.graphics</code> where the shape will be drawn into.
		 * @param xp			A number indicating the horizontal position relative to the registration point of the parent display object.
		 * @param yp			A number indicating the vertical position relative to the registration point of the parent display object.
		 * @param wv			The width of the shape.
		 * @param hv			The height of the shape.
		 * @param vFill			Fill or line style to apply the shape.
		 * @param vCenter		Whether to center the shape or not.
		 * @param vAutoRedraw	Determines if the graphic should auto redraw when a setter is called.
		 */		public function Graphic( gfx : Graphics, xp : Number = 0, yp : Number = 0, wv : Number = 10, hv : Number = 10, vFill : IFill = null, vCenter : Boolean = false, vAutoRedraw : Boolean = true ) 
		{
			_gfx = gfx;
			_x = xp;
			_y = yp;
			_w = wv;
			_h = hv;
			_fill = ( vFill != null ) ? vFill : DEFAULT_FILL;
			_center = vCenter;
			_autoRedraw = vAutoRedraw;
		}
		
/* Public Methods ..................................................................................*/
		
		/**
		 * @return	the string equivalent of this class.
		 */
		public function toString() : String 
		{
			return "com.factorylabs.orange.core.display.graphics.Graphic";
		}
		
		/**
		 * Redraws the shape. If the <code>autoRedraw</code> property is set to true, a setter will automatically call this method.
		 * Note this will call <code>clear()</code> on the <code>shape.graphics</code> object and clear all existing grapics witihin that object. 
		 * 
		 * @example The following code draws then redraws a rectangle.
	 	 * <listing version="3.0" >
	 	 * var sf : SolidFill = new SolidFill( 0x666666, .8 );
	 	 * var r1 : FRectangle = new FRectangle( _gfx.graphics, 0, 0, 200, 100, sf );
	 	 * r1.width = 500;
	 	 * r1.redraw();
	 	 * </listing>
		 */
		public function redraw() : void
		{
			_gfx.clear();
			draw();
		}
		
/* Protected Methods ...............................................................................*/		
		
		/**
		 * Calls subroutines for starting a fill/stroke, drawing the shape, and closing the fill/stroke. 
		 */
		protected function draw() : void
		{
			if( _center == true ) offset();
			_fill.beginFill( _gfx, this );
			drawGraphic();
			_fill.endFill( _gfx );
		}
		
		/**
		 * Handles drawing the shape.
		 * @throws	flash.errors.IllegalOperationError Method must be overridden by a subclass.
		 */
		protected function drawGraphic() : void
		{
			throw new IllegalOperationError( toString() + " : the drawGraphic() method must be invoked by a subclass." );
		}		
		/**
		 * Handles drawing the offset from center.
		 */		protected function offset() : void
		{
			_x -= _w / 2;
			_y -= _h / 2;
		}
	}}