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
limited with Windows.Storage.Streams;
limited with Windows.Devices.Bluetooth.Rfcomm;
limited with Windows.Networking.Sockets;
limited with Windows.Devices.Bluetooth.GenericAttributeProfile;
with Windows.Foundation.Collections;
limited with Windows.Devices.Bluetooth.Advertisement;
--------------------------------------------------------------------------------
package Windows.Devices.Bluetooth.Background is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type BluetoothEventTriggeringMode is (
      Serial,
      Batch,
      KeepLatest
   );
   for BluetoothEventTriggeringMode use (
      Serial => 0,
      Batch => 1,
      KeepLatest => 2
   );
   for BluetoothEventTriggeringMode'Size use 32;
   
   type BluetoothEventTriggeringMode_Ptr is access BluetoothEventTriggeringMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IRfcommInboundConnectionInformation_Interface;
   type IRfcommInboundConnectionInformation is access all IRfcommInboundConnectionInformation_Interface'Class;
   type IRfcommInboundConnectionInformation_Ptr is access all IRfcommInboundConnectionInformation;
   type IRfcommOutboundConnectionInformation_Interface;
   type IRfcommOutboundConnectionInformation is access all IRfcommOutboundConnectionInformation_Interface'Class;
   type IRfcommOutboundConnectionInformation_Ptr is access all IRfcommOutboundConnectionInformation;
   type IRfcommConnectionTriggerDetails_Interface;
   type IRfcommConnectionTriggerDetails is access all IRfcommConnectionTriggerDetails_Interface'Class;
   type IRfcommConnectionTriggerDetails_Ptr is access all IRfcommConnectionTriggerDetails;
   type IGattCharacteristicNotificationTriggerDetails_Interface;
   type IGattCharacteristicNotificationTriggerDetails is access all IGattCharacteristicNotificationTriggerDetails_Interface'Class;
   type IGattCharacteristicNotificationTriggerDetails_Ptr is access all IGattCharacteristicNotificationTriggerDetails;
   type IGattCharacteristicNotificationTriggerDetails2_Interface;
   type IGattCharacteristicNotificationTriggerDetails2 is access all IGattCharacteristicNotificationTriggerDetails2_Interface'Class;
   type IGattCharacteristicNotificationTriggerDetails2_Ptr is access all IGattCharacteristicNotificationTriggerDetails2;
   type IGattServiceProviderConnectionStatics_Interface;
   type IGattServiceProviderConnectionStatics is access all IGattServiceProviderConnectionStatics_Interface'Class;
   type IGattServiceProviderConnectionStatics_Ptr is access all IGattServiceProviderConnectionStatics;
   type IGattServiceProviderConnection_Interface;
   type IGattServiceProviderConnection is access all IGattServiceProviderConnection_Interface'Class;
   type IGattServiceProviderConnection_Ptr is access all IGattServiceProviderConnection;
   type IGattServiceProviderTriggerDetails_Interface;
   type IGattServiceProviderTriggerDetails is access all IGattServiceProviderTriggerDetails_Interface'Class;
   type IGattServiceProviderTriggerDetails_Ptr is access all IGattServiceProviderTriggerDetails;
   type IBluetoothLEAdvertisementWatcherTriggerDetails_Interface;
   type IBluetoothLEAdvertisementWatcherTriggerDetails is access all IBluetoothLEAdvertisementWatcherTriggerDetails_Interface'Class;
   type IBluetoothLEAdvertisementWatcherTriggerDetails_Ptr is access all IBluetoothLEAdvertisementWatcherTriggerDetails;
   type IBluetoothLEAdvertisementPublisherTriggerDetails_Interface;
   type IBluetoothLEAdvertisementPublisherTriggerDetails is access all IBluetoothLEAdvertisementPublisherTriggerDetails_Interface'Class;
   type IBluetoothLEAdvertisementPublisherTriggerDetails_Ptr is access all IBluetoothLEAdvertisementPublisherTriggerDetails;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IRfcommInboundConnectionInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SdpRecord
   (
      This       : access IRfcommInboundConnectionInformation_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_SdpRecord
   (
      This       : access IRfcommInboundConnectionInformation_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalServiceId
   (
      This       : access IRfcommInboundConnectionInformation_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function put_LocalServiceId
   (
      This       : access IRfcommInboundConnectionInformation_Interface
      ; value : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceCapabilities
   (
      This       : access IRfcommInboundConnectionInformation_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothServiceCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function put_ServiceCapabilities
   (
      This       : access IRfcommInboundConnectionInformation_Interface
      ; value : Windows.Devices.Bluetooth.BluetoothServiceCapabilities
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommInboundConnectionInformation : aliased constant Windows.IID := (1832809896, 21545, 16473, (146, 227, 30, 139, 101, 82, 135, 7 ));
   
   ------------------------------------------------------------------------
   type IRfcommOutboundConnectionInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteServiceId
   (
      This       : access IRfcommOutboundConnectionInformation_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteServiceId
   (
      This       : access IRfcommOutboundConnectionInformation_Interface
      ; value : Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommOutboundConnectionInformation : aliased constant Windows.IID := (2962301563, 62516, 19632, (153, 177, 74, 184, 206, 218, 237, 215 ));
   
   ------------------------------------------------------------------------
   type IRfcommConnectionTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Socket
   (
      This       : access IRfcommConnectionTriggerDetails_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamSocket
   )
   return Windows.HRESULT is abstract;
   
   function get_Incoming
   (
      This       : access IRfcommConnectionTriggerDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteDevice
   (
      This       : access IRfcommConnectionTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_IRfcommConnectionTriggerDetails : aliased constant Windows.IID := (4179784525, 11836, 20220, (171, 89, 252, 92, 249, 111, 151, 227 ));
   
   ------------------------------------------------------------------------
   type IGattCharacteristicNotificationTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Characteristic
   (
      This       : access IGattCharacteristicNotificationTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IGattCharacteristicNotificationTriggerDetails_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_IGattCharacteristicNotificationTriggerDetails : aliased constant Windows.IID := (2610969368, 4076, 17258, (147, 177, 244, 108, 105, 117, 50, 162 ));
   
   ------------------------------------------------------------------------
   type IGattCharacteristicNotificationTriggerDetails2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IGattCharacteristicNotificationTriggerDetails2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   function get_EventTriggeringMode
   (
      This       : access IGattCharacteristicNotificationTriggerDetails2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Background.BluetoothEventTriggeringMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ValueChangedEvents
   (
      This       : access IGattCharacteristicNotificationTriggerDetails2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattValueChangedEventArgs -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGattCharacteristicNotificationTriggerDetails2 : aliased constant Windows.IID := (1920618716, 38045, 17738, (177, 146, 152, 52, 103, 227, 213, 15 ));
   
   ------------------------------------------------------------------------
   type IGattServiceProviderConnectionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllServices
   (
      This       : access IGattServiceProviderConnectionStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGattServiceProviderConnectionStatics : aliased constant Windows.IID := (1028693835, 2830, 17510, (184, 205, 110, 189, 218, 31, 161, 125 ));
   
   ------------------------------------------------------------------------
   type IGattServiceProviderConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TriggerId
   (
      This       : access IGattServiceProviderConnection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Service
   (
      This       : access IGattServiceProviderConnection_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalService
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IGattServiceProviderConnection_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IGattServiceProviderConnection : aliased constant Windows.IID := (2141305273, 12051, 16565, (149, 130, 142, 183, 142, 152, 239, 19 ));
   
   ------------------------------------------------------------------------
   type IGattServiceProviderTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Connection
   (
      This       : access IGattServiceProviderTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection
   )
   return Windows.HRESULT is abstract;
   
   IID_IGattServiceProviderTriggerDetails : aliased constant Windows.IID := (2928412197, 1535, 19195, (177, 106, 222, 149, 243, 207, 1, 88 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEAdvertisementWatcherTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IBluetoothLEAdvertisementWatcherTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   function get_Advertisements
   (
      This       : access IBluetoothLEAdvertisementWatcherTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IVectorView_IBluetoothLEAdvertisementReceivedEventArgs -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SignalStrengthFilter
   (
      This       : access IBluetoothLEAdvertisementWatcherTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEAdvertisementWatcherTriggerDetails : aliased constant Windows.IID := (2816170711, 8791, 20073, (151, 132, 254, 230, 69, 193, 220, 224 ));
   
   ------------------------------------------------------------------------
   type IBluetoothLEAdvertisementPublisherTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IBluetoothLEAdvertisementPublisherTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementPublisherStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Error
   (
      This       : access IBluetoothLEAdvertisementPublisherTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   IID_IBluetoothLEAdvertisementPublisherTriggerDetails : aliased constant Windows.IID := (1628359302, 13440, 16841, (169, 24, 125, 218, 223, 32, 126, 0 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype RfcommInboundConnectionInformation is Windows.Devices.Bluetooth.Background.IRfcommInboundConnectionInformation;
   subtype RfcommOutboundConnectionInformation is Windows.Devices.Bluetooth.Background.IRfcommOutboundConnectionInformation;
   subtype RfcommConnectionTriggerDetails is Windows.Devices.Bluetooth.Background.IRfcommConnectionTriggerDetails;
   subtype GattCharacteristicNotificationTriggerDetails is Windows.Devices.Bluetooth.Background.IGattCharacteristicNotificationTriggerDetails;
   subtype GattServiceProviderConnection is Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection;
   subtype GattServiceProviderTriggerDetails is Windows.Devices.Bluetooth.Background.IGattServiceProviderTriggerDetails;
   subtype BluetoothLEAdvertisementWatcherTriggerDetails is Windows.Devices.Bluetooth.Background.IBluetoothLEAdvertisementWatcherTriggerDetails;
   subtype BluetoothLEAdvertisementPublisherTriggerDetails is Windows.Devices.Bluetooth.Background.IBluetoothLEAdvertisementPublisherTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_AllServices
   return Windows.Address;

end;
