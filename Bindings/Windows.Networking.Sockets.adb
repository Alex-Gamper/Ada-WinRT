--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
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
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IStreamSocket_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IStreamSocket or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
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
   
   function QueryInterface(This : access TypedEventHandler_IDatagramSocket_add_MessageReceived_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDatagramSocket_add_MessageReceived or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_IStreamSocketListener_add_ConnectionReceived_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IStreamSocketListener_add_ConnectionReceived or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_IWebSocket_add_Closed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IWebSocket_add_Closed or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_IMessageWebSocket_add_MessageReceived_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMessageWebSocket_add_MessageReceived or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMessageWebSocket2_add_ServerCustomValidationRequested or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IStreamWebSocket2_add_ServerCustomValidationRequested or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
      RetVal        : aliased Windows.Networking.Sockets.IDatagramSocket := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Sockets.IID_IDatagramSocket'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateStreamSocket return Windows.Networking.Sockets.IStreamSocket is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.StreamSocket");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Sockets.IStreamSocket := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Sockets.IID_IStreamSocket'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateStreamSocketListener return Windows.Networking.Sockets.IStreamSocketListener is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.StreamSocketListener");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Sockets.IStreamSocketListener := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Sockets.IID_IStreamSocketListener'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMessageWebSocket return Windows.Networking.Sockets.IMessageWebSocket is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.MessageWebSocket");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Sockets.IMessageWebSocket := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Sockets.IID_IMessageWebSocket'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateStreamWebSocket return Windows.Networking.Sockets.IStreamWebSocket is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.StreamWebSocket");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Sockets.IStreamWebSocket := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Sockets.IID_IStreamWebSocket'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWebSocketKeepAlive return Windows.ApplicationModel.Background.IBackgroundTask is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Sockets.WebSocketKeepAlive");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IBackgroundTask := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTask'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
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
