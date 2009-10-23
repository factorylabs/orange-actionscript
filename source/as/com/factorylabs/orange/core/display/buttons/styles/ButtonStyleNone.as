package com.factorylabs.orange.core.display.buttons.styles{	import com.factorylabs.orange.core.display.buttons.ButtonStateNew;	import com.factorylabs.orange.core.display.buttons.FButtonNew;	import com.factorylabs.orange.core.display.buttons.styles.IButtonStyle;	import flash.display.DisplayObject;	import flash.events.MouseEvent;	/**	 * Summary 	 *  	 * <p>Description</p> 	 *  	 * <p>Copyright 2009 by Factory Design Labs, All Rights Reserved.</p> 	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a> 	 *  	 * @author		grantdavis 	 * @version		1.0.0 :: Oct 9, 2009 	 */	public class ButtonStyleNone 		implements IButtonStyle	{/* * PROPERTIES**************************************************************************************************** *//* * PROPERTY ACCESS**************************************************************************************************** *//* * CONSTRUCTOR**************************************************************************************************** */				public function toString() : String 		{			return "com.client.sitename.components.controls.mediaplayer.view.controls.ButtonStyleNone";		}/* * PUBLIC ACCESS**************************************************************************************************** */		/**		 * @return The display object to be used for the specified button state.		 */		public function getStyleForState( state : ButtonStateNew, button : FButtonNew ) : DisplayObject		{			return null;		}				/**		 * @return The display object to be used for the specified button interaction.		 */		public function getStyleForMouseEvent( event : MouseEvent, button : FButtonNew ) : DisplayObject		{			return null;		}/* * INTERNAL ACCESS**************************************************************************************************** *//* * EVENT HANDLING**************************************************************************************************** */	}}