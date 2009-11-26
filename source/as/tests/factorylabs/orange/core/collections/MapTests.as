
package tests.factorylabs.orange.core.collections 
{
	import com.factorylabs.orange.core.collections.Map;

	import org.flexunit.Assert;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.hasItem;
	import org.hamcrest.object.equalTo;

	import flash.utils.Dictionary;
	
	/**
	 * Generate the test cases for the Map class.
	 *
	 * <hr />
	 * <p>Copyright 2004-2009 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p>
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
	public class MapTests 
	{
		private var _map 		:Map;
		
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
			_map = new Map();
			_map.add( 'key_1', 'value_1' );
			_map.add( 'key_2', 'value_2' );
			_map.add( 'key_3', 'value_3' );
			_map.add( 'key_4', 'value_4' );
			_map.add( 'key_5', 'value_5' );			
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_map.dispose();
			_map = null;
		}
		
		[Test]
		public function iterator() :void
		{
			assertThat( _map.iterator is Dictionary, equalTo( true ) );
		}
		
		[Test]
		public function length() :void
		{
			assertThat( _map.length, equalTo( 5 ) );
		}
		
		[Test]
		public function keys() :void
		{
			assertThat( _map.keys, hasItem( 'key_1' ) );
			assertThat( _map.keys, hasItem( 'key_2' ) );
			assertThat( _map.keys, hasItem( 'key_3' ) );
			assertThat( _map.keys, hasItem( 'key_4' ) );
			assertThat( _map.keys, hasItem( 'key_5' ) );
			assertThat( _map.length, equalTo( 5 ) );
		}
		
		[Test]
		public function values() :void
		{
			assertThat( _map.hasValue( 'value_1'), equalTo( true ) );
			assertThat( _map.hasValue( 'value_2'), equalTo( true ) );
			assertThat( _map.hasValue( 'value_3'), equalTo( true ) );
			assertThat( _map.hasValue( 'value_4'), equalTo( true ) );
			assertThat( _map.hasValue( 'value_5'), equalTo( true ) );
			assertThat( _map.hasValue( 'value_6'), equalTo( false ) );
		}
		
		[Test]
		public function get() :void
		{
			Assert.assertEquals( _map.get( 'key_1'), 'value_1' );
			Assert.assertEquals( _map.get( 'key_2'), 'value_2' );
			Assert.assertEquals( _map.get( 'key_3'), 'value_3' );
			Assert.assertEquals( _map.get( 'key_4'), 'value_4' );
			Assert.assertEquals( _map.get( 'key_5'), 'value_5' );
		}
		
		[Test(expects='Error')]
		public function add() :void
		{
			_map.add( 'tmp_key_1', 'tmp_value_1' );
			assertThat( _map.hasKey( 'tmp_key_1'), equalTo( true ) );
			assertThat( _map.hasValue( 'tmp_value_1'), equalTo( true ) );
			_map.add( 'tmp_key_1', 'tmp_value_1', false );
		}
		
		[Test]
		public function remove() :void
		{
			var value3 :String = String( _map.remove( 'key_3' ) );
			assertThat( value3, equalTo( 'value_3' ) );
			assertThat( _map.hasKey( 'key_3' ), equalTo( false ) );
		}
		
		[Test]
		public function extend() :void
		{
			var map1 :Map = new Map();
			var map2 :Map = new Map();
			
			map1.add( 'map1_key1', 'map1_value1' );
			map1.add( 'map1_key2', 'map1_value2' );
			map2.add( 'map2_key1', 'map2_value1' );
			map2.add( 'map2_key2', 'map2_value2' );
			
			var extendedMap :Map = Map( map1.extend( map2 ) );
			
			assertThat( extendedMap.hasKey( 'map1_key1' ), equalTo( true ) );
			assertThat( extendedMap.hasKey( 'map1_key2' ), equalTo( true ) );
			assertThat( extendedMap.hasKey( 'map2_key1' ), equalTo( true ) );
			assertThat( extendedMap.hasKey( 'map2_key2' ), equalTo( true ) );
			assertThat( extendedMap.hasValue( 'map1_value1' ), equalTo( true ) );
			assertThat( extendedMap.hasValue( 'map1_value2' ), equalTo( true ) );
			assertThat( extendedMap.hasValue( 'map2_value1' ), equalTo( true ) );
			assertThat( extendedMap.hasValue( 'map2_value2' ), equalTo( true ) );
		}
		
		[Test]
		public function hasKey() :void
		{
			assertThat( _map.hasKey( 'key_1' ), equalTo( true ) );
			assertThat( _map.hasKey( 'key_missing' ), equalTo( false ) );
		}
		
		[Test]
		public function hasValue() :void
		{
			assertThat( _map.hasValue( 'value_1' ), equalTo( true ) );
			assertThat( _map.hasValue( 'value_missing' ), equalTo( false ) );
		}
		
		[Ignore('Need to figure out how to test this')]
		[Test]
		public function find() :void
		{
			
		}
		
		[Ignore('Need to figure out how to test this')]
		[Test]
		public function each() :void
		{
			
		}
		
		[Test]
		public function clear() :void
		{
			_map.clear();
			assertThat( _map.length, equalTo( 0 ) );
		}
		
		[Test]
		public function dispose() :void
		{
			_map.dispose();
			assertThat( _map.length, equalTo( 0 ) );
		}
		
		[Test]
		public function clone() :void
		{
			var tmp :Map = _map.clone();
			assertThat( tmp.hasKey( 'key_1' ), equalTo( true ) );
			assertThat( tmp.hasKey( 'key_2' ), equalTo( true ) );
			assertThat( tmp.hasKey( 'key_3' ), equalTo( true ) );
			assertThat( tmp.hasKey( 'key_4' ), equalTo( true ) );
			assertThat( tmp.hasKey( 'key_5' ), equalTo( true ) );
			
			assertThat( tmp.hasValue( 'value_1' ), equalTo( true ) );
			assertThat( tmp.hasValue( 'value_2' ), equalTo( true ) );
			assertThat( tmp.hasValue( 'value_3' ), equalTo( true ) );
			assertThat( tmp.hasValue( 'value_4' ), equalTo( true ) );
			assertThat( tmp.hasValue( 'value_5' ), equalTo( true ) ); 
			
			Assert.assertEquals( _map.get( 'key_1'), tmp.get( 'key_1') );
		}
	}
}
