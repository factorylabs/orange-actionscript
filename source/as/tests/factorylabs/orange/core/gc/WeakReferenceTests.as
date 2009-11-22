
package tests.factorylabs.orange.core.gc 
{
	import tests.factorylabs.orange.helpers.MockBaseClass;

	import com.factorylabs.orange.core.gc.WeakReference;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	/**
	 * Summary
	 * 
	 * <p>Description</p>
	 * 
	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 21, 2009
	 */
	public class WeakReferenceTests 
	{
		private var _weak		:WeakReference;
		private var _mocker		:MockBaseClass;
		
		[BeforeClass]
		public static function runBeforeEntireSuite():void
		{
			
		}
		
		[AfterClass]
		public static function runAfterEntireSuite():void
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
