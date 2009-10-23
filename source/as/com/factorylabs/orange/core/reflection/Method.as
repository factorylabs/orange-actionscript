package com.factorylabs.orange.core.reflection
{
	public final class Method extends MemberInfo
	{
		private var _parameters:Array;
		private var _returnTypeInfo:TypeInfo;
		private var _declaringTypeInfo:TypeInfo;
		
		public function get parameters():Array { return _parameters.concat(); };
		public function get returnTypeInfo():TypeInfo { return _returnTypeInfo; };
		public function get declaringTypeInfo():TypeInfo { return _declaringTypeInfo; }
		
		/**
		 * Creates a new <code>Method</code> instance.
		 */
		public function Method(	declaringType:TypeInfo, 
							  	name:String, 
							  	isStatic:Boolean, 
							  	parameters:Array = null, 
							  	returnType:TypeInfo = null) 
		{
			super(name,TypeInfo.getByClass(Function), isStatic);
			
			_declaringTypeInfo = declaringType;
			_parameters = (parameters == null) ? [] : parameters;
			_returnTypeInfo = returnType;
		}
		
		/**
		 * dynamically invoke method on an object.
		 * 
		 */ 
		public override function invoke(obj:*, args:Array = null):*
		{
			if(returnTypeInfo != null)
			{
				return obj[name].apply(obj,args);
			}
			else
			{
				obj[name].apply(obj,args);
				return null;
			}
		}
		
		/**
		 * dynamically invoke method on an object.
		 * 
		 */ 
		public function invokeWith(obj:*, ...args):*
		{
			return invoke(obj,args);
		}
	
	}
}