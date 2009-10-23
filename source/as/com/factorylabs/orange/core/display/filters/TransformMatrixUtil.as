
 
package com.factorylabs.orange.core.display.filters
{
	import flash.display.DisplayObject;	
	/**
	 *	Provides a simple API to apply transform filters to MovieClips.
	 *
	 *	<p>The ColorMatrixUtil simplifies the use of color filters by automating much of the setup for a ColorMatrix. This class allows you
	 *	to quickly apply a color filter to a movieclip or use the TweenMatrix class to change the color filter over time.</p>
	 *
	 *	Copyright 2007 by Factory Design Labs, All Rights Reserved.
	 *	<a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 *	@example		The following is an example usage of this class:
	 *	<listing version="3.0">
	 *		// apply single transformations to a clip.
	 *		TransformMatrixUtil.applyTransform( _adjustLocationMc, TransformMatrixUtil.location, -100, -100 );
	 *		TransformMatrixUtil.applyTransform( _adjustScaleMc, TransformMatrixUtil.scale, 150, 50 );
	 *		TransformMatrixUtil.applyTransform( _adjustRotationMc, TransformMatrixUtil.rotation, 45 );
	 *		TransformMatrixUtil.applyTransform( _adjustShearMc, TransformMatrixUtil.shear, 50 );
	 *
	 *		// build start and end matricies to tween between. 
	 *		var vBeginMatrix:Array = TransformMatrixUtil.buildMatrix( _mc );
	 *		vBeginMatrix = TransformMatrixUtil.adjustMatrix( vBeginMatrix, TransformMatrixUtil.rotation, -179 );
	 *		vBeginMatrix = TransformMatrixUtil.adjustMatrix( vBeginMatrix, TransformMatrixUtil.shear, 500, 100 );
	 *		vBeginMatrix = TransformMatrixUtil.setMatrix( vBeginMatrix, TransformMatrixUtil.location, -100, 0 );
	 *
	 *		var vEndMatrix:Array = TransformMatrixUtil.buildMatrix( _mc );
	 *		vEndMatrix = TransformMatrixUtil.setMatrix( vEndMatrix, TransformMatrixUtil.rotation, 0 );
	 *		vEndMatrix = TransformMatrixUtil.setMatrix( vEndMatrix, TransformMatrixUtil.shear, 100 );
	 *		vEndMatrix = TransformMatrixUtil.setMatrix( vEndMatrix, TransformMatrixUtil.location, 250, 50 );
	 *		
	 *		_tween = TransformMatrixUtil.createTransformTween( _mc, vBeginMatrix, vEndMatrix, _tweenTime, Expo.easeOut );
	 *	</listing>
	 *
	 * @author		Grant Davis
	 *	@version	1.0.0 :: Apr 5, 2007
	 *	@since		1.0.0
	 */
	public class TransformMatrixUtil
	{
		
/* PROPERTIES ................................................................................ */
	
		/**
		 * The single instance derived of ColorMatrixUtil.
		 */
		private static var _instance:TransformMatrixUtil;
		
		/**
		 * The string equivilent to the TransformMatrix locaion method.
		 * @see com.factorylabs.orange.core.filters.TransformMatrix
		 */
		public static const LOCATION:String = "Location";
		
		/**
		 * The string equivilent to the TransformMatrix scale method.
		 * @see com.factorylabs.orange.core.filters.TransformMatrix
		 */
		public static const SCALE:String = "Scale";
		
		/**
		 * The string equivilent to the TransformMatrix rotation method.
		 * @see com.factorylabs.orange.core.filters.TransformMatrix
		 */
		public static const ROTATION:String = "Rotation";
	
		
		/**
		 * The string equivilent to the TransformMatrix shear method. Expects an x and y shear amount, or one amount for both properties.
		 * @see com.factorylabs.orange.core.filters.TransformMatrix
		 */
		public static const SHEAR:String = "Shear";
	
/* CONSTRUCTOR ............................................................................ */
	
		/** 
		 *	Private constructor as this is a Singleton.
		 */
		public function TransformMatrixUtil( enforcer:SingletonEnforcer ){}
		
	
/* METHODS ................................................................................... */
		
		/**
		 * @return	the string equivalent of this class. 
		 */
		public function toString():String { return "[Object com.factorylabs.filters.TransformMatrixUtil]"; }
		
		/**
		 *	@return	singleton instance of MovieClipColor.
		 */
		public static function getInstance():TransformMatrixUtil
		{
			if ( _instance == null ) _instance = new TransformMatrixUtil( new SingletonEnforcer );
			return _instance;
		}
		
		/**
		 * Builds and returns a Matrix using the specified adjustment method.
		 * @param	vClip			The movieclip to initialize a the TransformMatrix with. Specify null to create a clean matrix. 
		 * @param	vAdjustment		Represents the method in TransformMatrix to use for the adjustment.
		 * @param	vNum			Number to send to the adjustment method in ColorMatrix. 
		 * @see com.factorylabs.orange.core.filters.ColorMatrix
		 */
		public static function buildMatrix( vClip:DisplayObject=null, adjustment:String=null, ...values ):Array
		{
			var transform:TransformMatrix = new TransformMatrix( vClip );
			
			// if no arguments are passed, return a blank matrix.
			if ( adjustment == null ) return transform.matrix;
			
			// otherwise update the matrix and return it.
			return updateMatrix( transform, adjustment, values );
		}	
		
		
		/**
		 * Performs a color adjustment and returns the new matrix. 
		 */
		protected static function updateMatrix( vTransform:TransformMatrix, vAdjustment:String, values:Array ):Array
		{
			switch ( vAdjustment )
			{
				case TransformMatrixUtil.LOCATION:
					vTransform.setLocation( values[ 0 ], values[ 1 ]);
					break;
					
				case TransformMatrixUtil.ROTATION:
					vTransform.setRotation( values[ 0 ]);
					break;
					
				case TransformMatrixUtil.SCALE:
					vTransform.setScale( values[ 0 ], values[ 1 ]);
					break;
					
				case TransformMatrixUtil.SHEAR:
					vTransform.setShear( values[ 0 ], values[ 1 ]);
					break;
			}
			return vTransform.matrix;
		}
		
		
		/**
		 * Method to return the matrix from a clip's TransformMatrix object. 
		 * 
		 * @param	vClip	MovieClip whose ColorMatrixFilter matrix to look for.
		 * @return	The matrix of the TransformMatrix.
		 */
		public static function getMatrix( vClip:DisplayObject ):Array
		{
			var vTrans:TransformMatrix = new TransformMatrix( vClip );
			return vTrans.matrix;
		}	
		
		
		/**
		 * Method to return the matrix from a clip's TransformMatrix object. 
		 * 
		 * @param	vClip	MovieClip whose ColorMatrixFilter matrix to look for.
		 * @return	The clip's TransformMatrix.
		 */
		public static function getTransformMatrix( vClip:DisplayObject ):TransformMatrix
		{
			var vTrans:TransformMatrix = new TransformMatrix( vClip );
			return vTrans;
		}
		
		
		/**
		 * Applies a transformation matrix to the specified movieclip. 
		 * 
		 * @param	vClip		Target clip to transform. 
		 * @param	vMatrix		The transform matrix to be applied.
		 * @see com.factorylabs.orange.core.filters.TransformMatrix
		 */
		public static function applyMatrix( vClip:DisplayObject, vMatrix:Array ):void
		{
			// apply the change. 
			ApplyMatrix.transform( vClip, vMatrix );
		}
		
		/**
		 * Sets an adjustment on a specified matrix. The change is relative to the matrix properties already in place on the movieclip (i.e. adds to them).
		 * 
		 * @param	vBaseMatrix		Target clip to transform. 
		 * @param	vAdjustment		Represents the method in TransformMatrix to use for the adjustment.
		 * @param	vNum			Value of the change.
		 * @return	An array representing the current transform matrix.
		 * @see com.factorylabs.orange.core.filters.TransformMatrix
		 */
		public static function adjustMatrix( vBaseMatrix:Array, vAdjustment:String, ...values ):Array
		{
			// create ColorMatrix object and set its matrix to the base matrix.
			var vTransform:TransformMatrix = new TransformMatrix();
			vTransform.matrix = vBaseMatrix;
			
			// update the matrix and return it.
			return updateMatrix( vTransform, vAdjustment, values );
		}
		
		/**
		 * Applies a transformation matrix to the specified movieclip. 
		 * 
		 * @param	vClip		Target clip to transform. 
		 * @param	vMatrix		The transform matrix that 
		 * @param	vNum		Change amount. Some tranformation allow multiple properties. Pass additional arguments after vNum to send those arguments.
		 * @see com.factorylabs.orange.core.filters.TransformMatrix
		 */
		public static function applyTransform( vClip:DisplayObject, vMatrix:Array ):void
		{
			// apply the change. 
			ApplyMatrix.transform( vClip, vMatrix );
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
		 
		public static function createTransformTween( vClip:DisplayObject, vEase:Function, vBeginMatrix:Array, vEndMatrix:Array, vDuration:Number,  vUseSecs:Boolean=false ):TweenMatrix
		{
			// set defaults values if the following variables have been ommitted.
			var ease:Function = ( vEase == null ) ? Linear.easeInOut : vEase;
			
			// run the tween.
			var vTween:TweenMatrix = new TweenMatrix( vClip, ApplyMatrix.transform, ease, vBeginMatrix, vEndMatrix, vDuration, vUseSecs );
			return vTween;
		}*/
	}
}
class SingletonEnforcer {}