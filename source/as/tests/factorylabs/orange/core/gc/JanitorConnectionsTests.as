
package tests.factorylabs.orange.core.gc 
{
	import tests.factorylabs.orange.helpers.MockBaseClass;

	import com.factorylabs.orange.core.gc.JanitorConnections;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.object.nullValue;

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
	public class JanitorConnectionsTests 
	{
		private var _mocker		:MockBaseClass;
		private var _janitor 	:JanitorConnections;

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
			_janitor = new JanitorConnections( this );
		}
		
		[After]
		public function runAfterEachTest():void
		{
			_janitor.cleanUp();
			_janitor = null;
			_mocker = null;
		}
		
		[Test]
		public function addConnection() :void
		{
			_janitor.addConnection( _mocker );
			assertThat( _janitor.connections, notNullValue() );
			assertThat( _janitor.connections[ _mocker ], notNullValue() );
		}
		
		[Test]
		public function removeConnection() :void
		{
			_janitor.addConnection( _mocker );
			assertThat( _janitor.connections, notNullValue() );
			
			_janitor.removeConnection( _mocker );
			assertThat( _janitor.connections[ _mocker ], nullValue() );
		}
		
		[Test]
		public function cleanUpConnections() :void
		{
			var mocker2 :MockBaseClass = new MockBaseClass();
			
			_janitor.addConnection( _mocker );
			_janitor.addConnection( mocker2 );
			assertThat( _janitor.connections, notNullValue() );
			assertThat( _janitor.connections[ _mocker ], notNullValue() );
			assertThat( _janitor.connections[ mocker2 ], notNullValue() );
			
			_janitor.cleanUpConnections();
			assertThat( _janitor.connections[ _mocker ], nullValue() );
			assertThat( _janitor.connections[ mocker2 ], nullValue() );
		}
	}
}
