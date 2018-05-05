--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Networking;
with Windows.Networking.Sockets;
with Windows.Storage.Streams;
with Windows.Devices.Bluetooth;
with Windows.Devices.Enumeration;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Bluetooth.Rfcomm is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRfcommDeviceServicesResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceServicesResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRfcommDeviceService_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceService
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRfcommServiceProvider_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommServiceProvider
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
   
   function GetDeviceSelectorForBluetoothDevice
   (
      bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService");
      m_Factory     : IRfcommDeviceServiceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommDeviceServiceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorForBluetoothDevice(bluetoothDevice, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorForBluetoothDeviceWithCacheMode
   (
      bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService");
      m_Factory     : IRfcommDeviceServiceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommDeviceServiceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorForBluetoothDeviceWithCacheMode(bluetoothDevice, cacheMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorForBluetoothDeviceAndServiceId
   (
      bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
      ; serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService");
      m_Factory     : IRfcommDeviceServiceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommDeviceServiceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice, serviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorForBluetoothDeviceAndServiceIdWithCacheMode
   (
      bluetoothDevice : Windows.Devices.Bluetooth.IBluetoothDevice
      ; serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService");
      m_Factory     : IRfcommDeviceServiceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommDeviceServiceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorForBluetoothDeviceAndServiceIdWithCacheMode(bluetoothDevice, serviceId, cacheMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceService is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService");
      m_Factory     : IRfcommDeviceServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommDeviceService;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommDeviceServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   (
      serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService");
      m_Factory     : IRfcommDeviceServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommDeviceServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(serviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromUuid
   (
      uuid : Windows.Guid
   )
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId");
      m_Factory     : IRfcommServiceIdStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommServiceIdStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromUuid(uuid, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromShortId
   (
      shortId : Windows.UInt32
   )
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId");
      m_Factory     : IRfcommServiceIdStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommServiceIdStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromShortId(shortId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SerialPort
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId");
      m_Factory     : IRfcommServiceIdStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommServiceIdStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SerialPort(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ObexObjectPush
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId");
      m_Factory     : IRfcommServiceIdStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommServiceIdStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ObexObjectPush(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ObexFileTransfer
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId");
      m_Factory     : IRfcommServiceIdStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommServiceIdStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ObexFileTransfer(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PhoneBookAccessPce
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId");
      m_Factory     : IRfcommServiceIdStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommServiceIdStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PhoneBookAccessPce(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PhoneBookAccessPse
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId");
      m_Factory     : IRfcommServiceIdStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommServiceIdStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PhoneBookAccessPse(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GenericFileTransfer
   return Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId");
      m_Factory     : IRfcommServiceIdStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommServiceIdStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GenericFileTransfer(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAsync
   (
      serviceId : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommServiceProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceProvider");
      m_Factory     : IRfcommServiceProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.Rfcomm.IAsyncOperation_IRfcommServiceProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRfcommServiceProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsync(serviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
