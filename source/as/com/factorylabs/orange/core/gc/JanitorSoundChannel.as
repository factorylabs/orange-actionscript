
package com.factorylabs.orange.core.gc
{
	import flash.media.SoundChannel;
	import flash.utils.Dictionary;

	/**
	 * The JanitorSoundChannel is used for garbage collection dealing with <code>SoundChannel</code> objects.
	 * 
	 * <p>The following people are credited with originating all or parts of this code:<br />
	 * Grant Skinner :: www.gskinner.com</p>
	 *
	 * <hr />
	 * <p>Copyright 2004-2009 by <a href="http://www.factorylabs.com/">Factory Design Labs</a></p>
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining
	 * a copy of this software and associated documentation files (the
	 * "Software"), to deal in the Software without restriction, including
	 * without limitation the rights to use, copy, modify, merge, publish,
	 * distribute, sublicense, and/or sell copies of the Software, and to
	 * permit persons to whom the Software is furnished to do so, subject to
	 * the following conditions:<br /><br />
	 *
	 * The above copyright notice and this permission notice shall be
	 * included in all copies or substantial portions of the Software.<br /><br />
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
	 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
	 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	 *
	 * @author		Matthew Kitt
	 * @version		1.0.0 :: Mar 6, 2009
	 */
	public class JanitorSoundChannel
		implements IJanitor
	{		
		private var _target				:Object;
		private var _soundChannels		:Dictionary;
		
		/**
		 * The <code>Dictionary</code> for storing <code>SoundChannels</code>.
		 */
		public function get soundChannels() :Dictionary { return _soundChannels; }
	
		/**
		 * Create an instance of a <code>JanitorSoundChannel</code>.
		 * @param $target	Target object hosting a <code>SoundChannel</code>.
		 */
		public function JanitorSoundChannel( $target :Object )
		{
			_target = $target;
		}

		/**
		 * @return	The string equivalent of this class.
		 */
		public function toString() :String 
		{
			return 'com.factorylabs.orange.core.gc.JanitorSoundChannel';
		}

		/**
		 * @inheritDoc
		 */
		public function cleanUp() :void
		{
			cleanUpSoundChannels();
		}
		
		/**
		 * Adds a <code>SoundChannel</code> to it's <code>Dictionary</code>.
		 * @param $soundChannel	the channel to add.
		 */
		public function addSoundChannel( $soundChannel :SoundChannel ) :void 
		{
			if( !_soundChannels ) _soundChannels = new Dictionary( true );
			_soundChannels[ $soundChannel ] = true;
		}
		
		/**
		 * Removes a <code>SoundChannel</code> from it's <code>Dictionary</code>.
		 * @param $soundChannel	the channel to remove.
		 */
		public function removeSoundChannel( $soundChannel :SoundChannel ) :void 
		{
			if( !_soundChannels ) return;
			delete( _soundChannels[ $soundChannel ] );
		}
		
		/**
		 * Cleans up all <code>SoundChannel</code>s in it's <code>Dictionary</code> by calling stop and removing them.
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