
package tests.factorylabs.fluint.events
{	import tests.digitalprimates.fluint.monitor.ITestResult;
	
	import flash.events.Event;	

	/**
 	 * Contains information on a TestResult (suite, case, method).
 	 * 
 	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p>
 	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
 	 *
 	 * @author		Matthew Kitt
 	 * @version		1.0.0 :: Mar 28, 2009
 	 */
	public class TestResultEvent
		extends Event
	{
		public static const TEST_SUITE_RESULT	:String = "TestResultEvent.suiteResult";
		public static const TEST_CASE_RESULT	:String = "TestResultEvent.caseResult";
		public static const TEST_METHOD_RESULT	:String = "TestResultEvent.methodResult";
		
		private var _result						:ITestResult;
		
		public function get result() :ITestResult { return _result; }
		public function set result( v_result :ITestResult ) :void
		{
			_result = v_result;
		}
		
		public function  TestResultEvent( type :String, v_result :ITestResult, bubbles :Boolean = false, cancelable :Boolean = false )
		{
			super( type, bubbles, cancelable );
			this.result = v_result;
		}
		
		override public function toString() :String 
		{
			return "tests.factorylabs.fluint.events.TestResultEvent";
		}

		override public function clone() :Event
		{
			return new TestResultEvent( this.type, this.result, this.bubbles, this.cancelable );
		}
	}
}