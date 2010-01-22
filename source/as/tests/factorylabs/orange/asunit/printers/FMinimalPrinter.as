
package tests.factorylabs.orange.asunit.printers 
{
	import flash.display.Shape;
	import com.bit101.components.Style;
	import asunit.framework.ITestFailure;

	import asunit4.framework.IResult;
	import asunit4.framework.IRunListener;
	import asunit4.framework.ITestSuccess;
	import asunit4.framework.Method;

	import com.bit101.components.Text;
	import com.bit101.components.VBox;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * Summary.
	 * 
	 * <p>Description.</p>
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
	 * @version		1.0.0 :: Jan 21, 2010
	 */
	public class FMinimalPrinter 
		extends Sprite 
			implements IRunListener 
	{
		protected var dots :Text;
		
		public function FMinimalPrinter()
		{
			if( stage )
				initUI();
			else
				addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
		}
		
		public function onRunStarted() :void
		{
			dots.text = '';
		}
		
		public function onTestStarted(test :Object) :void
		{
		}
		
		public function onTestIgnored(method :Method) :void
		{
			dots.text += 'I';
		}
		
		public function onTestFailure(failure :ITestFailure) :void
		{
			dots.text += failure.isFailure ? 'F' : 'E';
		}
		
		public function onTestSuccess(success :ITestSuccess) :void
		{
			dots.text += '.';
		}
		
		public function onTestCompleted(test :Object) :void
		{
		}
		
		public function onRunCompleted(result :IResult) :void
		{
			var fill :uint = ( result.errorCount > 0 || result.failureCount > 0 ) ? 0x8B0000 : 0x006400;
			var shape :Shape = new Shape();
			shape.graphics.beginFill( fill, .5 );
			shape.graphics.drawRect( 0, 0, stage.stageWidth, stage.stageHeight );
			shape.graphics.endFill();
			addChild( shape );
			broadcastComplete();
		}
		
		protected function broadcastComplete() :void
		{
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		protected function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			initUI();
		}
		
		protected function initUI() :void
		{
			Style.LABEL_TEXT = 0xFFFFFF;
			var vbox :VBox = new VBox( this );
			vbox.spacing = 0;
			dots = new Text( vbox );
			dots.width = stage.stageWidth;
			dots.height = stage.stageHeight;
		}
	}
}
