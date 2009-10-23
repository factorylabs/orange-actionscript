package com.realeyesmedia.debug.redbug.modules
{
	public class RED_LoggerLevelVO
	{
		public var name:String;
		public var color:int;
		public var bgColor:int;
		
		public function RED_LoggerLevelVO( p_name:String, p_color:int = 0x000000, p_bgColor:int = 0xFFFFFF )
		{
			name = p_name;
			color = p_color;
			bgColor = p_bgColor;
		}
		
		public function toString():String
		{
			return name;
		}

	}
}