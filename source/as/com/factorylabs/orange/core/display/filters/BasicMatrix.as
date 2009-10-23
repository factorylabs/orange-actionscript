﻿/** *	This class provides several simple methods for manipulating matrix arrays and is used as the basis for the {@link com.factorylabs.fdlCore.filters.TransformMatrix} and {@link com.factorylabs.fdlCore.filters.ColorMatrix} classes. * *	Copyright 2006 by Factory Design Labs, All Rights Reserved. *	<a href="http://www.factorylabs.com/">www.factorylabs.com</a> * *	@example		The following is an example usage of this class: *	<code> *		// create a matrix. * 	var vMatrix:BasicMatrix = new BasicMatrix( [ 1, 1, 1, 1 ] ); * *		// add this matrix with another. *		vMatrix.plus( vMatrix.matrix, [ 2, 2, 2, 2 ] ); * *		// get the resulting array. *		var vArray:Array = vMatrix.matrix; *	</code> * *	TODO:			1. The concat method needs to be refactored to handle arrays of varying lengths. * * @author 		Grant Davis * @author 		Matthew Kitt *	@author		beatport *	@version		1.0.0 :: 07.02.2007 *	@since			1.0.0 */package com.factorylabs.orange.core.display.filters{		public class BasicMatrix	{			/* PROPERTIES ................................................................................ */			/**		 * The matrix array manipulated by this BasicMatrix class.		 */		protected var _matrix_arr:Array;				/**		 * The original matrix object.		 */		protected var _originalMatrix_arr:Array;				/* CONSTRUCTOR ............................................................................ */			/**		 * Instantiates with the option of passing in a matrix array.		 *	@param	vMatrix		[Optional] Array of data used by the matrix.		 */		public function BasicMatrix( vMatrix:Array = null )		{			if ( vMatrix != null ) saveOriginal( vMatrix );		}				/**		 * @return	the string equivalent of this class. 		 */		public function toString():String { return "[Object com.factorylabs.fdlCore.geom.BasicMatrix]"; }				/* METHODS ................................................................................... */			/**		 * Saves the matrix passed as the original matrix.		 *	@param	vMatrix		Array of data used by the matrix.		 */		protected function saveOriginal( vMatrix:Array ):void		{			// save the matrix.			_originalMatrix_arr = vMatrix;						// reset the working matrix array.			reset();		}				/**		 * Resets the existing matrix to the original matrix.		 */		public function reset():void		{			matrix = copyArray( _originalMatrix_arr );				}				/**		 * Add the effects of two matricies together.		 * 		 * @param	vM1		The old matrix to which we are adding.		 * @param	vM2		The new matrix to add with the old.		 * @return	A new matrix with values added together.		 */		public function plus( vM1:Array, vM2:Array ):Array		{			// declare variables.			var vTemp:Array = [];			var vTotal:Number = vM1.length;						// loop through the two matricies adding the indexes together.			for ( var i:Number = 0; i < vTotal; i++ ) vTemp[ i ] = vM1[ i ] + vM2[ i ];						// set the matrix array.			return vTemp;		}				/**		 * Blend the effects of two matricies together by "x" amount.		 * 		 * @param	vM1			the old matrix to which we are blending.		 * @param	vM2			the new matrix to blend with the old.		 * @param	amount		the amount of the new matrix to apply to the old matrix.		 * @return	A new matrix with values blended together.		 */		public function blend( vM1:Array, vM2:Array, amount:Number ):Array		{			// declare variables.			var vTotal:Number = vM1.length;			var vTemp:Array = [];			var inv_amount:Number = 1 - amount;						// loop through the old matrix, blending new values with the current values.			for ( var i:Number = 0; i < vTotal; i++ ) vTemp[ i ] = inv_amount * vM1[ i ] + amount * vM2[ i ];						// return the blended array.			return vTemp;		}				/**		 * Adds the effects of two matricies together... currently assumes a 20 index array.		 *	@param	mat		the matrix to concat with the current matrix.		 */		protected function concat( mat:Array ):void		{			// declare variables.			var vCurr:Array = matrix;			var temp:Array = [];			var i:Number = 0;						// loop through the rows of the _matrix_arr.			for ( var y:Number = 0; y < 4; y++ )			{				// loop through columns of the _matrix_arr.				for ( var x:Number = 0; x < 5; x++ )				{					temp[ i + x ] = mat[ i    ] * vCurr[x     ] + 								   mat[ i + 1 ] * vCurr[ x +  5 ] + 								   mat[ i + 2 ] * vCurr[ x + 10 ] + 								   mat[ i + 3 ] * vCurr[ x + 15 ] +								   ( x == 4 ? mat[ i + 4 ] : 0 );				}				i += 5;			}						// save the effects of the concatination.			_matrix_arr = temp;		}				/**		 * Makes sure that a matrix only has the x number of elements.		 *		 *	@param	vArray		Matrix array to clean.		 *	@param	vLimit		Length of the desired limit.		 */		protected function clean( vArray:Array, vLimit:Number ):Array		{			// if the length is too long.... slice it.			if ( vArray.length > vLimit ) vArray.slice( 0, vLimit - 1 );						// otherwise, if it is too short.			else if ( vArray.length < vLimit )			{				// declare variables.				var vDiff:Number = vLimit - vArray.length;								// add 0's into the remaining places.				for ( var i:Number = 0; i < vDiff; i++ ) vArray.push( 0 );			}						// return the cleaned array.			return vArray;		}				/**		 * @param	vArr	array to copy.		 */		protected function copyArray( vArr:Array ):Array		{			var vTemp:Array = [];			var dl:int = vArr.length;			for( var i:int = 0; i < dl; ++i ) vTemp[ i ] = vArr[ i ];			return vTemp;		}		/* EVENT HANDLERS ...................................................................... */	/* GETTERS/SETTERS ..................................................................... */			/**		 * @return	A copy of the working matrix array.		 */		public function get matrix():Array		{			return copyArray( _matrix_arr );		}				/**		 * @param	vNew		Sets the current matrix array.		 */		public function set matrix( vNew:Array ):void		{			_matrix_arr = vNew;		}				/**		 * @return	[Read-Only] the original matrix.		 */		public function get original():Array		{			return copyArray( _originalMatrix_arr );		}	}}