--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Storage.AccessCache is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStorageItemMostRecentlyUsedList_add_ItemRemoved_Interface
      ; sender : Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList
      ; args : Windows.Storage.AccessCache.IItemRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList(sender), Windows.Storage.AccessCache.IItemRemovedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_FutureAccessList
   return Windows.Storage.AccessCache.IStorageItemAccessList is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.AccessCache.StorageApplicationPermissions");
      m_Factory     : IStorageApplicationPermissionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.AccessCache.IStorageItemAccessList;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageApplicationPermissionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FutureAccessList(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MostRecentlyUsedList
   return Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.AccessCache.StorageApplicationPermissions");
      m_Factory     : IStorageApplicationPermissionsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageApplicationPermissionsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MostRecentlyUsedList(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
