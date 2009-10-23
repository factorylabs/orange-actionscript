////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2007 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyesmedia.debug.redbug
{
	import flash.events.Event;

	/** 
	 * REDEvent - Custom REDbug Event
	 *  
	 * @author   RealEyes Media  
	 * @version  1.0 
	 */	
	public class REDEvent extends Event
	{
		
		/**
		* RED_MSG_IN - REDbug client to console msg in event
		*/		
		public static const RED_MSG_IN:String = "RED_MSG_IN";
		
		/**
		* RED_MSG_OUT - REDbug console to client event
		*/		
		public static const RED_MSG_OUT:String = "RED_MSG_OUT";
		
		/**
		 * msgData - used to tranfer REDbug data from one LocalConnection 
		 * to another
		 */		
		public var msgData:Object;
		
		/**
		 * moduleEvtID - used to determine which module this event is bound for
		 * 
		 */		
		public var moduleEvtID:String;		
		
		/**
		 * Constructor
		 * 
		 * @param type - Event Type
		 * 
		 */		
		public function REDEvent(type:String,p_msgData:Object=null,p_bubbles:Boolean=false)
		{
			super(type,p_bubbles);
			msgData = p_msgData;	
		}
		
        // Override the inherited clone() method.
        override public function clone():Event {
            return new REDEvent(type,msgData,bubbles);
        }
		
		
	}
}