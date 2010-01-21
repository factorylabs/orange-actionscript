
package tests.factorylabs.orange.core 
{
	import tests.factorylabs.orange.core.collections.CollectionsTestSuite;
	import tests.factorylabs.orange.core.math.MathTestSuite;
	import tests.factorylabs.orange.core.utils.UtilsTestSuite;

	/**
	 * Suite of test cases for the core package.
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
	 * @version		1.0.0 :: Nov 14, 2009
	 */
	[Suite]
	public class FCoreTestSuite 
	{
		public var collectionsTestSuite	:CollectionsTestSuite;
//		public var displayTestSuite		:DisplayTestSuite;
//		public var errorTestSuite		:ErrorsTestSuite;
//		public var gcTestSuite			:GCTestSuite;
//		public var loggingTestSuite		:LoggingTestSuite;
		public var mathTestSuite		:MathTestSuite;
		public var utilsTestSuite		:UtilsTestSuite;
	}
}