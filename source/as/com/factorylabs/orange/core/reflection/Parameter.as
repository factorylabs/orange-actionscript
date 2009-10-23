package com.factorylabs.orange.core.reflection
{
	/**
	 * Provides information of a parameter passed to a method.
	 * 
	 */
	public final class Parameter
	{
		private var _index:int;
		private var _typeInfo:TypeInfo;
		private var _isOptional:Boolean;
		
		
		public function get index():int 
		{
			return _index;
		}
		
		public function get typeInfo():TypeInfo 
		{
			return _typeInfo;
		}
		
		public function get isOptional():Boolean 
		{
			return _isOptional;
		}
		
		/**
		 * Creates a new <code>Parameter</code> object.
		 * 
		 * @param index the index of the parameter
		 * @param type the class type of the parameter
		 * @param isOptional whether the parameter is optional or not
		 */
		public function Parameter(index:int, type:TypeInfo, isOptional:Boolean) 
		{
			_index = index;
			_typeInfo = type;
			_isOptional = isOptional;
		}
		
		
	}
}