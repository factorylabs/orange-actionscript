package com.factorylabs.orange.core.reflection
{
	public final class Variable extends MemberInfo
	{
		/**
		 * Creates a new <code>Variable</code> object.
		 * 
		 * @param name the name of the variable
		 * @param type the data type of the variable
		 */
		public function Variable(name:String, type:TypeInfo, isStatic:Boolean) 
		{
			super(name, type, isStatic);
		}
	}
}