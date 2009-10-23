package com.factorylabs.orange.core.display.buttons
{
	
	/**
 	 * Provides static constant variables to specify button states.
 	 * 
 	 * Copyright 2008 by Factory Design Labs, All Rights Reserved.
 	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
 	 * 
 	 * @author		Sean Dougherty, Grant Davis
 	 * @version		1.0.0 :: May 9, 2008
 	 * @version 	1.1.0 :: Oct 6, 2009 - Reworked class to only have four main states: highlighted, selected, normal, and disabled. 
 	 */
	public class ButtonStateNew 
	{
/* Properties ......................................................................................*/

		public static const SELECTED				:ButtonStateNew = new ButtonStateNew(ButtonStateNew.SELECTED_VALUE);		public static const NORMAL					:ButtonStateNew = new ButtonStateNew(ButtonStateNew.NORMAL_VALUE);
		public static const HIGHLIGHTED				:ButtonStateNew = new ButtonStateNew(ButtonStateNew.HIGHLIGHTED_VALUE);
		public static const DISABLED				:ButtonStateNew = new ButtonStateNew(ButtonStateNew.DISABLED_VALUE);
		
		private static const SELECTED_VALUE			:String = "ButtonStateNew.selected";
		private static const NORMAL_VALUE			:String = "ButtonStateNew.normal";
		private static const HIGHLIGHTED_VALUE		:String = "ButtonStateNew.highlighted";
		private static const DISABLED_VALUE			:String = "ButtonStateNew.disabled";
		private var _state : String;
		
/* Constructor ......................................................................................*/
		
		public function ButtonStateNew( state : String ) : void
		{
			_state = state;
		}

/* Public Methods .....................................................................................*/
		
		public function toString():String
		{
			return _state;//			return "com.factorylabs.orange.core.display.buttons.ButtonStateNew";		}
	}
}