package tests.factorylabs.orange.core.display.graphics{	import tests.factorylabs.orange.helpers.MockCanvas;	import com.factorylabs.orange.core.display.fills.SolidFill;	import com.factorylabs.orange.core.display.graphics.FCircle;	import org.hamcrest.assertThat;	import org.hamcrest.object.equalTo;	import flash.display.Shape;	/**	 * Generate the test cases for the FCircle class. 	 * 	 * <hr /> 	 * <p>Copyright 2004-2009 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p> 	 * 	 * Permission is hereby granted, free of charge, to any person obtaining 	 * a copy of this software and associated documentation files (the	 * "Software"), to deal in the Software without restriction, including	 * without limitation the rights to use, copy, modify, merge, publish,	 * distribute, sublicense, and/or sell copies of the Software, and to	 * permit persons to whom the Software is furnished to do so, subject to	 * the following conditions:<br /><br />	 *	 * The above copyright notice and this permission notice shall be	 * included in all copies or substantial portions of the Software.<br /><br />	 *	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Dec 28, 2009	 */	public class FCircleTests 	{		private var _canvas		:MockCanvas;		private var _shape 		:Shape;		private var _fcircle	:FCircle;		private var _magenta	:SolidFill;				[BeforeClass]		public static function runBeforeClass() :void		{					}				[AfterClass]		public static function runAfterClass() :void		{					}				[Before]		public function runBeforeEachTest() :void		{			_canvas = new MockCanvas();			_shape = new Shape();			_magenta = new SolidFill( 0xff00ff, .8 );			_fcircle = new FCircle( _shape.graphics, 0, 0, 100, _magenta, false, true );			_canvas.add( _shape );		}				[After]		public function runAfterEachTest() :void		{			_shape.graphics.clear();			_canvas.remove( _shape );			_magenta = null;			_fcircle = null;		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function gfx() :void		{			assertThat( _fcircle.gfx, equalTo( _shape.graphics ) );			var tmpshape :Shape = new Shape();			_fcircle.gfx = tmpshape.graphics;			assertThat( _fcircle.gfx, equalTo( tmpshape.graphics ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function x() :void		{			assertThat( _fcircle.x, equalTo( 0 ) );			_fcircle.x = 100;			assertThat( _fcircle.x, equalTo( 100 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function y() :void		{			assertThat( _fcircle.y, equalTo( 0 ) );			_fcircle.y = 100;			assertThat( _fcircle.y, equalTo( 100 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function width() :void		{			assertThat( _fcircle.width, equalTo( 100 ) );			_fcircle.width = 50;			assertThat( _fcircle.width, equalTo( 50 ) );			assertThat( _fcircle.height, equalTo( 50 ) );			assertThat( _fcircle.size, equalTo( 50 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function height() :void		{			assertThat( _fcircle.height, equalTo( 100 ) );			_fcircle.height = 10;			assertThat( _fcircle.height, equalTo( 10 ) );			assertThat( _fcircle.width, equalTo( 10 ) );			assertThat( _fcircle.size, equalTo( 10 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function size() :void		{			assertThat( _fcircle.size, equalTo( 100 ) );			_fcircle.size = 10;			assertThat( _fcircle.height, equalTo( 10 ) );			assertThat( _fcircle.width, equalTo( 10 ) );			assertThat( _fcircle.size, equalTo( 10 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function fill() :void		{			assertThat( _fcircle.fill, equalTo( _magenta ) );			var sf :SolidFill = new SolidFill( 0x000000, .4 );			_fcircle.fill = sf;			assertThat( _fcircle.fill, equalTo( sf ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function center() :void		{			_fcircle.center = true;			assertThat( _fcircle.center, equalTo( true ) );			assertThat( _fcircle.x, equalTo( 50 ) );			assertThat( _fcircle.y, equalTo( 50 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function autoRedraw() :void		{			assertThat( _fcircle.autoRedraw, equalTo( true ) );			_fcircle.autoRedraw = false;		}				[Test]		public function redraw() :void		{			_fcircle.autoRedraw = false;			_fcircle.size = 25;			assertThat( _shape.width, equalTo( 100 ) );			assertThat( _shape.height, equalTo( 100 ) );			_fcircle.redraw();			assertThat( _shape.width, equalTo( 25 ) );			assertThat( _shape.height, equalTo( 25 ) );		}	}}