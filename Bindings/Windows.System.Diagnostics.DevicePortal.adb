--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Web.Http;
with Windows.ApplicationModel.AppService;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.Diagnostics.DevicePortal is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IDevicePortalConnection_add_Closed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDevicePortalConnection_add_Closed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IDevicePortalConnection_add_Closed_Interface
      ; sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
      ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection(sender), Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDevicePortalConnection_add_RequestReceived or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface
      ; sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
      ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection(sender), Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs(args));
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
   
   
   function GetForAppServiceConnection
   (
      appServiceConnection : Windows.ApplicationModel.AppService.IAppServiceConnection
   )
   return Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Diagnostics.DevicePortal.DevicePortalConnection");
      m_Factory     : IDevicePortalConnectionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDevicePortalConnectionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForAppServiceConnection(appServiceConnection, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
