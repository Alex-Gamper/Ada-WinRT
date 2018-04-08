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
with Windows; use Windows;
limited with Windows.Storage.Streams;
with Windows.Foundation;
limited with Windows.Networking.Connectivity;
with Windows.Foundation.Collections;
limited with Windows.Security.Cryptography.Certificates;
limited with Windows.Security.Credentials;
limited with Windows.Web;
limited with Windows.ApplicationModel.Background;
--------------------------------------------------------------------------------
package Windows.Networking.Sockets is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SocketMessageType is (
      Binary,
      Utf8
   );
   for SocketMessageType use (
      Binary => 0,
      Utf8 => 1
   );
   for SocketMessageType'Size use 32;
   
   type SocketMessageType_Ptr is access SocketMessageType;
   
   type SocketProtectionLevel is (
      PlainSocket,
      SslAllowNullEncryption,
      BluetoothEncryptionAllowNullAuthentication,
      BluetoothEncryptionWithAuthentication,
      Tls10,
      Tls11,
      Tls12,
      Unspecified
   );
   for SocketProtectionLevel use (
      PlainSocket => 0,
      SslAllowNullEncryption => 2,
      BluetoothEncryptionAllowNullAuthentication => 3,
      BluetoothEncryptionWithAuthentication => 4,
      Tls10 => 6,
      Tls11 => 7,
      Tls12 => 8,
      Unspecified => 9
   );
   for SocketProtectionLevel'Size use 32;
   
   type SocketProtectionLevel_Ptr is access SocketProtectionLevel;
   
   type SocketQualityOfService is (
      Normal,
      LowLatency
   );
   for SocketQualityOfService use (
      Normal => 0,
      LowLatency => 1
   );
   for SocketQualityOfService'Size use 32;
   
   type SocketQualityOfService_Ptr is access SocketQualityOfService;
   
   type SocketErrorStatus is (
      Unknown,
      OperationAborted,
      HttpInvalidServerResponse,
      ConnectionTimedOut,
      AddressFamilyNotSupported,
      SocketTypeNotSupported,
      HostNotFound,
      NoDataRecordOfRequestedType,
      NonAuthoritativeHostNotFound,
      ClassTypeNotFound,
      AddressAlreadyInUse,
      CannotAssignRequestedAddress,
      ConnectionRefused,
      NetworkIsUnreachable,
      UnreachableHost,
      NetworkIsDown,
      NetworkDroppedConnectionOnReset,
      SoftwareCausedConnectionAbort,
      ConnectionResetByPeer,
      HostIsDown,
      NoAddressesFound,
      TooManyOpenFiles,
      MessageTooLong,
      CertificateExpired,
      CertificateUntrustedRoot,
      CertificateCommonNameIsIncorrect,
      CertificateWrongUsage,
      CertificateRevoked,
      CertificateNoRevocationCheck,
      CertificateRevocationServerOffline,
      CertificateIsInvalid
   );
   for SocketErrorStatus use (
      Unknown => 0,
      OperationAborted => 1,
      HttpInvalidServerResponse => 2,
      ConnectionTimedOut => 3,
      AddressFamilyNotSupported => 4,
      SocketTypeNotSupported => 5,
      HostNotFound => 6,
      NoDataRecordOfRequestedType => 7,
      NonAuthoritativeHostNotFound => 8,
      ClassTypeNotFound => 9,
      AddressAlreadyInUse => 10,
      CannotAssignRequestedAddress => 11,
      ConnectionRefused => 12,
      NetworkIsUnreachable => 13,
      UnreachableHost => 14,
      NetworkIsDown => 15,
      NetworkDroppedConnectionOnReset => 16,
      SoftwareCausedConnectionAbort => 17,
      ConnectionResetByPeer => 18,
      HostIsDown => 19,
      NoAddressesFound => 20,
      TooManyOpenFiles => 21,
      MessageTooLong => 22,
      CertificateExpired => 23,
      CertificateUntrustedRoot => 24,
      CertificateCommonNameIsIncorrect => 25,
      CertificateWrongUsage => 26,
      CertificateRevoked => 27,
      CertificateNoRevocationCheck => 28,
      CertificateRevocationServerOffline => 29,
      CertificateIsInvalid => 30
   );
   for SocketErrorStatus'Size use 32;
   
   type SocketErrorStatus_Ptr is access SocketErrorStatus;
   
   type SocketSslErrorSeverity is (
      None,
      Ignorable,
      Fatal
   );
   for SocketSslErrorSeverity use (
      None => 0,
      Ignorable => 1,
      Fatal => 2
   );
   for SocketSslErrorSeverity'Size use 32;
   
   type SocketSslErrorSeverity_Ptr is access SocketSslErrorSeverity;
   
   type SocketActivityKind is (
      None,
      StreamSocketListener_x,
      DatagramSocket_x,
      StreamSocket_x
   );
   for SocketActivityKind use (
      None => 0,
      StreamSocketListener_x => 1,
      DatagramSocket_x => 2,
      StreamSocket_x => 3
   );
   for SocketActivityKind'Size use 32;
   
   type SocketActivityKind_Ptr is access SocketActivityKind;
   
   type SocketActivityTriggerReason is (
      None,
      SocketActivity,
      ConnectionAccepted,
      KeepAliveTimerExpired,
      SocketClosed
   );
   for SocketActivityTriggerReason use (
      None => 0,
      SocketActivity => 1,
      ConnectionAccepted => 2,
      KeepAliveTimerExpired => 3,
      SocketClosed => 4
   );
   for SocketActivityTriggerReason'Size use 32;
   
   type SocketActivityTriggerReason_Ptr is access SocketActivityTriggerReason;
   
   type SocketActivityConnectedStandbyAction is (
      DoNotWake,
      Wake
   );
   for SocketActivityConnectedStandbyAction use (
      DoNotWake => 0,
      Wake => 1
   );
   for SocketActivityConnectedStandbyAction'Size use 32;
   
   type SocketActivityConnectedStandbyAction_Ptr is access SocketActivityConnectedStandbyAction;
   
   type MessageWebSocketReceiveMode is (
      FullMessage,
      PartialMessage
   );
   for MessageWebSocketReceiveMode use (
      FullMessage => 0,
      PartialMessage => 1
   );
   for MessageWebSocketReceiveMode'Size use 32;
   
   type MessageWebSocketReceiveMode_Ptr is access MessageWebSocketReceiveMode;
   
   type ControlChannelTriggerStatus is (
      HardwareSlotRequested,
      SoftwareSlotAllocated,
      HardwareSlotAllocated,
      PolicyError,
      SystemError,
      TransportDisconnected,
      ServiceUnavailable
   );
   for ControlChannelTriggerStatus use (
      HardwareSlotRequested => 0,
      SoftwareSlotAllocated => 1,
      HardwareSlotAllocated => 2,
      PolicyError => 3,
      SystemError => 4,
      TransportDisconnected => 5,
      ServiceUnavailable => 6
   );
   for ControlChannelTriggerStatus'Size use 32;
   
   type ControlChannelTriggerStatus_Ptr is access ControlChannelTriggerStatus;
   
   type ControlChannelTriggerResourceType is (
      RequestSoftwareSlot,
      RequestHardwareSlot
   );
   for ControlChannelTriggerResourceType use (
      RequestSoftwareSlot => 0,
      RequestHardwareSlot => 1
   );
   for ControlChannelTriggerResourceType'Size use 32;
   
   type ControlChannelTriggerResourceType_Ptr is access ControlChannelTriggerResourceType;
   
   type ControlChannelTriggerResetReason is (
      FastUserSwitched,
      LowPowerExit,
      QuietHoursExit,
      ApplicationRestart
   );
   for ControlChannelTriggerResetReason use (
      FastUserSwitched => 0,
      LowPowerExit => 1,
      QuietHoursExit => 2,
      ApplicationRestart => 3
   );
   for ControlChannelTriggerResetReason'Size use 32;
   
   type ControlChannelTriggerResetReason_Ptr is access ControlChannelTriggerResetReason;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type RoundTripTimeStatistics is record
      Variance : Windows.UInt32;
      Max : Windows.UInt32;
      Min : Windows.UInt32;
      Sum : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , RoundTripTimeStatistics);
   
   type RoundTripTimeStatistics_Ptr is access RoundTripTimeStatistics;
   
   type BandwidthStatistics is record
      OutboundBitsPerSecond : Windows.UInt64;
      InboundBitsPerSecond : Windows.UInt64;
      OutboundBitsPerSecondInstability : Windows.UInt64;
      InboundBitsPerSecondInstability : Windows.UInt64;
      OutboundBandwidthPeaked : Windows.Boolean;
      InboundBandwidthPeaked : Windows.Boolean;
   end record;
   pragma Convention (C_Pass_By_Copy , BandwidthStatistics);
   
   type BandwidthStatistics_Ptr is access BandwidthStatistics;
   
   type ControlChannelTriggerContract is null record;
   pragma Convention (C_Pass_By_Copy , ControlChannelTriggerContract);
   
   type ControlChannelTriggerContract_Ptr is access ControlChannelTriggerContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IStreamSocket_Interface;
   type AsyncOperationCompletedHandler_IStreamSocket is access all AsyncOperationCompletedHandler_IStreamSocket_Interface'Class;
   type AsyncOperationCompletedHandler_IStreamSocket_Ptr is access all AsyncOperationCompletedHandler_IStreamSocket;
   type TypedEventHandler_IDatagramSocket_add_MessageReceived_Interface;
   type TypedEventHandler_IDatagramSocket_add_MessageReceived is access all TypedEventHandler_IDatagramSocket_add_MessageReceived_Interface'Class;
   type TypedEventHandler_IDatagramSocket_add_MessageReceived_Ptr is access all TypedEventHandler_IDatagramSocket_add_MessageReceived;
   type TypedEventHandler_IStreamSocketListener_add_ConnectionReceived_Interface;
   type TypedEventHandler_IStreamSocketListener_add_ConnectionReceived is access all TypedEventHandler_IStreamSocketListener_add_ConnectionReceived_Interface'Class;
   type TypedEventHandler_IStreamSocketListener_add_ConnectionReceived_Ptr is access all TypedEventHandler_IStreamSocketListener_add_ConnectionReceived;
   type TypedEventHandler_IWebSocket_add_Closed_Interface;
   type TypedEventHandler_IWebSocket_add_Closed is access all TypedEventHandler_IWebSocket_add_Closed_Interface'Class;
   type TypedEventHandler_IWebSocket_add_Closed_Ptr is access all TypedEventHandler_IWebSocket_add_Closed;
   type TypedEventHandler_IMessageWebSocket_add_MessageReceived_Interface;
   type TypedEventHandler_IMessageWebSocket_add_MessageReceived is access all TypedEventHandler_IMessageWebSocket_add_MessageReceived_Interface'Class;
   type TypedEventHandler_IMessageWebSocket_add_MessageReceived_Ptr is access all TypedEventHandler_IMessageWebSocket_add_MessageReceived;
   type TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested_Interface;
   type TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested is access all TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested_Interface'Class;
   type TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested_Ptr is access all TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested;
   type TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested_Interface;
   type TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested is access all TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested_Interface'Class;
   type TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested_Ptr is access all TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISocketActivityInformation_Interface;
   type ISocketActivityInformation is access all ISocketActivityInformation_Interface'Class;
   type ISocketActivityInformation_Ptr is access all ISocketActivityInformation;
   type ISocketActivityTriggerDetails_Interface;
   type ISocketActivityTriggerDetails is access all ISocketActivityTriggerDetails_Interface'Class;
   type ISocketActivityTriggerDetails_Ptr is access all ISocketActivityTriggerDetails;
   type ISocketActivityInformationStatics_Interface;
   type ISocketActivityInformationStatics is access all ISocketActivityInformationStatics_Interface'Class;
   type ISocketActivityInformationStatics_Ptr is access all ISocketActivityInformationStatics;
   type ISocketActivityContext_Interface;
   type ISocketActivityContext is access all ISocketActivityContext_Interface'Class;
   type ISocketActivityContext_Ptr is access all ISocketActivityContext;
   type ISocketActivityContextFactory_Interface;
   type ISocketActivityContextFactory is access all ISocketActivityContextFactory_Interface'Class;
   type ISocketActivityContextFactory_Ptr is access all ISocketActivityContextFactory;
   type IDatagramSocketMessageReceivedEventArgs_Interface;
   type IDatagramSocketMessageReceivedEventArgs is access all IDatagramSocketMessageReceivedEventArgs_Interface'Class;
   type IDatagramSocketMessageReceivedEventArgs_Ptr is access all IDatagramSocketMessageReceivedEventArgs;
   type IMessageWebSocketMessageReceivedEventArgs_Interface;
   type IMessageWebSocketMessageReceivedEventArgs is access all IMessageWebSocketMessageReceivedEventArgs_Interface'Class;
   type IMessageWebSocketMessageReceivedEventArgs_Ptr is access all IMessageWebSocketMessageReceivedEventArgs;
   type IMessageWebSocketMessageReceivedEventArgs2_Interface;
   type IMessageWebSocketMessageReceivedEventArgs2 is access all IMessageWebSocketMessageReceivedEventArgs2_Interface'Class;
   type IMessageWebSocketMessageReceivedEventArgs2_Ptr is access all IMessageWebSocketMessageReceivedEventArgs2;
   type IWebSocketClosedEventArgs_Interface;
   type IWebSocketClosedEventArgs is access all IWebSocketClosedEventArgs_Interface'Class;
   type IWebSocketClosedEventArgs_Ptr is access all IWebSocketClosedEventArgs;
   type IDatagramSocketInformation_Interface;
   type IDatagramSocketInformation is access all IDatagramSocketInformation_Interface'Class;
   type IDatagramSocketInformation_Ptr is access all IDatagramSocketInformation;
   type IDatagramSocketControl_Interface;
   type IDatagramSocketControl is access all IDatagramSocketControl_Interface'Class;
   type IDatagramSocketControl_Ptr is access all IDatagramSocketControl;
   type IDatagramSocketControl2_Interface;
   type IDatagramSocketControl2 is access all IDatagramSocketControl2_Interface'Class;
   type IDatagramSocketControl2_Ptr is access all IDatagramSocketControl2;
   type IDatagramSocketControl3_Interface;
   type IDatagramSocketControl3 is access all IDatagramSocketControl3_Interface'Class;
   type IDatagramSocketControl3_Ptr is access all IDatagramSocketControl3;
   type IDatagramSocketStatics_Interface;
   type IDatagramSocketStatics is access all IDatagramSocketStatics_Interface'Class;
   type IDatagramSocketStatics_Ptr is access all IDatagramSocketStatics;
   type IDatagramSocket_Interface;
   type IDatagramSocket is access all IDatagramSocket_Interface'Class;
   type IDatagramSocket_Ptr is access all IDatagramSocket;
   type IDatagramSocket2_Interface;
   type IDatagramSocket2 is access all IDatagramSocket2_Interface'Class;
   type IDatagramSocket2_Ptr is access all IDatagramSocket2;
   type IDatagramSocket3_Interface;
   type IDatagramSocket3 is access all IDatagramSocket3_Interface'Class;
   type IDatagramSocket3_Ptr is access all IDatagramSocket3;
   type IStreamSocketInformation_Interface;
   type IStreamSocketInformation is access all IStreamSocketInformation_Interface'Class;
   type IStreamSocketInformation_Ptr is access all IStreamSocketInformation;
   type IStreamSocketInformation2_Interface;
   type IStreamSocketInformation2 is access all IStreamSocketInformation2_Interface'Class;
   type IStreamSocketInformation2_Ptr is access all IStreamSocketInformation2;
   type IStreamSocketControl_Interface;
   type IStreamSocketControl is access all IStreamSocketControl_Interface'Class;
   type IStreamSocketControl_Ptr is access all IStreamSocketControl;
   type IStreamSocketControl2_Interface;
   type IStreamSocketControl2 is access all IStreamSocketControl2_Interface'Class;
   type IStreamSocketControl2_Ptr is access all IStreamSocketControl2;
   type IStreamSocketControl3_Interface;
   type IStreamSocketControl3 is access all IStreamSocketControl3_Interface'Class;
   type IStreamSocketControl3_Ptr is access all IStreamSocketControl3;
   type IStreamSocketControl4_Interface;
   type IStreamSocketControl4 is access all IStreamSocketControl4_Interface'Class;
   type IStreamSocketControl4_Ptr is access all IStreamSocketControl4;
   type IStreamSocket_Interface;
   type IStreamSocket is access all IStreamSocket_Interface'Class;
   type IStreamSocket_Ptr is access all IStreamSocket;
   type IStreamSocket2_Interface;
   type IStreamSocket2 is access all IStreamSocket2_Interface'Class;
   type IStreamSocket2_Ptr is access all IStreamSocket2;
   type IStreamSocket3_Interface;
   type IStreamSocket3 is access all IStreamSocket3_Interface'Class;
   type IStreamSocket3_Ptr is access all IStreamSocket3;
   type IStreamSocketStatics_Interface;
   type IStreamSocketStatics is access all IStreamSocketStatics_Interface'Class;
   type IStreamSocketStatics_Ptr is access all IStreamSocketStatics;
   type IStreamSocketListenerControl_Interface;
   type IStreamSocketListenerControl is access all IStreamSocketListenerControl_Interface'Class;
   type IStreamSocketListenerControl_Ptr is access all IStreamSocketListenerControl;
   type IStreamSocketListenerControl2_Interface;
   type IStreamSocketListenerControl2 is access all IStreamSocketListenerControl2_Interface'Class;
   type IStreamSocketListenerControl2_Ptr is access all IStreamSocketListenerControl2;
   type IStreamSocketListenerInformation_Interface;
   type IStreamSocketListenerInformation is access all IStreamSocketListenerInformation_Interface'Class;
   type IStreamSocketListenerInformation_Ptr is access all IStreamSocketListenerInformation;
   type IStreamSocketListenerConnectionReceivedEventArgs_Interface;
   type IStreamSocketListenerConnectionReceivedEventArgs is access all IStreamSocketListenerConnectionReceivedEventArgs_Interface'Class;
   type IStreamSocketListenerConnectionReceivedEventArgs_Ptr is access all IStreamSocketListenerConnectionReceivedEventArgs;
   type IStreamSocketListener_Interface;
   type IStreamSocketListener is access all IStreamSocketListener_Interface'Class;
   type IStreamSocketListener_Ptr is access all IStreamSocketListener;
   type IStreamSocketListener2_Interface;
   type IStreamSocketListener2 is access all IStreamSocketListener2_Interface'Class;
   type IStreamSocketListener2_Ptr is access all IStreamSocketListener2;
   type IStreamSocketListener3_Interface;
   type IStreamSocketListener3 is access all IStreamSocketListener3_Interface'Class;
   type IStreamSocketListener3_Ptr is access all IStreamSocketListener3;
   type IWebSocketServerCustomValidationRequestedEventArgs_Interface;
   type IWebSocketServerCustomValidationRequestedEventArgs is access all IWebSocketServerCustomValidationRequestedEventArgs_Interface'Class;
   type IWebSocketServerCustomValidationRequestedEventArgs_Ptr is access all IWebSocketServerCustomValidationRequestedEventArgs;
   type IWebSocketControl_Interface;
   type IWebSocketControl is access all IWebSocketControl_Interface'Class;
   type IWebSocketControl_Ptr is access all IWebSocketControl;
   type IWebSocketControl2_Interface;
   type IWebSocketControl2 is access all IWebSocketControl2_Interface'Class;
   type IWebSocketControl2_Ptr is access all IWebSocketControl2;
   type IWebSocketInformation_Interface;
   type IWebSocketInformation is access all IWebSocketInformation_Interface'Class;
   type IWebSocketInformation_Ptr is access all IWebSocketInformation;
   type IWebSocketInformation2_Interface;
   type IWebSocketInformation2 is access all IWebSocketInformation2_Interface'Class;
   type IWebSocketInformation2_Ptr is access all IWebSocketInformation2;
   type IWebSocket_Interface;
   type IWebSocket is access all IWebSocket_Interface'Class;
   type IWebSocket_Ptr is access all IWebSocket;
   type IMessageWebSocketControl_Interface;
   type IMessageWebSocketControl is access all IMessageWebSocketControl_Interface'Class;
   type IMessageWebSocketControl_Ptr is access all IMessageWebSocketControl;
   type IMessageWebSocketControl2_Interface;
   type IMessageWebSocketControl2 is access all IMessageWebSocketControl2_Interface'Class;
   type IMessageWebSocketControl2_Ptr is access all IMessageWebSocketControl2;
   type IMessageWebSocket_Interface;
   type IMessageWebSocket is access all IMessageWebSocket_Interface'Class;
   type IMessageWebSocket_Ptr is access all IMessageWebSocket;
   type IMessageWebSocket2_Interface;
   type IMessageWebSocket2 is access all IMessageWebSocket2_Interface'Class;
   type IMessageWebSocket2_Ptr is access all IMessageWebSocket2;
   type IStreamWebSocketControl_Interface;
   type IStreamWebSocketControl is access all IStreamWebSocketControl_Interface'Class;
   type IStreamWebSocketControl_Ptr is access all IStreamWebSocketControl;
   type IStreamWebSocketControl2_Interface;
   type IStreamWebSocketControl2 is access all IStreamWebSocketControl2_Interface'Class;
   type IStreamWebSocketControl2_Ptr is access all IStreamWebSocketControl2;
   type IStreamWebSocket_Interface;
   type IStreamWebSocket is access all IStreamWebSocket_Interface'Class;
   type IStreamWebSocket_Ptr is access all IStreamWebSocket;
   type IStreamWebSocket2_Interface;
   type IStreamWebSocket2 is access all IStreamWebSocket2_Interface'Class;
   type IStreamWebSocket2_Ptr is access all IStreamWebSocket2;
   type ISocketErrorStatics_Interface;
   type ISocketErrorStatics is access all ISocketErrorStatics_Interface'Class;
   type ISocketErrorStatics_Ptr is access all ISocketErrorStatics;
   type IWebSocketErrorStatics_Interface;
   type IWebSocketErrorStatics is access all IWebSocketErrorStatics_Interface'Class;
   type IWebSocketErrorStatics_Ptr is access all IWebSocketErrorStatics;
   type IControlChannelTrigger_Interface;
   type IControlChannelTrigger is access all IControlChannelTrigger_Interface'Class;
   type IControlChannelTrigger_Ptr is access all IControlChannelTrigger;
   type IControlChannelTriggerFactory_Interface;
   type IControlChannelTriggerFactory is access all IControlChannelTriggerFactory_Interface'Class;
   type IControlChannelTriggerFactory_Ptr is access all IControlChannelTriggerFactory;
   type IControlChannelTriggerEventDetails_Interface;
   type IControlChannelTriggerEventDetails is access all IControlChannelTriggerEventDetails_Interface'Class;
   type IControlChannelTriggerEventDetails_Ptr is access all IControlChannelTriggerEventDetails;
   type IControlChannelTriggerResetEventDetails_Interface;
   type IControlChannelTriggerResetEventDetails is access all IControlChannelTriggerResetEventDetails_Interface'Class;
   type IControlChannelTriggerResetEventDetails_Ptr is access all IControlChannelTriggerResetEventDetails;
   type IControlChannelTrigger2_Interface;
   type IControlChannelTrigger2 is access all IControlChannelTrigger2_Interface'Class;
   type IControlChannelTrigger2_Ptr is access all IControlChannelTrigger2;
   type IBackgroundTask_Imported_Interface;
   type IBackgroundTask_Imported is access all IBackgroundTask_Imported_Interface'Class;
   type IBackgroundTask_Imported_Ptr is access all IBackgroundTask_Imported;
   type IAsyncOperation_IStreamSocket_Interface;
   type IAsyncOperation_IStreamSocket is access all IAsyncOperation_IStreamSocket_Interface'Class;
   type IAsyncOperation_IStreamSocket_Ptr is access all IAsyncOperation_IStreamSocket;
   
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
   
   IID_ISocketActivityInformation : aliased constant Windows.IID := (2374648548, 43134, 19316, (153, 104, 24, 91, 37, 17, 222, 254 ));
   
   type ISocketActivityInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskId
   (
      This       : access ISocketActivityInformation_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access ISocketActivityInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SocketKind
   (
      This       : access ISocketActivityInformation_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketActivityKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Context
   (
      This       : access ISocketActivityInformation_Interface
      ; RetVal : access Windows.Networking.Sockets.ISocketActivityContext
   )
   return Windows.HRESULT is abstract;
   
   function get_DatagramSocket
   (
      This       : access ISocketActivityInformation_Interface
      ; RetVal : access Windows.Networking.Sockets.IDatagramSocket
   )
   return Windows.HRESULT is abstract;
   
   function get_StreamSocket
   (
      This       : access ISocketActivityInformation_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamSocket
   )
   return Windows.HRESULT is abstract;
   
   function get_StreamSocketListener
   (
      This       : access ISocketActivityInformation_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamSocketListener
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISocketActivityTriggerDetails : aliased constant Windows.IID := (1173620391, 64671, 20353, (172, 173, 53, 95, 239, 81, 230, 123 ));
   
   type ISocketActivityTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access ISocketActivityTriggerDetails_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketActivityTriggerReason
   )
   return Windows.HRESULT is abstract;
   
   function get_SocketInformation
   (
      This       : access ISocketActivityTriggerDetails_Interface
      ; RetVal : access Windows.Networking.Sockets.ISocketActivityInformation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISocketActivityInformationStatics : aliased constant Windows.IID := (2238755962, 32381, 18230, (128, 65, 19, 39, 166, 84, 60, 86 ));
   
   type ISocketActivityInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllSockets
   (
      This       : access ISocketActivityInformationStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISocketActivityContext : aliased constant Windows.IID := (1135627620, 19589, 17302, (166, 55, 29, 151, 63, 110, 189, 73 ));
   
   type ISocketActivityContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access ISocketActivityContext_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISocketActivityContextFactory : aliased constant Windows.IID := (3114255299, 2188, 17288, (131, 174, 37, 37, 19, 142, 4, 154 ));
   
   type ISocketActivityContextFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISocketActivityContextFactory_Interface
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Networking.Sockets.ISocketActivityContext
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDatagramSocketMessageReceivedEventArgs : aliased constant Windows.IID := (2653805730, 5906, 19684, (177, 121, 140, 101, 44, 109, 16, 126 ));
   
   type IDatagramSocketMessageReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteAddress
   (
      This       : access IDatagramSocketMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_RemotePort
   (
      This       : access IDatagramSocketMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalAddress
   (
      This       : access IDatagramSocketMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function GetDataReader
   (
      This       : access IDatagramSocketMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IDataReader
   )
   return Windows.HRESULT is abstract;
   
   function GetDataStream
   (
      This       : access IDatagramSocketMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMessageWebSocketMessageReceivedEventArgs : aliased constant Windows.IID := (1200366252, 19531, 17133, (158, 215, 30, 249, 249, 79, 163, 213 ));
   
   type IMessageWebSocketMessageReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MessageType
   (
      This       : access IMessageWebSocketMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketMessageType
   )
   return Windows.HRESULT is abstract;
   
   function GetDataReader
   (
      This       : access IMessageWebSocketMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IDataReader
   )
   return Windows.HRESULT is abstract;
   
   function GetDataStream
   (
      This       : access IMessageWebSocketMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMessageWebSocketMessageReceivedEventArgs2 : aliased constant Windows.IID := (2311980797, 56687, 18951, (135, 249, 249, 235, 77, 137, 216, 61 ));
   
   type IMessageWebSocketMessageReceivedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsMessageComplete
   (
      This       : access IMessageWebSocketMessageReceivedEventArgs2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IWebSocketClosedEventArgs : aliased constant Windows.IID := (3468135687, 53416, 18179, (160, 145, 200, 194, 192, 145, 91, 195 ));
   
   type IWebSocketClosedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Code
   (
      This       : access IWebSocketClosedEventArgs_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Reason
   (
      This       : access IWebSocketClosedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDatagramSocketInformation : aliased constant Windows.IID := (1595561626, 22011, 18637, (151, 6, 122, 151, 79, 123, 21, 133 ));
   
   type IDatagramSocketInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalAddress
   (
      This       : access IDatagramSocketInformation_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalPort
   (
      This       : access IDatagramSocketInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteAddress
   (
      This       : access IDatagramSocketInformation_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_RemotePort
   (
      This       : access IDatagramSocketInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDatagramSocketControl : aliased constant Windows.IID := (1387020078, 13466, 16693, (187, 88, 183, 155, 38, 71, 211, 144 ));
   
   type IDatagramSocketControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QualityOfService
   (
      This       : access IDatagramSocketControl_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketQualityOfService
   )
   return Windows.HRESULT is abstract;
   
   function put_QualityOfService
   (
      This       : access IDatagramSocketControl_Interface
      ; value : Windows.Networking.Sockets.SocketQualityOfService
   )
   return Windows.HRESULT is abstract;
   
   function get_OutboundUnicastHopLimit
   (
      This       : access IDatagramSocketControl_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_OutboundUnicastHopLimit
   (
      This       : access IDatagramSocketControl_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDatagramSocketControl2 : aliased constant Windows.IID := (871028162, 38812, 17429, (130, 161, 60, 250, 246, 70, 193, 146 ));
   
   type IDatagramSocketControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InboundBufferSizeInBytes
   (
      This       : access IDatagramSocketControl2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_InboundBufferSizeInBytes
   (
      This       : access IDatagramSocketControl2_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DontFragment
   (
      This       : access IDatagramSocketControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DontFragment
   (
      This       : access IDatagramSocketControl2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDatagramSocketControl3 : aliased constant Windows.IID := (3572204118, 8045, 17816, (155, 87, 212, 42, 0, 29, 243, 73 ));
   
   type IDatagramSocketControl3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MulticastOnly
   (
      This       : access IDatagramSocketControl3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_MulticastOnly
   (
      This       : access IDatagramSocketControl3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDatagramSocketStatics : aliased constant Windows.IID := (3922078446, 5268, 18977, (187, 126, 133, 137, 252, 117, 29, 157 ));
   
   type IDatagramSocketStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetEndpointPairsAsync
   (
      This       : access IDatagramSocketStatics_Interface
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetEndpointPairsWithSortOptionsAsync
   (
      This       : access IDatagramSocketStatics_Interface
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; sortOptions : Windows.Networking.HostNameSortOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDatagramSocket : aliased constant Windows.IID := (2145541051, 50108, 18039, (132, 70, 202, 40, 164, 101, 163, 175 ));
   
   type IDatagramSocket_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Control
   (
      This       : access IDatagramSocket_Interface
      ; RetVal : access Windows.Networking.Sockets.IDatagramSocketControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Information
   (
      This       : access IDatagramSocket_Interface
      ; RetVal : access Windows.Networking.Sockets.IDatagramSocketInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputStream
   (
      This       : access IDatagramSocket_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function ConnectAsync
   (
      This       : access IDatagramSocket_Interface
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ConnectWithEndpointPairAsync
   (
      This       : access IDatagramSocket_Interface
      ; endpointPair : Windows.Networking.IEndpointPair
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function BindServiceNameAsync
   (
      This       : access IDatagramSocket_Interface
      ; localServiceName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function BindEndpointAsync
   (
      This       : access IDatagramSocket_Interface
      ; localHostName : Windows.Networking.IHostName
      ; localServiceName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function JoinMulticastGroup
   (
      This       : access IDatagramSocket_Interface
      ; host : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function GetOutputStreamAsync
   (
      This       : access IDatagramSocket_Interface
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IOutputStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetOutputStreamWithEndpointPairAsync
   (
      This       : access IDatagramSocket_Interface
      ; endpointPair : Windows.Networking.IEndpointPair
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IOutputStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_MessageReceived
   (
      This       : access IDatagramSocket_Interface
      ; eventHandler : TypedEventHandler_IDatagramSocket_add_MessageReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MessageReceived
   (
      This       : access IDatagramSocket_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDatagramSocket2 : aliased constant Windows.IID := (3627787092, 39581, 16773, (162, 10, 20, 36, 201, 194, 167, 205 ));
   
   type IDatagramSocket2_Interface is interface and Windows.IInspectable_Interface;
   
   function BindServiceNameAndAdapterAsync
   (
      This       : access IDatagramSocket2_Interface
      ; localServiceName : Windows.String
      ; adapter : Windows.Networking.Connectivity.INetworkAdapter
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDatagramSocket3 : aliased constant Windows.IID := (928272137, 43922, 17158, (154, 193, 12, 56, 18, 131, 217, 198 ));
   
   type IDatagramSocket3_Interface is interface and Windows.IInspectable_Interface;
   
   function CancelIOAsync
   (
      This       : access IDatagramSocket3_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function EnableTransferOwnership
   (
      This       : access IDatagramSocket3_Interface
      ; taskId : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function EnableTransferOwnershipWithConnectedStandbyAction
   (
      This       : access IDatagramSocket3_Interface
      ; taskId : Windows.Guid
      ; connectedStandbyAction : Windows.Networking.Sockets.SocketActivityConnectedStandbyAction
   )
   return Windows.HRESULT is abstract;
   
   function TransferOwnership
   (
      This       : access IDatagramSocket3_Interface
      ; socketId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TransferOwnershipWithContext
   (
      This       : access IDatagramSocket3_Interface
      ; socketId : Windows.String
      ; data : Windows.Networking.Sockets.ISocketActivityContext
   )
   return Windows.HRESULT is abstract;
   
   function TransferOwnershipWithContextAndKeepAliveTime
   (
      This       : access IDatagramSocket3_Interface
      ; socketId : Windows.String
      ; data : Windows.Networking.Sockets.ISocketActivityContext
      ; keepAliveTime : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketInformation : aliased constant Windows.IID := (998288944, 24168, 16901, (136, 240, 220, 133, 210, 226, 93, 237 ));
   
   type IStreamSocketInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalAddress
   (
      This       : access IStreamSocketInformation_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalPort
   (
      This       : access IStreamSocketInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteHostName
   (
      This       : access IStreamSocketInformation_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteAddress
   (
      This       : access IStreamSocketInformation_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteServiceName
   (
      This       : access IStreamSocketInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemotePort
   (
      This       : access IStreamSocketInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RoundTripTimeStatistics
   (
      This       : access IStreamSocketInformation_Interface
      ; RetVal : access Windows.Networking.Sockets.RoundTripTimeStatistics
   )
   return Windows.HRESULT is abstract;
   
   function get_BandwidthStatistics
   (
      This       : access IStreamSocketInformation_Interface
      ; RetVal : access Windows.Networking.Sockets.BandwidthStatistics
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionLevel
   (
      This       : access IStreamSocketInformation_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionKey
   (
      This       : access IStreamSocketInformation_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketInformation2 : aliased constant Windows.IID := (314737746, 19420, 20196, (151, 106, 207, 19, 14, 157, 146, 227 ));
   
   type IStreamSocketInformation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServerCertificateErrorSeverity
   (
      This       : access IStreamSocketInformation2_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketSslErrorSeverity
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificateErrors
   (
      This       : access IStreamSocketInformation2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ChainValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificate
   (
      This       : access IStreamSocketInformation2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerIntermediateCertificates
   (
      This       : access IStreamSocketInformation2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketControl : aliased constant Windows.IID := (4263882225, 37547, 19187, (153, 146, 15, 76, 133, 227, 108, 196 ));
   
   type IStreamSocketControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NoDelay
   (
      This       : access IStreamSocketControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_NoDelay
   (
      This       : access IStreamSocketControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_KeepAlive
   (
      This       : access IStreamSocketControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_KeepAlive
   (
      This       : access IStreamSocketControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_OutboundBufferSizeInBytes
   (
      This       : access IStreamSocketControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_OutboundBufferSizeInBytes
   (
      This       : access IStreamSocketControl_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_QualityOfService
   (
      This       : access IStreamSocketControl_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketQualityOfService
   )
   return Windows.HRESULT is abstract;
   
   function put_QualityOfService
   (
      This       : access IStreamSocketControl_Interface
      ; value : Windows.Networking.Sockets.SocketQualityOfService
   )
   return Windows.HRESULT is abstract;
   
   function get_OutboundUnicastHopLimit
   (
      This       : access IStreamSocketControl_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_OutboundUnicastHopLimit
   (
      This       : access IStreamSocketControl_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketControl2 : aliased constant Windows.IID := (3268450902, 1551, 17601, (184, 226, 31, 191, 96, 189, 98, 197 ));
   
   type IStreamSocketControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IgnorableServerCertificateErrors
   (
      This       : access IStreamSocketControl2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVector_ChainValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketControl3 : aliased constant Windows.IID := (3312075852, 20084, 16446, (137, 76, 179, 28, 174, 92, 115, 66 ));
   
   type IStreamSocketControl3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SerializeConnectionAttempts
   (
      This       : access IStreamSocketControl3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SerializeConnectionAttempts
   (
      This       : access IStreamSocketControl3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ClientCertificate
   (
      This       : access IStreamSocketControl3_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function put_ClientCertificate
   (
      This       : access IStreamSocketControl3_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketControl4 : aliased constant Windows.IID := (2521705277, 60455, 18568, (179, 206, 199, 75, 65, 132, 35, 173 ));
   
   type IStreamSocketControl4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinProtectionLevel
   (
      This       : access IStreamSocketControl4_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function put_MinProtectionLevel
   (
      This       : access IStreamSocketControl4_Interface
      ; value : Windows.Networking.Sockets.SocketProtectionLevel
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocket : aliased constant Windows.IID := (1772236019, 64635, 18519, (175, 56, 246, 231, 222, 106, 91, 73 ));
   
   type IStreamSocket_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Control
   (
      This       : access IStreamSocket_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamSocketControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Information
   (
      This       : access IStreamSocket_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamSocketInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_InputStream
   (
      This       : access IStreamSocket_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputStream
   (
      This       : access IStreamSocket_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function ConnectWithEndpointPairAsync
   (
      This       : access IStreamSocket_Interface
      ; endpointPair : Windows.Networking.IEndpointPair
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ConnectAsync
   (
      This       : access IStreamSocket_Interface
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ConnectWithEndpointPairAndProtectionLevelAsync
   (
      This       : access IStreamSocket_Interface
      ; endpointPair : Windows.Networking.IEndpointPair
      ; protectionLevel : Windows.Networking.Sockets.SocketProtectionLevel
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ConnectWithProtectionLevelAsync
   (
      This       : access IStreamSocket_Interface
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; protectionLevel : Windows.Networking.Sockets.SocketProtectionLevel
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UpgradeToSslAsync
   (
      This       : access IStreamSocket_Interface
      ; protectionLevel : Windows.Networking.Sockets.SocketProtectionLevel
      ; validationHostName : Windows.Networking.IHostName
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocket2 : aliased constant Windows.IID := (701556085, 62228, 19721, (173, 240, 15, 189, 150, 127, 189, 159 ));
   
   type IStreamSocket2_Interface is interface and Windows.IInspectable_Interface;
   
   function ConnectWithProtectionLevelAndAdapterAsync
   (
      This       : access IStreamSocket2_Interface
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; protectionLevel : Windows.Networking.Sockets.SocketProtectionLevel
      ; adapter : Windows.Networking.Connectivity.INetworkAdapter
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocket3 : aliased constant Windows.IID := (1061358336, 40232, 18516, (186, 195, 35, 1, 148, 30, 194, 35 ));
   
   type IStreamSocket3_Interface is interface and Windows.IInspectable_Interface;
   
   function CancelIOAsync
   (
      This       : access IStreamSocket3_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function EnableTransferOwnership
   (
      This       : access IStreamSocket3_Interface
      ; taskId : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function EnableTransferOwnershipWithConnectedStandbyAction
   (
      This       : access IStreamSocket3_Interface
      ; taskId : Windows.Guid
      ; connectedStandbyAction : Windows.Networking.Sockets.SocketActivityConnectedStandbyAction
   )
   return Windows.HRESULT is abstract;
   
   function TransferOwnership
   (
      This       : access IStreamSocket3_Interface
      ; socketId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TransferOwnershipWithContext
   (
      This       : access IStreamSocket3_Interface
      ; socketId : Windows.String
      ; data : Windows.Networking.Sockets.ISocketActivityContext
   )
   return Windows.HRESULT is abstract;
   
   function TransferOwnershipWithContextAndKeepAliveTime
   (
      This       : access IStreamSocket3_Interface
      ; socketId : Windows.String
      ; data : Windows.Networking.Sockets.ISocketActivityContext
      ; keepAliveTime : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketStatics : aliased constant Windows.IID := (2753608778, 28206, 19189, (181, 86, 53, 90, 224, 205, 79, 41 ));
   
   type IStreamSocketStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetEndpointPairsAsync
   (
      This       : access IStreamSocketStatics_Interface
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetEndpointPairsWithSortOptionsAsync
   (
      This       : access IStreamSocketStatics_Interface
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; sortOptions : Windows.Networking.HostNameSortOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketListenerControl : aliased constant Windows.IID := (551077238, 36234, 19898, (151, 34, 161, 108, 77, 152, 73, 128 ));
   
   type IStreamSocketListenerControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QualityOfService
   (
      This       : access IStreamSocketListenerControl_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketQualityOfService
   )
   return Windows.HRESULT is abstract;
   
   function put_QualityOfService
   (
      This       : access IStreamSocketListenerControl_Interface
      ; value : Windows.Networking.Sockets.SocketQualityOfService
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketListenerControl2 : aliased constant Windows.IID := (2492184165, 11326, 16459, (184, 176, 142, 178, 73, 162, 176, 161 ));
   
   type IStreamSocketListenerControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NoDelay
   (
      This       : access IStreamSocketListenerControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_NoDelay
   (
      This       : access IStreamSocketListenerControl2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_KeepAlive
   (
      This       : access IStreamSocketListenerControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_KeepAlive
   (
      This       : access IStreamSocketListenerControl2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_OutboundBufferSizeInBytes
   (
      This       : access IStreamSocketListenerControl2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_OutboundBufferSizeInBytes
   (
      This       : access IStreamSocketListenerControl2_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_OutboundUnicastHopLimit
   (
      This       : access IStreamSocketListenerControl2_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_OutboundUnicastHopLimit
   (
      This       : access IStreamSocketListenerControl2_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketListenerInformation : aliased constant Windows.IID := (3861620783, 42554, 17163, (191, 98, 41, 233, 62, 86, 51, 180 ));
   
   type IStreamSocketListenerInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalPort
   (
      This       : access IStreamSocketListenerInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketListenerConnectionReceivedEventArgs : aliased constant Windows.IID := (205991593, 14143, 17531, (133, 177, 221, 212, 84, 136, 3, 186 ));
   
   type IStreamSocketListenerConnectionReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Socket
   (
      This       : access IStreamSocketListenerConnectionReceivedEventArgs_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamSocket
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketListener : aliased constant Windows.IID := (4283511863, 57247, 19952, (191, 130, 14, 197, 215, 179, 90, 174 ));
   
   type IStreamSocketListener_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Control
   (
      This       : access IStreamSocketListener_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamSocketListenerControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Information
   (
      This       : access IStreamSocketListener_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamSocketListenerInformation
   )
   return Windows.HRESULT is abstract;
   
   function BindServiceNameAsync
   (
      This       : access IStreamSocketListener_Interface
      ; localServiceName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function BindEndpointAsync
   (
      This       : access IStreamSocketListener_Interface
      ; localHostName : Windows.Networking.IHostName
      ; localServiceName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_ConnectionReceived
   (
      This       : access IStreamSocketListener_Interface
      ; eventHandler : TypedEventHandler_IStreamSocketListener_add_ConnectionReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ConnectionReceived
   (
      This       : access IStreamSocketListener_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketListener2 : aliased constant Windows.IID := (1703788862, 47934, 17496, (178, 50, 237, 16, 136, 105, 75, 152 ));
   
   type IStreamSocketListener2_Interface is interface and Windows.IInspectable_Interface;
   
   function BindServiceNameWithProtectionLevelAsync
   (
      This       : access IStreamSocketListener2_Interface
      ; localServiceName : Windows.String
      ; protectionLevel : Windows.Networking.Sockets.SocketProtectionLevel
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function BindServiceNameWithProtectionLevelAndAdapterAsync
   (
      This       : access IStreamSocketListener2_Interface
      ; localServiceName : Windows.String
      ; protectionLevel : Windows.Networking.Sockets.SocketProtectionLevel
      ; adapter : Windows.Networking.Connectivity.INetworkAdapter
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamSocketListener3 : aliased constant Windows.IID := (1201152028, 48632, 18713, (133, 66, 40, 212, 80, 231, 69, 7 ));
   
   type IStreamSocketListener3_Interface is interface and Windows.IInspectable_Interface;
   
   function CancelIOAsync
   (
      This       : access IStreamSocketListener3_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function EnableTransferOwnership
   (
      This       : access IStreamSocketListener3_Interface
      ; taskId : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function EnableTransferOwnershipWithConnectedStandbyAction
   (
      This       : access IStreamSocketListener3_Interface
      ; taskId : Windows.Guid
      ; connectedStandbyAction : Windows.Networking.Sockets.SocketActivityConnectedStandbyAction
   )
   return Windows.HRESULT is abstract;
   
   function TransferOwnership
   (
      This       : access IStreamSocketListener3_Interface
      ; socketId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TransferOwnershipWithContext
   (
      This       : access IStreamSocketListener3_Interface
      ; socketId : Windows.String
      ; data : Windows.Networking.Sockets.ISocketActivityContext
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IWebSocketServerCustomValidationRequestedEventArgs : aliased constant Windows.IID := (4293918280, 554, 19127, (139, 54, 225, 10, 244, 100, 14, 107 ));
   
   type IWebSocketServerCustomValidationRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServerCertificate
   (
      This       : access IWebSocketServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificateErrorSeverity
   (
      This       : access IWebSocketServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketSslErrorSeverity
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificateErrors
   (
      This       : access IWebSocketServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ChainValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerIntermediateCertificates
   (
      This       : access IWebSocketServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Reject
   (
      This       : access IWebSocketServerCustomValidationRequestedEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IWebSocketServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IWebSocketControl : aliased constant Windows.IID := (784645571, 55717, 17754, (152, 17, 222, 36, 212, 83, 55, 233 ));
   
   type IWebSocketControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OutboundBufferSizeInBytes
   (
      This       : access IWebSocketControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_OutboundBufferSizeInBytes
   (
      This       : access IWebSocketControl_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCredential
   (
      This       : access IWebSocketControl_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_ServerCredential
   (
      This       : access IWebSocketControl_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_ProxyCredential
   (
      This       : access IWebSocketControl_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_ProxyCredential
   (
      This       : access IWebSocketControl_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedProtocols
   (
      This       : access IWebSocketControl_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IWebSocketControl2 : aliased constant Windows.IID := (2042871299, 62154, 17950, (175, 78, 150, 101, 188, 45, 6, 32 ));
   
   type IWebSocketControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IgnorableServerCertificateErrors
   (
      This       : access IWebSocketControl2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVector_ChainValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IWebSocketInformation : aliased constant Windows.IID := (1577181974, 51498, 18341, (178, 95, 7, 132, 118, 57, 209, 129 ));
   
   type IWebSocketInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalAddress
   (
      This       : access IWebSocketInformation_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_BandwidthStatistics
   (
      This       : access IWebSocketInformation_Interface
      ; RetVal : access Windows.Networking.Sockets.BandwidthStatistics
   )
   return Windows.HRESULT is abstract;
   
   function get_Protocol
   (
      This       : access IWebSocketInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IWebSocketInformation2 : aliased constant Windows.IID := (3458021838, 41399, 19779, (130, 105, 141, 91, 152, 27, 212, 122 ));
   
   type IWebSocketInformation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServerCertificate
   (
      This       : access IWebSocketInformation2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificateErrorSeverity
   (
      This       : access IWebSocketInformation2_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketSslErrorSeverity
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificateErrors
   (
      This       : access IWebSocketInformation2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ChainValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerIntermediateCertificates
   (
      This       : access IWebSocketInformation2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IWebSocket : aliased constant Windows.IID := (4168563055, 39345, 19992, (188, 8, 133, 12, 154, 223, 21, 110 ));
   
   type IWebSocket_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OutputStream
   (
      This       : access IWebSocket_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function ConnectAsync
   (
      This       : access IWebSocket_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetRequestHeader
   (
      This       : access IWebSocket_Interface
      ; headerName : Windows.String
      ; headerValue : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_Closed
   (
      This       : access IWebSocket_Interface
      ; eventHandler : TypedEventHandler_IWebSocket_add_Closed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access IWebSocket_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CloseWithStatus
   (
      This       : access IWebSocket_Interface
      ; code : Windows.UInt16
      ; reason : Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMessageWebSocketControl : aliased constant Windows.IID := (2165848202, 50729, 20234, (128, 251, 129, 252, 5, 83, 136, 98 ));
   
   type IMessageWebSocketControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxMessageSize
   (
      This       : access IMessageWebSocketControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxMessageSize
   (
      This       : access IMessageWebSocketControl_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageType
   (
      This       : access IMessageWebSocketControl_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketMessageType
   )
   return Windows.HRESULT is abstract;
   
   function put_MessageType
   (
      This       : access IMessageWebSocketControl_Interface
      ; value : Windows.Networking.Sockets.SocketMessageType
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMessageWebSocketControl2 : aliased constant Windows.IID := (3809466257, 2060, 16394, (167, 18, 39, 223, 169, 231, 68, 216 ));
   
   type IMessageWebSocketControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredUnsolicitedPongInterval
   (
      This       : access IMessageWebSocketControl2_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredUnsolicitedPongInterval
   (
      This       : access IMessageWebSocketControl2_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualUnsolicitedPongInterval
   (
      This       : access IMessageWebSocketControl2_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ReceiveMode
   (
      This       : access IMessageWebSocketControl2_Interface
      ; RetVal : access Windows.Networking.Sockets.MessageWebSocketReceiveMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ReceiveMode
   (
      This       : access IMessageWebSocketControl2_Interface
      ; value : Windows.Networking.Sockets.MessageWebSocketReceiveMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ClientCertificate
   (
      This       : access IMessageWebSocketControl2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function put_ClientCertificate
   (
      This       : access IMessageWebSocketControl2_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMessageWebSocket : aliased constant Windows.IID := (863141128, 13525, 18246, (173, 123, 141, 222, 91, 194, 239, 136 ));
   
   type IMessageWebSocket_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Control
   (
      This       : access IMessageWebSocket_Interface
      ; RetVal : access Windows.Networking.Sockets.IMessageWebSocketControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Information
   (
      This       : access IMessageWebSocket_Interface
      ; RetVal : access Windows.Networking.Sockets.IWebSocketInformation
   )
   return Windows.HRESULT is abstract;
   
   function add_MessageReceived
   (
      This       : access IMessageWebSocket_Interface
      ; eventHandler : TypedEventHandler_IMessageWebSocket_add_MessageReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MessageReceived
   (
      This       : access IMessageWebSocket_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMessageWebSocket2 : aliased constant Windows.IID := (3201355495, 63944, 17418, (154, 213, 115, 114, 129, 217, 116, 46 ));
   
   type IMessageWebSocket2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ServerCustomValidationRequested
   (
      This       : access IMessageWebSocket2_Interface
      ; eventHandler : TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ServerCustomValidationRequested
   (
      This       : access IMessageWebSocket2_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamWebSocketControl : aliased constant Windows.IID := (3035920561, 42074, 18651, (149, 58, 100, 91, 125, 150, 76, 7 ));
   
   type IStreamWebSocketControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NoDelay
   (
      This       : access IStreamWebSocketControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_NoDelay
   (
      This       : access IStreamWebSocketControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamWebSocketControl2 : aliased constant Windows.IID := (559783806, 64088, 16602, (159, 17, 164, 141, 175, 233, 80, 55 ));
   
   type IStreamWebSocketControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredUnsolicitedPongInterval
   (
      This       : access IStreamWebSocketControl2_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredUnsolicitedPongInterval
   (
      This       : access IStreamWebSocketControl2_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualUnsolicitedPongInterval
   (
      This       : access IStreamWebSocketControl2_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ClientCertificate
   (
      This       : access IStreamWebSocketControl2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function put_ClientCertificate
   (
      This       : access IStreamWebSocketControl2_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamWebSocket : aliased constant Windows.IID := (3175762392, 45705, 17851, (151, 235, 199, 82, 82, 5, 168, 67 ));
   
   type IStreamWebSocket_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Control
   (
      This       : access IStreamWebSocket_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamWebSocketControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Information
   (
      This       : access IStreamWebSocket_Interface
      ; RetVal : access Windows.Networking.Sockets.IWebSocketInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_InputStream
   (
      This       : access IStreamWebSocket_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStreamWebSocket2 : aliased constant Windows.IID := (2857175243, 37877, 18040, (130, 54, 87, 204, 229, 65, 126, 213 ));
   
   type IStreamWebSocket2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ServerCustomValidationRequested
   (
      This       : access IStreamWebSocket2_Interface
      ; eventHandler : TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ServerCustomValidationRequested
   (
      This       : access IStreamWebSocket2_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISocketErrorStatics : aliased constant Windows.IID := (2189637620, 32086, 19854, (183, 180, 160, 125, 215, 193, 188, 169 ));
   
   type ISocketErrorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStatus
   (
      This       : access ISocketErrorStatics_Interface
      ; hresult : Windows.Int32
      ; RetVal : access Windows.Networking.Sockets.SocketErrorStatus
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IWebSocketErrorStatics : aliased constant Windows.IID := (667808603, 8033, 18185, (142, 2, 97, 40, 58, 218, 78, 157 ));
   
   type IWebSocketErrorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStatus
   (
      This       : access IWebSocketErrorStatics_Interface
      ; hresult : Windows.Int32
      ; RetVal : access Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IControlChannelTrigger : aliased constant Windows.IID := (2098475431, 61078, 16616, (161, 153, 135, 3, 205, 150, 158, 195 ));
   
   type IControlChannelTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ControlChannelTriggerId
   (
      This       : access IControlChannelTrigger_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerKeepAliveIntervalInMinutes
   (
      This       : access IControlChannelTrigger_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ServerKeepAliveIntervalInMinutes
   (
      This       : access IControlChannelTrigger_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentKeepAliveIntervalInMinutes
   (
      This       : access IControlChannelTrigger_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportObject
   (
      This       : access IControlChannelTrigger_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_KeepAliveTrigger
   (
      This       : access IControlChannelTrigger_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTrigger
   )
   return Windows.HRESULT is abstract;
   
   function get_PushNotificationTrigger
   (
      This       : access IControlChannelTrigger_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTrigger
   )
   return Windows.HRESULT is abstract;
   
   function UsingTransport
   (
      This       : access IControlChannelTrigger_Interface
      ; transport : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function WaitForPushEnabled
   (
      This       : access IControlChannelTrigger_Interface
      ; RetVal : access Windows.Networking.Sockets.ControlChannelTriggerStatus
   )
   return Windows.HRESULT is abstract;
   
   function DecreaseNetworkKeepAliveInterval
   (
      This       : access IControlChannelTrigger_Interface
   )
   return Windows.HRESULT is abstract;
   
   function FlushTransport
   (
      This       : access IControlChannelTrigger_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IControlChannelTriggerFactory : aliased constant Windows.IID := (3662380272, 36209, 17519, (136, 195, 185, 81, 132, 162, 214, 205 ));
   
   type IControlChannelTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateControlChannelTrigger
   (
      This       : access IControlChannelTriggerFactory_Interface
      ; channelId : Windows.String
      ; serverKeepAliveIntervalInMinutes : Windows.UInt32
      ; RetVal : access Windows.Networking.Sockets.IControlChannelTrigger
   )
   return Windows.HRESULT is abstract;
   
   function CreateControlChannelTriggerEx
   (
      This       : access IControlChannelTriggerFactory_Interface
      ; channelId : Windows.String
      ; serverKeepAliveIntervalInMinutes : Windows.UInt32
      ; resourceRequestType : Windows.Networking.Sockets.ControlChannelTriggerResourceType
      ; RetVal : access Windows.Networking.Sockets.IControlChannelTrigger
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IControlChannelTriggerEventDetails : aliased constant Windows.IID := (456581191, 35259, 16950, (150, 172, 113, 208, 18, 187, 72, 105 ));
   
   type IControlChannelTriggerEventDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ControlChannelTrigger
   (
      This       : access IControlChannelTriggerEventDetails_Interface
      ; RetVal : access Windows.Networking.Sockets.IControlChannelTrigger
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IControlChannelTriggerResetEventDetails : aliased constant Windows.IID := (1750139790, 36548, 17150, (155, 178, 33, 233, 27, 123, 252, 177 ));
   
   type IControlChannelTriggerResetEventDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResetReason
   (
      This       : access IControlChannelTriggerResetEventDetails_Interface
      ; RetVal : access Windows.Networking.Sockets.ControlChannelTriggerResetReason
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareSlotReset
   (
      This       : access IControlChannelTriggerResetEventDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SoftwareSlotReset
   (
      This       : access IControlChannelTriggerResetEventDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IControlChannelTrigger2 : aliased constant Windows.IID := (2936066615, 20926, 17684, (151, 37, 53, 86, 225, 135, 149, 128 ));
   
   type IControlChannelTrigger2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsWakeFromLowPowerSupported
   (
      This       : access IControlChannelTrigger2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IBackgroundTask_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function Run
   (
      This       : access IBackgroundTask_Imported_Interface
      ; taskInstance : Windows.ApplicationModel.Background.IBackgroundTaskInstance
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IStreamSocket : aliased constant Windows.IID := (4215160124, 28645, 24103, (161, 50, 144, 34, 71, 226, 169, 62 ));
   
   type IAsyncOperation_IStreamSocket_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStreamSocket_Interface
      ; handler : Windows.Networking.Sockets.AsyncOperationCompletedHandler_IStreamSocket
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStreamSocket_Interface
      ; RetVal : access Windows.Networking.Sockets.AsyncOperationCompletedHandler_IStreamSocket
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStreamSocket_Interface
      ; RetVal : access Windows.Networking.Sockets.IStreamSocket
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IStreamSocket : aliased constant Windows.IID := (1907743134, 14420, 24218, (180, 220, 209, 181, 139, 241, 152, 252 ));
   
   type AsyncOperationCompletedHandler_IStreamSocket_Interface(Callback : access procedure (asyncInfo : Windows.Networking.Sockets.IAsyncOperation_IStreamSocket ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IStreamSocket'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStreamSocket_Interface
      ; asyncInfo : Windows.Networking.Sockets.IAsyncOperation_IStreamSocket
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDatagramSocket_add_MessageReceived : aliased constant Windows.IID := (1149428123, 9097, 22375, (155, 11, 141, 122, 142, 245, 87, 67 ));
   
   type TypedEventHandler_IDatagramSocket_add_MessageReceived_Interface(Callback : access procedure (sender : Windows.Networking.Sockets.IDatagramSocket ; args : Windows.Networking.Sockets.IDatagramSocketMessageReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDatagramSocket_add_MessageReceived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDatagramSocket_add_MessageReceived_Interface
      ; sender : Windows.Networking.Sockets.IDatagramSocket
      ; args : Windows.Networking.Sockets.IDatagramSocketMessageReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IStreamSocketListener_add_ConnectionReceived : aliased constant Windows.IID := (869272897, 51535, 23137, (154, 183, 40, 13, 206, 250, 11, 8 ));
   
   type TypedEventHandler_IStreamSocketListener_add_ConnectionReceived_Interface(Callback : access procedure (sender : Windows.Networking.Sockets.IStreamSocketListener ; args : Windows.Networking.Sockets.IStreamSocketListenerConnectionReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IStreamSocketListener_add_ConnectionReceived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStreamSocketListener_add_ConnectionReceived_Interface
      ; sender : Windows.Networking.Sockets.IStreamSocketListener
      ; args : Windows.Networking.Sockets.IStreamSocketListenerConnectionReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebSocket_add_Closed : aliased constant Windows.IID := (63934352, 5737, 24397, (148, 4, 43, 120, 70, 120, 230, 221 ));
   
   type TypedEventHandler_IWebSocket_add_Closed_Interface(Callback : access procedure (sender : Windows.Networking.Sockets.IWebSocket ; args : Windows.Networking.Sockets.IWebSocketClosedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebSocket_add_Closed'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebSocket_add_Closed_Interface
      ; sender : Windows.Networking.Sockets.IWebSocket
      ; args : Windows.Networking.Sockets.IWebSocketClosedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMessageWebSocket_add_MessageReceived : aliased constant Windows.IID := (3734504760, 28109, 21168, (128, 47, 75, 108, 245, 154, 1, 171 ));
   
   type TypedEventHandler_IMessageWebSocket_add_MessageReceived_Interface(Callback : access procedure (sender : Windows.Networking.Sockets.IMessageWebSocket ; args : Windows.Networking.Sockets.IMessageWebSocketMessageReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMessageWebSocket_add_MessageReceived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMessageWebSocket_add_MessageReceived_Interface
      ; sender : Windows.Networking.Sockets.IMessageWebSocket
      ; args : Windows.Networking.Sockets.IMessageWebSocketMessageReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested : aliased constant Windows.IID := (741655941, 40182, 22215, (141, 209, 93, 162, 110, 50, 32, 120 ));
   
   type TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested_Interface(Callback : access procedure (sender : Windows.Networking.Sockets.IMessageWebSocket ; args : Windows.Networking.Sockets.IWebSocketServerCustomValidationRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested_Interface
      ; sender : Windows.Networking.Sockets.IMessageWebSocket
      ; args : Windows.Networking.Sockets.IWebSocketServerCustomValidationRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested : aliased constant Windows.IID := (414270419, 35198, 22878, (172, 193, 239, 53, 97, 75, 76, 236 ));
   
   type TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested_Interface(Callback : access procedure (sender : Windows.Networking.Sockets.IStreamWebSocket ; args : Windows.Networking.Sockets.IWebSocketServerCustomValidationRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested_Interface
      ; sender : Windows.Networking.Sockets.IStreamWebSocket
      ; args : Windows.Networking.Sockets.IWebSocketServerCustomValidationRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SocketActivityContext is Windows.Networking.Sockets.ISocketActivityContext;
   
   function Create
   (
      data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Networking.Sockets.ISocketActivityContext;
   
   subtype DatagramSocket is Windows.Networking.Sockets.IDatagramSocket;
   
   function CreateDatagramSocket return Windows.Networking.Sockets.IDatagramSocket;
   
   subtype StreamSocket is Windows.Networking.Sockets.IStreamSocket;
   
   function CreateStreamSocket return Windows.Networking.Sockets.IStreamSocket;
   
   subtype StreamSocketListener is Windows.Networking.Sockets.IStreamSocketListener;
   
   function CreateStreamSocketListener return Windows.Networking.Sockets.IStreamSocketListener;
   
   subtype SocketActivityInformation is Windows.Networking.Sockets.ISocketActivityInformation;
   subtype DatagramSocketControl is Windows.Networking.Sockets.IDatagramSocketControl;
   subtype DatagramSocketInformation is Windows.Networking.Sockets.IDatagramSocketInformation;
   subtype DatagramSocketMessageReceivedEventArgs is Windows.Networking.Sockets.IDatagramSocketMessageReceivedEventArgs;
   subtype StreamSocketControl is Windows.Networking.Sockets.IStreamSocketControl;
   subtype StreamSocketInformation is Windows.Networking.Sockets.IStreamSocketInformation;
   subtype StreamSocketListenerControl is Windows.Networking.Sockets.IStreamSocketListenerControl;
   subtype StreamSocketListenerInformation is Windows.Networking.Sockets.IStreamSocketListenerInformation;
   subtype StreamSocketListenerConnectionReceivedEventArgs is Windows.Networking.Sockets.IStreamSocketListenerConnectionReceivedEventArgs;
   subtype WebSocketClosedEventArgs is Windows.Networking.Sockets.IWebSocketClosedEventArgs;
   subtype MessageWebSocketControl is Windows.Networking.Sockets.IMessageWebSocketControl;
   subtype MessageWebSocketInformation is Windows.Networking.Sockets.IWebSocketInformation;
   subtype MessageWebSocket is Windows.Networking.Sockets.IMessageWebSocket;
   
   function CreateMessageWebSocket return Windows.Networking.Sockets.IMessageWebSocket;
   
   subtype MessageWebSocketMessageReceivedEventArgs is Windows.Networking.Sockets.IMessageWebSocketMessageReceivedEventArgs;
   subtype WebSocketServerCustomValidationRequestedEventArgs is Windows.Networking.Sockets.IWebSocketServerCustomValidationRequestedEventArgs;
   subtype StreamWebSocketControl is Windows.Networking.Sockets.IStreamWebSocketControl;
   subtype StreamWebSocketInformation is Windows.Networking.Sockets.IWebSocketInformation;
   subtype StreamWebSocket is Windows.Networking.Sockets.IStreamWebSocket;
   
   function CreateStreamWebSocket return Windows.Networking.Sockets.IStreamWebSocket;
   
   subtype WebSocketKeepAlive is Windows.ApplicationModel.Background.IBackgroundTask;
   
   function CreateWebSocketKeepAlive return Windows.ApplicationModel.Background.IBackgroundTask;
   
   subtype SocketActivityTriggerDetails is Windows.Networking.Sockets.ISocketActivityTriggerDetails;
   subtype ControlChannelTrigger is Windows.Networking.Sockets.IControlChannelTrigger;
   
   function CreateControlChannelTrigger
   (
      channelId : Windows.String
      ; serverKeepAliveIntervalInMinutes : Windows.UInt32
   )
   return Windows.Networking.Sockets.IControlChannelTrigger;
   
   function CreateControlChannelTriggerEx
   (
      channelId : Windows.String
      ; serverKeepAliveIntervalInMinutes : Windows.UInt32
      ; resourceRequestType : Windows.Networking.Sockets.ControlChannelTriggerResourceType
   )
   return Windows.Networking.Sockets.IControlChannelTrigger;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetEndpointPairsAsync
   (
      remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
   )
   return Windows.Address;
   
   function GetEndpointPairsWithSortOptionsAsync
   (
      remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; sortOptions : Windows.Networking.HostNameSortOptions
   )
   return Windows.Address;
   
   function GetEndpointPairsAsync_IStreamSocket
   (
      remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
   )
   return Windows.Address;
   
   function GetEndpointPairsWithSortOptionsAsync_IStreamSocket
   (
      remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; sortOptions : Windows.Networking.HostNameSortOptions
   )
   return Windows.Address;
   
   function get_AllSockets
   return Windows.Address;
   
   function GetStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Networking.Sockets.SocketErrorStatus;
   
   function GetStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Web.WebErrorStatus;

end;
