
package com.factorylabs.orange.performance.core.display.graphics 
{
	import com.factorylabs.orange.core.display.graphics.FRectangle;
	import com.factorylabs.orange.core.display.fills.SolidFill;
	import flash.display.Shape;

	/**
	 * Summary.
	 * 
	 * <p>Description.</p>
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
	{
		public var description	:String = 'Testing the different ways to render a Graphic shape.';
		protected var loops		:uint = 100000;
		protected var shape		:Shape = new Shape();
		protected var fill		:SolidFill = new SolidFill( 0xFF00FF, 1 );
		
		public function FRectanglePerformanceTests() 
		{
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
		
		public function drawing_through_reference_with_init_object() :void
		{
			var frect :FRectangle = new FRectangle( shape.graphics, 0, 0, 100, 1, fill ); 
			for( var i :uint = 0; i < loops; ++i )
			{
				frect.draw( {x:i} );
			}
		}
		
		public function drawing_through_reference_without_init_object() :void
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
