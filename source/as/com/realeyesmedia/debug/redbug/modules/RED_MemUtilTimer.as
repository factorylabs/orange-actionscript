////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2007 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyesmedia.debug.redbug.modules
{
	import com.realeyesmedia.debug.redbug.REDbug;
	import flash.events.TimerEvent;
	import flash.system.System;
	import flash.utils.Timer;
	
	/** 
	 * RED_MemUtilTimer - A timer wrapper to facilitate memory stats polling
	 *  
	 * @author   RealEyes Media  
	 * @version  1.0 
	 */
	public class RED_MemUtilTimer
	{
		/**
		* @private 
		*/		
		private static var secondsBetweenPolls:int;

		/**
		* @private 
		*/				
		private static var totalIterations:int;

		/**
		* @private 
		*/		
		private static var currentIteration:int;

		/**
		* @private 
		*/		
		private static var timeSinceTimerStart:int;

		/**
		* @private 
		*/		
		private static var debugMemoryStats:Number;

		/**
		* @private 
		*/		
		private static var debugSetting:String;
		
		/**
		* @private 
		*/		
		private static var myTimer:Timer;		
		
		
		/**
		* DEBUG_SETTING_OFF - Send the true memory utilization data (DEFAULT)
		*/		
		public static const DEBUG_SETTING_OFF:String = "TRUE";
		
		/**
		* DEBUG_SETTING_RANDOMIZE - Debug setting - randomize the memory utilization data
		*/		
		public static const DEBUG_SETTING_RANDOMIZE:String = "RANDOM";
		
		/**
		* DEBUG_SETTING_INCREMENT - Debug setting - increment the memory utilization data 
		*/		
		public static const DEBUG_SETTING_INCREMENT:String = "INCREMENT";
		
		/**
		* DEBUG_SETTING_DECREMENT - Debug setting - decrement the memory utilization data 
		*/		
		public static const DEBUG_SETTING_DECREMENT:String = "DECREMENT";
		
		/**
		 * Constructor
		 * 
		 * We don't want to instantiate this class 
		 * 
		 */		
		public function RED_MemUtilTimer()
		{
			// Only static
			throw new Error('RED_MemUtilTimer should only be used as a static');
		}
		
		/**
		 * initTimer - start the timer
		 * 
		 * @param p_secondsBetweenPolls - number of seconds between each poll
		 * @param p_iterations - number of polls requested (leave blank for infinite)
		 * 
		 */			
		public static function startTimer(p_secondsBetweenPolls:int,p_iterations:int=0,p_debugSetting:String=DEBUG_SETTING_OFF):void 
		{	
			// First, stop any remnant timers...
			if(myTimer != null)
				stopTimer();
				
			// Init the totalIterations(If 0 it's infinite)
			totalIterations = p_iterations;
		
			// Init the currentIteration
			currentIteration = 0;
			
			// Init seconds between polls
			secondsBetweenPolls = p_secondsBetweenPolls;

			// Init the debug level
			debugSetting = p_debugSetting;
			
			// Init debug memory stats
			debugMemoryStats = System.totalMemory;

			// Convert seconds to milliseconds
			var milliseconds:Number = p_secondsBetweenPolls * 1000;
			
			// The first parameter is the interval (in milliseconds). The
			// second parameter is number of times to run (0 means infinity).
			myTimer = new Timer(milliseconds, totalIterations);
			
			myTimer.addEventListener("timer", timerHandler,false,0,true);
			
			myTimer.start();
		}
		
		/**
		 *	stopTimer - stop the timer 
		 * 
		 */		
		public static function stopTimer():void
		{
			myTimer.stop();
		}		
		
		/**
		 * timerHandler - timer event handler
		 * 
		 * @param event
		 * 
		 */			
		private static function timerHandler(event:TimerEvent):void 
		{
			// Increment the currentIteration
			currentIteration = currentIteration + 1;
			
			// Set the timeSinceTimerStart
			timeSinceTimerStart = currentIteration * secondsBetweenPolls;
			
			var transferMemUtilData:RED_MemUtil = new RED_MemUtil('Memory Stat',timeSinceTimerStart);
			
			// If we're in debug Mode, doctor the data sent
			if(debugSetting != DEBUG_SETTING_OFF)
			{	
							
				switch(debugSetting)
				{
					// A completely random number...
					case DEBUG_SETTING_RANDOMIZE:
						debugMemoryStats = Number(System.totalMemory) + (Math.random() * 10000000);
						break;
					// We'll increment the memory 128KB each time	
					case DEBUG_SETTING_INCREMENT:
						debugMemoryStats = debugMemoryStats + 128000;
						break;
					// We'll decrement the memory 128KB each time							
					case DEBUG_SETTING_DECREMENT:
						debugMemoryStats = debugMemoryStats - 128000;
						if(debugMemoryStats < 0)
							debugMemoryStats = 0;
						break;													
				}
				transferMemUtilData.memUtilization = new uint(debugMemoryStats);	
			}
						
			// Send data to REDbug
			REDbug.send(transferMemUtilData);			
			
			// Clear the event obj
			event = null;
		}			
					
	}
}