package com.factorylabs.orange.core.gc
{
	import flash.media.SoundChannel;
	import flash.utils.Dictionary;

	/**
	 * The janitor is used for garbage collection dealing with SoundChannel objects.
 	 * 
 	 * <p>Janitor has methods within it to add and remove various objects that need to be removed from memory. There is also a one off clean method to collect everything.</p>
 	 * 
 	 *  <p>The following people are credited with originating all or parts of this code:
	 *	Grant Skinner :: www.gskinner.com
 	 * 
 	 * <p>Copyright 2004-2009 by Factory Design Labs</p>
     * 
     * Permission is hereby granted, free of charge, to any person obtaining
     * a copy of this software and associated documentation files (the
     * "Software"), to deal in the Software without restriction, including
     * without limitation the rights to use, copy, modify, merge, publish,
     * distribute, sublicense, and/or sell copies of the Software, and to
     * permit persons to whom the Software is furnished to do so, subject to
     * the following conditions:
     * 
     * The above copyright notice and this permission notice shall be
     * included in all copies or substantial portions of the Software.
     * 
     * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
     * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
     * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
     * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
     * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
     * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
     * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 	 * <a href="http://www.factorylabs.com/">www.factorylabs.com</a>
 	 * 
 	 * @author		Matthew Kitt
 	 * @version		1.0.0 :: Mar 6, 2009
 	 */
	public class JanitorSoundChannel
		implements IJanitor
	{
/*
 * PROPERTIES
**************************************************************************************************** */
		
		/**
		 * The object that instantiated this Janitor instance.
		 */
		private var _target				:Object;
		
		/**
		 * Dictionary for storing sound channels.
		 */
		private var _soundChannels		:Dictionary;
		
		/**
		 * @private
		 */
		public function get soundChannels() :Dictionary { return _soundChannels; }
/*
 * CONSTRUCTOR
**************************************************************************************************** */
	
		/**
		 * Create an instance of a Janitor and add it to the JanitorManager for cleanup.
		 * @param target	who needs cleaning.
		 */
		public function JanitorSoundChannel( target :Object )
		{
			_target = target;
		}

		/**
		 * @return	string equivalent of this class.
		 */
		public function toString() :String 
		{
			return 'com.factorylabs.orange.core.gc.JanitorSoundChannel';
		}

		/**
		 * Clean the sound channels and itself out of the manager.
		 */
		public function cleanUp() :void
		{
			cleanUpSoundChannels();
		}
		
		/**
		 * Adds a SoundChannel to it's Dictionary.
		 * @param soundChannel	the channel to add.
		 */
		public function addSoundChannel( soundChannel :SoundChannel ) :void 
		{
			if( !_soundChannels ) _soundChannels = new Dictionary( true );
			_soundChannels[ soundChannel ] = true;
		}
		
		/**
		 * Removes a SoundChannel from it's Dictionary.
		 * @param soundChannel	the channel to remove.
		 */
		public function removeSoundChannel( soundChannel :SoundChannel ) :void 
		{
			if( !_soundChannels ) return;
			delete( _soundChannels[ soundChannel ] );
		}
		
		/**
		 * Cleans up all SoundChannels in it's Dictionary by calling stop on them.
		 */
		public function cleanUpSoundChannels() :void 
		{
			for( var soundChannel :Object in _soundChannels )
			{
				var sc :SoundChannel = SoundChannel( soundChannel ); 
				sc.stop();
				removeSoundChannel( sc );
			}
		}
	}
}