////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2007 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyesmedia.debug.redbug
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;
	
	/** 
 	 * REDCommunicator - Base class used to facilitate 
 	 * inbound and outbound LocalConnection communication 
 	 * within REDbug and Client Applications
 	 * 
 	 * @author   RealEyes Media  
 	 * @version  1.0 
 	 */
	public class REDCommunicator extends EventDispatcher
	{
		
		/**
		 * @private
		 */		
		private var _lc:LocalConnection;
		
		/**
		 * @private
		 */		
		private var _communicatorType:String;		

		/**
		 * RED_CONSOLE_COMMUNICATOR_LC_NAME - The LC name of the REDbug Console
		 * 
		 */		
		public static const RED_CONSOLE_COMMUNICATOR_LC_NAME:String = "_REDbugConsole";

		/**
		 * RED_COMMUNICATOR_TYPE_CLIENT - A client REDCommunicator
		 * 
		 */		
		public static const RED_COMMUNICATOR_TYPE_CLIENT:String = "CLIENT";
		
		/**
		 * RED_COMMUNICATOR_TYPE_CONSOLE - A console REDCommunicator
		 * 
		 */		
		public static const RED_COMMUNICATOR_TYPE_CONSOLE:String = "CONSOLE";		
				
		/**
		 * Constructor
		 * 
		 */		
		public function REDCommunicator(p_communicatorType:String)
		{
            _lc = new LocalConnection();
            _lc.client = this;
                        
			// Handle status event
			// Moved this line from within the try statement to here so its always added.
			// Otherwise, unhandled run-time errors fire with every send()
			// Change made by Grant Davis, grant@factorylabs.com
			_lc.addEventListener(StatusEvent.STATUS,onStatusEvent); 
            
            try
            {
            	// If lcName is explicitly being passed then we set the app as REDbug Console
            	if(p_communicatorType == RED_COMMUNICATOR_TYPE_CONSOLE)
            	{
	                _lc.connect(RED_CONSOLE_COMMUNICATOR_LC_NAME);    

		            // Need to allow access (for instance from CF-based Flex app or Flash 8)
		            _lc.allowDomain("*");
		            _lc.allowInsecureDomain("*");
	              
	                _communicatorType = RED_COMMUNICATOR_TYPE_CONSOLE;  
            	}
				else
				{
	            	// Use underscore to allow connection from multiple domains
	                _lc.connect("_" + REDbug.redbugAppID);            
	                _communicatorType = RED_COMMUNICATOR_TYPE_CLIENT;        							
				}
                
               
            }
            catch (error:Error)
            {
                trace("[REDCommunicator] error:: already connected");
            }
		}

		/**
		 * send - this method is used to pass msgData onto the Local Connection
		 * 
		 * @param p_msgData - The data being sent over the LC
		 * @param p_lcDestination - The connection name of the LC that will be receiving the data
		 * 
		 */		
		public function send(p_msgData:REDTransferManager,p_lcDestination:String=RED_CONSOLE_COMMUNICATOR_LC_NAME):void
		{
			try
			{
				//trace('~~~~ Transfer data right before send ~~~~');
				//trace(ObjectUtil.toString(p_msgData));
				// Send out on the LC
				_lc.send( p_lcDestination
						 ,"receive"
						 ,[p_msgData]);
			}
			catch (error:Error)
			{
				trace("[REDCommunicator] error:: connection error :: " + error.message);
			}
		}
		 
		/**
		 * receive - this is a handler for inbound REDbug Messages
		 * 
		 * @param p_msgData - represents inbound data from a client app
		 */		
		public function receive(p_msgData:Object):void
		{
			//trace('~~~~ Transfer data right after send ~~~~');
			//trace(ObjectUtil.toString(p_msgData));
			// Dispatch the event
			this.dispatchEvent(new REDEvent(REDEvent.RED_MSG_IN,p_msgData[0]));
		}
		
		/**
		 * onStatusEvent - used to handle errors with the LocalConnection
		 * 
		 * @param p_evt - the event object
		 * 
		 */		
		private function onStatusEvent(p_evt:StatusEvent):void
		{
//			trace("[REDCommunicator] error :: " + p_evt.level);	
		}
	}
}