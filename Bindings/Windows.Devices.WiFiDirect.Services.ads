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
with Windows.Foundation.Collections;
limited with Windows.Networking;
with Windows.Foundation;
limited with Windows.Networking.Sockets;
limited with Windows.Devices.Enumeration;
--------------------------------------------------------------------------------
package Windows.Devices.WiFiDirect.Services is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WiFiDirectServiceConfigurationMethod is (
      Default,
      PinDisplay,
      PinEntry
   );
   for WiFiDirectServiceConfigurationMethod use (
      Default => 0,
      PinDisplay => 1,
      PinEntry => 2
   );
   for WiFiDirectServiceConfigurationMethod'Size use 32;
   
   type WiFiDirectServiceConfigurationMethod_Ptr is access WiFiDirectServiceConfigurationMethod;
   
   type WiFiDirectServiceStatus is (
      Available,
      Busy,
      Custom
   );
   for WiFiDirectServiceStatus use (
      Available => 0,
      Busy => 1,
      Custom => 2
   );
   for WiFiDirectServiceStatus'Size use 32;
   
   type WiFiDirectServiceStatus_Ptr is access WiFiDirectServiceStatus;
   
   type WiFiDirectServiceSessionStatus is (
      Closed,
      Initiated,
      Requested,
      Open
   );
   for WiFiDirectServiceSessionStatus use (
      Closed => 0,
      Initiated => 1,
      Requested => 2,
      Open => 3
   );
   for WiFiDirectServiceSessionStatus'Size use 32;
   
   type WiFiDirectServiceSessionStatus_Ptr is access WiFiDirectServiceSessionStatus;
   
   type WiFiDirectServiceSessionErrorStatus is (
      Ok,
      Disassociated,
      LocalClose,
      RemoteClose,
      SystemFailure,
      NoResponseFromRemote
   );
   for WiFiDirectServiceSessionErrorStatus use (
      Ok => 0,
      Disassociated => 1,
      LocalClose => 2,
      RemoteClose => 3,
      SystemFailure => 4,
      NoResponseFromRemote => 5
   );
   for WiFiDirectServiceSessionErrorStatus'Size use 32;
   
   type WiFiDirectServiceSessionErrorStatus_Ptr is access WiFiDirectServiceSessionErrorStatus;
   
   type WiFiDirectServiceAdvertisementStatus is (
      Created,
      Started,
      Stopped,
      Aborted
   );
   for WiFiDirectServiceAdvertisementStatus use (
      Created => 0,
      Started => 1,
      Stopped => 2,
      Aborted => 3
   );
   for WiFiDirectServiceAdvertisementStatus'Size use 32;
   
   type WiFiDirectServiceAdvertisementStatus_Ptr is access WiFiDirectServiceAdvertisementStatus;
   
   type WiFiDirectServiceError is (
      Success,
      RadioNotAvailable,
      ResourceInUse,
      UnsupportedHardware,
      NoHardware
   );
   for WiFiDirectServiceError use (
      Success => 0,
      RadioNotAvailable => 1,
      ResourceInUse => 2,
      UnsupportedHardware => 3,
      NoHardware => 4
   );
   for WiFiDirectServiceError'Size use 32;
   
   type WiFiDirectServiceError_Ptr is access WiFiDirectServiceError;
   
   type WiFiDirectServiceIPProtocol is (
      Tcp,
      Udp
   );
   for WiFiDirectServiceIPProtocol use (
      Tcp => 6,
      Udp => 17
   );
   for WiFiDirectServiceIPProtocol'Size use 32;
   
   type WiFiDirectServiceIPProtocol_Ptr is access WiFiDirectServiceIPProtocol;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested_Interface;
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested is access all TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested_Interface'Class;
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested_Ptr is access all TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested;
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected_Interface;
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected is access all TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected_Interface'Class;
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected_Ptr is access all TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected;
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged_Interface;
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged is access all TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged_Interface'Class;
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged_Ptr is access all TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged;
   type AsyncOperationCompletedHandler_IWiFiDirectServiceSession_Interface;
   type AsyncOperationCompletedHandler_IWiFiDirectServiceSession is access all AsyncOperationCompletedHandler_IWiFiDirectServiceSession_Interface'Class;
   type AsyncOperationCompletedHandler_IWiFiDirectServiceSession_Ptr is access all AsyncOperationCompletedHandler_IWiFiDirectServiceSession;
   type AsyncOperationCompletedHandler_IWiFiDirectService_Interface;
   type AsyncOperationCompletedHandler_IWiFiDirectService is access all AsyncOperationCompletedHandler_IWiFiDirectService_Interface'Class;
   type AsyncOperationCompletedHandler_IWiFiDirectService_Ptr is access all AsyncOperationCompletedHandler_IWiFiDirectService;
   type TypedEventHandler_IWiFiDirectService_add_SessionDeferred_Interface;
   type TypedEventHandler_IWiFiDirectService_add_SessionDeferred is access all TypedEventHandler_IWiFiDirectService_add_SessionDeferred_Interface'Class;
   type TypedEventHandler_IWiFiDirectService_add_SessionDeferred_Ptr is access all TypedEventHandler_IWiFiDirectService_add_SessionDeferred;
   type AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo_Interface;
   type AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo is access all AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo_Interface'Class;
   type AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo_Ptr is access all AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo;
   type TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged_Interface;
   type TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged is access all TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged_Interface'Class;
   type TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged_Ptr is access all TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged;
   type TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded_Interface;
   type TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded is access all TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded_Interface'Class;
   type TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded_Ptr is access all TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWiFiDirectServiceProvisioningInfo_Interface;
   type IWiFiDirectServiceProvisioningInfo is access all IWiFiDirectServiceProvisioningInfo_Interface'Class;
   type IWiFiDirectServiceProvisioningInfo_Ptr is access all IWiFiDirectServiceProvisioningInfo;
   type IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs_Interface;
   type IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs is access all IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs_Interface'Class;
   type IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs_Ptr is access all IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs;
   type IWiFiDirectServiceRemotePortAddedEventArgs_Interface;
   type IWiFiDirectServiceRemotePortAddedEventArgs is access all IWiFiDirectServiceRemotePortAddedEventArgs_Interface'Class;
   type IWiFiDirectServiceRemotePortAddedEventArgs_Ptr is access all IWiFiDirectServiceRemotePortAddedEventArgs;
   type IWiFiDirectServiceSessionDeferredEventArgs_Interface;
   type IWiFiDirectServiceSessionDeferredEventArgs is access all IWiFiDirectServiceSessionDeferredEventArgs_Interface'Class;
   type IWiFiDirectServiceSessionDeferredEventArgs_Ptr is access all IWiFiDirectServiceSessionDeferredEventArgs;
   type IWiFiDirectServiceSessionRequestedEventArgs_Interface;
   type IWiFiDirectServiceSessionRequestedEventArgs is access all IWiFiDirectServiceSessionRequestedEventArgs_Interface'Class;
   type IWiFiDirectServiceSessionRequestedEventArgs_Ptr is access all IWiFiDirectServiceSessionRequestedEventArgs;
   type IWiFiDirectServiceSessionRequest_Interface;
   type IWiFiDirectServiceSessionRequest is access all IWiFiDirectServiceSessionRequest_Interface'Class;
   type IWiFiDirectServiceSessionRequest_Ptr is access all IWiFiDirectServiceSessionRequest;
   type IWiFiDirectServiceAdvertiserFactory_Interface;
   type IWiFiDirectServiceAdvertiserFactory is access all IWiFiDirectServiceAdvertiserFactory_Interface'Class;
   type IWiFiDirectServiceAdvertiserFactory_Ptr is access all IWiFiDirectServiceAdvertiserFactory;
   type IWiFiDirectServiceAdvertiser_Interface;
   type IWiFiDirectServiceAdvertiser is access all IWiFiDirectServiceAdvertiser_Interface'Class;
   type IWiFiDirectServiceAdvertiser_Ptr is access all IWiFiDirectServiceAdvertiser;
   type IWiFiDirectServiceStatics_Interface;
   type IWiFiDirectServiceStatics is access all IWiFiDirectServiceStatics_Interface'Class;
   type IWiFiDirectServiceStatics_Ptr is access all IWiFiDirectServiceStatics;
   type IWiFiDirectService_Interface;
   type IWiFiDirectService is access all IWiFiDirectService_Interface'Class;
   type IWiFiDirectService_Ptr is access all IWiFiDirectService;
   type IWiFiDirectServiceSession_Interface;
   type IWiFiDirectServiceSession is access all IWiFiDirectServiceSession_Interface'Class;
   type IWiFiDirectServiceSession_Ptr is access all IWiFiDirectServiceSession;
   type IIterator_WiFiDirectServiceConfigurationMethod_Interface;
   type IIterator_WiFiDirectServiceConfigurationMethod is access all IIterator_WiFiDirectServiceConfigurationMethod_Interface'Class;
   type IIterator_WiFiDirectServiceConfigurationMethod_Ptr is access all IIterator_WiFiDirectServiceConfigurationMethod;
   type IIterable_WiFiDirectServiceConfigurationMethod_Interface;
   type IIterable_WiFiDirectServiceConfigurationMethod is access all IIterable_WiFiDirectServiceConfigurationMethod_Interface'Class;
   type IIterable_WiFiDirectServiceConfigurationMethod_Ptr is access all IIterable_WiFiDirectServiceConfigurationMethod;
   type IVectorView_WiFiDirectServiceConfigurationMethod_Interface;
   type IVectorView_WiFiDirectServiceConfigurationMethod is access all IVectorView_WiFiDirectServiceConfigurationMethod_Interface'Class;
   type IVectorView_WiFiDirectServiceConfigurationMethod_Ptr is access all IVectorView_WiFiDirectServiceConfigurationMethod;
   type IVector_WiFiDirectServiceConfigurationMethod_Interface;
   type IVector_WiFiDirectServiceConfigurationMethod is access all IVector_WiFiDirectServiceConfigurationMethod_Interface'Class;
   type IVector_WiFiDirectServiceConfigurationMethod_Ptr is access all IVector_WiFiDirectServiceConfigurationMethod;
   type IAsyncOperation_IWiFiDirectServiceSession_Interface;
   type IAsyncOperation_IWiFiDirectServiceSession is access all IAsyncOperation_IWiFiDirectServiceSession_Interface'Class;
   type IAsyncOperation_IWiFiDirectServiceSession_Ptr is access all IAsyncOperation_IWiFiDirectServiceSession;
   type IAsyncOperation_IWiFiDirectService_Interface;
   type IAsyncOperation_IWiFiDirectService is access all IAsyncOperation_IWiFiDirectService_Interface'Class;
   type IAsyncOperation_IWiFiDirectService_Ptr is access all IAsyncOperation_IWiFiDirectService;
   type IAsyncOperation_IWiFiDirectServiceProvisioningInfo_Interface;
   type IAsyncOperation_IWiFiDirectServiceProvisioningInfo is access all IAsyncOperation_IWiFiDirectServiceProvisioningInfo_Interface'Class;
   type IAsyncOperation_IWiFiDirectServiceProvisioningInfo_Ptr is access all IAsyncOperation_IWiFiDirectServiceProvisioningInfo;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectServiceProvisioningInfo : aliased constant Windows.IID := (2346417406, 38873, 17826, (142, 153, 219, 80, 145, 15, 182, 166 ));
   
   type IWiFiDirectServiceProvisioningInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectedConfigurationMethod
   (
      This       : access IWiFiDirectServiceProvisioningInfo_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGroupFormationNeeded
   (
      This       : access IWiFiDirectServiceProvisioningInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs : aliased constant Windows.IID := (3705266206, 33759, 17381, (143, 67, 203, 232, 71, 158, 132, 235 ));
   
   type IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Session
   (
      This       : access IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionInfo
   (
      This       : access IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectServiceRemotePortAddedEventArgs : aliased constant Windows.IID := (3570318017, 16339, 20238, (183, 189, 120, 41, 6, 244, 68, 17 ));
   
   type IWiFiDirectServiceRemotePortAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EndpointPairs
   (
      This       : access IWiFiDirectServiceRemotePortAddedEventArgs_Interface
      ; RetVal : access Windows.Networking.IVectorView_IEndpointPair -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Protocol
   (
      This       : access IWiFiDirectServiceRemotePortAddedEventArgs_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceIPProtocol
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectServiceSessionDeferredEventArgs : aliased constant Windows.IID := (2382109055, 4609, 20255, (182, 244, 93, 241, 183, 185, 251, 46 ));
   
   type IWiFiDirectServiceSessionDeferredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeferredSessionInfo
   (
      This       : access IWiFiDirectServiceSessionDeferredEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectServiceSessionRequestedEventArgs : aliased constant Windows.IID := (1958595601, 21462, 18841, (180, 248, 108, 142, 204, 23, 113, 231 ));
   
   type IWiFiDirectServiceSessionRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetSessionRequest
   (
      This       : access IWiFiDirectServiceSessionRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectServiceSessionRequest : aliased constant Windows.IID := (2699197579, 20683, 19032, (155, 207, 228, 114, 185, 159, 186, 4 ));
   
   type IWiFiDirectServiceSessionRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceInformation
   (
      This       : access IWiFiDirectServiceSessionRequest_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_ProvisioningInfo
   (
      This       : access IWiFiDirectServiceSessionRequest_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionInfo
   (
      This       : access IWiFiDirectServiceSessionRequest_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectServiceAdvertiserFactory : aliased constant Windows.IID := (822520845, 46150, 20243, (159, 154, 138, 233, 37, 254, 186, 43 ));
   
   type IWiFiDirectServiceAdvertiserFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWiFiDirectServiceAdvertiser
   (
      This       : access IWiFiDirectServiceAdvertiserFactory_Interface
      ; serviceName : Windows.String
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectServiceAdvertiser : aliased constant Windows.IID := (2762612449, 40335, 20303, (147, 238, 125, 222, 162, 227, 127, 70 ));
   
   type IWiFiDirectServiceAdvertiser_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceName
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceNamePrefixes
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceInfo
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_ServiceInfo
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoAcceptSession
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoAcceptSession
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferGroupOwnerMode
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferGroupOwnerMode
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferredConfigurationMethods
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IVector_WiFiDirectServiceConfigurationMethod -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceStatus
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_ServiceStatus
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; value : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomServiceStatusCode
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomServiceStatusCode
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DeferredSessionInfo
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_DeferredSessionInfo
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_AdvertisementStatus
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceAdvertisementStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceError
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceError
   )
   return Windows.HRESULT is abstract;
   
   function add_SessionRequested
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; handler : TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SessionRequested
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AutoAcceptSessionConnected
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; handler : TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AutoAcceptSessionConnected
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AdvertisementStatusChanged
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; handler : TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AdvertisementStatusChanged
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function ConnectAsync
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; deviceInfo : Windows.Devices.Enumeration.IDeviceInformation
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceSession -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConnectAsyncWithPin
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
      ; deviceInfo : Windows.Devices.Enumeration.IDeviceInformation
      ; pin : Windows.String
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceSession -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IWiFiDirectServiceAdvertiser_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectServiceStatics : aliased constant Windows.IID := (2108948549, 64884, 18056, (183, 37, 93, 206, 134, 172, 242, 51 ));
   
   type IWiFiDirectServiceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetSelector
   (
      This       : access IWiFiDirectServiceStatics_Interface
      ; serviceName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetSelectorWithFilter
   (
      This       : access IWiFiDirectServiceStatics_Interface
      ; serviceName : Windows.String
      ; serviceInfoFilter : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IWiFiDirectServiceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectService : aliased constant Windows.IID := (1353366456, 24433, 17900, (132, 241, 161, 228, 252, 120, 121, 163 ));
   
   type IWiFiDirectService_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteServiceInfo
   (
      This       : access IWiFiDirectService_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedConfigurationMethods
   (
      This       : access IWiFiDirectService_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IVectorView_WiFiDirectServiceConfigurationMethod -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferGroupOwnerMode
   (
      This       : access IWiFiDirectService_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferGroupOwnerMode
   (
      This       : access IWiFiDirectService_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionInfo
   (
      This       : access IWiFiDirectService_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_SessionInfo
   (
      This       : access IWiFiDirectService_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceError
   (
      This       : access IWiFiDirectService_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceError
   )
   return Windows.HRESULT is abstract;
   
   function add_SessionDeferred
   (
      This       : access IWiFiDirectService_Interface
      ; handler : TypedEventHandler_IWiFiDirectService_add_SessionDeferred
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SessionDeferred
   (
      This       : access IWiFiDirectService_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetProvisioningInfoAsync
   (
      This       : access IWiFiDirectService_Interface
      ; selectedConfigurationMethod : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceProvisioningInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConnectAsync
   (
      This       : access IWiFiDirectService_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceSession -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConnectAsyncWithPin
   (
      This       : access IWiFiDirectService_Interface
      ; pin : Windows.String
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceSession -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWiFiDirectServiceSession : aliased constant Windows.IID := (2165580131, 58406, 18379, (134, 64, 225, 179, 88, 139, 242, 111 ));
   
   type IWiFiDirectServiceSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceName
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceSessionStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorStatus
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceSessionErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionId
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AdvertisementId
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceAddress
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionAddress
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetConnectionEndpointPairs
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; RetVal : access Windows.Networking.IVectorView_IEndpointPair -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_SessionStatusChanged
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; handler : TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SessionStatusChanged
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function AddStreamSocketListenerAsync
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; value : Windows.Networking.Sockets.IStreamSocketListener
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AddDatagramSocketAsync
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; value : Windows.Networking.Sockets.IDatagramSocket
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_RemotePortAdded
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; handler : TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RemotePortAdded
   (
      This       : access IWiFiDirectServiceSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_WiFiDirectServiceConfigurationMethod : aliased constant Windows.IID := (428384094, 18862, 24113, (176, 89, 8, 63, 159, 21, 50, 195 ));
   
   type IIterator_WiFiDirectServiceConfigurationMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_WiFiDirectServiceConfigurationMethod_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_WiFiDirectServiceConfigurationMethod_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_WiFiDirectServiceConfigurationMethod_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_WiFiDirectServiceConfigurationMethod_Interface
      ; items : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_WiFiDirectServiceConfigurationMethod : aliased constant Windows.IID := (3648469786, 41288, 22719, (156, 75, 175, 234, 201, 190, 58, 180 ));
   
   type IIterable_WiFiDirectServiceConfigurationMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_WiFiDirectServiceConfigurationMethod_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IIterator_WiFiDirectServiceConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_WiFiDirectServiceConfigurationMethod : aliased constant Windows.IID := (3698397153, 32516, 20827, (138, 193, 28, 93, 60, 13, 43, 40 ));
   
   type IVectorView_WiFiDirectServiceConfigurationMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_WiFiDirectServiceConfigurationMethod_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_WiFiDirectServiceConfigurationMethod_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_WiFiDirectServiceConfigurationMethod_Interface
      ; value : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_WiFiDirectServiceConfigurationMethod_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_WiFiDirectServiceConfigurationMethod : aliased constant Windows.IID := (4138137884, 1401, 22109, (190, 7, 69, 56, 165, 86, 144, 190 ));
   
   type IVector_WiFiDirectServiceConfigurationMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IVectorView_WiFiDirectServiceConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
      ; value : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
      ; value : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_WiFiDirectServiceConfigurationMethod_Interface
      ; items : Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWiFiDirectServiceSession : aliased constant Windows.IID := (3269086871, 29323, 21505, (169, 217, 58, 1, 133, 69, 10, 242 ));
   
   type IAsyncOperation_IWiFiDirectServiceSession_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWiFiDirectServiceSession_Interface
      ; handler : Windows.Devices.WiFiDirect.Services.AsyncOperationCompletedHandler_IWiFiDirectServiceSession
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWiFiDirectServiceSession_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.AsyncOperationCompletedHandler_IWiFiDirectServiceSession
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWiFiDirectServiceSession_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWiFiDirectService : aliased constant Windows.IID := (3304729320, 20471, 23200, (175, 151, 237, 133, 234, 102, 249, 174 ));
   
   type IAsyncOperation_IWiFiDirectService_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWiFiDirectService_Interface
      ; handler : Windows.Devices.WiFiDirect.Services.AsyncOperationCompletedHandler_IWiFiDirectService
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWiFiDirectService_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.AsyncOperationCompletedHandler_IWiFiDirectService
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWiFiDirectService_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IWiFiDirectService
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWiFiDirectServiceProvisioningInfo : aliased constant Windows.IID := (3623505348, 18224, 20590, (191, 240, 128, 30, 180, 168, 49, 168 ));
   
   type IAsyncOperation_IWiFiDirectServiceProvisioningInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWiFiDirectServiceProvisioningInfo_Interface
      ; handler : Windows.Devices.WiFiDirect.Services.AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWiFiDirectServiceProvisioningInfo_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWiFiDirectServiceProvisioningInfo_Interface
      ; RetVal : access Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested : aliased constant Windows.IID := (3415801204, 34589, 22320, (145, 254, 129, 239, 148, 127, 231, 143 ));
   
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested_Interface(Callback : access procedure (sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectServiceAdvertiser_add_SessionRequested_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
      ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected : aliased constant Windows.IID := (1004721416, 43094, 23561, (153, 152, 82, 37, 151, 180, 75, 7 ));
   
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected_Interface(Callback : access procedure (sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AutoAcceptSessionConnected_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
      ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged : aliased constant Windows.IID := (1744580897, 49568, 23587, (175, 88, 236, 183, 242, 167, 215, 115 ));
   
   type TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectServiceAdvertiser_add_AdvertisementStatusChanged_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWiFiDirectServiceSession : aliased constant Windows.IID := (2996692753, 24760, 23002, (143, 77, 252, 121, 216, 204, 212, 34 ));
   
   type AsyncOperationCompletedHandler_IWiFiDirectServiceSession_Interface(Callback : access procedure (asyncInfo : Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceSession ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWiFiDirectServiceSession'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWiFiDirectServiceSession_Interface
      ; asyncInfo : Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceSession
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWiFiDirectService : aliased constant Windows.IID := (4110787528, 18487, 24078, (138, 77, 30, 42, 245, 71, 126, 92 ));
   
   type AsyncOperationCompletedHandler_IWiFiDirectService_Interface(Callback : access procedure (asyncInfo : Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectService ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWiFiDirectService'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWiFiDirectService_Interface
      ; asyncInfo : Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectService
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWiFiDirectService_add_SessionDeferred : aliased constant Windows.IID := (4231920684, 40186, 22562, (186, 63, 255, 58, 251, 101, 119, 126 ));
   
   type TypedEventHandler_IWiFiDirectService_add_SessionDeferred_Interface(Callback : access procedure (sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectService ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWiFiDirectService_add_SessionDeferred'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectService_add_SessionDeferred_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectService
      ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo : aliased constant Windows.IID := (2496370024, 1034, 20870, (163, 201, 82, 104, 14, 225, 121, 132 ));
   
   type AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo_Interface(Callback : access procedure (asyncInfo : Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceProvisioningInfo ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWiFiDirectServiceProvisioningInfo_Interface
      ; asyncInfo : Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectServiceProvisioningInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged : aliased constant Windows.IID := (281228033, 58140, 23758, (178, 160, 193, 220, 45, 141, 14, 19 ));
   
   type TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectServiceSession_add_SessionStatusChanged_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded : aliased constant Windows.IID := (2200347447, 15385, 22439, (128, 236, 204, 162, 234, 98, 239, 18 ));
   
   type TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded_Interface(Callback : access procedure (sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectServiceSession_add_RemotePortAdded_Interface
      ; sender : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
      ; args : Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WiFiDirectServiceProvisioningInfo is Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo;
   subtype WiFiDirectServiceSession is Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession;
   subtype WiFiDirectServiceAutoAcceptSessionConnectedEventArgs is Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs;
   subtype WiFiDirectServiceRemotePortAddedEventArgs is Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs;
   subtype WiFiDirectServiceSessionDeferredEventArgs is Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs;
   subtype WiFiDirectServiceSessionRequest is Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequest;
   subtype WiFiDirectServiceSessionRequestedEventArgs is Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs;
   subtype WiFiDirectServiceAdvertiser is Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser;
   function CreateWiFiDirectServiceAdvertiser
   (
      serviceName : Windows.String
   )
   return Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser;
   
   
   subtype WiFiDirectService is Windows.Devices.WiFiDirect.Services.IWiFiDirectService;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetSelector
   (
      serviceName : Windows.String
   )
   return Windows.String;
   
   function GetSelectorWithFilter
   (
      serviceName : Windows.String
      ; serviceInfoFilter : Windows.Storage.Streams.IBuffer
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.WiFiDirect.Services.IAsyncOperation_IWiFiDirectService;
   
end;
