/**
* Utils for DisplayObject classes.
* @author Justin Gitlin
* @version 0.1
*/

package com.factorylabs.orange.core.display.util
{
	import com.factorylabs.orange.core.errors.IllegalDisplayInitParamError;
	import com.factorylabs.orange.core.logger.Log;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.system.ApplicationDomain;	

	public final class DisplayObjectUtil
	{
		/**
		* Creates an instance of a clip from the library similar to how attachMovie() used to work.
		* @param	identifier	the string identifier of the class to be created.
		* @param	init		object containing init props for the attached clip.
		* @param	container	the container that the new attached clip will be added to if supplied.
		* @param	domain		the application domain to search for the object. this can be used to get library items from loaded in .swfs.
		* @return	MovieClip	a reference to the clip that is attached.
		*/
		public static function attachMovieClip( identifier:String, init:Object = null, container:DisplayObjectContainer = null, domain:ApplicationDomain = null ):MovieClip
		{
			if( !domain ) domain = ApplicationDomain.currentDomain;
			var instance:MovieClip;
			try
			{
				var ClassRef:Class = domain.getDefinition( identifier ) as Class;
				instance = MovieClip( new ClassRef() );
			}
			catch( err:Error ) { Log.error( "[DisplayObjectUtil] attachMovieClip() ", err ); }
			if( instance )
			{
				if( init )
				{
					for( var it:String in init )
					{ 
						if( instance.hasOwnProperty( it ) ) instance[ it ] = init[ it ];
						else throw new IllegalDisplayInitParamError( "An invalid property assignment was attempted on com.factorylabs.util.DisplayObjectUtil.attachClip();" );
					} 
				}
				if( container ) container.addChild( instance );
			}
			return instance;
		}
		
		/**
		 * TODO: deprecate by version 1.0 to the more formal attachMovieClip name.
		 */
		public static function attachClip( identifier:String, init:Object = null, container:DisplayObjectContainer = null, domain:ApplicationDomain = null ):MovieClip
		{
			return attachMovieClip( identifier, init, container, domain );
		}
		
		/**
		* Creates an instance of a bitmap from the library similar to how attachBitmap() used to work.
		* Creates a clip from the library with the supplied container similar to how attachMovie() used to work.
		* @param	identifier	the string identifier of the class to be created.
		* @param	domain		the application domain to search for the object. this can be used to get library items from loaded in .swfs.
		* @return	MovieClip	a reference to the clip that is attached.
		*/
		public static function getClip( identifier:String, domain:ApplicationDomain = null ):MovieClip
		{
			if( !domain ) domain = ApplicationDomain.currentDomain;
			try
			{
				var ClassRef:Class = domain.getDefinition( identifier ) as Class;
				var instance:MovieClip = MovieClip( new ClassRef() );
			}
			catch( e:Error ) { Log.error( "[DisplayObjectUtil] getClip() ", e ); }
			if( instance != null )
				return instance;
			else
				return null;
		}
		
		/**
		* Creates a clip from the library with the supplied container similar to how attachBitmap() used to work.
		* @param	container	the container that the new attached clip will be added to.
		* @param	identifier	the string identifier of the class to be created.
		* @param	init		object containing init props for the attached clip.
		* @param	container	the container that the new attached clip will be added to if supplied.
		* @param	domain		the application domain to search for the object. this can be used to get library items from loaded in .swfs.
		* @return	Bitmap		a reference to the bitmap that is attached.
		*/
		public static function attachBitmap( identifier:String, init:Object = null, container:DisplayObjectContainer = null, domain:ApplicationDomain = null ):Bitmap
		{
			if( !domain ) domain = ApplicationDomain.currentDomain;
			var instance:Bitmap;
			try
			{
				var ClassRef:Class = domain.getDefinition( identifier ) as Class;
				instance = new Bitmap( new ClassRef( NaN, NaN ), 'auto', true );
			}
			catch( err:Error ) { Log.error( "[DisplayObjectUtil] attachBitmap() ", err ); }
			if( instance )
			{
				if( init )
				{
					for( var it:String in init )
					{ 
						if( instance.hasOwnProperty( it ) ) instance[ it ] = init[ it ];
						else throw new IllegalDisplayInitParamError( "An invalid property assignment was attempted on com.factorylabs.util.DisplayObjectUtil.attachBmp();" );
					} 
				}
				if( container ) container.addChild( instance );
			}
			return instance;
		}
		
		/**
		 * TODO: deprecate by version 1.0 to the more formal attachBitmap name.
		 */
		public static function attachBmp( identifier:String, init:Object = null, container:DisplayObjectContainer = null, domain:ApplicationDomain = null ):Bitmap
		{
			return attachBitmap( identifier, init, container, domain );	
		}
		
		/**
		 *	Sorts depth of an array of DisplayObjects based on their y coordinate.
		 *  Useful in games or whenever pseudo-3d objects need to swap depths depending on layout on stage.
		 *	@param	container	parent container of the DisplayObjects to sort stacking order on.
		 *	@param	clips		Array of DisplayObjects that need to have their depths sorted
		 */
		public static function setDepthsOnY( container:DisplayObjectContainer, objs:Array ):void
		{
			// create array to sort objects with
			var vObjectsArr:Array = [];
			var numObjs:uint =  objs.length;
			var i:uint;
			
			// store objects representing the DisplayObject and its y coordinate
			for( i = 0; i < numObjs; i++ )
			{
				vObjectsArr.push( { clip: objs[i], y: objs[i].y } );
			}
			
			// sort array on y coordinate
			vObjectsArr.sortOn( 'y', Array.NUMERIC );
			
			// set display list index to swap stacking
			for( i = 0; i < vObjectsArr.length; i++ )
			{
				container.setChildIndex( vObjectsArr[i].clip, i );
			}
		}
		
		/**
		 *	Centers a DisplayObject's registration point
		 *	@param	container	the DisplayObject to center registration.
		 */
		public static function centerRegistration( container:DisplayObject ):void
		{
			try
			{
				container.x = -( container.width / 2 );
				container.y = -( container.height / 2 );
			}
			catch( e:Error ) { Log.error( "[DisplayObjectUtil] centerRegistration() ", e ); }
		}
		
		/**
		 * Scales a DisplayObject to fit within a width/height constraint. Figures out which direction to scale, and does it.
		 * @param	container	the object to scale.
		 * @param	width		maximum width of the DisplayObject
		 * @param	height		maximum height of the DisplayObject
		 */
		public static function scaleToDimensions( container:DisplayObjectContainer, width:Number, height:Number ):void
		{
			// decide which dimension needs to be shrunk more, and shrink both by that much
			var wRatio:Number = width / container.width;
			var hRatio:Number = height / container.height;
			var scaleRatio:Number = ( wRatio > hRatio ) ? hRatio : wRatio;
			container.scaleX = container.scaleY = scaleRatio;
		}
		
	}
}
