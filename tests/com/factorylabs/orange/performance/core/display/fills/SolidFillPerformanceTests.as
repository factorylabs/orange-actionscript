
package com.factorylabs.orange.performance.core.display.fills 
{
	import com.factorylabs.orange.core.display.fills.SolidFill;
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import mx.graphics.SolidColor;

	/**
	 * Generate the performance test cases for the SolidFill class.
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
	public class SolidFillPerformanceTests
		extends TestSuite 
	{
		protected var loops		:uint = 100000;
		
		public function SolidFillPerformanceTests() 
		{
			name = 'SolidFillPerformanceTests';
			description = 'Testing the difference between SolidFill and the native SolidColor instantiation. ' + loops + ' loops.';
			tareTest = new MethodTest( tare );
			initFunction = init;
			iterations = 4;
			tests = 
			[
				new MethodTest( test_SolidFill_instantiation, null, 'test_SolidFill_instantiation' ),
				new MethodTest( test_SolidColor_instantiation, null, 'test_SolidColor_instantiation')
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
		
		public function test_SolidFill_instantiation() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
				new SolidFill( 0xFF00FF, 1 );
			}
		}
		
		public function test_SolidColor_instantiation() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
				new SolidColor( 0xFF00FF, 1 );
			}
		}
	}
}
