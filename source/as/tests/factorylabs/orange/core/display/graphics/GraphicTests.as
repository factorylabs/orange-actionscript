package tests.factorylabs.orange.core.display.graphics{	import tests.factorylabs.orange.helpers.MockCanvas;	import com.factorylabs.orange.core.display.fills.SolidFill;	import com.factorylabs.orange.core.display.graphics.FRectangle;	import org.hamcrest.assertThat;	import org.hamcrest.object.equalTo;	import flash.display.Shape;	/**	 * Generate the test cases for the Graphic class. 	 *  	 * <p>Since <code>Graphic</code> is an abstract base class that is never instantiated, we use an <code>FRectangle</code> instance to test. 	 * <code>FRectangle</code> is <code>Graphic</code>'s closest descendant.</p>  	 * 	 * <hr /> 	 * <p>Copyright 2004-2009 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p> 	 * 	 * Permission is hereby granted, free of charge, to any person obtaining 	 * a copy of this software and associated documentation files (the	 * "Software"), to deal in the Software without restriction, including	 * without limitation the rights to use, copy, modify, merge, publish,	 * distribute, sublicense, and/or sell copies of the Software, and to	 * permit persons to whom the Software is furnished to do so, subject to	 * the following conditions:<br /><br />	 *	 * The above copyright notice and this permission notice shall be	 * included in all copies or substantial portions of the Software.<br /><br />	 *	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Dec 4, 2009	 */	public class GraphicTests 	{		private var _canvas		:MockCanvas;		private var _shape 		:Shape;		private var _frect 		:FRectangle;		private var _magenta	:SolidFill;				[BeforeClass]		public static function runBeforeClass() :void		{					}				[AfterClass]		public static function runAfterClass() :void		{					}				[Before]		public function runBeforeEachTest() :void		{			_canvas = new MockCanvas();			_shape = new Shape();			_magenta = new SolidFill( 0xff00ff, .8 );			_frect = new FRectangle( _shape.graphics, 0, 0, 500, 100, _magenta, false, true );			_canvas.add( _shape );		}				[After]		public function runAfterEachTest() :void		{			_shape.graphics.clear();			_canvas.remove( _shape );			_magenta = null;			_frect = null;		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function gfx() :void		{			assertThat( _frect.gfx, equalTo( _shape.graphics ) );			var tmpshape :Shape = new Shape();			_frect.gfx = tmpshape.graphics;			assertThat( _frect.gfx, equalTo( tmpshape.graphics ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function x() :void		{			assertThat( _frect.x, equalTo( 0 ) );			_frect.x = 100;			assertThat( _frect.x, equalTo( 100 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function y() :void		{			assertThat( _frect.y, equalTo( 0 ) );			_frect.y = 100;			assertThat( _frect.y, equalTo( 100 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function width() :void		{			assertThat( _frect.width, equalTo( 500 ) );			_frect.width = 100;			assertThat( _frect.width, equalTo( 100 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function height() :void		{			assertThat( _frect.height, equalTo( 100 ) );			_frect.height = 10;			assertThat( _frect.height, equalTo( 10 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function fill() :void		{			assertThat( _frect.fill, equalTo( _magenta ) );			var sf :SolidFill = new SolidFill( 0x000000, .4 );			_frect.fill = sf;			assertThat( _frect.fill, equalTo( sf ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function center() :void		{			_frect.center = true;			assertThat( _frect.center, equalTo( true ) );			assertThat( _frect.x, equalTo( 250 ) );			assertThat( _frect.y, equalTo( 50 ) );		}				[Test(description='Checks both the getter and setter.', tracker_id='')]		public function autoRedraw() :void		{			assertThat( _frect.autoRedraw, equalTo( true ) );			_frect.autoRedraw = false;		}	}}