
package com.factorylabs.orange.performance.runners 
{
	import com.factorylabs.orange.performance.core.display.FSpritePerformanceTests;
	import com.factorylabs.orange.performance.core.display.fills.SolidFillPerformanceTests;
	import com.factorylabs.orange.performance.core.display.graphics.FRectanglePerformanceTests;
	import com.factorylabs.orange.performance.natives.ArrayPerformanceTests;
	import com.gskinner.performance.PerformanceTest;
	import com.gskinner.performance.XMLLog;

	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 * Runs gskinner's performance suite on the core project.
	 *
	 * <p><a target="_top" href="http://www.gskinner.com/blog/archives/2009/04/as3_performance.html">gskinner blog post</a>.</p>
	 * 
	 * <hr />
	 * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
	 * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
	 * 
	 * <p>Permission is hereby granted to use, modify, and distribute this file 
	 * in accordance with the terms of the license agreement accompanying it.</p>
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Jan 25, 2010
	 */
	public class FCorePerformanceTestRunner 
		extends MovieClip 
	{
		protected var _test		:PerformanceTest;
		protected var _status	:TextField;
		protected var _text		:TextField;
		protected var _txtLog	:FTextLog;
		protected var _xmlLog	:XMLLog;
		
		public function FCorePerformanceTestRunner()
		{			
			stop();
			if ( parent is Stage )
				initialize();
			else 
				addEventListener( Event.ADDED_TO_STAGE, onStageAdd );
		}
		
		protected function initialize() :void
		{
			addEventListener( Event.REMOVED_FROM_STAGE, onStageRemoval );
			setStageModes();
			startup();
		}
		
		protected function setStageModes() :void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
		}
		
		protected function startup() :void
		{
			buildGUI();
			buildLoggers();
			buildPerformanceTests();
			startTests();
		}
		
		protected function buildGUI() :void
		{
			_status = createTextField();
			_text = createTextField();
			addChild( _status );
			addChild( _text );
			_status.text = 'Player Version: ' + Capabilities.version + ' => ';
			stage.addEventListener( Event.RESIZE, resize );
			resize();
		}
		
		protected function buildLoggers() :void
		{
//			new TextLog( ).out = print;
			_txtLog = new FTextLog();
			_xmlLog = new XMLLog();
			_txtLog.out = print;
			_xmlLog.out = print;
		}
		
		protected function buildPerformanceTests() :void
		{
			_test = PerformanceTest.getInstance();
			_test.addEventListener( Event.COMPLETE, handleTestComplete );
			_test.addEventListener( Event.CLOSE, handleTestClose );
		}

		protected function startTests() :void
		{
			PerformanceTest.queue( new ArrayPerformanceTests() );
			PerformanceTest.queue( new FSpritePerformanceTests() );
			PerformanceTest.queue( new FRectanglePerformanceTests() );
			PerformanceTest.queue( new SolidFillPerformanceTests() );
		}
		
		protected function createTextField() :TextField
		{
			var format :TextFormat = new TextFormat();
			format.color = 0xFFFFFF;
			format.size = 12;
			format.font = 'Monaco, _typewriter';
			
			var txt :TextField = new TextField();
			txt.autoSize = TextFieldAutoSize.LEFT;
			txt.multiline = true;
			txt.wordWrap = true;
			txt.selectable = true;
			txt.width = 980;
			txt.background = true;
			txt.backgroundColor = 0x333333;
			txt.defaultTextFormat = format;
			return txt;
		}
		
		protected function print( $str :* ) :void
		{
			_text.appendText( $str );
			trace( $str );
		}
		
		protected function handleTestComplete( $e :Event ) :void 
		{
			_status.appendText( '.' );
			_text.y = _status.height;
		}
		
		protected function handleTestClose( $e :Event ) :void 
		{
			_test.removeEventListener( Event.COMPLETE, handleTestComplete );
			_test.removeEventListener( Event.CLOSE, handleTestClose );
			_status.appendText( ' All Performance Tests Complete!' );
		}
		
		private function resize( $e :Event = null ) :void
		{
			var sw :int = stage.stageWidth;
			var wv :int = (sw < 980 ) ? 980 : sw;
			_status.width = wv;
			_text.width = wv;
			_text.y = _status.height;
		}
		
		private function onStageAdd( $e :Event ) :void
		{
			removeEventListener( Event.ADDED_TO_STAGE, onStageAdd );
			initialize();
		}
		
		private function onStageRemoval( $e :Event ) :void
		{
			removeEventListener( Event.REMOVED_FROM_STAGE, onStageRemoval );
			stage.removeEventListener( Event.RESIZE, resize );
		}
	}
}