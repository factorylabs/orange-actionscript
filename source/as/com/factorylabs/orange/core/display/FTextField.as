
package com.factorylabs.orange.core.display
{
	import com.factorylabs.orange.core.errors.IllegalSetPropertiesError;

	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;

	/**
	 * FTextField is the base class for all TextFields.
	 * 
	 * <p>Utilize this class to inline and automate basic needs of a visual Sprite.</p>
	 *
	 * <hr />
	 * <p>Copyright 2004-2010 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p>
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
	 * @version		1.0.0 :: Oct 31, 2007
	 * @author		Matthew Kitt
	 * @version		2.0.0 :: Nov 28, 2009 :: Removed the hooks into css and span, these are declaritive properties that should be injected.
	 */
	public class FTextField
		extends TextField
			implements IFDisplayObject
	{
		/**
		 * Reference to the object's container.
		 */
		protected var _container	:DisplayObjectContainer;
		
        /**
		 * Sets the <code>multiline</code> and <code>wordWrap</code> properties through one accessor.
		 * <p><b>NOTE: </b>You set <code>wordWrap</code> after setting <code>FTextField.multiline</code> in the case
		 * where you want to have <code>multiline</code> set to <code>false</code>, and <code>wordWrap</code> as true.</p>
		 * @param $value	the value to set <code>wordWrap</code> and <code>multiline</code>.
		 */
		override public function set multiline( $value :Boolean ) :void
		{
			super.wordWrap = $value;
			super.multiline = $value;
		}
        
        /**
		 * FTextField is the basic building block for display objects that display text.
		 *
		 * <p>Meant to be used in place of the native flash <code>TextField</code> class.</p>
		 * 
		 * @param $container The <code>DisplayObject</code> to add this <code>FTextFiedl</code> to, if <code>null</code> this 
		 * <code>FTextField</code> will not automatically be added to the display tree of another <code>DisplayObject</code>.
		 * @param $init Object containting all parameters to automatically asign upon instantiation.
		 * @example The following code is the simplest example of how to use FTextField. 
		 * <listing version="3.0" >
		 * // assumes holder is an existing display object
		 * // txt will be added to contanier's display list and set to an x and y position of 10
		 * var txt:FTextField = new FTextField( _container, { x:10, y:10, multiline: true } );  
		 * </listing>
		 */
        public function FTextField( $container :DisplayObjectContainer = null, $init :Object = null )
		{
			super();
			selectable = false;
			tabEnabled = false;
			embedFonts = true;
			_container = $container;

			if( _container != null ) 
				_container.addChild( this );
			
			if( $init != null ) 
				setProperties( $init );
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
		public function remove() :void
		{
			if( this.parent ) 
				this.parent.removeChild( this );
		}
	}
}
