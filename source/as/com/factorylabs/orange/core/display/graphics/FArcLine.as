
package com.factorylabs.orange.core.display.graphics 
{	import flash.display.Graphics;
	
	import com.factorylabs.orange.core.display.graphics.fills.IFill;	

	/**
	 * Draws an arced line.
	 * 
	 * This Graphic only handles a line style type and not a fill. 
	 * 
	 * <p>Copyright 2008 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Jun 3, 2008
	 */	public class FArcLine
		extends Graphic 
	{
/* Properties ......................................................................................*/
		
		protected var _radiusX : Number;
		protected var _radiusY : Number;
		protected var _angle : Number;
		
/* Getters/Setters .................................................................................*/
		
		/**
		 * @return	the x radius for the arc.
		 */
		public function get radiusX() : Number
		{
			return _radiusX;
		}
		
		public function set radiusX( vRadiusX : Number ) : void
		{
			_radiusX = vRadiusX;
			if( _autoRedraw ) redraw();
		}
		
		/**
		 * @return	the y radius for the arc.
		 */
		public function get radiusY() : Number
		{
			return _radiusY;
		}
		
		public function set radiusY( vRadiusY : Number ) : void
		{
			_radiusY = vRadiusY;
			if( _autoRedraw ) redraw();
		}
		
		/**
		 * @return	the angle for the arc.
		 */
		public function get angle() : Number
		{
			return _angle;
		}
		
		public function set angle( vAngle : Number ) : void
		{
			_angle = vAngle;
			if( _autoRedraw ) redraw();
		}
		
/* Constructor .....................................................................................*/	
		
		/**
		 * Constructs and draws a new arced line (only supports line styles and not fills).
		 * @param gfx			Reference to the <code>shape.graphics</code> where the shape will be drawn into.
		 * @param xp			A number indicating the horizontal position relative to the registration point of the parent display object.
		 * @param yp			A number indicating the vertical position relative to the registration point of the parent display object.
		 * @param vRadiusX		Radius for the x axis.		
		 * @param vRadiusY		Radius for the y axis	
		 * @param vAngle		Angle to draw the arc (negative numbers draw clockwise).
		 * @param vFill			Fill or line style to apply the shape.
		 * @param vAutoRedraw	Determines if the graphic should auto redraw when a setter is called.
		 * 
		 * @example The following code creates an arced line. 
	 	 * <listing version="3.0" >
	 	 * var ss : SolidStroke = new SolidStroke( 0xcccccc, 1, 3, true );
	 	 * var al : FArcLine = new FArcLine( _gfx.graphics, 500, 200, 50, 100, -210, ss );
	 	 * </listing>
		 */
		public function FArcLine( gfx : Graphics, xp : Number = 0, yp : Number = 0, vRadiusX : Number = 0, vRadiusY : Number = 0, vAngle : Number = 0, vFill : IFill = null, vAutoRedraw : Boolean = true ) 
		{
			super( gfx, xp, yp, vRadiusX * 2, vRadiusY * 2, vFill, false, vAutoRedraw );
			_radiusX = vRadiusX;
			_radiusY = vRadiusY;
			_angle = vAngle;
			draw();
		}
		
/* Public Methods ..................................................................................*/
		
		/**
		 * @return	the string equivalent of this class.
		 */
		override public function toString() : String 
		{
			return "com.factorylabs.orange.core.display.graphics.FArcLine";
		}

/* Protected Methods ...............................................................................*/
		
		/**
		 * Procedure for drawing an arc.
		 */
		override protected function drawGraphic() : void
		{
			//start out the arc.
			_gfx.moveTo( _x, _y );
			
			// no sense in drawing more than is needed.
			if( Math.abs( _angle ) > 360 ) _angle = 360;
			
			// Flash uses 8 segments per circle, to match that, we draw in a maximum of 45 degree segments.
			var segments : Number = Math.ceil( Math.abs( _angle ) / 45 );
			
			// Now calculate the sweep of each segment.
			var segAngle : Number = _angle / segments;
			
			// The math requires radians rather than degrees. 
			var theta : Number = -( segAngle / 180 ) * Math.PI;
			
			// convert angle startAngle to radians.
			var aangle : Number = -( _angle / 180 ) * Math.PI;
			
			// find our starting points (ax,ay) relative to the secified x,y.
			var ax : Number = _x - Math.cos( angle ) * _radiusX;
			var ay : Number = _y - Math.sin( angle ) * _radiusY;
			
			// if our arc is larger than 45 degrees, draw as 45 degree segments.
			for ( var i : int = 0; i < segments ; i++ ) 
			{
				// increment our angle.
				aangle += theta;
				
				// find the angle halfway between the last angle and the new.
				var angleMiddle : Number = aangle - ( theta / 2 );
				
				// calculate our end point.
				var bx : Number = ax + Math.cos( aangle ) * _radiusX;
				var by : Number = ay + Math.sin( aangle ) * _radiusY;
				
				// calculate our control point.
				var cx : Number = ax + Math.cos( angleMiddle ) * ( _radiusX / Math.cos( theta / 2 ) );
				var cy : Number = ay + Math.sin( angleMiddle ) * ( _radiusY / Math.cos( theta / 2 ) );
				
				// draw the arc segment.
				_gfx.curveTo( cx, cy, bx, by );
			}
		}
	}}