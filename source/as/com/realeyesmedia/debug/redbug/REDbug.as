////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2007 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyesmedia.debug.redbug 
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;

	/** 
	 * REDbug - Main client-side api interface to REDbug debugging
	 * 
	 * @author   RealEyes Media  
	 * @version  1.0 
	 */
	dynamic public class REDbug extends Proxy
	{

		/**
		 * @private 
		 * 
		 */		
		private var _transferManagers:Object;		


		/**
		 * @private 
		 *  
		 */		
		private static var _communicator:REDCommunicator;
				
		/**
		 * @private 
		 * 
		 */	
        private static var _instance:REDbug;
                
		/**
		 * redbugAppID - The appID for debugging 
		 * 
		 */		
		public static var redbugAppID:String;

		/**
		 * redbugSessionID - The sessionID for debugging 
		 * 
		 */		
		public static var redbugSessionID:Number;

		/**
		 * appType - The appType (AIR,FLASH, or FLEX) 
		 * 
		 */		
		public static var appType:String;
		
		/**
		 * debugActive - the debug on/off flag 
		 * 
		 */		
		public static var debugActive:Boolean;
		
		/**
		 * REDBUG_CONSOLE - a string to reference the REDbug console
		 * 
		 */		
		public static const REDBUG_CONSOLE:String = 'REDBUG_CONSOLE';		
		
		/**
		 * Constructor
		 * 
		 */		
		public function REDbug()
        {
        	if (_instance != null )
				throw new Error( "Only one REModelLocator instance should be instantiated" );

			// Initialize the transferManagers object
			this._transferManagers = new Object();					
        }

        /**
         * getInstance() - used to return the Singleton instance 
         * 
         * @return - the instance of this class will be returned
         * 
         */		 
        public static function getInstance():REDbug
        {
        	// The reason we need a Singleton is that is the only way the Proxy methods will work
        	// for dynamic method calls.
        	if (_instance == null)
				_instance = new REDbug();
			return _instance;	
        }

        /**
        * gi() - used to return the Singleton instance. 
        * This is a shortcut to using getInstance()
        * 
        * @return - the instance of the class will be returned
        * 
        */
		public static function gi():REDbug
		{
			return getInstance();
		}

		/**
		 * Used to set a redbugAppID for the current application, or initialize the console
		 * 
		 * @param p_redbugAppID - Each app that connects to the console needs an identifier, the default is to init the REDBUG_CONSOLE
		 * @param p_appType - The appType (AIR,FLASH, or FLEX), the default is AIR
		 * @param p_debugActive - Debugging is turned on and off using this value, the default is ON
		 * 
		 */		
		public static function initialize(p_redbugAppID:String=REDBUG_CONSOLE,p_appType:String=REDAppTypes.TYPE_AIR,p_debugActive:Boolean=true):void
		{
			redbugAppID = p_redbugAppID;
			appType = p_appType;
			debugActive = p_debugActive;
			
			// Also set the sessionID
			redbugSessionID = new Date().time;
		}
		
		/**
		 * Used to register module-specific client-side tranfer manager classes
		 * 
		 * @param p_alias - The REDbug property that will be used to proxy to the client-side transfer manager
		 * @param p_module - The instance of the client side transfer manager class.
		 * 
		 */		
		public static function addTransferManager(p_alias:String,p_module:REDTransferManager):void
		{
			//trace('In addTransferManager()');
		
			// Make sure debugging is turned on
			if(debugActive)
			{
				// Also make sure the transferManager does not already exist
				if(!REDbug.gi()._transferManagers.hasOwnProperty(p_alias))
				{
					REDbug.gi()._transferManagers[p_alias] = p_module;
				}
			}	
		}


		
		/**
		 * send -  used to send REDTransferManager data over the LC to the REDbug Console.
		 * 
		 * @param p_msgData - The REDTransferManager object containing data to send
		 * @param p_lcDestination - The connection name of the LC that will be receiving the data
		 * 
		 */		
		// TODO: What was the Boolean for? 
		public static function send(p_msgData:REDTransferManager,p_lcDestination:String=''):void
		{
			// Make sure debugging is turned on
			if(debugActive)
			{
				//If necessary init the LC Manager
				if(_communicator == null)
				{
					// If the appID is the console then we need to init the LC manager as a console
					if(redbugAppID == REDBUG_CONSOLE)
					{
						_communicator = new REDCommunicator(REDCommunicator.RED_COMMUNICATOR_TYPE_CONSOLE);
					}
					else
					{
						_communicator = new REDCommunicator(REDCommunicator.RED_COMMUNICATOR_TYPE_CLIENT);
					}	
					
					// Add a listener for the data in event
					_communicator.addEventListener(REDEvent.RED_MSG_IN,onDataIn); 
				}	
				
				p_msgData.execute();
				
				//trace("p_msgData.silent: " + p_msgData.silent);
				// Send the data
				if(!p_msgData.silent)
				{
					// If the LC destination was set, send it
					if(p_lcDestination != '')
					{
						// The lc name is the appID prepended with an underscore
						_communicator.send(p_msgData,"_" + p_lcDestination);
					}
					else
					{
						_communicator.send(p_msgData);
					}	
				}
			}	
		}
		
		private static function onDataIn(p_evt:REDEvent):void
		{
			// Parse the moduleID
			var moduleID:String = p_evt.msgData.moduleEvt;
			// Find out the current modules 
			var myTransferManagers:Object = REDbug.gi()._transferManagers;
			// Run the module update
			myTransferManagers[moduleID].update();
			// Send the data
			REDbug.send(myTransferManagers[moduleID]);
		}	
		
	//-----------------------------------------------------------
	//PROXY SPECIFIC FUNCTIONS
	//-----------------------------------------------------------
		// You will need the following imports
		//	import flash.utils.Proxy;
		//  import flash.utils.flash_proxy;
		
		/**
		 * callProperty - will be called for dynamic methods on a
		 * class that extends flash.utils.Proxy
		 * 
		 */
		flash_proxy override function callProperty(methodName:*, ...args):*
		{
			//trace('In callProperty');
			
			// Make sure that debug is on
			if(debugActive)
			{
				// If the transferManager doesn't exist then throw an error
				if(_transferManagers[methodName] == null)
				{
					throw new Error('If you do not addTransferManager(), then you must use REDbug.send()');
				}
				// The transferManager exists so run the transferManager's update function
				else
				{
					// First the transferManager data will be updated, 
					// then the information will be sent over the lc
					send(_transferManagers[methodName].update.apply(_transferManagers[methodName],args));	
				}
			}	
		}
	}
}