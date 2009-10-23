package com.factorylabs.orange.core.display.graphics {	import flash.display.Graphics;		import com.factorylabs.orange.core.display.graphics.Graphic;	import com.factorylabs.orange.core.display.graphics.fills.IFill;		/**	 * Draws an Ellipse.	 * 	 * <p>Copyright 2008 by Factory Design Labs, All Rights Reserved.</p>	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Jun 3, 2008	 */	public class FEllipse		extends Graphic 	{		/* Constructor .....................................................................................*/			/**		 * Constructs and draws a new Ellipse shape.		 * @param gfx			Reference to the <code>shape.graphics</code> where the shape will be drawn into.		 * @param xp			A number indicating the horizontal position relative to the registration point of the parent display object.		 * @param yp			A number indicating the vertical position relative to the registration point of the parent display object.		 * @param wv			The width of the shape.		 * @param hv			The height of the shape.		 * @param vFill			Fill or line style to apply the shape.		 * @param vCenter		Whether to center the shape or not.		 * @param vAutoRedraw	Determines if the graphic should auto redraw when a setter is called.		 * 		 * @example The following code creates an ellipse.	 	 * <listing version="3.0" >	 	 * var sf : SolidFill = new SolidFill( 0x666666, .8 );	 	 * var e1 : FEllipse = new FEllipse( _gfx.graphics, 0, 0, 200, 100, sf );	 	 * </listing>		 */				public function FEllipse( gfx : Graphics, xp : Number = 0, yp : Number = 0, wv : Number = 10, hv : Number = 10, vFill : IFill = null, vCenter : Boolean = false, vAutoRedraw : Boolean = true )		{			super( gfx, xp, yp, wv, hv, vFill, vCenter, vAutoRedraw );			draw();		}		/* Public Methods ..................................................................................*/						/**		 * @return	the string equivalent of this class.		 */		override public function toString() : String 		{			return "com.factorylabs.orange.core.display.graphics.FEllipse";		}/* Protected Methods ...............................................................................*/				/**		 * Draws the ellipse.		 * @see http://livedocs.adobe.com/flash/9.0/ActionScriptLangRefV3/flash/display/Graphics.html#drawEllipse()		 */		override protected function drawGraphic() : void		{			_gfx.drawEllipse( _x, _y, _w, _h );		}	}}