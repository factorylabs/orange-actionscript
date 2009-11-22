
package tests.factorylabs.orange.core.gc 
{

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
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class GCTestSuite 
	{
		public var janitorTests				:JanitorTests;
		public var janitorConnectionsTests	:JanitorConnectionsTests;
		public var janitorManagerTests		:JanitorManagerTests;
		public var janitorSoundChannelTests	:JanitorSoundChannelTests;
		public var weakReferenceTests		:WeakReferenceTests;
	}
}
