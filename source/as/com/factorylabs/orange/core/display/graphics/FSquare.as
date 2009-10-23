
package com.factorylabs.orange.core.display.graphics 
{
	import com.factorylabs.orange.core.display.graphics.FRectangle;
	import com.factorylabs.orange.core.display.graphics.fills.IFill;	
	/**
	 * Draws a square shape.
	 * 
	 * <p>Copyright 2008 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Jun 3, 2008
	 */
		extends FRectangle 
	{
		
/* Constructor .....................................................................................*/	

		/**
		 * Constructs and draws a square.
		 * @param gfx			Reference to the <code>shape.graphics</code> where the shape will be drawn into.
		 * @param xp			A number indicating the horizontal position relative to the registration point of the parent display object.
		 * @param yp			A number indicating the vertical position relative to the registration point of the parent display object.
		 * @param vSize			The width and height of the shape.
		 * @param vFill			Fill or line style to apply the shape.
		 * @param vCenter		Whether to center the shape or not.
		 * @param vAutoRedraw	Determines if the graphic should auto redraw when a setter is called.
		 * 
		 * @example The following code creates a square.
	 	 * <listing version="3.0" >
	 	 * var sf : SolidFill = new SolidFill( 0x666666, .8 );
	 	 * var s1 : FSquare = new FSquare( _gfx.graphics, 0, 110, 200, sf );
	 	 * </listing>
		 */		
		{
			draw();
		}
		
/* Public Methods ..................................................................................*/
		
		/**
		 * @return	the string equivalent of this class.
		 */		
		override public function toString() : String 
		{
			return "com.factorylabs.orange.core.display.graphics.FSquare";
		}
	}