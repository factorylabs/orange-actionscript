
package tests.factorylabs.orange.core.display.graphics
{
	import asunit.asserts.assertFalse;
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertEqualsArrays;
	import asunit.asserts.assertTrue;

	import tests.factorylabs.orange.helpers.MockCanvas;

	import com.factorylabs.orange.core.display.fills.SolidFill;
	import com.factorylabs.orange.core.display.graphics.FPolyFromPoints;

	import flash.display.Shape;

	/**
	 * Generate the test cases for the FPolyFromPoints class.
 	 *
 	 * <hr />
 	 * <p>Copyright 2004-2010 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p>
 	 *
 	 * Permission is hereby granted, free of charge, to any person obtaining
 	 * a copy of this software and associated documentation files (the
	 * "Software"), to deal in the Software without restriction, including
	 * without limitation the rights to use, copy, modify, merge, publish,
	 * distribute, sublicense, and/or sell copies of the Software, and to
	 * permit persons to whom the Software is furnished to do so, subject to
	 * the following conditions:<br /><br />
	 *
	 * The above copyright notice and this permission notice shall be
	 * included in all copies or substantial portions of the Software.<br /><br />
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Jan 5, 2010
	 */
	public class FPolyFromPointsTests 
	{
		private var _canvas		:MockCanvas;
		private var _shape 		:Shape;
		private var _fpoly		:FPolyFromPoints;
		private var _magenta	:SolidFill;
		
		[Before(ui)]
		public function runBeforeEachTest() :void
		{
			_canvas = new MockCanvas();
			_shape = new Shape();
			_magenta = new SolidFill( 0xff00ff, .8 );
			_fpoly = new FPolyFromPoints( _shape.graphics, [ [0, 0], [0, 100], [100, 200], [ 350, 300] ], _magenta, false );
			_canvas.add( _shape );
		}
		
		[After(ui)]
		public function runAfterEachTest() :void
		{
			_shape.graphics.clear();
			_canvas.remove( _shape );
			_magenta = null;
			_fpoly = null;
		}
		
		[Test(description='Checks both the getter and setter.', tracker_id='')]
		public function gfx() :void
		{
			assertEquals( _fpoly.gfx, _shape.graphics );
			var tmpshape :Shape = new Shape();
			_fpoly.gfx = tmpshape.graphics;
			assertEquals( _fpoly.gfx, tmpshape.graphics );
		}
		
		[Test(description='We only check the getter, the setter throws an error since we all know you have to alter the points property to get a new x right?', tracker_id='')]
		public function x() :void
		{
			assertEquals( _fpoly.x, 0 );
		}
		
		[Test(expects='ArgumentError')]
		public function setX() :void
		{
			_fpoly.x = 100;
		}

		[Test(description='We only check the getter, the setter throws an error since we all know you have to alter the points property to get a new y right?', tracker_id='')]
		public function y() :void
		{
			assertEquals( _fpoly.y, 0 );
		}
		
		[Test(expects='ArgumentError')]
		public function setY() :void
		{
			_fpoly.y = 100;
		}
		
		[Test(description='We only check the getter, the setter throws an error since we all know you have to alter the points property to get a new width right?', tracker_id='')]
		public function width() :void
		{
			assertEquals( _fpoly.width, 350 );
		}
		
		[Test(expects='ArgumentError')]
		public function setWidth() :void
		{
			_fpoly.width = 100;
		}
		
		[Test(description='We only check the getter, the setter throws an error since we all know you have to alter the points property to get a new height right?', tracker_id='')]
		public function height() :void
		{
			assertEquals( _fpoly.height, 300 );
		}
		
		[Test(expects='ArgumentError')]
		public function setHeight() :void
		{
			_fpoly.height = 100;
		}
		
		[Test(description='Checks both the getter and setter.', tracker_id='')]
		public function points() :void
		{
			var pts :Array = _fpoly.points;
			assertEqualsArrays( _fpoly.points, pts );
			
			var pts2 :Array = [ [10, 10], [10, 1100], [1100, 1200], [ 1350, 1300] ];
			_fpoly.points = pts2;
			assertEqualsArrays( pts2, _fpoly.points );
		}
		
		[Test(description='Checks both the getter and setter.', tracker_id='')]
		public function fill() :void
		{
			assertEquals( _fpoly.fill, _magenta );
			var sf :SolidFill = new SolidFill( 0x000000, .4 );
			_fpoly.fill = sf;
			assertEquals( _fpoly.fill, sf );
		}
		
		[Test(description='Checks both the getter and setter.', tracker_id='')]
		public function autoRedraw() :void
		{
			assertFalse( _fpoly.autoRedraw );
			_fpoly.autoRedraw = true;
			assertTrue( _fpoly.autoRedraw );
		}
		
		[Test]
		public function draw() :void
		{
			_shape.graphics.clear();
			_fpoly.draw( { points: [ [0, 0], [0, 100], [100, 200], [ 250, 200] ] } );
			assertEquals( _shape.width, 250 );
			assertEquals( _shape.height, 200 );
		}

		[Test]
		public function setProperties() :void
		{
			var pts :Array = [ [0, 0], [0, 100], [100, 200], [ 250, 200] ];
			_fpoly.setProperties( { points: pts } );
			assertEquals( _fpoly.points, pts );
		}
		
		[Test(expects='ArgumentError')]
		public function setPropertiesExpectsError() :void
		{
			_fpoly.setProperties( { fail: true } );
		}		
		
		[Test]
		public function redraw() :void
		{
			_fpoly.autoRedraw = false;
			_fpoly.points = [ [0, 0], [0, 100], [100, 200], [ 250, 200] ];
			assertEquals( _shape.width, 350 );
			assertEquals( _shape.height, 300 );
			_fpoly.redraw();
			assertEquals( _shape.width, 250 );
			assertEquals( _shape.height, 200 );
		}
	}
}