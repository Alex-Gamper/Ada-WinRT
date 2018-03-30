--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.Networking;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.Connectivity is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access NetworkStatusChangedEventHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_NetworkStatusChangedEventHandler or riid.all = IID_IUnknown then
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
      This       : access NetworkStatusChangedEventHandler_Interface
      ; sender : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IProxyConfiguration_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IProxyConfiguration or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IProxyConfiguration_Interface
      ; asyncInfo : Windows.Networking.Connectivity.IAsyncOperation_IProxyConfiguration
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IConnectionProfile_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IConnectionProfile or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IConnectionProfile_Interface
      ; asyncInfo : Windows.Networking.Connectivity.IAsyncOperation_IConnectionProfile
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IConnectionSession_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IConnectionSession or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IConnectionSession_Interface
      ; asyncInfo : Windows.Networking.Connectivity.IAsyncOperation_IConnectionSession
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
   
   
   function CreateConnectionProfileFilter return Windows.Networking.Connectivity.IConnectionProfileFilter is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.ConnectionProfileFilter");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Connectivity.IConnectionProfileFilter := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Connectivity.IID_IConnectionProfileFilter'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRoutePolicy
   (
      connectionProfile : Windows.Networking.Connectivity.IConnectionProfile
      ; hostName : Windows.Networking.IHostName
      ; type_x : Windows.Networking.DomainNameType
   )
   return Windows.Networking.Connectivity.IRoutePolicy is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.RoutePolicy");
      m_Factory     : Windows.Networking.Connectivity.IRoutePolicyFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Connectivity.IRoutePolicy := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRoutePolicyFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateRoutePolicy(connectionProfile, hostName, type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCellularApnContext return Windows.Networking.Connectivity.ICellularApnContext is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.CellularApnContext");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Connectivity.ICellularApnContext := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Connectivity.IID_ICellularApnContext'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   function GetConnectionProfiles
   return Windows.Networking.Connectivity.IVectorView_IConnectionProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.NetworkInformation");
      m_Factory     : INetworkInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Connectivity.IVectorView_IConnectionProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetConnectionProfiles(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetInternetConnectionProfile
   return Windows.Networking.Connectivity.IConnectionProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.NetworkInformation");
      m_Factory     : INetworkInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Connectivity.IConnectionProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetInternetConnectionProfile(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLanIdentifiers
   return Windows.Networking.Connectivity.IVectorView_ILanIdentifier is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.NetworkInformation");
      m_Factory     : INetworkInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Connectivity.IVectorView_ILanIdentifier;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLanIdentifiers(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetHostNames
   return Windows.Networking.IVectorView_IHostName is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.NetworkInformation");
      m_Factory     : INetworkInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.IVectorView_IHostName;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetHostNames(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetProxyConfigurationAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Networking.Connectivity.IAsyncOperation_IProxyConfiguration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.NetworkInformation");
      m_Factory     : INetworkInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Connectivity.IAsyncOperation_IProxyConfiguration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetProxyConfigurationAsync(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSortedEndpointPairs
   (
      destinationList : Windows.Networking.IIterable_IEndpointPair
      ; sortOptions : Windows.Networking.HostNameSortOptions
   )
   return Windows.Networking.IVectorView_IEndpointPair is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.NetworkInformation");
      m_Factory     : INetworkInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.IVectorView_IEndpointPair;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSortedEndpointPairs(destinationList, sortOptions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_NetworkStatusChanged
   (
      networkStatusHandler : Windows.Networking.Connectivity.NetworkStatusChangedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.NetworkInformation");
      m_Factory     : INetworkInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_NetworkStatusChanged(networkStatusHandler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_NetworkStatusChanged
   (
      eventCookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.NetworkInformation");
      m_Factory     : INetworkInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_NetworkStatusChanged(eventCookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function FindConnectionProfilesAsync
   (
      pProfileFilter : Windows.Networking.Connectivity.IConnectionProfileFilter
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.NetworkInformation");
      m_Factory     : INetworkInformationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkInformationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindConnectionProfilesAsync(pProfileFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AcquireConnectionAsync
   (
      cellularApnContext : Windows.Networking.Connectivity.ICellularApnContext
   )
   return Windows.Networking.Connectivity.IAsyncOperation_IConnectionSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.ConnectivityManager");
      m_Factory     : IConnectivityManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Connectivity.IAsyncOperation_IConnectionSession;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IConnectivityManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AcquireConnectionAsync(cellularApnContext, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure AddHttpRoutePolicy
   (
      routePolicy : Windows.Networking.Connectivity.IRoutePolicy
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.ConnectivityManager");
      m_Factory     : IConnectivityManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IConnectivityManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AddHttpRoutePolicy(routePolicy);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure RemoveHttpRoutePolicy
   (
      routePolicy : Windows.Networking.Connectivity.IRoutePolicy
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Connectivity.ConnectivityManager");
      m_Factory     : IConnectivityManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IConnectivityManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RemoveHttpRoutePolicy(routePolicy);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;

end;
