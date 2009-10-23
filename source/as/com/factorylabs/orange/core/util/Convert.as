
package com.factorylabs.orange.core.util
{
	
	/**
	 * Makes one thing into another thing all by magic and wizadry.
	 * 
	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Mar 9, 2009
	 */
	public final class Convert
	{
		// TODO: is it necessary to throw an error here? or should we just go ahead and return false - MK
		public static function toBool(value:*):Boolean
		{			
			if(value is String)
			{
				if(value == "false")
					return false;
				else if (value == "true")
					return true;
				else
					throw new ConversionError("Invalid format for Boolean: " + value);
			}
			else if(value is int)
			{
				if(value == 0)
					return false;
				else if (value == 1)
					return true;
				else
					throw new ConversionError("Invalid format for Boolean: " + value);
			}
			else
			{
				throw new ConversionError("Invalid format for Boolean: " + value);
			}
		}
		
		/**
		 * TODO: This is a number formatter.. get this out of here - MK
		 *	Converts milliseconds into a nicely-formatted time display
		 *	@param	milliSeconds		the milliseconds to convert
		 */
		public static function convertTime( milliSeconds:Number ):String
		{
			var secs:Number = Math.floor(milliSeconds/1000);
			var mins:Number = Math.floor(secs/60);
			secs %= 60;
			
			var secsStr:String = String( secs );
			var minsStr:String = String( mins );
			
			if ( secs < 10 ) secsStr = "0"+secs; 
			if ( mins < 10)  minsStr = "0"+mins;
			
			// don't return if NaN
			if( minsStr == 'NaN' || secsStr == 'NaN' )
			{
				return( '' );
			}
			else
			{
				return( minsStr + ":" + secsStr );
			}
		}
	}
}

class ConversionError
	extends Error
{
	public function ConversionError(msg:String)
	{
		super(msg);
	}
}