package com.factorylabs.orange.core.gc
{
	/**
	 * Provides an interface with a public <code>dispose()</code> method.
	 * 
	 * <p>This interface allows implementing classes to adhere to the standard
	 * dispose() method which is called when preparing an object for garbage collection</p>
	 * 
	 * Copyright 2008 by Factory Design Labs, All Rights Reserved.
	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	 *
	 * @author		Grant
	 * @version		1.0.0 :: May 9, 2008
	 */
	public interface IDisposable
	{
		/**
		 * Prepares this object for garbage collection.
		 * 
		 * <p>This can include removing listeners, references to other objects,
		 * invoking any other process to facilitate in garbage collection, etc.</p>
		 */
		function dispose():void;
	}
}