/**
* ...
* @author Default
* @version 0.1 
*/

package com.factorylabs.orange.core.text
{	
	import flash.text.TextFormat;
	import flash.text.StyleSheet;
	
	public final class TextUtils
	{
		
		public static function getTextStyle( styleName:String, ss:StyleSheet ) :TextFormat
		{
			var format:TextFormat = null;
			
			var style:Object = ss.getStyle(styleName);
			trace(style != null);
			if (style != null)
			{
				var colorStr:String = style[ 'color' ];
				if (colorStr != null && colorStr.indexOf("#") == 0)
				{
					style[ 'color' ] = colorStr.substr(1);
				}
				format = new TextFormat(style[ 'fontFamily' ], 
									    style[ 'fontSize' ], 
									    style[ 'color' ], 
									    (style[ 'fontWeight' ] == "bold"), 
									    (style[ 'fontStyle' ] == "italic"), 
									    (style[ 'textDecoration' ] == "underline"), 
									    style[ 'url' ], 
									    style[ 'target' ], 
									    style[ 'textAlign' ], 
									    style[ 'marginLeft' ], 
									    style[ 'marginRight' ],
									    style[ 'textIndent' ], 
									    style[ 'leading' ]);
				
				if (style.hasOwnProperty("letterSpacing"))        
				{                  
					format.letterSpacing = style[ 'letterSpacing' ];
				}
			}
			return format;
		}

	}
	
}
