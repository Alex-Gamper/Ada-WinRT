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
with Windows.Networking;
with Windows.Security.Credentials;
with Windows.Security.Cryptography.Certificates;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.Vpn is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IVpnChannel_add_ActivityChange_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IVpnChannel_add_ActivityChange or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IVpnChannel_add_ActivityChange_Interface
      ; sender : Windows.Networking.Vpn.IVpnChannel
      ; args : Windows.Networking.Vpn.IVpnChannelActivityEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Vpn.IVpnChannel(sender), Windows.Networking.Vpn.IVpnChannelActivityEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IVpnChannel2_add_ActivityStateChange_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IVpnChannel2_add_ActivityStateChange or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IVpnChannel2_add_ActivityStateChange_Interface
      ; sender : Windows.Networking.Vpn.IVpnChannel
      ; args : Windows.Networking.Vpn.IVpnChannelActivityStateChangedArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Vpn.IVpnChannel(sender), Windows.Networking.Vpn.IVpnChannelActivityStateChangedArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IVpnCredential_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IVpnCredential or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IVpnCredential_Interface
      ; asyncInfo : Windows.Networking.Vpn.IAsyncOperation_IVpnCredential
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_VpnManagementErrorStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_VpnManagementErrorStatus or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_VpnManagementErrorStatus_Interface
      ; asyncInfo : Windows.Networking.Vpn.IAsyncOperation_VpnManagementErrorStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateVpnRoute
   (
      address : Windows.Networking.IHostName
      ; prefixSize : Windows.UInt8
   )
   return Windows.Networking.Vpn.IVpnRoute is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnRoute");
      m_Factory     : Windows.Networking.Vpn.IVpnRouteFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnRoute := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVpnRouteFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateVpnRoute(address, prefixSize, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnNamespaceInfo
   (
      name : Windows.String
      ; dnsServerList : Windows.Networking.IVector_IHostName
      ; proxyServerList : Windows.Networking.IVector_IHostName
   )
   return Windows.Networking.Vpn.IVpnNamespaceInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnNamespaceInfo");
      m_Factory     : Windows.Networking.Vpn.IVpnNamespaceInfoFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnNamespaceInfo := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVpnNamespaceInfoFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateVpnNamespaceInfo(name, dnsServerList, proxyServerList, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnInterfaceId
   (
      address : Windows.UInt8_Ptr
   )
   return Windows.Networking.Vpn.IVpnInterfaceId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnInterfaceId");
      m_Factory     : Windows.Networking.Vpn.IVpnInterfaceIdFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnInterfaceId := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVpnInterfaceIdFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateVpnInterfaceId(address, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnRouteAssignment return Windows.Networking.Vpn.IVpnRouteAssignment is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnRouteAssignment");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnRouteAssignment := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnRouteAssignment'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnNamespaceAssignment return Windows.Networking.Vpn.IVpnNamespaceAssignment is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnNamespaceAssignment");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnNamespaceAssignment := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnNamespaceAssignment'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnPacketBuffer
   (
      parentBuffer : Windows.Networking.Vpn.IVpnPacketBuffer
      ; offset : Windows.UInt32
      ; length : Windows.UInt32
   )
   return Windows.Networking.Vpn.IVpnPacketBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnPacketBuffer");
      m_Factory     : Windows.Networking.Vpn.IVpnPacketBufferFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnPacketBuffer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVpnPacketBufferFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateVpnPacketBuffer(parentBuffer, offset, length, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnDomainNameAssignment return Windows.Networking.Vpn.IVpnDomainNameAssignment is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnDomainNameAssignment");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnDomainNameAssignment := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnDomainNameAssignment'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnTrafficFilterAssignment return Windows.Networking.Vpn.IVpnTrafficFilterAssignment is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnTrafficFilterAssignment");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnTrafficFilterAssignment := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnTrafficFilterAssignment'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      type_x : Windows.Networking.Vpn.VpnAppIdType
      ; value : Windows.String
   )
   return Windows.Networking.Vpn.IVpnAppId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnAppId");
      m_Factory     : Windows.Networking.Vpn.IVpnAppIdFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnAppId := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVpnAppIdFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(type_x, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnDomainNameInfo
   (
      name : Windows.String
      ; nameType : Windows.Networking.Vpn.VpnDomainNameType
      ; dnsServerList : Windows.Networking.IIterable_IHostName
      ; proxyServerList : Windows.Networking.IIterable_IHostName
   )
   return Windows.Networking.Vpn.IVpnDomainNameInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnDomainNameInfo");
      m_Factory     : Windows.Networking.Vpn.IVpnDomainNameInfoFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnDomainNameInfo := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVpnDomainNameInfoFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateVpnDomainNameInfo(name, nameType, dnsServerList, proxyServerList, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      appId : Windows.Networking.Vpn.IVpnAppId
   )
   return Windows.Networking.Vpn.IVpnTrafficFilter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnTrafficFilter");
      m_Factory     : Windows.Networking.Vpn.IVpnTrafficFilterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnTrafficFilter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVpnTrafficFilterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(appId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnCustomEditBox return Windows.Networking.Vpn.IVpnCustomEditBox is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnCustomEditBox");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnCustomEditBox := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnCustomEditBox'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnCustomPromptTextInput return Windows.Networking.Vpn.IVpnCustomPromptTextInput is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnCustomPromptTextInput");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnCustomPromptTextInput := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnCustomPromptTextInput'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnCustomComboBox return Windows.Networking.Vpn.IVpnCustomComboBox is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnCustomComboBox");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnCustomComboBox := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnCustomComboBox'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnCustomPromptOptionSelector return Windows.Networking.Vpn.IVpnCustomPromptOptionSelector is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnCustomPromptOptionSelector");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnCustomPromptOptionSelector := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnCustomPromptOptionSelector'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnCustomTextBox return Windows.Networking.Vpn.IVpnCustomTextBox is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnCustomTextBox");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnCustomTextBox := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnCustomTextBox'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnCustomPromptText return Windows.Networking.Vpn.IVpnCustomPromptText is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnCustomPromptText");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnCustomPromptText := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnCustomPromptText'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnCustomCheckBox return Windows.Networking.Vpn.IVpnCustomCheckBox is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnCustomCheckBox");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnCustomCheckBox := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnCustomCheckBox'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnCustomPromptBooleanInput return Windows.Networking.Vpn.IVpnCustomPromptBooleanInput is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnCustomPromptBooleanInput");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnCustomPromptBooleanInput := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnCustomPromptBooleanInput'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnCustomErrorBox return Windows.Networking.Vpn.IVpnCustomErrorBox is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnCustomErrorBox");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnCustomErrorBox := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnCustomErrorBox'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnPlugInProfile return Windows.Networking.Vpn.IVpnPlugInProfile is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnPlugInProfile");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnPlugInProfile := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnPlugInProfile'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnNativeProfile return Windows.Networking.Vpn.IVpnNativeProfile is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnNativeProfile");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnNativeProfile := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnNativeProfile'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVpnManagementAgent return Windows.Networking.Vpn.IVpnManagementAgent is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnManagementAgent");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Vpn.IVpnManagementAgent := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Vpn.IID_IVpnManagementAgent'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   procedure ProcessEventAsync
   (
      thirdPartyPlugIn : Windows.Object
      ; event : Windows.Object
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Vpn.VpnChannel");
      m_Factory     : IVpnChannelStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVpnChannelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ProcessEventAsync(thirdPartyPlugIn, event);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;

end;
