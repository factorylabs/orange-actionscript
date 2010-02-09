
package com.factorylabs.orange.core.display 
{
	import com.factorylabs.orange.core.collections.Map;

	import flash.display.MovieClip;

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
	public interface IFButtonStyle 
	{
		function get map() :Map;
		
		function init( $button :MovieClip ) :void;
		
//		cloneable?
	}
}
