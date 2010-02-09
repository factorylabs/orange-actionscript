
package com.factorylabs.orange.core.display 
{

	/**
	 * Summary.
	 * 
	 * <p>Description.</p>
	 *
	 * <hr />
	 * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
	 * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
	 * 
	 * <p>Permission is hereby granted to use, modify, and distribute this file 
	 * in accordance with the terms of the license agreement accompanying it.</p>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Feb 8, 2010
	 */
	public interface IFButton 
	{
		function get enabled() :Boolean;
		function set enabled( $enabled :Boolean ) :void;
		
		function get selected() :Boolean;
		function set selected( $selected :Boolean ) :void;
		
		function get highlighted() :Boolean;
		function set highlighted( $higlighted :Boolean ) :void;
		
		function get style() :IFButtonStyle;
		function set style( $style :IFButtonStyle ) :void;
		
		function displayState( $type :String ) :Boolean;
	}
}
