
package tests.factorylabs.orange.core.logging 
{
	import com.factorylabs.orange.core.logging.LoggerEvent;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	/**
	 * Generate the test cases for the LoggerEvent class.
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
	 * @version		1.0.0 :: Nov 16, 2009
	 */
	public class LoggerEventTests 
	{
		private var _event :LoggerEvent;
		
		[BeforeClass]
		public static function runBeforeClass():void
		{
			
		}
		
		[AfterClass]
		public static function runAfterClass():void
		{
			
		}
		
		[Before]
		public function runBeforeEachTest():void
		{
			_event = new LoggerEvent( LoggerEvent.UPDATE, 'message', { x: 100 }, 'MK', '[Test Logger]' );			
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_event = null;
		}
		
		[Test]
		public function message() :void
		{
			assertThat( _event.message, equalTo('message' ) );
		}
		
		[Test]
		public function object() :void
		{
			var o :Object = { x: 100 };
			assertThat( _event.object[ 'x' ], equalTo( o[ 'x' ] ) );
		}
		
		[Test]
		public function level() :void
		{
			assertThat( _event.level, equalTo( 'MK' ) );
		}
		
		[Test]
		public function name() :void
		{
			assertThat( _event.name, equalTo( '[Test Logger]' ) );
		}
		
		[Test]
		public function clone() :void
		{
			var e :LoggerEvent = LoggerEvent( _event.clone() );
			assertThat( e.message, equalTo( _event.message ) );
			assertThat( e.object[ 'x' ], equalTo( _event.object[ 'x' ] ) );
			assertThat( e.level, equalTo( _event.level ) );
			assertThat( e.name, equalTo( _event.name ) );
		}
	}
}
