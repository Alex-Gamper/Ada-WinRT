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
with Windows.Storage.Streams;
with Windows.Networking;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.Connectivity is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
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
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Networking.Connectivity.IConnectionProfileFilter) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Connectivity.IID_IConnectionProfileFilter'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
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
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Networking.Connectivity.ICellularApnContext) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.Connectivity.IID_ICellularApnContext'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
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
