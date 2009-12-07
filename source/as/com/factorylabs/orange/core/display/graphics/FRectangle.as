package com.factorylabs.orange.core.display.graphics {	import com.factorylabs.orange.core.display.fills.IFill;	import flash.display.Graphics;	/**	 * Draws a rectangle shape.	 *	 * <hr />	 * <p>Copyright 2004-2009 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p>	 *	 * Permission is hereby granted, free of charge, to any person obtaining	 * a copy of this software and associated documentation files (the	 * "Software"), to deal in the Software without restriction, including	 * without limitation the rights to use, copy, modify, merge, publish,	 * distribute, sublicense, and/or sell copies of the Software, and to	 * permit persons to whom the Software is furnished to do so, subject to	 * the following conditions:<br /><br />	 *	 * The above copyright notice and this permission notice shall be	 * included in all copies or substantial portions of the Software.<br /><br />	 *	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Jun 3, 2008	 */	public class FRectangle		extends Graphic	{		/**		 * Constructs and draws a rectangle shape.		 * @param $gfx			Reference to the <code>shape.graphics</code> where the shape will be drawn into.		 * @param $x			A number indicating the horizontal position relative to the registration point of the parent display object.		 * @param $y			A number indicating the vertical position relative to the registration point of the parent display object.		 * @param $width		The <code>width</code> of the shape.		 * @param $height		The <code>height</code> of the shape.		 * @param $fill			Fill or line style to apply to the shape.		 * @param $center		Whether to draw the shape from a center registration.		 * @param $autoRedraw	Determines if the graphic should auto redraw when a setter is called.		 * 		 * @example The following code creates a rectangle.	 	 * <listing version="3.0" >	 	 * var sf :SolidFill = new SolidFill( 0x666666, .8 );	 	 * var r1 :FRectangle = new FRectangle( _gfx.graphics, 0, 0, 200, 100, sf );	 	 * </listing>		 */				public function FRectangle( $gfx :Graphics = null, $x :Number = 0, $y :Number = 0, $width :Number = 10, $height :Number = 10, $fill :IFill = null, $center :Boolean = false, $autoRedraw :Boolean = true )		{			super( $gfx, $x, $y, $width, $height, $fill, $center, $autoRedraw );			draw();		}				/**		 * @return	The string equivalent of this class.		 */				override public function toString() :String 		{			return 'com.factorylabs.orange.core.display.graphics.FRectangle';		}				/**		 * Draws the Rectangle.		 * @see http://help.adobe.com/en_US/AS3LCR/Flash_10.0/index.html drawRect()		 */		override protected function drawGraphic() : void		{			_gfx.drawRect( _x, _y, _width, _height );		}	}}