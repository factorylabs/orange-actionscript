
package com.factorylabs.orange.core.display 
{
	/**
	 * Basic implementations for all <code>FDisplayObjects</code> which are subclasses of the native <code>DisplayObjects</code>.
	 * 
	 * <p>Meant to be used in place of the native flash <code>DisplayObject</code> class.</p>
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
	 * @version		1.0.0 :: Nov 27, 2009
	 */
	public interface IFDisplayObject 
	{
		/**
		 * Maps all the object's properties to the <code>DisplayObject</code>.
		 * If there are properties that do not exist, an error is thrown. 
		 * @param $object	Object to map properties from.
		 * @throws	com.factorylabs.orange.core.errors.IllegalSetDisplayObjectPropertiesError When an invalid property assignment was attempted.
		 */
		function setDisplayObjectProperties( $object :Object ) :void;
		
		/**
		 * Removes the display object from its parent container.
		 */
		function remove() :void;
	}
}
