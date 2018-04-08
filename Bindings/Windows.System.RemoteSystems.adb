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
with Windows.Networking;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.RemoteSystems is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRemoteSystem_Interface
      ; asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystem
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
      This       : access AsyncOperationCompletedHandler_RemoteSystemAccessStatus_Interface
      ; asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_RemoteSystemAccessStatus
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
      This       : access TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemWatcher(sender), Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemWatcher(sender), Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemWatcher(sender), Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult_Interface
      ; asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystemSessionJoinResult
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
      This       : access TypedEventHandler_IRemoteSystemSessionWatcher_add_Added_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemSessionWatcher(sender), Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemSessionWatcher(sender), Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemSessionWatcher(sender), Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener(sender), Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher(sender), Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher(sender), Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionController
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemSessionController(sender), Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult_Interface
      ; asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystemSessionCreationResult
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
      This       : access TypedEventHandler_IRemoteSystemSession_add_Disconnected_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSession
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemSession(sender), Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel(sender), Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      remoteSystemAuthorizationKind : Windows.System.RemoteSystems.RemoteSystemAuthorizationKind
   )
   return Windows.System.RemoteSystems.IRemoteSystemAuthorizationKindFilter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemAuthorizationKindFilter");
      m_Factory     : Windows.System.RemoteSystems.IRemoteSystemAuthorizationKindFilterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemAuthorizationKindFilter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemAuthorizationKindFilterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(remoteSystemAuthorizationKind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      remoteSystem : Windows.System.RemoteSystems.IRemoteSystem
   )
   return Windows.System.RemoteSystems.IRemoteSystemConnectionRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemConnectionRequest");
      m_Factory     : Windows.System.RemoteSystems.IRemoteSystemConnectionRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemConnectionRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemConnectionRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(remoteSystem, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      remoteSystemKinds : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.System.RemoteSystems.IRemoteSystemKindFilter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemKindFilter");
      m_Factory     : Windows.System.RemoteSystems.IRemoteSystemKindFilterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemKindFilter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemKindFilterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(remoteSystemKinds, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      discoveryType : Windows.System.RemoteSystems.RemoteSystemDiscoveryType
   )
   return Windows.System.RemoteSystems.IRemoteSystemDiscoveryTypeFilter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemDiscoveryTypeFilter");
      m_Factory     : Windows.System.RemoteSystems.IRemoteSystemDiscoveryTypeFilterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemDiscoveryTypeFilter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemDiscoveryTypeFilterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(discoveryType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      remoteSystemStatusType : Windows.System.RemoteSystems.RemoteSystemStatusType
   )
   return Windows.System.RemoteSystems.IRemoteSystemStatusTypeFilter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemStatusTypeFilter");
      m_Factory     : Windows.System.RemoteSystems.IRemoteSystemStatusTypeFilterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemStatusTypeFilter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemStatusTypeFilterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(remoteSystemStatusType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRemoteSystemSessionInvitationListener return Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemSessionInvitationListener");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.System.RemoteSystems.IID_IRemoteSystemSessionInvitationListener'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateRemoteSystemSessionOptions return Windows.System.RemoteSystems.IRemoteSystemSessionOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemSessionOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.System.RemoteSystems.IRemoteSystemSessionOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.System.RemoteSystems.IID_IRemoteSystemSessionOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateController
   (
      displayName : Windows.String
   )
   return Windows.System.RemoteSystems.IRemoteSystemSessionController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemSessionController");
      m_Factory     : Windows.System.RemoteSystems.IRemoteSystemSessionControllerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemSessionController := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemSessionControllerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateController(displayName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateControllerWithSessionOptions
   (
      displayName : Windows.String
      ; options : Windows.System.RemoteSystems.IRemoteSystemSessionOptions
   )
   return Windows.System.RemoteSystems.IRemoteSystemSessionController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemSessionController");
      m_Factory     : Windows.System.RemoteSystems.IRemoteSystemSessionControllerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemSessionController := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemSessionControllerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateControllerWithSessionOptions(displayName, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      session : Windows.System.RemoteSystems.IRemoteSystemSession
      ; channelName : Windows.String
   )
   return Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemSessionMessageChannel");
      m_Factory     : Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannelFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemSessionMessageChannelFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(session, channelName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithReliability
   (
      session : Windows.System.RemoteSystems.IRemoteSystemSession
      ; channelName : Windows.String
      ; reliability : Windows.System.RemoteSystems.RemoteSystemSessionMessageChannelReliability
   )
   return Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemSessionMessageChannel");
      m_Factory     : Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannelFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemSessionMessageChannelFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithReliability(session, channelName, reliability, RetVal'Access);
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
   
   
   function IsAuthorizationKindEnabled
   (
      kind : Windows.System.RemoteSystems.RemoteSystemAuthorizationKind
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystem");
      m_Factory     : IRemoteSystemStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsAuthorizationKindEnabled(kind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindByHostNameAsync
   (
      hostName : Windows.Networking.IHostName
   )
   return Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystem");
      m_Factory     : IRemoteSystemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindByHostNameAsync(hostName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcher
   return Windows.System.RemoteSystems.IRemoteSystemWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystem");
      m_Factory     : IRemoteSystemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcherWithFilters
   (
      filters : Windows.System.RemoteSystems.IIterable_IRemoteSystemFilter
   )
   return Windows.System.RemoteSystems.IRemoteSystemWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystem");
      m_Factory     : IRemoteSystemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcherWithFilters(filters, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessAsync
   return Windows.System.RemoteSystems.IAsyncOperation_RemoteSystemAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystem");
      m_Factory     : IRemoteSystemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IAsyncOperation_RemoteSystemAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AppService
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.KnownRemoteSystemCapabilities");
      m_Factory     : IKnownRemoteSystemCapabilitiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRemoteSystemCapabilitiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AppService(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LaunchUri
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.KnownRemoteSystemCapabilities");
      m_Factory     : IKnownRemoteSystemCapabilitiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRemoteSystemCapabilitiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LaunchUri(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RemoteSession
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.KnownRemoteSystemCapabilities");
      m_Factory     : IKnownRemoteSystemCapabilitiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRemoteSystemCapabilitiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RemoteSession(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SpatialEntity
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.KnownRemoteSystemCapabilities");
      m_Factory     : IKnownRemoteSystemCapabilitiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRemoteSystemCapabilitiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SpatialEntity(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Iot
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemKinds");
      m_Factory     : IRemoteSystemKindStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemKindStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Iot(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Tablet
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemKinds");
      m_Factory     : IRemoteSystemKindStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemKindStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Tablet(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Laptop
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemKinds");
      m_Factory     : IRemoteSystemKindStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemKindStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Laptop(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Phone
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemKinds");
      m_Factory     : IRemoteSystemKindStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemKindStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Phone(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Hub
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemKinds");
      m_Factory     : IRemoteSystemKindStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemKindStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Hub(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Holographic
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemKinds");
      m_Factory     : IRemoteSystemKindStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemKindStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Holographic(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Desktop
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemKinds");
      m_Factory     : IRemoteSystemKindStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemKindStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Desktop(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Xbox
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemKinds");
      m_Factory     : IRemoteSystemKindStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemKindStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Xbox(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcher
   return Windows.System.RemoteSystems.IRemoteSystemSessionWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.RemoteSystems.RemoteSystemSession");
      m_Factory     : IRemoteSystemSessionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.RemoteSystems.IRemoteSystemSessionWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRemoteSystemSessionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
