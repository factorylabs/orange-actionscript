
package com.factorylabs.orange.performance.core.display 
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import com.factorylabs.orange.core.display.FSprite;

	/**
	 * Generate the performance test cases for the FSprite class.
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
		extends TestSuite 
	{
		protected var loops		:uint = 100000;
		
		public function FSpritePerformanceTests()
		{
			name = 'FSpritePerformanceTests';
			description = 'Iterating various ways to set properties on an FSprite. ' + loops + ' loops.';
			tareTest = new MethodTest( tare );
			initFunction = init;
			iterations = 4;
			tests = 
			[
				new MethodTest( without_init_object, null, 'without_init_object' ),
				new MethodTest( with_init_object, null, 'with_init_object')
			];
		}
		
		protected function init() :void
		{
			
		}

		public function tare() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
			}
		}
		
		public function without_init_object() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
				var fsprite :FSprite = new FSprite( null, null );
				fsprite.x = i;
				fsprite.y = 100; 
			}
		}
		
		public function with_init_object() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
				new FSprite( null, { x:i, y:100 } );
			}
		}
	}
}
