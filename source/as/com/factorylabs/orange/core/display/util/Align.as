
package com.factorylabs.orange.core.display.util
{
	import flash.display.DisplayObject;

	/**
	 *	The Align class is an all-static class which does the functions of the align tool from within the IDE as well as some 
	 *	extras like aligning to grids.
	 *
	 *	This class is never instantiated, simply import and make use of one of its methods.
	 *
	 *	Copyright 2007 by Factory Design Labs, All Rights Reserved.
	 *	<a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 * 
	 *@example		The following is an example usage of this class:
	 *	<code>
	 *		// create an array to deal with the return
	 *		var posArray:Array = Align.alignGrid( _buttonArray, 60, 60, 8, 1, 1, false, true );
	 *		
	 *		// loop through the array and extract out the x y values from the object
	 *		for( var i:uint = 0; i < posArray.length; i++ )
	 *		{
	 *			trace( "Coordinates( x, y ) = ( " + posArray[ i ].xp + ", " + posArray[ i ].yp + " )" );
	 *			_buttonArray[ i ].tweenX = new Tween( _buttonArray[ i ], "_x", _buttonArray[ i ]._x, posArray[ i ].xp, 40, Expo.easeOut, false, false );
	 *			_buttonArray[ i ].tweenY = new Tween( _buttonArray[ i ], "_y", _buttonArray[ i ]._y, posArray[ i ].yp, 40, Expo.easeOut, false, false );
	 *		}
	 *
	 *	</code>
	 *
	 *
	 * @author 		Ryan Boyajian
	 *	@version		3.0.0 :: 08.14.2007 // converted to AS 3.0
	 *	@since			2.0.0
	 */
	
	public final class Align
	{
		
	/* PROPERTIES ................................................................................ */
	
	/* CONSTRUCTOR ............................................................................ */
	
		/**
		 * This is a static class, therefore the constructor is private and empty.
		 */
		public function Align(){}
		
		/**
		 * @return	the string equivalent of this class. 
		 */
		public function toString():String { return "[Object com.factorylabs.fdlCore.utils.Align]"; }
		
	
	/* METHODS ................................................................................... */
		
		/**
		 * Aligns an array of buttons' to an x or y position.
		 *
		 * @param	btnArray	the array of buttons to be positioned
		 * @param	xp			[Optional] the x position that the clips should be moved default is 0
		 * @param	yp			[Optional] the y position that the clips should be moved default is 0
		 * @param	alignType	[Optional] values: "left", "right", "vCenter", "top", "bottom", "hCenter"; default is "left"
		 * @param	alignNow	[Optional] a boolean of weather the positioning will happen now or later
		 * @param	floor		[Optional] a boolean of weather the position x, y values will use Math.floor
		 * @return	the array of Objects with a xp and a yp property. 
		 * @use		{@code var positionArray:Array = Align.align( _buttonArray, 60, 60, "left", false );}
		 */
		public static function align( btnArray:Array, xp:int = 0, yp:int = 0, alignType:String = "left", alignNow:Boolean = true, floor:Boolean = true ):Array
		{				
			// create new array to return
			var posArr:Array = [];
			var xPos:int;
			var yPos:int;
			
			// loop through btnArray
			var dl:uint = btnArray.length;
			for( var i:uint = 0; i < dl; i++ )
			{
				// object to hold the x, y positions
				var posObj:Object = new Object();
				
				// switch case for all the different types of alignment
				switch( alignType ) 
				{
					case "left":
						xPos = xp;
					break;
					case "right":
						xPos = xp - btnArray[ i ].width;
					break;
					case "vCenter":
						xPos = xp - ( btnArray[ i ].width/2 );
					break;
					case "top":
						yPos = yp;
					break;
					case "bottom":
						yPos = yp -  btnArray[ i ].height;
					break;
					case "hCenter":
						yPos = yp - ( btnArray[ i ].height/2 );
					break;
				}
				// position if alignNow is true
				if( alignNow == true )
				{
					if( floor == true )
					{
						btnArray[ i ].x = Math.floor( xPos );
						btnArray[ i ].y = Math.floor( yPos );
					}
					else
					{
						btnArray[ i ].x = xPos;
						btnArray[ i ].y = yPos;
					}
				}
				// set props of posObj and add to array
				if( floor == true )
				{
					posObj[ 'xp' ] = Math.floor( xPos );
					posObj[ 'yp' ] = Math.floor( yPos );
				}
				else
				{
					posObj[ 'xp' ] = xPos;
					posObj[ 'yp' ] = yPos;
				}
				posArr.push(posObj);
			}
			// return array
			return posArr;
		}
		
		/**
		 * Aligns an array of buttons' to a grid horizontally   ( 1  2  3  4 )
		 *														( 5  6  7  8 )
		 *														( 9 10 11    )	
		 *
		 * @param	btnArray	the array of buttons to be positioned
		 * @param	xp			[Optional] the x position that the clips should be moved default is 0
		 * @param	yp			[Optional] the y position that the clips should be moved default is 0
		 * @param	cols		[Optional] the number of columns the grid should have default is 5
		 * @param	spacerX		[Optional] the amount of space between grid objects on the x axis default is 5
		 * @param	spacerY		[Optional] the amount of space between grid objects on the y axis default is 5
		 * @param	alignNow	[Optional] a boolean of weather the positioning will happen now or later default is true
		 * @param	floor		[Optional] a boolean of weather the position x, y values will use Math.floor
		 * @return	the array of Objects with a xp and a yp property. 
		 * @use		{@code var positionArray:Array = Align.alignGrid( _buttonArray, 60, 60, 8, 1, 1, false );}
		 */
		public static function alignGrid( btnArray:Array, xp:int = 0, yp:int = 0, cols:uint = 5, spacerX:int = 5, spacerY:int = 5, alignNow:Boolean = true, floor:Boolean = true ):Array
		{
			// set default spacer values
			var curY:int = yp;
			var curX:int = xp;
			
			// create new array to return
			var posArr:Array = [];
			var dl:uint = btnArray.length;
			for( var i:uint = 0; i < dl; i++ )
			{
				// object to hold the x, y positions
				var posObj:Object = new Object();
				
				// position if alignNow is true
				if( alignNow == true )
				{
					if( floor == true )
					{
						btnArray[ i ].x = Math.floor( curX );
						btnArray[ i ].y = Math.floor( curY );
					}
					else
					{
						btnArray[ i ].x = curX;
						btnArray[ i ].y = curY;
					}
				}
				// set props of posObj and add to array
				if( floor == true )
				{
					posObj[ 'xp' ] = Math.floor( curX );
					posObj[ 'yp' ] = Math.floor( curY );
				}
				else
				{
					posObj[ 'xp' ] = curX;
					posObj[ 'yp' ] = curY;
				}
				posArr.push( posObj );
				
				// increment position.
				curX += spacerX;
				
				// start new row if needed
				if( ( i + 1 ) % cols == 0 )
				{
					curY += spacerY;
					curX = xp;
				}
			}
			// return array
			return posArr;
		}
		
				/**
		 * Aligns an array of buttons' to a grid horizontally   ( 1  2  3  4 )
		 *														( 5  6  7  8 )
		 *														( 9 10 11    )	
		 *
		 * @param	btnArray	the array of buttons to be positioned
		 * @param	xp			[Optional] the x position that the clips should be moved default is 0
		 * @param	yp			[Optional] the y position that the clips should be moved default is 0
		 * @param	cols		[Optional] the number of columns the grid should have default is 5
		 * @param	spacerX		[Optional] the amount of space between grid objects on the x axis default is 5
		 * @param	spacerY		[Optional] the amount of space between grid objects on the y axis default is 5
		 * @param	alignNow	[Optional] a boolean of weather the positioning will happen now or later default is true
		 * @param	floor		[Optional] a boolean of weather the position x, y values will use Math.floor
		 * @return	the array of Objects with a xp and a yp property. 
		 * @use		{@code var positionArray:Array = Align.alignGrid( _buttonArray, 60, 60, 8, 1, 1, false );}
		 */
		public static function alignGridRelativeWidths( btnArray:Array, xp:int = 0, yp:int = 0, cols:uint = 5, spacerX:int = 5, spacerY:int = 5, alignNow:Boolean = true, floor:Boolean = true ):Array
		{
			// set default spacer values
			var curY:Number = yp;
			var curX:Number = xp;
			
			// create new array to return
			var posArr:Array = [];
			var dl:uint = btnArray.length;
			for( var i:uint = 0; i < dl; i++ )
			{
				// object to hold the x, y positions
				var posObj:Object = new Object();
				
				// position if alignNow is true
				if( alignNow == true )
				{
					if( floor == true )
					{
						btnArray[ i ].x = Math.floor( curX );
						btnArray[ i ].y = Math.floor( curY );
					}
					else
					{
						btnArray[ i ].x = curX;
						btnArray[ i ].y = curY;
					}
				}
				// set props of posObj and add to array
				if( floor == true )
				{
					posObj[ 'xp' ] = Math.floor( curX );
					posObj[ 'yp' ] = Math.floor( curY );
				}
				else
				{
					posObj[ 'xp' ] = curX;
					posObj[ 'yp' ] = curY;
				}
				posArr.push( posObj );
				
				// increment position.
				curX += btnArray[ i ].width + spacerX;
				
				// start new row if needed
				if( ( i + 1 ) % cols == 0 )
				{
					curY += btnArray[ i ].height + spacerY;
					curX = xp;
				}
			}
			// return array
			return posArr;
		}
		
		/**
		 * Aligns an array of buttons' to a grid vertically   ( 1  4  7 10 )
		 *													  ( 2  5  8 11 )
		 *													  ( 3  6  9    )	
		 *
		 * @param	btnArray	the array of buttons to be positioned
		 * @param	xp			[Optional] the x position that the clips should be moved default is 0
		 * @param	yp			[Optional] the y position that the clips should be moved default is 0
		 * @param	cols		[Optional] the number of columns the grid should have default is 5
		 * @param	spacerX		[Optional] the amount of space between grid objects on the x axis default is 5
		 * @param	spacerY		[Optional] the amount of space between grid objects on the y axis default is 5
		 * @param	alignNow	[Optional] a boolean of weather the positioning will happen now or later default is true
		 * @param	floor		[Optional] a boolean of weather the position x, y values will use Math.floor
		 * @return	the array of Objects with a xp and a yp property. 
		 * @use		{@code var positionArray:Array = Align.alignGridVert( _buttonArray, 60, 60, 8, 1, 1, false );}
		 */
		public static function alignGridVert( btnArray:Array, xp:int = 0, yp:int = 0, cols:uint = 5, spacerX:int = 5, spacerY:int = 5, alignNow:Boolean = true, floor:Boolean = true ):Array
		{
			// create new array to return
			var posArr:Array = [];
			
			// positioning.
			var rows:int = Math.floor( ( btnArray.length / cols ) ) ;
			var hangers:uint = btnArray.length % cols;
			var position:int = 0;
			// draw grid
			for( var i:uint = 0; i < cols; i++ )
			{
				var vRows:int = rows;
				if( hangers > 0 ) vRows++;
				for( var j:uint = 0; j < vRows; j++ )
				{
					// object to hold the x, y positions
					var posObj:Object = new Object();
					
					var curX:int = xp + ( i * ( btnArray[ position ].width + spacerX ) );
					var curY:int = yp + ( j * ( btnArray[ position ].height + spacerY ) );
					// if alignNow is true position now
					if( alignNow == true )
					{
						if( floor == true )
						{
							btnArray[ position ].x = Math.floor( curX );
							btnArray[ position ].y = Math.floor( curY );
						}
						else
						{
							btnArray[ position ].x = curX;
							btnArray[ position ].y = curY;
						}
					}
					
					// set props of posObj and add to array
					if( floor == true )
					{
						posObj[ 'xp' ] = Math.floor( curX );
						posObj[ 'yp' ] = Math.floor( curY );
					}
					else
					{
						posObj[ 'xp' ] = curX;
						posObj[ 'yp' ] = curY;
					}
					posArr.push( posObj );
					
					// increment position
					position++;
				}
				if( hangers > 0 ) hangers--;
			}
			// return array
			return posArr;
		}
		
		/**
		 * Aligns an array of buttons' to an x or y position.
		 *
		 * @param	btnArray	the array of buttons to be positioned
		 * @param	xp			array of two values [ starting x position, ending x position ]
		 * @param	yp			array of two values [ starting y position, ending y position ]
		 * @param	distributeType	[Optional] values: "left", "right", "center", "bottomLeft", "bottomRight", "bottomCenter"; left is default
		 * @param	roundCoords	[Optional] a boolean of weather the return values will be rounded default is true
		 * @param	alignNow	[Optional] a boolean of weather the positioning will happen now or later default is true
		 * @param	floor		[Optional] a boolean of weather the position x, y values will use Math.floor
		 * @return	the array of Objects with a xp and a yp property. 
		 * @use		{@code var positionArray:Array = Align.distribute( _buttonArray, 60, 60, "left", true, false );}
		 */
		public static function distribute( btnArray:Array, xp:Array, yp:Array, distributeType:String = "left", roundCoords:Boolean = true, alignNow:Boolean = true, floor:Boolean = true ):Array
		{
			// create new array to return
			var posArr:Array = [];
			
			// grab beginning and end x and y values
			var xStart:int = int( xp[ 0 ] );
			var xEnd:int = int( xp[ 1 ] );
			var yStart:int = int( yp[ 0 ] );
			var yEnd:int = int( yp[ 1 ] );
			
			// find the delta of the x and y positions
			var xDelta:int = xEnd - xStart;
			var yDelta:int = yEnd - yStart;
			
			// find the number to increment by
			var xInc:int = xDelta/btnArray.length;
			var yInc:int = yDelta/btnArray.length;
			
			var xIncrement:int;
			var yIncrement:int;
			
			// if roundCoords is true round the number that will come out of the array
			if( roundCoords == true )
			{
				xIncrement = Math.round( xInc + ( xInc / ( btnArray.length - 1 ) ) );
				yIncrement = Math.round( yInc + ( yInc / ( btnArray.length - 1 ) ) );
			}
			else
			{
				xIncrement = xInc + ( xInc / ( btnArray.length - 1 ) );
				yIncrement = yInc + ( yInc / ( btnArray.length - 1 ) );
			}
			
			// vars for x and y position
			var xPos:int = xStart;
			var yPos:int = yStart;
			var curXPos:int;
			var curYPos:int;
			
			// loop through btnArray
			var dl:uint = btnArray.length;
			for( var i:uint = 0; i < dl; i++ )
			{
				// object to hold the x, y positions
				var posObj:Object = new Object();
				
				// switch case for all the different types of alignment
				switch( distributeType ) 
				{
					case "left":
						curXPos = xPos;
						curYPos = yPos;
					break;
					case "right":
						curXPos = xPos - btnArray[ i ]._width;
						curYPos = yPos;
					break;
					case "center":
						curXPos = xPos - ( btnArray[ i ]._width/2 );
						curYPos = yPos;
					break;
					case "bottomLeft":
						curXPos = xPos;
						curYPos = yPos - btnArray[ i ]._height;
					break;
					case "bottomRight":
						curXPos = xPos - btnArray[ i ]._width;
						curYPos = yPos - btnArray[ i ]._height;
					break;
					case "bottomCenter":
						curXPos = xPos - ( btnArray[ i ]._width/2 );
						curYPos = yPos - btnArray[ i ]._height;
					break;
				}
				// position if alignNow is true, null, or undefined 
				if( alignNow == true )
				{
					if( floor == true )
					{
						btnArray[ i ].x = Math.floor( curXPos );
						btnArray[ i ].y = Math.floor( curYPos );
					}
					else
					{
						btnArray[ i ].x = curXPos;
						btnArray[ i ].y = curYPos;
					}
				}
				// push x, y values into objects
				if( floor == true )
				{
					posObj[ 'xp' ] = Math.floor( curXPos );
					posObj[ 'yp' ] = Math.floor( curYPos );
				}
				else
				{
					posObj[ 'xp' ] = curXPos;
					posObj[ 'yp' ] = curYPos;
				}
				
				// increment x and y pos
				xPos += xIncrement;
				yPos += yIncrement;
				
				// push object into array
				posArr.push( posObj );
			}
			// return array
			return posArr;
		}
		
		
		public static function alignToObject( target:DisplayObject, object:DisplayObject, alignType:String="T" ):void
		{
			switch( alignType ) 
			{
				case "T":
					target.x = int((object.width / 2 ) - ( target.width / 2 ));
					target.y = 0;
					break;
				case "TL":
					target.x = 0;
					target.y = 0;
					break;
				case "TR":
					target.x = object.width - target.width;
					target.y = 0;
					break;
				case "B":
					target.x = int( object.width / 2 - target.width / 2 );
					target.y = object.height - target.height;
				case "BL":
					target.x = 0;
					target.y = object.height - target.height;
					break;
				case "BR":
					target.x = object.width - target.width;
					target.y = object.height - target.height;
					break;
			}
		}
		
	
	/* EVENT HANDLERS ...................................................................... */
	/* GETTERS/SETTERS ..................................................................... */
	
		
	}
}