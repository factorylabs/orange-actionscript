
package com.factorylabs.orange.core.util
{
	
	/**
	 * Makes one thing into another thing all by magic and wizadry.
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
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Mar 9, 2009
	 */
	public final class Convert
	{
		public static function toBool( $value :* ) :Boolean
		{			
			if( $value is String )
			{
				if( $value == 'false' )
					return false;
				else if ( $value == 'true' )
					return true;
				else
					throw new ConversionError( 'Invalid format for Boolean: ' + $value );
			}
			else if( $value is int )
			{
				if( $value == 0 )
					return false;
				else if ( $value == 1 )
					return true;
				else
					throw new ConversionError( 'Invalid format for Boolean: ' + $value );
			}
			else
			{
				throw new ConversionError( 'Invalid format for Boolean: ' + $value );
			}
		}
		
		/**
* TODO: This is a number formatter.. get this out of here! - MK
		 *	Converts milliseconds into a nicely-formatted time display
		 *	@param	$milliSeconds	the milliseconds to convert
		 */
		public static function convertTime( $milliSeconds:Number ) :String
		{
			var secs :Number = Math.floor( $milliSeconds / 1000 );
			var mins :Number = Math.floor( secs / 60 );
			secs %= 60;
			
			var secsStr :String = String( secs );
			var minsStr :String = String( mins );
			
			if( secs < 10 ) secsStr = '0' + secs; 
			if( mins < 10)  minsStr = '0' + mins;
			
			// don't return if NaN
			if( minsStr == 'NaN' || secsStr == 'NaN' )
				return( '' );
			else
				return( minsStr + ':' + secsStr );
		}
	}
}

class ConversionError
	extends Error
{
	public function ConversionError( $msg :String )
	{
		super( $msg );
	}
}