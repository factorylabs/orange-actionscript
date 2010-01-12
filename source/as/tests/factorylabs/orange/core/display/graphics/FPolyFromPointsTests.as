
package tests.factorylabs.orange.core.display.graphics
{
	import tests.factorylabs.orange.helpers.MockCanvas;

	import com.factorylabs.orange.core.display.fills.SolidFill;
	import com.factorylabs.orange.core.display.graphics.FPolyFromPoints;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

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
		
		[BeforeClass]
		public static function runBeforeClass() :void
		{
			
		}
		
		[AfterClass]
		public static function runAfterClass() :void
		{
			
		}
		
		[Before]
		public function runBeforeEachTest() :void
		{
			_canvas = new MockCanvas();
			_shape = new Shape();
			_magenta = new SolidFill( 0xff00ff, .8 );
			_fpoly = new FPolyFromPoints( _shape.graphics, [ [0, 0], [0, 100], [100, 200], [ 350, 300] ], _magenta );
			_canvas.add( _shape );
		}
		
		[After]
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
			assertThat( _fpoly.gfx, equalTo( _shape.graphics ) );
			var tmpshape :Shape = new Shape();
			_fpoly.gfx = tmpshape.graphics;
			assertThat( _fpoly.gfx, equalTo( tmpshape.graphics ) );
		}
		
		[Test(description='We only check the getter, the setter throws an error since we all know you have to alter the points property to get a new x right?', tracker_id='')]
		public function x() :void
		{
			assertThat( _fpoly.x, equalTo( 0 ) );
		}
		
		[Test(expects='ArgumentError')]
		public function setX() :void
		{
			_fpoly.x = 100;
		}

		[Test(description='We only check the getter, the setter throws an error since we all know you have to alter the points property to get a new y right?', tracker_id='')]
		public function y() :void
		{
			assertThat( _fpoly.y, equalTo( 0 ) );
		}
		
		[Test(expects='ArgumentError')]
		public function setY() :void
		{
			_fpoly.y = 100;
		}
		
		[Test(description='We only check the getter, the setter throws an error since we all know you have to alter the points property to get a new width right?', tracker_id='')]
		public function width() :void
		{
			assertThat( _fpoly.width, equalTo( 350 ) );
		}
		
		[Test(expects='ArgumentError')]
		public function setWidth() :void
		{
			_fpoly.width = 100;
		}
		
		[Test(description='We only check the getter, the setter throws an error since we all know you have to alter the points property to get a new height right?', tracker_id='')]
		public function height() :void
		{
			assertThat( _fpoly.height, equalTo( 300 ) );
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
			assertThat( [ [0, 0], [0, 100], [100, 200], [ 350, 300] ], equalTo( pts ) );
			
			var pts2 :Array = [ [10, 10], [10, 1100], [1100, 1200], [ 1350, 1300] ];
			_fpoly.points = pts2;
			assertThat( pts2, equalTo( _fpoly.points ) );
		}
		
		[Test(description='Checks both the getter and setter.', tracker_id='')]
		public function fill() :void
		{
			assertThat( _fpoly.fill, equalTo( _magenta ) );
			var sf :SolidFill = new SolidFill( 0x000000, .4 );
			_fpoly.fill = sf;
			assertThat( _fpoly.fill, equalTo( sf ) );
		}
		
		[Test(description='Checks both the getter and setter.', tracker_id='')]
		public function autoRedraw() :void
		{
			assertThat( _fpoly.autoRedraw, equalTo( true ) );
			_fpoly.autoRedraw = false;
		}
		
		[Test]
		public function redraw() :void
		{
			_fpoly.autoRedraw = false;
			_fpoly.points = [ [0, 0], [0, 100], [100, 200], [ 250, 200] ];
			assertThat( _shape.width, equalTo( 350 ) );
			assertThat( _shape.height, equalTo( 300 ) );
			_fpoly.redraw();
			assertThat( _shape.width, equalTo( 250 ) );
			assertThat( _shape.height, equalTo( 200 ) );
		}
	}
}