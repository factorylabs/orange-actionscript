
package com.factorylabs.orange.unit.core.net
{
  import asunit.asserts.assertEquals;
  import asunit.asserts.assertFalse;
  import asunit.asserts.assertNotNull;
  import asunit.asserts.assertNull;
  import asunit.asserts.assertTrue;

  import com.factorylabs.orange.core.net.Storage;

  import flash.net.SharedObject;

  /**
   * Generate the test cases for the Storage class.
   *
   * <hr />
   * <p><a target="_top" href="http://github.com/factorylabs/orange-actionscript/MIT-LICENSE.txt">MIT LICENSE</a></p>
   * <p>Copyright (c) 2004-2010 <a target="_top" href="http://www.factorylabs.com/">Factory Design Labs</a></p>
   *
   * <p>Permission is hereby granted to use, modify, and distribute this file
   * in accordance with the terms of the license agreement accompanying it.</p>
   *
   * @author    Matthew Kitt
   * @version   1.0.0 :: Feb 9, 2010
   */
  public class StorageTests
  {
    private var _storage  :Storage;

    [Before]
    public function runBeforeEachTest() :void
    {
      _storage = new Storage();
    }

    [After]
    public function runAfterEachTest() :void
    {
      _storage = null;
    }

    [Test]
    public function constructor() :void
    {
      assertTrue( '_storage is Storage', _storage is Storage );
    }

    [Test]
    public function should_have_default_namespace() :void
    {
      assertEquals( 'default.name', _storage.name );
    }

    [Test]
    public function should_have_default_localPath() :void
    {
      assertNull( _storage.localPath );
    }

    [Test]
    public function should_have_default_secure() :void
    {
      assertFalse( _storage.secure );
    }

    [Test]
    public function should_set_and_get_namespace() :void
    {
      _storage.name = 'some.name';
      assertEquals( 'some.name', _storage.name );
    }

    [Test]
    public function should_set_and_get_localPath() :void
    {
      _storage.localPath = 'some kind of local path';
      assertEquals( 'some kind of local path', _storage.localPath );
    }

    [Test]
    public function should_set_and_get_secure() :void
    {
      _storage.secure = true;
      assertTrue( '_storage.secure is true', _storage.secure );
    }

    [Test]
    public function should_have_shared_object() :void
    {
      assertTrue( '_storage.lso is SharedObject', _storage.lso is SharedObject );
    }

    [Test]
    public function should_save_and_retrieve_property() :void
    {
      _storage.save( 'id', 'shared_obj_id' );
      assertEquals( 'shared_obj_id', _storage.retrieve('id') );
    }

    [Test]
    public function should_erase_property() :void
    {
      _storage.save( 'id', 'shared_obj_id' );
      _storage.erase( 'id' );
      assertNull( _storage.retrieve('id') );
    }

    [Test]
    public function should_clear_shared_object() :void
    {
      _storage.save( 'id1', 'shared_obj_id1' );
      _storage.save( 'id2', 'shared_obj_id2' );
      _storage.save( 'id3', 'shared_obj_id3' );
      _storage.save( 'id4', 'shared_obj_id4' );
      _storage.clear();
      assertNull( _storage.retrieve('id1') );
      assertNull( _storage.retrieve('id2') );
      assertNull( _storage.retrieve('id3') );
      assertNull( _storage.retrieve('id4') );
    }
  }
}

