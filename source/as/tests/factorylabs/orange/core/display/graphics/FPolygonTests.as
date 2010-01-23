package tests.factorylabs.orange.core.display.graphics{	import asunit.asserts.assertTrue;
	import asunit.asserts.assertEquals;	import tests.factorylabs.orange.helpers.MockCanvas;	import com.factorylabs.orange.core.display.fills.SolidFill;	import com.factorylabs.orange.core.display.graphics.FPolygon;	import flash.display.Shape;	/**	 * Generate the test cases for the FPolygon class. 	 * 	 * <hr /> 	 * <p>Copyright 2004-2010 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p> 	 * 	 * Permission is hereby granted, free of charge, to any person obtaining 	 * a copy of this software and associated documentation files (the	 * "Software"), to deal in the Software without restriction, including	 * without limitation the rights to use, copy, modify, merge, publish,	 * distribute, sublicense, and/or sell copies of the Software, and to	 * permit persons to whom the Software is furnished to do so, subject to	 * the following conditions:<br /><br />	 *	 * The above copyright notice and this permission notice shall be	 * included in all copies or substantial portions of the Software.<br /><br />	 *	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Jan 8, 2010	 */	public class FPolygonTests 	{		private var _canvas		:MockCanvas;		private var _shape 		:Shape;		private var _fpoly 		:FPolygon;		private var _magenta	:SolidFill;				[Before(ui)]		public function runBeforeEachTest() :void		{			_canvas = new MockCanvas();			_shape = new Shape();			_magenta = new SolidFill( 0xff00ff, .8 );			_fpoly = new FPolygon( _shape.graphics, 0, 0, 5, 50, 0, _magenta, false, true);			_canvas.add( _shape );		}				[After(ui)]		public function runAfterEachTest() :void		{			_shape.graphics.clear();			_canvas.remove( _shape );			_magenta = null;			_fpoly = null;		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function gfx() :void		{			assertEquals( _fpoly.gfx, _shape.graphics );			var tmpshape :Shape = new Shape();			_fpoly.gfx = tmpshape.graphics;			assertEquals( _fpoly.gfx, tmpshape.graphics );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function x() :void		{			assertEquals( _fpoly.x, 0 );			_fpoly.x = 100;			assertEquals( _fpoly.x, 100 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function y() :void		{			assertEquals( _fpoly.y, 0 );			_fpoly.y = 100;			assertEquals( _fpoly.y, 100 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function width() :void		{			assertEquals( _fpoly.width, 100 );			_fpoly.width = 100;			assertEquals( _fpoly.width, 100 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function height() :void		{			assertEquals( _fpoly.height, 100 );			_fpoly.height = 10;			assertEquals( _fpoly.height, 10 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function sides() :void		{			assertEquals( _fpoly.sides, 5 );			_fpoly.sides = 3;			assertEquals( _fpoly.sides, 3 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function radius() :void		{			assertEquals( _fpoly.radius, 50 );			_fpoly.radius = 10;			assertEquals( _fpoly.radius, 10 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function angle() :void		{			assertEquals( _fpoly.angle, 0 );			_fpoly.angle = 90;			assertEquals( _fpoly.angle, 90 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function fill() :void		{			assertEquals( _fpoly.fill, _magenta );			var sf :SolidFill = new SolidFill( 0x000000, .4 );			_fpoly.fill = sf;			assertEquals( _fpoly.fill, sf );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function center() :void		{			_fpoly.center = true;			assertTrue( _fpoly.center );			assertEquals( _fpoly.x, 50 );			assertEquals( _fpoly.y, 50 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function autoRedraw() :void		{			assertTrue( _fpoly.autoRedraw );			_fpoly.autoRedraw = false;		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function redraw() :void		{			_fpoly.autoRedraw = false;			_fpoly.radius = 25;			assertEquals( _shape.width, 90.45 );			assertEquals( _shape.height, 95.1 );			_fpoly.redraw();			assertEquals( _shape.width, 45.25 );			assertEquals( _shape.height, 47.6 );		}	}}