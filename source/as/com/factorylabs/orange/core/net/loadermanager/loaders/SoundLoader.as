package com.factorylabs.orange.core.net.loadermanager.loaders{	import flash.events.IEventDispatcher;	import flash.media.Sound;	import flash.media.SoundLoaderContext;	import flash.net.URLRequest;		/**	 * Wrapper for Sound objects which implements ILoader. 	 *  	 * <p>Copyright 2008 by Factory Design Labs, All Rights Reserved.</p> 	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a> 	 *  	 * @author		grantdavis 	 * @version		1.0.0 :: Aug 14, 2008 	 */	public class SoundLoader 		implements ILoader	{/* * PROPERTIES**************************************************************************************************** */				private static const DEFAULT_CONTEXT : SoundLoaderContext = new SoundLoaderContext( 1000, true );		private var _loader : Sound;/* * PROPERTY ACCESS**************************************************************************************************** */		/**		 * @inheritDoc		 */		public function get dispatcher():IEventDispatcher		{			return _loader;		}		/**		 * @inheritDoc		 */		public function get bytesLoaded():int		{			return _loader.bytesLoaded;		}		/**		 * @inheritDoc		 */		public function get bytesTotal():int		{			return _loader.bytesTotal;		}		/**		 * @inheritDoc		 */		public function get data() : *		{			return _loader;		}		/* * CONSTRUCTOR**************************************************************************************************** */				/**		 * 		 */		public function SoundLoader()		{			_loader = new Sound();		}				/**		 * @return 		 */		public function toString() : String 		{			return "com.factorylabs.orange.core.net.loadmanager.loaders.SoundLoader";		}/* * PUBLIC ACCESS**************************************************************************************************** */				/**		 * @inheritDoc		 */		public function open( request:URLRequest, context:*=null ):void		{			if ( context == null ) context = DEFAULT_CONTEXT;			_loader.load( request, context as SoundLoaderContext );		}				/**		 * @inheritDoc		 */		public function close():void		{			try{ _loader.close(); } 			catch( e:* ){};			_loader = new Sound();		}/* * INTERNAL ACCESS**************************************************************************************************** *//* * EVENT HANDLING**************************************************************************************************** */	}}