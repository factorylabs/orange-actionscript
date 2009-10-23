package com.factorylabs.orange.core.reflection
{
	public interface IMemberInfo
	{		
		function get name():String;
		function get typeInfo():TypeInfo;
		function get isStatic():Boolean;
		function invoke(obj:*,args:Array = null):*;
	}
}