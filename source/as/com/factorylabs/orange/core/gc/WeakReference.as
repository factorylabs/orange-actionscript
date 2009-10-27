package com.factorylabs.orange.core.gc
{
	import flash.utils.Dictionary;
	
	/**
	 * 	WeakReference class from gSkinner
	 *
	 *	enables weakreference for the GC.
	 *	
 	 * <p>Copyright 2004-2009 by Factory Design Labs</p>
     * 
     * Permission is hereby granted, free of charge, to any person obtaining
     * a copy of this software and associated documentation files (the
     * "Software"), to deal in the Software without restriction, including
     * without limitation the rights to use, copy, modify, merge, publish,
     * distribute, sublicense, and/or sell copies of the Software, and to
     * permit persons to whom the Software is furnished to do so, subject to
     * the following conditions:
     * 
     * The above copyright notice and this permission notice shall be
     * included in all copies or substantial portions of the Software.
     * 
     * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
     * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
     * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
     * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
     * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
     * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
     * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 */
	public final class WeakReference 
	{
		private var dictionary:Dictionary;
		
		public function WeakReference(obj:*) 
		{
			dictionary = new Dictionary(true);
			dictionary[obj] = null;
		}
		
		public function get():* 
		{
			for (var n:* in dictionary) { return n; }
			return null;
		}
		
		/**
		 * @return	string equivalent of this class.
		 */
		public function toString() :String 
		{
			return "com.factorylabs.orange.core.gc.WeakReference";
		}
	}
}