package tests.factorylabs.orange.core.gc 
{
	import com.factorylabs.orange.core.gc.Janitor;
	import flash.display.MovieClip;

	/**
	 * Summary
	 * 
	 * <p>Description</p>
	 * 
	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p>
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 19, 2009
	 */
	public class JanitorTests 
	{
		private var _janitor		:Janitor;
		
		[BeforeClass]
		public static function runBeforeEntireSuite():void
		{
			
		}
		
		[AfterClass]
		public static function runAfterEntireSuite():void
		{
			
		}
		
		[Before]
		public function runBeforeEachTest():void
		{
			_janitor = new Janitor( this );
		}
		
		[After]
		public function runAfterEachTest():void
		{
			
		}
		
		[Test]
		public function example() :void
		{
			var mc :MovieClip = new MovieClip();
			mc.alpha = 0;
		}
	}
}