
package com.factorylabs.orange.core.display.graphics 
{	import flash.display.Graphics;
	
	import com.factorylabs.orange.core.display.graphics.fills.IFill;	

	/**
	 * Draws a dashed line (only supports line styles and not fills).
	 * 
	 * This Graphic only handles a line style type and not a fill.
	 * 
	 * <p>Copyright 2008 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Jun 3, 2008
	 */	public class FDashedLine 
		extends Graphic 
	{
/* Properties ......................................................................................*/
		
		protected var _endX : Number;
		protected var _endY : Number;
		protected var _dashLength : Number;
		protected var _gapLength : Number;
		
/* Getters/Setters .................................................................................*/
		
		/**
		 * @return	final x position for the line.
		 */
		public function get endX() : Number
		{
			return _endX;
		}
		
		public function set endX( vEndX : Number ) : void
		{
			_endX = vEndX;
			if( _autoRedraw ) redraw();
		}
		
		/**
		 * @return	final y position for the line.
		 */
		public function get endY() : Number
		{
			return _endY;
		}
		
		public function set endY( vEndY : Number ) : void
		{
			_endY = vEndY;
			if( _autoRedraw ) redraw();
		}
		
		/**
		 * @return	the length of each dash segment.
		 */
		public function get dashLength() : Number
		{
			return _dashLength;
		}
		
		public function set dashLength( vDashLength : Number ) : void
		{
			_dashLength = vDashLength;
			if( _autoRedraw ) redraw();
		}
		
		/**
		 * @return	the length of space between each segment.
		 */
		public function get gapLength() : Number
		{
			return _gapLength;
		}
		
		public function set gapLength( vGapLength : Number ) : void
		{
			_gapLength = vGapLength;
			if( _autoRedraw ) redraw();
		}

/* Constructor .....................................................................................*/	

		/**
		 * Constructs and draws a new dashed line.
		 * @param gfx			Reference to the <code>shape.graphics</code> where the shape will be drawn into.
		 * @param vInitX		Start <code>x</code> coordinate value to draw the shape.
		 * @param vInitY		Start <code>y</code> coordinate value to draw the shape.
		 * @param vEndX			End <code>x</code> coordinate value to draw the shape.
		 * @param vEndY			End <code>y</code> coordinate value to draw the shape.
		 * @param vDashLength	Length of each dash segment.
		 * @param vGapLength	Length of space between each dash segment.
		 * @param vFill			Fill or line style to apply the shape.
		 * @param vAutoRedraw	Determines if the graphic should auto redraw when a setter is called.
		 * 
		 * @example The following code creates a dashed line.
	 	 * <listing version="3.0" >
	 	 * var ss : SolidStroke = new SolidStroke( 0xcccccc, 1, 3 );
	 	 * var dl : FDashedLine = new FDashedLine( _gfx.graphics, 0, 0, 500, 0, 5, 5, ss );
	 	 * </listing>
		 */		
		public function FDashedLine( gfx : Graphics, vInitX : Number = 0, vInitY : Number = 0, vEndX : Number = 10, vEndY : Number = 0, vDashLength : Number = 1, vGapLength : Number = 1, vFill : IFill = null, vAutoRedraw : Boolean = true ) 
		{
			super( gfx, vInitX, vInitY, Math.abs( _x - _endX ), Math.abs( _y - _endY ), vFill, false, vAutoRedraw );
			_endX = vEndX;
			_endY = vEndY;
			_dashLength = vDashLength;
			_gapLength = vGapLength;
			draw();
		}
		
/* Public Methods ..................................................................................*/
		
		/**
		 * @return	the string equivalent of this class.
		 */
		override public function toString() : String 
		{
			return "com.factorylabs.orange.core.display.graphics.FDashedLine";
		}

/* Protected Methods ...............................................................................*/
		
		/**
		 * Procedure for drawing a dashed line.
		 */
		override protected function drawGraphic() : void
		{
			var deltax : Number = _endX - _x;
			var deltay : Number = _endY - _y;			
			var seglength : Number = _dashLength + _gapLength;
			var mainDelta : Number = Math.sqrt( ( deltax * deltax ) + ( deltay * deltay ) );
			var segs : Number = Math.floor( Math.abs( mainDelta / seglength ) );
			var radians : Number = Math.atan2( deltay, deltax );
			var cx : Number = _x;
			var cy : Number = _y;
			
			deltax = Math.cos( radians ) * seglength;
			deltay = Math.sin( radians ) * seglength;
			
			for ( var n : int = 0; n < segs ; n++ ) 
			{
				_gfx.moveTo( cx, cy );
				_gfx.lineTo( cx + Math.cos( radians ) * _dashLength, cy + Math.sin( radians ) * _dashLength );
				cx += deltax;
				cy += deltay;
			}
			
			_gfx.moveTo( cx, cy );
			mainDelta = Math.sqrt( ( _endX - cx ) * ( _endX - cx ) + ( _endY - cy ) * ( _endY - cy ) );
			
			if( mainDelta > dashLength )
				_gfx.lineTo( cx + Math.cos( radians ) * _dashLength, cy + Math.sin( radians ) * _dashLength );
			
			else if ( mainDelta > 0 ) 
				_gfx.lineTo( cx + Math.cos( radians ) * mainDelta, cy + Math.sin( radians ) * mainDelta );
			
			_gfx.moveTo( _endX, _endY );
		}	}}