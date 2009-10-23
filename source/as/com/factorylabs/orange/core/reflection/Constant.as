package com.factorylabs.orange.core.reflection
{
	public final class Constant extends MemberInfo
	{
		
		/**
		 * Creates a new <code>Constant</code> object.
		 * 
		 * @param name the name of the constant
		 * @param type the data type of the constant
		 */
		public function Constant(name:String, type:TypeInfo, isStatic:Boolean = false) 
		{
			super(name, type, isStatic);
		}
	}
}