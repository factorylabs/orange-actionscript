package com.factorylabs.orange.core.display
{
	import com.factorylabs.orange.core.errors.IllegalDisplayInitParamError;
	import com.factorylabs.orange.core.logger.Log;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;	

	/**
	 * FSprite is the base class for all Sprite objects
	 * use it instead of Sprite.
	 * 
	 * <p>Copyright 2004-2009 by Factory Design Labs</p>
	 * 
	 * Permission is hereby granted, free of charge, to any person obtaining
	 * a copy of this software and associated documentation files (the
	 * "Software"), to deal in the Software without restriction, including
	 * without limitation the rights to use, copy, modify, merge, publish,
	 * distribute, sublicense, and/or sell copies of the Software, and to
	 * permit persons to whom the Software is furnished to do so, subject to
	 * the following conditions:
	 * 
	 * The above copyright notice and this permission notice shall be
	 * included in all copies or substantial portions of the Software.
	 * 
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *  
	 * @author Ryan Boyajian, Sean Dougherty
	 * 
	 * @version		1.0.0 :: Apr 18, 2008
	 * @version		2.0.0 :: Dec 17, 2008 Took a lot of extra functionality and added it to FSpriteExtended
	 */
	public class FSprite
		extends Sprite
	{
/* Properties ......................................................................................*/
		
		protected var _holder:DisplayObjectContainer;
		
/* Constructor ......................................................................................*/
		
		/**
		* FSprite is the basic building block for display objects that can have mouse interaction.
		*
		* <p>Meant to be used in place of the native flash <code>Sprite</code> class.</p>
		* 
		* @param holder The <code>DisplayObject</code> to add this <code>FSprite</code> to. If null this <code>FSprite</code> will not automatically
		* be added to the display tree of another <code>DisplayObject</code>.
		* @param init Object containting all parameters to automatically asign upon instantiation.
		* @example The following code is the simplest example of how to use FSprite. 
		* <listing version="3.0" >
		* // assumes holder is an existing display object
		* // mc will be added to holder's display list and set to an x and y position of 10
		* var mc:FSprite = new FSprite( holder, { x:10, y:10 } );  
		* </listing>
		*/
		public function FSprite( holder:DisplayObjectContainer=null, init:Object=null )
		{
			super();
			
			// disable tabbing by default
			tabEnabled = false;
			
			// set local reference. 
			_holder = holder;
			
			// add to display object if the holder is not null
			if( _holder != null ) _holder.addChild( this );
			
			// if an init object is passed in, initalize the sprite
			if( init ) initSprite( init );
		}
		
/* Public Methods .....................................................................................*/

		/**
		* @return	the string equivalent of this class. 
		*/
		public override function toString():String
		{
			return "[ com.factorylabs.core.display.FSprite ]";
		}
		
		/**
		 * Removes this object from its parent container.
		 */
		public function remove():void
		{
			if ( this.parent ) 
				this.parent.removeChild( this );
		}
		
/* Protected Methods ......................................................................................*/

		/**
		 * Maps all the init object's properties to this Sprite.
		 * If there are properties that do not exist in the Sprite base class, an error is thrown. 
		 * 
		 * @param init	Object to map properties from. 
		 */
		protected function initSprite( init:Object ):void
		{
			for( var it:String in init )
			{
				if( this.hasOwnProperty( it ) ) this[ it ] = init[ it ];
				else
				{
					Log.error( "[FSprite] initSprite()", "{ " + it + ":" + init[ it ] + " }" );
					throw new IllegalDisplayInitParamError( "An invalid property assignment was attempted on " + this.toString() );
				}
			}
		}

/* Getters/Setters ......................................................................................*/
	}
}