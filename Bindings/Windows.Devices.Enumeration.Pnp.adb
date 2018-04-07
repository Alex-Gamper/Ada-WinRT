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
with Windows.Devices.Enumeration;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Enumeration.Pnp is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IPnpObjectWatcher_add_Added_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IPnpObjectWatcher_add_Added or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IPnpObjectWatcher_add_Added_Interface
      ; sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
      ; args : Windows.Devices.Enumeration.Pnp.IPnpObject
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher(sender), Windows.Devices.Enumeration.Pnp.IPnpObject(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IPnpObjectWatcher_add_Updated_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IPnpObjectWatcher_add_Updated or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IPnpObjectWatcher_add_Updated_Interface
      ; sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
      ; args : Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher(sender), Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IPnpObjectWatcher_add_Removed_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IPnpObjectWatcher_add_Removed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IPnpObjectWatcher_add_Removed_Interface
      ; sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
      ; args : Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher(sender), Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IPnpObjectWatcher_add_Stopped_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IPnpObjectWatcher_add_Stopped or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IPnpObjectWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IPnpObject_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IPnpObject or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IPnpObject_Interface
      ; asyncInfo : Windows.Devices.Enumeration.Pnp.IAsyncOperation_IPnpObject
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IVectorView_PnpObject_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IVectorView_PnpObject or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IVectorView_PnpObject_Interface
      ; asyncInfo : Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject
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
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateFromIdAsync
   (
      type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; id : Windows.String
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.Pnp.IAsyncOperation_IPnpObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.Pnp.PnpObject");
      m_Factory     : IPnpObjectStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.Pnp.IAsyncOperation_IPnpObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPnpObjectStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIdAsync(type_x, id, requestedProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsync
   (
      type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.Pnp.PnpObject");
      m_Factory     : IPnpObjectStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPnpObjectStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsync(type_x, requestedProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncAqsFilter
   (
      type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
      ; aqsFilter : Windows.String
   )
   return Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.Pnp.PnpObject");
      m_Factory     : IPnpObjectStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPnpObjectStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncAqsFilter(type_x, requestedProperties, aqsFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcher
   (
      type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.Pnp.PnpObject");
      m_Factory     : IPnpObjectStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPnpObjectStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(type_x, requestedProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcherAqsFilter
   (
      type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
      ; aqsFilter : Windows.String
   )
   return Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.Pnp.PnpObject");
      m_Factory     : IPnpObjectStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPnpObjectStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcherAqsFilter(type_x, requestedProperties, aqsFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
