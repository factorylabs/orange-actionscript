package com.factorylabs.orange.core.display.graphics.fills {	import com.factorylabs.orange.core.display.graphics.IGraphic;	import com.factorylabs.orange.core.display.graphics.fills.IFill;		import flash.display.Graphics;	import flash.geom.Matrix;		/**	 * GradientStroke applies properties for rendering a gradient stroke on a Graphic.	 * 	 * For a description of the built in <code>Graphics.lineGradientStyle()</code> method see <code><a href="http://livedocs.adobe.com/flash/9.0/ActionScriptLangRefV3/flash/display/Graphics.html#lineGradientStyle()">lineGradientStyle</a></code>.	 * 	 * <p>Copyright 2008 by Factory Design Labs, All Rights Reserved.</p>	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>	 *	 * @author		Matthew Kitt	 * @version		1.0.0 :: Jun 2, 2008	 */	public class GradientStroke		implements IFill 	{		/* Properties ......................................................................................*/				protected var _gradientFill : GradientFill;		protected var _solidStroke : SolidStroke;		/* Getters/Setters .................................................................................*/				/**		 * @return	the strokes gradient fill properties.		 */		public function get gradientFill() : GradientFill		{			return _gradientFill;		}				public function set gradientFill( vGradientFill : GradientFill ) : void		{			_gradientFill = vGradientFill;		}				/**		 * @return	the gradient strokes, line style properties.		 */		public function get solidStroke() : SolidStroke		{			return _solidStroke;		}				public function set solidStroke( vSolidStroke : SolidStroke ) : void		{			_solidStroke = vSolidStroke;		}/* Constructor .....................................................................................*/				/**		 * Constructs a new GradientStroke.		 * @param vGradientFill		@see GradientFill		 * @param vSolidStroke		@see SolidStroke		 * 		 * @example The following code creates a gradient line.	 	 * <listing version="3.0" >	 	 * var gf : GradientFill = new GradientFill( 0, [ 0xffffff, 0x333333 ] );	 	 * var ss : SolidStroke = new SolidStroke( 0xcccccc, 1, 3, true );	 	 * var gs : GradientStroke = new GradientStroke( gf, ss );	 	 * </listing>		 */		public function GradientStroke( vGradientFill : GradientFill, vSolidStroke : SolidStroke ) 		{			_gradientFill = vGradientFill;			_solidStroke = vSolidStroke;		}/* Public Methods ..................................................................................*/				/**		 * @return	the string equivalent of this class.		 */		public function toString() : String 		{			return "com.factorylabs.orange.core.display.graphics.fills.GradientStroke";		}				/**		 * @inheritDoc		 */		public function beginFill( gfx : Graphics, fgfx : IGraphic ) : void		{			var matrix : Matrix = new Matrix();			matrix.createGradientBox( fgfx.width, fgfx.height, degreesToRadians( _gradientFill.rotation ), fgfx.x, fgfx.y );			_solidStroke.beginFill( gfx, fgfx );			gfx.lineGradientStyle( _gradientFill.type, _gradientFill.colors, _gradientFill.alphas, _gradientFill.ratios, matrix, _gradientFill.spreadMethod, _gradientFill.interpolationMethod, _gradientFill.focalPointRatio);		}				/**		 * @inheritDoc		 */		public function endFill( gfx : Graphics ) : void		{			gfx.moveTo( 0, 0 );		}				/**		 *	Convert a number from Degrees to Radians.		 *	@param	d		degrees (45°, 90°)		 *	@return 		radians (3.14..., 1.57...)		 * 	@use			{@code var vRadians:Number = MathUtil.degreesToRadians( 180 );}		 */		private function degreesToRadians( d:Number ):Number 		{			return d * ( Math.PI / 180 );		}	}}