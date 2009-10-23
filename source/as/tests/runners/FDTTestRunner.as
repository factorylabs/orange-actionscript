
package tests.runners
{
	import tests.factorylabs.fluint.events.TestResultEvent;
	import tests.factorylabs.fluint.ui.FTestRunner;
	import tests.factorylabs.fluint.ui.TestConsoleDisplay;
	import tests.factorylabs.fluint.ui.TestStageBackgroundDisplay;

	import com.factorylabs.orange.core.display.FSprite;
	import com.factorylabs.orange.core.display.graphics.FRectangle;
	import com.factorylabs.orange.core.display.graphics.fills.GradientFill;

	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.events.Event;
	/**
	 * Primary document class for creating a runner for outputing and displaying results of a group of tests.
 	 * 
 	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p>
 	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
 	 * 
 	 * @author		Matthew Kitt
 	 * @version		1.0.0 :: Mar 28, 2009
 	 */
	public class FDTTestRunner
		extends Sprite
	{
		private var _instance			:FDTTestRunner;
		private var _runner				:FTestRunner;
		private var _background			:TestStageBackgroundDisplay;
		private var _console			:TestConsoleDisplay;
				public function FDTTestRunner()
		{
			_instance = this;
			if ( this.parent is Stage )
				initialize();
			else 
				this.addEventListener( Event.ADDED_TO_STAGE, onStageAdd );
		}
		
		override public function toString() :String 
		{
			return "tests.runners.FDTTestRunner";
		}
		
		public function dispose() :void
		{
			_runner.removeEventListener( FTestRunner.TESTS_COMPLETE, onTestsComplete );
			_runner.removeEventListener( TestResultEvent.TEST_CASE_RESULT, onTestCaseResult );
			_runner.removeEventListener( TestResultEvent.TEST_METHOD_RESULT, onTestMethodResult );
			_background.dispose();
			_console.dispose();
		}
		
		protected function initialize() :void
		{
			this.addEventListener( Event.REMOVED_FROM_STAGE, onStageRemoval );
			setStageModes();
			createViews();
			startTestProcess();
		}
		
		protected function setStageModes() :void
		{
//			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
		}
		
		protected function createViews() :void
		{
			_console = new TestConsoleDisplay( false );
			_background = new TestStageBackgroundDisplay( this );
		}

		protected function startTestProcess() :void
		{
			_runner = new FTestRunner();
			_runner.addEventListener( FTestRunner.TESTS_COMPLETE, onTestsComplete, false, 0, true );
			_runner.addEventListener( TestResultEvent.TEST_CASE_RESULT, onTestCaseResult, false, 0, true );
			_runner.addEventListener( TestResultEvent.TEST_METHOD_RESULT, onTestMethodResult, false, 0, true );
			_runner.startTests( AllTests.getAllTests() );
		}
		
		protected function onTestCaseResult( e :TestResultEvent ) :void
		{
			_console.updateTestCaseResult( e );
		}
		
		protected function onTestMethodResult( e :TestResultEvent ) :void
		{
			_console.updateTestMethodResult( e );
			_background.updateTestMethodResult( e );
		}

		protected function onTestsComplete( e :Event ) :void
		{
			var xml :XML = _runner.xmlResults;
			_console.updateTestsComplete( xml );
			_background.updateTestsComplete( xml );
		}

		private function onStageAdd( e :Event ) :void
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, onStageAdd );
			initialize();
		}
		
		private function onStageRemoval( e :Event ) :void
		{
			dispose();
		}
	}
}