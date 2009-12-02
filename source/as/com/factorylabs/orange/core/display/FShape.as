
package com.factorylabs.orange.core.display 
{	
	import com.factorylabs.orange.core.errors.IllegalSetPropertiesError;

	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;

	/**
	 * FShape is the base class for all <code>Shape</code> objects.
	 * 
	 * <p>Utilize this class to inline and automate basic needs of a visual <code>Shape</code>.</p>
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
	public class FShape 
		extends Shape
			implements IFDisplayObject
	{
		/**
		 * Reference to the object's container.
		 */
		protected var _container	:DisplayObjectContainer;
		
		/**
		* FShape is the basic building block for display objects that normally utilize the <code>Shape</code> class.
		*
		* <p>Meant to be used in place of the native flash <code>Shape</code> class.</p>
		* 
		* @param $container The <code>DisplayObject</code> to add this <code>FShape</code> to. If <code>null</code> this 
		* <code>FShape</code> will not automatically be added to the display tree of another <code>DisplayObject</code>.
		* @param $init Object containting all parameters to automatically asign upon instantiation.
		* @example The following code is the simplest example of how to use <code>FShape</code>. 
		* <listing version="3.0" >
		* // assumes holder is an existing display object
		* // mc will be added to holder's display list and set to an x and y position of 10
		* var mc:FShape = new FShape( _container, { x:10, y:10 } );  
		* </listing>
		*/
		public function FShape( $container :DisplayObjectContainer = null, $init :Object = null )
		{
			super();
			_container = $container;

			if( _container != null ) 
				_container.addChild( this );
			
			if( $init ) 
				setProperties( $init );
		}
		
		/**
		 * @return	the string equivalent of this class. 
		 */
		override public function toString():String
		{
			return 'com.factorylabs.orange.core.display.FShape';
		}
		
		/**
		 * @inheritDoc
		 */
		public function setProperties( $object :Object ) :void
		{
			for( var it :String in $object )
			{
				if( this.hasOwnProperty( it ) ) 
					this[ it ] = $object[ it ];
				else
					throw new IllegalSetPropertiesError( 'An invalid property assignment was attempted on ' + this.toString() + ' for the property ' + it );
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function remove():void
		{
			if ( this.parent ) 
				this.parent.removeChild( this );
		}
	}
}
