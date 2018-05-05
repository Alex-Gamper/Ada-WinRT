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
with Windows.Storage.Streams;
with Windows.Networking;
with Windows.Networking.Connectivity;
with Windows.Security.Cryptography.Certificates;
with Windows.Security.Credentials;
with Windows.Web;
with Windows.ApplicationModel.Background;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.Sockets is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStreamSocket_Interface
      ; asyncInfo : Windows.Networking.Sockets.IAsyncOperation_IStreamSocket
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
      This       : access TypedEventHandler_IDatagramSocket_add_MessageReceived_Interface
      ; sender : Windows.Networking.Sockets.IDatagramSocket
      ; args : Windows.Networking.Sockets.IDatagramSocketMessageReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Sockets.IDatagramSocket(sender), Windows.Networking.Sockets.IDatagramSocketMessageReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStreamSocketListener_add_ConnectionReceived_Interface
      ; sender : Windows.Networking.Sockets.IStreamSocketListener
      ; args : Windows.Networking.Sockets.IStreamSocketListenerConnectionReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Sockets.IStreamSocketListener(sender), Windows.Networking.Sockets.IStreamSocketListenerConnectionReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebSocket_add_Closed_Interface
      ; sender : Windows.Networking.Sockets.IWebSocket
      ; args : Windows.Networking.Sockets.IWebSocketClosedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Networking.Sockets.IWebSocketClosedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMessageWebSocket_add_MessageReceived_Interface
      ; sender : Windows.Networking.Sockets.IMessageWebSocket
      ; args : Windows.Networking.Sockets.IMessageWebSocketMessageReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Sockets.IMessageWebSocket(sender), Windows.Networking.Sockets.IMessageWebSocketMessageReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested_Interface
      ; sender : Windows.Networking.Sockets.IMessageWebSocket
      ; args : Windows.Networking.Sockets.IWebSocketServerCustomValidationRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Sockets.IMessageWebSocket(sender), Windows.Networking.Sockets.IWebSocketServerCustomValidationRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested_Interface
      ; sender : Windows.Networking.Sockets.IStreamWebSocket
      ; args : Windows.Networking.Sockets.IWebSocketServerCustomValidationRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Sockets.IStreamWebSocket(sender), Windows.Networking.Sockets.IWebSocketServerCustomValidationRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IServerMessageWebSocket_add_MessageReceived_Interface
      ; sender : Windows.Networking.Sockets.IServerMessageWebSocket
      ; args : Windows.Networking.Sockets.IMessageWebSocketMessageReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Sockets.IServerMessageWebSocket(sender), Windows.Networking.Sockets.IMessageWebSocketMessageReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IServerMessageWebSocket_add_Closed_Interface
      ; sender : Windows.Networking.Sockets.IServerMessageWebSocket
      ; args : Windows.Networking.Sockets.IWebSocketClosedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Sockets.IServerMessageWebSocket(sender), Windows.Networking.Sockets.IWebSocketClosedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IServerStreamWebSocket_add_Closed_Interface
      ; sender : Windows.Networking.Sockets.IServerStreamWebSocket
      ; args : Windows.Networking.Sockets.IWebSocketClosedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Sockets.IServerStreamWebSocket(sender), Windows.Networking.Sockets.IWebSocketClosedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Networking.Sockets.ISocketActivityContext is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.SocketActivityContext");
      m_Factory     : Windows.Networking.Sockets.ISocketActivityContextFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Sockets.ISocketActivityContext := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISocketActivityContextFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(data, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDatagramSocket return Windows.Networking.Sockets.IDatagramSocket is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.DatagramSocket");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Networking.Sockets.IDatagramSocket) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Sockets.IID_IDatagramSocket'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateStreamSocket return Windows.Networking.Sockets.IStreamSocket is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.StreamSocket");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Networking.Sockets.IStreamSocket) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Sockets.IID_IStreamSocket'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateStreamSocketListener return Windows.Networking.Sockets.IStreamSocketListener is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.StreamSocketListener");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Networking.Sockets.IStreamSocketListener) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Sockets.IID_IStreamSocketListener'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateMessageWebSocket return Windows.Networking.Sockets.IMessageWebSocket is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.MessageWebSocket");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Networking.Sockets.IMessageWebSocket) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Sockets.IID_IMessageWebSocket'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateStreamWebSocket return Windows.Networking.Sockets.IStreamWebSocket is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.StreamWebSocket");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Networking.Sockets.IStreamWebSocket) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Sockets.IID_IStreamWebSocket'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWebSocketKeepAlive return Windows.ApplicationModel.Background.IBackgroundTask is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.WebSocketKeepAlive");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBackgroundTask) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTask'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateControlChannelTrigger
   (
      channelId : Windows.String
      ; serverKeepAliveIntervalInMinutes : Windows.UInt32
   )
   return Windows.Networking.Sockets.IControlChannelTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.ControlChannelTrigger");
      m_Factory     : Windows.Networking.Sockets.IControlChannelTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Sockets.IControlChannelTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IControlChannelTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateControlChannelTrigger(channelId, serverKeepAliveIntervalInMinutes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateControlChannelTriggerEx
   (
      channelId : Windows.String
      ; serverKeepAliveIntervalInMinutes : Windows.UInt32
      ; resourceRequestType : Windows.Networking.Sockets.ControlChannelTriggerResourceType
   )
   return Windows.Networking.Sockets.IControlChannelTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.ControlChannelTrigger");
      m_Factory     : Windows.Networking.Sockets.IControlChannelTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Sockets.IControlChannelTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IControlChannelTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateControlChannelTriggerEx(channelId, serverKeepAliveIntervalInMinutes, resourceRequestType, RetVal'Access);
         RefCount := m_Factory.Release;
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
   
   function GetEndpointPairsAsync
   (
      remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.DatagramSocket");
      m_Factory     : IDatagramSocketStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDatagramSocketStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetEndpointPairsAsync(remoteHostName, remoteServiceName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetEndpointPairsWithSortOptionsAsync
   (
      remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; sortOptions : Windows.Networking.HostNameSortOptions
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.DatagramSocket");
      m_Factory     : IDatagramSocketStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDatagramSocketStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetEndpointPairsWithSortOptionsAsync(remoteHostName, remoteServiceName, sortOptions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetEndpointPairsAsync_IStreamSocket
   (
      remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.StreamSocket");
      m_Factory     : IStreamSocketStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStreamSocketStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetEndpointPairsAsync(remoteHostName, remoteServiceName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetEndpointPairsWithSortOptionsAsync_IStreamSocket
   (
      remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; sortOptions : Windows.Networking.HostNameSortOptions
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.StreamSocket");
      m_Factory     : IStreamSocketStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStreamSocketStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetEndpointPairsWithSortOptionsAsync(remoteHostName, remoteServiceName, sortOptions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllSockets
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.SocketActivityInformation");
      m_Factory     : ISocketActivityInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISocketActivityInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllSockets(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Networking.Sockets.SocketErrorStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.SocketError");
      m_Factory     : ISocketErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Sockets.SocketErrorStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISocketErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStatus(hresult, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Web.WebErrorStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.WebSocketError");
      m_Factory     : IWebSocketErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.WebErrorStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebSocketErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStatus(hresult, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
