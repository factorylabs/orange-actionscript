
package com.factorylabs.orange.core.gc
{
	import flash.utils.Dictionary;
	
	/**
	 * Enables WeakReference for the garbage collector.
	 *
	 * <p>The following people are credited with originating all or parts of this code:<br />
	 * Grant Skinner :: www.gskinner.com</p>
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
	 * @author		Grant Skinner
	 * @author		Ryan Boyajian
 	 * @version		1.0.0 :: Aug 19, 2008
	 */
	public final class WeakReference 
	{
		private var dictionary:Dictionary;
		
		/**
		 * Setup a weak reference.
		 * @param $obj	The object to utilize a weak reference.
		 */
		public function WeakReference( $obj :* ) 
		{
			dictionary = new Dictionary( true );
			dictionary[ $obj ] = null;
		}
		
		/**
		 * The objects residing in the <code>Dictionary</code>.
		 */
		public function get() :* 
		{
			for( var n :* in dictionary ) { return n; }
			return null;
		}
		
		/**
		 * @return	The string equivalent of this class.
		 */
		public function toString() :String 
		{
			return 'com.factorylabs.orange.core.gc.WeakReference';
		}
	}
}