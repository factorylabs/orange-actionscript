package com.realeyesmedia.debug
{
	import flash.external.ExternalInterface;
	
	public class RE_FireBug
	{
		
		//-----------------------------------------------------------
		//DECLARATIONS
		//-----------------------------------------------------------
		
		private var enabled:Boolean = true;
		
		
		public static const LOG:String 			= "console.log";
		public static const DEBUG:String 		= "console.debug";
		public static const INFO:String 		= "console.info";
		public static const WARN:String 		= "console.warn";
		public static const ERROR:String 		= "console.error";
		public static const ASSERT:String 		= "console.assert";
		public static const DIR:String 			= "console.dir";
		public static const GROUP:String 		= "console.group";
		public static const GROUP_END:String 	= "console.groupEnd";
		public static const TIME:String 		= "console.time";
		public static const TIME_END:String 	= "console.timeEnd";
		public static const PROFILE:String 		= "console.profile";
		public static const PROFILE_END:String 	= "console.profileEnd";
		public static const COUNT:String 		= "console.count";
		
		public static const DIV:String 			= "console.log";
		
		
		static private var _instance:RE_FireBug;
		
		//-----------------------------------------------------------
		//CONSTRUCTOR
		//-----------------------------------------------------------
		
		public function RE_FireBug()
		{
			init();
		}
		
		
		
		//-----------------------------------------------------------
		//INIT METHODS
		//-----------------------------------------------------------
		
		private function init():void
		{
//			trace("init - RE_FireBug");
			
			
			
		}
		
		static public function getInstance():RE_FireBug
		{
			
			if(_instance == null)
			{
				_instance = new RE_FireBug();
			}
			return _instance;
		}
		
		//-----------------------------------------------------------
		//CONTROL METHODS
		//-----------------------------------------------------------
		
		public function enable():void
		{
			enabled = true;
		}
		
		public function disable():void
		{
			enabled = false;
		}
		
		
		//-----------------------------------------------------------
		
		public function execute(p_func:String, p_args:Array):void 
		{
			if(enabled && ExternalInterface.available )
			{
				ExternalInterface.call.apply(ExternalInterface, [p_func].concat(p_args));
			}
		}
		
		//-----------------------------------------------------------
		
		
		
		
		public function log(...args):void 
		 {
			execute(LOG, args);
		}
		
		public function debug(...args):void 
		{
			execute(DEBUG, args);
		}
		
		public function info(...args):void 
		{
			execute(INFO, args);
		}
		
		public function warn(...args):void 
		{
			execute(WARN, args);
		}
		
		public function error(...args):void 
		{
			execute(ERROR, args);
		}
		
		public function assert(p_expression:Boolean, ...args):void 
		{
			execute(ASSERT, [p_expression].concat(args));
		}
		
		
		public function dir(p_object:Object):void 
		{
			execute(DIR, [p_object]);
		}
		
		
		
		public function group(...args):void 
		{
			execute(GROUP, args);
		}
		
		public function groupEnd():void 
		{
			execute(GROUP_END, []);
		}
		
		
		
		public function time(p_name:String):void 
		{
			execute(TIME, [p_name]);
		}
		
		public function timeEnd(p_name:String):void 
		{
			execute(TIME_END, [p_name]);
		}
		
		
		
		public function profile(p_title:String):void 
		{
			execute(PROFILE, [p_title]);
		}
		
		public function profileEnd():void 
		{
			execute(PROFILE_END, []);
		}
		
		
		public function count(p_name:String=""):void 
		{
			execute(COUNT, [p_name]);
		}
		
		public function div():void
		{
			execute(DIV, ['--------------------------------------------------------------']);
		}
		
		//-----------------------------------------------------------
		//GETTER/SETTER METHODS
		//-----------------------------------------------------------
		
		
		
		
		//-----------------------------------------------------------
		//EVENTS
		//-----------------------------------------------------------
		
		
		
		//-----------------------------------------------------------
		//SETUP METHODS/EVENTS
		//-----------------------------------------------------------
		
		
		
	
	}
}


