package com.factorylabs.orange.core.display.buttons
{	
	import com.factorylabs.orange.core.display.FSprite;
	import com.factorylabs.orange.core.display.buttons.styles.IButtonStyle;

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;

	//	import com.factorylabs.orange.core.display.buttons.events.ButtonEvent;	
	/**
	* ButtonBase is the base class that should be used for all
	* custom buttons.
	* 
	* <p>Override the default functions in subclasses to add custom behavior.
	* Store a DTO in the data property of the button.</p>
	* 
	* Copyright 2007 by Factory Design Labs, All Rights Reserved.
	* <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
	*
    * @authors Sean Dougherty, Justin Gitlin and Grant Davis
    * @version 1.0
    * @version 1.1 :: Added MOUSE_WHEEL handler and implementation function. Removed FButtonNewEvent.
    * @version 2.0 :: Completely reworked class so its no longer built for subclassing. Now relies on a compositional structure, where an IButtonStyle class object is used to perform drawing operations instead of the FButton object.
	*/
	public class FButtonNew 
		extends FSprite
	{
/*
 * Properties
**************************************************************************************************** */

		protected var _data : *;
		protected var _state : ButtonStateNew;		protected var _style : IButtonStyle;
		protected var _enabled : Boolean = true;
		protected var _selected : Boolean = false;
		protected var _highlighted : Boolean = false;
		protected var _currentSkin : DisplayObject;

		/*
 * Property Access
**************************************************************************************************** */

		/**
		 *	Gets the boolean flag for whether this button is selected, (<code>true</code>), or unselected (<code>false</code>).
		 *	@return Boolean which indicates selected (<code>true</code>), or unselected (<code>false</code>).
		 */
		public function get selected():Boolean { return _selected; }
		public function set selected( value:Boolean ):void
		{
			_selected = value;
			setButtonState();
		}
		
		
		/**
		 *	Gets the boolean flag for whether this button is enabled, (<code>true</code>), or unselected (<code>false</code>).
		 *	@return A Boolean which indicates if the button is currently selected (<code>true</code>), or unselected (<code>false</code>).
		 */
		public function get enabled():Boolean { return _enabled; }
		public function set enabled( value:Boolean ):void
		{
			if( value )
			{
				_enabled = true;
				this.useHandCursor = true;
				this.mouseEnabled = true;
				this.buttonMode = true;
				this.mouseEnabled = true;			}
			else
			{
				_enabled = false;
				this.useHandCursor = false;
				this.mouseEnabled = false;
				this.buttonMode = false;
				this.mouseEnabled = false;
			}
			setButtonState();
		}
		
		/**
		 * Indicates if the button is currently in a highlighted state. 
		 * @return	A boolean value indicating if this button is highlighted (<code>true</code>), or not (<code>false</code>).
		 */
		public function get highlighted() : Boolean { return _highlighted; }
		public function set highlighted( value : Boolean ) : void
		{
			_highlighted = value;
			setButtonState();
		}
		
		
		/**
		 * The untyped data object for this button.
		 * @return	An untyped data object.
		 */
		public function get data():* { return _data; }
		public function set data( value:* ):void
		{
			_data = value;
		}
		
		/**
		 * The IButtonStyle object that draws the visual assets for the button.
		 * @return	a reference to the IButtonStyle object that is currently associated with the button instance.
		 */
		public function get style() : IButtonStyle { return _style; }
		public function set style( value : IButtonStyle ) : void
		{
			_style = value;
			setButtonState();
		}
		
		/**
		 * The current state of the button.
		 * @return	a ButtonStateNew object representing the current state of the button.		 */
		public function get state() : ButtonStateNew
		{
			return _state;
		}
		
/*
 * Constructor
**************************************************************************************************** */
		
		/**
		 * Creates a new FButtonNew instance.
		 * @param style		Reference to a IButtonStyle class that will draw the visual assets for the button.
		 * @param holder	Reference to the DisplayObjectContainer object that will contain this button.
		 * @param init 		Object containting name/value pairs to automatically assign upon instantiation.
		 */
        public function FButtonNew( style : IButtonStyle, holder:DisplayObjectContainer=null, init:Object=null )
		{
			super( holder, init );

			_style = style;
			
			this.mouseChildren = false;
			this.mouseEnabled = true;
			this.buttonMode = true;
			
			addListeners();
			setButtonState();
		}
        
/*
 * Protected Methods
**************************************************************************************************** */		
		
		/**
		 * Adds listeners for this button to respond to. 
		 */
		protected function addListeners():void
		{
			addEventListener( MouseEvent.CLICK, handleInteraction );
			addEventListener( MouseEvent.MOUSE_DOWN, handleInteraction );
//			addEventListener( MouseEvent.MOUSE_MOVE, handleInteraction );
			addEventListener( MouseEvent.MOUSE_UP, handleInteraction );
			addEventListener( MouseEvent.MOUSE_OVER, handleInteraction );
			addEventListener( MouseEvent.MOUSE_OUT, handleInteraction );
			addEventListener( MouseEvent.ROLL_OVER, handleInteraction );
			addEventListener( MouseEvent.ROLL_OUT, handleInteraction );			addEventListener( MouseEvent.DOUBLE_CLICK, handleInteraction );//			addEventListener( MouseEvent.MOUSE_WHEEL, handleInteraction );
		}
		
		/**
		 * Determines the current state of the button based on the current values of highlighted, selected,
		 * and enabled.
		 */
		private function setButtonState() : void
		{
			if ( _enabled )
			{
				if ( _highlighted )	_state = ButtonStateNew.HIGHLIGHTED;
				else if ( _selected ) _state = ButtonStateNew.SELECTED;
				else _state = ButtonStateNew.NORMAL;
			}
			else _state = ButtonStateNew.DISABLED;
			
			// attach new skin
			setNewSkin( _style.getStyleForState( _state, this));
		}
		
		
		protected function setNewSkin( skin : DisplayObject ) : void
		{
			if ( skin != _currentSkin && skin != null )
			{
				var lastSkin : DisplayObject = _currentSkin;
					
				_currentSkin = skin;
				this.addChild( _currentSkin );
				
				// remove previous.
				if ( lastSkin )
					if ( this.contains( lastSkin )) this.removeChild( lastSkin );
			}
		}
	
/* Private Methods ......................................................................................*/
/* Event Handlers ......................................................................................*/

		private function handleInteraction( e : MouseEvent ):void
		{
			// attach new skin
			var skin : DisplayObject = _style.getStyleForMouseEvent( e, this );
			if ( skin ) setNewSkin( skin );
		}
	}
}