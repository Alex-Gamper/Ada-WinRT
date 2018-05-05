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
limited with Windows.Web.Http;
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.ApplicationModel.AppService;
limited with Windows.Networking.Sockets;
--------------------------------------------------------------------------------
package Windows.System.Diagnostics.DevicePortal is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DevicePortalConnectionClosedReason is (
      Unknown,
      ResourceLimitsExceeded,
      ProtocolError,
      NotAuthorized,
      UserNotPresent,
      ServiceTerminated
   );
   for DevicePortalConnectionClosedReason use (
      Unknown => 0,
      ResourceLimitsExceeded => 1,
      ProtocolError => 2,
      NotAuthorized => 3,
      UserNotPresent => 4,
      ServiceTerminated => 5
   );
   for DevicePortalConnectionClosedReason'Size use 32;
   
   type DevicePortalConnectionClosedReason_Ptr is access DevicePortalConnectionClosedReason;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IDevicePortalConnection_add_Closed_Interface;
   type TypedEventHandler_IDevicePortalConnection_add_Closed is access all TypedEventHandler_IDevicePortalConnection_add_Closed_Interface'Class;
   type TypedEventHandler_IDevicePortalConnection_add_Closed_Ptr is access all TypedEventHandler_IDevicePortalConnection_add_Closed;
   type TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface;
   type TypedEventHandler_IDevicePortalConnection_add_RequestReceived is access all TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface'Class;
   type TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Ptr is access all TypedEventHandler_IDevicePortalConnection_add_RequestReceived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDevicePortalConnectionClosedEventArgs_Interface;
   type IDevicePortalConnectionClosedEventArgs is access all IDevicePortalConnectionClosedEventArgs_Interface'Class;
   type IDevicePortalConnectionClosedEventArgs_Ptr is access all IDevicePortalConnectionClosedEventArgs;
   type IDevicePortalConnectionRequestReceivedEventArgs_Interface;
   type IDevicePortalConnectionRequestReceivedEventArgs is access all IDevicePortalConnectionRequestReceivedEventArgs_Interface'Class;
   type IDevicePortalConnectionRequestReceivedEventArgs_Ptr is access all IDevicePortalConnectionRequestReceivedEventArgs;
   type IDevicePortalWebSocketConnectionRequestReceivedEventArgs_Interface;
   type IDevicePortalWebSocketConnectionRequestReceivedEventArgs is access all IDevicePortalWebSocketConnectionRequestReceivedEventArgs_Interface'Class;
   type IDevicePortalWebSocketConnectionRequestReceivedEventArgs_Ptr is access all IDevicePortalWebSocketConnectionRequestReceivedEventArgs;
   type IDevicePortalConnectionStatics_Interface;
   type IDevicePortalConnectionStatics is access all IDevicePortalConnectionStatics_Interface'Class;
   type IDevicePortalConnectionStatics_Ptr is access all IDevicePortalConnectionStatics;
   type IDevicePortalConnection_Interface;
   type IDevicePortalConnection is access all IDevicePortalConnection_Interface'Class;
   type IDevicePortalConnection_Ptr is access all IDevicePortalConnection;
   type IDevicePortalWebSocketConnection_Interface;
   type IDevicePortalWebSocketConnection is access all IDevicePortalWebSocketConnection_Interface'Class;
   type IDevicePortalWebSocketConnection_Ptr is access all IDevicePortalWebSocketConnection;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDevicePortalConnectionClosedEventArgs : aliased constant Windows.IID := (4244049464, 28722, 17036, (159, 80, 148, 92, 21, 169, 240, 203 ));
   
   type IDevicePortalConnectionClosedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IDevicePortalConnectionClosedEventArgs_Interface
      ; RetVal : access Windows.System.Diagnostics.DevicePortal.DevicePortalConnectionClosedReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDevicePortalConnectionRequestReceivedEventArgs : aliased constant Windows.IID := (1692065861, 28634, 17497, (158, 189, 236, 206, 34, 227, 133, 89 ));
   
   type IDevicePortalConnectionRequestReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestMessage
   (
      This       : access IDevicePortalConnectionRequestReceivedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpRequestMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseMessage
   (
      This       : access IDevicePortalConnectionRequestReceivedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpResponseMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDevicePortalWebSocketConnectionRequestReceivedEventArgs : aliased constant Windows.IID := (2046675642, 5980, 18233, (159, 116, 221, 167, 151, 195, 91, 63 ));
   
   type IDevicePortalWebSocketConnectionRequestReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsWebSocketUpgradeRequest
   (
      This       : access IDevicePortalWebSocketConnectionRequestReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_WebSocketProtocolsRequested
   (
      This       : access IDevicePortalWebSocketConnectionRequestReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IDevicePortalWebSocketConnectionRequestReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDevicePortalConnectionStatics : aliased constant Windows.IID := (1270755815, 59833, 17989, (143, 237, 165, 62, 234, 14, 219, 214 ));
   
   type IDevicePortalConnectionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForAppServiceConnection
   (
      This       : access IDevicePortalConnectionStatics_Interface
      ; appServiceConnection : Windows.ApplicationModel.AppService.IAppServiceConnection
      ; RetVal : access Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDevicePortalConnection : aliased constant Windows.IID := (256147281, 4504, 19873, (141, 84, 189, 239, 57, 62, 9, 182 ));
   
   type IDevicePortalConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Closed
   (
      This       : access IDevicePortalConnection_Interface
      ; handler : TypedEventHandler_IDevicePortalConnection_add_Closed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access IDevicePortalConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RequestReceived
   (
      This       : access IDevicePortalConnection_Interface
      ; handler : TypedEventHandler_IDevicePortalConnection_add_RequestReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RequestReceived
   (
      This       : access IDevicePortalConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDevicePortalWebSocketConnection : aliased constant Windows.IID := (1734703392, 54874, 17136, (174, 244, 120, 120, 8, 9, 139, 123 ));
   
   type IDevicePortalWebSocketConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function GetServerMessageWebSocketForRequest
   (
      This       : access IDevicePortalWebSocketConnection_Interface
      ; request : Windows.Web.Http.IHttpRequestMessage
      ; RetVal : access Windows.Networking.Sockets.IServerMessageWebSocket
   )
   return Windows.HRESULT is abstract;
   
   function GetServerMessageWebSocketForRequest2
   (
      This       : access IDevicePortalWebSocketConnection_Interface
      ; request : Windows.Web.Http.IHttpRequestMessage
      ; messageType : Windows.Networking.Sockets.SocketMessageType
      ; protocol : Windows.String
      ; RetVal : access Windows.Networking.Sockets.IServerMessageWebSocket
   )
   return Windows.HRESULT is abstract;
   
   function GetServerMessageWebSocketForRequest3
   (
      This       : access IDevicePortalWebSocketConnection_Interface
      ; request : Windows.Web.Http.IHttpRequestMessage
      ; messageType : Windows.Networking.Sockets.SocketMessageType
      ; protocol : Windows.String
      ; outboundBufferSizeInBytes : Windows.UInt32
      ; maxMessageSize : Windows.UInt32
      ; receiveMode : Windows.Networking.Sockets.MessageWebSocketReceiveMode
      ; RetVal : access Windows.Networking.Sockets.IServerMessageWebSocket
   )
   return Windows.HRESULT is abstract;
   
   function GetServerStreamWebSocketForRequest
   (
      This       : access IDevicePortalWebSocketConnection_Interface
      ; request : Windows.Web.Http.IHttpRequestMessage
      ; RetVal : access Windows.Networking.Sockets.IServerStreamWebSocket
   )
   return Windows.HRESULT is abstract;
   
   function GetServerStreamWebSocketForRequest2
   (
      This       : access IDevicePortalWebSocketConnection_Interface
      ; request : Windows.Web.Http.IHttpRequestMessage
      ; protocol : Windows.String
      ; outboundBufferSizeInBytes : Windows.UInt32
      ; noDelay : Windows.Boolean
      ; RetVal : access Windows.Networking.Sockets.IServerStreamWebSocket
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDevicePortalConnection_add_Closed : aliased constant Windows.IID := (716018600, 21242, 21683, (149, 86, 21, 214, 81, 32, 139, 63 ));
   
   type TypedEventHandler_IDevicePortalConnection_add_Closed_Interface(Callback : access procedure (sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDevicePortalConnection_add_Closed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePortalConnection_add_Closed_Interface
      ; sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
      ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDevicePortalConnection_add_RequestReceived : aliased constant Windows.IID := (3638771704, 35524, 24537, (177, 132, 138, 232, 125, 130, 142, 185 ));
   
   type TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface(Callback : access procedure (sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDevicePortalConnection_add_RequestReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface
      ; sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
      ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DevicePortalConnectionClosedEventArgs is Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs;
   subtype DevicePortalConnectionRequestReceivedEventArgs is Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs;
   subtype DevicePortalConnection is Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForAppServiceConnection
   (
      appServiceConnection : Windows.ApplicationModel.AppService.IAppServiceConnection
   )
   return Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection;
   
end;
