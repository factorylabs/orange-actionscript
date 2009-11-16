
package tests.factorylabs.orange.core 
{
	import asunit.framework.TestSuite;

	import tests.factorylabs.orange.core.collections.MapTest;
	import tests.factorylabs.orange.core.gc.JanitorConnectionsTest;
	import tests.factorylabs.orange.core.gc.JanitorIntervalTest;
	import tests.factorylabs.orange.core.gc.JanitorManagerTest;
	import tests.factorylabs.orange.core.gc.JanitorSoundChannelTest;
	import tests.factorylabs.orange.core.gc.JanitorTest;
	import tests.factorylabs.orange.core.logging.LoggerTest;
	import tests.factorylabs.orange.core.util.ArrayUtilTest;
	import tests.factorylabs.orange.core.util.ColorUtilTest;
	import tests.factorylabs.orange.core.util.ConvertTest;
	import tests.factorylabs.orange.core.util.LocaleTest;
	import tests.factorylabs.orange.core.util.StringUtilTest;
	import tests.factorylabs.orange.core.util.ValidateUtilTest;

	/**
	 * Runs the orange core test cases.
	 * 
	 * <p>Copyright 2004-2009 by Factory Design Labs</p>
     * 
     * Permission is hereby granted, free of charge, to any person obtaining
     * a copy of this software and associated documentation files (the
     * "Software"), to deal in the Software without restriction, including
     * without limitation the rights to use, copy, modify, merge, publish,
     * distribute, sublicense, and/or sell copies of the Software, and to
     * permit persons to whom the Software is furnished to do so, subject to
     * the following conditions:
     * 
     * The above copyright notice and this permission notice shall be
     * included in all copies or substantial portions of the Software.
     * 
     * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
     * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
     * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
     * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
     * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
     * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
     * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 4, 2009
	 */
	public class CoreTestSuite
		extends TestSuite 
	{
		public function CoreTestSuite()
		{
			super();
			addTestCases();
		}
		
		override public function toString() :String 
		{
			return 'tests.factorylabs.orange.core.CoreTestSuite';
		}
		
		protected function addTestCases() :void
		{
			// orange.core.collections
			addTest(new MapTest() );
			
			// orange.core.gc
			addTest( new JanitorConnectionsTest() );
			addTest( new JanitorTest() );
			addTest( new JanitorIntervalTest() );
			addTest( new JanitorManagerTest() );
			addTest( new JanitorSoundChannelTest() );
			
			// orange.core.logger
			addTest( new LoggerTest() );
			
			// orange.core.util
			addTest( new ArrayUtilTest() );
			addTest( new ColorUtilTest() );
			addTest( new ConvertTest() );
			addTest( new LocaleTest() );
			addTest( new ValidateUtilTest() );
			addTest( new StringUtilTest() );
		}
	}
}
