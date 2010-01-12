
package tests.factorylabs.orange.helpers 
{
	import flash.display.DisplayObject;
	import org.fluint.uiImpersonation.UIImpersonator;
	import mx.containers.Canvas;
	
	/**
	 * MockCanvas is a hook into adding and removing items directly to the <code>Stage</code> via a <code>Canvas</code> 
	 * object and FlexUnit's <code>UIImpersonator</code>.
	 *
	 *<p>This is a workaround for the error that is thrown when a native <code>DisplayObject</code> is added through FlexUnit's <code>UIImpersonator</code>.
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
	 * @version		1.0.0 :: Dec 5, 2009
	 */
	public class MockCanvas
		extends Canvas 
	{
		public function MockCanvas() 
		{
			super();
			UIImpersonator.addChild( this );
		}
		
		public function add( $child :DisplayObject ) :void
		{
			stage.addChild( $child );
		}
		
		public function remove( $child :DisplayObject ) :void
		{
			stage.removeChild( $child );
		}
	}
}
