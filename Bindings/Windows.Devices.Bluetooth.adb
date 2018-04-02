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
with Windows.Devices.Radios;
with Windows.Networking;
with Windows.Storage.Streams;
with Windows.Devices.Bluetooth.Rfcomm;
with Windows.Devices.Enumeration;
with Windows.Devices.Bluetooth.GenericAttributeProfile;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Bluetooth is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IBluetoothAdapter_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IBluetoothAdapter or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IBluetoothAdapter_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IBluetoothDevice_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IBluetoothDevice or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IBluetoothDevice_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IBluetoothDevice_add_NameChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IBluetoothDevice_add_NameChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IBluetoothDevice_add_NameChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.IBluetoothDevice(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IBluetoothDevice_add_SdpRecordsChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.IBluetoothDevice(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IBluetoothDevice_add_ConnectionStatusChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.IBluetoothDevice(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IBluetoothLEDevice_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IBluetoothLEDevice or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IBluetoothLEDevice_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IBluetoothLEDevice_add_NameChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IBluetoothLEDevice_add_NameChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IBluetoothLEDevice_add_NameChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothLEDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.IBluetoothLEDevice(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IBluetoothLEDevice_add_GattServicesChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothLEDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.IBluetoothLEDevice(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IBluetoothLEDevice_add_ConnectionStatusChanged_Interface
      ; sender : Windows.Devices.Bluetooth.IBluetoothLEDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.IBluetoothLEDevice(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateBluetoothSignalStrengthFilter return Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothSignalStrengthFilter");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.IID_IBluetoothSignalStrengthFilter'Access, RetVal'Address);
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
   
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothAdapter");
      m_Factory     : IBluetoothAdapterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothAdapterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothAdapter");
      m_Factory     : IBluetoothAdapterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothAdapterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultAsync
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothAdapter");
      m_Factory     : IBluetoothAdapterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothAdapter;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothAdapterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.IBluetoothDeviceId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothDeviceId");
      m_Factory     : IBluetoothDeviceIdStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IBluetoothDeviceId;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothDeviceIdStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromId(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromShortId
   (
      shortId : Windows.UInt32
   )
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothUuidHelper");
      m_Factory     : IBluetoothUuidHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothUuidHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromShortId(shortId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryGetShortId
   (
      uuid : Windows.Guid
   )
   return Windows.Foundation.IReference_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothUuidHelper");
      m_Factory     : IBluetoothUuidHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IReference_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothUuidHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryGetShortId(uuid, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothDevice");
      m_Factory     : IBluetoothDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromHostNameAsync
   (
      hostName : Windows.Networking.IHostName
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothDevice");
      m_Factory     : IBluetoothDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromHostNameAsync(hostName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromBluetoothAddressAsync
   (
      address : Windows.UInt64
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothDevice");
      m_Factory     : IBluetoothDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromBluetoothAddressAsync(address, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_IBluetoothDevice
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothDevice");
      m_Factory     : IBluetoothDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromPairingState
   (
      pairingState : Windows.Boolean
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothDevice");
      m_Factory     : IBluetoothDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromPairingState(pairingState, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromConnectionStatus
   (
      connectionStatus : Windows.Devices.Bluetooth.BluetoothConnectionStatus
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothDevice");
      m_Factory     : IBluetoothDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromConnectionStatus(connectionStatus, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromDeviceName
   (
      deviceName : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothDevice");
      m_Factory     : IBluetoothDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromDeviceName(deviceName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromBluetoothAddress
   (
      bluetoothAddress : Windows.UInt64
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothDevice");
      m_Factory     : IBluetoothDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromBluetoothAddress(bluetoothAddress, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromClassOfDevice
   (
      classOfDevice : Windows.Devices.Bluetooth.IBluetoothClassOfDevice
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothDevice");
      m_Factory     : IBluetoothDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromClassOfDevice(classOfDevice, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromRawValue
   (
      rawValue : Windows.UInt32
   )
   return Windows.Devices.Bluetooth.IBluetoothClassOfDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothClassOfDevice");
      m_Factory     : IBluetoothClassOfDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IBluetoothClassOfDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothClassOfDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromRawValue(rawValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromParts
   (
      majorClass : Windows.Devices.Bluetooth.BluetoothMajorClass
      ; minorClass : Windows.Devices.Bluetooth.BluetoothMinorClass
      ; serviceCapabilities : Windows.Devices.Bluetooth.BluetoothServiceCapabilities
   )
   return Windows.Devices.Bluetooth.IBluetoothClassOfDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothClassOfDevice");
      m_Factory     : IBluetoothClassOfDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IBluetoothClassOfDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothClassOfDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromParts(majorClass, minorClass, serviceCapabilities, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Uncategorized
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Uncategorized(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Phone
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Phone(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Computer
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Computer(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Watch
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Watch(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Clock
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Clock(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Display
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Display(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RemoteControl
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RemoteControl(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EyeGlasses
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EyeGlasses(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Tag
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Tag(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Keyring
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Keyring(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediaPlayer
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediaPlayer(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BarcodeScanner
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BarcodeScanner(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Thermometer
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Thermometer(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeartRate
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeartRate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BloodPressure
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BloodPressure(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HumanInterfaceDevice
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HumanInterfaceDevice(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GlucoseMeter
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GlucoseMeter(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RunningWalking
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RunningWalking(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Cycling
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Cycling(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PulseOximeter
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PulseOximeter(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WeightScale
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WeightScale(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OutdoorSportActivity
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories");
      m_Factory     : IBluetoothLEAppearanceCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OutdoorSportActivity(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Generic
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Generic(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SportsWatch
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SportsWatch(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ThermometerEar
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ThermometerEar(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeartRateBelt
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeartRateBelt(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BloodPressureArm
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BloodPressureArm(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BloodPressureWrist
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BloodPressureWrist(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Keyboard
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Keyboard(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mouse
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mouse(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Joystick
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Joystick(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gamepad
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gamepad(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DigitizerTablet
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DigitizerTablet(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CardReader
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CardReader(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DigitalPen
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DigitalPen(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BarcodeScanner_BluetoothLEAppearanceSubcategories
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BarcodeScanner(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RunningWalkingInShoe
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RunningWalkingInShoe(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RunningWalkingOnShoe
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RunningWalkingOnShoe(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RunningWalkingOnHip
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RunningWalkingOnHip(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingComputer
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingComputer(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingSpeedSensor
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingSpeedSensor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingCadenceSensor
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingCadenceSensor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingPowerSensor
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingPowerSensor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingSpeedCadenceSensor
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingSpeedCadenceSensor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OximeterFingertip
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OximeterFingertip(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OximeterWristWorn
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OximeterWristWorn(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocationDisplay
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocationDisplay(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocationNavigationDisplay
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocationNavigationDisplay(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocationPod
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocationPod(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocationNavigationPod
   return Windows.UInt16 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories");
      m_Factory     : IBluetoothLEAppearanceSubcategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt16;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceSubcategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocationNavigationPod(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromRawValue
   (
      rawValue : Windows.UInt16
   )
   return Windows.Devices.Bluetooth.IBluetoothLEAppearance is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearance");
      m_Factory     : IBluetoothLEAppearanceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IBluetoothLEAppearance;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromRawValue(rawValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromParts
   (
      appearanceCategory : Windows.UInt16
      ; appearanceSubCategory : Windows.UInt16
   )
   return Windows.Devices.Bluetooth.IBluetoothLEAppearance is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEAppearance");
      m_Factory     : IBluetoothLEAppearanceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IBluetoothLEAppearance;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEAppearanceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromParts(appearanceCategory, appearanceSubCategory, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEDevice");
      m_Factory     : IBluetoothLEDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromBluetoothAddressAsync
   (
      bluetoothAddress : Windows.UInt64
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEDevice");
      m_Factory     : IBluetoothLEDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromBluetoothAddressAsync(bluetoothAddress, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_IBluetoothLEDevice
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEDevice");
      m_Factory     : IBluetoothLEDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromPairingState_IBluetoothLEDevice
   (
      pairingState : Windows.Boolean
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEDevice");
      m_Factory     : IBluetoothLEDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromPairingState(pairingState, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromConnectionStatus_IBluetoothLEDevice
   (
      connectionStatus : Windows.Devices.Bluetooth.BluetoothConnectionStatus
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEDevice");
      m_Factory     : IBluetoothLEDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromConnectionStatus(connectionStatus, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromDeviceName_IBluetoothLEDevice
   (
      deviceName : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEDevice");
      m_Factory     : IBluetoothLEDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromDeviceName(deviceName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromBluetoothAddress_IBluetoothLEDevice
   (
      bluetoothAddress : Windows.UInt64
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEDevice");
      m_Factory     : IBluetoothLEDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromBluetoothAddress(bluetoothAddress, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromBluetoothAddressWithBluetoothAddressType
   (
      bluetoothAddress : Windows.UInt64
      ; bluetoothAddressType : Windows.Devices.Bluetooth.BluetoothAddressType
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEDevice");
      m_Factory     : IBluetoothLEDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromBluetoothAddressWithBluetoothAddressType(bluetoothAddress, bluetoothAddressType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromAppearance
   (
      appearance : Windows.Devices.Bluetooth.IBluetoothLEAppearance
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEDevice");
      m_Factory     : IBluetoothLEDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromAppearance(appearance, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromBluetoothAddressWithBluetoothAddressTypeAsync
   (
      bluetoothAddress : Windows.UInt64
      ; bluetoothAddressType : Windows.Devices.Bluetooth.BluetoothAddressType
   )
   return Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.BluetoothLEDevice");
      m_Factory     : IBluetoothLEDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.IAsyncOperation_IBluetoothLEDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBluetoothLEDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromBluetoothAddressWithBluetoothAddressTypeAsync(bluetoothAddress, bluetoothAddressType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
