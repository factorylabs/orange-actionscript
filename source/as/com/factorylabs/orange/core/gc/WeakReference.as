package com.factorylabs.orange.core.gc
{
	import flash.utils.Dictionary;
	
	/**
	* 	WeakReference class from gSkinner
	*
	*	enables weakreference for the GC.
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
	}
}