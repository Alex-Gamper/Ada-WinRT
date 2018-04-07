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
limited with Windows.ApplicationModel.Contacts;
with Windows; use Windows;
limited with Windows.UI;
with Windows.Foundation.Collections;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Calls is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PhoneNetworkState is (
      Unknown,
      NoSignal,
      Deregistered,
      Denied,
      Searching,
      Home,
      RoamingInternational,
      RoamingDomestic
   );
   for PhoneNetworkState use (
      Unknown => 0,
      NoSignal => 1,
      Deregistered => 2,
      Denied => 3,
      Searching => 4,
      Home => 5,
      RoamingInternational => 6,
      RoamingDomestic => 7
   );
   for PhoneNetworkState'Size use 32;
   
   type PhoneNetworkState_Ptr is access PhoneNetworkState;
   
   type PhoneVoicemailType is (
      None,
      Traditional,
      Visual
   );
   for PhoneVoicemailType use (
      None => 0,
      Traditional => 1,
      Visual => 2
   );
   for PhoneVoicemailType'Size use 32;
   
   type PhoneVoicemailType_Ptr is access PhoneVoicemailType;
   
   type PhoneCallMedia is (
      Audio,
      AudioAndVideo
   );
   for PhoneCallMedia use (
      Audio => 0,
      AudioAndVideo => 1
   );
   for PhoneCallMedia'Size use 32;
   
   type PhoneCallMedia_Ptr is access PhoneCallMedia;
   
   type PhoneLineTransport is (
      Cellular,
      VoipApp
   );
   for PhoneLineTransport use (
      Cellular => 0,
      VoipApp => 1
   );
   for PhoneLineTransport'Size use 32;
   
   type PhoneLineTransport_Ptr is access PhoneLineTransport;
   
   type PhoneSimState is (
      Unknown,
      PinNotRequired,
      PinUnlocked,
      PinLocked,
      PukLocked,
      NotInserted,
      Invalid,
      Disabled
   );
   for PhoneSimState use (
      Unknown => 0,
      PinNotRequired => 1,
      PinUnlocked => 2,
      PinLocked => 3,
      PukLocked => 4,
      NotInserted => 5,
      Invalid => 6,
      Disabled => 7
   );
   for PhoneSimState'Size use 32;
   
   type PhoneSimState_Ptr is access PhoneSimState;
   
   type PhoneAudioRoutingEndpoint is (
      Default,
      Bluetooth,
      Speakerphone
   );
   for PhoneAudioRoutingEndpoint use (
      Default => 0,
      Bluetooth => 1,
      Speakerphone => 2
   );
   for PhoneAudioRoutingEndpoint'Size use 32;
   
   type PhoneAudioRoutingEndpoint_Ptr is access PhoneAudioRoutingEndpoint;
   
   type PhoneLineWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopped
   );
   for PhoneLineWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopped => 3
   );
   for PhoneLineWatcherStatus'Size use 32;
   
   type PhoneLineWatcherStatus_Ptr is access PhoneLineWatcherStatus;
   
   type PhoneLineNetworkOperatorDisplayTextLocation is (
      Default,
      Tile,
      Dialer,
      InCallUI
   );
   for PhoneLineNetworkOperatorDisplayTextLocation use (
      Default => 0,
      Tile => 1,
      Dialer => 2,
      InCallUI => 3
   );
   for PhoneLineNetworkOperatorDisplayTextLocation'Size use 32;
   
   type PhoneLineNetworkOperatorDisplayTextLocation_Ptr is access PhoneLineNetworkOperatorDisplayTextLocation;
   
   type CellularDtmfMode is (
      Continuous,
      Burst
   );
   for CellularDtmfMode use (
      Continuous => 0,
      Burst => 1
   );
   for CellularDtmfMode'Size use 32;
   
   type CellularDtmfMode_Ptr is access CellularDtmfMode;
   
   type VoipPhoneCallMedia is (
      None,
      Audio,
      Video
   );
   for VoipPhoneCallMedia use (
      None => 0,
      Audio => 1,
      Video => 2
   );
   for VoipPhoneCallMedia'Size use 32;
   
   type VoipPhoneCallMedia_Ptr is access VoipPhoneCallMedia;
   
   type VoipPhoneCallRejectReason is (
      UserIgnored,
      TimedOut,
      OtherIncomingCall,
      EmergencyCallExists,
      InvalidCallState
   );
   for VoipPhoneCallRejectReason use (
      UserIgnored => 0,
      TimedOut => 1,
      OtherIncomingCall => 2,
      EmergencyCallExists => 3,
      InvalidCallState => 4
   );
   for VoipPhoneCallRejectReason'Size use 32;
   
   type VoipPhoneCallRejectReason_Ptr is access VoipPhoneCallRejectReason;
   
   type VoipPhoneCallState is (
      Ended,
      Held,
      Active,
      Incoming,
      Outgoing
   );
   for VoipPhoneCallState use (
      Ended => 0,
      Held => 1,
      Active => 2,
      Incoming => 3,
      Outgoing => 4
   );
   for VoipPhoneCallState'Size use 32;
   
   type VoipPhoneCallState_Ptr is access VoipPhoneCallState;
   
   type VoipPhoneCallResourceReservationStatus is (
      Success,
      ResourcesNotAvailable
   );
   for VoipPhoneCallResourceReservationStatus use (
      Success => 0,
      ResourcesNotAvailable => 1
   );
   for VoipPhoneCallResourceReservationStatus'Size use 32;
   
   type VoipPhoneCallResourceReservationStatus_Ptr is access VoipPhoneCallResourceReservationStatus;
   
   type PhoneCallHistoryEntryOtherAppReadAccess is (
      Full,
      SystemOnly
   );
   for PhoneCallHistoryEntryOtherAppReadAccess use (
      Full => 0,
      SystemOnly => 1
   );
   for PhoneCallHistoryEntryOtherAppReadAccess'Size use 32;
   
   type PhoneCallHistoryEntryOtherAppReadAccess_Ptr is access PhoneCallHistoryEntryOtherAppReadAccess;
   
   type PhoneCallHistoryEntryMedia is (
      Audio,
      Video
   );
   for PhoneCallHistoryEntryMedia use (
      Audio => 0,
      Video => 1
   );
   for PhoneCallHistoryEntryMedia'Size use 32;
   
   type PhoneCallHistoryEntryMedia_Ptr is access PhoneCallHistoryEntryMedia;
   
   type PhoneCallHistoryEntryRawAddressKind is (
      PhoneNumber,
      Custom
   );
   for PhoneCallHistoryEntryRawAddressKind use (
      PhoneNumber => 0,
      Custom => 1
   );
   for PhoneCallHistoryEntryRawAddressKind'Size use 32;
   
   type PhoneCallHistoryEntryRawAddressKind_Ptr is access PhoneCallHistoryEntryRawAddressKind;
   
   type PhoneCallHistoryEntryQueryDesiredMedia is (
      None,
      Audio,
      Video,
      All_x
   );
   for PhoneCallHistoryEntryQueryDesiredMedia use (
      None => 0,
      Audio => 1,
      Video => 2,
      All_x => 4294967295
   );
   for PhoneCallHistoryEntryQueryDesiredMedia'Size use 32;
   
   type PhoneCallHistoryEntryQueryDesiredMedia_Ptr is access PhoneCallHistoryEntryQueryDesiredMedia;
   
   type PhoneCallHistoryStoreAccessType is (
      AppEntriesReadWrite,
      AllEntriesLimitedReadWrite,
      AllEntriesReadWrite
   );
   for PhoneCallHistoryStoreAccessType use (
      AppEntriesReadWrite => 0,
      AllEntriesLimitedReadWrite => 1,
      AllEntriesReadWrite => 2
   );
   for PhoneCallHistoryStoreAccessType'Size use 32;
   
   type PhoneCallHistoryStoreAccessType_Ptr is access PhoneCallHistoryStoreAccessType;
   
   type PhoneCallHistorySourceIdKind is (
      CellularPhoneLineId,
      PackageFamilyName
   );
   for PhoneCallHistorySourceIdKind use (
      CellularPhoneLineId => 0,
      PackageFamilyName => 1
   );
   for PhoneCallHistorySourceIdKind'Size use 32;
   
   type PhoneCallHistorySourceIdKind_Ptr is access PhoneCallHistorySourceIdKind;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type CallsPhoneContract is null record;
   pragma Convention (C_Pass_By_Copy , CallsPhoneContract);
   
   type CallsPhoneContract_Ptr is access CallsPhoneContract;
   
   type CallsVoipContract is null record;
   pragma Convention (C_Pass_By_Copy , CallsVoipContract);
   
   type CallsVoipContract_Ptr is access CallsVoipContract;
   
   type LockScreenCallContract is null record;
   pragma Convention (C_Pass_By_Copy , LockScreenCallContract);
   
   type LockScreenCallContract_Ptr is access LockScreenCallContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IPhoneLine_add_LineChanged_Interface;
   type TypedEventHandler_IPhoneLine_add_LineChanged is access all TypedEventHandler_IPhoneLine_add_LineChanged_Interface'Class;
   type TypedEventHandler_IPhoneLine_add_LineChanged_Ptr is access all TypedEventHandler_IPhoneLine_add_LineChanged;
   type AsyncOperationCompletedHandler_IPhoneLine_Interface;
   type AsyncOperationCompletedHandler_IPhoneLine is access all AsyncOperationCompletedHandler_IPhoneLine_Interface'Class;
   type AsyncOperationCompletedHandler_IPhoneLine_Ptr is access all AsyncOperationCompletedHandler_IPhoneLine;
   type TypedEventHandler_IPhoneLineWatcher_add_LineAdded_Interface;
   type TypedEventHandler_IPhoneLineWatcher_add_LineAdded is access all TypedEventHandler_IPhoneLineWatcher_add_LineAdded_Interface'Class;
   type TypedEventHandler_IPhoneLineWatcher_add_LineAdded_Ptr is access all TypedEventHandler_IPhoneLineWatcher_add_LineAdded;
   type TypedEventHandler_IPhoneLineWatcher_add_LineRemoved_Interface;
   type TypedEventHandler_IPhoneLineWatcher_add_LineRemoved is access all TypedEventHandler_IPhoneLineWatcher_add_LineRemoved_Interface'Class;
   type TypedEventHandler_IPhoneLineWatcher_add_LineRemoved_Ptr is access all TypedEventHandler_IPhoneLineWatcher_add_LineRemoved;
   type TypedEventHandler_IPhoneLineWatcher_add_LineUpdated_Interface;
   type TypedEventHandler_IPhoneLineWatcher_add_LineUpdated is access all TypedEventHandler_IPhoneLineWatcher_add_LineUpdated_Interface'Class;
   type TypedEventHandler_IPhoneLineWatcher_add_LineUpdated_Ptr is access all TypedEventHandler_IPhoneLineWatcher_add_LineUpdated;
   type TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted is access all TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IPhoneLineWatcher_add_Stopped_Interface;
   type TypedEventHandler_IPhoneLineWatcher_add_Stopped is access all TypedEventHandler_IPhoneLineWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IPhoneLineWatcher_add_Stopped_Ptr is access all TypedEventHandler_IPhoneLineWatcher_add_Stopped;
   type AsyncOperationCompletedHandler_IPhoneCallStore_Interface;
   type AsyncOperationCompletedHandler_IPhoneCallStore is access all AsyncOperationCompletedHandler_IPhoneCallStore_Interface'Class;
   type AsyncOperationCompletedHandler_IPhoneCallStore_Ptr is access all AsyncOperationCompletedHandler_IPhoneCallStore;
   type AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities_Interface;
   type AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities is access all AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities_Interface'Class;
   type AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities_Ptr is access all AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities;
   type TypedEventHandler_IVoipPhoneCall_add_EndRequested_Interface;
   type TypedEventHandler_IVoipPhoneCall_add_EndRequested is access all TypedEventHandler_IVoipPhoneCall_add_EndRequested_Interface'Class;
   type TypedEventHandler_IVoipPhoneCall_add_EndRequested_Ptr is access all TypedEventHandler_IVoipPhoneCall_add_EndRequested;
   type TypedEventHandler_IVoipPhoneCall_add_HoldRequested_Interface;
   type TypedEventHandler_IVoipPhoneCall_add_HoldRequested is access all TypedEventHandler_IVoipPhoneCall_add_HoldRequested_Interface'Class;
   type TypedEventHandler_IVoipPhoneCall_add_HoldRequested_Ptr is access all TypedEventHandler_IVoipPhoneCall_add_HoldRequested;
   type TypedEventHandler_IVoipPhoneCall_add_ResumeRequested_Interface;
   type TypedEventHandler_IVoipPhoneCall_add_ResumeRequested is access all TypedEventHandler_IVoipPhoneCall_add_ResumeRequested_Interface'Class;
   type TypedEventHandler_IVoipPhoneCall_add_ResumeRequested_Ptr is access all TypedEventHandler_IVoipPhoneCall_add_ResumeRequested;
   type TypedEventHandler_IVoipPhoneCall_add_AnswerRequested_Interface;
   type TypedEventHandler_IVoipPhoneCall_add_AnswerRequested is access all TypedEventHandler_IVoipPhoneCall_add_AnswerRequested_Interface'Class;
   type TypedEventHandler_IVoipPhoneCall_add_AnswerRequested_Ptr is access all TypedEventHandler_IVoipPhoneCall_add_AnswerRequested;
   type TypedEventHandler_IVoipPhoneCall_add_RejectRequested_Interface;
   type TypedEventHandler_IVoipPhoneCall_add_RejectRequested is access all TypedEventHandler_IVoipPhoneCall_add_RejectRequested_Interface'Class;
   type TypedEventHandler_IVoipPhoneCall_add_RejectRequested_Ptr is access all TypedEventHandler_IVoipPhoneCall_add_RejectRequested;
   type AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus_Interface;
   type AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus is access all AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus_Interface'Class;
   type AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus_Ptr is access all AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus;
   type TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged_Interface;
   type TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged is access all TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged_Interface'Class;
   type TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged_Ptr is access all TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged;
   type TypedEventHandler_ILockScreenCallUI_add_EndRequested_Interface;
   type TypedEventHandler_ILockScreenCallUI_add_EndRequested is access all TypedEventHandler_ILockScreenCallUI_add_EndRequested_Interface'Class;
   type TypedEventHandler_ILockScreenCallUI_add_EndRequested_Ptr is access all TypedEventHandler_ILockScreenCallUI_add_EndRequested;
   type TypedEventHandler_ILockScreenCallUI_add_Closed_Interface;
   type TypedEventHandler_ILockScreenCallUI_add_Closed is access all TypedEventHandler_ILockScreenCallUI_add_Closed_Interface'Class;
   type TypedEventHandler_ILockScreenCallUI_add_Closed_Ptr is access all TypedEventHandler_ILockScreenCallUI_add_Closed;
   type AsyncOperationCompletedHandler_IPhoneCallHistoryEntry_Interface;
   type AsyncOperationCompletedHandler_IPhoneCallHistoryEntry is access all AsyncOperationCompletedHandler_IPhoneCallHistoryEntry_Interface'Class;
   type AsyncOperationCompletedHandler_IPhoneCallHistoryEntry_Ptr is access all AsyncOperationCompletedHandler_IPhoneCallHistoryEntry;
   type AsyncOperationCompletedHandler_IPhoneCallHistoryStore_Interface;
   type AsyncOperationCompletedHandler_IPhoneCallHistoryStore is access all AsyncOperationCompletedHandler_IPhoneCallHistoryStore_Interface'Class;
   type AsyncOperationCompletedHandler_IPhoneCallHistoryStore_Ptr is access all AsyncOperationCompletedHandler_IPhoneCallHistoryStore;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPhoneVoicemail_Interface;
   type IPhoneVoicemail is access all IPhoneVoicemail_Interface'Class;
   type IPhoneVoicemail_Ptr is access all IPhoneVoicemail;
   type IPhoneDialOptions_Interface;
   type IPhoneDialOptions is access all IPhoneDialOptions_Interface'Class;
   type IPhoneDialOptions_Ptr is access all IPhoneDialOptions;
   type IPhoneLineCellularDetails_Interface;
   type IPhoneLineCellularDetails is access all IPhoneLineCellularDetails_Interface'Class;
   type IPhoneLineCellularDetails_Ptr is access all IPhoneLineCellularDetails;
   type IPhoneLine_Interface;
   type IPhoneLine is access all IPhoneLine_Interface'Class;
   type IPhoneLine_Ptr is access all IPhoneLine;
   type IPhoneCallStore_Interface;
   type IPhoneCallStore is access all IPhoneCallStore_Interface'Class;
   type IPhoneCallStore_Ptr is access all IPhoneCallStore;
   type IPhoneLineConfiguration_Interface;
   type IPhoneLineConfiguration is access all IPhoneLineConfiguration_Interface'Class;
   type IPhoneLineConfiguration_Ptr is access all IPhoneLineConfiguration;
   type IPhoneLineStatics_Interface;
   type IPhoneLineStatics is access all IPhoneLineStatics_Interface'Class;
   type IPhoneLineStatics_Ptr is access all IPhoneLineStatics;
   type IPhoneLineWatcher_Interface;
   type IPhoneLineWatcher is access all IPhoneLineWatcher_Interface'Class;
   type IPhoneLineWatcher_Ptr is access all IPhoneLineWatcher;
   type IPhoneLineWatcherEventArgs_Interface;
   type IPhoneLineWatcherEventArgs is access all IPhoneLineWatcherEventArgs_Interface'Class;
   type IPhoneLineWatcherEventArgs_Ptr is access all IPhoneLineWatcherEventArgs;
   type IPhoneCallManagerStatics_Interface;
   type IPhoneCallManagerStatics is access all IPhoneCallManagerStatics_Interface'Class;
   type IPhoneCallManagerStatics_Ptr is access all IPhoneCallManagerStatics;
   type IPhoneCallManagerStatics2_Interface;
   type IPhoneCallManagerStatics2 is access all IPhoneCallManagerStatics2_Interface'Class;
   type IPhoneCallManagerStatics2_Ptr is access all IPhoneCallManagerStatics2;
   type IPhoneCallVideoCapabilities_Interface;
   type IPhoneCallVideoCapabilities is access all IPhoneCallVideoCapabilities_Interface'Class;
   type IPhoneCallVideoCapabilities_Ptr is access all IPhoneCallVideoCapabilities;
   type IPhoneCallVideoCapabilitiesManagerStatics_Interface;
   type IPhoneCallVideoCapabilitiesManagerStatics is access all IPhoneCallVideoCapabilitiesManagerStatics_Interface'Class;
   type IPhoneCallVideoCapabilitiesManagerStatics_Ptr is access all IPhoneCallVideoCapabilitiesManagerStatics;
   type IPhoneCallBlockingStatics_Interface;
   type IPhoneCallBlockingStatics is access all IPhoneCallBlockingStatics_Interface'Class;
   type IPhoneCallBlockingStatics_Ptr is access all IPhoneCallBlockingStatics;
   type ICallStateChangeEventArgs_Interface;
   type ICallStateChangeEventArgs is access all ICallStateChangeEventArgs_Interface'Class;
   type ICallStateChangeEventArgs_Ptr is access all ICallStateChangeEventArgs;
   type ICallAnswerEventArgs_Interface;
   type ICallAnswerEventArgs is access all ICallAnswerEventArgs_Interface'Class;
   type ICallAnswerEventArgs_Ptr is access all ICallAnswerEventArgs;
   type ICallRejectEventArgs_Interface;
   type ICallRejectEventArgs is access all ICallRejectEventArgs_Interface'Class;
   type ICallRejectEventArgs_Ptr is access all ICallRejectEventArgs;
   type IVoipPhoneCall_Interface;
   type IVoipPhoneCall is access all IVoipPhoneCall_Interface'Class;
   type IVoipPhoneCall_Ptr is access all IVoipPhoneCall;
   type IVoipPhoneCall2_Interface;
   type IVoipPhoneCall2 is access all IVoipPhoneCall2_Interface'Class;
   type IVoipPhoneCall2_Ptr is access all IVoipPhoneCall2;
   type IMuteChangeEventArgs_Interface;
   type IMuteChangeEventArgs is access all IMuteChangeEventArgs_Interface'Class;
   type IMuteChangeEventArgs_Ptr is access all IMuteChangeEventArgs;
   type IVoipCallCoordinator_Interface;
   type IVoipCallCoordinator is access all IVoipCallCoordinator_Interface'Class;
   type IVoipCallCoordinator_Ptr is access all IVoipCallCoordinator;
   type IVoipCallCoordinatorStatics_Interface;
   type IVoipCallCoordinatorStatics is access all IVoipCallCoordinatorStatics_Interface'Class;
   type IVoipCallCoordinatorStatics_Ptr is access all IVoipCallCoordinatorStatics;
   type IVoipCallCoordinator2_Interface;
   type IVoipCallCoordinator2 is access all IVoipCallCoordinator2_Interface'Class;
   type IVoipCallCoordinator2_Ptr is access all IVoipCallCoordinator2;
   type ILockScreenCallEndCallDeferral_Interface;
   type ILockScreenCallEndCallDeferral is access all ILockScreenCallEndCallDeferral_Interface'Class;
   type ILockScreenCallEndCallDeferral_Ptr is access all ILockScreenCallEndCallDeferral;
   type ILockScreenCallEndRequestedEventArgs_Interface;
   type ILockScreenCallEndRequestedEventArgs is access all ILockScreenCallEndRequestedEventArgs_Interface'Class;
   type ILockScreenCallEndRequestedEventArgs_Ptr is access all ILockScreenCallEndRequestedEventArgs;
   type ILockScreenCallUI_Interface;
   type ILockScreenCallUI is access all ILockScreenCallUI_Interface'Class;
   type ILockScreenCallUI_Ptr is access all ILockScreenCallUI;
   type IPhoneCallHistoryEntry_Interface;
   type IPhoneCallHistoryEntry is access all IPhoneCallHistoryEntry_Interface'Class;
   type IPhoneCallHistoryEntry_Ptr is access all IPhoneCallHistoryEntry;
   type IPhoneCallHistoryEntryAddress_Interface;
   type IPhoneCallHistoryEntryAddress is access all IPhoneCallHistoryEntryAddress_Interface'Class;
   type IPhoneCallHistoryEntryAddress_Ptr is access all IPhoneCallHistoryEntryAddress;
   type IPhoneCallHistoryEntryAddressFactory_Interface;
   type IPhoneCallHistoryEntryAddressFactory is access all IPhoneCallHistoryEntryAddressFactory_Interface'Class;
   type IPhoneCallHistoryEntryAddressFactory_Ptr is access all IPhoneCallHistoryEntryAddressFactory;
   type IPhoneCallHistoryEntryQueryOptions_Interface;
   type IPhoneCallHistoryEntryQueryOptions is access all IPhoneCallHistoryEntryQueryOptions_Interface'Class;
   type IPhoneCallHistoryEntryQueryOptions_Ptr is access all IPhoneCallHistoryEntryQueryOptions;
   type IPhoneCallHistoryEntryReader_Interface;
   type IPhoneCallHistoryEntryReader is access all IPhoneCallHistoryEntryReader_Interface'Class;
   type IPhoneCallHistoryEntryReader_Ptr is access all IPhoneCallHistoryEntryReader;
   type IPhoneCallHistoryStore_Interface;
   type IPhoneCallHistoryStore is access all IPhoneCallHistoryStore_Interface'Class;
   type IPhoneCallHistoryStore_Ptr is access all IPhoneCallHistoryStore;
   type IPhoneCallHistoryManagerStatics_Interface;
   type IPhoneCallHistoryManagerStatics is access all IPhoneCallHistoryManagerStatics_Interface'Class;
   type IPhoneCallHistoryManagerStatics_Ptr is access all IPhoneCallHistoryManagerStatics;
   type IPhoneCallHistoryManagerStatics2_Interface;
   type IPhoneCallHistoryManagerStatics2 is access all IPhoneCallHistoryManagerStatics2_Interface'Class;
   type IPhoneCallHistoryManagerStatics2_Ptr is access all IPhoneCallHistoryManagerStatics2;
   type IPhoneCallHistoryManagerForUser_Interface;
   type IPhoneCallHistoryManagerForUser is access all IPhoneCallHistoryManagerForUser_Interface'Class;
   type IPhoneCallHistoryManagerForUser_Ptr is access all IPhoneCallHistoryManagerForUser;
   type IAsyncOperation_IPhoneLine_Interface;
   type IAsyncOperation_IPhoneLine is access all IAsyncOperation_IPhoneLine_Interface'Class;
   type IAsyncOperation_IPhoneLine_Ptr is access all IAsyncOperation_IPhoneLine;
   type IAsyncOperation_IPhoneCallStore_Interface;
   type IAsyncOperation_IPhoneCallStore is access all IAsyncOperation_IPhoneCallStore_Interface'Class;
   type IAsyncOperation_IPhoneCallStore_Ptr is access all IAsyncOperation_IPhoneCallStore;
   type IAsyncOperation_IPhoneCallVideoCapabilities_Interface;
   type IAsyncOperation_IPhoneCallVideoCapabilities is access all IAsyncOperation_IPhoneCallVideoCapabilities_Interface'Class;
   type IAsyncOperation_IPhoneCallVideoCapabilities_Ptr is access all IAsyncOperation_IPhoneCallVideoCapabilities;
   type IAsyncOperation_VoipPhoneCallResourceReservationStatus_Interface;
   type IAsyncOperation_VoipPhoneCallResourceReservationStatus is access all IAsyncOperation_VoipPhoneCallResourceReservationStatus_Interface'Class;
   type IAsyncOperation_VoipPhoneCallResourceReservationStatus_Ptr is access all IAsyncOperation_VoipPhoneCallResourceReservationStatus;
   type IAsyncOperation_IPhoneCallHistoryEntry_Interface;
   type IAsyncOperation_IPhoneCallHistoryEntry is access all IAsyncOperation_IPhoneCallHistoryEntry_Interface'Class;
   type IAsyncOperation_IPhoneCallHistoryEntry_Ptr is access all IAsyncOperation_IPhoneCallHistoryEntry;
   type IIterator_IPhoneCallHistoryEntry_Interface;
   type IIterator_IPhoneCallHistoryEntry is access all IIterator_IPhoneCallHistoryEntry_Interface'Class;
   type IIterator_IPhoneCallHistoryEntry_Ptr is access all IIterator_IPhoneCallHistoryEntry;
   type IIterable_IPhoneCallHistoryEntry_Interface;
   type IIterable_IPhoneCallHistoryEntry is access all IIterable_IPhoneCallHistoryEntry_Interface'Class;
   type IIterable_IPhoneCallHistoryEntry_Ptr is access all IIterable_IPhoneCallHistoryEntry;
   type IAsyncOperation_IPhoneCallHistoryStore_Interface;
   type IAsyncOperation_IPhoneCallHistoryStore is access all IAsyncOperation_IPhoneCallHistoryStore_Interface'Class;
   type IAsyncOperation_IPhoneCallHistoryStore_Ptr is access all IAsyncOperation_IPhoneCallHistoryStore;
   
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
   type IPhoneVoicemail_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Number
   (
      This       : access IPhoneVoicemail_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageCount
   (
      This       : access IPhoneVoicemail_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IPhoneVoicemail_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneVoicemailType
   )
   return Windows.HRESULT is abstract;
   
   function DialVoicemailAsync
   (
      This       : access IPhoneVoicemail_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneVoicemail : aliased constant Windows.IID := (3385751542, 28319, 14987, (183, 39, 110, 12, 246, 153, 130, 36 ));
   
   ------------------------------------------------------------------------
   type IPhoneDialOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Number
   (
      This       : access IPhoneDialOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Number
   (
      This       : access IPhoneDialOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPhoneDialOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IPhoneDialOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IPhoneDialOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   function put_Contact
   (
      This       : access IPhoneDialOptions_Interface
      ; value : Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   function get_ContactPhone
   (
      This       : access IPhoneDialOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactPhone
   )
   return Windows.HRESULT is abstract;
   
   function put_ContactPhone
   (
      This       : access IPhoneDialOptions_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactPhone
   )
   return Windows.HRESULT is abstract;
   
   function get_Media
   (
      This       : access IPhoneDialOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneCallMedia
   )
   return Windows.HRESULT is abstract;
   
   function put_Media
   (
      This       : access IPhoneDialOptions_Interface
      ; value : Windows.ApplicationModel.Calls.PhoneCallMedia
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioEndpoint
   (
      This       : access IPhoneDialOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneAudioRoutingEndpoint
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioEndpoint
   (
      This       : access IPhoneDialOptions_Interface
      ; value : Windows.ApplicationModel.Calls.PhoneAudioRoutingEndpoint
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneDialOptions : aliased constant Windows.IID := (3057239224, 61551, 14027, (168, 99, 130, 55, 66, 181, 242, 212 ));
   
   ------------------------------------------------------------------------
   type IPhoneLineCellularDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SimState
   (
      This       : access IPhoneLineCellularDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneSimState
   )
   return Windows.HRESULT is abstract;
   
   function get_SimSlotIndex
   (
      This       : access IPhoneLineCellularDetails_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsModemOn
   (
      This       : access IPhoneLineCellularDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RegistrationRejectCode
   (
      This       : access IPhoneLineCellularDetails_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetNetworkOperatorDisplayText
   (
      This       : access IPhoneLineCellularDetails_Interface
      ; location : Windows.ApplicationModel.Calls.PhoneLineNetworkOperatorDisplayTextLocation
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneLineCellularDetails : aliased constant Windows.IID := (421921237, 5244, 18281, (182, 115, 152, 165, 236, 132, 38, 203 ));
   
   ------------------------------------------------------------------------
   type IPhoneLine_Interface is interface and Windows.IInspectable_Interface;
   
   function add_LineChanged
   (
      This       : access IPhoneLine_Interface
      ; handler : TypedEventHandler_IPhoneLine_add_LineChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LineChanged
   (
      This       : access IPhoneLine_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayColor
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkState
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneNetworkState
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Voicemail
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneVoicemail
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkName
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CellularDetails
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneLineCellularDetails
   )
   return Windows.HRESULT is abstract;
   
   function get_Transport
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneLineTransport
   )
   return Windows.HRESULT is abstract;
   
   function get_CanDial
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsTile
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoCallingCapabilities
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallVideoCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_LineConfiguration
   (
      This       : access IPhoneLine_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneLineConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function IsImmediateDialNumberAsync
   (
      This       : access IPhoneLine_Interface
      ; number : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Dial
   (
      This       : access IPhoneLine_Interface
      ; number : Windows.String
      ; displayName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DialWithOptions
   (
      This       : access IPhoneLine_Interface
      ; options : Windows.ApplicationModel.Calls.IPhoneDialOptions
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneLine : aliased constant Windows.IID := (667316016, 27241, 13514, (162, 186, 101, 48, 37, 48, 195, 17 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallStore_Interface is interface and Windows.IInspectable_Interface;
   
   function IsEmergencyPhoneNumberAsync
   (
      This       : access IPhoneCallStore_Interface
      ; number : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultLineAsync
   (
      This       : access IPhoneCallStore_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Guid -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestLineWatcher
   (
      This       : access IPhoneCallStore_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneLineWatcher
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallStore : aliased constant Windows.IID := (1600194376, 6310, 16755, (134, 209, 40, 190, 157, 198, 45, 186 ));
   
   ------------------------------------------------------------------------
   type IPhoneLineConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsVideoCallingEnabled
   (
      This       : access IPhoneLineConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedProperties
   (
      This       : access IPhoneLineConfiguration_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneLineConfiguration : aliased constant Windows.IID := (4263925858, 63055, 17170, (178, 168, 78, 37, 119, 33, 170, 149 ));
   
   ------------------------------------------------------------------------
   type IPhoneLineStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IPhoneLineStatics_Interface
      ; lineId : Windows.Guid
      ; RetVal : access Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneLine -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneLineStatics : aliased constant Windows.IID := (4085997347, 52912, 16463, (188, 242, 186, 159, 105, 125, 138, 223 ));
   
   ------------------------------------------------------------------------
   type IPhoneLineWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function Start
   (
      This       : access IPhoneLineWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IPhoneLineWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_LineAdded
   (
      This       : access IPhoneLineWatcher_Interface
      ; handler : TypedEventHandler_IPhoneLineWatcher_add_LineAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LineAdded
   (
      This       : access IPhoneLineWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LineRemoved
   (
      This       : access IPhoneLineWatcher_Interface
      ; handler : TypedEventHandler_IPhoneLineWatcher_add_LineRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LineRemoved
   (
      This       : access IPhoneLineWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_LineUpdated
   (
      This       : access IPhoneLineWatcher_Interface
      ; handler : TypedEventHandler_IPhoneLineWatcher_add_LineUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LineUpdated
   (
      This       : access IPhoneLineWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IPhoneLineWatcher_Interface
      ; handler : TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IPhoneLineWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IPhoneLineWatcher_Interface
      ; handler : TypedEventHandler_IPhoneLineWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IPhoneLineWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IPhoneLineWatcher_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneLineWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneLineWatcher : aliased constant Windows.IID := (2319830282, 25379, 17632, (166, 246, 159, 33, 246, 77, 201, 10 ));
   
   ------------------------------------------------------------------------
   type IPhoneLineWatcherEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LineId
   (
      This       : access IPhoneLineWatcherEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneLineWatcherEventArgs : aliased constant Windows.IID := (3497817406, 40466, 18999, (130, 183, 173, 83, 93, 173, 106, 103 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowPhoneCallUI
   (
      This       : access IPhoneCallManagerStatics_Interface
      ; phoneNumber : Windows.String
      ; displayName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallManagerStatics : aliased constant Windows.IID := (1626188920, 30886, 18546, (163, 239, 152, 50, 94, 200, 184, 67 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_CallStateChanged
   (
      This       : access IPhoneCallManagerStatics2_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CallStateChanged
   (
      This       : access IPhoneCallManagerStatics2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCallActive
   (
      This       : access IPhoneCallManagerStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCallIncoming
   (
      This       : access IPhoneCallManagerStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ShowPhoneCallSettingsUI
   (
      This       : access IPhoneCallManagerStatics2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RequestStoreAsync
   (
      This       : access IPhoneCallManagerStatics2_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallManagerStatics2 : aliased constant Windows.IID := (3353594044, 9072, 17180, (152, 253, 67, 190, 95, 3, 8, 109 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallVideoCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsVideoCallingCapable
   (
      This       : access IPhoneCallVideoCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallVideoCapabilities : aliased constant Windows.IID := (37234566, 45418, 20443, (190, 59, 196, 36, 14, 19, 173, 13 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallVideoCapabilitiesManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCapabilitiesAsync
   (
      This       : access IPhoneCallVideoCapabilitiesManagerStatics_Interface
      ; phoneNumber : Windows.String
      ; RetVal : access Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallVideoCapabilities -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallVideoCapabilitiesManagerStatics : aliased constant Windows.IID := (4089858902, 61451, 18972, (160, 198, 238, 25, 16, 116, 156, 231 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallBlockingStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BlockUnknownNumbers
   (
      This       : access IPhoneCallBlockingStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_BlockUnknownNumbers
   (
      This       : access IPhoneCallBlockingStatics_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BlockPrivateNumbers
   (
      This       : access IPhoneCallBlockingStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_BlockPrivateNumbers
   (
      This       : access IPhoneCallBlockingStatics_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetCallBlockingListAsync
   (
      This       : access IPhoneCallBlockingStatics_Interface
      ; phoneNumberList : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallBlockingStatics : aliased constant Windows.IID := (426012548, 11129, 9969, (164, 111, 105, 75, 224, 67, 243, 19 ));
   
   ------------------------------------------------------------------------
   type ICallStateChangeEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access ICallStateChangeEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.VoipPhoneCallState
   )
   return Windows.HRESULT is abstract;
   
   IID_ICallStateChangeEventArgs : aliased constant Windows.IID := (3937547422, 26357, 18425, (159, 181, 69, 156, 81, 152, 199, 32 ));
   
   ------------------------------------------------------------------------
   type ICallAnswerEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AcceptedMedia
   (
      This       : access ICallAnswerEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.VoipPhoneCallMedia
   )
   return Windows.HRESULT is abstract;
   
   IID_ICallAnswerEventArgs : aliased constant Windows.IID := (4252538391, 11735, 19596, (178, 189, 149, 209, 122, 91, 183, 51 ));
   
   ------------------------------------------------------------------------
   type ICallRejectEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RejectReason
   (
      This       : access ICallRejectEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.VoipPhoneCallRejectReason
   )
   return Windows.HRESULT is abstract;
   
   IID_ICallRejectEventArgs : aliased constant Windows.IID := (3662150359, 5076, 19858, (161, 194, 183, 120, 17, 238, 55, 236 ));
   
   ------------------------------------------------------------------------
   type IVoipPhoneCall_Interface is interface and Windows.IInspectable_Interface;
   
   function add_EndRequested
   (
      This       : access IVoipPhoneCall_Interface
      ; handler : TypedEventHandler_IVoipPhoneCall_add_EndRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EndRequested
   (
      This       : access IVoipPhoneCall_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_HoldRequested
   (
      This       : access IVoipPhoneCall_Interface
      ; handler : TypedEventHandler_IVoipPhoneCall_add_HoldRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HoldRequested
   (
      This       : access IVoipPhoneCall_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ResumeRequested
   (
      This       : access IVoipPhoneCall_Interface
      ; handler : TypedEventHandler_IVoipPhoneCall_add_ResumeRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ResumeRequested
   (
      This       : access IVoipPhoneCall_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AnswerRequested
   (
      This       : access IVoipPhoneCall_Interface
      ; acceptHandler : TypedEventHandler_IVoipPhoneCall_add_AnswerRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AnswerRequested
   (
      This       : access IVoipPhoneCall_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RejectRequested
   (
      This       : access IVoipPhoneCall_Interface
      ; rejectHandler : TypedEventHandler_IVoipPhoneCall_add_RejectRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RejectRequested
   (
      This       : access IVoipPhoneCall_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function NotifyCallHeld
   (
      This       : access IVoipPhoneCall_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyCallActive
   (
      This       : access IVoipPhoneCall_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyCallEnded
   (
      This       : access IVoipPhoneCall_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_ContactName
   (
      This       : access IVoipPhoneCall_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContactName
   (
      This       : access IVoipPhoneCall_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTime
   (
      This       : access IVoipPhoneCall_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_StartTime
   (
      This       : access IVoipPhoneCall_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_CallMedia
   (
      This       : access IVoipPhoneCall_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.VoipPhoneCallMedia
   )
   return Windows.HRESULT is abstract;
   
   function put_CallMedia
   (
      This       : access IVoipPhoneCall_Interface
      ; value : Windows.ApplicationModel.Calls.VoipPhoneCallMedia
   )
   return Windows.HRESULT is abstract;
   
   function NotifyCallReady
   (
      This       : access IVoipPhoneCall_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IVoipPhoneCall : aliased constant Windows.IID := (1827795354, 30612, 19034, (140, 104, 174, 135, 148, 122, 105, 144 ));
   
   ------------------------------------------------------------------------
   type IVoipPhoneCall2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryShowAppUI
   (
      This       : access IVoipPhoneCall2_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IVoipPhoneCall2 : aliased constant Windows.IID := (1947944673, 9311, 16883, (147, 153, 49, 65, 210, 91, 82, 227 ));
   
   ------------------------------------------------------------------------
   type IMuteChangeEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Muted
   (
      This       : access IMuteChangeEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IMuteChangeEventArgs : aliased constant Windows.IID := (2240143705, 3137, 17196, (129, 77, 197, 241, 253, 245, 48, 190 ));
   
   ------------------------------------------------------------------------
   type IVoipCallCoordinator_Interface is interface and Windows.IInspectable_Interface;
   
   function ReserveCallResourcesAsync
   (
      This       : access IVoipCallCoordinator_Interface
      ; taskEntryPoint : Windows.String
      ; RetVal : access Windows.ApplicationModel.Calls.IAsyncOperation_VoipPhoneCallResourceReservationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_MuteStateChanged
   (
      This       : access IVoipCallCoordinator_Interface
      ; muteChangeHandler : TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MuteStateChanged
   (
      This       : access IVoipCallCoordinator_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function RequestNewIncomingCall
   (
      This       : access IVoipCallCoordinator_Interface
      ; context : Windows.String
      ; contactName : Windows.String
      ; contactNumber : Windows.String
      ; contactImage : Windows.Foundation.IUriRuntimeClass
      ; serviceName : Windows.String
      ; brandingImage : Windows.Foundation.IUriRuntimeClass
      ; callDetails : Windows.String
      ; ringtone : Windows.Foundation.IUriRuntimeClass
      ; media : Windows.ApplicationModel.Calls.VoipPhoneCallMedia
      ; ringTimeout : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.ApplicationModel.Calls.IVoipPhoneCall
   )
   return Windows.HRESULT is abstract;
   
   function RequestNewOutgoingCall
   (
      This       : access IVoipCallCoordinator_Interface
      ; context : Windows.String
      ; contactName : Windows.String
      ; serviceName : Windows.String
      ; media : Windows.ApplicationModel.Calls.VoipPhoneCallMedia
      ; RetVal : access Windows.ApplicationModel.Calls.IVoipPhoneCall
   )
   return Windows.HRESULT is abstract;
   
   function NotifyMuted
   (
      This       : access IVoipCallCoordinator_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyUnmuted
   (
      This       : access IVoipCallCoordinator_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RequestOutgoingUpgradeToVideoCall
   (
      This       : access IVoipCallCoordinator_Interface
      ; callUpgradeGuid : Windows.Guid
      ; context : Windows.String
      ; contactName : Windows.String
      ; serviceName : Windows.String
      ; RetVal : access Windows.ApplicationModel.Calls.IVoipPhoneCall
   )
   return Windows.HRESULT is abstract;
   
   function RequestIncomingUpgradeToVideoCall
   (
      This       : access IVoipCallCoordinator_Interface
      ; context : Windows.String
      ; contactName : Windows.String
      ; contactNumber : Windows.String
      ; contactImage : Windows.Foundation.IUriRuntimeClass
      ; serviceName : Windows.String
      ; brandingImage : Windows.Foundation.IUriRuntimeClass
      ; callDetails : Windows.String
      ; ringtone : Windows.Foundation.IUriRuntimeClass
      ; ringTimeout : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.ApplicationModel.Calls.IVoipPhoneCall
   )
   return Windows.HRESULT is abstract;
   
   function TerminateCellularCall
   (
      This       : access IVoipCallCoordinator_Interface
      ; callUpgradeGuid : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function CancelUpgrade
   (
      This       : access IVoipCallCoordinator_Interface
      ; callUpgradeGuid : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   IID_IVoipCallCoordinator : aliased constant Windows.IID := (1326549967, 59631, 17460, (156, 95, 168, 216, 147, 250, 254, 121 ));
   
   ------------------------------------------------------------------------
   type IVoipCallCoordinatorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IVoipCallCoordinatorStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IVoipCallCoordinator
   )
   return Windows.HRESULT is abstract;
   
   IID_IVoipCallCoordinatorStatics : aliased constant Windows.IID := (2136809259, 57418, 19728, (179, 26, 165, 92, 146, 44, 194, 251 ));
   
   ------------------------------------------------------------------------
   type IVoipCallCoordinator2_Interface is interface and Windows.IInspectable_Interface;
   
   function SetupNewAcceptedCall
   (
      This       : access IVoipCallCoordinator2_Interface
      ; context : Windows.String
      ; contactName : Windows.String
      ; contactNumber : Windows.String
      ; serviceName : Windows.String
      ; media : Windows.ApplicationModel.Calls.VoipPhoneCallMedia
      ; RetVal : access Windows.ApplicationModel.Calls.IVoipPhoneCall
   )
   return Windows.HRESULT is abstract;
   
   IID_IVoipCallCoordinator2 : aliased constant Windows.IID := (3199511027, 50948, 16948, (137, 206, 232, 140, 192, 210, 143, 190 ));
   
   ------------------------------------------------------------------------
   type ILockScreenCallEndCallDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access ILockScreenCallEndCallDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_ILockScreenCallEndCallDeferral : aliased constant Windows.IID := (769125645, 39149, 16449, (150, 50, 80, 255, 129, 43, 119, 63 ));
   
   ------------------------------------------------------------------------
   type ILockScreenCallEndRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access ILockScreenCallEndRequestedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.ILockScreenCallEndCallDeferral
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access ILockScreenCallEndRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   IID_ILockScreenCallEndRequestedEventArgs : aliased constant Windows.IID := (2173739875, 28455, 18153, (174, 182, 192, 174, 131, 228, 125, 199 ));
   
   ------------------------------------------------------------------------
   type ILockScreenCallUI_Interface is interface and Windows.IInspectable_Interface;
   
   function Dismiss
   (
      This       : access ILockScreenCallUI_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_EndRequested
   (
      This       : access ILockScreenCallUI_Interface
      ; handler : TypedEventHandler_ILockScreenCallUI_add_EndRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EndRequested
   (
      This       : access ILockScreenCallUI_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Closed
   (
      This       : access ILockScreenCallUI_Interface
      ; handler : TypedEventHandler_ILockScreenCallUI_add_Closed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access ILockScreenCallUI_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_CallTitle
   (
      This       : access ILockScreenCallUI_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CallTitle
   (
      This       : access ILockScreenCallUI_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ILockScreenCallUI : aliased constant Windows.IID := (3315006861, 29641, 18964, (176, 33, 236, 28, 80, 163, 183, 39 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallHistoryEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Address
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryAddress
   )
   return Windows.HRESULT is abstract;
   
   function put_Address
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCallerIdBlocked
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCallerIdBlocked
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEmergency
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEmergency
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsIncoming
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsIncoming
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMissed
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsMissed
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRinging
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsRinging
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSeen
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSeen
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSuppressed
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSuppressed
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVoicemail
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsVoicemail
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Media
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneCallHistoryEntryMedia
   )
   return Windows.HRESULT is abstract;
   
   function put_Media
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.ApplicationModel.Calls.PhoneCallHistoryEntryMedia
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherAppReadAccess
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneCallHistoryEntryOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function put_OtherAppReadAccess
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.ApplicationModel.Calls.PhoneCallHistoryEntryOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceDisplayName
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceId
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SourceId
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceIdKind
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneCallHistorySourceIdKind
   )
   return Windows.HRESULT is abstract;
   
   function put_SourceIdKind
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.ApplicationModel.Calls.PhoneCallHistorySourceIdKind
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTime
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_StartTime
   (
      This       : access IPhoneCallHistoryEntry_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallHistoryEntry : aliased constant Windows.IID := (4205895977, 12964, 19333, (131, 209, 249, 13, 140, 35, 168, 87 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallHistoryEntryAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactId
   (
      This       : access IPhoneCallHistoryEntryAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContactId
   (
      This       : access IPhoneCallHistoryEntryAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPhoneCallHistoryEntryAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IPhoneCallHistoryEntryAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RawAddress
   (
      This       : access IPhoneCallHistoryEntryAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RawAddress
   (
      This       : access IPhoneCallHistoryEntryAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RawAddressKind
   (
      This       : access IPhoneCallHistoryEntryAddress_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneCallHistoryEntryRawAddressKind
   )
   return Windows.HRESULT is abstract;
   
   function put_RawAddressKind
   (
      This       : access IPhoneCallHistoryEntryAddress_Interface
      ; value : Windows.ApplicationModel.Calls.PhoneCallHistoryEntryRawAddressKind
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallHistoryEntryAddress : aliased constant Windows.IID := (821123546, 14677, 16450, (132, 230, 102, 238, 191, 130, 230, 127 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallHistoryEntryAddressFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPhoneCallHistoryEntryAddressFactory_Interface
      ; rawAddress : Windows.String
      ; rawAddressKind : Windows.ApplicationModel.Calls.PhoneCallHistoryEntryRawAddressKind
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryAddress
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallHistoryEntryAddressFactory : aliased constant Windows.IID := (4212108730, 51184, 19382, (159, 107, 186, 93, 115, 32, 154, 202 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallHistoryEntryQueryOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredMedia
   (
      This       : access IPhoneCallHistoryEntryQueryOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.PhoneCallHistoryEntryQueryDesiredMedia
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredMedia
   (
      This       : access IPhoneCallHistoryEntryQueryOptions_Interface
      ; value : Windows.ApplicationModel.Calls.PhoneCallHistoryEntryQueryDesiredMedia
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceIds
   (
      This       : access IPhoneCallHistoryEntryQueryOptions_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallHistoryEntryQueryOptions : aliased constant Windows.IID := (2623529308, 35821, 16586, (176, 110, 196, 202, 142, 174, 92, 135 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallHistoryEntryReader_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchAsync
   (
      This       : access IPhoneCallHistoryEntryReader_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallHistoryEntryReader : aliased constant Windows.IID := (1642915006, 36230, 18335, (132, 4, 169, 132, 105, 32, 254, 230 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallHistoryStore_Interface is interface and Windows.IInspectable_Interface;
   
   function GetEntryAsync
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; callHistoryEntryId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryEntry -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetEntryReader
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryReader
   )
   return Windows.HRESULT is abstract;
   
   function GetEntryReaderWithOptions
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; queryOptions : Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryQueryOptions
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryReader
   )
   return Windows.HRESULT is abstract;
   
   function SaveEntryAsync
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; callHistoryEntry : Windows.ApplicationModel.Calls.IPhoneCallHistoryEntry
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteEntryAsync
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; callHistoryEntry : Windows.ApplicationModel.Calls.IPhoneCallHistoryEntry
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteEntriesAsync
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; callHistoryEntries : Windows.ApplicationModel.Calls.IIterable_IPhoneCallHistoryEntry
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MarkEntryAsSeenAsync
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; callHistoryEntry : Windows.ApplicationModel.Calls.IPhoneCallHistoryEntry
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MarkEntriesAsSeenAsync
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; callHistoryEntries : Windows.ApplicationModel.Calls.IIterable_IPhoneCallHistoryEntry
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetUnseenCountAsync
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function MarkAllAsSeenAsync
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetSourcesUnseenCountAsync
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; sourceIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function MarkSourcesAsSeenAsync
   (
      This       : access IPhoneCallHistoryStore_Interface
      ; sourceIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallHistoryStore : aliased constant Windows.IID := (797998520, 46094, 16939, (133, 69, 203, 25, 16, 166, 28, 82 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallHistoryManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStoreAsync
   (
      This       : access IPhoneCallHistoryManagerStatics_Interface
      ; accessType : Windows.ApplicationModel.Calls.PhoneCallHistoryStoreAccessType
      ; RetVal : access Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallHistoryManagerStatics : aliased constant Windows.IID := (4121352761, 45855, 20293, (172, 142, 27, 8, 137, 60, 27, 80 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallHistoryManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IPhoneCallHistoryManagerStatics2_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallHistoryManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallHistoryManagerStatics2 : aliased constant Windows.IID := (4023678192, 41691, 16776, (158, 146, 188, 60, 250, 104, 19, 207 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallHistoryManagerForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStoreAsync
   (
      This       : access IPhoneCallHistoryManagerForUser_Interface
      ; accessType : Windows.ApplicationModel.Calls.PhoneCallHistoryStoreAccessType
      ; RetVal : access Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IPhoneCallHistoryManagerForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallHistoryManagerForUser : aliased constant Windows.IID := (3643131171, 62815, 17235, (157, 180, 2, 5, 165, 38, 90, 85 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPhoneLine_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPhoneLine_Interface
      ; handler : Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_IPhoneLine
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPhoneLine_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_IPhoneLine
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPhoneLine_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneLine
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPhoneLine : aliased constant Windows.IID := (3631294256, 43624, 22036, (164, 8, 178, 1, 36, 99, 18, 11 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPhoneCallStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPhoneCallStore_Interface
      ; handler : Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_IPhoneCallStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPhoneCallStore_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_IPhoneCallStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPhoneCallStore_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallStore
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPhoneCallStore : aliased constant Windows.IID := (2266803496, 488, 21429, (161, 75, 48, 49, 109, 246, 89, 7 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPhoneCallVideoCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPhoneCallVideoCapabilities_Interface
      ; handler : Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPhoneCallVideoCapabilities_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPhoneCallVideoCapabilities_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallVideoCapabilities
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPhoneCallVideoCapabilities : aliased constant Windows.IID := (2068523018, 58130, 24326, (185, 83, 126, 72, 43, 103, 207, 207 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_VoipPhoneCallResourceReservationStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_VoipPhoneCallResourceReservationStatus_Interface
      ; handler : Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_VoipPhoneCallResourceReservationStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_VoipPhoneCallResourceReservationStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_VoipPhoneCallResourceReservationStatus : aliased constant Windows.IID := (2234039936, 31977, 22120, (142, 72, 70, 154, 229, 186, 158, 173 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPhoneCallHistoryEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPhoneCallHistoryEntry_Interface
      ; handler : Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_IPhoneCallHistoryEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_IPhoneCallHistoryEntry
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallHistoryEntry
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPhoneCallHistoryEntry : aliased constant Windows.IID := (2019458250, 37090, 23811, (143, 35, 179, 53, 141, 9, 201, 81 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPhoneCallHistoryEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallHistoryEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPhoneCallHistoryEntry_Interface
      ; items : Windows.ApplicationModel.Calls.IPhoneCallHistoryEntry_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPhoneCallHistoryEntry : aliased constant Windows.IID := (3251583088, 1610, 21717, (175, 171, 209, 220, 78, 226, 108, 203 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPhoneCallHistoryEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPhoneCallHistoryEntry_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IIterator_IPhoneCallHistoryEntry
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPhoneCallHistoryEntry : aliased constant Windows.IID := (2751020778, 51270, 21191, (170, 90, 51, 6, 112, 127, 99, 105 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPhoneCallHistoryStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPhoneCallHistoryStore_Interface
      ; handler : Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_IPhoneCallHistoryStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPhoneCallHistoryStore_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.AsyncOperationCompletedHandler_IPhoneCallHistoryStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPhoneCallHistoryStore_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.IPhoneCallHistoryStore
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPhoneCallHistoryStore : aliased constant Windows.IID := (228235184, 34710, 21183, (128, 218, 177, 67, 95, 230, 74, 38 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPhoneLine_add_LineChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IPhoneLine ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPhoneLine_add_LineChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLine_add_LineChanged_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLine
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPhoneLine_add_LineChanged : aliased constant Windows.IID := (2086621586, 40896, 21827, (155, 196, 65, 20, 130, 228, 234, 147 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPhoneLine_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneLine ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPhoneLine_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPhoneLine_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneLine
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPhoneLine : aliased constant Windows.IID := (2462997501, 5143, 21998, (176, 182, 41, 138, 231, 140, 177, 121 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPhoneLineWatcher_add_LineAdded_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher ; args : Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPhoneLineWatcher_add_LineAdded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLineWatcher_add_LineAdded_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher
      ; args : Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPhoneLineWatcher_add_LineAdded : aliased constant Windows.IID := (1920794406, 43143, 21345, (137, 36, 149, 247, 186, 180, 226, 93 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPhoneLineWatcher_add_LineRemoved_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher ; args : Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPhoneLineWatcher_add_LineRemoved_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLineWatcher_add_LineRemoved_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher
      ; args : Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPhoneLineWatcher_add_LineRemoved : aliased constant Windows.IID := (1920794406, 43143, 21345, (137, 36, 149, 247, 186, 180, 226, 93 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPhoneLineWatcher_add_LineUpdated_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher ; args : Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPhoneLineWatcher_add_LineUpdated_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLineWatcher_add_LineUpdated_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher
      ; args : Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPhoneLineWatcher_add_LineUpdated : aliased constant Windows.IID := (1920794406, 43143, 21345, (137, 36, 149, 247, 186, 180, 226, 93 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPhoneLineWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (3579635050, 9132, 20869, (191, 118, 40, 8, 236, 131, 199, 139 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPhoneLineWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPhoneLineWatcher_add_Stopped_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPhoneLineWatcher_add_Stopped_Interface
      ; sender : Windows.ApplicationModel.Calls.IPhoneLineWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPhoneLineWatcher_add_Stopped : aliased constant Windows.IID := (3579635050, 9132, 20869, (191, 118, 40, 8, 236, 131, 199, 139 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPhoneCallStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPhoneCallStore_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPhoneCallStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPhoneCallStore : aliased constant Windows.IID := (666254259, 53256, 22773, (133, 77, 221, 174, 101, 160, 32, 185 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallVideoCapabilities ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallVideoCapabilities
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPhoneCallVideoCapabilities : aliased constant Windows.IID := (3843016742, 16115, 22121, (170, 20, 235, 149, 144, 55, 147, 165 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IVoipPhoneCall_add_EndRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IVoipPhoneCall ; args : Windows.ApplicationModel.Calls.ICallStateChangeEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IVoipPhoneCall_add_EndRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoipPhoneCall_add_EndRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipPhoneCall
      ; args : Windows.ApplicationModel.Calls.ICallStateChangeEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IVoipPhoneCall_add_EndRequested : aliased constant Windows.IID := (503367372, 57676, 20942, (147, 243, 10, 10, 154, 63, 62, 236 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IVoipPhoneCall_add_HoldRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IVoipPhoneCall ; args : Windows.ApplicationModel.Calls.ICallStateChangeEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IVoipPhoneCall_add_HoldRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoipPhoneCall_add_HoldRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipPhoneCall
      ; args : Windows.ApplicationModel.Calls.ICallStateChangeEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IVoipPhoneCall_add_HoldRequested : aliased constant Windows.IID := (503367372, 57676, 20942, (147, 243, 10, 10, 154, 63, 62, 236 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IVoipPhoneCall_add_ResumeRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IVoipPhoneCall ; args : Windows.ApplicationModel.Calls.ICallStateChangeEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IVoipPhoneCall_add_ResumeRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoipPhoneCall_add_ResumeRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipPhoneCall
      ; args : Windows.ApplicationModel.Calls.ICallStateChangeEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IVoipPhoneCall_add_ResumeRequested : aliased constant Windows.IID := (503367372, 57676, 20942, (147, 243, 10, 10, 154, 63, 62, 236 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IVoipPhoneCall_add_AnswerRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IVoipPhoneCall ; args : Windows.ApplicationModel.Calls.ICallAnswerEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IVoipPhoneCall_add_AnswerRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoipPhoneCall_add_AnswerRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipPhoneCall
      ; args : Windows.ApplicationModel.Calls.ICallAnswerEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IVoipPhoneCall_add_AnswerRequested : aliased constant Windows.IID := (3564889306, 49164, 24490, (191, 165, 27, 17, 224, 195, 204, 193 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IVoipPhoneCall_add_RejectRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IVoipPhoneCall ; args : Windows.ApplicationModel.Calls.ICallRejectEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IVoipPhoneCall_add_RejectRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoipPhoneCall_add_RejectRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipPhoneCall
      ; args : Windows.ApplicationModel.Calls.ICallRejectEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IVoipPhoneCall_add_RejectRequested : aliased constant Windows.IID := (3496105422, 2407, 21569, (143, 230, 237, 46, 112, 8, 25, 126 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_VoipPhoneCallResourceReservationStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_VoipPhoneCallResourceReservationStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_VoipPhoneCallResourceReservationStatus : aliased constant Windows.IID := (2049421839, 25722, 21500, (128, 240, 167, 157, 8, 60, 229, 49 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.IVoipCallCoordinator ; args : Windows.ApplicationModel.Calls.IMuteChangeEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged_Interface
      ; sender : Windows.ApplicationModel.Calls.IVoipCallCoordinator
      ; args : Windows.ApplicationModel.Calls.IMuteChangeEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IVoipCallCoordinator_add_MuteStateChanged : aliased constant Windows.IID := (3970952311, 19446, 22455, (134, 198, 226, 254, 202, 91, 90, 238 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ILockScreenCallUI_add_EndRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.ILockScreenCallUI ; args : Windows.ApplicationModel.Calls.ILockScreenCallEndRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ILockScreenCallUI_add_EndRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenCallUI_add_EndRequested_Interface
      ; sender : Windows.ApplicationModel.Calls.ILockScreenCallUI
      ; args : Windows.ApplicationModel.Calls.ILockScreenCallEndRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ILockScreenCallUI_add_EndRequested : aliased constant Windows.IID := (2465711118, 59321, 24424, (152, 240, 86, 251, 137, 1, 88, 6 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ILockScreenCallUI_add_Closed_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Calls.ILockScreenCallUI ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ILockScreenCallUI_add_Closed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenCallUI_add_Closed_Interface
      ; sender : Windows.ApplicationModel.Calls.ILockScreenCallUI
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ILockScreenCallUI_add_Closed : aliased constant Windows.IID := (2916801066, 58791, 22817, (183, 224, 23, 50, 58, 223, 115, 130 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPhoneCallHistoryEntry_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryEntry ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPhoneCallHistoryEntry_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPhoneCallHistoryEntry_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryEntry
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPhoneCallHistoryEntry : aliased constant Windows.IID := (842277963, 44014, 22045, (178, 71, 121, 184, 50, 130, 32, 85 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPhoneCallHistoryStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPhoneCallHistoryStore_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPhoneCallHistoryStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPhoneCallHistoryStore : aliased constant Windows.IID := (577377163, 31210, 22227, (173, 194, 164, 13, 184, 216, 201, 176 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PhoneLine is Windows.ApplicationModel.Calls.IPhoneLine;
   subtype PhoneVoicemail is Windows.ApplicationModel.Calls.IPhoneVoicemail;
   subtype PhoneLineCellularDetails is Windows.ApplicationModel.Calls.IPhoneLineCellularDetails;
   subtype PhoneCallVideoCapabilities is Windows.ApplicationModel.Calls.IPhoneCallVideoCapabilities;
   subtype PhoneLineConfiguration is Windows.ApplicationModel.Calls.IPhoneLineConfiguration;
   subtype PhoneDialOptions is Windows.ApplicationModel.Calls.IPhoneDialOptions;
   
   function CreatePhoneDialOptions return Windows.ApplicationModel.Calls.IPhoneDialOptions;
   
   subtype PhoneLineWatcher is Windows.ApplicationModel.Calls.IPhoneLineWatcher;
   subtype PhoneLineWatcherEventArgs is Windows.ApplicationModel.Calls.IPhoneLineWatcherEventArgs;
   subtype PhoneCallStore is Windows.ApplicationModel.Calls.IPhoneCallStore;
   subtype CallStateChangeEventArgs is Windows.ApplicationModel.Calls.ICallStateChangeEventArgs;
   subtype CallAnswerEventArgs is Windows.ApplicationModel.Calls.ICallAnswerEventArgs;
   subtype CallRejectEventArgs is Windows.ApplicationModel.Calls.ICallRejectEventArgs;
   subtype VoipPhoneCall is Windows.ApplicationModel.Calls.IVoipPhoneCall;
   subtype MuteChangeEventArgs is Windows.ApplicationModel.Calls.IMuteChangeEventArgs;
   subtype VoipCallCoordinator is Windows.ApplicationModel.Calls.IVoipCallCoordinator;
   subtype LockScreenCallEndCallDeferral is Windows.ApplicationModel.Calls.ILockScreenCallEndCallDeferral;
   subtype LockScreenCallUI is Windows.ApplicationModel.Calls.ILockScreenCallUI;
   subtype LockScreenCallEndRequestedEventArgs is Windows.ApplicationModel.Calls.ILockScreenCallEndRequestedEventArgs;
   subtype PhoneCallHistoryEntryAddress is Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryAddress;
   
   function CreatePhoneCallHistoryEntryAddress return Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryAddress;
   
   subtype PhoneCallHistoryEntry is Windows.ApplicationModel.Calls.IPhoneCallHistoryEntry;
   
   function CreatePhoneCallHistoryEntry return Windows.ApplicationModel.Calls.IPhoneCallHistoryEntry;
   
   subtype PhoneCallHistoryEntryReader is Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryReader;
   subtype PhoneCallHistoryEntryQueryOptions is Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryQueryOptions;
   
   function CreatePhoneCallHistoryEntryQueryOptions return Windows.ApplicationModel.Calls.IPhoneCallHistoryEntryQueryOptions;
   
   subtype PhoneCallHistoryStore is Windows.ApplicationModel.Calls.IPhoneCallHistoryStore;
   subtype PhoneCallHistoryManagerForUser is Windows.ApplicationModel.Calls.IPhoneCallHistoryManagerForUser;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FromIdAsync
   (
      lineId : Windows.Guid
   )
   return Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneLine;
   
   function add_CallStateChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_CallStateChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_IsCallActive
   return Windows.Boolean;
   
   function get_IsCallIncoming
   return Windows.Boolean;
   
   procedure ShowPhoneCallSettingsUI
   ;
   
   function RequestStoreAsync
   return Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallStore;
   
   procedure ShowPhoneCallUI
   (
      phoneNumber : Windows.String
      ; displayName : Windows.String
   )
   ;
   
   function GetCapabilitiesAsync
   (
      phoneNumber : Windows.String
   )
   return Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallVideoCapabilities;
   
   function get_BlockUnknownNumbers
   return Windows.Boolean;
   
   procedure put_BlockUnknownNumbers
   (
      value : Windows.Boolean
   )
   ;
   
   function get_BlockPrivateNumbers
   return Windows.Boolean;
   
   procedure put_BlockPrivateNumbers
   (
      value : Windows.Boolean
   )
   ;
   
   function SetCallBlockingListAsync
   (
      phoneNumberList : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function GetDefault
   return Windows.ApplicationModel.Calls.IVoipCallCoordinator;
   
   function RequestStoreAsync
   (
      accessType : Windows.ApplicationModel.Calls.PhoneCallHistoryStoreAccessType
   )
   return Windows.ApplicationModel.Calls.IAsyncOperation_IPhoneCallHistoryStore;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Calls.IPhoneCallHistoryManagerForUser;

end;
