
package com.factorylabs.orange.unit.core.display
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertTrue;

  import asunit4.async.addAsync;

  import com.factorylabs.orange.core.display.FButton;
  import com.factorylabs.orange.unit.helpers.MockCanvas;
  import com.factorylabs.orange.unit.helpers.MockFButton;

  import org.osflash.signals.Signal;

  import flash.events.MouseEvent;

  /**
   * Generate the test cases for the FButton class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 8, 2010
   */
  public class FButtonTests
  {
    private var _button :MockFButton;
    private var _canvas :MockCanvas;

    [Before]
    public function runBeforeEachTest() :void
    {
      _canvas = new MockCanvas();
      _button = new MockFButton( _canvas );
    }

    [After]
    public function runAfterEachTest() :void
    {
      _canvas.remove( _button );
      _button.dispose();
      _button = null;
    }

    [Test]
    public function constructor() :void
    {
      assertTrue( '_button is FButton', _button is FButton );
    }

    [Test]
    public function should_have_defaults_set() :void
    {
      assertFalse( _button.mouseChildren );
      assertTrue( _button.mouseEnabled );
      assertTrue( _button.buttonMode );
      assertTrue( _button.useHandCursor );
    }

    [Test]
    public function should_have_defaults_overridden_by_init() :void
    {
      var btn :FButton = new MockFButton( null, {
                            mouseChildren: true,
                            mouseEnabled: false,
                            buttonMode: false,
                            useHandCursor: false } );
      assertTrue( btn.mouseChildren );
      assertFalse( btn.mouseEnabled );
      assertFalse( btn.buttonMode );
      assertFalse( btn.useHandCursor );
    }

    [Test]
    public function should_be_enabled() :void
    {
      _button.enabled = true;
      assertTrue( _button.enabled );
      assertTrue( _button.mouseEnabled );
      assertTrue( _button.buttonMode );
      assertTrue( _button.useHandCursor );
    }

    [Test]
    public function should_not_be_enabled() :void
    {
      _button.enabled = false;
      assertFalse( _button.enabled );
      assertFalse( _button.mouseEnabled );
      assertFalse( _button.buttonMode );
      assertFalse( _button.useHandCursor );
    }

    [Test]
    public function should_be_selected() :void
    {
      _button.selected = true;
      assertTrue( _button.selected );
    }

    [Test]
    public function should_not_be_selected() :void
    {
      _button.selected = false;
      assertFalse( _button.selected );
    }

    [Test]
    public function should_be_highlighted() :void
    {
      _button.highlighted = true;
      assertTrue( _button.highlighted );
    }

    [Test]
    public function should_not_be_highlighted() :void
    {
      _button.selected = false;
      assertFalse( _button.highlighted );
    }

    [Test]
    public function should_have_click_signal() :void
    {
      assertTrue( '_button.click is Signal', _button.click is Signal );
    }

    [Test]
    public function should_have_one_signal_listener() :void
    {
      _button.click.add( onClick );
      assertEquals( _button.click.numListeners, 1 );
    }


    [Test]
    public function should_have_mouse_event_listener_for_click() :void
    {
      assertTrue( _button.hasEventListener( MouseEvent.CLICK ) );
    }

    [Test]
    public function should_capture_the_click_signal() :void
    {
      _button.click.add( addAsync( onClick, 10 ) );
      _button.click.dispatch( new MouseEvent( MouseEvent.CLICK ) );
    }

    protected function onClick( $e :MouseEvent ) :void
    {
      assertEquals( $e.type, MouseEvent.CLICK );
    }
  }
}

