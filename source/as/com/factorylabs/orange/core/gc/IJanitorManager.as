
package com.factorylabs.orange.core.gc 
{

	/**
	 * Summary
	 * 
	 * <p>Description</p>
	 * 
	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 22, 2009
	 */
	public interface IJanitorManager 
	{
		function addJanitor( $janitor :IJanitor ) :void;
		function removeJanitor( $janitor :IJanitor ) :void;
		function cleanUp() :void;
	}
}
