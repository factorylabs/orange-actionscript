package tests.digitalprimates.fluint.ui
{

	public class TestStatusIcon
   {
      [Embed(source="/assets/tsuite.gif")]
      public static var SUITE_PENDING : Class;
      
      [Embed(source="/assets/tsuiteok.gif")]
      public static var SUITE_PASS : Class;
      
      [Embed(source="/assets/tsuitefail.gif")]
      public static var SUITE_FAIL : Class;
      
      [Embed(source="/assets/tsuiteerror.gif")]
      public static var SUITE_ERROR : Class;
      
      [Embed(source="/assets/test.gif")]
      public static var TEST_PENDING : Class;
      
      [Embed(source="/assets/testok.gif")]
      public static var TEST_PASS : Class;
      
      [Embed(source="/assets/testfail.gif")]
      public static var TEST_FAIL : Class;
      
      [Embed(source="/assets/testerr.gif")]
      public static var TEST_ERROR : Class;
            
      public function TestStatusIcon()
      {
      }
   }
}