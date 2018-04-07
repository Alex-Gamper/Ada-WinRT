--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.0                                                     --
--                                                                            --
--    This program is free software: you can redistribute it and / or modify  --
--    it under the terms of the GNU General Public License as published by    --
--    the Free Software Foundation, either version 3 of the License, or       --
--    (at your option) any later version.                                     --
--                                                                            --
--    This program is distributed in the hope that it will be useful,         --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of          --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           --
--    GNU General Public License for more details.                            --
--                                                                            --
--    You should have received a copy of the GNU General Public License       --
--    along with this program.If not, see < http://www.gnu.org/licenses/>.    --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.Networking;
with Windows.Networking.Sockets;
with Windows.Devices.Enumeration;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.WiFiDirect.Services is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
      ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser(sender), Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
      ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser(sender), Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IWiFiDirectServiceSession_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IWiFiDirectServiceSession or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IWiFiDirectServiceSession_Interface
      ; asyncInfo : Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceSession
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IWiFiDirectService_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IWiFiDirectService or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IWiFiDirectService_Interface
      ; asyncInfo : Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectService
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IWiFiDirectService_add_SessionDeferred_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IWiFiDirectService_add_SessionDeferred or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IWiFiDirectService_add_SessionDeferred_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectService
      ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.WiFiDirect.Services.IWiFiDirectService(sender), Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo_Interface
      ; asyncInfo : Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceProvisioningInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
      ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession(sender), Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateWiFiDirectServiceAdvertiser
   (
      serviceName : Windows.String
   )
   return Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.Services.WiFiDirectServiceAdvertiser");
      m_Factory     : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiserFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectServiceAdvertiserFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWiFiDirectServiceAdvertiser(serviceName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetSelector
   (
      serviceName : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.Services.WiFiDirectService");
      m_Factory     : IWiFiDirectServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSelector(serviceName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSelectorWithFilter
   (
      serviceName : Windows.String
      ; serviceInfoFilter : Windows.Storage.Streams.IBuffer
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.Services.WiFiDirectService");
      m_Factory     : IWiFiDirectServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSelectorWithFilter(serviceName, serviceInfoFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectService is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.Services.WiFiDirectService");
      m_Factory     : IWiFiDirectServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectService;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
