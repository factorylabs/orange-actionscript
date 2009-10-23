package com.akamai.utilities
{
	/**
	 *  The DateUtil utility class is an all-static class with methods for
	 *  working with Date objects.
	 *  You do not create instances of DateUtil;
	 *  instead you call methods such as 
	 *  the <code>DateUtil.compare()</code> method.  
	 */
	public class DateUtil
	{
	    /**
	     *  Compares two dates.
	     *
	     *  @param d1 The first date to compare. 
	     *
	     *  @param d2 The second date to compare.
	     *
	     *  @return -1 if the first date is earlier than the second. 0 if the dates are equal. 1 if the first date is later than the second.
	     */
	     public static function compare(d1:Date, d2:Date) : Number {
	     	var d1Ts:Number = d1.getTime();
	     	var d2Ts:Number = d2.getTime();
	     	
	     	var result:Number = -1;
	     	
	     	if (d1Ts == d2Ts)
	     		result = 0;
	     	else if (d1Ts > d2Ts)
	     		result = 1;
	     		
	     	return result;
	     }

	}
}