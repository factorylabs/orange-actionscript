package com.factorylabs.orange.unit.core.display.graphics{	import asunit.asserts.assertEquals;	import asunit.asserts.assertFalse;	import asunit.asserts.assertTrue;	import com.factorylabs.orange.core.display.fills.SolidFill;	import com.factorylabs.orange.core.display.graphics.FEllipse;	import com.factorylabs.orange.unit.helpers.MockCanvas;	import flash.display.Shape;	/**	 * Generate the test cases for the FEllipse class. 	 * 	 * <hr /> 	 * <p>Copyright 2004-2010 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p> 	 * 	 * Permission is hereby granted, free of charge, to any person obtaining 	 * a copy of this software and associated documentation files (the	 * "Software"), to deal in the Software without restriction, including	 * without limitation the rights to use, copy, modify, merge, publish,	 * distribute, sublicense, and/or sell copies of the Software, and to	 * permit persons to whom the Software is furnished to do so, subject to	 * the following conditions:<br /><br />	 *	 * The above copyright notice and this permission notice shall be	 * included in all copies or substantial portions of the Software.<br /><br />	 *	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Dec 28, 2009	 */	public class FEllipseTests 	{		private var _canvas		:MockCanvas;		private var _shape 		:Shape;		private var _fellipse 	:FEllipse;		private var _magenta	:SolidFill;				[Before(ui)]		public function runBeforeEachTest() :void		{			_canvas = new MockCanvas();			_shape = new Shape();			_magenta = new SolidFill( 0xff00ff, .8 );			_fellipse = new FEllipse( _shape.graphics, 0, 0, 500, 100, _magenta, false, false );			_canvas.add( _shape );		}				[After(ui)]		public function runAfterEachTest() :void		{			_shape.graphics.clear();			_canvas.remove( _shape );			_magenta = null;			_fellipse = null;		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function gfx() :void		{			assertEquals( _fellipse.gfx, _shape.graphics );			var tmpshape :Shape = new Shape();			_fellipse.gfx = tmpshape.graphics;			assertEquals( _fellipse.gfx, tmpshape.graphics );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function x() :void		{			assertEquals( _fellipse.x, 0 );			_fellipse.x = 100;			assertEquals( _fellipse.x, 100 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function y() :void		{			assertEquals( _fellipse.y, 0 );			_fellipse.y = 100;			assertEquals( _fellipse.y, 100 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function width() :void		{			assertEquals( _fellipse.width, 500 );			_fellipse.width = 100;			assertEquals( _fellipse.width, 100 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function height() :void		{			assertEquals( _fellipse.height, 100 );			_fellipse.height = 10;			assertEquals( _fellipse.height, 10 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function fill() :void		{			assertEquals( _fellipse.fill, _magenta );			var sf :SolidFill = new SolidFill( 0x000000, .4 );			_fellipse.fill = sf;			assertEquals( _fellipse.fill, sf );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function center() :void		{			_fellipse.center = true;			assertTrue( _fellipse.center );			assertEquals( _fellipse.x, 250 );			assertEquals( _fellipse.y, 50 );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function autoRedraw() :void		{			assertFalse( _fellipse.autoRedraw );			_fellipse.autoRedraw = true;			assertTrue( _fellipse.autoRedraw );		}				[Test]		public function draw() :void		{			_shape.graphics.clear();			_fellipse.draw( { width: 100, height: 25 } );			assertEquals( _fellipse.width, 100 );			assertEquals( _fellipse.height, 25 );			assertEquals( _shape.width, 100 );			assertEquals( _shape.height, 25 );		}		[Test]		public function setProperties() :void		{			_fellipse.setProperties( { x: 100, width: 100 } );			assertEquals( _fellipse.x, 100 );			assertEquals( _fellipse.width, 100 );		}				[Test(expects='ArgumentError')]		public function setPropertiesExpectsError() :void		{			_fellipse.setProperties( { fail: true } );		}						[Test]		public function redraw() :void		{			_fellipse.autoRedraw = false;			_fellipse.width = 100;			_fellipse.height = 25;			assertEquals( _shape.width, 500 );			assertEquals( _shape.height, 100 );			_fellipse.redraw();			assertEquals( _shape.width, 100 );			assertEquals( _shape.height, 25 );		}	}}