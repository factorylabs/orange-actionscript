package com.factorylabs.orange.core.display.graphics.fills {	import flash.display.Graphics;		import com.factorylabs.orange.core.display.graphics.IGraphic;		import com.factorylabs.orange.core.display.graphics.fills.AbstractSolid;	/**	 * SolidFill applies properties for rendering a color within a Graphic.	 * 	 * For a description of the built in <code>Graphics.beginFill()</code> method see <code><a href="http://livedocs.adobe.com/flash/9.0/ActionScriptLangRefV3/flash/display/Graphics.html#beginFill()">beginFill</a></code>.	 * 	 * <p>Copyright 2008 by Factory Design Labs, All Rights Reserved.</p>	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Jun 2, 2008	 */	public class SolidFill		extends AbstractSolid	{		/* Constructor .....................................................................................*/					/**		 * Constructs a new solid fill.		 * @param vColor	A hexadecimal color value of the fill.		 * @param vAlpha	A number that indicates the alpha value of the color of the fill; valid values are 0 to 1.		 * 		 * @example The following code creates a grey solid fill with 80% opacity. 	 	 * <listing version="3.0" >	 	 * var sf : SolidFill = new SolidFill( 0x666666, .8 );	 	 * </listing>		 */		public function SolidFill( vColor : uint = 0xff00ff, vAlpha : Number = 1 )		{			super( vColor, vAlpha );		}		/* Public Methods ..................................................................................*/						/**		 * @inheritDoc		 */		override public function toString() : String 		{			return "com.factorylabs.orange.core.display.graphics.fills.SolidFill";		}				/**		 * @inheritDoc		 */		override public function beginFill( gfx : Graphics, fgfx : IGraphic ) : void		{			gfx.beginFill( _color, _alpha );			fgfx = null;		}				/**		 * @inheritDoc		 */		override public function endFill( gfx : Graphics ) : void		{			gfx.endFill();		}	}}