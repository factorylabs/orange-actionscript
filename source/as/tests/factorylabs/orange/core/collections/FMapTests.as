
package tests.factorylabs.orange.core.collections 
{
	import com.factorylabs.orange.core.collections.Map;

	import org.flexunit.Assert;

	/**
	 * Summary
	 * 
	 * <p>Description</p>
	 * 
	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 14, 2009
	 */
	public class FMapTests 
	{
		private var _map 		:Map;
		
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
			_map = new Map();
			_map.add( "key_1", "value_1" );
			_map.add( "key_2", "value_2" );
			_map.add( "key_3", "value_3" );
			_map.add( "key_4", "value_4" );
			_map.add( "key_5", "value_5" );			
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_map = null;
		}
		
		[Test]
		public function iterator() :void
		{
			assertTrue( _map.iterator is Dictionary );
		}
		
		[Test]
		public function get() :void
		{
			Assert.assertEquals( _map.get( "key_1"), "value_1" );
			Assert.assertEquals( _map.get( "key_2"), "value_2" );
			Assert.assertEquals( _map.get( "key_3"), "value_3" );
			Assert.assertEquals( _map.get( "key_4"), "value_4" );
			Assert.assertEquals( _map.get( "key_5"), "value_5" );
		}
	}
}
