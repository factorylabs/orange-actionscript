
package com.factorylabs.orange.unit.core 
{
	import com.factorylabs.orange.unit.core.collections.CollectionsTestSuite;
	import com.factorylabs.orange.unit.core.display.DisplayTestSuite;
	import com.factorylabs.orange.unit.core.gc.GCTestSuite;
	import com.factorylabs.orange.unit.core.logging.LoggingTestSuite;
	import com.factorylabs.orange.unit.core.math.MathTestSuite;
	import com.factorylabs.orange.unit.core.printing.PrintingTestSuite;
	import com.factorylabs.orange.unit.core.signals.SignalsTestSuite;
	import com.factorylabs.orange.unit.core.text.TextTestSuite;
	import com.factorylabs.orange.unit.core.utils.UtilsTestSuite;

	/**
	 * Suite of test cases for the core package.
	 *
	 * <hr />
	 * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
	 * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
 	 * 
 	 * <p>Permission is hereby granted to use, modify, and distribute this file 
 	 * in accordance with the terms of the license agreement accompanying it.</p>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Nov 14, 2009
	 */
	[Suite]
	public class FCoreTestSuite 
	{
		public var collectionsTestSuite	:CollectionsTestSuite;
		public var displayTestSuite		:DisplayTestSuite;
		public var gcTestSuite			:GCTestSuite;
		public var loggingTestSuite		:LoggingTestSuite;
		public var mathTestSuite		:MathTestSuite;
		public var printingTestSuite	:PrintingTestSuite;
		public var signalsTestSuite		:SignalsTestSuite;
		public var textTestSuite		:TextTestSuite;
		public var utilsTestSuite		:UtilsTestSuite;
	}
}