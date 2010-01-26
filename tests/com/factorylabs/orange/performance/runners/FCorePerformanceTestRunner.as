
package com.factorylabs.orange.performance.runners 
{
	import com.factorylabs.orange.performance.core.display.FSpritePerformanceTests;
	import com.factorylabs.orange.performance.core.display.fills.SolidFillPerformanceTests;
	import com.factorylabs.orange.performance.core.display.graphics.FRectanglePerformanceTests;
	import com.gskinner.utils.PerformanceTest;

	import flash.display.MovieClip;

	/**
	 * Runs gskinner's performance suite on the core project.
	 *
	 * <p><a target="_top" href="http://www.gskinner.com/blog/archives/2009/04/as3_performance.html">gskinner blog post</a>.</p>
	 * 
	 * <hr />
	 * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
	 * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
	 * 
	 * <p>Permission is hereby granted to use, modify, and distribute this file 
	 * in accordance with the terms of the license agreement accompanying it.</p>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Jan 25, 2010
	 */
	public class FCorePerformanceTestRunner 
		extends MovieClip 
	{
		public function FCorePerformanceTestRunner()
		{
			var test :PerformanceTest = PerformanceTest.getInstance();
			test.out = print;
						
			test.testSuite( new FSpritePerformanceTests() );
			test.testSuite( new FRectanglePerformanceTests() );
			test.testSuite( new SolidFillPerformanceTests() );
		}
		
		protected function print( $str :* ) :void
		{
			trace( $str );
		}
	}
}