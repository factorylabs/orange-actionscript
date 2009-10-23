////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2007 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyesmedia.debug.redbug
{
	//import flash.system.Capabilities;
		
	/** 
	 * REDTransferManager - All client-side communicator 
	 * libraries should implement this base class.
	 * 
	 * @author   RealEyes Media  
	 * @version  1.0 
	 */	
	public class REDTransferManager
	{		
		/**
		 * indicates if instance should be sent to console
		 */
		public var silent:Boolean = false;
		
		/**
		* moduleEvt - The module's event type (For setting up listeners)
		*/		
		public var moduleEvt:String;

		/**
		* redbugAppID - The ID that is used during LC communication
		*/		
		public var redbugAppID:String;

		/**
		* redbugSessionID - The ID that is used during a single LC communication
		*/		
		public var redbugSessionID:Number;

		/**
		* appType - The appType (AIR,FLASH, or FLEX)
		*/		
		public var appType:String;

		/**
		* timestamp - The timestamp of the communication message:
		* The number of milliseconds since midnight January 1, 1970, 
		* universal time, for a Date object.
		*/		
		public var timeStamp:Number;
		
		/**
		* currentCapabilities - An object containing capabilities such as 
		* Flash Player version, OS, etc.
		*/		
		//public var currentCapabilities:Class;		
		
		/**
		 * Constructor
		 * 
		 */		 
		public function REDTransferManager(p_moduleEvt:String,p_allowReceiveData:Boolean=false)
		{
			// Set the moduleEvt
			moduleEvt = p_moduleEvt;
			
			// Set other members
			updateBase();
			
			// If allowReceiveData is set then we need to register with the REDbug instance
			if(p_allowReceiveData)
			{
				REDbug.addTransferManager(p_moduleEvt,this);
			}
		}
		
		/**
		 * Used to run any client side executions before sending to LC
		 * 
		 */
		public function execute():void
		{
			trace('In REDTransferManager Execute()');
		}
		
		
		/**
		 * Used to pre-process and 
		 * return data for REDbug.send()  
		 * 
		 */		
		protected function updateBase():void
		{
			// Reset the timestamp (We may be sending this a long time after initial instantiation)
			timeStamp = new Date().time;
			
			// Reset the capabilites object (For instance if they change screen resolution)
			//currentCapabilities =  Capabilities;
			
			// Set the AppID
			redbugAppID = REDbug.redbugAppID;

			// Set the SessionID
			redbugSessionID = REDbug.redbugSessionID;

			// Set the appType
			appType = REDbug.appType;			
		}
		
		public function updateFromObj(p_obj:Object):void
		{
			throw("This method should be overriden");
		}
		
	}
}