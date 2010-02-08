
package com.factorylabs.orange.performance.core.display.graphics 
{
	import com.factorylabs.orange.core.display.fills.SolidFill;
	import com.factorylabs.orange.core.display.graphics.FRectangle;
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.display.Shape;

	/**
	 * Generate the performance test cases for the FRectangle class.
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
	public class FRectanglePerformanceTests
		extends TestSuite
	{
		protected var loops		:uint = 100000;
		protected var shape		:Shape;
		protected var fill		:SolidFill;
		
		public function FRectanglePerformanceTests() 
		{
			name = 'FRectanglePerformanceTests';
			description = 'Tests different ways to render a Graphic shape. ' + loops + ' loops.';
			tareTest = new MethodTest( tare );
			initFunction = init;
			iterations = 4;
			tests = 
			[
				new MethodTest( drawing_through_instantiation, null, 'drawing_through_instantiation' ),
				new MethodTest( drawing_through_reference_with_init, null, 'drawing_through_reference_with_init'),
				new MethodTest( drawing_through_reference_without_init, null, 'drawing_through_reference_without_init'),
				new MethodTest( drawing_without_FRectangle, null, 'drawing_without_FRectangle')
			];
		}
		
		protected function init() :void
		{
			shape = new Shape();
			fill = new SolidFill( 0xFF00FF, 1 );
		}
		
		public function tare() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
			}
		}
		
		public function drawing_through_instantiation() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
				new FRectangle( shape.graphics, i, 0, 100, 1, fill );
			}
		}
		
		public function drawing_through_reference_with_init() :void
		{
			var frect :FRectangle = new FRectangle( shape.graphics, 0, 0, 100, 1, fill ); 
			for( var i :uint = 0; i < loops; ++i )
			{
				frect.draw( {x:i} );
			}
		}
		
		public function drawing_through_reference_without_init() :void
		{
			var frect :FRectangle = new FRectangle( shape.graphics, 0, 0, 100, 1, fill ); 
			for( var i :uint = 0; i < loops; ++i )
			{
				frect.x = i;
				frect.draw();
			}
		}
		
		public function drawing_without_FRectangle() :void
		{
			for( var i :uint = 0; i < loops; ++i )
			{
				shape.graphics.beginFill( 0xFF00FF, 1 );
				shape.graphics.drawRect( i, 0, 100, 1 );
				shape.graphics.endFill();
			}
		}
	}
}
