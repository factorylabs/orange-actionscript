package com.factorylabs.orange.core.net 
{	/**	 * @author Ryan Boyajian	 */	public interface IParserDTO 
		extends IParser
	{
		function setData( data:XMLList ):void;
		function getData():*;	}}