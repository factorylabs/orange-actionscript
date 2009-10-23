/**
* Description here..
* @author Default
* @version 0.1
*/
package com.factorylabs.orange.core.net.uri
{
	import com.factorylabs.orange.core.collections.Map;	
	public class Path
	{
		public static function join(...paths):String
		{
			var path:String = String(paths.shift());
			
			var _len:Number = paths.length;
			for (var i : Number = 0; i < _len; i++) 
			{
				if(!Path.endsWith(path,"/")) path += "/";
				path += (Path.beginsWith(paths[i],"/"))? paths[i].substring(1,paths[i].length) : paths[i];
			}
			
			return path;
		}
		
		public static function extension(path:String):String
		{
			return path.substring(path.lastIndexOf("."), path.length);
		}
		
		public static function file(path:String):String
		{
			return path.substring(path.lastIndexOf("/")+1, path.length);
		}
		
		
		public static function addParams(path:String, params:Map):String
		{
			if(!params.length) return path;
			
			path += "?";
			for each(var key:String in params)
			{
				path += key+"="+params[key]+"&";
			}
			
			path = path.substring(0,path.length-2);
			return path;
		}
		
		/**
		 * Parses a url into various URI properties.
		 */
		public static function parse( url:String ):Map
		{
			var regex:RegExp = /((https?):\/\/([-\w\.]+)+(:\d+)?)(\/([~\-#\w\/_\.]*)?(\?\S+)?)?/;
			var uri:Map = new Map();
			var result:Array = regex.exec( url ) as Array;
			if( result[ 0 ] ) uri.add( "url", result[ 0 ] );
			if( result[ 1 ] ) uri.add( "host", result[ 1 ] );
			if( result[ 2 ] ) uri.add( "scheme", result[ 2 ] );
			if( result[ 3 ] ) uri.add( "domain", result[ 3 ] );
			if( result[ 4 ] ) uri.add( "port", String( result[ 4 ] ).substring( 1, result[ 4 ].length ) );
			if( result[ 5 ] ) uri.add( "pathandquery", result[ 5 ] );
			if( result[ 6 ] ) uri.add( "path", result[ 6 ] );
			if( result[ 7 ] ) uri.add( "query", result[ 7 ] );
			return uri;
		}
		
		public static function beginsWith(p_string:String, p_begin:String):Boolean 
		{
			if (p_string == null) { return false; }
			return new RegExp("^"+p_begin,null).test(p_string);
		}
		
		public static function endsWith(p_string:String, p_end:String):Boolean 
		{
			return new RegExp(p_end+"$",null).test(p_string);
		}
	}
}

