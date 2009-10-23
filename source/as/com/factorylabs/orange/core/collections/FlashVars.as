
package com.factorylabs.orange.core.collections 
{
	import com.factorylabs.orange.core.collections.Map;

	import flash.display.Stage;

	/**
	 * This class contains Flash vars that are written to the Flash Application.
	 * 
	 * 
	 * @author Grant
	 */
	public class FlashVars 
		extends Map
	{
/* Properties ......................................................................................*/

		/**
		 *	Single instance of this class.
		 */
		private static var _instance:FlashVars;

/* Constructor ......................................................................................*/
				
		/**
		 * Singleton constructor. 
		 */
		public function FlashVars( enforcer:SingletonEnforcer ):void 
		{
			enforcer = null;
			super();
		}
		
		public function initialize( stage : Stage ) : void
		{
			// loop through the flashvar params on root and populate a Map
			var flashParams:Object = stage.loaderInfo.parameters;
			for(var flashvar:String in flashParams) { this.add( flashvar, flashParams[ flashvar ]); }
		}
		
/* Singleton Instance Accessor ......................................................................................*/
		
		/**
		 * Singleton accessor method.
		 * 
		 * <p>Use this method to return the single instance of this object. Below is an example
		 * of using the getInstance() method:</p>
		 * 
		 * <listing>
		 * var instance:FlashVars = FlashVars.getInstance();
		 * </listing>
		 * 
		 * @return 	The single instance of FlashVars
		 */
		public static function get instance() :FlashVars { return getInstance(); }
		public static function getInstance():FlashVars
		{
			if ( _instance == null ) _instance = new FlashVars( new SingletonEnforcer() );
			return _instance;	
		}
		
		override public function toString() :String 
		{
			return "com.factorylabs.orange.core.collections.FlashVars";
		}
	}
}
/**
 * Internal type to enforce using getInstance() to create an instance of FlashVars. 
 */
internal class SingletonEnforcer {}