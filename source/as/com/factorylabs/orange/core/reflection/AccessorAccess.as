package com.factorylabs.orange.core.reflection
{

	public final class AccessorAccess
	{
		public static const READ_ONLY:AccessorAccess = new AccessorAccess(READ_ONLY_VALUE);
		public static const WRITE_ONLY:AccessorAccess = new AccessorAccess(WRITE_ONLY_VALUE);
		public static const READ_WRITE:AccessorAccess = new AccessorAccess(READ_WRITE_VALUE);
		
		private static const READ_ONLY_VALUE:String = "readonly";
		private static const WRITE_ONLY_VALUE:String = "writeonly";
		private static const READ_WRITE_VALUE:String = "readwrite";
		
		private var _name:String;
		
		/**
		 * Creates a new <code>AccessorAccess</code> instance.
		 * 
		 * @param name the name of the accessor access
		 */
		public function AccessorAccess(name:String) 
		{
			//if(enforcer == null) throw new ArgumentNullError("enforcer");
			//TODO: revist making this constructor internal via singleton mechanics.
			_name = name;
		}
		
		/**
		 * 
		 */
		public static function fromString(access:String):AccessorAccess 
		{
			var result:AccessorAccess;
			switch (access) 
			{
				case READ_ONLY_VALUE:
					result = READ_ONLY;
					break;
				case WRITE_ONLY_VALUE:
					result = WRITE_ONLY;
					break;
				case READ_WRITE_VALUE:
					result = READ_WRITE;
					break;
			}
			return result;
		}
		
		public function toString():String
		{
			return _name;
		}
	}
}

class PrivateEnforcer {}
