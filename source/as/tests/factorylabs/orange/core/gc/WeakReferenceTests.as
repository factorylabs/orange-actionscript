
package tests.factorylabs.orange.core.gc 
{
	import tests.factorylabs.orange.helpers.MockBaseClass;

	import com.factorylabs.orange.core.gc.WeakReference;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	/**
	 * Generates the test cases for the WeakReference class.
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
	 * @version		1.0.0 :: Nov 21, 2009
	 */
	public class WeakReferenceTests 
	{
		private var _weak		:WeakReference;
		private var _mocker		:MockBaseClass;
		
		[BeforeClass]
		public static function runBeforeClass():void
		{
			
		}
		
		[AfterClass]
		public static function runAfterAfter():void
		{
			
		}
		
		[Before]
		public function runBeforeEachTest():void
		{
			_mocker = new MockBaseClass();
			_weak = new WeakReference( _mocker );
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_weak = null;
			_mocker = null;
		}
		
		[Test]
		public function get() :void
		{
			assertThat( _weak.get(), equalTo( _mocker ) );
		}
	}
}
