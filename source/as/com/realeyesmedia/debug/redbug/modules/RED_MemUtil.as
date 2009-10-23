////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2007 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyesmedia.debug.redbug.modules
{
	import com.realeyesmedia.debug.redbug.REDTransferManager;
	import flash.system.System;
	
	/** 
	 * RED_MemUtil - The RED_MemUtil class facilitates memory 
	 * utilization communication from a client app to the REDbug console
	 * 
	 * @author   RealEyes Media  
	 * @version  1.0 
	 */	
	public class RED_MemUtil extends REDTransferManager
	{
		
		/**
		* msg - a debug string 
		*/		
		public var msg:String;

		/**
		* memUtilization - memory utilization 
		*/
		public var memUtilization:uint;

		/**
		* timeSinceTimerStart - time since start of timer 
		*/
		public var timeSinceTimerStart:Number;

		/**
		* MODULE_ID - this is the module id used to determine the event name
		*/						
		public static const MODULE_ID:String = "RED_MemUtilID";		

		/**
		 * Constructor 
		 * 
		 * @param p_msg - Debug message string
		 */
		public function RED_MemUtil(p_msg:String='',p_timeSinceTimerStart:Number=0,p_allowReceiveData:Boolean=false)
		{	
			
			// Need to specify the moduleEvt
			super(MODULE_ID,p_allowReceiveData);	
			
			// Update does the work...
			update(p_msg,p_timeSinceTimerStart);
		}
		
		/**
		 * Used to pre-process and send data 
		 * to the REDbug.send()  
		 * 
		 */		
		public function update(p_msg:String='',p_timeSinceTimerStart:Number=0):REDTransferManager
		{	
			// Update parent members
			super.updateBase();
			
			// Update members
			msg = p_msg;
			memUtilization = System.totalMemory;
			timeSinceTimerStart = p_timeSinceTimerStart;					
							
			return this;
		}
		
		/*  SHOULD NOT HANDLED IN SUPER*/
		//used to recast generic obj to class inst from LC console data
		override public function updateFromObj(p_obj:Object):void
		{
			// Update members
			redbugAppID = p_obj.redbugAppID;
			redbugSessionID = p_obj.redbugSessionID;
			msg = p_obj.msg;
			memUtilization = p_obj.memUtilization;
			timeSinceTimerStart = p_obj.timeSinceTimerStart;
		}
		
	}
}
