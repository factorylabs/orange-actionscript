
package com.factorylabs.orange.core.gc 
{
	import com.factorylabs.orange.core.collections.IMap;

	/**
	 * Provides an interface for storing a number of <code>Janitor</code> instances for quick and automated cleanup.
	 *
	 * <hr />
	 * <p>Copyright 2004-2010 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p>
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
	 * @version		1.0.0 :: Nov 22, 2009
	 */
	public interface IJanitorManager 
	{
		/**
		 * The <code>IMap</code> to store all <code>IJanitor</code> instances.
		 */
		function get map() :IMap;
		
		/**
		 * Adds a <code>Janitor</code> instance to the <code>IJanitor</code>'s <code>IMap</code>.
		 * @param	$janitor	<code>IJanitor</code> to add.
		 */	
		function addJanitor( $janitor :IJanitor ) :void;
		
		/**
		 * Removes a <code>IJanitor</code> instance from the <code>IMap</code>.
		 * @param	$janitor	<code>IJanitor</code> to remove.
		 */
		function removeJanitor( $janitor :IJanitor ) :void;
		
		/**
		 * Explicitly remove and call the cleanup for an <code>IJanitor</code>.
		 * @param $janitor	<code>IJanitor</code> to remove.
		 */
		function cleanUpJanitor( $janitor :IJanitor ) :void;
		
		/**
		 * Cleans up all <code>IJanitors</code> registered to the manager.
		 */
		function cleanUp() :void;
	}
}
