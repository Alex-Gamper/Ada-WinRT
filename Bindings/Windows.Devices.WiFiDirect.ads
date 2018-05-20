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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Networking;
limited with Windows.Storage.Streams;
limited with Windows.Devices.Enumeration;
limited with Windows.Security.Credentials;
--------------------------------------------------------------------------------
package Windows.Devices.WiFiDirect is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WiFiDirectConnectionStatus is (
      Disconnected,
      Connected
   );
   for WiFiDirectConnectionStatus use (
      Disconnected => 0,
      Connected => 1
   );
   for WiFiDirectConnectionStatus'Size use 32;
   
   type WiFiDirectConnectionStatus_Ptr is access WiFiDirectConnectionStatus;
   
   type WiFiDirectError is (
      Success,
      RadioNotAvailable,
      ResourceInUse
   );
   for WiFiDirectError use (
      Success => 0,
      RadioNotAvailable => 1,
      ResourceInUse => 2
   );
   for WiFiDirectError'Size use 32;
   
   type WiFiDirectError_Ptr is access WiFiDirectError;
   
   type WiFiDirectDeviceSelectorType is (
      DeviceInterface,
      AssociationEndpoint
   );
   for WiFiDirectDeviceSelectorType use (
      DeviceInterface => 0,
      AssociationEndpoint => 1
   );
   for WiFiDirectDeviceSelectorType'Size use 32;
   
   type WiFiDirectDeviceSelectorType_Ptr is access WiFiDirectDeviceSelectorType;
   
   type WiFiDirectAdvertisementListenStateDiscoverability is (
      None,
      Normal,
      Intensive
   );
   for WiFiDirectAdvertisementListenStateDiscoverability use (
      None => 0,
      Normal => 1,
      Intensive => 2
   );
   for WiFiDirectAdvertisementListenStateDiscoverability'Size use 32;
   
   type WiFiDirectAdvertisementListenStateDiscoverability_Ptr is access WiFiDirectAdvertisementListenStateDiscoverability;
   
   type WiFiDirectAdvertisementPublisherStatus is (
      Created,
      Started,
      Stopped,
      Aborted
   );
   for WiFiDirectAdvertisementPublisherStatus use (
      Created => 0,
      Started => 1,
      Stopped => 2,
      Aborted => 3
   );
   for WiFiDirectAdvertisementPublisherStatus'Size use 32;
   
   type WiFiDirectAdvertisementPublisherStatus_Ptr is access WiFiDirectAdvertisementPublisherStatus;
   
   type WiFiDirectConfigurationMethod is (
      ProvidePin,
      DisplayPin,
      PushButton
   );
   for WiFiDirectConfigurationMethod use (
      ProvidePin => 0,
      DisplayPin => 1,
      PushButton => 2
   );
   for WiFiDirectConfigurationMethod'Size use 32;
   
   type WiFiDirectConfigurationMethod_Ptr is access WiFiDirectConfigurationMethod;
   
   type WiFiDirectPairingProcedure is (
      GroupOwnerNegotiation,
      Invitation
   );
   for WiFiDirectPairingProcedure use (
      GroupOwnerNegotiation => 0,
      Invitation => 1
   );
   for WiFiDirectPairingProcedure'Size use 32;
   
   type WiFiDirectPairingProcedure_Ptr is access WiFiDirectPairingProcedure;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IWiFiDirectDevice_Interface;
   type AsyncOperationCompletedHandler_IWiFiDirectDevice is access all AsyncOperationCompletedHandler_IWiFiDirectDevice_Interface'Class;
   type AsyncOperationCompletedHandler_IWiFiDirectDevice_Ptr is access all AsyncOperationCompletedHandler_IWiFiDirectDevice;
   type TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged_Interface;
   type TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged is access all TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged_Interface'Class;
   type TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged_Ptr is access all TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged;
   type TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged_Interface;
   type TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged is access all TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged_Interface'Class;
   type TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged_Ptr is access all TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged;
   type TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested_Interface;
   type TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested is access all TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested_Interface'Class;
   type TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested_Ptr is access all TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWiFiDirectDeviceStatics_Interface;
   type IWiFiDirectDeviceStatics is access all IWiFiDirectDeviceStatics_Interface'Class;
   type IWiFiDirectDeviceStatics_Ptr is access all IWiFiDirectDeviceStatics;
   type IWiFiDirectDeviceStatics2_Interface;
   type IWiFiDirectDeviceStatics2 is access all IWiFiDirectDeviceStatics2_Interface'Class;
   type IWiFiDirectDeviceStatics2_Ptr is access all IWiFiDirectDeviceStatics2;
   type IWiFiDirectDevice_Interface;
   type IWiFiDirectDevice is access all IWiFiDirectDevice_Interface'Class;
   type IWiFiDirectDevice_Ptr is access all IWiFiDirectDevice;
   type IWiFiDirectInformationElementStatics_Interface;
   type IWiFiDirectInformationElementStatics is access all IWiFiDirectInformationElementStatics_Interface'Class;
   type IWiFiDirectInformationElementStatics_Ptr is access all IWiFiDirectInformationElementStatics;
   type IWiFiDirectInformationElement_Interface;
   type IWiFiDirectInformationElement is access all IWiFiDirectInformationElement_Interface'Class;
   type IWiFiDirectInformationElement_Ptr is access all IWiFiDirectInformationElement;
   type IWiFiDirectLegacySettings_Interface;
   type IWiFiDirectLegacySettings is access all IWiFiDirectLegacySettings_Interface'Class;
   type IWiFiDirectLegacySettings_Ptr is access all IWiFiDirectLegacySettings;
   type IWiFiDirectAdvertisement_Interface;
   type IWiFiDirectAdvertisement is access all IWiFiDirectAdvertisement_Interface'Class;
   type IWiFiDirectAdvertisement_Ptr is access all IWiFiDirectAdvertisement;
   type IWiFiDirectAdvertisement2_Interface;
   type IWiFiDirectAdvertisement2 is access all IWiFiDirectAdvertisement2_Interface'Class;
   type IWiFiDirectAdvertisement2_Ptr is access all IWiFiDirectAdvertisement2;
   type IWiFiDirectAdvertisementPublisherStatusChangedEventArgs_Interface;
   type IWiFiDirectAdvertisementPublisherStatusChangedEventArgs is access all IWiFiDirectAdvertisementPublisherStatusChangedEventArgs_Interface'Class;
   type IWiFiDirectAdvertisementPublisherStatusChangedEventArgs_Ptr is access all IWiFiDirectAdvertisementPublisherStatusChangedEventArgs;
   type IWiFiDirectAdvertisementPublisher_Interface;
   type IWiFiDirectAdvertisementPublisher is access all IWiFiDirectAdvertisementPublisher_Interface'Class;
   type IWiFiDirectAdvertisementPublisher_Ptr is access all IWiFiDirectAdvertisementPublisher;
   type IWiFiDirectConnectionParametersStatics_Interface;
   type IWiFiDirectConnectionParametersStatics is access all IWiFiDirectConnectionParametersStatics_Interface'Class;
   type IWiFiDirectConnectionParametersStatics_Ptr is access all IWiFiDirectConnectionParametersStatics;
   type IWiFiDirectConnectionParameters_Interface;
   type IWiFiDirectConnectionParameters is access all IWiFiDirectConnectionParameters_Interface'Class;
   type IWiFiDirectConnectionParameters_Ptr is access all IWiFiDirectConnectionParameters;
   type IWiFiDirectConnectionParameters2_Interface;
   type IWiFiDirectConnectionParameters2 is access all IWiFiDirectConnectionParameters2_Interface'Class;
   type IWiFiDirectConnectionParameters2_Ptr is access all IWiFiDirectConnectionParameters2;
   type IWiFiDirectConnectionRequest_Interface;
   type IWiFiDirectConnectionRequest is access all IWiFiDirectConnectionRequest_Interface'Class;
   type IWiFiDirectConnectionRequest_Ptr is access all IWiFiDirectConnectionRequest;
   type IWiFiDirectConnectionRequestedEventArgs_Interface;
   type IWiFiDirectConnectionRequestedEventArgs is access all IWiFiDirectConnectionRequestedEventArgs_Interface'Class;
   type IWiFiDirectConnectionRequestedEventArgs_Ptr is access all IWiFiDirectConnectionRequestedEventArgs;
   type IWiFiDirectConnectionListener_Interface;
   type IWiFiDirectConnectionListener is access all IWiFiDirectConnectionListener_Interface'Class;
   type IWiFiDirectConnectionListener_Ptr is access all IWiFiDirectConnectionListener;
   type IDevicePairingSettings_Imported_Interface;
   type IDevicePairingSettings_Imported is access all IDevicePairingSettings_Imported_Interface'Class;
   type IDevicePairingSettings_Imported_Ptr is access all IDevicePairingSettings_Imported;
   type IAsyncOperation_IWiFiDirectDevice_Interface;
   type IAsyncOperation_IWiFiDirectDevice is access all IAsyncOperation_IWiFiDirectDevice_Interface'Class;
   type IAsyncOperation_IWiFiDirectDevice_Ptr is access all IAsyncOperation_IWiFiDirectDevice;
   type IIterator_IWiFiDirectInformationElement_Interface;
   type IIterator_IWiFiDirectInformationElement is access all IIterator_IWiFiDirectInformationElement_Interface'Class;
   type IIterator_IWiFiDirectInformationElement_Ptr is access all IIterator_IWiFiDirectInformationElement;
   type IIterable_IWiFiDirectInformationElement_Interface;
   type IIterable_IWiFiDirectInformationElement is access all IIterable_IWiFiDirectInformationElement_Interface'Class;
   type IIterable_IWiFiDirectInformationElement_Ptr is access all IIterable_IWiFiDirectInformationElement;
   type IVectorView_IWiFiDirectInformationElement_Interface;
   type IVectorView_IWiFiDirectInformationElement is access all IVectorView_IWiFiDirectInformationElement_Interface'Class;
   type IVectorView_IWiFiDirectInformationElement_Ptr is access all IVectorView_IWiFiDirectInformationElement;
   type IVector_IWiFiDirectInformationElement_Interface;
   type IVector_IWiFiDirectInformationElement is access all IVector_IWiFiDirectInformationElement_Interface'Class;
   type IVector_IWiFiDirectInformationElement_Ptr is access all IVector_IWiFiDirectInformationElement;
   type IIterator_WiFiDirectConfigurationMethod_Interface;
   type IIterator_WiFiDirectConfigurationMethod is access all IIterator_WiFiDirectConfigurationMethod_Interface'Class;
   type IIterator_WiFiDirectConfigurationMethod_Ptr is access all IIterator_WiFiDirectConfigurationMethod;
   type IIterable_WiFiDirectConfigurationMethod_Interface;
   type IIterable_WiFiDirectConfigurationMethod is access all IIterable_WiFiDirectConfigurationMethod_Interface'Class;
   type IIterable_WiFiDirectConfigurationMethod_Ptr is access all IIterable_WiFiDirectConfigurationMethod;
   type IVectorView_WiFiDirectConfigurationMethod_Interface;
   type IVectorView_WiFiDirectConfigurationMethod is access all IVectorView_WiFiDirectConfigurationMethod_Interface'Class;
   type IVectorView_WiFiDirectConfigurationMethod_Ptr is access all IVectorView_WiFiDirectConfigurationMethod;
   type IVector_WiFiDirectConfigurationMethod_Interface;
   type IVector_WiFiDirectConfigurationMethod is access all IVector_WiFiDirectConfigurationMethod_Interface'Class;
   type IVector_WiFiDirectConfigurationMethod_Ptr is access all IVector_WiFiDirectConfigurationMethod;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectDeviceStatics : aliased constant Windows.IID := (3899438460, 15020, 18513, (167, 146, 72, 42, 175, 147, 27, 4 ));
   
   type IWiFiDirectDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IWiFiDirectDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IWiFiDirectDeviceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectDeviceStatics2 : aliased constant Windows.IID := (445988425, 45315, 17278, (146, 38, 171, 103, 151, 19, 66, 249 ));
   
   type IWiFiDirectDeviceStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IWiFiDirectDeviceStatics2_Interface
      ; type_x : Windows.Devices.WiFiDirect.WiFiDirectDeviceSelectorType
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IWiFiDirectDeviceStatics2_Interface
      ; deviceId : Windows.String
      ; connectionParameters : Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters
      ; RetVal : access Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectDevice : aliased constant Windows.IID := (1927195304, 29419, 19886, (138, 40, 133, 19, 53, 93, 39, 119 ));
   
   type IWiFiDirectDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConnectionStatus
   (
      This       : access IWiFiDirectDevice_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.WiFiDirectConnectionStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access IWiFiDirectDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_ConnectionStatusChanged
   (
      This       : access IWiFiDirectDevice_Interface
      ; handler : TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ConnectionStatusChanged
   (
      This       : access IWiFiDirectDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetConnectionEndpointPairs
   (
      This       : access IWiFiDirectDevice_Interface
      ; RetVal : access Windows.Networking.IVectorView_IEndpointPair -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectInformationElementStatics : aliased constant Windows.IID := (3687853846, 4517, 20064, (140, 170, 52, 119, 33, 72, 55, 138 ));
   
   type IWiFiDirectInformationElementStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromBuffer
   (
      This       : access IWiFiDirectInformationElementStatics_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.WiFiDirect.IVector_IWiFiDirectInformationElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromDeviceInformation
   (
      This       : access IWiFiDirectInformationElementStatics_Interface
      ; deviceInformation : Windows.Devices.Enumeration.IDeviceInformation
      ; RetVal : access Windows.Devices.WiFiDirect.IVector_IWiFiDirectInformationElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectInformationElement : aliased constant Windows.IID := (2952491734, 30395, 18814, (172, 139, 220, 114, 131, 139, 195, 9 ));
   
   type IWiFiDirectInformationElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Oui
   (
      This       : access IWiFiDirectInformationElement_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_Oui
   (
      This       : access IWiFiDirectInformationElement_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_OuiType
   (
      This       : access IWiFiDirectInformationElement_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_OuiType
   (
      This       : access IWiFiDirectInformationElement_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IWiFiDirectInformationElement_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IWiFiDirectInformationElement_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectLegacySettings : aliased constant Windows.IID := (2790251450, 62205, 17767, (169, 27, 245, 194, 245, 50, 16, 87 ));
   
   type IWiFiDirectLegacySettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabled
   (
      This       : access IWiFiDirectLegacySettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access IWiFiDirectLegacySettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Ssid
   (
      This       : access IWiFiDirectLegacySettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Ssid
   (
      This       : access IWiFiDirectLegacySettings_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Passphrase
   (
      This       : access IWiFiDirectLegacySettings_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_Passphrase
   (
      This       : access IWiFiDirectLegacySettings_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectAdvertisement : aliased constant Windows.IID := (2874219053, 10758, 18849, (165, 132, 97, 67, 92, 121, 5, 166 ));
   
   type IWiFiDirectAdvertisement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InformationElements
   (
      This       : access IWiFiDirectAdvertisement_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IVector_IWiFiDirectInformationElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_InformationElements
   (
      This       : access IWiFiDirectAdvertisement_Interface
      ; value : Windows.Devices.WiFiDirect.IVector_IWiFiDirectInformationElement
   )
   return Windows.HRESULT is abstract;
   
   function get_ListenStateDiscoverability
   (
      This       : access IWiFiDirectAdvertisement_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.WiFiDirectAdvertisementListenStateDiscoverability
   )
   return Windows.HRESULT is abstract;
   
   function put_ListenStateDiscoverability
   (
      This       : access IWiFiDirectAdvertisement_Interface
      ; value : Windows.Devices.WiFiDirect.WiFiDirectAdvertisementListenStateDiscoverability
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAutonomousGroupOwnerEnabled
   (
      This       : access IWiFiDirectAdvertisement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAutonomousGroupOwnerEnabled
   (
      This       : access IWiFiDirectAdvertisement_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LegacySettings
   (
      This       : access IWiFiDirectAdvertisement_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IWiFiDirectLegacySettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectAdvertisement2 : aliased constant Windows.IID := (3076106822, 55318, 18715, (145, 122, 180, 13, 125, 196, 3, 162 ));
   
   type IWiFiDirectAdvertisement2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportedConfigurationMethods
   (
      This       : access IWiFiDirectAdvertisement2_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IVector_WiFiDirectConfigurationMethod -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs : aliased constant Windows.IID := (2868766012, 21633, 18150, (144, 221, 50, 17, 101, 24, 241, 146 ));
   
   type IWiFiDirectAdvertisementPublisherStatusChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IWiFiDirectAdvertisementPublisherStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.WiFiDirectAdvertisementPublisherStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Error
   (
      This       : access IWiFiDirectAdvertisementPublisherStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.WiFiDirectError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectAdvertisementPublisher : aliased constant Windows.IID := (3009031450, 39711, 17881, (146, 90, 105, 77, 102, 223, 104, 239 ));
   
   type IWiFiDirectAdvertisementPublisher_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Advertisement
   (
      This       : access IWiFiDirectAdvertisementPublisher_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IWiFiDirectAdvertisement
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IWiFiDirectAdvertisementPublisher_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.WiFiDirectAdvertisementPublisherStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusChanged
   (
      This       : access IWiFiDirectAdvertisementPublisher_Interface
      ; handler : TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusChanged
   (
      This       : access IWiFiDirectAdvertisementPublisher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IWiFiDirectAdvertisementPublisher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IWiFiDirectAdvertisementPublisher_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectConnectionParametersStatics : aliased constant Windows.IID := (1502278803, 30274, 17775, (185, 216, 232, 169, 235, 31, 64, 26 ));
   
   type IWiFiDirectConnectionParametersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDevicePairingKinds
   (
      This       : access IWiFiDirectConnectionParametersStatics_Interface
      ; configurationMethod : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
      ; RetVal : access Windows.Devices.Enumeration.DevicePairingKinds
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectConnectionParameters : aliased constant Windows.IID := (3001373701, 22274, 19222, (160, 44, 187, 205, 33, 239, 96, 152 ));
   
   type IWiFiDirectConnectionParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GroupOwnerIntent
   (
      This       : access IWiFiDirectConnectionParameters_Interface
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function put_GroupOwnerIntent
   (
      This       : access IWiFiDirectConnectionParameters_Interface
      ; value : Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectConnectionParameters2 : aliased constant Windows.IID := (2872774590, 43650, 17588, (136, 200, 227, 5, 107, 137, 128, 29 ));
   
   type IWiFiDirectConnectionParameters2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreferenceOrderedConfigurationMethods
   (
      This       : access IWiFiDirectConnectionParameters2_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IVector_WiFiDirectConfigurationMethod -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferredPairingProcedure
   (
      This       : access IWiFiDirectConnectionParameters2_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.WiFiDirectPairingProcedure
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferredPairingProcedure
   (
      This       : access IWiFiDirectConnectionParameters2_Interface
      ; value : Windows.Devices.WiFiDirect.WiFiDirectPairingProcedure
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectConnectionRequest : aliased constant Windows.IID := (2394527237, 37199, 18883, (166, 20, 209, 141, 197, 177, 155, 67 ));
   
   type IWiFiDirectConnectionRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceInformation
   (
      This       : access IWiFiDirectConnectionRequest_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectConnectionRequestedEventArgs : aliased constant Windows.IID := (4187824318, 54157, 18511, (130, 21, 231, 182, 90, 191, 36, 76 ));
   
   type IWiFiDirectConnectionRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetConnectionRequest
   (
      This       : access IWiFiDirectConnectionRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectConnectionListener : aliased constant Windows.IID := (1771838221, 36115, 20201, (185, 236, 156, 114, 248, 37, 31, 125 ));
   
   type IWiFiDirectConnectionListener_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ConnectionRequested
   (
      This       : access IWiFiDirectConnectionListener_Interface
      ; handler : TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ConnectionRequested
   (
      This       : access IWiFiDirectConnectionListener_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IDevicePairingSettings_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWiFiDirectDevice : aliased constant Windows.IID := (3671071585, 43053, 22124, (186, 130, 34, 76, 17, 80, 6, 105 ));
   
   type IAsyncOperation_IWiFiDirectDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWiFiDirectDevice_Interface
      ; handler : Windows.Devices.WiFiDirect.AsyncOperationCompletedHandler_IWiFiDirectDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWiFiDirectDevice_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.AsyncOperationCompletedHandler_IWiFiDirectDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWiFiDirectDevice_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IWiFiDirectDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IWiFiDirectInformationElement : aliased constant Windows.IID := (3481296934, 51477, 21822, (175, 60, 141, 164, 56, 113, 182, 147 ));
   
   type IIterator_IWiFiDirectInformationElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWiFiDirectInformationElement_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWiFiDirectInformationElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWiFiDirectInformationElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWiFiDirectInformationElement_Interface
      ; items : Windows.Devices.WiFiDirect.IWiFiDirectInformationElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWiFiDirectInformationElement : aliased constant Windows.IID := (432130638, 38241, 21075, (150, 217, 219, 175, 40, 212, 125, 137 ));
   
   type IIterable_IWiFiDirectInformationElement_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWiFiDirectInformationElement_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IIterator_IWiFiDirectInformationElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWiFiDirectInformationElement : aliased constant Windows.IID := (1842346715, 1221, 21342, (173, 212, 19, 137, 179, 190, 110, 202 ));
   
   type IVectorView_IWiFiDirectInformationElement_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWiFiDirectInformationElement_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWiFiDirectInformationElement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWiFiDirectInformationElement_Interface
      ; value : Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWiFiDirectInformationElement_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.WiFiDirect.IWiFiDirectInformationElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IWiFiDirectInformationElement : aliased constant Windows.IID := (3099939986, 58590, 23463, (132, 118, 211, 186, 181, 87, 205, 214 ));
   
   type IVector_IWiFiDirectInformationElement_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IVectorView_IWiFiDirectInformationElement
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
      ; value : Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
      ; value : Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.WiFiDirect.IWiFiDirectInformationElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IWiFiDirectInformationElement_Interface
      ; items : Windows.Devices.WiFiDirect.IWiFiDirectInformationElement_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_WiFiDirectConfigurationMethod : aliased constant Windows.IID := (538525945, 41832, 22516, (158, 242, 63, 100, 226, 67, 224, 164 ));
   
   type IIterator_WiFiDirectConfigurationMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_WiFiDirectConfigurationMethod_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_WiFiDirectConfigurationMethod_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_WiFiDirectConfigurationMethod_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_WiFiDirectConfigurationMethod_Interface
      ; items : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_WiFiDirectConfigurationMethod : aliased constant Windows.IID := (2035225306, 11718, 21111, (130, 220, 176, 120, 22, 16, 83, 123 ));
   
   type IIterable_WiFiDirectConfigurationMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_WiFiDirectConfigurationMethod_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IIterator_WiFiDirectConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_WiFiDirectConfigurationMethod : aliased constant Windows.IID := (1638082160, 1235, 21789, (173, 102, 189, 4, 233, 239, 92, 120 ));
   
   type IVectorView_WiFiDirectConfigurationMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_WiFiDirectConfigurationMethod_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_WiFiDirectConfigurationMethod_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_WiFiDirectConfigurationMethod_Interface
      ; value : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_WiFiDirectConfigurationMethod_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_WiFiDirectConfigurationMethod : aliased constant Windows.IID := (2605288384, 46196, 21895, (182, 92, 230, 0, 150, 95, 143, 208 ));
   
   type IVector_WiFiDirectConfigurationMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.IVectorView_WiFiDirectConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
      ; value : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
      ; value : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_WiFiDirectConfigurationMethod_Interface
      ; items : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWiFiDirectDevice : aliased constant Windows.IID := (3544890903, 64281, 22462, (188, 65, 14, 184, 61, 234, 21, 28 ));
   
   type AsyncOperationCompletedHandler_IWiFiDirectDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWiFiDirectDevice'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWiFiDirectDevice_Interface
      ; asyncInfo : Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged : aliased constant Windows.IID := (2450035354, 10812, 20653, (170, 8, 160, 169, 134, 237, 186, 190 ));
   
   type TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.WiFiDirect.IWiFiDirectDevice ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged_Interface
      ; sender : Windows.Devices.WiFiDirect.IWiFiDirectDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged : aliased constant Windows.IID := (3732130727, 14093, 21772, (178, 58, 83, 221, 11, 78, 72, 13 ));
   
   type TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher ; args : Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged_Interface
      ; sender : Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher
      ; args : Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested : aliased constant Windows.IID := (3494577155, 8162, 21295, (142, 71, 72, 35, 161, 78, 98, 79 ));
   
   type TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested_Interface(Callback : access procedure (sender : Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener ; args : Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested_Interface
      ; sender : Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener
      ; args : Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WiFiDirectDevice is Windows.Devices.WiFiDirect.IWiFiDirectDevice;
   subtype WiFiDirectConnectionParameters is Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters;
   function Create return Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters;
   
   subtype WiFiDirectInformationElement is Windows.Devices.WiFiDirect.IWiFiDirectInformationElement;
   function Create return Windows.Devices.WiFiDirect.IWiFiDirectInformationElement;
   
   subtype WiFiDirectLegacySettings is Windows.Devices.WiFiDirect.IWiFiDirectLegacySettings;
   subtype WiFiDirectAdvertisement is Windows.Devices.WiFiDirect.IWiFiDirectAdvertisement;
   subtype WiFiDirectAdvertisementPublisherStatusChangedEventArgs is Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs;
   subtype WiFiDirectAdvertisementPublisher is Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher;
   function Create return Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher;
   
   subtype WiFiDirectConnectionRequest is Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequest;
   subtype WiFiDirectConnectionRequestedEventArgs is Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs;
   subtype WiFiDirectConnectionListener is Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener;
   function Create return Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice;
   
   function GetDeviceSelector
   (
      type_x : Windows.Devices.WiFiDirect.WiFiDirectDeviceSelectorType
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
      ; connectionParameters : Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters
   )
   return Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice;
   
   function GetDevicePairingKinds
   (
      configurationMethod : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
   )
   return Windows.Devices.Enumeration.DevicePairingKinds;
   
   function CreateFromBuffer
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.WiFiDirect.IVector_IWiFiDirectInformationElement;
   
   function CreateFromDeviceInformation
   (
      deviceInformation : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Devices.WiFiDirect.IVector_IWiFiDirectInformationElement;
   
end;
