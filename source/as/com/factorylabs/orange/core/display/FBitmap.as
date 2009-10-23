package com.factorylabs.orange.core.display 
{	import com.factorylabs.orange.core.errors.IllegalDisplayInitParamError;	import com.factorylabs.orange.core.logger.Log;		import flash.display.Bitmap;	import flash.display.BitmapData;	import flash.display.DisplayObjectContainer;		/**
	 * FBitmap is a customized version of Bitmaps which streamlines
	 * creating Bitmap objects. 
	 * 
	 *	Copyright 2007 by Factory Design Labs, All Rights Reserved.
	 *	<a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		grant
	 * @version		1.0.0 :: Oct 31, 2007
	 */
	public class FBitmap 
		extends Bitmap
	{
		
/* Properties ......................................................................................*/
		
		/**
		 * Reference to the container for this bitmap. 
		 */
		protected var _holder:DisplayObjectContainer;

/* Constructor ......................................................................................*/
		
		/**
		* FBitmap is the basic building block for bitmap display objects.
		*
		* <p>Meant to be used in place of the native flash <code>Bitmap</code> class.</p>
		* 
		* @param holder The <code>DisplayObject</code> to add this <code>FBitmap</code> to. If null this <code>FBitmap</code> will not automatically
		* be added to the display tree of another <code>DisplayObject</code>.
		* @param init Object containting all parameters to automatically asign upon instantiation.
		* @example The following code is the simplest example of how to use <code>FBitmap</code>. 
		* <listing version="3.0" >
		* // assumes holder is an existing display object
		* // mc will be added to holder's display list and set to an x and y position of 10
		* var mc:FBitmap = new FBitmap( holder, { x:10, y:10 } );  
		* </listing>
		*/
		public function FBitmap( holder:DisplayObjectContainer = null, bmpData:BitmapData=null, init:Object = null )
		{
			super( bmpData );
			
			// set local reference. 
			_holder = holder;
			
			// add to display object if the holder is not null
			if( _holder != null ) _holder.addChild( this );
			
			// if an init object is passed in, initalize the sprite
			if( init ) initBitmap( init );
		}
		
/* Public Methods .....................................................................................*/
		
		/**
		 * Removes this object from its parent container.
		 */
		public function remove():void
		{
			if ( this.parent ) 
				this.parent.removeChild( this );
		}
		
		/**
		* @return	the string equivalent of this class. 
		*/
		public override function toString():String
		{
			return "[com.factorylabs.orange.core.display.FBitmap]";
		}
		
/* Protected Methods ......................................................................................*/

		/**
		 * This method maps all the init object's properties to this Sprite.
		 * If there are properties that do not exist in the Sprite base class, an error is thrown. 
		 * 
		 * @param init	Object to map properties from. 
		 */
		protected function initBitmap( init:Object ):void
		{
			for( var it:String in init )
			{
				if( this.hasOwnProperty( it ) ) this[ it ] = init[ it ];
				else
				{
					Log.error( "[FBitmap] initBitmap()", "{ " + it + ":" + init[ it ] + " }" );
					throw new IllegalDisplayInitParamError( "An invalid property assignment was attempted on " + this.toString() );
				}
			}
		}
		
/* Event Handlers......................................................................................*/
	}
}
