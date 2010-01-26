
package com.factorylabs.orange.unit.core.collections 
{
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertFalse;
	import asunit.asserts.assertTrue;

	import com.factorylabs.orange.core.collections.Map;

	import flash.utils.Dictionary;

	/**
	 * Generate the test cases for the Map class.
	 *
	 * <hr />
	 * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
	 * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
 	 * 
 	 * <p>Permission is hereby granted to use, modify, and distribute this file 
 	 * in accordance with the terms of the license agreement accompanying it.</p>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 14, 2009
	 */
	public class MapTests 
	{
		private var _map 		:Map;
		
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
			assertTrue( _map.iterator is Dictionary );
		}

		[Test]
		public function length() :void
		{
			assertEquals( _map.length, 5 );
		}
		
		[Test]
		public function keys() :void
		{
			var array :Array = _map.keys;
			assertTrue( array.length, _map.length );
			assertTrue( hasItem( array, 'key_1' ) );
			assertTrue( hasItem( array, 'key_2' ) );
			assertTrue( hasItem( array, 'key_3' ) );
			assertTrue( hasItem( array, 'key_4' ) );
			assertTrue( hasItem( array, 'key_5' ) );
			assertFalse( hasItem( array, 'key_666' ) );
		}

		[Test]
		public function values() :void
		{
			assertTrue( _map.hasValue( 'value_1' ) );
			assertTrue( _map.hasValue( 'value_2' ) );
			assertTrue( _map.hasValue( 'value_3' ) );
			assertTrue( _map.hasValue( 'value_4' ) );
			assertTrue( _map.hasValue( 'value_5' ) );
			assertFalse( _map.hasValue( 'value_666' ) );
		}
		
		[Test]
		public function get() :void
		{			
			assertEquals( _map.get( 'key_1'), 'value_1' );
			assertEquals( _map.get( 'key_2'), 'value_2' );
			assertEquals( _map.get( 'key_3'), 'value_3' );
			assertEquals( _map.get( 'key_4'), 'value_4' );
			assertEquals( _map.get( 'key_5'), 'value_5' );
		}
		
		[Test]
		public function add() :void
		{
			_map.add( 'tmp_key_1', 'tmp_value_1' );
			assertTrue( _map.hasKey( 'tmp_key_1' ) );
			assertTrue( _map.hasValue( 'tmp_value_1' ) );
		}
		
		[Test(expects='Error')]
		public function add_expects_Error() :void
		{
			_map.add( 'key_1', 'value_1', false );
		}
		
		[Test]
		public function remove() :void
		{
			var value3 :String = String( _map.remove( 'key_3' ) );
			assertEquals( value3, 'value_3' );
			assertFalse( _map.hasKey( 'key_3' ) );
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
			
			assertTrue( extendedMap.hasKey( 'map1_key1' ) );
			assertTrue( extendedMap.hasKey( 'map1_key2' ) );
			assertTrue( extendedMap.hasKey( 'map2_key1' ) );
			assertTrue( extendedMap.hasKey( 'map2_key2' ) );
			
			assertTrue( extendedMap.hasValue( 'map1_value1' ) );
			assertTrue( extendedMap.hasValue( 'map1_value2' ) );
			assertTrue( extendedMap.hasValue( 'map2_value1' ) );
			assertTrue( extendedMap.hasValue( 'map2_value2' ) );
		}
		
		[Test]
		public function hasKey() :void
		{
			assertTrue( _map.hasKey( 'key_1' ) );
			assertFalse( _map.hasKey( 'key_missing' ) );
		}
		
		[Test]
		public function hasValue() :void
		{
			assertTrue( _map.hasValue( 'value_1' ) );
			assertFalse( _map.hasValue( 'value_missing' ) );
		}
		
		[Ignore('Need to figure out how to test this.')]
		[Test]
		public function find() :void
		{
			
		}
		
		[Ignore('Need to figure out how to test this.')]
		[Test]
		public function each() :void
		{
			
		}
		
		[Test]
		public function clear() :void
		{
			_map.clear( );
			assertEquals( _map.length, 0 );
		}
		
		[Test]
		public function dispose() :void
		{
			_map.dispose();
			assertEquals( _map.length, 0 );
		}
		
		[Test]
		public function clone() :void
		{
			var tmp :Map = _map.clone();
			
			assertTrue( tmp.hasKey( 'key_1' ) );
			assertTrue( tmp.hasKey( 'key_2' ) );
			assertTrue( tmp.hasKey( 'key_3' ) );
			assertTrue( tmp.hasKey( 'key_4' ) );
			assertTrue( tmp.hasKey( 'key_5' ) );
			assertTrue( tmp.hasValue( 'value_1' ) );
			assertTrue( tmp.hasValue( 'value_2' ) );
			assertTrue( tmp.hasValue( 'value_3' ) );
			assertTrue( tmp.hasValue( 'value_4' ) );
			assertTrue( tmp.hasValue( 'value_5' ) ); 
			assertEquals( _map.get( 'key_1'), tmp.get( 'key_1') );
		}

		protected function hasItem( $array :Array, $item :String  ) :Boolean
		{
			var len :int = $array.length;
			for( var i :int = 0; i < len; ++i )
			{
				if( $array[ i ] == $item )
					return true;
			}
			return false;
		}
	}
}
