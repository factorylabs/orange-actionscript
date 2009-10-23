package com.factorylabs.orange.core.display
{	import com.factorylabs.orange.core.errors.IllegalDisplayInitParamError;
	import com.factorylabs.orange.core.logger.Log;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;	
	/**
	* FMovieClip is the base class that should be used for all
	* custom MovieClip subclasses that we create.
	* 
	* Copyright 2008 by Factory Design Labs, All Rights Reserved.
	* <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	* 
	* @author Sean Dougherty
    * @version 		1.0
    * @version		2.0.0 :: Dec 17, 2008 Took a lot of extra functionality and added it to FMovieClipExtended
	*/
	public class FMovieClip
		extends MovieClip
	{
		
/* Properties ......................................................................................*/
		
		/**
		 * parent container
		 */
		protected var _holder:DisplayObjectContainer;
		
/* Constructor ......................................................................................*/
		
		/**
		* FMovieClip is the basic building block for display objects that have timelines.
		*
		* <p>Meant to be used in place of the native flash <code>MovieClip</code> class.</p>
		* 
		* @param holder The <code>DisplayObject</code> to add this <code>FMovieClip</code> to. If null this <code>FMovieClip</code> will not automatically
		* be added to the display tree of another <code>DisplayObject</code>.
		* @param init Object containting all parameters to automatically asign upon instantiation.
		* @example The following code is the simplest example of how to use <code>FMovieClip</code>. 
		* <listing version="3.0" >
		* // assumes holder is an existing display object
		* // mc will be added to holder's display list and set to an x and y position of 10
		* var mc:FMovieClip = new FMovieClip( holder, { x:10, y:10 } );  
		* </listing>
		*/
        public function FMovieClip( holder:DisplayObjectContainer=null, init:Object=null )
		{	
			super();
			
			// set local reference. 
			_holder = holder;
			
			// add to display object if the holder is not null
			if( _holder != null ) _holder.addChild( this );
			
			// disable tabbing by default - pass it in via the init Object if you want it enabled on creation
			tabEnabled = false;
			
			// if an init object is passed in, initalize the sprite
			if( init ) initMovieClip( init );
		}
        
/* Public Methods .....................................................................................*/
		
		/**
		* @return	the string equivalent of this class. 
		*/
		public override function toString():String
		{
			return "[ com.factorylabs.orange.core.display.FMovieClip ]";
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

		protected function initMovieClip( init:Object ):void
		{
			for( var it:String in init )
			{
				if( this.hasOwnProperty( it ) ) this[ it ] = init[ it ];
				else
				{
					Log.error( "[FMovieClip] initMovieClip()", "{ " + it + ":" + init[ it ] + " }" );
					throw new IllegalDisplayInitParamError( "An invalid property assignment was attempted on " + this.toString() );
				}
			}
		}
	
/* Getters/Setters ......................................................................................*/
	}
}