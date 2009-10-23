package com.factorylabs.orange.core.display.filters
{
	import flash.display.*;
	import flash.filters.ColorMatrixFilter;	
	/**
	 *	Provides a simple API to apply color filters to MovieClips.
	 *
	 *	<p>The ColorMatrixUtil simplifies the use of color filters by automating much of the setup for a ColorMatrix. This class allows you
	 *	to quickly apply a color filter to a movieclip or use the TweenMatrix class to change the color filter over time.</p>
	 *
	 *	Copyright 2007 by Factory Design Labs, All Rights Reserved.
	 *	<a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 *	@example		The following is an example usage of this class:
	 *	<listing version="3.0">
	 *		// create fresh matrix and apply changes.
	 * 		var bM:Array = ColorMatrixUtil.buildMatrix();
	 *		bM = ColorMatrixUtil.adjustMatrix( bM, ColorMatrixUtil.saturation, -100 );		
	 *		bM = ColorMatrixUtil.adjustMatrix( bM, ColorMatrixUtil.brightness, -40 );
	 *		bM = ColorMatrixUtil.adjustMatrix( bM, ColorMatrixUtil.contrast, 80 );
	 *		bM = ColorMatrixUtil.adjustMatrix( bM, ColorMatrixUtil.colorize, 0xFF0000, 90 );
	 *		bM = ColorMatrixUtil.adjustMatrix( bM, ColorMatrixUtil.hue, -90 );
	 * 
	 *		// grab a clip's existing matrix and apply changes
	 *		var eM:Array = ColorMatrixUtil.getColorMatrix( _applySaturationMc );
	 *		eM = ColorMatrixUtil.adjustMatrix( eM, ColorMatrixUtil.contrast, -80 );
	 *		eM = ColorMatrixUtil.adjustMatrix( eM, ColorMatrixUtil.colorize, 0x0000FF, 90 );
	 *		eM = ColorMatrixUtil.adjustMatrix( eM, ColorMatrixUtil.hue, 90 );
	 *		// reapply matrix to clip.
	 *		ColorMatrixUtil.applyColorMatrix( vClip, eM );
	 *		// or tween 
	 *		_multiTween = ColorMatrixUtil.createColorTween( vClip, bM, eM, 2, Expo.easeOut );
	 * 
	 * 		// adjust individual clips 
	 * 		ColorMatrixUtil.adjustColor( _applySaturationMc, ColorMatrixUtil.saturation, -100, -100, -100 );
	 * 		ColorMatrixUtil.adjustColor( _applyBrightnessMc, ColorMatrixUtil.brightness, -100 );
	 * 		ColorMatrixUtil.adjustColor( _applyContrastMc, ColorMatrixUtil.contrast, 100 );
	 * 		ColorMatrixUtil.adjustColor( _applyColorizeMc, ColorMatrixUtil.colorize, 0x333300 );
	 * 		ColorMatrixUtil.adjustColor( _applyHueMc, ColorMatrixUtil.hue, -180 );
	 * 		ColorMatrixUtil.adjustColor( _applyAlphaMc, ColorMatrixUtil.alpha, 20 );
	 * 		ColorMatrixUtil.adjustColor( _applyThresholdMc, ColorMatrixUtil.threshold, 125 );
	 * 		ColorMatrixUtil.adjustColor( _applyRandomizeMc, ColorMatrixUtil.randomize, null );
	 * 				
	 * 		// build and tween matricices
	 *		var vSaturationStart:Array = ColorMatrixUtil.buildMatrix( ColorMatrixUtil.saturation, -100 );
	 *		var vSaturationEnd:Array = ColorMatrixUtil.buildMatrix( ColorMatrixUtil.saturation, 100 );
	 *		_saturationTween = ColorMatrixUtil.createColorTween( _tweenSaturationMc, vSaturationStart, vSaturationEnd, 2, Expo.easeOut );
	 *	</listing>
	 *
	 * @author		Grant Davis
	 *	@version	1.0.0 :: Apr 5, 2007
	 *	@since		1.0.0
	 */	public class ColorMatrixUtil
	{
/* Preset Matricies ......................................................................................*/
		
		/**
		 * Preset matrix to apply a sepia tone. 
		 */
		public static const SEPIA:Array = new Array( 	0.35, 0.35, 0.35, 0, 0,
														0.3, 0.3, 0.3, 0, 0,
														0.21, 0.21, 0.21, 0, 0,
														0, 0, 0, 1, 0
													);
	
/* Properties ......................................................................................*/
		
		/**
		 * The string equivilent to the ColorMatrix brightness method. Expected values are -1 (black) to 1 (white). A value for each color channel can be passed as (r, g, b).
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#adjustBrightness()
		 */
		public static const BRIGHTNESS:String = "adjustBrightness";
		
		/**
		 * The string equivilent to the ColorMatrix saturation method. Expected values are -1 (no saturation) to 1 (full saturation). A value for each color channel can be passed as (r, g, b).
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#adjustSaturation()
		 */
		public static const SATURATION:String = "adjustSaturation";
		
		/**
		 * The string equivilent to the ColorMatrix contrast method. Expected values are -100 to 100. A value of 0 is no change. A value for each color channel can be passed as (r, g, b).
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#adjustContrast()
		 */
		public static const CONTRAST:String = "adjustContrast";
		
		/**
		 * The string equivilent to the ColorMatrix colorize method. Requires two values: a hexidecimal RGB value (0xFFFFFF), and the amount of colorization (0% - 100%); 
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#colorize()
		 */
		public static const COLORIZE:String = "colorize";
		
		/**
		 * The string equivilent to the ColorMatrix hue method. Expected value is between -180 and 180. 
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#adjustHue()
		 */
		public static const HUE:String = "adjustHue";
		
		/**
		 * The string equivilent to the ColorMatrix alpha method. Expected value is between 0 and 100. 
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#adjustAlpha()
		 */
		public static const ALPHA:String = "adjustAlpha";
		
		/**
		 * The string equivilent to the ColorMatrix threshold method. Expected value is between 0 (almost completely white) and 255 (almost completely black). 
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#threshold()
		 */
		public static const THRESHOLD:String = "threshold";
		
		/**
		 * The string equivilent to the ColorMatrix randomize method. Expected value is between 0 and 2. If no value is passed, a random value is assigned. 
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#randomize()
		 */
		public static const RANDOMIZE:String = "randomize";
		
		/**
		 * The string equivilent to the ColorMatrix invert method. Expected value is between 0 and 2. If no value is passed, a random value is assigned. 
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#invert()
		 */
		public static const INVERT:String = "invert";
		
		/**
		 * The string equivilent to the ColorMatrix invert method. Expected value is between 0 and 2. If no value is passed, a random value is assigned. 
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#desaturate()
		 */
		public static const DESATURATE:String = "desaturate";
		
		/**
		 * The string equivilent to the ColorMatrix setChannel method. Four arguments allowed to set for r,g,b,a color values.
		 * @see com.factorylabs.orange.core.filters.ColorMatrix#setChannels()
		 */
		public static const SET_CHANNELS:String = "setChannels";
		
		
	
/* Constructor ......................................................................................*/

		public function ColorMatrixUtil(){}
	
/* Public Methods......................................................................................*/
		
		/**
		 * @return	the string equivalent of this class. 
		 */
		public function toString():String { return "[Object om.factorylabs.fdlCore.filters.ColorMatrixUtil]"; }
		
		/**
		 * Builds and returns a Matrix using the specified adjustment method.
		 * @param	vAdjustment		[Optional] Represents the method in ColorMatrix to use for the adjustment.
		 * @param	vNum			[Optional] Number to send to the adjustment method in ColorMatrix. 
	 	 * @usageNote	Additional arguments can be appended after vNum. These are sent to the handling vAdjustment method in the ColorMatrix class. Max of 2 additional arguments.
		 * @usageNote	You can omit all arguments passed to this function to create an unchanged matrix.
		 * @return	An array representing the current color matrix.	 
		 * @see com.factorylabs.orange.core.filters.ColorMatrix
		 */
		public static function buildMatrix( adjustment:String=null, ...values ):Array
		{
			var color:ColorMatrix = new ColorMatrix();
			
			// if no arguments are passed, return a blank matrix.
			if ( adjustment == null ) return color.matrix;
			
			// otherwise update the matrix and return it.
			return updateMatrix( color, adjustment, values );
		}
		
		/**
		 * Method to return the ColorMatrixFilter from a movieclip.
		 * 
		 * @param	vClip	MovieClip whose color matrix to get.
		 * @return	The matrix of the ColorMatrixFilter. null if none found.
		 */
		public static function getColorFilter( vClip:DisplayObject ):ColorMatrixFilter
		{
			var vFilters:Array = vClip.filters;
			var vIndex:Number = findColorFilterIndex( vClip );
			return ( isNaN( vIndex )) ? null : vFilters[ vIndex ];
		}	
		
		
		/**
		 * Method to return the color matrix array from a clip's ColorMatrixFilter object. 
		 * 
		 * @param	vClip	MovieClip whose color matrix to get.
		 * @return	The matrix of the ColorMatrixFilter. returns a fresh matrix if none are found.
		 */
		public static function getColorMatrix( vClip:DisplayObject ):Array
		{
			var vFilters:Array = vClip.filters;
			var vIndex:Number = findColorFilterIndex( vClip );
			return ( isNaN( vIndex )) ? buildMatrix() : vFilters[ vIndex ].matrix;
		}	
		
		
		/**
		 * Applys a color matrix to a clip.
		 * 
		 * @param	vClip	MovieClip to apply matrix to.
		 * @param	vMatrix	ColorMatrix to use. 
		 */
		public static function applyColorMatrix( vClip:DisplayObject, vMatrix:Array ):void
		{
			ApplyMatrix.color( vClip, vMatrix );
		}
	
		/**
		 * Sets an adjustment on a specified matrix. The change is relative to the matrix properties already in place on the movieclip (i.e. adds to them).
		 * 
		 * @param	vBaseMatrix		Target clip to transform. 
		 * @param	vAdjustment		Represents the method in ColorMatrix to use for the adjustment.
		 * @param	vNum			Value of the change.
		 * @usageNote	Additional arguments can be appended after vNum. These are sent to the handling vAdjustment method in the ColorMatrix class. Max of 2 additional arguments.
		 * @return	An array representing the current color matrix.
		 * @see com.factorylabs.orange.core.filters.ColorMatrix
		 */
		public static function adjustMatrix( vBaseMatrix:Array, vAdjustment:String, ...values ):Array
		{
			// create ColorMatrix object and set its matrix to the base matrix.
			var vColor:ColorMatrix = new ColorMatrix();
			vColor.matrix = vBaseMatrix;
			
			// update the matrix and return it.
			return updateMatrix( vColor, vAdjustment, values );
		}
		
		
		/**
		 * Applys a ColorMatrix adjustment to the specified clip. 
		 * 
		 * @param	vClip		Target clip to adjust saturation of.
		 * @param	vChangeType	The type of change you want to use. This is a string value equal to a color method in the ColorMatrix class.
		 * @param	vNum		Change amount.
		 * @see com.factorylabs.orange.core.filters.ColorMatrix
		 */
		public static function adjustColor( vClip:DisplayObject, vChangeType:String, ...values /*vNum:Number*/ ):void
		{
			// to make sure we don't override each color change we make, we have to grab the matrix from any previously created ColorMatrixFilter.
			var vFilters:Array = vClip.filters;
			
			// index of the ColorMatrixFilter filter
			var vColorFilterIndex:Number = findColorFilterIndex( vClip );		
			
			// set matrix to either a fresh array, or populate from the ColorMatrixFilter
			var vMatrix:Array = ( isNaN( vColorFilterIndex )) ? new ColorMatrixFilter().matrix : vFilters[ vColorFilterIndex ].matrix;
		
			vMatrix = adjustMatrix( vMatrix, vChangeType, values );
			
			// apply the change. 
			ApplyMatrix.color( vClip, vMatrix );
		}
		
		
		/**
		 * Creates a TweenMatrix instance to tween two transform matricies. 
		 * 
		 * @param	vClip			Target clip to transform. 
		 * @param	vBeginMatrix	Beginnig matrix.
		 * @param	vEndMatrix		End Matrix.
		 * @param	vDuration		Number of seconds or frames to tween over (depending on vUseSecs);
		 * @param	vEase			Function to use as the easing equation for the tween.
		 * @param	vUseSecs		Boolean specifying to use seconds (true) or frames for the tween (false).
		 * @param	vVarUpdate		Boolean specifying whether to run updateAfterEvent on each frame.
		 * @return	The newly created TweenMatrix object.
		 
		public static function createColorTween( vClip:DisplayObject, vEase:Function, vBeginMatrix:Array, vEndMatrix:Array, vDuration:Number=2, vUseSecs:Boolean=true ):TweenMatrix
		{
			// set defaults values if the following variables have been ommitted.
			vEase = ( !(vEase is Function )) ? None.easeNone : vEase;
			
			// run the tween.
			var vTween:TweenMatrix = new TweenMatrix( vClip, ApplyMatrix.color, vEase, vBeginMatrix, vEndMatrix, vDuration, vUseSecs );
			return vTween;
		}*/
		
		
		/**
		 * Loops through the supplied array to find the index position of a ColorFilterMatrix object.
		 * 
		 * @param	vFilters	Array to search.
		 * @return	The numeric index of the filter position in vFilters.
		 */
		public static function findColorFilterIndex( vClip:DisplayObject ):Number
		{
			var vFilters:Array = vClip.filters;
			// loop through filters and mark the index at where a ColorMatrixFilter exists. 
			for ( var i:Number = 0; i < vFilters.length; i++ ) 
			{
				if ( vFilters[ i ] is ColorMatrixFilter ) 
				{	
					return i;
				}
			}
			// none were found.
			return NaN;
		}
		
/* Private Methods......................................................................................*/
	
		/**
		 * Performs a color adjustment and returns the new matrix. 
		 */
		private static function updateMatrix( vColor:ColorMatrix, vAdjustment:String, values:Array ):Array
		{
			switch ( vAdjustment )
			{
				case ColorMatrixUtil.ALPHA:
					vColor.adjustAlpha( values[ 0 ] );
					break;
				case ColorMatrixUtil.BRIGHTNESS:
					vColor.adjustBrightness( values[ 0 ], values[ 1 ], values[ 2 ]);
					break;
				case ColorMatrixUtil.COLORIZE:
					vColor.colorize( values[ 0 ], values[ 1 ]);
					break;
				case ColorMatrixUtil.CONTRAST:
					vColor.adjustContrast( values[ 0 ], values[ 1 ], values[ 2 ]);
					break;
				case ColorMatrixUtil.DESATURATE:
					vColor.desaturate();
					break;
				case ColorMatrixUtil.HUE:
					vColor.adjustHue( values[ 0 ]);
					break;
				case ColorMatrixUtil.INVERT:
					vColor.invert();
					break;
				case ColorMatrixUtil.RANDOMIZE:
					vColor.randomize( values[ 0 ]);
					break;
				case ColorMatrixUtil.SATURATION:
					vColor.adjustSaturation( values[ 0 ], values[ 1 ], values[ 2 ] );
					break;
				case ColorMatrixUtil.SET_CHANNELS:
					vColor.setChannels( values[ 0 ], values[ 1 ], values[ 2 ], values [ 3 ]);
					break;
				case ColorMatrixUtil.THRESHOLD:
					vColor.threshold( values[ 0 ]);
					break;
			}
			
			return vColor.matrix;
		}
	}
}