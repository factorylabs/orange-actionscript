package com.factorylabs.orange.core.reflection
{
	public final class Accessor extends MemberInfo
	{
		private var _access:AccessorAccess;
		private var _declaringTypeInfo:TypeInfo;
		
		public function get access():AccessorAccess { return _access; }
		public function get declaringTypeInfo():TypeInfo { return _declaringTypeInfo; }
		
		/**
		 * Creates a new <code>Accessor</code> instance.
		 */
		public function Accessor(name:String, 
								 access:AccessorAccess, 
								 type:TypeInfo, 
								 isStatic:Boolean, 
								 declaringType:TypeInfo) 
		{
			super(name, type, isStatic);
			
			_access = access;
			_declaringTypeInfo = declaringType;
		}
		
		/**
		 * dynamically invoke accessor on an object.
		 * 
		 */ 
		public override function invoke(obj:*, args:Array = null):*
		{
			if(args != null)
			{
				if(args.length == 1 )
				{
					if(access == AccessorAccess.READ_WRITE || access == AccessorAccess.WRITE_ONLY)
						obj[name] = args[0];
					else
						throw new AccessError("Accessor is readonly, can not set arguments");
				}
				else if(args.length > 1)
				{
					throw new ArgumentError("Incorrect number of arguments for member ["+name+"]");
				}
			}
			
			//this is last so that the value can be returned after it is set.
			if(access != AccessorAccess.WRITE_ONLY)
				return obj[name];
			else
				return null;
		}
	}
}

class AccessError extends Error
{
	public function AccessError(msg:String)
	{
		super(msg);
	}
}