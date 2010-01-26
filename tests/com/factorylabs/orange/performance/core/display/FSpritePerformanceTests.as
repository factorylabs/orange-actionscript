
package com.factorylabs.orange.performance.core.display 
{
	import com.factorylabs.orange.core.display.FSprite;

	/**
	 * Summary.
	 * 
	 * <p>http://www.gskinner.com/blog/archives/2009/04/as3_performance.html.</p>
	 *
	 * <hr />
	 * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
	 * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
	 * 
	 * <p>Permission is hereby granted to use, modify, and distribute this file 
	 * in accordance with the terms of the license agreement accompanying it.</p>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Jan 26, 2010
	 */
	public class FSpritePerformanceTests 
	{
		public var description	:String = 'Testing properties on FSprite.';
		protected var loops		:uint = 100000;
		
		public function FSpritePerformanceTests() 
		{
		}
		
		public function tare() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
			}
		}
		
		public function new_sprite_without_init_object_setting_properties_manually() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
				var fsprite :FSprite = new FSprite( null, null );
				fsprite.x = i;
				fsprite.y = 100; 
			}
		}
		
		public function new_sprite_with_init_object() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
				new FSprite( null, { x:i, y:100 } );
			}
		}
	}
}
