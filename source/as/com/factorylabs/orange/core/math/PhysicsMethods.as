package com.factorylabs.orange.core.math{	/** 	 * Methods for common physics algorithms. 	 *  	 * <p><strong><em>If performance and file size have super high priority, it is highly recommended to internalize 	 * one of these functions into the Class that needs it. Arithmetic is for nerds.</p></em></strong> 	 * 	 * <hr /> 	 * <p>Copyright 2004-2009 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p> 	 * 	 * Permission is hereby granted, free of charge, to any person obtaining 	 * a copy of this software and associated documentation files (the	 * "Software"), to deal in the Software without restriction, including	 * without limitation the rights to use, copy, modify, merge, publish,	 * distribute, sublicense, and/or sell copies of the Software, and to	 * permit persons to whom the Software is furnished to do so, subject to	 * the following conditions:<br /><br />	 *	 * The above copyright notice and this permission notice shall be	 * included in all copies or substantial portions of the Software.<br /><br />	 *	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 	 *	 * @author		Justin Gitlin	 * @version		1.0.0 :: ??	 * 	 * TODO Convert all use tags to example tags: http://livedocs.adobe.com/flex/3/html/help.html?content=asdoc_6.html – MK.	 */	final public class PhysicsMethods 	{		/**		 * Get the angle from coordinate 1 to coordinate 2.		 * @param $x1	the <code>x</code> coordinate of point 1.		 * @param $y1	the <code>y</code> coordinate of point 1.		 * @param $x2	the <code>x</code> coordinate of point 2.		 * @param $y2	the <code>y</code> coordinate of point 2.		 * @return		the angle from one point to another.		 * @use			{@code var vAngle:Number = PhysicsUtil.getAngleToTarget( 10, 20, 50, 70 );}		 */		public static function getAngleToTarget( $x1 :Number, $y1 :Number, $x2 :Number, $y2 :Number ) :Number 		{			return -Math.atan2( $x1 - $x2, $y1 - $y2 ) * 180 / Math.PI;		}			/**		 * Keep an angle between 0-360.		 * @param 	$angle	the angle we want to be sure is between 0 and 360.		 * @return	the constrained angle.		 * @use		{@code var vAngle:Number = PhysicsUtil.constrainAngle( -800 );}		 */		public static function constrainAngle( $angle :Number ) :Number		{			if( $angle < 0 )				$angle += 360;			else if( $angle > 360 )				$angle -= 360;			return $angle;		}				/**		 * Calculates the length of the unknown side of a right triangle, by supplying the 4 points that make up the 2 sides. This is the Pythagorean Theorem.		 * @param	$x1			the x1 point coordinate.		 * @param	$x2			the x2 point coordinate.		 * @param	$y1			the y1 point coordinate.		 * @param	$y2			the y2 point coordinate.		 * @return	the length of the unknown side.		 * @use		{@code var vHypotenuse:Number = MathUtil.getHypotenuse( 10, 20, 50, 70 );}		 */		public static function getHypotenuse( $x1 :Number, $y1 :Number, $x2 :Number, $y2 :Number ) :Number		{			return Math.sqrt( ( $x2 - $x1 ) * ( $x2 - $x1 ) + ( $y2 - $y1 ) * ( $y2 - $y1 ) );		}	}}