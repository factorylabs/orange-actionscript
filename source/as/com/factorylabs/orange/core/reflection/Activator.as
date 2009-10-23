package com.factorylabs.orange.core.reflection
{
	import flash.utils.getDefinitionByName;
	
	/**
	 *	Class for creating instances dynamically at runtime.
	 */
	public final class Activator
	{
		
		/**
		 * Creates an instance of the given class and passes the arguments to
		 * the constructor.
		 * 
		 * TODO: find a generic solution for this. Currently we support constructors
		 * with a maximum of 10 arguments.
		 * 
		 * @param type the class from which an instance will be created
		 * @param args the arguments that need to be passed to the constructor
		 */
		public static function activateType(type:Class, args:Array = null):* {
			var result:*;
			
			if (args == null)
				args = [];
			
			switch(args.length) {
				case 1:
					result = new type(args[0]);
					break;
				case 2:
					result = new type(args[0], args[1]);
					break;
				case 3:
					result = new type(args[0], args[1], args[2]);
					break;
				case 4:
					result = new type(args[0], args[1], args[2], args[3]);
					break;
				case 5:
					result = new type(args[0], args[1], args[2], args[3], args[4]);
					break;
				case 6:
					result = new type(args[0], args[1], args[2], args[3], args[4], args[5]);
					break;
				case 7:
					result = new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
					break;
				case 8:
					result = new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
					break;
				case 9:
					result = new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]);
					break;
				case 10:
					result = new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
					break;
				default:
					result = new type();	
			}
			
			return result;
		}
		
		/**
		 * Creates and instance of a Class from a TypeInfo representation of the class.
		 * @param typeInfo the TypeInfo object from which an instance will be created
		 * @param args the arguments that need to be passed to the constructor
		 */
		public static function activateTypeInfo(typeInfo:TypeInfo, args:Array = null):*
		{
			return Activator.activateType(typeInfo.type, args);
		}
	
		/**
		 * Creates and instance of a Class from it's qualified name.
		 * @param name the fully qualified class name from which an instance will be created
		 * @param args the arguments that need to be passed to the constructor
		 */
		public static function activateTypeFromName(name:String, args:Array = null):*
		{
			return Activator.activateType(getDefinitionByName(name) as Class, args);
		}
	
	}
}