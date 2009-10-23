////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2007 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyesmedia.debug.redbug
{	
	/** 
	 * IREDModule - All REDbug Console snap-in modules 
	 * need to implement this interface
	 * 
	 * @author   RealEyes Media  
	 * @version  1.0 
	 */
	public interface IREDModule
	{
		/**
		* The init method - where the event handler is added
		*/		
		function initModule(...args):void;
		
		/**
		* Used to handle data-in events
		*/	
		function onModuleDataIn(p_evt:REDEvent):void;		
		
		/**
		* The deactivation method - to clean up event listeners etc 
		*/		
		function deactivateModule(...args):void;
	}
}