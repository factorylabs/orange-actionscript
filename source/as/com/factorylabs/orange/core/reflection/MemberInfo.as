package com.factorylabs.orange.core.reflection
{
	import com.factorylabs.orange.core.errors.ArgumentNullError;
	
	public class MemberInfo implements IMemberInfo
	{
		private var _name:String;
		private var _type:TypeInfo;
		private var _isStatic:Boolean;
		
		public function get name():String 
		{
			return _name;
		}
		
		public function get typeInfo():TypeInfo 
		{
			return _type;
		}
		public function get isStatic():Boolean
		{
			return _isStatic;
		}
		
		/**
		 * 
		 */
		public function MemberInfo(name:String, type:TypeInfo, isStatic:Boolean = false) 
		{
			if(name == null) throw new ArgumentNullError("name");
			//null type represents *
			
			_name = name;
			_type = type;
			_isStatic = isStatic;
		}
		
		/**
		 * dynamically invoke member on an object.
		 *  - this is designed to abstract some of the differing dynamic
		 * 	  ways a member can be invoked. each concrete class can override
		 * 	  and implement as necessary.
		 * 
		 */ 
		public function invoke(obj:*, args:Array = null):*
		{
			if(args != null)
			{
				if(args.length == 1)
					obj[name] = args[0];
				else if(args.length > 1)
					throw new ArgumentError("Incorrect number of arguments for member ["+name+"]");
			}
				
			return obj[name];
		}
	}
}
