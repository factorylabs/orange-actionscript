
package com.factorylabs.orange.core.display.util
{
	import Error;	import flash.text.TextField;	
	/**
	* Utils for TexField classes.
	* @author Justin Gitlin
	* @version 0.1
	*/
	public final class TextFieldUtil
	{			
		/**
		 *	Creates a new Sprite inside a specific container with a specific position.
		 *	TODO: Can this be deprecated? - MK
		 *	
		 *	@param	tf			TextField that we're styling.
		 *	@param	styleObject	Styles?	
		 */
		public static function styleTextField( tf :TextField, styleObj :Object ):void
		{
			try 
            {
				for( var it:* in styleObj )
				{
					tf[it] = styleObj[it];
				}
            }
            catch( e:Error ) 
            {
                throw new Error( '[TextFieldUtil].styleTextField()' ) ;
            }
		}
	}
}
