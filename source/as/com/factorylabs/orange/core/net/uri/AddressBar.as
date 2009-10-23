
package com.factorylabs.orange.core.net.uri
{
	import flash.external.ExternalInterface;	import flash.system.Capabilities;		import com.factorylabs.orange.core.collections.Map;	
	/**
	 * This class contains Query parameters and other miscelaneous URI properties.
	 * 
	 * @author Ryan Boyajian
	 */
	public class AddressBar 
		extends Map
	{
		/**
		 * Singleton instance.
		 */
		private static var _instance:AddressBar;
		
		/**
		 * The URL of the app.
		 */
		private var _url:String;
	
		/**
		 * The baseURL of the app.
		 */
		private var _baseurl:String;
		
		/**
		 * The host of the app.
		 */
		private var _host:String;
		
		/**
		 * The scheme of the app.
		 */
		private var _scheme:String;
		
		/**
		 * The domain of the app.
		 */
		private var _domain:String;
		
		/**
		 * The port of the app.
		 */
		private var _port:String;
		
		/**
		 * The path and query of the app.
		 */
		private var _pathandquery:String;
		
		/**
		 * The path of the app.
		 */
		private var _path:String;
		
		/**
		 * The host of the app.
		 */
		private var _query:String;
		
		/**
		 * Singleton constructor.
		 */
		public function AddressBar( enforcer:SingletonEnforcer ):void
		{
			enforcer = null;
		}
		
/* Singleton Instance Accessor ......................................................................................*/
		
		public static function get instance() :AddressBar { return getInstance(); }
		public static function getInstance():AddressBar
		{
			if ( _instance == null ) _instance = new AddressBar( new SingletonEnforcer() );
			return _instance;	
		}

/* Public Methods ...................................................................................................*/
		
		/**
		 * Initializes this class by calling the javascript <code>window.location.toString()</code> function.
		 */
		public function initialize():void
		{
			if ( !ExternalInterface.available || ( Capabilities.playerType == 'External' || Capabilities.playerType == 'Standalone' )) return;
//			Log.debug( "[Url] initialize() " );
			// grab url from javascript.
//			JavascriptInterface.call( 'window.location.toString', setLocation );
			setLocation( ExternalInterface.call( 'window.location.toString' ) );
			
		}
		
		/**
		 * Public function to set read only vars on this from the uri.
		 * @param uri	Map containing values to populate this class with. 
		 */
		public function setURI( uri:Map ):void
		{
			// set vars passed in from UrlPathUtil some may be undefined depends on the URL.
			// port will most likely be undefined for most projects.
			_url = uri.get( 'url' );
			_host = uri.get( 'host' );			_scheme = uri.get( 'scheme' );			_domain = uri.get( 'domain' );			_port = uri.get( 'port' );			_pathandquery = uri.get( 'pathandquery' );			_path = uri.get( 'path' );			_query = uri.get( 'query' );
			_baseurl = _path != null ? _path.slice( 0, _path.lastIndexOf( "/" ) + 1 ) : null;
		}

/* Private Methods .................................................................................................*/
		
		/**
		 * Callback handler from the <code>window.location.toString()</code> javascript function.
		 * 
		 * @param	evt		Event object from dispatching class. 
		 */
		private function setLocation( url:String ):void
		{
//			Log.debug( "[Url] setLocation() ", url );
			var uriMap:Map = Path.parse( url );
			// set other URI vars on QueryParams
			setURI( uriMap );
			// create query params
			if( _query ) createQueryParams();
		}
		
		/**
		 * Creates the map that is this class.
		 */
		private function createQueryParams():void
		{
			// get rid of ?'s
			var query:String = _query.replace( '?', '' );
			// decode it to get rid of %20 and others
			var decodedQuery:String = decodeURI( query );
			// parse query params into map
			var queryArray:Array = decodedQuery.split( '&' );
			var dl:int = queryArray.length;
			for( var i:int = 0; i < dl; i++ )
			{
				var nameValueArray:Array = String( queryArray[ i ] ).split( '=' );
				add( nameValueArray[ 0 ], nameValueArray[ 1 ] );
			}
		}
		
/* Getters/Setters .................................................................................................*/
		
		/**
		 * Gets the url for the app.
		 */
		public function get url():String
		{
			return _url;
		}
		
		/**
		 * Gets the baseurl for the app.
		 */
		public function get baseurl():String
		{
			return _baseurl;
		}
		
		/**
		 * Gets the host for the app.
		 */
		public function get host():String
		{
			return _host;
		}
		
		/**
		 * Gets the scheme for the app.
		 */
		public function get scheme():String
		{
			return _scheme;
		}
		
		/**
		 * Gets the domain for the app.
		 */
		public function get domain():String
		{
			return _domain;
		}
		
		/**
		 * Gets the port for the app.
		 */
		public function get port():String
		{
			return _port;
		}
		
		/**
		 * Gets the path and query for the app.
		 */
		public function get pathandquery():String
		{
			return _pathandquery;
		}
		
		/**
		 * Gets the path for the app.
		 */
		public function get path():String
		{
			return _path;
		}
		
		/**
		 * Gets the query for the app.
		 */
		public function get query():String
		{
			return _query;
		}
	}
}
internal class SingletonEnforcer {}