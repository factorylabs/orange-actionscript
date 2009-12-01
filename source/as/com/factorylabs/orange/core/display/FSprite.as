
package com.factorylabs.orange.core.display
{
	import com.factorylabs.orange.core.errors.IllegalSetDisplayObjectPropertiesError;

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	/**
	 * FSprite is the base class for all <code>Sprite</code> objects.
	 * 
	 * <p>Utilize this class to inline and automate basic needs of a visual <code>Sprite</code>.</p>
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
	 * @author 		Ryan Boyajian
	 * @author		Sean Dougherty
	 * @version		1.0.0 :: Apr 18, 2008
	 * @version		2.0.0 :: Dec 17, 2008 :: Took a lot of extra functionality and added it to FSpriteExtended
	 * @version		2.5.0 :: Nov 26, 2009 :: Renamed some parameters and optimize for FP 10.
	 */
	public class FSprite
		extends Sprite
			implements IFDisplayObject
	{
		/**
		 * Reference to the object's container.
		 */
		protected var _container	:DisplayObjectContainer;
		
		/**
		 * FSprite is the basic building block for display objects that can have mouse interaction.
		 *
		 * <p>Meant to be used in place of the native flash <code>Sprite</code> class.</p>
		 * 
		 * @param $container The <code>DisplayObject</code> to add this <code>FSprite</code> to, if <code>null</code> this 
		 * <code>FSprite</code> will not automatically be added to the display tree of another <code>DisplayObject</code>.
		 * @param $init Object containting all parameters to automatically asign upon instantiation.
		 * @example The following code is the simplest example of how to use FSprite. 
		 * <listing version="3.0" >
		 * // assumes holder is an existing display object
		 * // mc will be added to contanier's display list and set to an x and y position of 10
		 * var mc:FSprite = new FSprite( _container, { x:10, y:10 } );  
		 * </listing>
		 */
		public function FSprite( $container :DisplayObjectContainer = null, $init : Object = null )
		{
			super();
			tabEnabled = false;
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
			return 'com.factorylabs.orange.core.display.FSprite';
		}
		
		/**
		 * @inheritDoc
		 */
		public function setDisplayObjectProperties( $object :Object ) :void
		{
			for( var it :String in $object )
			{
				if( this.hasOwnProperty( it ) ) 
					this[ it ] = $object[ it ];
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