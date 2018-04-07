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
with Windows.Networking.Sockets;
with Windows.Networking.Connectivity;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.ServiceDiscovery.Dnssd is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IDnssdServiceWatcher_add_Added_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IDnssdServiceWatcher_add_Added or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IDnssdServiceWatcher_add_Added_Interface
      ; sender : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher
      ; args : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher(sender), Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IDnssdServiceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDnssdServiceWatcher_add_Stopped_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IDnssdServiceWatcher_add_Stopped or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IDnssdServiceWatcher_add_Stopped_Interface
      ; sender : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IDnssdRegistrationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IDnssdRegistrationResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IDnssdRegistrationResult_Interface
      ; asyncInfo : Windows.Networking.ServiceDiscovery.Dnssd.IAsyncOperation_IDnssdRegistrationResult
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
   
   
   function Create
   (
      dnssdServiceInstanceName : Windows.String
      ; hostName : Windows.Networking.IHostName
      ; port : Windows.UInt16
   )
   return Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.ServiceDiscovery.Dnssd.DnssdServiceInstance");
      m_Factory     : Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstanceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.ServiceDiscovery.Dnssd.IDnssdServiceInstance := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDnssdServiceInstanceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(dnssdServiceInstanceName, hostName, port, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDnssdRegistrationResult return Windows.Networking.ServiceDiscovery.Dnssd.IDnssdRegistrationResult is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.ServiceDiscovery.Dnssd.DnssdRegistrationResult");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.ServiceDiscovery.Dnssd.IDnssdRegistrationResult := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.ServiceDiscovery.Dnssd.IID_IDnssdRegistrationResult'Access, RetVal'Address);
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
   

end;
