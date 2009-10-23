/**
* Description here..
* @author Default
* @version 0.1
*/

package com.factorylabs.orange.core.formatters 
{

	public class TimeFormat 
	{
		private var _time:int;
		
		public function get milliseconds():int
		{
			return _time;
		}
		
		public function get seconds():int
		{
			return _time/1000;
		}
		
		public function get minutes():int
		{
			return seconds/60;
		}
		
		public function get hours():int
		{
			return minutes/60;
		}
		
		public function TimeFormat(milliseconds:int)
		{
			_time = milliseconds;
		}
		
		public function setMilliseconds(milliseconds:int):void
		{
			_time = milliseconds;
		}
		
		public function setSeconds(seconds:Number):void
		{
			_time = seconds*1000;
		}
		
		public function setMinutes(minutes:Number):void
		{
			_time = minutes*1000*60;
		}
		
		public function setHours(hours:Number):void
		{
			_time = hours*1000*60*60;
		}
		
		public function hasElapsed(startTime:Date):Boolean
		{
			var elapsed:int = (new Date()).getTime() - startTime.getTime();
			return elapsed > milliseconds;
		}
	}
	
}
