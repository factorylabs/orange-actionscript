package com.factorylabs.orange.unit.core.display.fills{	import asunit.asserts.assertEquals;	import asunit.asserts.assertEqualsArrays;	import com.factorylabs.orange.core.display.fills.GradientFill;	import com.factorylabs.orange.core.display.fills.GradientStroke;	import com.factorylabs.orange.core.display.fills.SolidStroke;	/**	 * Generate the test cases for the GradientStroke class. 	 * 	 * <hr /> 	 * <p>Copyright 2004-2010 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p> 	 * 	 * Permission is hereby granted, free of charge, to any person obtaining 	 * a copy of this software and associated documentation files (the	 * "Software"), to deal in the Software without restriction, including	 * without limitation the rights to use, copy, modify, merge, publish,	 * distribute, sublicense, and/or sell copies of the Software, and to	 * permit persons to whom the Software is furnished to do so, subject to	 * the following conditions:<br /><br />	 *	 * The above copyright notice and this permission notice shall be	 * included in all copies or substantial portions of the Software.<br /><br />	 *	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Jan 11, 2010	 */	public class GradientStrokeTests 	{		private var _gradientFill 	:GradientFill;		private var _solidStroke	:SolidStroke;		private var _gradientStroke	:GradientStroke;				[Before]		public function runBeforeEachTest() :void		{			_gradientFill = new GradientFill( 0, [ 0xffffff, 0x333333 ] );			_solidStroke = new SolidStroke( 0xcccccc, 1, 3, true );			_gradientStroke = new GradientStroke( _gradientFill, _solidStroke );		}				[After]		public function runAfterEachTest() :void		{			_gradientStroke = null;			_gradientFill = null;			_solidStroke = null;		}				[Test]		public function constructor() :void		{			assertEqualsArrays( _gradientStroke.gradientFill.colors, new GradientFill( 0, [ 0xffffff, 0x333333 ] ).colors );			assertEquals( _gradientStroke.solidStroke.thickness, 3 );		}				[Test]		public function gradientFill() :void		{			var gf :GradientFill = new GradientFill( 180, [ 0xff00ff, 0xff0000 ] );			_gradientStroke.gradientFill = gf;			assertEqualsArrays( _gradientStroke.gradientFill.colors, [ 0xff00ff, 0xff0000 ] );		}				[Test]		public function solidStroke() :void		{			var sf :SolidStroke = new SolidStroke( 0x000000, 2, 5, false );			_gradientStroke.solidStroke = sf;			assertEquals( _gradientStroke.solidStroke.color, 0x000000 );		}	}}