package com.factorylabs.orange.core.reflection
{
	public final class ConstructorInfo
	{
		private var _parameters:Array;
		public function get parameters():Array { return _parameters; };
		
		public function ConstructorInfo(parameters:Array = null)
		{
			_parameters = (parameters == null) ? [] : parameters;
		}
	}
}