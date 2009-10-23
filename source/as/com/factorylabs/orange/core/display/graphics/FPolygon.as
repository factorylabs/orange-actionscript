package com.factorylabs.orange.core.display.graphics {	import flash.display.Graphics;	import com.factorylabs.orange.core.display.graphics.fills.IFill;		/**	 * Draws a polygon shape with a minimum of 3 sides.	 * 	 * <p>Copyright 2008 by Factory Design Labs, All Rights Reserved.</p>	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Jun 3, 2008	 */	public class FPolygon		extends Graphic	{/* Properties ......................................................................................*/				protected var _sides : uint;		protected var _radius : Number;		protected var _angle : Number;/* Getters/Setters .................................................................................*/		/**		 * @return	the number of sides used by the polygon.		 */		public function get sides() : uint		{			return _sides;		}				public function set sides( vSides : uint ) : void		{			_sides = vSides;			if( _autoRedraw ) redraw();		}				/**		 * @return	the radius of the polygon.		 */		public function get radius() : Number		{			return _radius;		}				public function set radius( vRadius : Number ) : void		{			_radius = vRadius;			if( _autoRedraw ) redraw();		}				/**		 * @return	the rotation angle of the shape.		 */		public function get angle() : Number		{			return _angle;		}				public function set angle( vAngle : Number ) : void		{			_angle = vAngle;			if( _autoRedraw ) redraw();		}		/* Constructor .....................................................................................*/			/**		 * Constructs and draws a new polygon with a minimum of 3 sides.		 * @param gfx			Reference to the <code>shape.graphics</code> where the shape will be drawn into.		 * @param xp			A number indicating the horizontal position relative to the registration point of the parent display object.		 * @param yp			A number indicating the vertical position relative to the registration point of the parent display object.		 * @param vSides		The number of sides for the polygon.		 * @param vAngle		Rotation angle of the polygon. Valid values are between 0 and 360.		 * @param vFill			Fill or line style to apply the shape.		 * @param vCenter		Whether to center the shape or not. 		 * @param vAutoRedraw	Determines if the graphic should auto redraw when a setter is called.		 * 		 * @example The following code creates a 5 sided polygon.	 	 * <listing version="3.0" >	 	 * var sf : SolidFill = new SolidFill( 0x666666, .8 );	 	 * var p1 : FPolygon = new FPolygon( _gfx.graphics, 50, 0, 5, 50, 0, sf );	 	 * </listing>		 */				public function FPolygon( gfx : Graphics, xp : Number = 0, yp : Number = 0, vSides : uint = 3, vRadius : Number = 5, vAngle : Number = 0, vFill : IFill = null, vCenter : Boolean = false, vAutoRedraw : Boolean = true ) 		{			super( gfx, xp, yp, vRadius * 2, vRadius * 2, vFill, vCenter, vAutoRedraw );			_sides = vSides;			_radius = vRadius;			_angle = vAngle;			draw();		}		/* Public Methods ..................................................................................*/				/**		 * @return	the string equivalent of this class.		 */				override public function toString() : String 		{			return "com.factorylabs.orange.core.display.graphics.FPolygon";		}		/* Protected Methods ...............................................................................*/				/**		 * Procedure for drawing a polygon.		 */		override protected function drawGraphic() : void		{			_gfx.moveTo( 0, 0 );						// calculate span of sides and start point.			var step : Number = ( Math.PI * 2 ) / _sides;			var startPoint : Number = ( _angle * ( Math.PI / 180 ) );						// draw angles.			_gfx.moveTo( x + ( Math.cos( startPoint ) * _radius ), y - ( Math.sin( startPoint ) * _radius ) );			for ( var i : int = 1; i <= _sides ; i++ )			{				var dx : Number = x + Math.cos( startPoint + ( step * i ) ) * _radius;				var dy : Number = y - Math.sin( startPoint + ( step * i ) ) * _radius;				_gfx.lineTo( dx, dy );			}		}	}}