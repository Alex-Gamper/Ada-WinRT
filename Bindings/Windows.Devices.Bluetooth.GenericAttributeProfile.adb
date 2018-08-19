--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Devices.Bluetooth;
with Windows.Devices.Enumeration;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Bluetooth.GenericAttributeProfile is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattDeviceServicesResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult
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
      This       : access AsyncOperationCompletedHandler_IGattSession_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattSession
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
      This       : access TypedEventHandler_IGattSession_add_MaxPduSizeChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGattSession_add_SessionStatusChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession(sender), Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattDeviceService_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService
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
      This       : access AsyncOperationCompletedHandler_GattOpenStatus_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattOpenStatus
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
      This       : access AsyncOperationCompletedHandler_IGattCharacteristicsResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattCharacteristicsResult
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
      This       : access AsyncOperationCompletedHandler_IGattReadResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadResult
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
      This       : access AsyncOperationCompletedHandler_GattCommunicationStatus_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattCommunicationStatus
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
      This       : access AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult
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
      This       : access TypedEventHandler_IGattCharacteristic_add_ValueChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic(sender), Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattDescriptorsResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDescriptorsResult
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
      This       : access AsyncOperationCompletedHandler_IGattWriteResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteResult
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
      This       : access AsyncOperationCompletedHandler_IGattServiceProviderResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattServiceProviderResult
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
      This       : access TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider(sender), Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattLocalCharacteristicResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattLocalCharacteristicResult
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
      This       : access AsyncOperationCompletedHandler_IGattLocalDescriptorResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattLocalDescriptorResult
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
      This       : access TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic(sender), Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic(sender), Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattClientNotificationResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattClientNotificationResult
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
      This       : access TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGattLocalDescriptor_add_ReadRequested_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor(sender), Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGattLocalDescriptor_add_WriteRequested_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor(sender), Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGattReadRequest_add_StateChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest(sender), Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGattWriteRequest_add_StateChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest(sender), Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattReadRequest_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadRequest
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
      This       : access AsyncOperationCompletedHandler_IGattWriteRequest_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteRequest
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
   
   function Create return Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReliableWriteTransaction is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattReliableWriteTransaction");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReliableWriteTransaction) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.GenericAttributeProfile.IID_IGattReliableWriteTransaction'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProviderAdvertisingParameters");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.GenericAttributeProfile.IID_IGattServiceProviderAdvertisingParameters'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicParameters is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalCharacteristicParameters");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicParameters) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.GenericAttributeProfile.IID_IGattLocalCharacteristicParameters'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorParameters is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalDescriptorParameters");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorParameters) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Bluetooth.GenericAttributeProfile.IID_IGattLocalDescriptorParameters'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService");
      m_Factory     : IGattDeviceServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDeviceServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromUuid
   (
      serviceUuid : Windows.Guid
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService");
      m_Factory     : IGattDeviceServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDeviceServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromUuid(serviceUuid, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorFromShortId
   (
      serviceShortId : Windows.UInt16
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService");
      m_Factory     : IGattDeviceServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDeviceServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorFromShortId(serviceShortId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ConvertShortIdToUuid
   (
      shortId : Windows.UInt16
   )
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService");
      m_Factory     : IGattDeviceServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDeviceServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConvertShortIdToUuid(shortId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdWithSharingModeAsync
   (
      deviceId : Windows.String
      ; sharingMode : Windows.Devices.Bluetooth.GenericAttributeProfile.GattSharingMode
   )
   return Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService");
      m_Factory     : IGattDeviceServiceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDeviceServiceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdWithSharingModeAsync(deviceId, sharingMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorForBluetoothDeviceId
   (
      bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService");
      m_Factory     : IGattDeviceServiceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDeviceServiceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorForBluetoothDeviceIdWithCacheMode
   (
      bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService");
      m_Factory     : IGattDeviceServiceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDeviceServiceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorForBluetoothDeviceIdWithCacheMode(bluetoothDeviceId, cacheMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorForBluetoothDeviceIdAndUuid
   (
      bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; serviceUuid : Windows.Guid
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService");
      m_Factory     : IGattDeviceServiceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDeviceServiceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId, serviceUuid, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorForBluetoothDeviceIdAndUuidWithCacheMode
   (
      bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; serviceUuid : Windows.Guid
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService");
      m_Factory     : IGattDeviceServiceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDeviceServiceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorForBluetoothDeviceIdAndUuidWithCacheMode(bluetoothDeviceId, serviceUuid, cacheMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidHandle
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidHandle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ReadNotPermitted
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ReadNotPermitted(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WriteNotPermitted
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WriteNotPermitted(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidPdu
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidPdu(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InsufficientAuthentication
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InsufficientAuthentication(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RequestNotSupported
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RequestNotSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidOffset
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidOffset(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InsufficientAuthorization
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InsufficientAuthorization(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PrepareQueueFull
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PrepareQueueFull(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AttributeNotFound
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AttributeNotFound(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AttributeNotLong
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AttributeNotLong(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InsufficientEncryptionKeySize
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InsufficientEncryptionKeySize(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InvalidAttributeValueLength
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InvalidAttributeValueLength(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UnlikelyError
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UnlikelyError(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InsufficientEncryption
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InsufficientEncryption(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UnsupportedGroupType
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UnsupportedGroupType(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InsufficientResources
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError");
      m_Factory     : IGattProtocolErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattProtocolErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InsufficientResources(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromDeviceIdAsync
   (
      deviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
   )
   return Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattSession");
      m_Factory     : IGattSessionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattSession;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattSessionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromDeviceIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ConvertShortIdToUuid_IGattCharacteristic
   (
      shortId : Windows.UInt16
   )
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristic");
      m_Factory     : IGattCharacteristicStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConvertShortIdToUuid(shortId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ConvertShortIdToUuid_IGattDescriptor
   (
      shortId : Windows.UInt16
   )
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptor");
      m_Factory     : IGattDescriptorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDescriptorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConvertShortIdToUuid(shortId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromParts
   (
      formatType : Windows.UInt8
      ; exponent : Windows.Int32
      ; unit : Windows.UInt16
      ; namespaceId : Windows.UInt8
      ; description : Windows.UInt16
   )
   return Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormat");
      m_Factory     : IGattPresentationFormatStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromParts(formatType, exponent, unit, namespaceId, description, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BluetoothSigAssignedNumbers
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormat");
      m_Factory     : IGattPresentationFormatStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BluetoothSigAssignedNumbers(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Boolean
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Boolean(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Bit2
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Bit2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Nibble
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Nibble(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UInt8
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UInt8(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UInt12
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UInt12(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UInt16
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UInt16(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UInt24
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UInt24(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UInt32
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UInt32(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UInt48
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UInt48(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UInt64
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UInt64(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UInt128
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UInt128(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SInt8
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SInt8(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SInt12
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SInt12(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SInt16
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SInt16(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SInt24
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SInt24(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SInt32
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SInt32(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SInt48
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SInt48(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SInt64
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SInt64(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SInt128
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SInt128(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Float32
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Float32(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Float64
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Float64(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SFloat
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SFloat(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Float
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Float(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DUInt16
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DUInt16(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Utf8
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Utf8(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Utf16
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Utf16(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Struct
   return Windows.UInt8 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes");
      m_Factory     : IGattPresentationFormatTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt8;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattPresentationFormatTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Struct(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AlertNotification
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AlertNotification(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CurrentTime
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CurrentTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingPower
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingPower(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DeviceInformation
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DeviceInformation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HumanInterfaceDevice
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HumanInterfaceDevice(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ImmediateAlert
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ImmediateAlert(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LinkLoss
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LinkLoss(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocationAndNavigation
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocationAndNavigation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NextDstChange
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NextDstChange(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PhoneAlertStatus
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PhoneAlertStatus(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ReferenceTimeUpdate
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ReferenceTimeUpdate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ScanParameters
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ScanParameters(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TxPower
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TxPower(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Battery
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Battery(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BloodPressure
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BloodPressure(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingSpeedAndCadence
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingSpeedAndCadence(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GenericAccess
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GenericAccess(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GenericAttribute
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GenericAttribute(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Glucose
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Glucose(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HealthThermometer
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HealthThermometer(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeartRate
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeartRate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RunningSpeedAndCadence
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids");
      m_Factory     : IGattServiceUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RunningSpeedAndCadence(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AlertCategoryId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AlertCategoryId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AlertCategoryIdBitMask
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AlertCategoryIdBitMask(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AlertLevel
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AlertLevel(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AlertNotificationControlPoint
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AlertNotificationControlPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AlertStatus
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AlertStatus(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GapAppearance
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GapAppearance(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BootKeyboardInputReport
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BootKeyboardInputReport(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BootKeyboardOutputReport
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BootKeyboardOutputReport(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BootMouseInputReport
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BootMouseInputReport(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CurrentTime_GattCharacteristicUuids
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CurrentTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingPowerControlPoint
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingPowerControlPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingPowerFeature
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingPowerFeature(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingPowerMeasurement
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingPowerMeasurement(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CyclingPowerVector
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CyclingPowerVector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DateTime
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DateTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DayDateTime
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DayDateTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DayOfWeek
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DayOfWeek(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GapDeviceName
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GapDeviceName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DstOffset
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DstOffset(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExactTime256
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExactTime256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FirmwareRevisionString
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FirmwareRevisionString(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HardwareRevisionString
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HardwareRevisionString(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HidControlPoint
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HidControlPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HidInformation
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HidInformation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ieee1107320601RegulatoryCertificationDataList
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ieee1107320601RegulatoryCertificationDataList(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LnControlPoint
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LnControlPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LnFeature
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LnFeature(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocalTimeInformation
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocalTimeInformation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocationAndSpeed
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocationAndSpeed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ManufacturerNameString
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ManufacturerNameString(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ModelNumberString
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ModelNumberString(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Navigation
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Navigation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NewAlert
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NewAlert(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GapPeripheralPreferredConnectionParameters
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GapPeripheralPreferredConnectionParameters(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GapPeripheralPrivacyFlag
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GapPeripheralPrivacyFlag(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PnpId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PnpId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PositionQuality
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PositionQuality(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ProtocolMode
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ProtocolMode(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GapReconnectionAddress
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GapReconnectionAddress(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ReferenceTimeInformation
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ReferenceTimeInformation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Report
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Report(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ReportMap
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ReportMap(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RingerControlPoint
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RingerControlPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RingerSetting
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RingerSetting(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ScanIntervalWindow
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ScanIntervalWindow(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ScanRefresh
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ScanRefresh(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SerialNumberString
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SerialNumberString(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GattServiceChanged
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GattServiceChanged(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SoftwareRevisionString
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SoftwareRevisionString(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedNewAlertCategory
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedNewAlertCategory(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportUnreadAlertCategory
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportUnreadAlertCategory(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SystemId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SystemId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TimeAccuracy
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TimeAccuracy(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TimeSource
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TimeSource(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TimeUpdateControlPoint
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TimeUpdateControlPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TimeUpdateState
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TimeUpdateState(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TimeWithDst
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TimeWithDst(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TimeZone
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TimeZone(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TxPowerLevel
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TxPowerLevel(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UnreadAlertStatus
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UnreadAlertStatus(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BatteryLevel
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BatteryLevel(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BloodPressureFeature
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BloodPressureFeature(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BloodPressureMeasurement
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BloodPressureMeasurement(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BodySensorLocation
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BodySensorLocation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CscFeature
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CscFeature(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CscMeasurement
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CscMeasurement(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GlucoseFeature
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GlucoseFeature(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GlucoseMeasurement
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GlucoseMeasurement(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GlucoseMeasurementContext
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GlucoseMeasurementContext(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeartRateControlPoint
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeartRateControlPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeartRateMeasurement
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeartRateMeasurement(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IntermediateCuffPressure
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IntermediateCuffPressure(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IntermediateTemperature
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IntermediateTemperature(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MeasurementInterval
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MeasurementInterval(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RecordAccessControlPoint
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RecordAccessControlPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RscFeature
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RscFeature(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RscMeasurement
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RscMeasurement(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SCControlPoint
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SCControlPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SensorLocation
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SensorLocation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TemperatureMeasurement
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TemperatureMeasurement(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TemperatureType
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids");
      m_Factory     : IGattCharacteristicUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TemperatureType(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CharacteristicAggregateFormat
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids");
      m_Factory     : IGattDescriptorUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDescriptorUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CharacteristicAggregateFormat(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CharacteristicExtendedProperties
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids");
      m_Factory     : IGattDescriptorUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDescriptorUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CharacteristicExtendedProperties(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CharacteristicPresentationFormat
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids");
      m_Factory     : IGattDescriptorUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDescriptorUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CharacteristicPresentationFormat(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CharacteristicUserDescription
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids");
      m_Factory     : IGattDescriptorUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDescriptorUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CharacteristicUserDescription(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ClientCharacteristicConfiguration
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids");
      m_Factory     : IGattDescriptorUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDescriptorUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ClientCharacteristicConfiguration(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ServerCharacteristicConfiguration
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids");
      m_Factory     : IGattDescriptorUuidsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattDescriptorUuidsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ServerCharacteristicConfiguration(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAsync
   (
      serviceUuid : Windows.Guid
   )
   return Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattServiceProviderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProvider");
      m_Factory     : IGattServiceProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattServiceProviderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsync(serviceUuid, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
