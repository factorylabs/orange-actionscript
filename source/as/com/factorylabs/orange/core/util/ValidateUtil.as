package com.factorylabs.orange.core.util{	/**	 * Utils for front-end form validation.	 * @author Justin Gitlin, Ryan Boyajian	 * @version 0.1	 */	public final class ValidateUtil 	{		/**		 * Checks to see if a string is a valid email. ( Original RegExp by Senocular [http://www.senocular.com/] )		 * modified to include the "+" in the local-part by RB.		 */		public static function isValidEmail( email:String ):Boolean {		    var emailExpression:RegExp = /^([a-zA-Z0-9_\.\+\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;		    return emailExpression.test(email);		}				/**		 * Checks to see if a string is a proper formatted US zip code.		 * 12345 and 12345-1234 will return true.		 */		public static function isValidUSZip( zip:String ):Boolean		{		    var zipExpression:RegExp = /(^\d{5}$)|(^\d{5}-\d{4}$)/;		    return zipExpression.test( zip );		}				/**		 * Checks to see if a string is a proper formatted Canadian postal code.		 * A1B2C3 or A1B 2C3 will return true.		 */		public static function isValidCanPostal( postal:String ):Boolean		{		    var postalExpression:RegExp = /^[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ]\s?\d[ABCEGHJKLMNPRSTVWXYZ]\d$/;		    return postalExpression.test( postal );		}				/**		 * Checks to see if the string is a valid phone number.		 * 7777777, 777 7777, or 777-7777 will return true.		 * 		 * TODO: Needs to support an area code?		 * TODO: should support 303.666.6666 or (303) 666.6666 - or at least strip the parenthesis.		 */		public static function isValidPhoneNumber( number:String ):Boolean		{			var numberExpression:RegExp = /^\d{3}(-|\s)?\d{4}$/;			return numberExpression.test( number );		}				/**		 * Makes sure the string is a valid area code.		 * 123 will return true.		 */		public static function isValidAreaCode( areaCode:String ):Boolean		{			var areaExpression:RegExp = /^\d{3}$/;			return areaExpression.test( areaCode );		}				/**		 * Checks to see if a form element is filled out		 * TODO: deprecate this.. there is a more robust call in StringUtil.		 */		public static function isNotEmpty( txt:String ):Boolean {		    if( txt != '' && txt != null )		    {		    	return true;		    }		    else		    {		    	return false;		    }		}	}}