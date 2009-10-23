////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2007 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyesmedia.debug.redbug.modules
{
	import flash.system.System;
	import flash.utils.Dictionary;
	
	import com.realeyesmedia.debug.RE_FireBug;
	import com.realeyesmedia.debug.redbug.REDLogLevels;
	import com.realeyesmedia.debug.redbug.REDTransferManager;

	/** 
	 * RED_Logger - The RED_Logger class facilitates logging 
	 * communication from a client app to the REDbug console
	 * 
	 * @author   RealEyes Media  
	 * @version  1.0 
	 */	
	public class RED_Logger extends REDTransferManager
	{
		
		
		
		/**
		* debugObj - the debug object 
		*/		
		public var debugObj:Object;

		/**
		* debugObjXML - the debug object as XML 
		*/		
		public var debugObjXML:XML;

		/**
		* debugObjName - the debug object's name 
		*/		
		//public var debugObjName:String;
									
		/**
		* level - the debug level 
		*/							
		public var level:String;
		public var color:int = -1;
		public var bgColor:int = -1;
		
		//public var levelVO:RED_LoggerkVO;
		
		/**
		* msg - a debug string 
		*/		
		public var msg:String;

		/**
		* memUtilization - memory utilization 
		*/
		public var memUtilization:uint;
									
		/**
		* traceToTracePanel - determines a trace to the trace panel or not
		*/		
		public var traceToTracePanel:Boolean;
		
		/**
		* traceToFirebug - determines a trace to Firebug or not
		*/		
		public var traceToFirebug:Boolean;
		
				
		public static var levelsDict:Dictionary;

		/**
		* MODULE_ID - this is the module id used to determine the event name
		*/						
		public static const MODULE_ID:String = "RED_LoggerID";		

		/**
		 * Constructor 
		 * 
		 * @param p_level - Debug Log Level
		 * @param p_obj - Debug object
		 * @param p_msg - Debug message string
		 * @param p_traceMemUtil - Determines whether memory stats are sent
		 * @param p_traceToTracePanel - Sets the default on whether data is sent to the Trace Panel
		 * @param p_traceToFirebug - Sets the default on whether data is sent to Firebug
		 * @param p_traceToREDbug - Sets the default on whether data is sent to the REDbug Console
		 */
		public function RED_Logger(	p_level:String=REDLogLevels.LOG
									,p_msg:String=''
									,p_obj:Object=null
									,p_traceToTracePanel:Boolean=false
									,p_traceToFirebug:Boolean=false
									,p_silent:Boolean=false
								  )
		{	
			
			// Need to specify the moduleEvt
			super(MODULE_ID);	
			
			
			//if has not been initialized, add default level configs
			if(!levelsDict)
			{
				_initLevels();
			}
			
			
			// Update does the work...
			update(p_level, p_msg, p_obj, p_traceToTracePanel, p_traceToFirebug, p_silent);
		}
		
		
		private static function _initLevels():void
		{
			levelsDict = new Dictionary();
			setLevel( REDLogLevels.LOG, 0x000000, 0xFFFFFF );
			setLevel( REDLogLevels.DEBUG, 0x0099CC, 0xFFFFFF );
			setLevel( REDLogLevels.INFO, 0x66CC66, 0xFFFFFF );
			setLevel( REDLogLevels.WARN, 0xFF9900, 0xFFFFFF );
			setLevel( REDLogLevels.ERROR, 0xFF0000, 0xFFFFFF );
			setLevel( REDLogLevels.FATAL, 0xFFFFFF, 0xFF0000 );
			
		}
		
		
		/**
		 * Used to pre-process and send data 
		 * to the REDbug.send()  
		 * 
		 */		
		public function update(		p_level:String=REDLogLevels.LOG
									,p_msg:String=''
									,p_obj:Object=null
									,p_traceToTracePanel:Boolean=false
									,p_traceToFirebug:Boolean=false
									,p_silent:Boolean=false):REDTransferManager
		{
			//trace('In RED_Logger update()');
			
			// Update parent members
			super.updateBase();
			
			// Update members
			debugObj = p_obj;
			level = p_level;
			
			if(color < 0 || bgColor < 0)
			{
				
				var levelDataVO:RED_LoggerLevelVO = getLevel( level );
				
				color = levelDataVO.color.valueOf();
				bgColor = levelDataVO.bgColor;
				
			}
			/* 
			trace("-------");
			trace("level: " + level);
			trace("color: " + color);
			trace("bgColor: " + bgColor); */
			
			msg = p_msg;
			memUtilization = System.totalMemory;			
			traceToTracePanel = p_traceToTracePanel;
			traceToFirebug = p_traceToFirebug;
			silent = p_silent;
							
			return this;
		}
		
		/*  SHOULD NOT HANDLED IN SUPER*/
		//used to recast generic obj to class inst from LC console data
		override public function updateFromObj(p_obj:Object):void
		{
			
			
			// Update members
			redbugAppID = p_obj.redbugAppID;
			redbugSessionID = p_obj.redbugSessionID;
			debugObj = p_obj.debugObj;
			level = p_obj.level;
			color = p_obj.color;
			bgColor = p_obj.bgColor;
			msg = p_obj.msg;
			memUtilization = p_obj.memUtilization;
			traceToTracePanel = p_obj.traceToTracePanel;
			silent = p_obj.silent;
			
		}
		
		
		override public function execute():void
		{
			if( !level ) level = REDLogLevels.DEBUG;
			if(traceToTracePanel)
			{
				tracePanel();
			}
			
			if(traceToFirebug)
			{
				fireBugTrace();
			}
			
		}
		
		
		private function fireBugTrace():void
		{
			
			var fireBugLevel:String = level.toLowerCase(); 


			var levelsArray:Array = [ 
										"div",
										"count",
										"profileEnd",
										"profile",
										"time",
										"timeEnd",
										"group",
										"groupEnd",
										"dir",
										"assert",
										"error",
										"warn",
										"info",
										"debug",
										"log"];

			// change the level to 'log' if it isn't in the allowed list
			if( levelsArray.indexOf( fireBugLevel ) == -1 )
			{		
				fireBugLevel = "log";
			}
			
			if( debugObj == null ) 
			{
				RE_FireBug.getInstance()[fireBugLevel].apply( RE_FireBug.getInstance(), [ level.toUpperCase() + ": " + msg ] );
			}
			else
			{
				RE_FireBug.getInstance()[fireBugLevel].apply( RE_FireBug.getInstance(), [ level.toUpperCase() + ": " + msg, debugObj ] ); 
			}
			
		}
		
		private function tracePanel():void
		{
//			trace("[ --");
			var message:String = "";
			message += "\n" + level + ":";
			message += "\n  " + msg;
			message += ( debugObj != null ) ? "\n  " + debugObj : ""; 
			message += "\n";

			trace( message );
			
			//trace("MEMORY: " + memUtilization);
			
//			trace(ObjectUtil.toString(debugObj));
//			trace( debugObj );
//			trace("-- ]");
			
		}
		
		
		//------------------------
		
		/*
		public function get level():String
		{
			return _level;
		}
		
		public function set level( p_value:String ):void
		{
			_level = p_value;
			
			var levelDataVO:RED_LoggerLevelVO = getLevel( _level );
			
			color = levelDataVO.color.valueOf();
			bgColor = levelDataVO.bgColor;
		}
		*/
		
		public static function getLevel( p_level:String ):RED_LoggerLevelVO
		{
			var retLevelVO:RED_LoggerLevelVO = levelsDict[ p_level ];
			
			if(!retLevelVO)
			{
				
				retLevelVO = setLevel( p_level );
			}
			//trace("retLevelVO: " + retLevelVO.color);
			return retLevelVO;
		}
		
		public static function setLevel( p_level:String, p_color:int = 0x000000, p_bgColor:int = 0xFFFFFF):RED_LoggerLevelVO
		{
			//if has not been initialized, add default level configs
			if(!levelsDict)
			{
				_initLevels();
			}
			
			var retLevelVO:RED_LoggerLevelVO = new RED_LoggerLevelVO( p_level, p_color, p_bgColor );
			levelsDict[ p_level ] = retLevelVO;
			
			//trace("item p_level: " + p_level)
			//trace("item color: " + retLevelVO.color)
			//trace("item : " + levelsDict[ p_level ] )
			
			return retLevelVO;
		}
		
		
	}
}
