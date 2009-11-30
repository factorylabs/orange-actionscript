
package com.factorylabs.orange.core.display 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.display.DisplayObject;
	
	/**
	 * FDisplayObjectProperties allows you to gain access to additional properties of a <code>DisplayObject</code>.
	 * 
	 * <p>Use this class sparingly as it adds a good amount of weight to a class. If only minor manipulation needs to 
	 * occur, it is recommended to internalize some of the functions.</p>
	 *
	 * <hr />
	 * <p>Copyright 2004-2009 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p>
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining
	 * a copy of this software and associated documentation files (the
	 * "Software"), to deal in the Software without restriction, including
	 * without limitation the rights to use, copy, modify, merge, publish,
	 * distribute, sublicense, and/or sell copies of the Software, and to
	 * permit persons to whom the Software is furnished to do so, subject to
	 * the following conditions:<br /><br />
	 *
	 * The above copyright notice and this permission notice shall be
	 * included in all copies or substantial portions of the Software.<br /><br />
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 *
	 * @author		Sean Dougherty
	 * @author		Ryan Boyajian
	 * @version		1.0.0 :: Dec 17, 2008 
	 * @author		Matthew Kitt
	 * @version		2.0.0 :: Nov 29, 2009 :: Converted from FSpriteExtended and FMovieClipExtended. 
	 * TODO: Refactor offset so it performs more like CSS margins => left, top, right, bottom.
	 */
	public class FDisplayObjectProperties
	{
		private var _displayObject 	:DisplayObject;
		
		/**
		 * @private
		 */
		protected var _bounds	:Rectangle;
		
		/**
		 * @private
		 */
		protected var _offset	:Point;
		
		/**
		 * @return	The <code>DisplayObject</code> instance used for decoration.
		 */
		public function get displayObject() :DisplayObject
		{ 
			return _displayObject; 
		}
		
		/**
		 * @return	A <code>Rectangle</code> used for coordinates and sizing in place of an actual <code>DisplayObject</code>. 
		 */
		public function get bounds() :Rectangle { return _bounds; }
		public function set bounds( $bounds :Rectangle ) :void
		{
			_bounds = $bounds;
		}
		
		/**
		 * @return The <code>Point</code> used in creating an offset for x and y values. 
		 */
		public function get offset() :Point { return _offset; }
		public function set offset( $offset :Point ) :void
		{
			_offset = $offset;
		}
		
		/**
		 * @return	The x coordinate based on the bounds and offset properties.
		 */
		public function get x() :Number
		{
			return _bounds.x + _offset.x; 
		}
		
		/**
		 * @private
		 */
		public function set x( $x :Number ) :void
		{
			_bounds.x = $x; 
		}

		/**
		 * @return	The y coordinate based on the bounds and offset properties. 
		 */
		public function get y() :Number
		{
			return _bounds.y + _offset.y; 
		}
		
		/**
		 * @private
		 */
		public function set y( $y :Number ) :void
		{
			_bounds.y = $y; 
		}
		
		/**
		 * @return	The width value contained within the bounds property.
		 */
		public function get width() :Number 
		{
			return _bounds.width; 
		}
		
		/**
		 * @private
		 */
		public function set width( $width :Number ) :void
		{
			_bounds.width = $width;
		}
		
		/**
		 * @return	The height value contained within the bounds property. 
		 */
		public function get height() :Number 
		{
			return _bounds.height; 
		}
		
		/**
		 * @private
		 */
		public function set height( $height :Number ) :void
		{
			_bounds.height = $height;
		}
		
		/**
		 * @return	The x and y coordinates based on the bounds and offset properties.
		 */
		public function get coordinates() :Point 
		{
			return new Point( x, y ); 
		}
		
		/**
		 * @private
		 */
		public function set coordinates( $point :Point ) :void
		{
			x = $point.x;
			y = $point.y;
		}
		
		/**
		 * @return	The left edge of the <code>DisplayObject</code>.
		 */
		public function get left() :Number 
		{
			return x; 
		}
		
		/**
		 * @return	The right edge of the <code>DisplayObject</code>. 
		 */
		public function get right() :Number 
		{
			return x + width; 
		}
		
		/**
		 * @return	The top edge of the <code>DisplayObject</code>. 
		 */
		public function get top() :Number 
		{
			return y; 
		}
		
		/**
		 * @return	The bottom edge of the <code>DisplayObject</code>. 
		 */
		public function get bottom() :Number 
		{
			return y + height; 
		}
		
		/**
		 * @return	The horizontal center of the <code>DisplayObject</code>.
		 */
		public function get horizontalCenter() :Number 
		{
			return ( width * .5 ) - ( x * .5 );
		}
		
		/**
		 * @return	The vertical center of the <code>DisplayObject</code>. 
		 */
		public function get verticalCenter() :Number 
		{
			return ( height * .5 ) - ( y * .5 );
		}
		
		/**
		 * @return	The horizontal and vertical center of the <code>DisplayObject</code>. 
		 */
		public function get center() :Point 
		{
			 return new Point( horizontalCenter, verticalCenter );
		}
		
		/**
		 * @return	The x coordinate of the <code>DisplayObject</code> as if it were on the document's stage.
		 */
		public function get globalX() :Number 
		{
			 return _displayObject.parent.globalToLocal( new Point( x, y ) ).x;
		}
		
		/**
		 * @private
		 */
		public function set globalX( $value :Number ) :void
		{
			x = _displayObject.parent.globalToLocal( new Point( $value, y ) ).x;
		}
		
		/**
		 * @return	The y coordinate of the <code>DisplayObject</code> as if it were on the document's stage. 
		 */
		public function get globalY() :Number 
		{
			 return _displayObject.parent.globalToLocal( new Point( x, y ) ).y;
		}
		
		/**
		 * @private
		 */
		public function set globalY( $value :Number ) :void
		{
			x = _displayObject.parent.globalToLocal( new Point( x, $value ) ).y;
		}
		
		/**
		 * @return	The x and coordinates of the <code>DisplayObject</code> as if it were on the document's stage.
		 */
		public function get globalCoordinates() :Point
		{
			return _displayObject.parent.globalToLocal( new Point( x, y ) );
		}
		
		/**
		 * @private
		 */
		public function set globalCoordinates( $value :Point ) :void
		{
			var gp :Point = _displayObject.parent.globalToLocal( $value ); 
			x = gp.x;
			y = gp.y;
		}				

		/**
		 * Creates an instance for gaining additional access to properties of a <code>DisplayObject</code>.
		 * @param $displayObject	The <code>DisplayObject</code> used to access additional properties.
		 * @param $bounds			A <code>Rectangle</code> used for size and coordinates – if null, the x, y, width and height properties of the $displayObject will be used.
		 * @param $offset			A <code>Point</code> object used for offset properties – if null, a <code>Point</code> object will be created with 0, 0 properties.
		 * @example The following code creates a <code>FDisplayObjectProperties</code> classs. 
		 * <listing version="3.0" >
		 * var fsprite :FSprite = new FSprite( _sprite, { x: 0, y: 0 } );
		 * var rect :Rectangle = new Rectangle( 10, 10, 100, 100 );
		 * var offset :Point = new Point( 10, 10 );
		 * _fmock = new FDisplayObjectProperties( fsprite, rect, offset );  
		 * </listing>
		 */
		public function FDisplayObjectProperties( $displayObject :DisplayObject, $bounds :Rectangle = null, $offset :Point = null )
		{
			_displayObject = $displayObject;
			_bounds = ( $bounds ) ? $bounds : new Rectangle( _displayObject.x, _displayObject.y, _displayObject.width, _displayObject.height );
			_offset = ( $offset ) ? $offset : new Point( 0, 0 );
		}
		
		/**
		 * @return	The string equivalent of this object.
		 */
		public function toString() :String 
		{
			return 'com.factorylabs.orange.core.display.FDisplayObjectProperties';
		}
	}
}
