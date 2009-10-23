/**
* Description here..
* @author Default
* @version 0.1
*/

package com.factorylabs.orange.core.display.util
{
	import com.factorylabs.orange.core.logger.Log;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.utils.getDefinitionByName;	
	public final class BitmapDataUtil 
	{
	
		/**
		 * Takes a snapshot of a movieclip and returns the BitmapData object. 
		 * @param	vSource			Source Movieclip to save an image of. 
		 * @param	vTarg			[Optional] Destination movieclip to attached the snapshot to. Source movieclip is used if not supplied. 
		 * @param	vD				[Optional] Depth to attach the bitmap to. 
		 * @param	vW				[Optional] Width of BitmapData snapshot.
		 * @param	vH				[Optional] Height of BitmapData snapshot.
		 * @param	vTrans			[Optional] Specifies whether this bitmap supports pixel transparency. This can only be set once per BitmapData. Defaults to true.
		 * @param	vCol			[Optional] BitmapData fill color when transparency is set to false.
		 * @param	vPixelSnap		[Optional] auto, always, or never. Defaults to auto. 
		 * @param	vSmoothing		[Optional] Boolean to allow smoothing on the BitmapData objecet.
		 * @param	vMat			[Optional] Matrix to apply to the snapsnot.
		 * @param	vRemoveSrc		[Optional] If true removes the source movieclip via removeMovieClip(). Defaults to false.
		 */
		public static function snapshot( vSource:DisplayObject, vTarg:DisplayObjectContainer=null, vW:Number=NaN, vH:Number=NaN, vTransparent:Boolean=true, vColor:int=0xFF00FF, vPixelSnap:String="auto", vSmoothing:Boolean=true, vMatrix:Matrix=null, vRemoveSource:Boolean=false ):Bitmap
		{
			// set defaults.
	//		var vClip:DisplayObjectContainer = ( vTarg == null ) ? vSource : vTarg;
			var vWidth:int = ( isNaN( vW )) ? vSource.width : vW;
			var vHeight:int = ( isNaN( vH )) ? vSource.height : vH;		
			
			// create BitmapData object.
			var vBmp:BitmapData = new BitmapData( vWidth, vHeight, vTransparent, vColor );
			
			// draw contents of source clip into target.
			if ( vMatrix == null ) vBmp.draw( vSource );
			else vBmp.draw( vSource, vMatrix );	
			
			// attach bitmap to target clip.
			var vBitmap:Bitmap = new Bitmap( vBmp, vPixelSnap, vSmoothing );
			if ( vTarg ) vTarg.addChild( vBitmap ); // vClip.addChild( vBitmap );
			
			// remove source clip if specified.
			if ( vRemoveSource ) vSource.parent.removeChild( vSource );
			
			// return new Bitmap object containing the bitmap data. 
			return vBitmap;
		}
		
		/**
		* Creates a clip from the library with the supplied container similar to how attachBitmap() used to work.
		* @param	identifier	the string identifier of the class to be created.
		*/
		public static function getBmpData( identifier:String ):BitmapData
		{			
			try
			{
				var ClassRef:Class = getDefinitionByName( identifier ) as Class;
				var instance:BitmapData = new ClassRef( NaN, NaN );
			}
			catch( e:Error ) { Log.error( "[BitmapDataUtil] getBmpData() ", e ); }
			if( instance == null )
				return null;
			else
				return instance;
		}
		
		/**
		 * Takes a snapshot of the movieclip, removes sub movieclips, then attaches a bitmap in place of the clip's contents. 
		 *
		 *	@param	vSource			Target clip to convert to a bitmap.
		 *	@param	vW				[Optional] Width of bitmap data object. Defaults to vSource width.
		 *	@param	vh				[Optional] Height of bitmap data object. Defaults to vSource height.
		 *	@param	vTransparent	[Optional] Specifies whether this bitmap supports pixel transparency. This can only be set once per BitmapData. Defaults to true.
		 *	@param	vColor			[Optional] BitmapData fill color when transparency is set to false. Defaults to white. 
		
		public static function convertToBitmap( vSource:Sprite, vW:int=null, vH:int=null, vTransparent:Boolean=true, vColor:int=0xFFFFFF ):BitmapData
		{
			// set variables.
			var vWidth:int = ( vW == null ) ? vSource.width : vW;
			var vHeight:int = ( vH == null ) ? vSource.height : vH;
			
			// create BitmapData object.
			var vBmp:BitmapData = new BitmapData( vWidth, vHeight, vTransparent, vColor );
			vBmp.draw( vSource );
			
			// remove all subclips.
			var numChilds:int = vSource.numChildren;
			for ( var i:int = 0; i < numChilds; i++ )
			{
				vSource.removeChildAt( i );
			}
			
			// attach the snapshot
			var bitmap:Bitmap = new Bitmap( vBmp, 
			
			vSource.attachBitmap( vBmp, 0, null, true );
			
			// return new BitmapData object.
			return vBmp;
		}
		*/
	
		/**
		 * Fills an area with a BitmapData object. 
		 */
		public static function drawBitmapFill( vGfx:Graphics, vPat:BitmapData, vX:int, vY:int, vW:int, vH:int, vMat:Matrix=null ):void
		{
			// check for matrix or build a fresh one. 
			var matrix:Matrix = ( vMat == null ) ? new Matrix() : vMat;
			
			// draw the bitmap fill on. 
			vGfx.beginBitmapFill( vPat, matrix, true, true );
			vGfx.drawRect( vX, vY, vW, vH );
			vGfx.endFill();
		}
		
		/**
		 * Creates a reflection of an object.
		 * 
		 * Builds an sprite and mask in memory, snapshots the container, and copies that into the target clip.
		 * 
		 * @param source	Sprite to draw. 
		 * @param target	Sprite to draw into. Defaults to source if null.
		 * @param holder	Clip to draw into. Defaults to target if null.
	
		public static function drawReflection( source:Sprite, target:Sprite=null, bottomMargin:int=1, alpha:Number=.5, reflectionHeight:int=1, gradientRatio:Number=0 ):void
		{
			var src:Sprite = source;
			var targ:Sprite = ( target == null ) ? src : target;
			
			// create a holder for both the mask, and snapshot.
			var holder:Sprite = new Sprite();
			
			// create sprite to hold the snapshot.
			var snapshot:Sprite = new Sprite();
			snapshot.alpha = alpha;
			holder.addChild( snapshot );
			
			// create mask for the snapshot.
			var mask:Sprite = new Sprite();
			holder.addChild( mask );
			
			// draw gradient mask
			mask.graphics.beginGradientFill( GradientType.LINEAR, [0xff00ff, 0xff00ff], [0,1-alpha], [gradientRatio,255], null );
			mask.graphics.drawRect( 0, 0, src.width, reflectionHeight );
			mask.graphics.endFill();
			
			// apply mask on the snapshot.
//			snapshot.mask = mask;
			
			// test.
//			targ.addChild( holder );
			
			// create matrix to apply to bitmap snapshot.
//			var matrix:Matrix = new Matrix();;
//			matrix.rotate( 180 );
//			matrix.translate( 0, bottomMargin + src.height );
//			
//			// take snapshot of source.
//			BitmapDataUtil.snapshot( src, snapshot, src.width, reflectionHeight, true, 0xff00ff, "auto", true, matrix, false );
			
			
		}
		 */
	}
}
