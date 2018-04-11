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
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Networking.Connectivity;
limited with Windows.Security.Credentials;
--------------------------------------------------------------------------------
package Windows.Devices.WiFi is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WiFiNetworkKind is (
      Any,
      Infrastructure,
      Adhoc
   );
   for WiFiNetworkKind use (
      Any => 0,
      Infrastructure => 1,
      Adhoc => 2
   );
   for WiFiNetworkKind'Size use 32;
   
   type WiFiNetworkKind_Ptr is access WiFiNetworkKind;
   
   type WiFiPhyKind is (
      Unknown,
      Fhss,
      Dsss,
      IRBaseband,
      Ofdm,
      Hrdsss,
      Erp,
      HT,
      Vht,
      Dmg
   );
   for WiFiPhyKind use (
      Unknown => 0,
      Fhss => 1,
      Dsss => 2,
      IRBaseband => 3,
      Ofdm => 4,
      Hrdsss => 5,
      Erp => 6,
      HT => 7,
      Vht => 8,
      Dmg => 9
   );
   for WiFiPhyKind'Size use 32;
   
   type WiFiPhyKind_Ptr is access WiFiPhyKind;
   
   type WiFiAccessStatus is (
      Unspecified,
      Allowed,
      DeniedByUser,
      DeniedBySystem
   );
   for WiFiAccessStatus use (
      Unspecified => 0,
      Allowed => 1,
      DeniedByUser => 2,
      DeniedBySystem => 3
   );
   for WiFiAccessStatus'Size use 32;
   
   type WiFiAccessStatus_Ptr is access WiFiAccessStatus;
   
   type WiFiReconnectionKind is (
      Automatic,
      Manual
   );
   for WiFiReconnectionKind use (
      Automatic => 0,
      Manual => 1
   );
   for WiFiReconnectionKind'Size use 32;
   
   type WiFiReconnectionKind_Ptr is access WiFiReconnectionKind;
   
   type WiFiConnectionStatus is (
      UnspecifiedFailure,
      Success,
      AccessRevoked,
      InvalidCredential,
      NetworkNotAvailable,
      Timeout,
      UnsupportedAuthenticationProtocol
   );
   for WiFiConnectionStatus use (
      UnspecifiedFailure => 0,
      Success => 1,
      AccessRevoked => 2,
      InvalidCredential => 3,
      NetworkNotAvailable => 4,
      Timeout => 5,
      UnsupportedAuthenticationProtocol => 6
   );
   for WiFiConnectionStatus'Size use 32;
   
   type WiFiConnectionStatus_Ptr is access WiFiConnectionStatus;
   
   type WiFiConnectionMethod is (
      Default,
      WpsPin,
      WpsPushButton
   );
   for WiFiConnectionMethod use (
      Default => 0,
      WpsPin => 1,
      WpsPushButton => 2
   );
   for WiFiConnectionMethod'Size use 32;
   
   type WiFiConnectionMethod_Ptr is access WiFiConnectionMethod;
   
   type WiFiWpsKind is (
      Unknown,
      Pin,
      PushButton,
      Nfc,
      Ethernet,
      Usb
   );
   for WiFiWpsKind use (
      Unknown => 0,
      Pin => 1,
      PushButton => 2,
      Nfc => 3,
      Ethernet => 4,
      Usb => 5
   );
   for WiFiWpsKind'Size use 32;
   
   type WiFiWpsKind_Ptr is access WiFiWpsKind;
   
   type WiFiWpsConfigurationStatus is (
      UnspecifiedFailure,
      Success,
      Timeout
   );
   for WiFiWpsConfigurationStatus use (
      UnspecifiedFailure => 0,
      Success => 1,
      Timeout => 2
   );
   for WiFiWpsConfigurationStatus'Size use 32;
   
   type WiFiWpsConfigurationStatus_Ptr is access WiFiWpsConfigurationStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IWiFiAdapter_Interface;
   type AsyncOperationCompletedHandler_IWiFiAdapter is access all AsyncOperationCompletedHandler_IWiFiAdapter_Interface'Class;
   type AsyncOperationCompletedHandler_IWiFiAdapter_Ptr is access all AsyncOperationCompletedHandler_IWiFiAdapter;
   type AsyncOperationCompletedHandler_WiFiAccessStatus_Interface;
   type AsyncOperationCompletedHandler_WiFiAccessStatus is access all AsyncOperationCompletedHandler_WiFiAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_WiFiAccessStatus_Ptr is access all AsyncOperationCompletedHandler_WiFiAccessStatus;
   type TypedEventHandler_IWiFiAdapter_add_AvailableNetworksChanged_Interface;
   type TypedEventHandler_IWiFiAdapter_add_AvailableNetworksChanged is access all TypedEventHandler_IWiFiAdapter_add_AvailableNetworksChanged_Interface'Class;
   type TypedEventHandler_IWiFiAdapter_add_AvailableNetworksChanged_Ptr is access all TypedEventHandler_IWiFiAdapter_add_AvailableNetworksChanged;
   type AsyncOperationCompletedHandler_IWiFiConnectionResult_Interface;
   type AsyncOperationCompletedHandler_IWiFiConnectionResult is access all AsyncOperationCompletedHandler_IWiFiConnectionResult_Interface'Class;
   type AsyncOperationCompletedHandler_IWiFiConnectionResult_Ptr is access all AsyncOperationCompletedHandler_IWiFiConnectionResult;
   type AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult_Interface;
   type AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult is access all AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult_Ptr is access all AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWiFiAdapterStatics_Interface;
   type IWiFiAdapterStatics is access all IWiFiAdapterStatics_Interface'Class;
   type IWiFiAdapterStatics_Ptr is access all IWiFiAdapterStatics;
   type IWiFiAdapter_Interface;
   type IWiFiAdapter is access all IWiFiAdapter_Interface'Class;
   type IWiFiAdapter_Ptr is access all IWiFiAdapter;
   type IWiFiAdapter2_Interface;
   type IWiFiAdapter2 is access all IWiFiAdapter2_Interface'Class;
   type IWiFiAdapter2_Ptr is access all IWiFiAdapter2;
   type IWiFiNetworkReport_Interface;
   type IWiFiNetworkReport is access all IWiFiNetworkReport_Interface'Class;
   type IWiFiNetworkReport_Ptr is access all IWiFiNetworkReport;
   type IWiFiAvailableNetwork_Interface;
   type IWiFiAvailableNetwork is access all IWiFiAvailableNetwork_Interface'Class;
   type IWiFiAvailableNetwork_Ptr is access all IWiFiAvailableNetwork;
   type IWiFiWpsConfigurationResult_Interface;
   type IWiFiWpsConfigurationResult is access all IWiFiWpsConfigurationResult_Interface'Class;
   type IWiFiWpsConfigurationResult_Ptr is access all IWiFiWpsConfigurationResult;
   type IWiFiConnectionResult_Interface;
   type IWiFiConnectionResult is access all IWiFiConnectionResult_Interface'Class;
   type IWiFiConnectionResult_Ptr is access all IWiFiConnectionResult;
   type IAsyncOperation_IWiFiAdapter_Interface;
   type IAsyncOperation_IWiFiAdapter is access all IAsyncOperation_IWiFiAdapter_Interface'Class;
   type IAsyncOperation_IWiFiAdapter_Ptr is access all IAsyncOperation_IWiFiAdapter;
   type IAsyncOperation_WiFiAccessStatus_Interface;
   type IAsyncOperation_WiFiAccessStatus is access all IAsyncOperation_WiFiAccessStatus_Interface'Class;
   type IAsyncOperation_WiFiAccessStatus_Ptr is access all IAsyncOperation_WiFiAccessStatus;
   type IAsyncOperation_IWiFiConnectionResult_Interface;
   type IAsyncOperation_IWiFiConnectionResult is access all IAsyncOperation_IWiFiConnectionResult_Interface'Class;
   type IAsyncOperation_IWiFiConnectionResult_Ptr is access all IAsyncOperation_IWiFiConnectionResult;
   type IAsyncOperation_IWiFiWpsConfigurationResult_Interface;
   type IAsyncOperation_IWiFiWpsConfigurationResult is access all IAsyncOperation_IWiFiWpsConfigurationResult_Interface'Class;
   type IAsyncOperation_IWiFiWpsConfigurationResult_Ptr is access all IAsyncOperation_IWiFiWpsConfigurationResult;
   type IIterator_IWiFiAvailableNetwork_Interface;
   type IIterator_IWiFiAvailableNetwork is access all IIterator_IWiFiAvailableNetwork_Interface'Class;
   type IIterator_IWiFiAvailableNetwork_Ptr is access all IIterator_IWiFiAvailableNetwork;
   type IIterable_IWiFiAvailableNetwork_Interface;
   type IIterable_IWiFiAvailableNetwork is access all IIterable_IWiFiAvailableNetwork_Interface'Class;
   type IIterable_IWiFiAvailableNetwork_Ptr is access all IIterable_IWiFiAvailableNetwork;
   type IVectorView_IWiFiAvailableNetwork_Interface;
   type IVectorView_IWiFiAvailableNetwork is access all IVectorView_IWiFiAvailableNetwork_Interface'Class;
   type IVectorView_IWiFiAvailableNetwork_Ptr is access all IVectorView_IWiFiAvailableNetwork;
   type IIterator_WiFiWpsKind_Interface;
   type IIterator_WiFiWpsKind is access all IIterator_WiFiWpsKind_Interface'Class;
   type IIterator_WiFiWpsKind_Ptr is access all IIterator_WiFiWpsKind;
   type IIterable_WiFiWpsKind_Interface;
   type IIterable_WiFiWpsKind is access all IIterable_WiFiWpsKind_Interface'Class;
   type IIterable_WiFiWpsKind_Ptr is access all IIterable_WiFiWpsKind;
   type IVectorView_WiFiWpsKind_Interface;
   type IVectorView_WiFiWpsKind is access all IVectorView_WiFiWpsKind_Interface'Class;
   type IVectorView_WiFiWpsKind_Ptr is access all IVectorView_WiFiWpsKind;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IWiFiAdapterStatics : aliased constant Windows.IID := (3659922909, 53836, 17379, (170, 189, 196, 101, 159, 115, 15, 153 ));
   
   type IWiFiAdapterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAllAdaptersAsync
   (
      This       : access IWiFiAdapterStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IWiFiAdapterStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IWiFiAdapterStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.WiFi.IAsyncOperation_IWiFiAdapter -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IWiFiAdapterStatics_Interface
      ; RetVal : access Windows.Devices.WiFi.IAsyncOperation_WiFiAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiAdapter : aliased constant Windows.IID := (2797921315, 15733, 17316, (185, 222, 17, 226, 107, 114, 217, 176 ));
   
   type IWiFiAdapter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkAdapter
   (
      This       : access IWiFiAdapter_Interface
      ; RetVal : access Windows.Networking.Connectivity.INetworkAdapter
   )
   return Windows.HRESULT is abstract;
   
   function ScanAsync
   (
      This       : access IWiFiAdapter_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkReport
   (
      This       : access IWiFiAdapter_Interface
      ; RetVal : access Windows.Devices.WiFi.IWiFiNetworkReport
   )
   return Windows.HRESULT is abstract;
   
   function add_AvailableNetworksChanged
   (
      This       : access IWiFiAdapter_Interface
      ; args : TypedEventHandler_IWiFiAdapter_add_AvailableNetworksChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AvailableNetworksChanged
   (
      This       : access IWiFiAdapter_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function ConnectAsync
   (
      This       : access IWiFiAdapter_Interface
      ; availableNetwork : Windows.Devices.WiFi.IWiFiAvailableNetwork
      ; reconnectionKind : Windows.Devices.WiFi.WiFiReconnectionKind
      ; RetVal : access Windows.Devices.WiFi.IAsyncOperation_IWiFiConnectionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConnectWithPasswordCredentialAsync
   (
      This       : access IWiFiAdapter_Interface
      ; availableNetwork : Windows.Devices.WiFi.IWiFiAvailableNetwork
      ; reconnectionKind : Windows.Devices.WiFi.WiFiReconnectionKind
      ; passwordCredential : Windows.Security.Credentials.IPasswordCredential
      ; RetVal : access Windows.Devices.WiFi.IAsyncOperation_IWiFiConnectionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConnectWithPasswordCredentialAndSsidAsync
   (
      This       : access IWiFiAdapter_Interface
      ; availableNetwork : Windows.Devices.WiFi.IWiFiAvailableNetwork
      ; reconnectionKind : Windows.Devices.WiFi.WiFiReconnectionKind
      ; passwordCredential : Windows.Security.Credentials.IPasswordCredential
      ; ssid : Windows.String
      ; RetVal : access Windows.Devices.WiFi.IAsyncOperation_IWiFiConnectionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Disconnect
   (
      This       : access IWiFiAdapter_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiAdapter2 : aliased constant Windows.IID := (1539592221, 33252, 17725, (148, 48, 31, 202, 251, 173, 214, 182 ));
   
   type IWiFiAdapter2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetWpsConfigurationAsync
   (
      This       : access IWiFiAdapter2_Interface
      ; availableNetwork : Windows.Devices.WiFi.IWiFiAvailableNetwork
      ; RetVal : access Windows.Devices.WiFi.IAsyncOperation_IWiFiWpsConfigurationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConnectWithPasswordCredentialAndSsidAndConnectionMethodAsync
   (
      This       : access IWiFiAdapter2_Interface
      ; availableNetwork : Windows.Devices.WiFi.IWiFiAvailableNetwork
      ; reconnectionKind : Windows.Devices.WiFi.WiFiReconnectionKind
      ; passwordCredential : Windows.Security.Credentials.IPasswordCredential
      ; ssid : Windows.String
      ; connectionMethod : Windows.Devices.WiFi.WiFiConnectionMethod
      ; RetVal : access Windows.Devices.WiFi.IAsyncOperation_IWiFiConnectionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiNetworkReport : aliased constant Windows.IID := (2502221522, 22801, 17502, (129, 148, 190, 79, 26, 112, 72, 149 ));
   
   type IWiFiNetworkReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IWiFiNetworkReport_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_AvailableNetworks
   (
      This       : access IWiFiNetworkReport_Interface
      ; RetVal : access Windows.Devices.WiFi.IVectorView_IWiFiAvailableNetwork -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiAvailableNetwork : aliased constant Windows.IID := (652829254, 6206, 18180, (152, 38, 113, 180, 162, 240, 246, 104 ));
   
   type IWiFiAvailableNetwork_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uptime
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Ssid
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Bssid
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ChannelCenterFrequencyInKilohertz
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkRssiInDecibelMilliwatts
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SignalBars
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkKind
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Devices.WiFi.WiFiNetworkKind
   )
   return Windows.HRESULT is abstract;
   
   function get_PhyKind
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Devices.WiFi.WiFiPhyKind
   )
   return Windows.HRESULT is abstract;
   
   function get_SecuritySettings
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Networking.Connectivity.INetworkSecuritySettings
   )
   return Windows.HRESULT is abstract;
   
   function get_BeaconInterval
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IsWiFiDirect
   (
      This       : access IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiWpsConfigurationResult : aliased constant Windows.IID := (1739888753, 6126, 17105, (177, 79, 90, 17, 241, 34, 111, 181 ));
   
   type IWiFiWpsConfigurationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IWiFiWpsConfigurationResult_Interface
      ; RetVal : access Windows.Devices.WiFi.WiFiWpsConfigurationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedWpsKinds
   (
      This       : access IWiFiWpsConfigurationResult_Interface
      ; RetVal : access Windows.Devices.WiFi.IVectorView_WiFiWpsKind -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiConnectionResult : aliased constant Windows.IID := (339468249, 50045, 16574, (165, 200, 133, 123, 206, 133, 169, 49 ));
   
   type IWiFiConnectionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConnectionStatus
   (
      This       : access IWiFiConnectionResult_Interface
      ; RetVal : access Windows.Devices.WiFi.WiFiConnectionStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWiFiAdapter : aliased constant Windows.IID := (500134813, 4279, 23017, (171, 71, 139, 2, 119, 226, 1, 147 ));
   
   type IAsyncOperation_IWiFiAdapter_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWiFiAdapter_Interface
      ; handler : Windows.Devices.WiFi.AsyncOperationCompletedHandler_IWiFiAdapter
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWiFiAdapter_Interface
      ; RetVal : access Windows.Devices.WiFi.AsyncOperationCompletedHandler_IWiFiAdapter
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWiFiAdapter_Interface
      ; RetVal : access Windows.Devices.WiFi.IWiFiAdapter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_WiFiAccessStatus : aliased constant Windows.IID := (4173814330, 29594, 22442, (152, 109, 31, 118, 4, 215, 227, 134 ));
   
   type IAsyncOperation_WiFiAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_WiFiAccessStatus_Interface
      ; handler : Windows.Devices.WiFi.AsyncOperationCompletedHandler_WiFiAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_WiFiAccessStatus_Interface
      ; RetVal : access Windows.Devices.WiFi.AsyncOperationCompletedHandler_WiFiAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_WiFiAccessStatus_Interface
      ; RetVal : access Windows.Devices.WiFi.WiFiAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWiFiConnectionResult : aliased constant Windows.IID := (4288945993, 19504, 20691, (149, 73, 228, 240, 85, 180, 23, 180 ));
   
   type IAsyncOperation_IWiFiConnectionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWiFiConnectionResult_Interface
      ; handler : Windows.Devices.WiFi.AsyncOperationCompletedHandler_IWiFiConnectionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWiFiConnectionResult_Interface
      ; RetVal : access Windows.Devices.WiFi.AsyncOperationCompletedHandler_IWiFiConnectionResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWiFiConnectionResult_Interface
      ; RetVal : access Windows.Devices.WiFi.IWiFiConnectionResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWiFiWpsConfigurationResult : aliased constant Windows.IID := (1265769844, 649, 22588, (168, 29, 243, 190, 3, 234, 89, 109 ));
   
   type IAsyncOperation_IWiFiWpsConfigurationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWiFiWpsConfigurationResult_Interface
      ; handler : Windows.Devices.WiFi.AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWiFiWpsConfigurationResult_Interface
      ; RetVal : access Windows.Devices.WiFi.AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWiFiWpsConfigurationResult_Interface
      ; RetVal : access Windows.Devices.WiFi.IWiFiWpsConfigurationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IWiFiAvailableNetwork : aliased constant Windows.IID := (1183217604, 60345, 20886, (131, 109, 114, 250, 169, 254, 103, 62 ));
   
   type IIterator_IWiFiAvailableNetwork_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Devices.WiFi.IWiFiAvailableNetwork
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWiFiAvailableNetwork_Interface
      ; items : Windows.Devices.WiFi.IWiFiAvailableNetwork_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWiFiAvailableNetwork : aliased constant Windows.IID := (4050945258, 50974, 23870, (183, 76, 58, 14, 97, 221, 156, 32 ));
   
   type IIterable_IWiFiAvailableNetwork_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.Devices.WiFi.IIterator_IWiFiAvailableNetwork
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWiFiAvailableNetwork : aliased constant Windows.IID := (2087047814, 29317, 23907, (189, 234, 94, 249, 81, 189, 246, 24 ));
   
   type IVectorView_IWiFiAvailableNetwork_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWiFiAvailableNetwork_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.WiFi.IWiFiAvailableNetwork
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWiFiAvailableNetwork_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWiFiAvailableNetwork_Interface
      ; value : Windows.Devices.WiFi.IWiFiAvailableNetwork
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWiFiAvailableNetwork_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.WiFi.IWiFiAvailableNetwork_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_WiFiWpsKind : aliased constant Windows.IID := (2602129724, 24621, 22489, (168, 82, 164, 138, 130, 4, 255, 66 ));
   
   type IIterator_WiFiWpsKind_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_WiFiWpsKind_Interface
      ; RetVal : access Windows.Devices.WiFi.WiFiWpsKind
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_WiFiWpsKind_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_WiFiWpsKind_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_WiFiWpsKind_Interface
      ; items : Windows.Devices.WiFi.WiFiWpsKind_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_WiFiWpsKind : aliased constant Windows.IID := (1105290515, 43250, 21997, (155, 228, 86, 101, 22, 125, 73, 215 ));
   
   type IIterable_WiFiWpsKind_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_WiFiWpsKind_Interface
      ; RetVal : access Windows.Devices.WiFi.IIterator_WiFiWpsKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_WiFiWpsKind : aliased constant Windows.IID := (2867324389, 10224, 23336, (140, 88, 144, 57, 53, 109, 61, 199 ));
   
   type IVectorView_WiFiWpsKind_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_WiFiWpsKind_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.WiFi.WiFiWpsKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_WiFiWpsKind_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_WiFiWpsKind_Interface
      ; value : Windows.Devices.WiFi.WiFiWpsKind
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_WiFiWpsKind_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.WiFi.WiFiWpsKind_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWiFiAdapter : aliased constant Windows.IID := (892743541, 27310, 22029, (179, 208, 63, 174, 156, 114, 96, 168 ));
   
   type AsyncOperationCompletedHandler_IWiFiAdapter_Interface(Callback : access procedure (asyncInfo : Windows.Devices.WiFi.IAsyncOperation_IWiFiAdapter ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWiFiAdapter'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWiFiAdapter_Interface
      ; asyncInfo : Windows.Devices.WiFi.IAsyncOperation_IWiFiAdapter
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_WiFiAccessStatus : aliased constant Windows.IID := (1709738442, 63177, 23669, (190, 249, 5, 171, 136, 164, 154, 84 ));
   
   type AsyncOperationCompletedHandler_WiFiAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.WiFi.IAsyncOperation_WiFiAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_WiFiAccessStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_WiFiAccessStatus_Interface
      ; asyncInfo : Windows.Devices.WiFi.IAsyncOperation_WiFiAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWiFiAdapter_add_AvailableNetworksChanged : aliased constant Windows.IID := (4139789595, 17384, 24520, (142, 142, 238, 123, 128, 148, 182, 131 ));
   
   type TypedEventHandler_IWiFiAdapter_add_AvailableNetworksChanged_Interface(Callback : access procedure (sender : Windows.Devices.WiFi.IWiFiAdapter ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWiFiAdapter_add_AvailableNetworksChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiAdapter_add_AvailableNetworksChanged_Interface
      ; sender : Windows.Devices.WiFi.IWiFiAdapter
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWiFiConnectionResult : aliased constant Windows.IID := (4085312397, 7762, 21328, (162, 136, 134, 28, 150, 58, 132, 240 ));
   
   type AsyncOperationCompletedHandler_IWiFiConnectionResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.WiFi.IAsyncOperation_IWiFiConnectionResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWiFiConnectionResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWiFiConnectionResult_Interface
      ; asyncInfo : Windows.Devices.WiFi.IAsyncOperation_IWiFiConnectionResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult : aliased constant Windows.IID := (872035419, 10445, 22696, (188, 252, 190, 76, 253, 16, 142, 145 ));
   
   type AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.WiFi.IAsyncOperation_IWiFiWpsConfigurationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWiFiWpsConfigurationResult_Interface
      ; asyncInfo : Windows.Devices.WiFi.IAsyncOperation_IWiFiWpsConfigurationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WiFiAdapter is Windows.Devices.WiFi.IWiFiAdapter;
   subtype WiFiNetworkReport is Windows.Devices.WiFi.IWiFiNetworkReport;
   subtype WiFiAvailableNetwork is Windows.Devices.WiFi.IWiFiAvailableNetwork;
   subtype WiFiConnectionResult is Windows.Devices.WiFi.IWiFiConnectionResult;
   subtype WiFiWpsConfigurationResult is Windows.Devices.WiFi.IWiFiWpsConfigurationResult;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function FindAllAdaptersAsync
   return Windows.Address;
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.WiFi.IAsyncOperation_IWiFiAdapter;
   
   function RequestAccessAsync
   return Windows.Devices.WiFi.IAsyncOperation_WiFiAccessStatus;
   
end;
