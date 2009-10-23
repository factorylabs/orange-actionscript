package com.factorylabs.orange.core.display
{
	import com.factorylabs.orange.core.errors.IllegalDisplayInitParamError;
	import com.factorylabs.orange.core.logger.Log;
	import com.factorylabs.orange.core.text.FStyleManager;
	
	import flash.display.DisplayObjectContainer;
	import flash.text.StyleSheet;
	import flash.text.TextField;	

	/**
	* FTextField is a customized version of TextField.
	* 
	* <p><code>FTextField</code> inheritley performs some of the more mundane tasks for setting up and
	* using TextFields in the application. <code>FTextField</code> works similar to <code>FSprite</code> and <code>FMovieClip</code> in its
	* instantiation, and has time-saving actions such as wrapping span tags around text when setting the TextField value.</p>
	* 
    * @author Sean Dougherty
    * @version 1.0
	*/
	public class FTextField
		extends TextField
	{
    
/* Properties ......................................................................................*/
		
		private var _span:String;
		
		
/* Constructor ......................................................................................*/
		
        public function FTextField( holder:DisplayObjectContainer = null, init:Object = null )
		{
			super();
			
			selectable = false;
			embedFonts = true;
			// disable tabbing by default - pass it in via the init Object if you want it enabled on creation
			tabEnabled = false;
			
			// add to display object if the holder is not null
			if( holder != null ) holder.addChild( this );
			
			// if an init object is passed in, initalize the TextField
			if( init != null ) initTextField( init );
		}
        
/* Public Methods .....................................................................................*/
		
		/**
		* @return	the string equivalent of this class. 
		*/
		public override function toString():String
		{
			return "[ com.factorylabs.orange.core.display.FTextField ]";
		}
		
		/**
		 * Removes this object from its parent container.
		 */
		public function remove():void
		{
			if ( this.parent ) 
				this.parent.removeChild( this );
		}
		
/* Protected Methods ......................................................................................*/

		/**
		 * Maps all the init object's properties to this TextField.
		 * If there are properties that do not exist in the Sprite base class, an error is thrown. 
		 * 
		 * @param init	Object to map properties from. 
		 */
		protected function initTextField( init:Object ):void
		{
			for( var it:String in init )
			{
				if( this.hasOwnProperty( it ) ) this[ it ] = init[ it ];
				else
				{
					Log.error( "[FTextField] initTextField()", "{ " + it + ":" + init[ it ] + " }" );
					throw new IllegalDisplayInitParamError( "An invalid property assignment was attempted on " + this.toString() );
				}
			}
		}
		
/* Getters/Setters ......................................................................................*/
		
		/**
		 * Sets the multiline and wordwrap properties with one property.
		 * 
		 * <p><b>NOTE: </b>You set wordWrap after setting <code>FTextField.multiline</code> in the case
		 * where you want to have multiilne set to false, and wordWrap as true.</p>
		 */
		public override function set multiline( value:Boolean ):void
		{
			super.wordWrap = value;
			super.multiline = value;
		}
		
		/**
		 * @return The StyleSheet associated with this TextField.
		 */
		public function get css():StyleSheet
		{
			return this.styleSheet;
		}
		
		/**
		 * @private
		 */
		public function set css( sheet:StyleSheet ):void
		{
			this.styleSheet = sheet;
		}
		
		/**
		 * Sets the span. Used by the <code>FTextField.label</code> property if it is set.
		 * @see #label
		 */
		public function get span():String
		{
			return _span;
		}
		
		/**
		 * @private
		 */
		public function set span( value:String ):void
		{
			if( this.styleSheet == null ) this.styleSheet = FStyleManager.instance.primarycss;
			_span = value;
		}
		
		/**
		 * Sets the label. Wraps it in a span if <code>FTextField.span</code> has been set.
		 * @param value	String value to display in the TextField.
		 * @see #span
		 */
		public function set label( value:String ):void
		{
			if( _span ) htmlText = "<span class='" + _span + "'>" + value + "</span>";
			else htmlText = value;
		}
	}
}
