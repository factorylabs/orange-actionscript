package com.factorylabs.orange.core.display.buttons.styles
{
	import com.factorylabs.orange.core.display.buttons.ButtonStateNew;
	import com.factorylabs.orange.core.display.buttons.FButtonNew;

	import flash.display.DisplayObject;
	import flash.events.MouseEvent;

	/**
	 * @author grantdavis
	 */
	public interface IButtonStyle 
	{
		/**
		 * @return The display object to be used for the specified button state.
		 */
		function getStyleForState( state : ButtonStateNew, button : FButtonNew ) : DisplayObject;
		
		/**
		 * @return The display object to be used for the specified button interaction.
		 */
		function getStyleForMouseEvent( event : MouseEvent, button : FButtonNew ) : DisplayObject;
		
		/* First revision.
		function setHighlighted( button : FButtonNew ) : void;
		function setSelected( button : FButtonNew ):void;
		function setNormal( button : FButtonNew ):void;
		function setDisabled( button : FButtonNew ):void;
		function click( button : FButtonNew ):void;
		function mouseDown( button : FButtonNew ):void;
		function mouseUp( button : FButtonNew ):void;
		function mouseOver( button : FButtonNew ):void;
		function mouseOut( button : FButtonNew ):void;
		function rollOver( button : FButtonNew ):void;
		function rollOut( button : FButtonNew ):void;
		function doubleClick( button : FButtonNew ):void;
		function mouseMove( button : FButtonNew ):void;
		function mouseWheel( button : FButtonNew ) : void;
		*/
	}
}
