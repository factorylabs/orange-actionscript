
package com.factorylabs.orange.core.display 
{	import com.factorylabs.orange.core.errors.IllegalSetDisplayObjectPropertiesError;		import flash.display.Bitmap;	import flash.display.BitmapData;	import flash.display.DisplayObjectContainer;	
	
	/**
	 * FBitmap is the base class for all Bitmap objects.
	 * 
	 * <p>Utilize this class to inline and automate basic needs of a visual Bitmap.</p>
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
	 * @author		Grant Davis
	 * @version		1.0.0 :: Oct 31, 2007
	 */
	public class FBitmap 
		extends Bitmap
			implements IFDisplayObject
	{
		/**
		 * Reference to the object's container.
		 */
		protected var _container	:DisplayObjectContainer;
		
		/**
		 * FBitmap is the basic building block for bitmap display objects.
		 *
		 * <p>Meant to be used in place of the native flash <code>Bitmap</code> class.</p>
		 * 
		 * @param $container The <code>DisplayObject</code> to add this <code>FBitmap</code> to. If null this 
		 * <code>FBitmap</code> will not automatically be added to the display tree of another <code>DisplayObject</code>.
		 * @param $init Object containting all parameters to automatically asign upon instantiation.
		 * @example The following code is the simplest example of how to use <code>FBitmap</code>. 
		 * <listing version="3.0" >
		 * // assumes holder is an existing display object
		 * // mc will be added to holder's display list and set to an x and y position of 10
		 * var mc:FBitmap = new FBitmap( _container, { x:10, y:10 } );  
		 * </listing>
		 */
		public function FBitmap( $container :DisplayObjectContainer = null, $bmpData :BitmapData = null, $init :Object = null )
		{
			super( $bmpData );
			_container = $container;

			if( _container != null ) 
				_container.addChild( this );
			
			if( $init ) 
				setDisplayObjectProperties( $init );
		}
		
		/**
		 * @return	the string equivalent of this class. 
		 */
		override public function toString() :String
		{
			return 'com.factorylabs.orange.core.display.FBitmap';
		}
		
		/**
		 * @inheritDoc
		 */
		public function setDisplayObjectProperties( $object :Object ) :void
		{
			for( var it :String in $object )
			{
				if( this.hasOwnProperty( it ) ) this[ it ] = $object[ it ];
				else
					throw new IllegalSetDisplayObjectPropertiesError( 'An invalid property assignment was attempted on ' + this.toString() + ' for the property ' + it );
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function remove() :void
		{
			if( this.parent ) 
				this.parent.removeChild( this );
		}
	}
}
