package tests.factorylabs.orange.core.display{	import tests.factorylabs.orange.core.display.fills.BitmapFillTests;
	import tests.factorylabs.orange.core.display.fills.GradientStrokeTests;
	import tests.factorylabs.orange.core.display.fills.GradientFillTests;
	import tests.factorylabs.orange.core.display.graphics.FDashedLineTests;
	import tests.factorylabs.orange.core.display.fills.SolidStrokeTests;
	import tests.factorylabs.orange.core.display.graphics.FPolygonTests;
	import tests.factorylabs.orange.core.display.graphics.FPolyFromPointsTests;
	import tests.factorylabs.orange.core.display.graphics.FWedgeTests;
	import tests.factorylabs.orange.core.display.fills.SolidFillTests;	import tests.factorylabs.orange.core.display.graphics.FCircleTests;
	import tests.factorylabs.orange.core.display.graphics.FEllipseTests;	import tests.factorylabs.orange.core.display.graphics.FRectCorneredComplexTests;	import tests.factorylabs.orange.core.display.graphics.FRectCorneredTests;	import tests.factorylabs.orange.core.display.graphics.FRectRoundComplexTests;	import tests.factorylabs.orange.core.display.graphics.FRectRoundTests;	import tests.factorylabs.orange.core.display.graphics.FRectangleTests;	import tests.factorylabs.orange.core.display.graphics.FSquareTests;	import tests.factorylabs.orange.core.display.graphics.GraphicTests;	/**	 * Suite of test cases for the display package. 	 * 	 * <hr /> 	 * <p>Copyright 2004-2010 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p> 	 * 	 * Permission is hereby granted, free of charge, to any person obtaining 	 * a copy of this software and associated documentation files (the	 * "Software"), to deal in the Software without restriction, including	 * without limitation the rights to use, copy, modify, merge, publish,	 * distribute, sublicense, and/or sell copies of the Software, and to	 * permit persons to whom the Software is furnished to do so, subject to	 * the following conditions:<br /><br />	 *	 * The above copyright notice and this permission notice shall be	 * included in all copies or substantial portions of the Software.<br /><br />	 *	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Nov 27, 2009	 */	[Suite]	[RunWith('org.flexunit.runners.Suite')]	public class DisplayTestSuite 	{		public var theFBitmapTests					:FBitmapTests;		public var theFBitmapTextTests				:FBitmapTextTests;		public var theFDisplayObjectPropertiesTests	:FDisplayObjectPropertiesTests;		public var theFMovieClipTests				:FMovieClipTests;		public var theFShapeTests					:FShapeTests;		public var theFSpriteTests					:FSpriteTests;		public var theFTextFieldTests				:FTextFieldTests;				public var theBitmapFillTests				:BitmapFillTests;		public var theGradientFillTests				:GradientFillTests;		public var theGradientStrokeTests			:GradientStrokeTests;		public var theSolidFillTests				:SolidFillTests;		public var theSolidStrokeTests				:SolidStrokeTests;				public var theGraphicTests					:GraphicTests;		public var theFCircleTests					:FCircleTests;		public var theFDashedLineTests				:FDashedLineTests;		public var theFEllipseTests					:FEllipseTests;		public var theFPolyFromPointsTests			:FPolyFromPointsTests;		public var theFPolygonTests					:FPolygonTests;		public var theFRectangleTests				:FRectangleTests;		public var theFRectCorneredTests			:FRectCorneredTests;		public var theFRectCorneredComplexTests		:FRectCorneredComplexTests;		public var theFRectRoundTests				:FRectRoundTests;		public var theFRectRoundComplexTests		:FRectRoundComplexTests;		public var theFSquareTests					:FSquareTests;		public var theFWedgeTests					:FWedgeTests;	}}