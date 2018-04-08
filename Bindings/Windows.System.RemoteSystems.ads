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
limited with Windows.Networking;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.System.RemoteSystems is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type RemoteSystemStatus is (
      Unavailable,
      DiscoveringAvailability,
      Available,
      Unknown
   );
   for RemoteSystemStatus use (
      Unavailable => 0,
      DiscoveringAvailability => 1,
      Available => 2,
      Unknown => 3
   );
   for RemoteSystemStatus'Size use 32;
   
   type RemoteSystemStatus_Ptr is access RemoteSystemStatus;
   
   type RemoteSystemDiscoveryType is (
      Any,
      Proximal,
      Cloud,
      SpatiallyProximal
   );
   for RemoteSystemDiscoveryType use (
      Any => 0,
      Proximal => 1,
      Cloud => 2,
      SpatiallyProximal => 3
   );
   for RemoteSystemDiscoveryType'Size use 32;
   
   type RemoteSystemDiscoveryType_Ptr is access RemoteSystemDiscoveryType;
   
   type RemoteSystemStatusType is (
      Any,
      Available
   );
   for RemoteSystemStatusType use (
      Any => 0,
      Available => 1
   );
   for RemoteSystemStatusType'Size use 32;
   
   type RemoteSystemStatusType_Ptr is access RemoteSystemStatusType;
   
   type RemoteSystemAccessStatus is (
      Unspecified,
      Allowed,
      DeniedByUser,
      DeniedBySystem
   );
   for RemoteSystemAccessStatus use (
      Unspecified => 0,
      Allowed => 1,
      DeniedByUser => 2,
      DeniedBySystem => 3
   );
   for RemoteSystemAccessStatus'Size use 32;
   
   type RemoteSystemAccessStatus_Ptr is access RemoteSystemAccessStatus;
   
   type RemoteSystemAuthorizationKind is (
      SameUser,
      Anonymous
   );
   for RemoteSystemAuthorizationKind use (
      SameUser => 0,
      Anonymous => 1
   );
   for RemoteSystemAuthorizationKind'Size use 32;
   
   type RemoteSystemAuthorizationKind_Ptr is access RemoteSystemAuthorizationKind;
   
   type RemoteSystemSessionJoinStatus is (
      Success,
      SessionLimitsExceeded,
      OperationAborted,
      SessionUnavailable,
      RejectedByController
   );
   for RemoteSystemSessionJoinStatus use (
      Success => 0,
      SessionLimitsExceeded => 1,
      OperationAborted => 2,
      SessionUnavailable => 3,
      RejectedByController => 4
   );
   for RemoteSystemSessionJoinStatus'Size use 32;
   
   type RemoteSystemSessionJoinStatus_Ptr is access RemoteSystemSessionJoinStatus;
   
   type RemoteSystemSessionWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopping,
      Stopped,
      Aborted
   );
   for RemoteSystemSessionWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopping => 3,
      Stopped => 4,
      Aborted => 5
   );
   for RemoteSystemSessionWatcherStatus'Size use 32;
   
   type RemoteSystemSessionWatcherStatus_Ptr is access RemoteSystemSessionWatcherStatus;
   
   type RemoteSystemSessionParticipantWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopping,
      Stopped,
      Aborted
   );
   for RemoteSystemSessionParticipantWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopping => 3,
      Stopped => 4,
      Aborted => 5
   );
   for RemoteSystemSessionParticipantWatcherStatus'Size use 32;
   
   type RemoteSystemSessionParticipantWatcherStatus_Ptr is access RemoteSystemSessionParticipantWatcherStatus;
   
   type RemoteSystemSessionCreationStatus is (
      Success,
      SessionLimitsExceeded,
      OperationAborted
   );
   for RemoteSystemSessionCreationStatus use (
      Success => 0,
      SessionLimitsExceeded => 1,
      OperationAborted => 2
   );
   for RemoteSystemSessionCreationStatus'Size use 32;
   
   type RemoteSystemSessionCreationStatus_Ptr is access RemoteSystemSessionCreationStatus;
   
   type RemoteSystemSessionDisconnectedReason is (
      SessionUnavailable,
      RemovedByController,
      SessionClosed
   );
   for RemoteSystemSessionDisconnectedReason use (
      SessionUnavailable => 0,
      RemovedByController => 1,
      SessionClosed => 2
   );
   for RemoteSystemSessionDisconnectedReason'Size use 32;
   
   type RemoteSystemSessionDisconnectedReason_Ptr is access RemoteSystemSessionDisconnectedReason;
   
   type RemoteSystemSessionMessageChannelReliability is (
      Reliable,
      Unreliable
   );
   for RemoteSystemSessionMessageChannelReliability use (
      Reliable => 0,
      Unreliable => 1
   );
   for RemoteSystemSessionMessageChannelReliability'Size use 32;
   
   type RemoteSystemSessionMessageChannelReliability_Ptr is access RemoteSystemSessionMessageChannelReliability;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IRemoteSystem_Interface;
   type AsyncOperationCompletedHandler_IRemoteSystem is access all AsyncOperationCompletedHandler_IRemoteSystem_Interface'Class;
   type AsyncOperationCompletedHandler_IRemoteSystem_Ptr is access all AsyncOperationCompletedHandler_IRemoteSystem;
   type AsyncOperationCompletedHandler_RemoteSystemAccessStatus_Interface;
   type AsyncOperationCompletedHandler_RemoteSystemAccessStatus is access all AsyncOperationCompletedHandler_RemoteSystemAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_RemoteSystemAccessStatus_Ptr is access all AsyncOperationCompletedHandler_RemoteSystemAccessStatus;
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded_Interface;
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded is access all TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded_Interface'Class;
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded_Ptr is access all TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded;
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated_Interface;
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated is access all TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated_Interface'Class;
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated_Ptr is access all TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated;
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved_Interface;
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved is access all TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved_Interface'Class;
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved_Ptr is access all TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved;
   type AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult_Interface;
   type AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult is access all AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult_Interface'Class;
   type AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult_Ptr is access all AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult;
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Added_Interface;
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Added is access all TypedEventHandler_IRemoteSystemSessionWatcher_add_Added_Interface'Class;
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Added_Ptr is access all TypedEventHandler_IRemoteSystemSessionWatcher_add_Added;
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated_Interface;
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated is access all TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated_Interface'Class;
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated_Ptr is access all TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated;
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed_Interface;
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed is access all TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed_Interface'Class;
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed_Ptr is access all TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed;
   type TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived_Interface;
   type TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived is access all TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived_Interface'Class;
   type TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived_Ptr is access all TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived;
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added_Interface;
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added is access all TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added_Interface'Class;
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added_Ptr is access all TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added;
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed_Interface;
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed is access all TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed_Interface'Class;
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed_Ptr is access all TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed;
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted is access all TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested_Interface;
   type TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested is access all TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested_Interface'Class;
   type TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested_Ptr is access all TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested;
   type AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult_Interface;
   type AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult is access all AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult_Ptr is access all AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult;
   type TypedEventHandler_IRemoteSystemSession_add_Disconnected_Interface;
   type TypedEventHandler_IRemoteSystemSession_add_Disconnected is access all TypedEventHandler_IRemoteSystemSession_add_Disconnected_Interface'Class;
   type TypedEventHandler_IRemoteSystemSession_add_Disconnected_Ptr is access all TypedEventHandler_IRemoteSystemSession_add_Disconnected;
   type TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived_Interface;
   type TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived is access all TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived_Interface'Class;
   type TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived_Ptr is access all TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IRemoteSystemFilter_Interface;
   type IRemoteSystemFilter is access all IRemoteSystemFilter_Interface'Class;
   type IRemoteSystemFilter_Ptr is access all IRemoteSystemFilter;
   type IRemoteSystemStatics_Interface;
   type IRemoteSystemStatics is access all IRemoteSystemStatics_Interface'Class;
   type IRemoteSystemStatics_Ptr is access all IRemoteSystemStatics;
   type IRemoteSystemStatics2_Interface;
   type IRemoteSystemStatics2 is access all IRemoteSystemStatics2_Interface'Class;
   type IRemoteSystemStatics2_Ptr is access all IRemoteSystemStatics2;
   type IRemoteSystem_Interface;
   type IRemoteSystem is access all IRemoteSystem_Interface'Class;
   type IRemoteSystem_Ptr is access all IRemoteSystem;
   type IRemoteSystem2_Interface;
   type IRemoteSystem2 is access all IRemoteSystem2_Interface'Class;
   type IRemoteSystem2_Ptr is access all IRemoteSystem2;
   type IRemoteSystem3_Interface;
   type IRemoteSystem3 is access all IRemoteSystem3_Interface'Class;
   type IRemoteSystem3_Ptr is access all IRemoteSystem3;
   type IKnownRemoteSystemCapabilitiesStatics_Interface;
   type IKnownRemoteSystemCapabilitiesStatics is access all IKnownRemoteSystemCapabilitiesStatics_Interface'Class;
   type IKnownRemoteSystemCapabilitiesStatics_Ptr is access all IKnownRemoteSystemCapabilitiesStatics;
   type IRemoteSystemAuthorizationKindFilterFactory_Interface;
   type IRemoteSystemAuthorizationKindFilterFactory is access all IRemoteSystemAuthorizationKindFilterFactory_Interface'Class;
   type IRemoteSystemAuthorizationKindFilterFactory_Ptr is access all IRemoteSystemAuthorizationKindFilterFactory;
   type IRemoteSystemAuthorizationKindFilter_Interface;
   type IRemoteSystemAuthorizationKindFilter is access all IRemoteSystemAuthorizationKindFilter_Interface'Class;
   type IRemoteSystemAuthorizationKindFilter_Ptr is access all IRemoteSystemAuthorizationKindFilter;
   type IRemoteSystemWatcher_Interface;
   type IRemoteSystemWatcher is access all IRemoteSystemWatcher_Interface'Class;
   type IRemoteSystemWatcher_Ptr is access all IRemoteSystemWatcher;
   type IRemoteSystemAddedEventArgs_Interface;
   type IRemoteSystemAddedEventArgs is access all IRemoteSystemAddedEventArgs_Interface'Class;
   type IRemoteSystemAddedEventArgs_Ptr is access all IRemoteSystemAddedEventArgs;
   type IRemoteSystemUpdatedEventArgs_Interface;
   type IRemoteSystemUpdatedEventArgs is access all IRemoteSystemUpdatedEventArgs_Interface'Class;
   type IRemoteSystemUpdatedEventArgs_Ptr is access all IRemoteSystemUpdatedEventArgs;
   type IRemoteSystemRemovedEventArgs_Interface;
   type IRemoteSystemRemovedEventArgs is access all IRemoteSystemRemovedEventArgs_Interface'Class;
   type IRemoteSystemRemovedEventArgs_Ptr is access all IRemoteSystemRemovedEventArgs;
   type IRemoteSystemConnectionRequestFactory_Interface;
   type IRemoteSystemConnectionRequestFactory is access all IRemoteSystemConnectionRequestFactory_Interface'Class;
   type IRemoteSystemConnectionRequestFactory_Ptr is access all IRemoteSystemConnectionRequestFactory;
   type IRemoteSystemConnectionRequest_Interface;
   type IRemoteSystemConnectionRequest is access all IRemoteSystemConnectionRequest_Interface'Class;
   type IRemoteSystemConnectionRequest_Ptr is access all IRemoteSystemConnectionRequest;
   type IRemoteSystemKindStatics_Interface;
   type IRemoteSystemKindStatics is access all IRemoteSystemKindStatics_Interface'Class;
   type IRemoteSystemKindStatics_Ptr is access all IRemoteSystemKindStatics;
   type IRemoteSystemKindStatics2_Interface;
   type IRemoteSystemKindStatics2 is access all IRemoteSystemKindStatics2_Interface'Class;
   type IRemoteSystemKindStatics2_Ptr is access all IRemoteSystemKindStatics2;
   type IRemoteSystemKindFilterFactory_Interface;
   type IRemoteSystemKindFilterFactory is access all IRemoteSystemKindFilterFactory_Interface'Class;
   type IRemoteSystemKindFilterFactory_Ptr is access all IRemoteSystemKindFilterFactory;
   type IRemoteSystemKindFilter_Interface;
   type IRemoteSystemKindFilter is access all IRemoteSystemKindFilter_Interface'Class;
   type IRemoteSystemKindFilter_Ptr is access all IRemoteSystemKindFilter;
   type IRemoteSystemDiscoveryTypeFilterFactory_Interface;
   type IRemoteSystemDiscoveryTypeFilterFactory is access all IRemoteSystemDiscoveryTypeFilterFactory_Interface'Class;
   type IRemoteSystemDiscoveryTypeFilterFactory_Ptr is access all IRemoteSystemDiscoveryTypeFilterFactory;
   type IRemoteSystemDiscoveryTypeFilter_Interface;
   type IRemoteSystemDiscoveryTypeFilter is access all IRemoteSystemDiscoveryTypeFilter_Interface'Class;
   type IRemoteSystemDiscoveryTypeFilter_Ptr is access all IRemoteSystemDiscoveryTypeFilter;
   type IRemoteSystemStatusTypeFilterFactory_Interface;
   type IRemoteSystemStatusTypeFilterFactory is access all IRemoteSystemStatusTypeFilterFactory_Interface'Class;
   type IRemoteSystemStatusTypeFilterFactory_Ptr is access all IRemoteSystemStatusTypeFilterFactory;
   type IRemoteSystemStatusTypeFilter_Interface;
   type IRemoteSystemStatusTypeFilter is access all IRemoteSystemStatusTypeFilter_Interface'Class;
   type IRemoteSystemStatusTypeFilter_Ptr is access all IRemoteSystemStatusTypeFilter;
   type IRemoteSystemSessionJoinResult_Interface;
   type IRemoteSystemSessionJoinResult is access all IRemoteSystemSessionJoinResult_Interface'Class;
   type IRemoteSystemSessionJoinResult_Ptr is access all IRemoteSystemSessionJoinResult;
   type IRemoteSystemSessionInfo_Interface;
   type IRemoteSystemSessionInfo is access all IRemoteSystemSessionInfo_Interface'Class;
   type IRemoteSystemSessionInfo_Ptr is access all IRemoteSystemSessionInfo;
   type IRemoteSystemSessionAddedEventArgs_Interface;
   type IRemoteSystemSessionAddedEventArgs is access all IRemoteSystemSessionAddedEventArgs_Interface'Class;
   type IRemoteSystemSessionAddedEventArgs_Ptr is access all IRemoteSystemSessionAddedEventArgs;
   type IRemoteSystemSessionUpdatedEventArgs_Interface;
   type IRemoteSystemSessionUpdatedEventArgs is access all IRemoteSystemSessionUpdatedEventArgs_Interface'Class;
   type IRemoteSystemSessionUpdatedEventArgs_Ptr is access all IRemoteSystemSessionUpdatedEventArgs;
   type IRemoteSystemSessionRemovedEventArgs_Interface;
   type IRemoteSystemSessionRemovedEventArgs is access all IRemoteSystemSessionRemovedEventArgs_Interface'Class;
   type IRemoteSystemSessionRemovedEventArgs_Ptr is access all IRemoteSystemSessionRemovedEventArgs;
   type IRemoteSystemSessionWatcher_Interface;
   type IRemoteSystemSessionWatcher is access all IRemoteSystemSessionWatcher_Interface'Class;
   type IRemoteSystemSessionWatcher_Ptr is access all IRemoteSystemSessionWatcher;
   type IRemoteSystemSessionInvitation_Interface;
   type IRemoteSystemSessionInvitation is access all IRemoteSystemSessionInvitation_Interface'Class;
   type IRemoteSystemSessionInvitation_Ptr is access all IRemoteSystemSessionInvitation;
   type IRemoteSystemSessionInvitationReceivedEventArgs_Interface;
   type IRemoteSystemSessionInvitationReceivedEventArgs is access all IRemoteSystemSessionInvitationReceivedEventArgs_Interface'Class;
   type IRemoteSystemSessionInvitationReceivedEventArgs_Ptr is access all IRemoteSystemSessionInvitationReceivedEventArgs;
   type IRemoteSystemSessionInvitationListener_Interface;
   type IRemoteSystemSessionInvitationListener is access all IRemoteSystemSessionInvitationListener_Interface'Class;
   type IRemoteSystemSessionInvitationListener_Ptr is access all IRemoteSystemSessionInvitationListener;
   type IRemoteSystemSessionParticipant_Interface;
   type IRemoteSystemSessionParticipant is access all IRemoteSystemSessionParticipant_Interface'Class;
   type IRemoteSystemSessionParticipant_Ptr is access all IRemoteSystemSessionParticipant;
   type IRemoteSystemSessionParticipantAddedEventArgs_Interface;
   type IRemoteSystemSessionParticipantAddedEventArgs is access all IRemoteSystemSessionParticipantAddedEventArgs_Interface'Class;
   type IRemoteSystemSessionParticipantAddedEventArgs_Ptr is access all IRemoteSystemSessionParticipantAddedEventArgs;
   type IRemoteSystemSessionParticipantRemovedEventArgs_Interface;
   type IRemoteSystemSessionParticipantRemovedEventArgs is access all IRemoteSystemSessionParticipantRemovedEventArgs_Interface'Class;
   type IRemoteSystemSessionParticipantRemovedEventArgs_Ptr is access all IRemoteSystemSessionParticipantRemovedEventArgs;
   type IRemoteSystemSessionParticipantWatcher_Interface;
   type IRemoteSystemSessionParticipantWatcher is access all IRemoteSystemSessionParticipantWatcher_Interface'Class;
   type IRemoteSystemSessionParticipantWatcher_Ptr is access all IRemoteSystemSessionParticipantWatcher;
   type IRemoteSystemSessionJoinRequest_Interface;
   type IRemoteSystemSessionJoinRequest is access all IRemoteSystemSessionJoinRequest_Interface'Class;
   type IRemoteSystemSessionJoinRequest_Ptr is access all IRemoteSystemSessionJoinRequest;
   type IRemoteSystemSessionJoinRequestedEventArgs_Interface;
   type IRemoteSystemSessionJoinRequestedEventArgs is access all IRemoteSystemSessionJoinRequestedEventArgs_Interface'Class;
   type IRemoteSystemSessionJoinRequestedEventArgs_Ptr is access all IRemoteSystemSessionJoinRequestedEventArgs;
   type IRemoteSystemSessionCreationResult_Interface;
   type IRemoteSystemSessionCreationResult is access all IRemoteSystemSessionCreationResult_Interface'Class;
   type IRemoteSystemSessionCreationResult_Ptr is access all IRemoteSystemSessionCreationResult;
   type IRemoteSystemSessionOptions_Interface;
   type IRemoteSystemSessionOptions is access all IRemoteSystemSessionOptions_Interface'Class;
   type IRemoteSystemSessionOptions_Ptr is access all IRemoteSystemSessionOptions;
   type IRemoteSystemSessionController_Interface;
   type IRemoteSystemSessionController is access all IRemoteSystemSessionController_Interface'Class;
   type IRemoteSystemSessionController_Ptr is access all IRemoteSystemSessionController;
   type IRemoteSystemSessionControllerFactory_Interface;
   type IRemoteSystemSessionControllerFactory is access all IRemoteSystemSessionControllerFactory_Interface'Class;
   type IRemoteSystemSessionControllerFactory_Ptr is access all IRemoteSystemSessionControllerFactory;
   type IRemoteSystemSessionDisconnectedEventArgs_Interface;
   type IRemoteSystemSessionDisconnectedEventArgs is access all IRemoteSystemSessionDisconnectedEventArgs_Interface'Class;
   type IRemoteSystemSessionDisconnectedEventArgs_Ptr is access all IRemoteSystemSessionDisconnectedEventArgs;
   type IRemoteSystemSession_Interface;
   type IRemoteSystemSession is access all IRemoteSystemSession_Interface'Class;
   type IRemoteSystemSession_Ptr is access all IRemoteSystemSession;
   type IRemoteSystemSessionStatics_Interface;
   type IRemoteSystemSessionStatics is access all IRemoteSystemSessionStatics_Interface'Class;
   type IRemoteSystemSessionStatics_Ptr is access all IRemoteSystemSessionStatics;
   type IRemoteSystemSessionValueSetReceivedEventArgs_Interface;
   type IRemoteSystemSessionValueSetReceivedEventArgs is access all IRemoteSystemSessionValueSetReceivedEventArgs_Interface'Class;
   type IRemoteSystemSessionValueSetReceivedEventArgs_Ptr is access all IRemoteSystemSessionValueSetReceivedEventArgs;
   type IRemoteSystemSessionMessageChannel_Interface;
   type IRemoteSystemSessionMessageChannel is access all IRemoteSystemSessionMessageChannel_Interface'Class;
   type IRemoteSystemSessionMessageChannel_Ptr is access all IRemoteSystemSessionMessageChannel;
   type IRemoteSystemSessionMessageChannelFactory_Interface;
   type IRemoteSystemSessionMessageChannelFactory is access all IRemoteSystemSessionMessageChannelFactory_Interface'Class;
   type IRemoteSystemSessionMessageChannelFactory_Ptr is access all IRemoteSystemSessionMessageChannelFactory;
   type IAsyncOperation_IRemoteSystem_Interface;
   type IAsyncOperation_IRemoteSystem is access all IAsyncOperation_IRemoteSystem_Interface'Class;
   type IAsyncOperation_IRemoteSystem_Ptr is access all IAsyncOperation_IRemoteSystem;
   type IIterator_IRemoteSystemFilter_Interface;
   type IIterator_IRemoteSystemFilter is access all IIterator_IRemoteSystemFilter_Interface'Class;
   type IIterator_IRemoteSystemFilter_Ptr is access all IIterator_IRemoteSystemFilter;
   type IIterable_IRemoteSystemFilter_Interface;
   type IIterable_IRemoteSystemFilter is access all IIterable_IRemoteSystemFilter_Interface'Class;
   type IIterable_IRemoteSystemFilter_Ptr is access all IIterable_IRemoteSystemFilter;
   type IAsyncOperation_RemoteSystemAccessStatus_Interface;
   type IAsyncOperation_RemoteSystemAccessStatus is access all IAsyncOperation_RemoteSystemAccessStatus_Interface'Class;
   type IAsyncOperation_RemoteSystemAccessStatus_Ptr is access all IAsyncOperation_RemoteSystemAccessStatus;
   type IAsyncOperation_IRemoteSystemSessionJoinResult_Interface;
   type IAsyncOperation_IRemoteSystemSessionJoinResult is access all IAsyncOperation_IRemoteSystemSessionJoinResult_Interface'Class;
   type IAsyncOperation_IRemoteSystemSessionJoinResult_Ptr is access all IAsyncOperation_IRemoteSystemSessionJoinResult;
   type IAsyncOperation_IRemoteSystemSessionCreationResult_Interface;
   type IAsyncOperation_IRemoteSystemSessionCreationResult is access all IAsyncOperation_IRemoteSystemSessionCreationResult_Interface'Class;
   type IAsyncOperation_IRemoteSystemSessionCreationResult_Ptr is access all IAsyncOperation_IRemoteSystemSessionCreationResult;
   type IIterator_IRemoteSystemSessionParticipant_Interface;
   type IIterator_IRemoteSystemSessionParticipant is access all IIterator_IRemoteSystemSessionParticipant_Interface'Class;
   type IIterator_IRemoteSystemSessionParticipant_Ptr is access all IIterator_IRemoteSystemSessionParticipant;
   type IIterable_IRemoteSystemSessionParticipant_Interface;
   type IIterable_IRemoteSystemSessionParticipant is access all IIterable_IRemoteSystemSessionParticipant_Interface'Class;
   type IIterable_IRemoteSystemSessionParticipant_Ptr is access all IIterable_IRemoteSystemSessionParticipant;
   
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
   
   IID_IRemoteSystemFilter : aliased constant Windows.IID := (1245424100, 39403, 17899, (186, 22, 3, 103, 114, 143, 243, 116 ));
   
   type IRemoteSystemFilter_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemStatics : aliased constant Windows.IID := (2760225682, 65323, 19271, (190, 98, 116, 63, 47, 20, 15, 48 ));
   
   type IRemoteSystemStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindByHostNameAsync
   (
      This       : access IRemoteSystemStatics_Interface
      ; hostName : Windows.Networking.IHostName
      ; RetVal : access Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcher
   (
      This       : access IRemoteSystemStatics_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemWatcher
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcherWithFilters
   (
      This       : access IRemoteSystemStatics_Interface
      ; filters : Windows.System.RemoteSystems.IIterable_IRemoteSystemFilter
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemWatcher
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IRemoteSystemStatics_Interface
      ; RetVal : access Windows.System.RemoteSystems.IAsyncOperation_RemoteSystemAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemStatics2 : aliased constant Windows.IID := (211348938, 28569, 19538, (162, 114, 234, 79, 54, 71, 23, 68 ));
   
   type IRemoteSystemStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function IsAuthorizationKindEnabled
   (
      This       : access IRemoteSystemStatics2_Interface
      ; kind : Windows.System.RemoteSystems.RemoteSystemAuthorizationKind
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystem : aliased constant Windows.IID := (3981981901, 7696, 19084, (180, 166, 78, 95, 214, 249, 119, 33 ));
   
   type IRemoteSystem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IRemoteSystem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IRemoteSystem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IRemoteSystem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IRemoteSystem_Interface
      ; RetVal : access Windows.System.RemoteSystems.RemoteSystemStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAvailableByProximity
   (
      This       : access IRemoteSystem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystem2 : aliased constant Windows.IID := (165668076, 64395, 18952, (167, 88, 104, 118, 67, 93, 118, 158 ));
   
   type IRemoteSystem2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAvailableBySpatialProximity
   (
      This       : access IRemoteSystem2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetCapabilitySupportedAsync
   (
      This       : access IRemoteSystem2_Interface
      ; capabilityName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystem3 : aliased constant Windows.IID := (1924445333, 47046, 16574, (131, 27, 115, 86, 47, 18, 255, 168 ));
   
   type IRemoteSystem3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ManufacturerDisplayName
   (
      This       : access IRemoteSystem3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelDisplayName
   (
      This       : access IRemoteSystem3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IKnownRemoteSystemCapabilitiesStatics : aliased constant Windows.IID := (2164843392, 32650, 17636, (146, 205, 3, 182, 70, 155, 148, 163 ));
   
   type IKnownRemoteSystemCapabilitiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppService
   (
      This       : access IKnownRemoteSystemCapabilitiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LaunchUri
   (
      This       : access IKnownRemoteSystemCapabilitiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteSession
   (
      This       : access IKnownRemoteSystemCapabilitiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SpatialEntity
   (
      This       : access IKnownRemoteSystemCapabilitiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemAuthorizationKindFilterFactory : aliased constant Windows.IID := (2909134669, 46698, 17828, (129, 119, 140, 174, 215, 93, 158, 90 ));
   
   type IRemoteSystemAuthorizationKindFilterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IRemoteSystemAuthorizationKindFilterFactory_Interface
      ; remoteSystemAuthorizationKind : Windows.System.RemoteSystems.RemoteSystemAuthorizationKind
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemAuthorizationKindFilter
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemAuthorizationKindFilter : aliased constant Windows.IID := (1796071054, 1232, 16628, (162, 127, 194, 172, 187, 214, 183, 52 ));
   
   type IRemoteSystemAuthorizationKindFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteSystemAuthorizationKind
   (
      This       : access IRemoteSystemAuthorizationKindFilter_Interface
      ; RetVal : access Windows.System.RemoteSystems.RemoteSystemAuthorizationKind
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemWatcher : aliased constant Windows.IID := (1566575742, 11271, 18629, (136, 156, 69, 93, 43, 9, 151, 113 ));
   
   type IRemoteSystemWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function Start
   (
      This       : access IRemoteSystemWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IRemoteSystemWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_RemoteSystemAdded
   (
      This       : access IRemoteSystemWatcher_Interface
      ; handler : TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RemoteSystemAdded
   (
      This       : access IRemoteSystemWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RemoteSystemUpdated
   (
      This       : access IRemoteSystemWatcher_Interface
      ; handler : TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RemoteSystemUpdated
   (
      This       : access IRemoteSystemWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RemoteSystemRemoved
   (
      This       : access IRemoteSystemWatcher_Interface
      ; handler : TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RemoteSystemRemoved
   (
      This       : access IRemoteSystemWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemAddedEventArgs : aliased constant Windows.IID := (2402899471, 58676, 18071, (136, 54, 122, 190, 161, 81, 81, 110 ));
   
   type IRemoteSystemAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteSystem
   (
      This       : access IRemoteSystemAddedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystem
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemUpdatedEventArgs : aliased constant Windows.IID := (1963130638, 56267, 16725, (180, 202, 179, 10, 4, 242, 118, 39 ));
   
   type IRemoteSystemUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteSystem
   (
      This       : access IRemoteSystemUpdatedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystem
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemRemovedEventArgs : aliased constant Windows.IID := (2336036539, 29446, 18922, (183, 223, 103, 213, 113, 76, 176, 19 ));
   
   type IRemoteSystemRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteSystemId
   (
      This       : access IRemoteSystemRemovedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemConnectionRequestFactory : aliased constant Windows.IID := (2852784672, 47851, 17781, (181, 48, 129, 11, 185, 120, 99, 52 ));
   
   type IRemoteSystemConnectionRequestFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IRemoteSystemConnectionRequestFactory_Interface
      ; remoteSystem : Windows.System.RemoteSystems.IRemoteSystem
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemConnectionRequest : aliased constant Windows.IID := (2230141188, 36190, 19826, (130, 56, 118, 33, 87, 108, 122, 103 ));
   
   type IRemoteSystemConnectionRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteSystem
   (
      This       : access IRemoteSystemConnectionRequest_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystem
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemKindStatics : aliased constant Windows.IID := (4130436659, 43796, 16848, (149, 83, 121, 106, 173, 184, 130, 219 ));
   
   type IRemoteSystemKindStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Phone
   (
      This       : access IRemoteSystemKindStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Hub
   (
      This       : access IRemoteSystemKindStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Holographic
   (
      This       : access IRemoteSystemKindStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Desktop
   (
      This       : access IRemoteSystemKindStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Xbox
   (
      This       : access IRemoteSystemKindStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemKindStatics2 : aliased constant Windows.IID := (3118703568, 1126, 18249, (145, 232, 101, 249, 209, 154, 150, 165 ));
   
   type IRemoteSystemKindStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Iot
   (
      This       : access IRemoteSystemKindStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Tablet
   (
      This       : access IRemoteSystemKindStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Laptop
   (
      This       : access IRemoteSystemKindStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemKindFilterFactory : aliased constant Windows.IID := (2717587694, 39402, 16572, (154, 57, 198, 112, 170, 128, 74, 40 ));
   
   type IRemoteSystemKindFilterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IRemoteSystemKindFilterFactory_Interface
      ; remoteSystemKinds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemKindFilter
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemKindFilter : aliased constant Windows.IID := (954321388, 8899, 20214, (144, 26, 187, 177, 199, 170, 212, 237 ));
   
   type IRemoteSystemKindFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteSystemKinds
   (
      This       : access IRemoteSystemKindFilter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemDiscoveryTypeFilterFactory : aliased constant Windows.IID := (2677979539, 49760, 16737, (146, 242, 156, 2, 31, 35, 254, 93 ));
   
   type IRemoteSystemDiscoveryTypeFilterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IRemoteSystemDiscoveryTypeFilterFactory_Interface
      ; discoveryType : Windows.System.RemoteSystems.RemoteSystemDiscoveryType
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemDiscoveryTypeFilter
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemDiscoveryTypeFilter : aliased constant Windows.IID := (1121518623, 61018, 17370, (172, 106, 111, 238, 37, 70, 7, 65 ));
   
   type IRemoteSystemDiscoveryTypeFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteSystemDiscoveryType
   (
      This       : access IRemoteSystemDiscoveryTypeFilter_Interface
      ; RetVal : access Windows.System.RemoteSystems.RemoteSystemDiscoveryType
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemStatusTypeFilterFactory : aliased constant Windows.IID := (869234938, 55076, 16677, (172, 122, 141, 40, 30, 68, 201, 73 ));
   
   type IRemoteSystemStatusTypeFilterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IRemoteSystemStatusTypeFilterFactory_Interface
      ; remoteSystemStatusType : Windows.System.RemoteSystems.RemoteSystemStatusType
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemStatusTypeFilter
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemStatusTypeFilter : aliased constant Windows.IID := (205082958, 52150, 18295, (133, 52, 46, 12, 82, 26, 255, 162 ));
   
   type IRemoteSystemStatusTypeFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteSystemStatusType
   (
      This       : access IRemoteSystemStatusTypeFilter_Interface
      ; RetVal : access Windows.System.RemoteSystems.RemoteSystemStatusType
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionJoinResult : aliased constant Windows.IID := (3464175364, 41022, 16804, (144, 11, 30, 121, 50, 140, 18, 103 ));
   
   type IRemoteSystemSessionJoinResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IRemoteSystemSessionJoinResult_Interface
      ; RetVal : access Windows.System.RemoteSystems.RemoteSystemSessionJoinStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Session
   (
      This       : access IRemoteSystemSessionJoinResult_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSession
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionInfo : aliased constant Windows.IID := (4283299400, 35594, 20122, (153, 5, 105, 228, 184, 65, 197, 136 ));
   
   type IRemoteSystemSessionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IRemoteSystemSessionInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ControllerDisplayName
   (
      This       : access IRemoteSystemSessionInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function JoinAsync
   (
      This       : access IRemoteSystemSessionInfo_Interface
      ; RetVal : access Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystemSessionJoinResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionAddedEventArgs : aliased constant Windows.IID := (3582318420, 48279, 19513, (153, 180, 190, 202, 118, 224, 76, 63 ));
   
   type IRemoteSystemSessionAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SessionInfo
   (
      This       : access IRemoteSystemSessionAddedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionInfo
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionUpdatedEventArgs : aliased constant Windows.IID := (377966697, 8990, 19601, (142, 200, 179, 163, 157, 158, 85, 163 ));
   
   type IRemoteSystemSessionUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SessionInfo
   (
      This       : access IRemoteSystemSessionUpdatedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionInfo
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionRemovedEventArgs : aliased constant Windows.IID := (2944569678, 14753, 19946, (157, 99, 67, 121, 141, 91, 187, 208 ));
   
   type IRemoteSystemSessionRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SessionInfo
   (
      This       : access IRemoteSystemSessionRemovedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionInfo
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionWatcher : aliased constant Windows.IID := (2147738432, 3137, 19042, (182, 215, 189, 190, 43, 25, 190, 45 ));
   
   type IRemoteSystemSessionWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function Start
   (
      This       : access IRemoteSystemSessionWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IRemoteSystemSessionWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IRemoteSystemSessionWatcher_Interface
      ; RetVal : access Windows.System.RemoteSystems.RemoteSystemSessionWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_Added
   (
      This       : access IRemoteSystemSessionWatcher_Interface
      ; handler : TypedEventHandler_IRemoteSystemSessionWatcher_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access IRemoteSystemSessionWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Updated
   (
      This       : access IRemoteSystemSessionWatcher_Interface
      ; handler : TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Updated
   (
      This       : access IRemoteSystemSessionWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access IRemoteSystemSessionWatcher_Interface
      ; handler : TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access IRemoteSystemSessionWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionInvitation : aliased constant Windows.IID := (1043516561, 20951, 18278, (161, 33, 37, 81, 108, 59, 130, 148 ));
   
   type IRemoteSystemSessionInvitation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Sender
   (
      This       : access IRemoteSystemSessionInvitation_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystem
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionInfo
   (
      This       : access IRemoteSystemSessionInvitation_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionInfo
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionInvitationReceivedEventArgs : aliased constant Windows.IID := (1586907693, 41229, 20187, (141, 234, 84, 210, 10, 193, 149, 67 ));
   
   type IRemoteSystemSessionInvitationReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Invitation
   (
      This       : access IRemoteSystemSessionInvitationReceivedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionInvitation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionInvitationListener : aliased constant Windows.IID := (150208575, 48241, 18913, (135, 74, 49, 221, 255, 154, 39, 185 ));
   
   type IRemoteSystemSessionInvitationListener_Interface is interface and Windows.IInspectable_Interface;
   
   function add_InvitationReceived
   (
      This       : access IRemoteSystemSessionInvitationListener_Interface
      ; handler : TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_InvitationReceived
   (
      This       : access IRemoteSystemSessionInvitationListener_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionParticipant : aliased constant Windows.IID := (2123367820, 44281, 18217, (138, 23, 68, 231, 186, 237, 93, 204 ));
   
   type IRemoteSystemSessionParticipant_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteSystem
   (
      This       : access IRemoteSystemSessionParticipant_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystem
   )
   return Windows.HRESULT is abstract;
   
   function GetHostNames
   (
      This       : access IRemoteSystemSessionParticipant_Interface
      ; RetVal : access Windows.Networking.IVectorView_IHostName -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionParticipantAddedEventArgs : aliased constant Windows.IID := (3545913304, 51617, 19383, (182, 176, 121, 187, 145, 173, 249, 61 ));
   
   type IRemoteSystemSessionParticipantAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Participant
   (
      This       : access IRemoteSystemSessionParticipantAddedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionParticipantRemovedEventArgs : aliased constant Windows.IID := (2255417480, 56936, 19135, (136, 161, 249, 13, 22, 39, 65, 146 ));
   
   type IRemoteSystemSessionParticipantRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Participant
   (
      This       : access IRemoteSystemSessionParticipantRemovedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionParticipantWatcher : aliased constant Windows.IID := (3705471692, 43655, 19833, (182, 204, 68, 89, 179, 233, 32, 117 ));
   
   type IRemoteSystemSessionParticipantWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function Start
   (
      This       : access IRemoteSystemSessionParticipantWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IRemoteSystemSessionParticipantWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IRemoteSystemSessionParticipantWatcher_Interface
      ; RetVal : access Windows.System.RemoteSystems.RemoteSystemSessionParticipantWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_Added
   (
      This       : access IRemoteSystemSessionParticipantWatcher_Interface
      ; handler : TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access IRemoteSystemSessionParticipantWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access IRemoteSystemSessionParticipantWatcher_Interface
      ; handler : TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access IRemoteSystemSessionParticipantWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IRemoteSystemSessionParticipantWatcher_Interface
      ; handler : TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IRemoteSystemSessionParticipantWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionJoinRequest : aliased constant Windows.IID := (543162472, 31124, 17201, (134, 209, 216, 157, 136, 37, 133, 238 ));
   
   type IRemoteSystemSessionJoinRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Participant
   (
      This       : access IRemoteSystemSessionJoinRequest_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
   )
   return Windows.HRESULT is abstract;
   
   function Accept_x
   (
      This       : access IRemoteSystemSessionJoinRequest_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionJoinRequestedEventArgs : aliased constant Windows.IID := (3687468995, 33465, 18454, (156, 36, 228, 14, 97, 119, 75, 216 ));
   
   type IRemoteSystemSessionJoinRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_JoinRequest
   (
      This       : access IRemoteSystemSessionJoinRequestedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IRemoteSystemSessionJoinRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionCreationResult : aliased constant Windows.IID := (2811761346, 14302, 17548, (139, 131, 163, 10, 163, 196, 234, 214 ));
   
   type IRemoteSystemSessionCreationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IRemoteSystemSessionCreationResult_Interface
      ; RetVal : access Windows.System.RemoteSystems.RemoteSystemSessionCreationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Session
   (
      This       : access IRemoteSystemSessionCreationResult_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSession
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionOptions : aliased constant Windows.IID := (1947129685, 33816, 20225, (147, 83, 226, 28, 158, 204, 108, 252 ));
   
   type IRemoteSystemSessionOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsInviteOnly
   (
      This       : access IRemoteSystemSessionOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsInviteOnly
   (
      This       : access IRemoteSystemSessionOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionController : aliased constant Windows.IID := (3834326482, 26656, 18535, (180, 37, 216, 156, 10, 62, 247, 186 ));
   
   type IRemoteSystemSessionController_Interface is interface and Windows.IInspectable_Interface;
   
   function add_JoinRequested
   (
      This       : access IRemoteSystemSessionController_Interface
      ; handler : TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_JoinRequested
   (
      This       : access IRemoteSystemSessionController_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function RemoveParticipantAsync
   (
      This       : access IRemoteSystemSessionController_Interface
      ; pParticipant : Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateSessionAsync
   (
      This       : access IRemoteSystemSessionController_Interface
      ; RetVal : access Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystemSessionCreationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionControllerFactory : aliased constant Windows.IID := (3217829739, 44093, 16793, (130, 205, 102, 112, 167, 115, 239, 46 ));
   
   type IRemoteSystemSessionControllerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateController
   (
      This       : access IRemoteSystemSessionControllerFactory_Interface
      ; displayName : Windows.String
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionController
   )
   return Windows.HRESULT is abstract;
   
   function CreateControllerWithSessionOptions
   (
      This       : access IRemoteSystemSessionControllerFactory_Interface
      ; displayName : Windows.String
      ; options : Windows.System.RemoteSystems.IRemoteSystemSessionOptions
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionController
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionDisconnectedEventArgs : aliased constant Windows.IID := (3725313691, 30661, 17948, (130, 9, 124, 108, 93, 49, 17, 171 ));
   
   type IRemoteSystemSessionDisconnectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IRemoteSystemSessionDisconnectedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.RemoteSystemSessionDisconnectedReason
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSession : aliased constant Windows.IID := (1766287873, 39642, 18703, (149, 73, 211, 28, 177, 76, 158, 149 ));
   
   type IRemoteSystemSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IRemoteSystemSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IRemoteSystemSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ControllerDisplayName
   (
      This       : access IRemoteSystemSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_Disconnected
   (
      This       : access IRemoteSystemSession_Interface
      ; handler : TypedEventHandler_IRemoteSystemSession_add_Disconnected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Disconnected
   (
      This       : access IRemoteSystemSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CreateParticipantWatcher
   (
      This       : access IRemoteSystemSession_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
   )
   return Windows.HRESULT is abstract;
   
   function SendInvitationAsync
   (
      This       : access IRemoteSystemSession_Interface
      ; invitee : Windows.System.RemoteSystems.IRemoteSystem
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionStatics : aliased constant Windows.IID := (2233764255, 64800, 17635, (149, 101, 231, 90, 59, 20, 198, 110 ));
   
   type IRemoteSystemSessionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWatcher
   (
      This       : access IRemoteSystemSessionStatics_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionValueSetReceivedEventArgs : aliased constant Windows.IID := (116594565, 11685, 20056, (167, 143, 158, 141, 7, 132, 238, 37 ));
   
   type IRemoteSystemSessionValueSetReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Sender
   (
      This       : access IRemoteSystemSessionValueSetReceivedEventArgs_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IRemoteSystemSessionValueSetReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionMessageChannel : aliased constant Windows.IID := (2502218026, 29657, 19472, (183, 81, 194, 103, 132, 67, 113, 39 ));
   
   type IRemoteSystemSessionMessageChannel_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Session
   (
      This       : access IRemoteSystemSessionMessageChannel_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSession
   )
   return Windows.HRESULT is abstract;
   
   function BroadcastValueSetAsync
   (
      This       : access IRemoteSystemSessionMessageChannel_Interface
      ; messageData : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendValueSetAsync
   (
      This       : access IRemoteSystemSessionMessageChannel_Interface
      ; messageData : Windows.Foundation.Collections.IPropertySet
      ; participant : Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendValueSetToParticipantsAsync
   (
      This       : access IRemoteSystemSessionMessageChannel_Interface
      ; messageData : Windows.Foundation.Collections.IPropertySet
      ; participants : Windows.System.RemoteSystems.IIterable_IRemoteSystemSessionParticipant
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ValueSetReceived
   (
      This       : access IRemoteSystemSessionMessageChannel_Interface
      ; handler : TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ValueSetReceived
   (
      This       : access IRemoteSystemSessionMessageChannel_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRemoteSystemSessionMessageChannelFactory : aliased constant Windows.IID := (694033482, 48406, 17048, (183, 206, 65, 84, 130, 176, 225, 29 ));
   
   type IRemoteSystemSessionMessageChannelFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IRemoteSystemSessionMessageChannelFactory_Interface
      ; session : Windows.System.RemoteSystems.IRemoteSystemSession
      ; channelName : Windows.String
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithReliability
   (
      This       : access IRemoteSystemSessionMessageChannelFactory_Interface
      ; session : Windows.System.RemoteSystems.IRemoteSystemSession
      ; channelName : Windows.String
      ; reliability : Windows.System.RemoteSystems.RemoteSystemSessionMessageChannelReliability
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IRemoteSystem : aliased constant Windows.IID := (221902150, 3786, 21046, (165, 202, 126, 54, 96, 101, 132, 98 ));
   
   type IAsyncOperation_IRemoteSystem_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRemoteSystem_Interface
      ; handler : Windows.System.RemoteSystems.AsyncOperationCompletedHandler_IRemoteSystem
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRemoteSystem_Interface
      ; RetVal : access Windows.System.RemoteSystems.AsyncOperationCompletedHandler_IRemoteSystem
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRemoteSystem_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystem
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IRemoteSystemFilter : aliased constant Windows.IID := (1781291759, 40752, 22702, (166, 203, 154, 201, 200, 9, 42, 65 ));
   
   type IIterator_IRemoteSystemFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRemoteSystemFilter_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemFilter
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRemoteSystemFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRemoteSystemFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRemoteSystemFilter_Interface
      ; items : Windows.System.RemoteSystems.IRemoteSystemFilter_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IRemoteSystemFilter : aliased constant Windows.IID := (328625298, 43230, 20672, (177, 107, 0, 194, 196, 143, 95, 55 ));
   
   type IIterable_IRemoteSystemFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRemoteSystemFilter_Interface
      ; RetVal : access Windows.System.RemoteSystems.IIterator_IRemoteSystemFilter
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_RemoteSystemAccessStatus : aliased constant Windows.IID := (3614287480, 56694, 21600, (135, 69, 145, 91, 68, 16, 201, 5 ));
   
   type IAsyncOperation_RemoteSystemAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_RemoteSystemAccessStatus_Interface
      ; handler : Windows.System.RemoteSystems.AsyncOperationCompletedHandler_RemoteSystemAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_RemoteSystemAccessStatus_Interface
      ; RetVal : access Windows.System.RemoteSystems.AsyncOperationCompletedHandler_RemoteSystemAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_RemoteSystemAccessStatus_Interface
      ; RetVal : access Windows.System.RemoteSystems.RemoteSystemAccessStatus
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IRemoteSystemSessionJoinResult : aliased constant Windows.IID := (3314400542, 58112, 21928, (173, 165, 226, 90, 170, 168, 102, 103 ));
   
   type IAsyncOperation_IRemoteSystemSessionJoinResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRemoteSystemSessionJoinResult_Interface
      ; handler : Windows.System.RemoteSystems.AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRemoteSystemSessionJoinResult_Interface
      ; RetVal : access Windows.System.RemoteSystems.AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRemoteSystemSessionJoinResult_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IRemoteSystemSessionCreationResult : aliased constant Windows.IID := (2419477493, 53380, 24400, (151, 41, 130, 2, 83, 38, 171, 239 ));
   
   type IAsyncOperation_IRemoteSystemSessionCreationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRemoteSystemSessionCreationResult_Interface
      ; handler : Windows.System.RemoteSystems.AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRemoteSystemSessionCreationResult_Interface
      ; RetVal : access Windows.System.RemoteSystems.AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRemoteSystemSessionCreationResult_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IRemoteSystemSessionParticipant : aliased constant Windows.IID := (100582475, 15833, 23793, (161, 0, 190, 220, 146, 51, 41, 45 ));
   
   type IIterator_IRemoteSystemSessionParticipant_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRemoteSystemSessionParticipant_Interface
      ; RetVal : access Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRemoteSystemSessionParticipant_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRemoteSystemSessionParticipant_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRemoteSystemSessionParticipant_Interface
      ; items : Windows.System.RemoteSystems.IRemoteSystemSessionParticipant_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IRemoteSystemSessionParticipant : aliased constant Windows.IID := (1613072, 5868, 23834, (131, 105, 72, 112, 198, 158, 82, 179 ));
   
   type IIterable_IRemoteSystemSessionParticipant_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRemoteSystemSessionParticipant_Interface
      ; RetVal : access Windows.System.RemoteSystems.IIterator_IRemoteSystemSessionParticipant
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IRemoteSystem : aliased constant Windows.IID := (973820461, 39120, 23860, (172, 230, 44, 115, 70, 97, 63, 29 ));
   
   type AsyncOperationCompletedHandler_IRemoteSystem_Interface(Callback : access procedure (asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystem ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IRemoteSystem'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRemoteSystem_Interface
      ; asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystem
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_RemoteSystemAccessStatus : aliased constant Windows.IID := (1413095965, 61241, 22517, (151, 65, 176, 82, 219, 194, 146, 73 ));
   
   type AsyncOperationCompletedHandler_RemoteSystemAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_RemoteSystemAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_RemoteSystemAccessStatus'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_RemoteSystemAccessStatus_Interface
      ; asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_RemoteSystemAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded : aliased constant Windows.IID := (2847510346, 46653, 23815, (146, 187, 226, 172, 179, 148, 85, 209 ));
   
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemWatcher ; args : Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemAdded_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated : aliased constant Windows.IID := (2298073663, 35142, 23070, (141, 161, 130, 198, 105, 130, 166, 210 ));
   
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemWatcher ; args : Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemUpdated_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved : aliased constant Windows.IID := (3264281434, 16080, 22616, (175, 25, 248, 85, 83, 203, 150, 184 ));
   
   type TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemWatcher ; args : Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemWatcher_add_RemoteSystemRemoved_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult : aliased constant Windows.IID := (932896565, 19636, 21039, (145, 190, 145, 59, 86, 144, 86, 143 ));
   
   type AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult_Interface(Callback : access procedure (asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystemSessionJoinResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRemoteSystemSessionJoinResult_Interface
      ; asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystemSessionJoinResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemSessionWatcher_add_Added : aliased constant Windows.IID := (453209167, 27535, 21974, (182, 223, 69, 228, 106, 130, 59, 29 ));
   
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Added_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemSessionWatcher ; args : Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemSessionWatcher_add_Added'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionWatcher_add_Added_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated : aliased constant Windows.IID := (68110519, 3393, 23202, (133, 232, 99, 17, 102, 111, 3, 36 ));
   
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemSessionWatcher ; args : Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionWatcher_add_Updated_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed : aliased constant Windows.IID := (482104560, 3229, 22988, (128, 85, 94, 1, 122, 49, 120, 18 ));
   
   type TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemSessionWatcher ; args : Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionWatcher_add_Removed_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived : aliased constant Windows.IID := (413287099, 54072, 22212, (149, 89, 86, 141, 92, 44, 62, 147 ));
   
   type TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener ; args : Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionInvitationListener_add_InvitationReceived_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added : aliased constant Windows.IID := (2101542899, 64801, 24085, (178, 26, 117, 225, 187, 205, 19, 199 ));
   
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher ; args : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Added_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed : aliased constant Windows.IID := (1943529651, 32068, 20680, (175, 173, 69, 13, 229, 159, 208, 174 ));
   
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher ; args : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_Removed_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (3570359258, 52346, 21231, (162, 86, 196, 179, 97, 99, 190, 236 ));
   
   type TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionParticipantWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested : aliased constant Windows.IID := (3638577430, 46162, 21282, (174, 201, 227, 212, 213, 129, 199, 114 ));
   
   type TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemSessionController ; args : Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionController_add_JoinRequested_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionController
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult : aliased constant Windows.IID := (1853015369, 29610, 20840, (133, 96, 199, 35, 100, 147, 181, 4 ));
   
   type AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult_Interface(Callback : access procedure (asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystemSessionCreationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRemoteSystemSessionCreationResult_Interface
      ; asyncInfo : Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystemSessionCreationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemSession_add_Disconnected : aliased constant Windows.IID := (4221650803, 20536, 20762, (149, 163, 75, 164, 83, 73, 16, 10 ));
   
   type TypedEventHandler_IRemoteSystemSession_add_Disconnected_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemSession ; args : Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemSession_add_Disconnected'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSession_add_Disconnected_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSession
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived : aliased constant Windows.IID := (3296076589, 35958, 23462, (153, 245, 20, 85, 116, 132, 194, 13 ));
   
   type TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived_Interface(Callback : access procedure (sender : Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel ; args : Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRemoteSystemSessionMessageChannel_add_ValueSetReceived_Interface
      ; sender : Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel
      ; args : Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype RemoteSystem is Windows.System.RemoteSystems.IRemoteSystem;
   subtype RemoteSystemWatcher is Windows.System.RemoteSystems.IRemoteSystemWatcher;
   subtype RemoteSystemAuthorizationKindFilter is Windows.System.RemoteSystems.IRemoteSystemAuthorizationKindFilter;
   
   function Create
   (
      remoteSystemAuthorizationKind : Windows.System.RemoteSystems.RemoteSystemAuthorizationKind
   )
   return Windows.System.RemoteSystems.IRemoteSystemAuthorizationKindFilter;
   
   subtype RemoteSystemAddedEventArgs is Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs;
   subtype RemoteSystemUpdatedEventArgs is Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs;
   subtype RemoteSystemRemovedEventArgs is Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs;
   subtype RemoteSystemConnectionRequest is Windows.System.RemoteSystems.IRemoteSystemConnectionRequest;
   
   function Create
   (
      remoteSystem : Windows.System.RemoteSystems.IRemoteSystem
   )
   return Windows.System.RemoteSystems.IRemoteSystemConnectionRequest;
   
   subtype RemoteSystemKindFilter is Windows.System.RemoteSystems.IRemoteSystemKindFilter;
   
   function Create
   (
      remoteSystemKinds : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.System.RemoteSystems.IRemoteSystemKindFilter;
   
   subtype RemoteSystemDiscoveryTypeFilter is Windows.System.RemoteSystems.IRemoteSystemDiscoveryTypeFilter;
   
   function Create
   (
      discoveryType : Windows.System.RemoteSystems.RemoteSystemDiscoveryType
   )
   return Windows.System.RemoteSystems.IRemoteSystemDiscoveryTypeFilter;
   
   subtype RemoteSystemStatusTypeFilter is Windows.System.RemoteSystems.IRemoteSystemStatusTypeFilter;
   
   function Create
   (
      remoteSystemStatusType : Windows.System.RemoteSystems.RemoteSystemStatusType
   )
   return Windows.System.RemoteSystems.IRemoteSystemStatusTypeFilter;
   
   subtype RemoteSystemSession is Windows.System.RemoteSystems.IRemoteSystemSession;
   subtype RemoteSystemSessionJoinResult is Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult;
   subtype RemoteSystemSessionInfo is Windows.System.RemoteSystems.IRemoteSystemSessionInfo;
   subtype RemoteSystemSessionAddedEventArgs is Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs;
   subtype RemoteSystemSessionUpdatedEventArgs is Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs;
   subtype RemoteSystemSessionRemovedEventArgs is Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs;
   subtype RemoteSystemSessionWatcher is Windows.System.RemoteSystems.IRemoteSystemSessionWatcher;
   subtype RemoteSystemSessionInvitation is Windows.System.RemoteSystems.IRemoteSystemSessionInvitation;
   subtype RemoteSystemSessionInvitationReceivedEventArgs is Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs;
   subtype RemoteSystemSessionInvitationListener is Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener;
   
   function CreateRemoteSystemSessionInvitationListener return Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener;
   
   subtype RemoteSystemSessionParticipant is Windows.System.RemoteSystems.IRemoteSystemSessionParticipant;
   subtype RemoteSystemSessionParticipantAddedEventArgs is Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs;
   subtype RemoteSystemSessionParticipantRemovedEventArgs is Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs;
   subtype RemoteSystemSessionParticipantWatcher is Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher;
   subtype RemoteSystemSessionJoinRequest is Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequest;
   subtype RemoteSystemSessionJoinRequestedEventArgs is Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs;
   subtype RemoteSystemSessionCreationResult is Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult;
   subtype RemoteSystemSessionOptions is Windows.System.RemoteSystems.IRemoteSystemSessionOptions;
   
   function CreateRemoteSystemSessionOptions return Windows.System.RemoteSystems.IRemoteSystemSessionOptions;
   
   subtype RemoteSystemSessionController is Windows.System.RemoteSystems.IRemoteSystemSessionController;
   
   function CreateController
   (
      displayName : Windows.String
   )
   return Windows.System.RemoteSystems.IRemoteSystemSessionController;
   
   function CreateControllerWithSessionOptions
   (
      displayName : Windows.String
      ; options : Windows.System.RemoteSystems.IRemoteSystemSessionOptions
   )
   return Windows.System.RemoteSystems.IRemoteSystemSessionController;
   
   subtype RemoteSystemSessionDisconnectedEventArgs is Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs;
   subtype RemoteSystemSessionValueSetReceivedEventArgs is Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs;
   subtype RemoteSystemSessionMessageChannel is Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel;
   
   function Create
   (
      session : Windows.System.RemoteSystems.IRemoteSystemSession
      ; channelName : Windows.String
   )
   return Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel;
   
   function CreateWithReliability
   (
      session : Windows.System.RemoteSystems.IRemoteSystemSession
      ; channelName : Windows.String
      ; reliability : Windows.System.RemoteSystems.RemoteSystemSessionMessageChannelReliability
   )
   return Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function IsAuthorizationKindEnabled
   (
      kind : Windows.System.RemoteSystems.RemoteSystemAuthorizationKind
   )
   return Windows.Boolean;
   
   function FindByHostNameAsync
   (
      hostName : Windows.Networking.IHostName
   )
   return Windows.System.RemoteSystems.IAsyncOperation_IRemoteSystem;
   
   function CreateWatcher
   return Windows.System.RemoteSystems.IRemoteSystemWatcher;
   
   function CreateWatcherWithFilters
   (
      filters : Windows.System.RemoteSystems.IIterable_IRemoteSystemFilter
   )
   return Windows.System.RemoteSystems.IRemoteSystemWatcher;
   
   function RequestAccessAsync
   return Windows.System.RemoteSystems.IAsyncOperation_RemoteSystemAccessStatus;
   
   function get_AppService
   return Windows.String;
   
   function get_LaunchUri
   return Windows.String;
   
   function get_RemoteSession
   return Windows.String;
   
   function get_SpatialEntity
   return Windows.String;
   
   function get_Iot
   return Windows.String;
   
   function get_Tablet
   return Windows.String;
   
   function get_Laptop
   return Windows.String;
   
   function get_Phone
   return Windows.String;
   
   function get_Hub
   return Windows.String;
   
   function get_Holographic
   return Windows.String;
   
   function get_Desktop
   return Windows.String;
   
   function get_Xbox
   return Windows.String;
   
   function CreateWatcher
   return Windows.System.RemoteSystems.IRemoteSystemSessionWatcher;

end;
