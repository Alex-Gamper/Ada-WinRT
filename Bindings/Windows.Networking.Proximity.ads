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
limited with Windows.Storage.Streams;
with Windows.Foundation;
limited with Windows.Networking.Sockets;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Networking.Proximity is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type TriggeredConnectState is (
      PeerFound,
      Listening,
      Connecting,
      Completed,
      Canceled,
      Failed
   );
   for TriggeredConnectState use (
      PeerFound => 0,
      Listening => 1,
      Connecting => 2,
      Completed => 3,
      Canceled => 4,
      Failed => 5
   );
   for TriggeredConnectState'Size use 32;
   
   type TriggeredConnectState_Ptr is access TriggeredConnectState;
   
   type PeerWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopping,
      Stopped,
      Aborted
   );
   for PeerWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopping => 3,
      Stopped => 4,
      Aborted => 5
   );
   for PeerWatcherStatus'Size use 32;
   
   type PeerWatcherStatus_Ptr is access PeerWatcherStatus;
   
   type PeerDiscoveryTypes is (
      None,
      Browse,
      Triggered
   );
   for PeerDiscoveryTypes use (
      None => 0,
      Browse => 1,
      Triggered => 2
   );
   for PeerDiscoveryTypes'Size use 32;
   
   type PeerDiscoveryTypes_Ptr is access PeerDiscoveryTypes;
   
   type PeerRole is (
      Peer,
      Host,
      Client
   );
   for PeerRole use (
      Peer => 0,
      Host => 1,
      Client => 2
   );
   for PeerRole'Size use 32;
   
   type PeerRole_Ptr is access PeerRole;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type MessageReceivedHandler_Interface;
   type MessageReceivedHandler is access all MessageReceivedHandler_Interface'Class;
   type MessageReceivedHandler_Ptr is access all MessageReceivedHandler;
   type MessageTransmittedHandler_Interface;
   type MessageTransmittedHandler is access all MessageTransmittedHandler_Interface'Class;
   type MessageTransmittedHandler_Ptr is access all MessageTransmittedHandler;
   type DeviceArrivedEventHandler_Interface;
   type DeviceArrivedEventHandler is access all DeviceArrivedEventHandler_Interface'Class;
   type DeviceArrivedEventHandler_Ptr is access all DeviceArrivedEventHandler;
   type DeviceDepartedEventHandler_Interface;
   type DeviceDepartedEventHandler is access all DeviceDepartedEventHandler_Interface'Class;
   type DeviceDepartedEventHandler_Ptr is access all DeviceDepartedEventHandler;
   type TypedEventHandler_IPeerWatcher_add_Added_Interface;
   type TypedEventHandler_IPeerWatcher_add_Added is access all TypedEventHandler_IPeerWatcher_add_Added_Interface'Class;
   type TypedEventHandler_IPeerWatcher_add_Added_Ptr is access all TypedEventHandler_IPeerWatcher_add_Added;
   type TypedEventHandler_IPeerWatcher_add_Removed_Interface;
   type TypedEventHandler_IPeerWatcher_add_Removed is access all TypedEventHandler_IPeerWatcher_add_Removed_Interface'Class;
   type TypedEventHandler_IPeerWatcher_add_Removed_Ptr is access all TypedEventHandler_IPeerWatcher_add_Removed;
   type TypedEventHandler_IPeerWatcher_add_Updated_Interface;
   type TypedEventHandler_IPeerWatcher_add_Updated is access all TypedEventHandler_IPeerWatcher_add_Updated_Interface'Class;
   type TypedEventHandler_IPeerWatcher_add_Updated_Ptr is access all TypedEventHandler_IPeerWatcher_add_Updated;
   type TypedEventHandler_IPeerWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IPeerWatcher_add_EnumerationCompleted is access all TypedEventHandler_IPeerWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IPeerWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IPeerWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IPeerWatcher_add_Stopped_Interface;
   type TypedEventHandler_IPeerWatcher_add_Stopped is access all TypedEventHandler_IPeerWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IPeerWatcher_add_Stopped_Ptr is access all TypedEventHandler_IPeerWatcher_add_Stopped;
   type TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged_Interface;
   type TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged is access all TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged_Interface'Class;
   type TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged_Ptr is access all TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged;
   type TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested_Interface;
   type TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested is access all TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested_Interface'Class;
   type TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested_Ptr is access all TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IProximityMessage_Interface;
   type IProximityMessage is access all IProximityMessage_Interface'Class;
   type IProximityMessage_Ptr is access all IProximityMessage;
   type IProximityDevice_Interface;
   type IProximityDevice is access all IProximityDevice_Interface'Class;
   type IProximityDevice_Ptr is access all IProximityDevice;
   type IProximityDeviceStatics_Interface;
   type IProximityDeviceStatics is access all IProximityDeviceStatics_Interface'Class;
   type IProximityDeviceStatics_Ptr is access all IProximityDeviceStatics;
   type ITriggeredConnectionStateChangedEventArgs_Interface;
   type ITriggeredConnectionStateChangedEventArgs is access all ITriggeredConnectionStateChangedEventArgs_Interface'Class;
   type ITriggeredConnectionStateChangedEventArgs_Ptr is access all ITriggeredConnectionStateChangedEventArgs;
   type IPeerInformation_Interface;
   type IPeerInformation is access all IPeerInformation_Interface'Class;
   type IPeerInformation_Ptr is access all IPeerInformation;
   type IPeerInformationWithHostAndService_Interface;
   type IPeerInformationWithHostAndService is access all IPeerInformationWithHostAndService_Interface'Class;
   type IPeerInformationWithHostAndService_Ptr is access all IPeerInformationWithHostAndService;
   type IPeerInformation3_Interface;
   type IPeerInformation3 is access all IPeerInformation3_Interface'Class;
   type IPeerInformation3_Ptr is access all IPeerInformation3;
   type IConnectionRequestedEventArgs_Interface;
   type IConnectionRequestedEventArgs is access all IConnectionRequestedEventArgs_Interface'Class;
   type IConnectionRequestedEventArgs_Ptr is access all IConnectionRequestedEventArgs;
   type IPeerWatcher_Interface;
   type IPeerWatcher is access all IPeerWatcher_Interface'Class;
   type IPeerWatcher_Ptr is access all IPeerWatcher;
   type IPeerFinderStatics_Interface;
   type IPeerFinderStatics is access all IPeerFinderStatics_Interface'Class;
   type IPeerFinderStatics_Ptr is access all IPeerFinderStatics;
   type IPeerFinderStatics2_Interface;
   type IPeerFinderStatics2 is access all IPeerFinderStatics2_Interface'Class;
   type IPeerFinderStatics2_Ptr is access all IPeerFinderStatics2;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IProximityMessage : aliased constant Windows.IID := (4020963202, 63201, 18037, (160, 69, 216, 227, 32, 194, 72, 8 ));
   
   type IProximityMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MessageType
   (
      This       : access IProximityMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SubscriptionId
   (
      This       : access IProximityMessage_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IProximityMessage_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_DataAsString
   (
      This       : access IProximityMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProximityDevice : aliased constant Windows.IID := (4020806994, 63201, 17193, (160, 252, 171, 107, 15, 210, 130, 98 ));
   
   type IProximityDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function SubscribeForMessage
   (
      This       : access IProximityDevice_Interface
      ; messageType : Windows.String
      ; messageReceivedHandler : Windows.Networking.Proximity.MessageReceivedHandler
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function PublishMessage
   (
      This       : access IProximityDevice_Interface
      ; messageType : Windows.String
      ; message : Windows.String
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function PublishMessageWithCallback
   (
      This       : access IProximityDevice_Interface
      ; messageType : Windows.String
      ; message : Windows.String
      ; messageTransmittedHandler : Windows.Networking.Proximity.MessageTransmittedHandler
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function PublishBinaryMessage
   (
      This       : access IProximityDevice_Interface
      ; messageType : Windows.String
      ; message : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function PublishBinaryMessageWithCallback
   (
      This       : access IProximityDevice_Interface
      ; messageType : Windows.String
      ; message : Windows.Storage.Streams.IBuffer
      ; messageTransmittedHandler : Windows.Networking.Proximity.MessageTransmittedHandler
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function PublishUriMessage
   (
      This       : access IProximityDevice_Interface
      ; message : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function PublishUriMessageWithCallback
   (
      This       : access IProximityDevice_Interface
      ; message : Windows.Foundation.IUriRuntimeClass
      ; messageTransmittedHandler : Windows.Networking.Proximity.MessageTransmittedHandler
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function StopSubscribingForMessage
   (
      This       : access IProximityDevice_Interface
      ; subscriptionId : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function StopPublishingMessage
   (
      This       : access IProximityDevice_Interface
      ; messageId : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function add_DeviceArrived
   (
      This       : access IProximityDevice_Interface
      ; arrivedHandler : Windows.Networking.Proximity.DeviceArrivedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DeviceArrived
   (
      This       : access IProximityDevice_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DeviceDeparted
   (
      This       : access IProximityDevice_Interface
      ; departedHandler : Windows.Networking.Proximity.DeviceDepartedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DeviceDeparted
   (
      This       : access IProximityDevice_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxMessageBytes
   (
      This       : access IProximityDevice_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BitsPerSecond
   (
      This       : access IProximityDevice_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access IProximityDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProximityDeviceStatics : aliased constant Windows.IID := (2437652509, 63201, 18372, (161, 76, 20, 138, 25, 3, 208, 198 ));
   
   type IProximityDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IProximityDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDefault
   (
      This       : access IProximityDeviceStatics_Interface
      ; RetVal : access Windows.Networking.Proximity.IProximityDevice
   )
   return Windows.HRESULT is abstract;
   
   function FromId
   (
      This       : access IProximityDeviceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Networking.Proximity.IProximityDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITriggeredConnectionStateChangedEventArgs : aliased constant Windows.IID := (3332866221, 63201, 19796, (150, 226, 51, 246, 32, 188, 168, 138 ));
   
   type ITriggeredConnectionStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access ITriggeredConnectionStateChangedEventArgs_Interface
      ; RetVal : access Windows.Networking.Proximity.TriggeredConnectState
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access ITriggeredConnectionStateChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Socket
   (
      This       : access ITriggeredConnectionStateChangedEventArgs_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamSocket
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPeerInformation : aliased constant Windows.IID := (537022216, 40959, 17908, (182, 233, 64, 139, 46, 190, 243, 115 ));
   
   type IPeerInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IPeerInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPeerInformationWithHostAndService : aliased constant Windows.IID := (3972517037, 7024, 20107, (146, 219, 187, 231, 129, 65, 147, 8 ));
   
   type IPeerInformationWithHostAndService_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HostName
   (
      This       : access IPeerInformationWithHostAndService_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceName
   (
      This       : access IPeerInformationWithHostAndService_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPeerInformation3 : aliased constant Windows.IID := (2987352362, 56272, 16632, (149, 189, 45, 66, 9, 199, 131, 111 ));
   
   type IPeerInformation3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IPeerInformation3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DiscoveryData
   (
      This       : access IPeerInformation3_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectionRequestedEventArgs : aliased constant Windows.IID := (3949498798, 20254, 19558, (189, 13, 70, 146, 74, 148, 46, 8 ));
   
   type IConnectionRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PeerInformation
   (
      This       : access IConnectionRequestedEventArgs_Interface
      ; RetVal : access Windows.Networking.Proximity.IPeerInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPeerWatcher : aliased constant Windows.IID := (1022239224, 12198, 18041, (150, 145, 3, 201, 74, 66, 15, 52 ));
   
   type IPeerWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Added
   (
      This       : access IPeerWatcher_Interface
      ; handler : TypedEventHandler_IPeerWatcher_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access IPeerWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access IPeerWatcher_Interface
      ; handler : TypedEventHandler_IPeerWatcher_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access IPeerWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Updated
   (
      This       : access IPeerWatcher_Interface
      ; handler : TypedEventHandler_IPeerWatcher_add_Updated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Updated
   (
      This       : access IPeerWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IPeerWatcher_Interface
      ; handler : TypedEventHandler_IPeerWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IPeerWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IPeerWatcher_Interface
      ; handler : TypedEventHandler_IPeerWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IPeerWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IPeerWatcher_Interface
      ; RetVal : access Windows.Networking.Proximity.PeerWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IPeerWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IPeerWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPeerFinderStatics : aliased constant Windows.IID := (2437626721, 63201, 18372, (161, 76, 20, 138, 25, 3, 208, 198 ));
   
   type IPeerFinderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowBluetooth
   (
      This       : access IPeerFinderStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowBluetooth
   (
      This       : access IPeerFinderStatics_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowInfrastructure
   (
      This       : access IPeerFinderStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowInfrastructure
   (
      This       : access IPeerFinderStatics_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowWiFiDirect
   (
      This       : access IPeerFinderStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowWiFiDirect
   (
      This       : access IPeerFinderStatics_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPeerFinderStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IPeerFinderStatics_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedDiscoveryTypes
   (
      This       : access IPeerFinderStatics_Interface
      ; RetVal : access Windows.Networking.Proximity.PeerDiscoveryTypes
   )
   return Windows.HRESULT is abstract;
   
   function get_AlternateIdentities
   (
      This       : access IPeerFinderStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IPeerFinderStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartWithMessage
   (
      This       : access IPeerFinderStatics_Interface
      ; peerMessage : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IPeerFinderStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_TriggeredConnectionStateChanged
   (
      This       : access IPeerFinderStatics_Interface
      ; handler : TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TriggeredConnectionStateChanged
   (
      This       : access IPeerFinderStatics_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ConnectionRequested
   (
      This       : access IPeerFinderStatics_Interface
      ; handler : TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ConnectionRequested
   (
      This       : access IPeerFinderStatics_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function FindAllPeersAsync
   (
      This       : access IPeerFinderStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConnectAsync
   (
      This       : access IPeerFinderStatics_Interface
      ; peerInformation : Windows.Networking.Proximity.IPeerInformation
      ; RetVal : access Windows.Networking.Sockets.IAsyncOperation_IStreamSocket -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPeerFinderStatics2 : aliased constant Windows.IID := (3605478501, 64976, 19211, (147, 18, 134, 100, 8, 147, 93, 130 ));
   
   type IPeerFinderStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Role
   (
      This       : access IPeerFinderStatics2_Interface
      ; RetVal : access Windows.Networking.Proximity.PeerRole
   )
   return Windows.HRESULT is abstract;
   
   function put_Role
   (
      This       : access IPeerFinderStatics2_Interface
      ; value : Windows.Networking.Proximity.PeerRole
   )
   return Windows.HRESULT is abstract;
   
   function get_DiscoveryData
   (
      This       : access IPeerFinderStatics2_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_DiscoveryData
   (
      This       : access IPeerFinderStatics2_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcher
   (
      This       : access IPeerFinderStatics2_Interface
      ; RetVal : access Windows.Networking.Proximity.IPeerWatcher
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_MessageReceivedHandler : aliased constant Windows.IID := (4020963202, 63202, 18037, (160, 69, 216, 227, 32, 194, 72, 8 ));
   
   type MessageReceivedHandler_Interface(Callback : access procedure (sender : Windows.Networking.Proximity.IProximityDevice ; message : Windows.Networking.Proximity.IProximityMessage)) is new Windows.IMulticastDelegate_Interface(IID_MessageReceivedHandler'access) with null record;
   function Invoke
   (
      This       : access MessageReceivedHandler_Interface
      ; sender : Windows.Networking.Proximity.IProximityDevice
      ; message : Windows.Networking.Proximity.IProximityMessage
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_MessageTransmittedHandler : aliased constant Windows.IID := (4020898634, 63202, 19837, (133, 108, 120, 252, 142, 252, 2, 30 ));
   
   type MessageTransmittedHandler_Interface(Callback : access procedure (sender : Windows.Networking.Proximity.IProximityDevice ; messageId : Windows.Int64)) is new Windows.IMulticastDelegate_Interface(IID_MessageTransmittedHandler'access) with null record;
   function Invoke
   (
      This       : access MessageTransmittedHandler_Interface
      ; sender : Windows.Networking.Proximity.IProximityDevice
      ; messageId : Windows.Int64
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_DeviceArrivedEventHandler : aliased constant Windows.IID := (4020886121, 63201, 18889, (164, 158, 142, 15, 197, 143, 185, 17 ));
   
   type DeviceArrivedEventHandler_Interface(Callback : access procedure (sender : Windows.Networking.Proximity.IProximityDevice)) is new Windows.IMulticastDelegate_Interface(IID_DeviceArrivedEventHandler'access) with null record;
   function Invoke
   (
      This       : access DeviceArrivedEventHandler_Interface
      ; sender : Windows.Networking.Proximity.IProximityDevice
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_DeviceDepartedEventHandler : aliased constant Windows.IID := (4020886121, 63202, 18889, (164, 158, 142, 15, 197, 143, 185, 17 ));
   
   type DeviceDepartedEventHandler_Interface(Callback : access procedure (sender : Windows.Networking.Proximity.IProximityDevice)) is new Windows.IMulticastDelegate_Interface(IID_DeviceDepartedEventHandler'access) with null record;
   function Invoke
   (
      This       : access DeviceDepartedEventHandler_Interface
      ; sender : Windows.Networking.Proximity.IProximityDevice
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPeerWatcher_add_Added : aliased constant Windows.IID := (2909227967, 25217, 22851, (151, 114, 224, 253, 118, 100, 212, 225 ));
   
   type TypedEventHandler_IPeerWatcher_add_Added_Interface(Callback : access procedure (sender : Windows.Networking.Proximity.IPeerWatcher ; args : Windows.Networking.Proximity.IPeerInformation)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPeerWatcher_add_Added'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPeerWatcher_add_Added_Interface
      ; sender : Windows.Networking.Proximity.IPeerWatcher
      ; args : Windows.Networking.Proximity.IPeerInformation
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPeerWatcher_add_Removed : aliased constant Windows.IID := (2909227967, 25217, 22851, (151, 114, 224, 253, 118, 100, 212, 225 ));
   
   type TypedEventHandler_IPeerWatcher_add_Removed_Interface(Callback : access procedure (sender : Windows.Networking.Proximity.IPeerWatcher ; args : Windows.Networking.Proximity.IPeerInformation)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPeerWatcher_add_Removed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPeerWatcher_add_Removed_Interface
      ; sender : Windows.Networking.Proximity.IPeerWatcher
      ; args : Windows.Networking.Proximity.IPeerInformation
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPeerWatcher_add_Updated : aliased constant Windows.IID := (2909227967, 25217, 22851, (151, 114, 224, 253, 118, 100, 212, 225 ));
   
   type TypedEventHandler_IPeerWatcher_add_Updated_Interface(Callback : access procedure (sender : Windows.Networking.Proximity.IPeerWatcher ; args : Windows.Networking.Proximity.IPeerInformation)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPeerWatcher_add_Updated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPeerWatcher_add_Updated_Interface
      ; sender : Windows.Networking.Proximity.IPeerWatcher
      ; args : Windows.Networking.Proximity.IPeerInformation
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPeerWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (4103577249, 32262, 20648, (136, 220, 63, 41, 82, 78, 79, 219 ));
   
   type TypedEventHandler_IPeerWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.Networking.Proximity.IPeerWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPeerWatcher_add_EnumerationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPeerWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Networking.Proximity.IPeerWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPeerWatcher_add_Stopped : aliased constant Windows.IID := (4103577249, 32262, 20648, (136, 220, 63, 41, 82, 78, 79, 219 ));
   
   type TypedEventHandler_IPeerWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.Networking.Proximity.IPeerWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPeerWatcher_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPeerWatcher_add_Stopped_Interface
      ; sender : Windows.Networking.Proximity.IPeerWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged : aliased constant Windows.IID := (777705210, 15526, 21784, (189, 77, 254, 252, 69, 53, 88, 14 ));
   
   type TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Networking.Proximity.ITriggeredConnectionStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged_Interface
      ; sender : Windows.Object
      ; args : Windows.Networking.Proximity.ITriggeredConnectionStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested : aliased constant Windows.IID := (1361852476, 35625, 20601, (149, 62, 141, 238, 143, 138, 130, 36 ));
   
   type TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Networking.Proximity.IConnectionRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested_Interface
      ; sender : Windows.Object
      ; args : Windows.Networking.Proximity.IConnectionRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ProximityMessage is Windows.Networking.Proximity.IProximityMessage;
   subtype ProximityDevice is Windows.Networking.Proximity.IProximityDevice;
   subtype TriggeredConnectionStateChangedEventArgs is Windows.Networking.Proximity.ITriggeredConnectionStateChangedEventArgs;
   subtype PeerInformation is Windows.Networking.Proximity.IPeerInformation;
   subtype ConnectionRequestedEventArgs is Windows.Networking.Proximity.IConnectionRequestedEventArgs;
   subtype PeerWatcher is Windows.Networking.Proximity.IPeerWatcher;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   return Windows.String;
   
   function GetDefault
   return Windows.Networking.Proximity.IProximityDevice;
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Networking.Proximity.IProximityDevice;
   
   function get_AllowBluetooth
   return Windows.Boolean;
   
   procedure put_AllowBluetooth
   (
      value : Windows.Boolean
   )
   ;
   
   function get_AllowInfrastructure
   return Windows.Boolean;
   
   procedure put_AllowInfrastructure
   (
      value : Windows.Boolean
   )
   ;
   
   function get_AllowWiFiDirect
   return Windows.Boolean;
   
   procedure put_AllowWiFiDirect
   (
      value : Windows.Boolean
   )
   ;
   
   function get_DisplayName
   return Windows.String;
   
   procedure put_DisplayName
   (
      value : Windows.String
   )
   ;
   
   function get_SupportedDiscoveryTypes
   return Windows.Networking.Proximity.PeerDiscoveryTypes;
   
   function get_AlternateIdentities
   return Windows.Address;
   
   procedure Start
   ;
   
   procedure StartWithMessage
   (
      peerMessage : Windows.String
   )
   ;
   
   procedure Stop
   ;
   
   function add_TriggeredConnectionStateChanged
   (
      handler : TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_TriggeredConnectionStateChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_ConnectionRequested
   (
      handler : TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_ConnectionRequested
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function FindAllPeersAsync
   return Windows.Address;
   
   function ConnectAsync
   (
      peerInformation : Windows.Networking.Proximity.IPeerInformation
   )
   return Windows.Networking.Sockets.IAsyncOperation_IStreamSocket;
   
   function get_Role
   return Windows.Networking.Proximity.PeerRole;
   
   procedure put_Role
   (
      value : Windows.Networking.Proximity.PeerRole
   )
   ;
   
   function get_DiscoveryData
   return Windows.Storage.Streams.IBuffer;
   
   procedure put_DiscoveryData
   (
      value : Windows.Storage.Streams.IBuffer
   )
   ;
   
   function CreateWatcher
   return Windows.Networking.Proximity.IPeerWatcher;
   
end;
