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
with Windows.Foundation.Collections;
limited with Windows.UI.ViewManagement;
with Windows.Foundation;
limited with Windows.UI.Popups;
limited with Windows.Storage.Streams;
limited with Windows.System;
limited with Windows.Data.Text;
limited with Windows.UI;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Contacts is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ContactSelectionMode is (
      Contacts,
      Fields
   );
   for ContactSelectionMode use (
      Contacts => 0,
      Fields => 1
   );
   for ContactSelectionMode'Size use 32;
   
   type ContactSelectionMode_Ptr is access ContactSelectionMode;
   
   type ContactChangeType is (
      Created,
      Modified,
      Deleted,
      ChangeTrackingLost
   );
   for ContactChangeType use (
      Created => 0,
      Modified => 1,
      Deleted => 2,
      ChangeTrackingLost => 3
   );
   for ContactChangeType'Size use 32;
   
   type ContactChangeType_Ptr is access ContactChangeType;
   
   type ContactQueryDesiredFields is (
      None,
      PhoneNumber,
      EmailAddress,
      PostalAddress
   );
   for ContactQueryDesiredFields use (
      None => 0,
      PhoneNumber => 1,
      EmailAddress => 2,
      PostalAddress => 4
   );
   for ContactQueryDesiredFields'Size use 32;
   
   type ContactQueryDesiredFields_Ptr is access ContactQueryDesiredFields;
   
   type ContactQuerySearchFields is (
      None,
      Name,
      Email,
      Phone,
      All_x
   );
   for ContactQuerySearchFields use (
      None => 0,
      Name => 1,
      Email => 2,
      Phone => 4,
      All_x => 4294967295
   );
   for ContactQuerySearchFields'Size use 32;
   
   type ContactQuerySearchFields_Ptr is access ContactQuerySearchFields;
   
   type ContactQuerySearchScope is (
      Local,
      Server
   );
   for ContactQuerySearchScope use (
      Local => 0,
      Server => 1
   );
   for ContactQuerySearchScope'Size use 32;
   
   type ContactQuerySearchScope_Ptr is access ContactQuerySearchScope;
   
   type ContactStoreAccessType is (
      AppContactsReadWrite,
      AllContactsReadOnly,
      AllContactsReadWrite
   );
   for ContactStoreAccessType use (
      AppContactsReadWrite => 0,
      AllContactsReadOnly => 1,
      AllContactsReadWrite => 2
   );
   for ContactStoreAccessType'Size use 32;
   
   type ContactStoreAccessType_Ptr is access ContactStoreAccessType;
   
   type ContactAnnotationStoreAccessType is (
      AppAnnotationsReadWrite,
      AllAnnotationsReadWrite
   );
   for ContactAnnotationStoreAccessType use (
      AppAnnotationsReadWrite => 0,
      AllAnnotationsReadWrite => 1
   );
   for ContactAnnotationStoreAccessType'Size use 32;
   
   type ContactAnnotationStoreAccessType_Ptr is access ContactAnnotationStoreAccessType;
   
   type ContactListOtherAppReadAccess is (
      SystemOnly,
      Limited_x,
      Full,
      None
   );
   for ContactListOtherAppReadAccess use (
      SystemOnly => 0,
      Limited_x => 1,
      Full => 2,
      None => 3
   );
   for ContactListOtherAppReadAccess'Size use 32;
   
   type ContactListOtherAppReadAccess_Ptr is access ContactListOtherAppReadAccess;
   
   type ContactListOtherAppWriteAccess is (
      None,
      SystemOnly,
      Limited_x
   );
   for ContactListOtherAppWriteAccess use (
      None => 0,
      SystemOnly => 1,
      Limited_x => 2
   );
   for ContactListOtherAppWriteAccess'Size use 32;
   
   type ContactListOtherAppWriteAccess_Ptr is access ContactListOtherAppWriteAccess;
   
   type ContactMatchReasonKind is (
      Name,
      EmailAddress,
      PhoneNumber,
      JobInfo,
      YomiName,
      Other
   );
   for ContactMatchReasonKind use (
      Name => 0,
      EmailAddress => 1,
      PhoneNumber => 2,
      JobInfo => 3,
      YomiName => 4,
      Other => 5
   );
   for ContactMatchReasonKind'Size use 32;
   
   type ContactMatchReasonKind_Ptr is access ContactMatchReasonKind;
   
   type ContactBatchStatus is (
      Success,
      ServerSearchSyncManagerError,
      ServerSearchUnknownError
   );
   for ContactBatchStatus use (
      Success => 0,
      ServerSearchSyncManagerError => 1,
      ServerSearchUnknownError => 2
   );
   for ContactBatchStatus'Size use 32;
   
   type ContactBatchStatus_Ptr is access ContactBatchStatus;
   
   type ContactAnnotationOperations is (
      None,
      ContactProfile,
      Message,
      AudioCall,
      VideoCall,
      SocialFeeds,
      Share
   );
   for ContactAnnotationOperations use (
      None => 0,
      ContactProfile => 1,
      Message => 2,
      AudioCall => 4,
      VideoCall => 8,
      SocialFeeds => 16,
      Share => 32
   );
   for ContactAnnotationOperations'Size use 32;
   
   type ContactAnnotationOperations_Ptr is access ContactAnnotationOperations;
   
   type ContactNameOrder is (
      FirstNameLastName,
      LastNameFirstName
   );
   for ContactNameOrder use (
      FirstNameLastName => 0,
      LastNameFirstName => 1
   );
   for ContactNameOrder'Size use 32;
   
   type ContactNameOrder_Ptr is access ContactNameOrder;
   
   type ContactListSyncStatus is (
      Idle,
      Syncing,
      UpToDate,
      AuthenticationError,
      PolicyError,
      UnknownError,
      ManualAccountRemovalRequired
   );
   for ContactListSyncStatus use (
      Idle => 0,
      Syncing => 1,
      UpToDate => 2,
      AuthenticationError => 3,
      PolicyError => 4,
      UnknownError => 5,
      ManualAccountRemovalRequired => 6
   );
   for ContactListSyncStatus'Size use 32;
   
   type ContactListSyncStatus_Ptr is access ContactListSyncStatus;
   
   type ContactCardHeaderKind is (
      Default,
      Basic,
      Enterprise
   );
   for ContactCardHeaderKind use (
      Default => 0,
      Basic => 1,
      Enterprise => 2
   );
   for ContactCardHeaderKind'Size use 32;
   
   type ContactCardHeaderKind_Ptr is access ContactCardHeaderKind;
   
   type ContactCardTabKind is (
      Default,
      Email,
      Messaging,
      Phone,
      Video,
      OrganizationalHierarchy
   );
   for ContactCardTabKind use (
      Default => 0,
      Email => 1,
      Messaging => 2,
      Phone => 3,
      Video => 4,
      OrganizationalHierarchy => 5
   );
   for ContactCardTabKind'Size use 32;
   
   type ContactCardTabKind_Ptr is access ContactCardTabKind;
   
   type ContactFieldType is (
      Email,
      PhoneNumber,
      ConnectedServiceAccount,
      ImportantDate,
      Address,
      SignificantOther,
      Notes,
      Website,
      JobInfo
   );
   for ContactFieldType use (
      Email => 0,
      PhoneNumber => 1,
      ConnectedServiceAccount => 5,
      ImportantDate => 6,
      Address => 7,
      SignificantOther => 8,
      Notes => 9,
      Website => 10,
      JobInfo => 11
   );
   for ContactFieldType'Size use 32;
   
   type ContactFieldType_Ptr is access ContactFieldType;
   
   type ContactEmailKind is (
      Personal,
      Work,
      Other
   );
   for ContactEmailKind use (
      Personal => 0,
      Work => 1,
      Other => 2
   );
   for ContactEmailKind'Size use 32;
   
   type ContactEmailKind_Ptr is access ContactEmailKind;
   
   type ContactPhoneKind is (
      Home,
      Mobile,
      Work,
      Other,
      Pager,
      BusinessFax,
      HomeFax,
      Company,
      Assistant,
      Radio
   );
   for ContactPhoneKind use (
      Home => 0,
      Mobile => 1,
      Work => 2,
      Other => 3,
      Pager => 4,
      BusinessFax => 5,
      HomeFax => 6,
      Company => 7,
      Assistant => 8,
      Radio => 9
   );
   for ContactPhoneKind'Size use 32;
   
   type ContactPhoneKind_Ptr is access ContactPhoneKind;
   
   type ContactAddressKind is (
      Home,
      Work,
      Other
   );
   for ContactAddressKind use (
      Home => 0,
      Work => 1,
      Other => 2
   );
   for ContactAddressKind'Size use 32;
   
   type ContactAddressKind_Ptr is access ContactAddressKind;
   
   type ContactDateKind is (
      Birthday,
      Anniversary,
      Other
   );
   for ContactDateKind use (
      Birthday => 0,
      Anniversary => 1,
      Other => 2
   );
   for ContactDateKind'Size use 32;
   
   type ContactDateKind_Ptr is access ContactDateKind;
   
   type ContactRelationship is (
      Other,
      Spouse,
      Partner,
      Sibling,
      Parent,
      Child
   );
   for ContactRelationship use (
      Other => 0,
      Spouse => 1,
      Partner => 2,
      Sibling => 3,
      Parent => 4,
      Child => 5
   );
   for ContactRelationship'Size use 32;
   
   type ContactRelationship_Ptr is access ContactRelationship;
   
   type ContactFieldCategory is (
      None,
      Home,
      Work,
      Mobile,
      Other
   );
   for ContactFieldCategory use (
      None => 0,
      Home => 1,
      Work => 2,
      Mobile => 3,
      Other => 4
   );
   for ContactFieldCategory'Size use 32;
   
   type ContactFieldCategory_Ptr is access ContactFieldCategory;
   
   type PinnedContactSurface is (
      StartMenu,
      Taskbar
   );
   for PinnedContactSurface use (
      StartMenu => 0,
      Taskbar => 1
   );
   for PinnedContactSurface'Size use 32;
   
   type PinnedContactSurface_Ptr is access PinnedContactSurface;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IContactStore_Interface;
   type AsyncOperationCompletedHandler_IContactStore is access all AsyncOperationCompletedHandler_IContactStore_Interface'Class;
   type AsyncOperationCompletedHandler_IContactStore_Ptr is access all AsyncOperationCompletedHandler_IContactStore;
   type AsyncOperationCompletedHandler_IContact_Interface;
   type AsyncOperationCompletedHandler_IContact is access all AsyncOperationCompletedHandler_IContact_Interface'Class;
   type AsyncOperationCompletedHandler_IContact_Ptr is access all AsyncOperationCompletedHandler_IContact;
   type AsyncOperationCompletedHandler_IContactAnnotationStore_Interface;
   type AsyncOperationCompletedHandler_IContactAnnotationStore is access all AsyncOperationCompletedHandler_IContactAnnotationStore_Interface'Class;
   type AsyncOperationCompletedHandler_IContactAnnotationStore_Ptr is access all AsyncOperationCompletedHandler_IContactAnnotationStore;
   type AsyncOperationCompletedHandler_IContactAnnotationList_Interface;
   type AsyncOperationCompletedHandler_IContactAnnotationList is access all AsyncOperationCompletedHandler_IContactAnnotationList_Interface'Class;
   type AsyncOperationCompletedHandler_IContactAnnotationList_Ptr is access all AsyncOperationCompletedHandler_IContactAnnotationList;
   type AsyncOperationCompletedHandler_IContactAnnotation_Interface;
   type AsyncOperationCompletedHandler_IContactAnnotation is access all AsyncOperationCompletedHandler_IContactAnnotation_Interface'Class;
   type AsyncOperationCompletedHandler_IContactAnnotation_Ptr is access all AsyncOperationCompletedHandler_IContactAnnotation;
   type TypedEventHandler_IContactStore2_add_ContactChanged_Interface;
   type TypedEventHandler_IContactStore2_add_ContactChanged is access all TypedEventHandler_IContactStore2_add_ContactChanged_Interface'Class;
   type TypedEventHandler_IContactStore2_add_ContactChanged_Ptr is access all TypedEventHandler_IContactStore2_add_ContactChanged;
   type AsyncOperationCompletedHandler_IContactList_Interface;
   type AsyncOperationCompletedHandler_IContactList is access all AsyncOperationCompletedHandler_IContactList_Interface'Class;
   type AsyncOperationCompletedHandler_IContactList_Ptr is access all AsyncOperationCompletedHandler_IContactList;
   type TypedEventHandler_IContactList_add_ContactChanged_Interface;
   type TypedEventHandler_IContactList_add_ContactChanged is access all TypedEventHandler_IContactList_add_ContactChanged_Interface'Class;
   type TypedEventHandler_IContactList_add_ContactChanged_Ptr is access all TypedEventHandler_IContactList_add_ContactChanged;
   type TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged_Interface;
   type TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged is access all TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged_Interface'Class;
   type TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged_Ptr is access all TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged;
   type AsyncOperationCompletedHandler_IContactBatch_Interface;
   type AsyncOperationCompletedHandler_IContactBatch is access all AsyncOperationCompletedHandler_IContactBatch_Interface'Class;
   type AsyncOperationCompletedHandler_IContactBatch_Ptr is access all AsyncOperationCompletedHandler_IContactBatch;
   type AsyncOperationCompletedHandler_IContactInformation_Interface;
   type AsyncOperationCompletedHandler_IContactInformation is access all AsyncOperationCompletedHandler_IContactInformation_Interface'Class;
   type AsyncOperationCompletedHandler_IContactInformation_Ptr is access all AsyncOperationCompletedHandler_IContactInformation;
   type AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult_Interface;
   type AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult is access all AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult_Interface'Class;
   type AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult_Ptr is access all AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult;
   type TypedEventHandler_IContactPanel_add_LaunchFullAppRequested_Interface;
   type TypedEventHandler_IContactPanel_add_LaunchFullAppRequested is access all TypedEventHandler_IContactPanel_add_LaunchFullAppRequested_Interface'Class;
   type TypedEventHandler_IContactPanel_add_LaunchFullAppRequested_Ptr is access all TypedEventHandler_IContactPanel_add_LaunchFullAppRequested;
   type TypedEventHandler_IContactPanel_add_Closing_Interface;
   type TypedEventHandler_IContactPanel_add_Closing is access all TypedEventHandler_IContactPanel_add_Closing_Interface'Class;
   type TypedEventHandler_IContactPanel_add_Closing_Ptr is access all TypedEventHandler_IContactPanel_add_Closing;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IContactCardOptions_Interface;
   type IContactCardOptions is access all IContactCardOptions_Interface'Class;
   type IContactCardOptions_Ptr is access all IContactCardOptions;
   type IContactCardOptions2_Interface;
   type IContactCardOptions2 is access all IContactCardOptions2_Interface'Class;
   type IContactCardOptions2_Ptr is access all IContactCardOptions2;
   type IFullContactCardOptions_Interface;
   type IFullContactCardOptions is access all IFullContactCardOptions_Interface'Class;
   type IFullContactCardOptions_Ptr is access all IFullContactCardOptions;
   type IContactCardDelayedDataLoader_Interface;
   type IContactCardDelayedDataLoader is access all IContactCardDelayedDataLoader_Interface'Class;
   type IContactCardDelayedDataLoader_Ptr is access all IContactCardDelayedDataLoader;
   type IContactManagerStatics_Interface;
   type IContactManagerStatics is access all IContactManagerStatics_Interface'Class;
   type IContactManagerStatics_Ptr is access all IContactManagerStatics;
   type IContactManagerStatics2_Interface;
   type IContactManagerStatics2 is access all IContactManagerStatics2_Interface'Class;
   type IContactManagerStatics2_Ptr is access all IContactManagerStatics2;
   type IContactManagerStatics3_Interface;
   type IContactManagerStatics3 is access all IContactManagerStatics3_Interface'Class;
   type IContactManagerStatics3_Ptr is access all IContactManagerStatics3;
   type IContactManagerStatics4_Interface;
   type IContactManagerStatics4 is access all IContactManagerStatics4_Interface'Class;
   type IContactManagerStatics4_Ptr is access all IContactManagerStatics4;
   type IContactManagerStatics5_Interface;
   type IContactManagerStatics5 is access all IContactManagerStatics5_Interface'Class;
   type IContactManagerStatics5_Ptr is access all IContactManagerStatics5;
   type IContactManagerForUser_Interface;
   type IContactManagerForUser is access all IContactManagerForUser_Interface'Class;
   type IContactManagerForUser_Ptr is access all IContactManagerForUser;
   type IContactManagerForUser2_Interface;
   type IContactManagerForUser2 is access all IContactManagerForUser2_Interface'Class;
   type IContactManagerForUser2_Ptr is access all IContactManagerForUser2;
   type IAggregateContactManager_Interface;
   type IAggregateContactManager is access all IAggregateContactManager_Interface'Class;
   type IAggregateContactManager_Ptr is access all IAggregateContactManager;
   type IAggregateContactManager2_Interface;
   type IAggregateContactManager2 is access all IAggregateContactManager2_Interface'Class;
   type IAggregateContactManager2_Ptr is access all IAggregateContactManager2;
   type IContactAnnotationStore_Interface;
   type IContactAnnotationStore is access all IContactAnnotationStore_Interface'Class;
   type IContactAnnotationStore_Ptr is access all IContactAnnotationStore;
   type IContactAnnotationStore2_Interface;
   type IContactAnnotationStore2 is access all IContactAnnotationStore2_Interface'Class;
   type IContactAnnotationStore2_Ptr is access all IContactAnnotationStore2;
   type IContactAnnotationList_Interface;
   type IContactAnnotationList is access all IContactAnnotationList_Interface'Class;
   type IContactAnnotationList_Ptr is access all IContactAnnotationList;
   type IContactAnnotation_Interface;
   type IContactAnnotation is access all IContactAnnotation_Interface'Class;
   type IContactAnnotation_Ptr is access all IContactAnnotation;
   type IContactAnnotation2_Interface;
   type IContactAnnotation2 is access all IContactAnnotation2_Interface'Class;
   type IContactAnnotation2_Ptr is access all IContactAnnotation2;
   type IContactStoreNotificationTriggerDetails_Interface;
   type IContactStoreNotificationTriggerDetails is access all IContactStoreNotificationTriggerDetails_Interface'Class;
   type IContactStoreNotificationTriggerDetails_Ptr is access all IContactStoreNotificationTriggerDetails;
   type IContactStore_Interface;
   type IContactStore is access all IContactStore_Interface'Class;
   type IContactStore_Ptr is access all IContactStore;
   type IContactStore2_Interface;
   type IContactStore2 is access all IContactStore2_Interface'Class;
   type IContactStore2_Ptr is access all IContactStore2;
   type IContactStore3_Interface;
   type IContactStore3 is access all IContactStore3_Interface'Class;
   type IContactStore3_Ptr is access all IContactStore3;
   type IContactList_Interface;
   type IContactList is access all IContactList_Interface'Class;
   type IContactList_Ptr is access all IContactList;
   type IContactList2_Interface;
   type IContactList2 is access all IContactList2_Interface'Class;
   type IContactList2_Ptr is access all IContactList2;
   type IContactList3_Interface;
   type IContactList3 is access all IContactList3_Interface'Class;
   type IContactList3_Ptr is access all IContactList3;
   type IContactListLimitedWriteOperations_Interface;
   type IContactListLimitedWriteOperations is access all IContactListLimitedWriteOperations_Interface'Class;
   type IContactListLimitedWriteOperations_Ptr is access all IContactListLimitedWriteOperations;
   type IContactListSyncManager_Interface;
   type IContactListSyncManager is access all IContactListSyncManager_Interface'Class;
   type IContactListSyncManager_Ptr is access all IContactListSyncManager;
   type IContactListSyncManager2_Interface;
   type IContactListSyncManager2 is access all IContactListSyncManager2_Interface'Class;
   type IContactListSyncManager2_Ptr is access all IContactListSyncManager2;
   type IContactListSyncConstraints_Interface;
   type IContactListSyncConstraints is access all IContactListSyncConstraints_Interface'Class;
   type IContactListSyncConstraints_Ptr is access all IContactListSyncConstraints;
   type IContactChange_Interface;
   type IContactChange is access all IContactChange_Interface'Class;
   type IContactChange_Ptr is access all IContactChange;
   type IContactChangedDeferral_Interface;
   type IContactChangedDeferral is access all IContactChangedDeferral_Interface'Class;
   type IContactChangedDeferral_Ptr is access all IContactChangedDeferral;
   type IContactChangedEventArgs_Interface;
   type IContactChangedEventArgs is access all IContactChangedEventArgs_Interface'Class;
   type IContactChangedEventArgs_Ptr is access all IContactChangedEventArgs;
   type IContactChangeReader_Interface;
   type IContactChangeReader is access all IContactChangeReader_Interface'Class;
   type IContactChangeReader_Ptr is access all IContactChangeReader;
   type IContactChangeTracker_Interface;
   type IContactChangeTracker is access all IContactChangeTracker_Interface'Class;
   type IContactChangeTracker_Ptr is access all IContactChangeTracker;
   type IContactChangeTracker2_Interface;
   type IContactChangeTracker2 is access all IContactChangeTracker2_Interface'Class;
   type IContactChangeTracker2_Ptr is access all IContactChangeTracker2;
   type IContactReader_Interface;
   type IContactReader is access all IContactReader_Interface'Class;
   type IContactReader_Ptr is access all IContactReader;
   type IContactQueryTextSearch_Interface;
   type IContactQueryTextSearch is access all IContactQueryTextSearch_Interface'Class;
   type IContactQueryTextSearch_Ptr is access all IContactQueryTextSearch;
   type IContactQueryOptionsFactory_Interface;
   type IContactQueryOptionsFactory is access all IContactQueryOptionsFactory_Interface'Class;
   type IContactQueryOptionsFactory_Ptr is access all IContactQueryOptionsFactory;
   type IContactQueryOptions_Interface;
   type IContactQueryOptions is access all IContactQueryOptions_Interface'Class;
   type IContactQueryOptions_Ptr is access all IContactQueryOptions;
   type IContactBatch_Interface;
   type IContactBatch is access all IContactBatch_Interface'Class;
   type IContactBatch_Ptr is access all IContactBatch;
   type IContactMatchReason_Interface;
   type IContactMatchReason is access all IContactMatchReason_Interface'Class;
   type IContactMatchReason_Ptr is access all IContactMatchReason;
   type IContactLaunchActionVerbsStatics_Interface;
   type IContactLaunchActionVerbsStatics is access all IContactLaunchActionVerbsStatics_Interface'Class;
   type IContactLaunchActionVerbsStatics_Ptr is access all IContactLaunchActionVerbsStatics;
   type IContactGroup_Interface;
   type IContactGroup is access all IContactGroup_Interface'Class;
   type IContactGroup_Ptr is access all IContactGroup;
   type IContactPicker_Interface;
   type IContactPicker is access all IContactPicker_Interface'Class;
   type IContactPicker_Ptr is access all IContactPicker;
   type IContactPicker2_Interface;
   type IContactPicker2 is access all IContactPicker2_Interface'Class;
   type IContactPicker2_Ptr is access all IContactPicker2;
   type IContactPicker3_Interface;
   type IContactPicker3 is access all IContactPicker3_Interface'Class;
   type IContactPicker3_Ptr is access all IContactPicker3;
   type IContactPickerStatics_Interface;
   type IContactPickerStatics is access all IContactPickerStatics_Interface'Class;
   type IContactPickerStatics_Ptr is access all IContactPickerStatics;
   type IContactConnectedServiceAccount_Interface;
   type IContactConnectedServiceAccount is access all IContactConnectedServiceAccount_Interface'Class;
   type IContactConnectedServiceAccount_Ptr is access all IContactConnectedServiceAccount;
   type IContactSignificantOther_Interface;
   type IContactSignificantOther is access all IContactSignificantOther_Interface'Class;
   type IContactSignificantOther_Ptr is access all IContactSignificantOther;
   type IContactSignificantOther2_Interface;
   type IContactSignificantOther2 is access all IContactSignificantOther2_Interface'Class;
   type IContactSignificantOther2_Ptr is access all IContactSignificantOther2;
   type IContactWebsite_Interface;
   type IContactWebsite is access all IContactWebsite_Interface'Class;
   type IContactWebsite_Ptr is access all IContactWebsite;
   type IContactWebsite2_Interface;
   type IContactWebsite2 is access all IContactWebsite2_Interface'Class;
   type IContactWebsite2_Ptr is access all IContactWebsite2;
   type IContactEmail_Interface;
   type IContactEmail is access all IContactEmail_Interface'Class;
   type IContactEmail_Ptr is access all IContactEmail;
   type IContactPhone_Interface;
   type IContactPhone is access all IContactPhone_Interface'Class;
   type IContactPhone_Ptr is access all IContactPhone;
   type IContactAddress_Interface;
   type IContactAddress is access all IContactAddress_Interface'Class;
   type IContactAddress_Ptr is access all IContactAddress;
   type IContactDate_Interface;
   type IContactDate is access all IContactDate_Interface'Class;
   type IContactDate_Ptr is access all IContactDate;
   type IContactJobInfo_Interface;
   type IContactJobInfo is access all IContactJobInfo_Interface'Class;
   type IContactJobInfo_Ptr is access all IContactJobInfo;
   type IContact_Interface;
   type IContact is access all IContact_Interface'Class;
   type IContact_Ptr is access all IContact;
   type IContactField_Interface;
   type IContactField is access all IContactField_Interface'Class;
   type IContactField_Ptr is access all IContactField;
   type IContactName_Interface;
   type IContactName is access all IContactName_Interface'Class;
   type IContactName_Ptr is access all IContactName;
   type IContact2_Interface;
   type IContact2 is access all IContact2_Interface'Class;
   type IContact2_Ptr is access all IContact2;
   type IContact3_Interface;
   type IContact3 is access all IContact3_Interface'Class;
   type IContact3_Ptr is access all IContact3;
   type IContactLocationField_Interface;
   type IContactLocationField is access all IContactLocationField_Interface'Class;
   type IContactLocationField_Ptr is access all IContactLocationField;
   type IContactInstantMessageField_Interface;
   type IContactInstantMessageField is access all IContactInstantMessageField_Interface'Class;
   type IContactInstantMessageField_Ptr is access all IContactInstantMessageField;
   type IKnownContactFieldStatics_Interface;
   type IKnownContactFieldStatics is access all IKnownContactFieldStatics_Interface'Class;
   type IKnownContactFieldStatics_Ptr is access all IKnownContactFieldStatics;
   type IContactInformation_Interface;
   type IContactInformation is access all IContactInformation_Interface'Class;
   type IContactInformation_Ptr is access all IContactInformation;
   type IContactFieldFactory_Interface;
   type IContactFieldFactory is access all IContactFieldFactory_Interface'Class;
   type IContactFieldFactory_Ptr is access all IContactFieldFactory;
   type IContactLocationFieldFactory_Interface;
   type IContactLocationFieldFactory is access all IContactLocationFieldFactory_Interface'Class;
   type IContactLocationFieldFactory_Ptr is access all IContactLocationFieldFactory;
   type IContactInstantMessageFieldFactory_Interface;
   type IContactInstantMessageFieldFactory is access all IContactInstantMessageFieldFactory_Interface'Class;
   type IContactInstantMessageFieldFactory_Ptr is access all IContactInstantMessageFieldFactory;
   type IPinnedContactIdsQueryResult_Interface;
   type IPinnedContactIdsQueryResult is access all IPinnedContactIdsQueryResult_Interface'Class;
   type IPinnedContactIdsQueryResult_Ptr is access all IPinnedContactIdsQueryResult;
   type IPinnedContactManagerStatics_Interface;
   type IPinnedContactManagerStatics is access all IPinnedContactManagerStatics_Interface'Class;
   type IPinnedContactManagerStatics_Ptr is access all IPinnedContactManagerStatics;
   type IPinnedContactManager_Interface;
   type IPinnedContactManager is access all IPinnedContactManager_Interface'Class;
   type IPinnedContactManager_Ptr is access all IPinnedContactManager;
   type IContactPanelLaunchFullAppRequestedEventArgs_Interface;
   type IContactPanelLaunchFullAppRequestedEventArgs is access all IContactPanelLaunchFullAppRequestedEventArgs_Interface'Class;
   type IContactPanelLaunchFullAppRequestedEventArgs_Ptr is access all IContactPanelLaunchFullAppRequestedEventArgs;
   type IContactPanelClosingEventArgs_Interface;
   type IContactPanelClosingEventArgs is access all IContactPanelClosingEventArgs_Interface'Class;
   type IContactPanelClosingEventArgs_Ptr is access all IContactPanelClosingEventArgs;
   type IContactPanel_Interface;
   type IContactPanel is access all IContactPanel_Interface'Class;
   type IContactPanel_Ptr is access all IContactPanel;
   type IAsyncOperation_IContactStore_Interface;
   type IAsyncOperation_IContactStore is access all IAsyncOperation_IContactStore_Interface'Class;
   type IAsyncOperation_IContactStore_Ptr is access all IAsyncOperation_IContactStore;
   type IAsyncOperation_IContact_Interface;
   type IAsyncOperation_IContact is access all IAsyncOperation_IContact_Interface'Class;
   type IAsyncOperation_IContact_Ptr is access all IAsyncOperation_IContact;
   type IAsyncOperation_IContactAnnotationStore_Interface;
   type IAsyncOperation_IContactAnnotationStore is access all IAsyncOperation_IContactAnnotationStore_Interface'Class;
   type IAsyncOperation_IContactAnnotationStore_Ptr is access all IAsyncOperation_IContactAnnotationStore;
   type IAsyncOperation_IContactAnnotationList_Interface;
   type IAsyncOperation_IContactAnnotationList is access all IAsyncOperation_IContactAnnotationList_Interface'Class;
   type IAsyncOperation_IContactAnnotationList_Ptr is access all IAsyncOperation_IContactAnnotationList;
   type IAsyncOperation_IContactAnnotation_Interface;
   type IAsyncOperation_IContactAnnotation is access all IAsyncOperation_IContactAnnotation_Interface'Class;
   type IAsyncOperation_IContactAnnotation_Ptr is access all IAsyncOperation_IContactAnnotation;
   type IAsyncOperation_IContactList_Interface;
   type IAsyncOperation_IContactList is access all IAsyncOperation_IContactList_Interface'Class;
   type IAsyncOperation_IContactList_Ptr is access all IAsyncOperation_IContactList;
   type IAsyncOperation_IContactBatch_Interface;
   type IAsyncOperation_IContactBatch is access all IAsyncOperation_IContactBatch_Interface'Class;
   type IAsyncOperation_IContactBatch_Ptr is access all IAsyncOperation_IContactBatch;
   type IIterator_IContactMatchReason_Interface;
   type IIterator_IContactMatchReason is access all IIterator_IContactMatchReason_Interface'Class;
   type IIterator_IContactMatchReason_Ptr is access all IIterator_IContactMatchReason;
   type IIterable_IContactMatchReason_Interface;
   type IIterable_IContactMatchReason is access all IIterable_IContactMatchReason_Interface'Class;
   type IIterable_IContactMatchReason_Ptr is access all IIterable_IContactMatchReason;
   type IVectorView_IContactMatchReason_Interface;
   type IVectorView_IContactMatchReason is access all IVectorView_IContactMatchReason_Interface'Class;
   type IVectorView_IContactMatchReason_Ptr is access all IVectorView_IContactMatchReason;
   type IIterator_IContact_Interface;
   type IIterator_IContact is access all IIterator_IContact_Interface'Class;
   type IIterator_IContact_Ptr is access all IIterator_IContact;
   type IIterable_IContact_Interface;
   type IIterable_IContact is access all IIterable_IContact_Interface'Class;
   type IIterable_IContact_Ptr is access all IIterable_IContact;
   type IVectorView_IContact_Interface;
   type IVectorView_IContact is access all IVectorView_IContact_Interface'Class;
   type IVectorView_IContact_Ptr is access all IVectorView_IContact;
   type IAsyncOperation_IContactInformation_Interface;
   type IAsyncOperation_IContactInformation is access all IAsyncOperation_IContactInformation_Interface'Class;
   type IAsyncOperation_IContactInformation_Ptr is access all IAsyncOperation_IContactInformation;
   type IIterator_ContactFieldType_Interface;
   type IIterator_ContactFieldType is access all IIterator_ContactFieldType_Interface'Class;
   type IIterator_ContactFieldType_Ptr is access all IIterator_ContactFieldType;
   type IIterable_ContactFieldType_Interface;
   type IIterable_ContactFieldType is access all IIterable_ContactFieldType_Interface'Class;
   type IIterable_ContactFieldType_Ptr is access all IIterable_ContactFieldType;
   type IVectorView_ContactFieldType_Interface;
   type IVectorView_ContactFieldType is access all IVectorView_ContactFieldType_Interface'Class;
   type IVectorView_ContactFieldType_Ptr is access all IVectorView_ContactFieldType;
   type IVector_ContactFieldType_Interface;
   type IVector_ContactFieldType is access all IVector_ContactFieldType_Interface'Class;
   type IVector_ContactFieldType_Ptr is access all IVector_ContactFieldType;
   type IIterator_IContactField_Interface;
   type IIterator_IContactField is access all IIterator_IContactField_Interface'Class;
   type IIterator_IContactField_Ptr is access all IIterator_IContactField;
   type IIterable_IContactField_Interface;
   type IIterable_IContactField is access all IIterable_IContactField_Interface'Class;
   type IIterable_IContactField_Ptr is access all IIterable_IContactField;
   type IVectorView_IContactField_Interface;
   type IVectorView_IContactField is access all IVectorView_IContactField_Interface'Class;
   type IVectorView_IContactField_Ptr is access all IVectorView_IContactField;
   type IVector_IContactField_Interface;
   type IVector_IContactField is access all IVector_IContactField_Interface'Class;
   type IVector_IContactField_Ptr is access all IVector_IContactField;
   type IIterator_IContactPhone_Interface;
   type IIterator_IContactPhone is access all IIterator_IContactPhone_Interface'Class;
   type IIterator_IContactPhone_Ptr is access all IIterator_IContactPhone;
   type IIterable_IContactPhone_Interface;
   type IIterable_IContactPhone is access all IIterable_IContactPhone_Interface'Class;
   type IIterable_IContactPhone_Ptr is access all IIterable_IContactPhone;
   type IVectorView_IContactPhone_Interface;
   type IVectorView_IContactPhone is access all IVectorView_IContactPhone_Interface'Class;
   type IVectorView_IContactPhone_Ptr is access all IVectorView_IContactPhone;
   type IVector_IContactPhone_Interface;
   type IVector_IContactPhone is access all IVector_IContactPhone_Interface'Class;
   type IVector_IContactPhone_Ptr is access all IVector_IContactPhone;
   type IIterator_IContactEmail_Interface;
   type IIterator_IContactEmail is access all IIterator_IContactEmail_Interface'Class;
   type IIterator_IContactEmail_Ptr is access all IIterator_IContactEmail;
   type IIterable_IContactEmail_Interface;
   type IIterable_IContactEmail is access all IIterable_IContactEmail_Interface'Class;
   type IIterable_IContactEmail_Ptr is access all IIterable_IContactEmail;
   type IVectorView_IContactEmail_Interface;
   type IVectorView_IContactEmail is access all IVectorView_IContactEmail_Interface'Class;
   type IVectorView_IContactEmail_Ptr is access all IVectorView_IContactEmail;
   type IVector_IContactEmail_Interface;
   type IVector_IContactEmail is access all IVector_IContactEmail_Interface'Class;
   type IVector_IContactEmail_Ptr is access all IVector_IContactEmail;
   type IIterator_IContactAddress_Interface;
   type IIterator_IContactAddress is access all IIterator_IContactAddress_Interface'Class;
   type IIterator_IContactAddress_Ptr is access all IIterator_IContactAddress;
   type IIterable_IContactAddress_Interface;
   type IIterable_IContactAddress is access all IIterable_IContactAddress_Interface'Class;
   type IIterable_IContactAddress_Ptr is access all IIterable_IContactAddress;
   type IVectorView_IContactAddress_Interface;
   type IVectorView_IContactAddress is access all IVectorView_IContactAddress_Interface'Class;
   type IVectorView_IContactAddress_Ptr is access all IVectorView_IContactAddress;
   type IVector_IContactAddress_Interface;
   type IVector_IContactAddress is access all IVector_IContactAddress_Interface'Class;
   type IVector_IContactAddress_Ptr is access all IVector_IContactAddress;
   type IIterator_IContactConnectedServiceAccount_Interface;
   type IIterator_IContactConnectedServiceAccount is access all IIterator_IContactConnectedServiceAccount_Interface'Class;
   type IIterator_IContactConnectedServiceAccount_Ptr is access all IIterator_IContactConnectedServiceAccount;
   type IIterable_IContactConnectedServiceAccount_Interface;
   type IIterable_IContactConnectedServiceAccount is access all IIterable_IContactConnectedServiceAccount_Interface'Class;
   type IIterable_IContactConnectedServiceAccount_Ptr is access all IIterable_IContactConnectedServiceAccount;
   type IVectorView_IContactConnectedServiceAccount_Interface;
   type IVectorView_IContactConnectedServiceAccount is access all IVectorView_IContactConnectedServiceAccount_Interface'Class;
   type IVectorView_IContactConnectedServiceAccount_Ptr is access all IVectorView_IContactConnectedServiceAccount;
   type IVector_IContactConnectedServiceAccount_Interface;
   type IVector_IContactConnectedServiceAccount is access all IVector_IContactConnectedServiceAccount_Interface'Class;
   type IVector_IContactConnectedServiceAccount_Ptr is access all IVector_IContactConnectedServiceAccount;
   type IIterator_IContactDate_Interface;
   type IIterator_IContactDate is access all IIterator_IContactDate_Interface'Class;
   type IIterator_IContactDate_Ptr is access all IIterator_IContactDate;
   type IIterable_IContactDate_Interface;
   type IIterable_IContactDate is access all IIterable_IContactDate_Interface'Class;
   type IIterable_IContactDate_Ptr is access all IIterable_IContactDate;
   type IVectorView_IContactDate_Interface;
   type IVectorView_IContactDate is access all IVectorView_IContactDate_Interface'Class;
   type IVectorView_IContactDate_Ptr is access all IVectorView_IContactDate;
   type IVector_IContactDate_Interface;
   type IVector_IContactDate is access all IVector_IContactDate_Interface'Class;
   type IVector_IContactDate_Ptr is access all IVector_IContactDate;
   type IIterator_IContactJobInfo_Interface;
   type IIterator_IContactJobInfo is access all IIterator_IContactJobInfo_Interface'Class;
   type IIterator_IContactJobInfo_Ptr is access all IIterator_IContactJobInfo;
   type IIterable_IContactJobInfo_Interface;
   type IIterable_IContactJobInfo is access all IIterable_IContactJobInfo_Interface'Class;
   type IIterable_IContactJobInfo_Ptr is access all IIterable_IContactJobInfo;
   type IVectorView_IContactJobInfo_Interface;
   type IVectorView_IContactJobInfo is access all IVectorView_IContactJobInfo_Interface'Class;
   type IVectorView_IContactJobInfo_Ptr is access all IVectorView_IContactJobInfo;
   type IVector_IContactJobInfo_Interface;
   type IVector_IContactJobInfo is access all IVector_IContactJobInfo_Interface'Class;
   type IVector_IContactJobInfo_Ptr is access all IVector_IContactJobInfo;
   type IIterator_IContactSignificantOther_Interface;
   type IIterator_IContactSignificantOther is access all IIterator_IContactSignificantOther_Interface'Class;
   type IIterator_IContactSignificantOther_Ptr is access all IIterator_IContactSignificantOther;
   type IIterable_IContactSignificantOther_Interface;
   type IIterable_IContactSignificantOther is access all IIterable_IContactSignificantOther_Interface'Class;
   type IIterable_IContactSignificantOther_Ptr is access all IIterable_IContactSignificantOther;
   type IVectorView_IContactSignificantOther_Interface;
   type IVectorView_IContactSignificantOther is access all IVectorView_IContactSignificantOther_Interface'Class;
   type IVectorView_IContactSignificantOther_Ptr is access all IVectorView_IContactSignificantOther;
   type IVector_IContactSignificantOther_Interface;
   type IVector_IContactSignificantOther is access all IVector_IContactSignificantOther_Interface'Class;
   type IVector_IContactSignificantOther_Ptr is access all IVector_IContactSignificantOther;
   type IIterator_IContactWebsite_Interface;
   type IIterator_IContactWebsite is access all IIterator_IContactWebsite_Interface'Class;
   type IIterator_IContactWebsite_Ptr is access all IIterator_IContactWebsite;
   type IIterable_IContactWebsite_Interface;
   type IIterable_IContactWebsite is access all IIterable_IContactWebsite_Interface'Class;
   type IIterable_IContactWebsite_Ptr is access all IIterable_IContactWebsite;
   type IVectorView_IContactWebsite_Interface;
   type IVectorView_IContactWebsite is access all IVectorView_IContactWebsite_Interface'Class;
   type IVectorView_IContactWebsite_Ptr is access all IVectorView_IContactWebsite;
   type IVector_IContactWebsite_Interface;
   type IVector_IContactWebsite is access all IVector_IContactWebsite_Interface'Class;
   type IVector_IContactWebsite_Ptr is access all IVector_IContactWebsite;
   type IIterator_IContactLocationField_Interface;
   type IIterator_IContactLocationField is access all IIterator_IContactLocationField_Interface'Class;
   type IIterator_IContactLocationField_Ptr is access all IIterator_IContactLocationField;
   type IIterable_IContactLocationField_Interface;
   type IIterable_IContactLocationField is access all IIterable_IContactLocationField_Interface'Class;
   type IIterable_IContactLocationField_Ptr is access all IIterable_IContactLocationField;
   type IVectorView_IContactLocationField_Interface;
   type IVectorView_IContactLocationField is access all IVectorView_IContactLocationField_Interface'Class;
   type IVectorView_IContactLocationField_Ptr is access all IVectorView_IContactLocationField;
   type IIterator_IContactInstantMessageField_Interface;
   type IIterator_IContactInstantMessageField is access all IIterator_IContactInstantMessageField_Interface'Class;
   type IIterator_IContactInstantMessageField_Ptr is access all IIterator_IContactInstantMessageField;
   type IIterable_IContactInstantMessageField_Interface;
   type IIterable_IContactInstantMessageField is access all IIterable_IContactInstantMessageField_Interface'Class;
   type IIterable_IContactInstantMessageField_Ptr is access all IIterable_IContactInstantMessageField;
   type IVectorView_IContactInstantMessageField_Interface;
   type IVectorView_IContactInstantMessageField is access all IVectorView_IContactInstantMessageField_Interface'Class;
   type IVectorView_IContactInstantMessageField_Ptr is access all IVectorView_IContactInstantMessageField;
   type IAsyncOperation_IPinnedContactIdsQueryResult_Interface;
   type IAsyncOperation_IPinnedContactIdsQueryResult is access all IAsyncOperation_IPinnedContactIdsQueryResult_Interface'Class;
   type IAsyncOperation_IPinnedContactIdsQueryResult_Ptr is access all IAsyncOperation_IPinnedContactIdsQueryResult;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IContactCardOptions : aliased constant Windows.IID := (2349485950, 27318, 20287, (190, 114, 129, 114, 54, 238, 234, 91 ));
   
   type IContactCardOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HeaderKind
   (
      This       : access IContactCardOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactCardHeaderKind
   )
   return Windows.HRESULT is abstract;
   
   function put_HeaderKind
   (
      This       : access IContactCardOptions_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactCardHeaderKind
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialTabKind
   (
      This       : access IContactCardOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactCardTabKind
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialTabKind
   (
      This       : access IContactCardOptions_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactCardTabKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactCardOptions2 : aliased constant Windows.IID := (2401704864, 55115, 19654, (159, 83, 27, 14, 181, 209, 39, 60 ));
   
   type IContactCardOptions2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServerSearchContactListIds
   (
      This       : access IContactCardOptions2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFullContactCardOptions : aliased constant Windows.IID := (2269397868, 23801, 18051, (189, 202, 161, 253, 235, 248, 219, 206 ));
   
   type IFullContactCardOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredRemainingView
   (
      This       : access IFullContactCardOptions_Interface
      ; RetVal : access Windows.UI.ViewManagement.ViewSizePreference
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredRemainingView
   (
      This       : access IFullContactCardOptions_Interface
      ; value : Windows.UI.ViewManagement.ViewSizePreference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactCardDelayedDataLoader : aliased constant Windows.IID := (3054172418, 5446, 17229, (134, 156, 110, 53, 32, 118, 14, 243 ));
   
   type IContactCardDelayedDataLoader_Interface is interface and Windows.IInspectable_Interface;
   
   function SetData
   (
      This       : access IContactCardDelayedDataLoader_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactManagerStatics : aliased constant Windows.IID := (2180127424, 63073, 18184, (186, 79, 211, 134, 189, 13, 98, 46 ));
   
   type IContactManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowContactCard
   (
      This       : access IContactManagerStatics_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function ShowContactCardWithPlacement
   (
      This       : access IContactManagerStatics_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.HRESULT is abstract;
   
   function ShowDelayLoadedContactCard
   (
      This       : access IContactManagerStatics_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactCardDelayedDataLoader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactManagerStatics2 : aliased constant Windows.IID := (2709055008, 18392, 18636, (150, 60, 149, 146, 182, 229, 16, 198 ));
   
   type IContactManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStoreAsync
   (
      This       : access IContactManagerStatics2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactManagerStatics3 : aliased constant Windows.IID := (3301719362, 30086, 18730, (147, 11, 123, 193, 56, 252, 33, 57 ));
   
   type IContactManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function ConvertContactToVCardAsync
   (
      This       : access IContactManagerStatics3_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConvertContactToVCardAsyncWithMaxBytes
   (
      This       : access IContactManagerStatics3_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; maxBytes : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConvertVCardToContactAsync
   (
      This       : access IContactManagerStatics3_Interface
      ; vCard : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestStoreAsyncWithAccessType
   (
      This       : access IContactManagerStatics3_Interface
      ; accessType : Windows.ApplicationModel.Contacts.ContactStoreAccessType
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAnnotationStoreAsync
   (
      This       : access IContactManagerStatics3_Interface
      ; accessType : Windows.ApplicationModel.Contacts.ContactAnnotationStoreAccessType
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsShowContactCardSupported
   (
      This       : access IContactManagerStatics3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ShowContactCardWithOptions
   (
      This       : access IContactManagerStatics3_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; contactCardOptions : Windows.ApplicationModel.Contacts.IContactCardOptions
   )
   return Windows.HRESULT is abstract;
   
   function IsShowDelayLoadedContactCardSupported
   (
      This       : access IContactManagerStatics3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ShowDelayLoadedContactCardWithOptions
   (
      This       : access IContactManagerStatics3_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; contactCardOptions : Windows.ApplicationModel.Contacts.IContactCardOptions
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactCardDelayedDataLoader
   )
   return Windows.HRESULT is abstract;
   
   function ShowFullContactCard
   (
      This       : access IContactManagerStatics3_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; fullContactCardOptions : Windows.ApplicationModel.Contacts.IFullContactCardOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemDisplayNameOrder
   (
      This       : access IContactManagerStatics3_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   return Windows.HRESULT is abstract;
   
   function put_SystemDisplayNameOrder
   (
      This       : access IContactManagerStatics3_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemSortOrder
   (
      This       : access IContactManagerStatics3_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   return Windows.HRESULT is abstract;
   
   function put_SystemSortOrder
   (
      This       : access IContactManagerStatics3_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactManagerStatics4 : aliased constant Windows.IID := (613950066, 13435, 18140, (141, 149, 81, 189, 65, 225, 90, 175 ));
   
   type IContactManagerStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IContactManagerStatics4_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactManagerStatics5 : aliased constant Windows.IID := (4149811847, 44215, 20397, (144, 242, 168, 171, 100, 205, 187, 164 ));
   
   type IContactManagerStatics5_Interface is interface and Windows.IInspectable_Interface;
   
   function IsShowFullContactCardSupportedAsync
   (
      This       : access IContactManagerStatics5_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeMiddleNameInSystemDisplayAndSort
   (
      This       : access IContactManagerStatics5_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IncludeMiddleNameInSystemDisplayAndSort
   (
      This       : access IContactManagerStatics5_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactManagerForUser : aliased constant Windows.IID := (3075193431, 4214, 19439, (174, 243, 84, 104, 109, 24, 56, 125 ));
   
   type IContactManagerForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function ConvertContactToVCardAsync
   (
      This       : access IContactManagerForUser_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConvertContactToVCardAsyncWithMaxBytes
   (
      This       : access IContactManagerForUser_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; maxBytes : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ConvertVCardToContactAsync
   (
      This       : access IContactManagerForUser_Interface
      ; vCard : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestStoreAsync
   (
      This       : access IContactManagerForUser_Interface
      ; accessType : Windows.ApplicationModel.Contacts.ContactStoreAccessType
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAnnotationStoreAsync
   (
      This       : access IContactManagerForUser_Interface
      ; accessType : Windows.ApplicationModel.Contacts.ContactAnnotationStoreAccessType
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemDisplayNameOrder
   (
      This       : access IContactManagerForUser_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   return Windows.HRESULT is abstract;
   
   function put_SystemDisplayNameOrder
   (
      This       : access IContactManagerForUser_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemSortOrder
   (
      This       : access IContactManagerForUser_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   return Windows.HRESULT is abstract;
   
   function put_SystemSortOrder
   (
      This       : access IContactManagerForUser_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IContactManagerForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactManagerForUser2 : aliased constant Windows.IID := (1296473134, 15221, 19059, (187, 48, 115, 102, 69, 71, 34, 86 ));
   
   type IContactManagerForUser2_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowFullContactCard
   (
      This       : access IContactManagerForUser2_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; fullContactCardOptions : Windows.ApplicationModel.Contacts.IFullContactCardOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAggregateContactManager : aliased constant Windows.IID := (58316253, 56154, 20435, (181, 78, 77, 241, 121, 23, 162, 18 ));
   
   type IAggregateContactManager_Interface is interface and Windows.IInspectable_Interface;
   
   function FindRawContactsAsync
   (
      This       : access IAggregateContactManager_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryLinkContactsAsync
   (
      This       : access IAggregateContactManager_Interface
      ; primaryContact : Windows.ApplicationModel.Contacts.IContact
      ; secondaryContact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnlinkRawContactAsync
   (
      This       : access IAggregateContactManager_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function TrySetPreferredSourceForPictureAsync
   (
      This       : access IAggregateContactManager_Interface
      ; aggregateContact : Windows.ApplicationModel.Contacts.IContact
      ; rawContact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAggregateContactManager2 : aliased constant Windows.IID := (1586283224, 43469, 17456, (156, 75, 1, 52, 141, 178, 202, 80 ));
   
   type IAggregateContactManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function SetRemoteIdentificationInformationAsync
   (
      This       : access IAggregateContactManager2_Interface
      ; contactListId : Windows.String
      ; remoteSourceId : Windows.String
      ; accountId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactAnnotationStore : aliased constant Windows.IID := (598537386, 31351, 17789, (130, 3, 152, 127, 75, 49, 175, 9 ));
   
   type IContactAnnotationStore_Interface is interface and Windows.IInspectable_Interface;
   
   function FindContactIdsByEmailAsync
   (
      This       : access IContactAnnotationStore_Interface
      ; emailAddress : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindContactIdsByPhoneNumberAsync
   (
      This       : access IContactAnnotationStore_Interface
      ; phoneNumber : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAnnotationsForContactAsync
   (
      This       : access IContactAnnotationStore_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DisableAnnotationAsync
   (
      This       : access IContactAnnotationStore_Interface
      ; annotation : Windows.ApplicationModel.Contacts.IContactAnnotation
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CreateAnnotationListAsync
   (
      This       : access IContactAnnotationStore_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationList -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateAnnotationListInAccountAsync
   (
      This       : access IContactAnnotationStore_Interface
      ; userDataAccountId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationList -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAnnotationListAsync
   (
      This       : access IContactAnnotationStore_Interface
      ; annotationListId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationList -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAnnotationListsAsync
   (
      This       : access IContactAnnotationStore_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactAnnotationStore2 : aliased constant Windows.IID := (2128487421, 25063, 18791, (142, 197, 189, 242, 128, 162, 64, 99 ));
   
   type IContactAnnotationStore2_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAnnotationsForContactListAsync
   (
      This       : access IContactAnnotationStore2_Interface
      ; contactListId : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactAnnotationList : aliased constant Windows.IID := (2460255914, 23688, 17849, (170, 208, 70, 24, 136, 230, 141, 138 ));
   
   type IContactAnnotationList_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IContactAnnotationList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderPackageFamilyName
   (
      This       : access IContactAnnotationList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserDataAccountId
   (
      This       : access IContactAnnotationList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IContactAnnotationList_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function TrySaveAnnotationAsync
   (
      This       : access IContactAnnotationList_Interface
      ; annotation : Windows.ApplicationModel.Contacts.IContactAnnotation
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAnnotationAsync
   (
      This       : access IContactAnnotationList_Interface
      ; annotationId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAnnotationsByRemoteIdAsync
   (
      This       : access IContactAnnotationList_Interface
      ; remoteId : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAnnotationsAsync
   (
      This       : access IContactAnnotationList_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAnnotationAsync
   (
      This       : access IContactAnnotationList_Interface
      ; annotation : Windows.ApplicationModel.Contacts.IContactAnnotation
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactAnnotation : aliased constant Windows.IID := (2183119599, 32065, 17570, (132, 195, 96, 162, 129, 221, 123, 134 ));
   
   type IContactAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IContactAnnotation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AnnotationListId
   (
      This       : access IContactAnnotation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContactId
   (
      This       : access IContactAnnotation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContactId
   (
      This       : access IContactAnnotation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access IContactAnnotation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access IContactAnnotation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedOperations
   (
      This       : access IContactAnnotation_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactAnnotationOperations
   )
   return Windows.HRESULT is abstract;
   
   function put_SupportedOperations
   (
      This       : access IContactAnnotation_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactAnnotationOperations
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisabled
   (
      This       : access IContactAnnotation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderProperties
   (
      This       : access IContactAnnotation_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactAnnotation2 : aliased constant Windows.IID := (3063016691, 19127, 18975, (153, 65, 12, 156, 243, 23, 27, 117 ));
   
   type IContactAnnotation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactListId
   (
      This       : access IContactAnnotation2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContactListId
   (
      This       : access IContactAnnotation2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactStoreNotificationTriggerDetails : aliased constant Windows.IID := (2880608470, 34698, 20363, (169, 206, 70, 187, 125, 28, 132, 206 ));
   
   type IContactStoreNotificationTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IContactStore : aliased constant Windows.IID := (740428560, 14956, 17043, (185, 188, 254, 152, 127, 110, 13, 82 ));
   
   type IContactStore_Interface is interface and Windows.IInspectable_Interface;
   
   function FindContactsAsync
   (
      This       : access IContactStore_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindContactsWithSearchTextAsync
   (
      This       : access IContactStore_Interface
      ; searchText : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetContactAsync
   (
      This       : access IContactStore_Interface
      ; contactId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactStore2 : aliased constant Windows.IID := (416160802, 60373, 19451, (182, 144, 95, 79, 39, 196, 240, 232 ));
   
   type IContactStore2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeTracker
   (
      This       : access IContactStore2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactChangeTracker
   )
   return Windows.HRESULT is abstract;
   
   function add_ContactChanged
   (
      This       : access IContactStore2_Interface
      ; value : TypedEventHandler_IContactStore2_add_ContactChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ContactChanged
   (
      This       : access IContactStore2_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_AggregateContactManager
   (
      This       : access IContactStore2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IAggregateContactManager
   )
   return Windows.HRESULT is abstract;
   
   function FindContactListsAsync
   (
      This       : access IContactStore2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetContactListAsync
   (
      This       : access IContactStore2_Interface
      ; contactListId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactList -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateContactListAsync
   (
      This       : access IContactStore2_Interface
      ; displayName : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactList -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMeContactAsync
   (
      This       : access IContactStore2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetContactReader
   (
      This       : access IContactStore2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactReader
   )
   return Windows.HRESULT is abstract;
   
   function GetContactReaderWithOptions
   (
      This       : access IContactStore2_Interface
      ; options : Windows.ApplicationModel.Contacts.IContactQueryOptions
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactReader
   )
   return Windows.HRESULT is abstract;
   
   function CreateContactListInAccountAsync
   (
      This       : access IContactStore2_Interface
      ; displayName : Windows.String
      ; userDataAccountId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactList -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactStore3 : aliased constant Windows.IID := (3414699116, 78, 16464, (135, 240, 132, 4, 7, 238, 104, 24 ));
   
   type IContactStore3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetChangeTracker
   (
      This       : access IContactStore3_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactChangeTracker
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactList : aliased constant Windows.IID := (383642741, 14636, 18501, (157, 251, 81, 163, 231, 239, 62, 66 ));
   
   type IContactList_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IContactList_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceDisplayName
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHidden
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsHidden
   (
      This       : access IContactList_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherAppReadAccess
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactListOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function put_OtherAppReadAccess
   (
      This       : access IContactList_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactListOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherAppWriteAccess
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactListOtherAppWriteAccess
   )
   return Windows.HRESULT is abstract;
   
   function put_OtherAppWriteAccess
   (
      This       : access IContactList_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactListOtherAppWriteAccess
   )
   return Windows.HRESULT is abstract;
   
   function get_ChangeTracker
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactChangeTracker
   )
   return Windows.HRESULT is abstract;
   
   function get_SyncManager
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactListSyncManager
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsServerSearch
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_UserDataAccountId
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_ContactChanged
   (
      This       : access IContactList_Interface
      ; value : TypedEventHandler_IContactList_add_ContactChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ContactChanged
   (
      This       : access IContactList_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetContactFromRemoteIdAsync
   (
      This       : access IContactList_Interface
      ; remoteId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMeContactAsync
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetContactReader
   (
      This       : access IContactList_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactReader
   )
   return Windows.HRESULT is abstract;
   
   function GetContactReaderWithOptions
   (
      This       : access IContactList_Interface
      ; options : Windows.ApplicationModel.Contacts.IContactQueryOptions
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactReader
   )
   return Windows.HRESULT is abstract;
   
   function SaveContactAsync
   (
      This       : access IContactList_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteContactAsync
   (
      This       : access IContactList_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetContactAsync
   (
      This       : access IContactList_Interface
      ; contactId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactList2 : aliased constant Windows.IID := (3409527732, 17744, 19915, (146, 41, 64, 255, 145, 251, 2, 3 ));
   
   type IContactList2_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterSyncManagerAsync
   (
      This       : access IContactList2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function put_SupportsServerSearch
   (
      This       : access IContactList2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SyncConstraints
   (
      This       : access IContactList2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactListSyncConstraints
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactList3 : aliased constant Windows.IID := (360246871, 9980, 16872, (168, 80, 90, 163, 37, 20, 172, 169 ));
   
   type IContactList3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LimitedWriteOperations
   (
      This       : access IContactList3_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactListLimitedWriteOperations
   )
   return Windows.HRESULT is abstract;
   
   function GetChangeTracker
   (
      This       : access IContactList3_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactChangeTracker
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactListLimitedWriteOperations : aliased constant Windows.IID := (3784840154, 18955, 17592, (154, 31, 160, 243, 210, 24, 23, 95 ));
   
   type IContactListLimitedWriteOperations_Interface is interface and Windows.IInspectable_Interface;
   
   function TryCreateOrUpdateContactAsync
   (
      This       : access IContactListLimitedWriteOperations_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDeleteContactAsync
   (
      This       : access IContactListLimitedWriteOperations_Interface
      ; contactId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactListSyncManager : aliased constant Windows.IID := (342787006, 31013, 19148, (157, 229, 33, 221, 208, 111, 134, 116 ));
   
   type IContactListSyncManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IContactListSyncManager_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactListSyncStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_LastSuccessfulSyncTime
   (
      This       : access IContactListSyncManager_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_LastAttemptedSyncTime
   (
      This       : access IContactListSyncManager_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function SyncAsync
   (
      This       : access IContactListSyncManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_SyncStatusChanged
   (
      This       : access IContactListSyncManager_Interface
      ; handler : TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SyncStatusChanged
   (
      This       : access IContactListSyncManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactListSyncManager2 : aliased constant Windows.IID := (2841186887, 47957, 20003, (129, 40, 55, 1, 52, 168, 93, 13 ));
   
   type IContactListSyncManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Status
   (
      This       : access IContactListSyncManager2_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactListSyncStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_LastSuccessfulSyncTime
   (
      This       : access IContactListSyncManager2_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_LastAttemptedSyncTime
   (
      This       : access IContactListSyncManager2_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactListSyncConstraints : aliased constant Windows.IID := (2997927681, 12386, 20014, (150, 157, 1, 141, 25, 135, 243, 20 ));
   
   type IContactListSyncConstraints_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanSyncDescriptions
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanSyncDescriptions
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxHomePhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxHomePhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxMobilePhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxMobilePhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxWorkPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxWorkPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxOtherPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxOtherPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPagerPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxPagerPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBusinessFaxPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxBusinessFaxPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxHomeFaxPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxHomeFaxPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxCompanyPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxCompanyPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxAssistantPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxAssistantPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxRadioPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxRadioPhoneNumbers
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPersonalEmailAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxPersonalEmailAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxWorkEmailAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxWorkEmailAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxOtherEmailAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxOtherEmailAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxHomeAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxHomeAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxWorkAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxWorkAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxOtherAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxOtherAddresses
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBirthdayDates
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxBirthdayDates
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxAnniversaryDates
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxAnniversaryDates
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxOtherDates
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxOtherDates
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxOtherRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxOtherRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSpouseRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxSpouseRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPartnerRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxPartnerRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSiblingRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxSiblingRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxParentRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxParentRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxChildRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxChildRelationships
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxJobInfo
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxJobInfo
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxWebsites
   (
      This       : access IContactListSyncConstraints_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxWebsites
   (
      This       : access IContactListSyncConstraints_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactChange : aliased constant Windows.IID := (2501724944, 27225, 18208, (164, 225, 54, 61, 152, 193, 53, 213 ));
   
   type IContactChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeType
   (
      This       : access IContactChange_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactChangeType
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactChange_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactChangedDeferral : aliased constant Windows.IID := (3306437352, 6915, 18168, (182, 148, 165, 35, 232, 60, 252, 182 ));
   
   type IContactChangedDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IContactChangedDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactChangedEventArgs : aliased constant Windows.IID := (1381924817, 29683, 19325, (169, 24, 88, 11, 228, 54, 97, 33 ));
   
   type IContactChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IContactChangedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactChangedDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactChangeReader : aliased constant Windows.IID := (561191418, 11532, 17120, (169, 218, 62, 205, 86, 167, 138, 71 ));
   
   type IContactChangeReader_Interface is interface and Windows.IInspectable_Interface;
   
   function AcceptChanges
   (
      This       : access IContactChangeReader_Interface
   )
   return Windows.HRESULT is abstract;
   
   function AcceptChangesThrough
   (
      This       : access IContactChangeReader_Interface
      ; lastChangeToAccept : Windows.ApplicationModel.Contacts.IContactChange
   )
   return Windows.HRESULT is abstract;
   
   function ReadBatchAsync
   (
      This       : access IContactChangeReader_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactChangeTracker : aliased constant Windows.IID := (1855531346, 12443, 16461, (151, 18, 179, 123, 211, 2, 120, 170 ));
   
   type IContactChangeTracker_Interface is interface and Windows.IInspectable_Interface;
   
   function Enable
   (
      This       : access IContactChangeTracker_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetChangeReader
   (
      This       : access IContactChangeTracker_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactChangeReader
   )
   return Windows.HRESULT is abstract;
   
   function Reset
   (
      This       : access IContactChangeTracker_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactChangeTracker2 : aliased constant Windows.IID := (2139803900, 37665, 19736, (156, 9, 215, 8, 198, 63, 205, 49 ));
   
   type IContactChangeTracker2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTracking
   (
      This       : access IContactChangeTracker2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactReader : aliased constant Windows.IID := (3549946926, 5256, 17138, (191, 100, 37, 63, 72, 132, 191, 237 ));
   
   type IContactReader_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchAsync
   (
      This       : access IContactReader_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactBatch -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMatchingPropertiesWithMatchReason
   (
      This       : access IContactReader_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactMatchReason -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactQueryTextSearch : aliased constant Windows.IID := (4158912971, 43351, 17307, (160, 183, 28, 2, 161, 150, 63, 240 ));
   
   type IContactQueryTextSearch_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Fields
   (
      This       : access IContactQueryTextSearch_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactQuerySearchFields
   )
   return Windows.HRESULT is abstract;
   
   function put_Fields
   (
      This       : access IContactQueryTextSearch_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactQuerySearchFields
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IContactQueryTextSearch_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access IContactQueryTextSearch_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SearchScope
   (
      This       : access IContactQueryTextSearch_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactQuerySearchScope
   )
   return Windows.HRESULT is abstract;
   
   function put_SearchScope
   (
      This       : access IContactQueryTextSearch_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactQuerySearchScope
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactQueryOptionsFactory : aliased constant Windows.IID := (1413462599, 36071, 18123, (157, 172, 154, 164, 42, 27, 200, 226 ));
   
   type IContactQueryOptionsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithText
   (
      This       : access IContactQueryOptionsFactory_Interface
      ; text : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactQueryOptions
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithTextAndFields
   (
      This       : access IContactQueryOptionsFactory_Interface
      ; text : Windows.String
      ; fields : Windows.ApplicationModel.Contacts.ContactQuerySearchFields
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactQueryOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactQueryOptions : aliased constant Windows.IID := (1141427358, 32124, 17136, (138, 199, 245, 7, 51, 236, 219, 193 ));
   
   type IContactQueryOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TextSearch
   (
      This       : access IContactQueryOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactQueryTextSearch
   )
   return Windows.HRESULT is abstract;
   
   function get_ContactListIds
   (
      This       : access IContactQueryOptions_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeContactsFromHiddenLists
   (
      This       : access IContactQueryOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IncludeContactsFromHiddenLists
   (
      This       : access IContactQueryOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredFields
   (
      This       : access IContactQueryOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactQueryDesiredFields
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredFields
   (
      This       : access IContactQueryOptions_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactQueryDesiredFields
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredOperations
   (
      This       : access IContactQueryOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactAnnotationOperations
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredOperations
   (
      This       : access IContactQueryOptions_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactAnnotationOperations
   )
   return Windows.HRESULT is abstract;
   
   function get_AnnotationListIds
   (
      This       : access IContactQueryOptions_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactBatch : aliased constant Windows.IID := (902928173, 49102, 18107, (147, 248, 165, 176, 110, 197, 226, 1 ));
   
   type IContactBatch_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Contacts
   (
      This       : access IContactBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IContactBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactBatchStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactMatchReason : aliased constant Windows.IID := (3163694340, 59352, 16702, (149, 244, 183, 92, 84, 199, 64, 119 ));
   
   type IContactMatchReason_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Field
   (
      This       : access IContactMatchReason_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactMatchReasonKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Segments
   (
      This       : access IContactMatchReason_Interface
      ; RetVal : access Windows.Data.Text.IVectorView_TextSegment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IContactMatchReason_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactLaunchActionVerbsStatics : aliased constant Windows.IID := (4212273878, 61043, 18151, (135, 97, 17, 205, 1, 87, 114, 143 ));
   
   type IContactLaunchActionVerbsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Call
   (
      This       : access IContactLaunchActionVerbsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IContactLaunchActionVerbsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Map
   (
      This       : access IContactLaunchActionVerbsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Post
   (
      This       : access IContactLaunchActionVerbsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoCall
   (
      This       : access IContactLaunchActionVerbsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactGroup : aliased constant Windows.IID := (1505618689, 40602, 18269, (191, 229, 163, 123, 128, 109, 133, 44 ));
   
   type IContactGroup_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IContactPicker : aliased constant Windows.IID := (235535761, 17144, 16469, (144, 160, 137, 111, 150, 115, 137, 54 ));
   
   type IContactPicker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CommitButtonText
   (
      This       : access IContactPicker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CommitButtonText
   (
      This       : access IContactPicker_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectionMode
   (
      This       : access IContactPicker_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactSelectionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectionMode
   (
      This       : access IContactPicker_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactSelectionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredFields
   (
      This       : access IContactPicker_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickSingleContactAsync
   (
      This       : access IContactPicker_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContactInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickMultipleContactsAsync
   (
      This       : access IContactPicker_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactPicker2 : aliased constant Windows.IID := (3008369103, 23791, 19748, (170, 12, 52, 12, 82, 8, 114, 93 ));
   
   type IContactPicker2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredFieldsWithContactFieldType
   (
      This       : access IContactPicker2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_ContactFieldType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickContactAsync
   (
      This       : access IContactPicker2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickContactsAsync
   (
      This       : access IContactPicker2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactPicker3 : aliased constant Windows.IID := (242365205, 45635, 19437, (133, 22, 34, 177, 167, 172, 10, 206 ));
   
   type IContactPicker3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IContactPicker3_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactPickerStatics : aliased constant Windows.IID := (1955119145, 27219, 16984, (163, 233, 98, 223, 246, 120, 75, 108 ));
   
   type IContactPickerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateForUser
   (
      This       : access IContactPickerStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactPicker
   )
   return Windows.HRESULT is abstract;
   
   function IsSupportedAsync
   (
      This       : access IContactPickerStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactConnectedServiceAccount : aliased constant Windows.IID := (4143461715, 43559, 18225, (142, 74, 61, 236, 92, 233, 238, 201 ));
   
   type IContactConnectedServiceAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IContactConnectedServiceAccount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IContactConnectedServiceAccount_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceName
   (
      This       : access IContactConnectedServiceAccount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ServiceName
   (
      This       : access IContactConnectedServiceAccount_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactSignificantOther : aliased constant Windows.IID := (2289284523, 50683, 18136, (147, 254, 218, 63, 241, 147, 64, 84 ));
   
   type IContactSignificantOther_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IContactSignificantOther_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IContactSignificantOther_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IContactSignificantOther_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IContactSignificantOther_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactSignificantOther2 : aliased constant Windows.IID := (2373702772, 16131, 17912, (186, 15, 196, 237, 55, 214, 66, 25 ));
   
   type IContactSignificantOther2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Relationship
   (
      This       : access IContactSignificantOther2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactRelationship
   )
   return Windows.HRESULT is abstract;
   
   function put_Relationship
   (
      This       : access IContactSignificantOther2_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactRelationship
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactWebsite : aliased constant Windows.IID := (2668822902, 56347, 16469, (173, 102, 101, 47, 57, 217, 144, 232 ));
   
   type IContactWebsite_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IContactWebsite_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Uri
   (
      This       : access IContactWebsite_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IContactWebsite_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IContactWebsite_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactWebsite2 : aliased constant Windows.IID := (4169066782, 22087, 16488, (187, 94, 75, 111, 67, 124, 227, 8 ));
   
   type IContactWebsite2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RawValue
   (
      This       : access IContactWebsite2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RawValue
   (
      This       : access IContactWebsite2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactEmail : aliased constant Windows.IID := (2426542505, 58323, 19811, (153, 59, 5, 185, 165, 57, 58, 191 ));
   
   type IContactEmail_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Address
   (
      This       : access IContactEmail_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Address
   (
      This       : access IContactEmail_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IContactEmail_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactEmailKind
   )
   return Windows.HRESULT is abstract;
   
   function put_Kind
   (
      This       : access IContactEmail_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactEmailKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IContactEmail_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IContactEmail_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactPhone : aliased constant Windows.IID := (1182640997, 10002, 20306, (183, 131, 158, 168, 17, 28, 99, 205 ));
   
   type IContactPhone_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Number
   (
      This       : access IContactPhone_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Number
   (
      This       : access IContactPhone_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IContactPhone_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactPhoneKind
   )
   return Windows.HRESULT is abstract;
   
   function put_Kind
   (
      This       : access IContactPhone_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactPhoneKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IContactPhone_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IContactPhone_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactAddress : aliased constant Windows.IID := (2537149338, 17102, 18546, (141, 112, 48, 99, 170, 88, 75, 112 ));
   
   type IContactAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StreetAddress
   (
      This       : access IContactAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_StreetAddress
   (
      This       : access IContactAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Locality
   (
      This       : access IContactAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Locality
   (
      This       : access IContactAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Region
   (
      This       : access IContactAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Region
   (
      This       : access IContactAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Country
   (
      This       : access IContactAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Country
   (
      This       : access IContactAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PostalCode
   (
      This       : access IContactAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PostalCode
   (
      This       : access IContactAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IContactAddress_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactAddressKind
   )
   return Windows.HRESULT is abstract;
   
   function put_Kind
   (
      This       : access IContactAddress_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactAddressKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IContactAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IContactAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactDate : aliased constant Windows.IID := (4271418982, 45573, 18740, (145, 116, 15, 242, 176, 86, 87, 7 ));
   
   type IContactDate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Day
   (
      This       : access IContactDate_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Day
   (
      This       : access IContactDate_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Month
   (
      This       : access IContactDate_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Month
   (
      This       : access IContactDate_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Year
   (
      This       : access IContactDate_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Year
   (
      This       : access IContactDate_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IContactDate_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactDateKind
   )
   return Windows.HRESULT is abstract;
   
   function put_Kind
   (
      This       : access IContactDate_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactDateKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IContactDate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IContactDate_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactJobInfo : aliased constant Windows.IID := (1829862220, 52816, 19267, (158, 105, 177, 130, 88, 234, 83, 21 ));
   
   type IContactJobInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CompanyName
   (
      This       : access IContactJobInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CompanyName
   (
      This       : access IContactJobInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CompanyYomiName
   (
      This       : access IContactJobInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CompanyYomiName
   (
      This       : access IContactJobInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Department
   (
      This       : access IContactJobInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Department
   (
      This       : access IContactJobInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IContactJobInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IContactJobInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Manager
   (
      This       : access IContactJobInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Manager
   (
      This       : access IContactJobInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Office
   (
      This       : access IContactJobInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Office
   (
      This       : access IContactJobInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CompanyAddress
   (
      This       : access IContactJobInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CompanyAddress
   (
      This       : access IContactJobInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IContactJobInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IContactJobInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContact : aliased constant Windows.IID := (3959452403, 8472, 16457, (158, 188, 23, 240, 171, 105, 43, 100 ));
   
   type IContact_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IContact_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IContact_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IContact_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access IContact_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Fields
   (
      This       : access IContact_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_IContactField -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactField : aliased constant Windows.IID := (2977319018, 53907, 18732, (160, 88, 219, 87, 91, 62, 60, 15 ));
   
   type IContactField_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IContactField_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.HRESULT is abstract;
   
   function get_Category
   (
      This       : access IContactField_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactFieldCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IContactField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IContactField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactName : aliased constant Windows.IID := (4093962619, 36916, 17724, (142, 191, 20, 10, 56, 200, 111, 29 ));
   
   type IContactName_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FirstName
   (
      This       : access IContactName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_FirstName
   (
      This       : access IContactName_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LastName
   (
      This       : access IContactName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_LastName
   (
      This       : access IContactName_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MiddleName
   (
      This       : access IContactName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MiddleName
   (
      This       : access IContactName_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_YomiGivenName
   (
      This       : access IContactName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_YomiGivenName
   (
      This       : access IContactName_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_YomiFamilyName
   (
      This       : access IContactName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_YomiFamilyName
   (
      This       : access IContactName_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HonorificNameSuffix
   (
      This       : access IContactName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_HonorificNameSuffix
   (
      This       : access IContactName_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HonorificNamePrefix
   (
      This       : access IContactName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_HonorificNamePrefix
   (
      This       : access IContactName_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IContactName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_YomiDisplayName
   (
      This       : access IContactName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContact2 : aliased constant Windows.IID := (4078105445, 47991, 19604, (128, 45, 131, 40, 206, 228, 12, 8 ));
   
   type IContact2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IContact2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Notes
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Notes
   (
      This       : access IContact2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Phones
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_IContactPhone -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Emails
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_IContactEmail -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Addresses
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_IContactAddress -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectedServiceAccounts
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_IContactConnectedServiceAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ImportantDates
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_IContactDate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DataSuppliers
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_JobInfo
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_IContactJobInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SignificantOthers
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_IContactSignificantOther -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Websites
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_IContactWebsite -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderProperties
   (
      This       : access IContact2_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContact3 : aliased constant Windows.IID := (1210064487, 57486, 17060, (181, 97, 65, 208, 140, 169, 87, 93 ));
   
   type IContact3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactListId
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayPictureUserUpdateTime
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayPictureUserUpdateTime
   (
      This       : access IContact3_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMe
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AggregateId
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access IContact3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RingToneToken
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RingToneToken
   (
      This       : access IContact3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisplayPictureManuallySet
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LargeDisplayPicture
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_SmallDisplayPicture
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceDisplayPicture
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_SourceDisplayPicture
   (
      This       : access IContact3_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_TextToneToken
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TextToneToken
   (
      This       : access IContact3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAggregate
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FullName
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayNameOverride
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayNameOverride
   (
      This       : access IContact3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Nickname
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Nickname
   (
      This       : access IContact3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SortName
   (
      This       : access IContact3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactLocationField : aliased constant Windows.IID := (2663387010, 43886, 19254, (137, 227, 178, 59, 192, 161, 218, 204 ));
   
   type IContactLocationField_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UnstructuredAddress
   (
      This       : access IContactLocationField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Street
   (
      This       : access IContactLocationField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_City
   (
      This       : access IContactLocationField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Region
   (
      This       : access IContactLocationField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Country
   (
      This       : access IContactLocationField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PostalCode
   (
      This       : access IContactLocationField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactInstantMessageField : aliased constant Windows.IID := (3437443895, 3461, 16890, (180, 61, 218, 89, 156, 62, 176, 9 ));
   
   type IContactInstantMessageField_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UserName
   (
      This       : access IContactInstantMessageField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Service
   (
      This       : access IContactInstantMessageField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayText
   (
      This       : access IContactInstantMessageField_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LaunchUri
   (
      This       : access IContactInstantMessageField_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownContactFieldStatics : aliased constant Windows.IID := (772676370, 54823, 20426, (186, 212, 31, 175, 22, 140, 125, 20 ));
   
   type IKnownContactFieldStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Email
   (
      This       : access IKnownContactFieldStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PhoneNumber
   (
      This       : access IKnownContactFieldStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IKnownContactFieldStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InstantMessage
   (
      This       : access IKnownContactFieldStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ConvertNameToType
   (
      This       : access IKnownContactFieldStatics_Interface
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.HRESULT is abstract;
   
   function ConvertTypeToName
   (
      This       : access IKnownContactFieldStatics_Interface
      ; type_x : Windows.ApplicationModel.Contacts.ContactFieldType
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactInformation : aliased constant Windows.IID := (660518612, 27182, 17016, (169, 20, 228, 96, 213, 240, 136, 246 ));
   
   type IContactInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IContactInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetThumbnailAsync
   (
      This       : access IContactInformation_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Emails
   (
      This       : access IContactInformation_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactField -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PhoneNumbers
   (
      This       : access IContactInformation_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactField -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Locations
   (
      This       : access IContactInformation_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactLocationField -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InstantMessages
   (
      This       : access IContactInformation_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactInstantMessageField -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomFields
   (
      This       : access IContactInformation_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactField -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function QueryCustomFields
   (
      This       : access IContactInformation_Interface
      ; customName : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactField -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactFieldFactory : aliased constant Windows.IID := (2246218047, 3658, 19006, (137, 148, 64, 106, 231, 237, 100, 110 ));
   
   type IContactFieldFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateField_Default
   (
      This       : access IContactFieldFactory_Interface
      ; value : Windows.String
      ; type_x : Windows.ApplicationModel.Contacts.ContactFieldType
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactField
   )
   return Windows.HRESULT is abstract;
   
   function CreateField_Category
   (
      This       : access IContactFieldFactory_Interface
      ; value : Windows.String
      ; type_x : Windows.ApplicationModel.Contacts.ContactFieldType
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactField
   )
   return Windows.HRESULT is abstract;
   
   function CreateField_Custom
   (
      This       : access IContactFieldFactory_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; type_x : Windows.ApplicationModel.Contacts.ContactFieldType
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactField
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactLocationFieldFactory : aliased constant Windows.IID := (4154012375, 12255, 17406, (143, 24, 65, 137, 115, 144, 188, 254 ));
   
   type IContactLocationFieldFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateLocation_Default
   (
      This       : access IContactLocationFieldFactory_Interface
      ; unstructuredAddress : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactLocationField
   )
   return Windows.HRESULT is abstract;
   
   function CreateLocation_Category
   (
      This       : access IContactLocationFieldFactory_Interface
      ; unstructuredAddress : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactLocationField
   )
   return Windows.HRESULT is abstract;
   
   function CreateLocation_All
   (
      This       : access IContactLocationFieldFactory_Interface
      ; unstructuredAddress : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
      ; street : Windows.String
      ; city : Windows.String
      ; region : Windows.String
      ; country : Windows.String
      ; postalCode : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactLocationField
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactInstantMessageFieldFactory : aliased constant Windows.IID := (3121309588, 37283, 19378, (177, 185, 105, 165, 223, 240, 186, 9 ));
   
   type IContactInstantMessageFieldFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstantMessage_Default
   (
      This       : access IContactInstantMessageFieldFactory_Interface
      ; userName : Windows.String
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactInstantMessageField
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstantMessage_Category
   (
      This       : access IContactInstantMessageFieldFactory_Interface
      ; userName : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactInstantMessageField
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstantMessage_All
   (
      This       : access IContactInstantMessageFieldFactory_Interface
      ; userName : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
      ; service : Windows.String
      ; displayText : Windows.String
      ; verb : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactInstantMessageField
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPinnedContactIdsQueryResult : aliased constant Windows.IID := (2107319634, 5497, 19932, (135, 31, 163, 10, 58, 234, 155, 161 ));
   
   type IPinnedContactIdsQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactIds
   (
      This       : access IPinnedContactIdsQueryResult_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPinnedContactManagerStatics : aliased constant Windows.IID := (4133276798, 65017, 18538, (172, 233, 188, 49, 29, 10, 231, 240 ));
   
   type IPinnedContactManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IPinnedContactManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IPinnedContactManager
   )
   return Windows.HRESULT is abstract;
   
   function GetForUser
   (
      This       : access IPinnedContactManagerStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.ApplicationModel.Contacts.IPinnedContactManager
   )
   return Windows.HRESULT is abstract;
   
   function IsSupported
   (
      This       : access IPinnedContactManagerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPinnedContactManager : aliased constant Windows.IID := (4240208908, 57814, 17859, (184, 182, 163, 86, 4, 225, 103, 160 ));
   
   type IPinnedContactManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IPinnedContactManager_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function IsPinSurfaceSupported
   (
      This       : access IPinnedContactManager_Interface
      ; surface : Windows.ApplicationModel.Contacts.PinnedContactSurface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsContactPinned
   (
      This       : access IPinnedContactManager_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; surface : Windows.ApplicationModel.Contacts.PinnedContactSurface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function RequestPinContactAsync
   (
      This       : access IPinnedContactManager_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; surface : Windows.ApplicationModel.Contacts.PinnedContactSurface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPinContactsAsync
   (
      This       : access IPinnedContactManager_Interface
      ; contacts : Windows.ApplicationModel.Contacts.IIterable_IContact
      ; surface : Windows.ApplicationModel.Contacts.PinnedContactSurface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestUnpinContactAsync
   (
      This       : access IPinnedContactManager_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; surface : Windows.ApplicationModel.Contacts.PinnedContactSurface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SignalContactActivity
   (
      This       : access IPinnedContactManager_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   function GetPinnedContactIdsAsync
   (
      This       : access IPinnedContactManager_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IAsyncOperation_IPinnedContactIdsQueryResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactPanelLaunchFullAppRequestedEventArgs : aliased constant Windows.IID := (2295733262, 9140, 19432, (138, 252, 7, 44, 37, 164, 25, 13 ));
   
   type IContactPanelLaunchFullAppRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IContactPanelLaunchFullAppRequestedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IContactPanelLaunchFullAppRequestedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactPanelClosingEventArgs : aliased constant Windows.IID := (572617939, 53067, 18135, (183, 57, 110, 220, 22, 17, 11, 251 ));
   
   type IContactPanelClosingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IContactPanelClosingEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactPanel : aliased constant Windows.IID := (1103041125, 53998, 19351, (168, 10, 125, 141, 100, 204, 166, 245 ));
   
   type IContactPanel_Interface is interface and Windows.IInspectable_Interface;
   
   function ClosePanel
   (
      This       : access IContactPanel_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderColor
   (
      This       : access IContactPanel_Interface
      ; RetVal : access Windows.UI.IReference_Color -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_HeaderColor
   (
      This       : access IContactPanel_Interface
      ; value : Windows.UI.IReference_Color
   )
   return Windows.HRESULT is abstract;
   
   function add_LaunchFullAppRequested
   (
      This       : access IContactPanel_Interface
      ; handler : TypedEventHandler_IContactPanel_add_LaunchFullAppRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LaunchFullAppRequested
   (
      This       : access IContactPanel_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Closing
   (
      This       : access IContactPanel_Interface
      ; handler : TypedEventHandler_IContactPanel_add_Closing
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closing
   (
      This       : access IContactPanel_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IContactStore : aliased constant Windows.IID := (593364881, 39486, 22307, (135, 240, 68, 255, 183, 134, 201, 225 ));
   
   type IAsyncOperation_IContactStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IContactStore_Interface
      ; handler : Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IContactStore_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IContactStore_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IContact : aliased constant Windows.IID := (2239609187, 63020, 21444, (163, 160, 246, 191, 12, 143, 211, 211 ));
   
   type IAsyncOperation_IContact_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IContact_Interface
      ; handler : Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContact
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IContact_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContact
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IContact_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IContactAnnotationStore : aliased constant Windows.IID := (3331400311, 24019, 24144, (167, 235, 165, 102, 6, 70, 212, 50 ));
   
   type IAsyncOperation_IContactAnnotationStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IContactAnnotationStore_Interface
      ; handler : Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactAnnotationStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IContactAnnotationStore_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactAnnotationStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IContactAnnotationStore_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactAnnotationStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IContactAnnotationList : aliased constant Windows.IID := (973756775, 49532, 22431, (186, 5, 204, 86, 224, 161, 208, 145 ));
   
   type IAsyncOperation_IContactAnnotationList_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IContactAnnotationList_Interface
      ; handler : Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactAnnotationList
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IContactAnnotationList_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactAnnotationList
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IContactAnnotationList_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactAnnotationList
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IContactAnnotation : aliased constant Windows.IID := (1642747075, 54825, 23390, (181, 129, 99, 5, 4, 181, 23, 2 ));
   
   type IAsyncOperation_IContactAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IContactAnnotation_Interface
      ; handler : Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IContactAnnotation_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IContactAnnotation_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactAnnotation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IContactList : aliased constant Windows.IID := (2927717181, 22440, 20647, (128, 126, 44, 118, 138, 54, 74, 79 ));
   
   type IAsyncOperation_IContactList_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IContactList_Interface
      ; handler : Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactList
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IContactList_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactList
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IContactList_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactList
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IContactBatch : aliased constant Windows.IID := (1148171744, 23851, 22813, (184, 222, 251, 124, 149, 252, 159, 55 ));
   
   type IAsyncOperation_IContactBatch_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IContactBatch_Interface
      ; handler : Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactBatch
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IContactBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactBatch
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IContactBatch_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactBatch
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactMatchReason : aliased constant Windows.IID := (1256417089, 48094, 23510, (157, 79, 13, 87, 177, 65, 14, 78 ));
   
   type IIterator_IContactMatchReason_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactMatchReason_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactMatchReason
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactMatchReason_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactMatchReason_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactMatchReason_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactMatchReason_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactMatchReason : aliased constant Windows.IID := (176954329, 9218, 23704, (190, 110, 99, 164, 128, 128, 71, 186 ));
   
   type IIterable_IContactMatchReason_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactMatchReason_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactMatchReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactMatchReason : aliased constant Windows.IID := (3358329709, 10454, 23591, (146, 109, 150, 208, 39, 80, 136, 113 ));
   
   type IVectorView_IContactMatchReason_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactMatchReason_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactMatchReason
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactMatchReason_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactMatchReason_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactMatchReason
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactMatchReason_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactMatchReason_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContact : aliased constant Windows.IID := (2775761267, 32778, 22715, (171, 36, 23, 153, 89, 223, 40, 19 ));
   
   type IIterator_IContact_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContact_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContact_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContact_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContact_Interface
      ; items : Windows.ApplicationModel.Contacts.IContact_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContact : aliased constant Windows.IID := (1664194966, 32271, 21806, (135, 43, 123, 154, 219, 31, 73, 151 ));
   
   type IIterable_IContact_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContact_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContact : aliased constant Windows.IID := (2613736888, 45306, 22369, (185, 89, 56, 25, 39, 165, 249, 208 ));
   
   type IVectorView_IContact_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContact_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContact_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContact_Interface
      ; value : Windows.ApplicationModel.Contacts.IContact
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContact_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContact_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IContactInformation : aliased constant Windows.IID := (240238640, 10154, 22047, (187, 216, 47, 87, 192, 143, 239, 131 ));
   
   type IAsyncOperation_IContactInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IContactInformation_Interface
      ; handler : Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IContactInformation_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IContactInformation
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IContactInformation_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ContactFieldType : aliased constant Windows.IID := (795706730, 20692, 20851, (171, 234, 219, 108, 107, 143, 197, 48 ));
   
   type IIterator_ContactFieldType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ContactFieldType_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ContactFieldType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ContactFieldType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ContactFieldType_Interface
      ; items : Windows.ApplicationModel.Contacts.ContactFieldType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ContactFieldType : aliased constant Windows.IID := (944474907, 52878, 22401, (179, 220, 7, 118, 214, 132, 246, 88 ));
   
   type IIterable_ContactFieldType_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ContactFieldType_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_ContactFieldType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ContactFieldType : aliased constant Windows.IID := (970370010, 40970, 22391, (134, 17, 130, 215, 195, 38, 193, 141 ));
   
   type IVectorView_ContactFieldType_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ContactFieldType_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ContactFieldType_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ContactFieldType_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactFieldType
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ContactFieldType_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.ContactFieldType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_ContactFieldType : aliased constant Windows.IID := (1876697365, 5705, 21668, (143, 170, 48, 73, 206, 251, 5, 164 ));
   
   type IVector_ContactFieldType_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ContactFieldType_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ContactFieldType_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ContactFieldType_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_ContactFieldType
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ContactFieldType_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactFieldType
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ContactFieldType_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ContactFieldType_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ContactFieldType_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ContactFieldType_Interface
      ; value : Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ContactFieldType_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ContactFieldType_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ContactFieldType_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.ContactFieldType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ContactFieldType_Interface
      ; items : Windows.ApplicationModel.Contacts.ContactFieldType_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactField : aliased constant Windows.IID := (3305226675, 5915, 21280, (141, 132, 195, 168, 154, 61, 64, 52 ));
   
   type IIterator_IContactField_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactField_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactField
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactField_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactField_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactField_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactField_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactField : aliased constant Windows.IID := (3764776389, 7459, 23525, (153, 152, 39, 54, 205, 77, 82, 151 ));
   
   type IIterable_IContactField_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactField_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactField
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactField : aliased constant Windows.IID := (441211701, 32501, 24298, (148, 199, 253, 241, 246, 23, 170, 126 ));
   
   type IVectorView_IContactField_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactField_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactField
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactField_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactField_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactField
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactField_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactField_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IContactField : aliased constant Windows.IID := (4192028459, 20304, 22586, (163, 170, 183, 58, 245, 72, 6, 190 ));
   
   type IVector_IContactField_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IContactField_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactField
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IContactField_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IContactField_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactField
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IContactField_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactField
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IContactField_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactField
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IContactField_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactField
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IContactField_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IContactField_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactField
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IContactField_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IContactField_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IContactField_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactField_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IContactField_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactField_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactPhone : aliased constant Windows.IID := (1614485774, 8118, 22370, (189, 138, 245, 158, 149, 39, 38, 247 ));
   
   type IIterator_IContactPhone_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactPhone_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactPhone
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactPhone_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactPhone_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactPhone_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactPhone_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactPhone : aliased constant Windows.IID := (1253902492, 18849, 23465, (128, 223, 83, 183, 45, 214, 145, 206 ));
   
   type IIterable_IContactPhone_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactPhone_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactPhone
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactPhone : aliased constant Windows.IID := (341735593, 59385, 22936, (128, 42, 219, 252, 145, 76, 207, 54 ));
   
   type IVectorView_IContactPhone_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactPhone_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactPhone
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactPhone_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactPhone_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactPhone
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactPhone_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactPhone_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IContactPhone : aliased constant Windows.IID := (1830783034, 7984, 23175, (181, 74, 142, 34, 69, 237, 16, 1 ));
   
   type IVector_IContactPhone_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IContactPhone_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactPhone
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IContactPhone_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IContactPhone_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactPhone
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IContactPhone_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactPhone
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IContactPhone_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactPhone
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IContactPhone_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactPhone
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IContactPhone_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IContactPhone_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactPhone
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IContactPhone_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IContactPhone_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IContactPhone_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactPhone_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IContactPhone_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactPhone_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactEmail : aliased constant Windows.IID := (3595363949, 10550, 23070, (184, 245, 8, 11, 177, 53, 96, 34 ));
   
   type IIterator_IContactEmail_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactEmail_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactEmail
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactEmail_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactEmail_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactEmail_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactEmail_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactEmail : aliased constant Windows.IID := (936432991, 57654, 23303, (138, 58, 129, 16, 189, 227, 57, 23 ));
   
   type IIterable_IContactEmail_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactEmail_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactEmail
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactEmail : aliased constant Windows.IID := (2352897950, 33370, 20836, (144, 211, 249, 127, 127, 136, 236, 176 ));
   
   type IVectorView_IContactEmail_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactEmail_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactEmail
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactEmail_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactEmail_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactEmail
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactEmail_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactEmail_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IContactEmail : aliased constant Windows.IID := (1289774983, 56993, 21919, (167, 10, 252, 190, 89, 219, 211, 164 ));
   
   type IVector_IContactEmail_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IContactEmail_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactEmail
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IContactEmail_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IContactEmail_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactEmail
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IContactEmail_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactEmail
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IContactEmail_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactEmail
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IContactEmail_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactEmail
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IContactEmail_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IContactEmail_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactEmail
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IContactEmail_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IContactEmail_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IContactEmail_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactEmail_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IContactEmail_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactEmail_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactAddress : aliased constant Windows.IID := (3640672132, 25567, 23564, (189, 30, 44, 205, 234, 85, 231, 23 ));
   
   type IIterator_IContactAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactAddress_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactAddress_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactAddress_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactAddress_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactAddress_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactAddress : aliased constant Windows.IID := (3884132476, 59680, 21824, (145, 130, 193, 166, 165, 242, 173, 54 ));
   
   type IIterable_IContactAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactAddress_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactAddress
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactAddress : aliased constant Windows.IID := (3891969149, 31170, 22626, (133, 158, 149, 144, 2, 215, 185, 85 ));
   
   type IVectorView_IContactAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactAddress_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactAddress_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactAddress_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactAddress
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactAddress_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactAddress_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IContactAddress : aliased constant Windows.IID := (3502414062, 5408, 21406, (132, 179, 162, 89, 9, 113, 125, 32 ));
   
   type IVector_IContactAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IContactAddress_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IContactAddress_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IContactAddress_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactAddress
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IContactAddress_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactAddress
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IContactAddress_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactAddress
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IContactAddress_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactAddress
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IContactAddress_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IContactAddress_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactAddress
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IContactAddress_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IContactAddress_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IContactAddress_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactAddress_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IContactAddress_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactAddress_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactConnectedServiceAccount : aliased constant Windows.IID := (1056015935, 51289, 23453, (142, 53, 32, 173, 241, 2, 164, 13 ));
   
   type IIterator_IContactConnectedServiceAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactConnectedServiceAccount_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactConnectedServiceAccount_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactConnectedServiceAccount_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactConnectedServiceAccount_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactConnectedServiceAccount : aliased constant Windows.IID := (904004530, 20792, 22887, (128, 250, 164, 119, 237, 76, 125, 220 ));
   
   type IIterable_IContactConnectedServiceAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactConnectedServiceAccount_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactConnectedServiceAccount
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactConnectedServiceAccount : aliased constant Windows.IID := (646424308, 24473, 20641, (136, 209, 93, 124, 199, 199, 242, 54 ));
   
   type IVectorView_IContactConnectedServiceAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactConnectedServiceAccount_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactConnectedServiceAccount_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactConnectedServiceAccount_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactConnectedServiceAccount_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IContactConnectedServiceAccount : aliased constant Windows.IID := (743832448, 42841, 24494, (188, 41, 153, 7, 224, 151, 96, 72 ));
   
   type IVector_IContactConnectedServiceAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactConnectedServiceAccount
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IContactConnectedServiceAccount_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactDate : aliased constant Windows.IID := (1342488470, 21321, 23312, (135, 198, 199, 111, 33, 242, 161, 213 ));
   
   type IIterator_IContactDate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactDate_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactDate
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactDate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactDate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactDate_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactDate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactDate : aliased constant Windows.IID := (2516868363, 45963, 23953, (131, 17, 79, 188, 122, 212, 51, 125 ));
   
   type IIterable_IContactDate_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactDate_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactDate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactDate : aliased constant Windows.IID := (658719325, 45463, 22925, (187, 128, 20, 253, 240, 234, 168, 35 ));
   
   type IVectorView_IContactDate_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactDate_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactDate
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactDate_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactDate_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactDate
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactDate_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactDate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IContactDate : aliased constant Windows.IID := (825612612, 55572, 23119, (132, 62, 166, 214, 203, 105, 188, 177 ));
   
   type IVector_IContactDate_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IContactDate_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactDate
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IContactDate_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IContactDate_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactDate
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IContactDate_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactDate
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IContactDate_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactDate
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IContactDate_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactDate
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IContactDate_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IContactDate_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactDate
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IContactDate_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IContactDate_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IContactDate_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactDate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IContactDate_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactDate_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactJobInfo : aliased constant Windows.IID := (141811571, 44185, 20719, (134, 115, 231, 143, 138, 84, 14, 46 ));
   
   type IIterator_IContactJobInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactJobInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactJobInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactJobInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactJobInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactJobInfo_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactJobInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactJobInfo : aliased constant Windows.IID := (398577325, 22179, 23955, (171, 242, 20, 211, 77, 75, 147, 86 ));
   
   type IIterable_IContactJobInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactJobInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactJobInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactJobInfo : aliased constant Windows.IID := (4059151813, 32766, 21076, (137, 252, 192, 21, 89, 2, 15, 157 ));
   
   type IVectorView_IContactJobInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactJobInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactJobInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactJobInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactJobInfo_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactJobInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactJobInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactJobInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IContactJobInfo : aliased constant Windows.IID := (3927216016, 48009, 22020, (151, 87, 236, 209, 231, 206, 83, 17 ));
   
   type IVector_IContactJobInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IContactJobInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactJobInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IContactJobInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IContactJobInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactJobInfo
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IContactJobInfo_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactJobInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IContactJobInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactJobInfo
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IContactJobInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactJobInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IContactJobInfo_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IContactJobInfo_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactJobInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IContactJobInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IContactJobInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IContactJobInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactJobInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IContactJobInfo_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactJobInfo_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactSignificantOther : aliased constant Windows.IID := (542233850, 48454, 21227, (178, 208, 78, 181, 218, 193, 33, 87 ));
   
   type IIterator_IContactSignificantOther_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactSignificantOther_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactSignificantOther
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactSignificantOther_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactSignificantOther_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactSignificantOther_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactSignificantOther_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactSignificantOther : aliased constant Windows.IID := (2920463669, 37846, 21464, (135, 192, 73, 216, 76, 92, 106, 131 ));
   
   type IIterable_IContactSignificantOther_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactSignificantOther_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactSignificantOther
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactSignificantOther : aliased constant Windows.IID := (868609529, 49630, 21131, (170, 72, 206, 182, 161, 144, 92, 192 ));
   
   type IVectorView_IContactSignificantOther_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactSignificantOther_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactSignificantOther
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactSignificantOther_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactSignificantOther_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactSignificantOther
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactSignificantOther_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactSignificantOther_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IContactSignificantOther : aliased constant Windows.IID := (3468903504, 33091, 22243, (147, 58, 211, 48, 81, 183, 68, 55 ));
   
   type IVector_IContactSignificantOther_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IContactSignificantOther_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactSignificantOther
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IContactSignificantOther_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IContactSignificantOther_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactSignificantOther
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IContactSignificantOther_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactSignificantOther
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IContactSignificantOther_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactSignificantOther
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IContactSignificantOther_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactSignificantOther
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IContactSignificantOther_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IContactSignificantOther_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactSignificantOther
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IContactSignificantOther_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IContactSignificantOther_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IContactSignificantOther_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactSignificantOther_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IContactSignificantOther_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactSignificantOther_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactWebsite : aliased constant Windows.IID := (2443550626, 23745, 22093, (187, 29, 245, 45, 174, 193, 54, 173 ));
   
   type IIterator_IContactWebsite_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactWebsite_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactWebsite
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactWebsite_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactWebsite_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactWebsite_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactWebsite_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactWebsite : aliased constant Windows.IID := (1258537475, 39070, 23447, (143, 203, 103, 214, 97, 222, 254, 118 ));
   
   type IIterable_IContactWebsite_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactWebsite_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactWebsite
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactWebsite : aliased constant Windows.IID := (4135052847, 14789, 22464, (182, 66, 38, 177, 67, 48, 152, 113 ));
   
   type IVectorView_IContactWebsite_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactWebsite_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactWebsite
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactWebsite_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactWebsite_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactWebsite
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactWebsite_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactWebsite_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IContactWebsite : aliased constant Windows.IID := (422675598, 59284, 22389, (179, 147, 74, 69, 24, 214, 59, 9 ));
   
   type IVector_IContactWebsite_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IContactWebsite_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactWebsite
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IContactWebsite_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IContactWebsite_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContactWebsite
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IContactWebsite_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactWebsite
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IContactWebsite_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactWebsite
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IContactWebsite_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Contacts.IContactWebsite
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IContactWebsite_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IContactWebsite_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactWebsite
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IContactWebsite_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IContactWebsite_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IContactWebsite_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactWebsite_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IContactWebsite_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactWebsite_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactLocationField : aliased constant Windows.IID := (2718173143, 27008, 23631, (185, 147, 241, 218, 3, 153, 65, 5 ));
   
   type IIterator_IContactLocationField_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactLocationField_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactLocationField
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactLocationField_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactLocationField_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactLocationField_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactLocationField_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactLocationField : aliased constant Windows.IID := (705315238, 55958, 20645, (184, 223, 228, 168, 196, 252, 248, 107 ));
   
   type IIterable_IContactLocationField_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactLocationField_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactLocationField
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactLocationField : aliased constant Windows.IID := (535557322, 18653, 24495, (162, 211, 116, 119, 13, 138, 163, 48 ));
   
   type IVectorView_IContactLocationField_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactLocationField_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactLocationField
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactLocationField_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactLocationField_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactLocationField
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactLocationField_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactLocationField_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IContactInstantMessageField : aliased constant Windows.IID := (1709205990, 10449, 23895, (159, 225, 128, 255, 100, 133, 14, 103 ));
   
   type IIterator_IContactInstantMessageField_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IContactInstantMessageField_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactInstantMessageField
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IContactInstantMessageField_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IContactInstantMessageField_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IContactInstantMessageField_Interface
      ; items : Windows.ApplicationModel.Contacts.IContactInstantMessageField_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IContactInstantMessageField : aliased constant Windows.IID := (2164601778, 10427, 24275, (172, 25, 254, 200, 5, 157, 123, 60 ));
   
   type IIterable_IContactInstantMessageField_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IContactInstantMessageField_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IIterator_IContactInstantMessageField
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IContactInstantMessageField : aliased constant Windows.IID := (3059677700, 52648, 22906, (138, 187, 166, 225, 254, 52, 192, 15 ));
   
   type IVectorView_IContactInstantMessageField_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IContactInstantMessageField_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactInstantMessageField
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IContactInstantMessageField_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IContactInstantMessageField_Interface
      ; value : Windows.ApplicationModel.Contacts.IContactInstantMessageField
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IContactInstantMessageField_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Contacts.IContactInstantMessageField_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPinnedContactIdsQueryResult : aliased constant Windows.IID := (52091756, 15011, 23305, (168, 251, 146, 234, 1, 69, 220, 64 ));
   
   type IAsyncOperation_IPinnedContactIdsQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPinnedContactIdsQueryResult_Interface
      ; handler : Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPinnedContactIdsQueryResult_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPinnedContactIdsQueryResult_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IPinnedContactIdsQueryResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IContactStore : aliased constant Windows.IID := (3508791282, 2907, 22794, (178, 52, 161, 33, 172, 30, 11, 171 ));
   
   type AsyncOperationCompletedHandler_IContactStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IContactStore'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContactStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IContact : aliased constant Windows.IID := (2714803182, 49537, 21529, (189, 20, 130, 35, 185, 95, 41, 161 ));
   
   type AsyncOperationCompletedHandler_IContact_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContact ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IContact'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContact_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContact
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IContactAnnotationStore : aliased constant Windows.IID := (1435463193, 11598, 23114, (140, 88, 56, 115, 214, 35, 177, 212 ));
   
   type AsyncOperationCompletedHandler_IContactAnnotationStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IContactAnnotationStore'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContactAnnotationStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IContactAnnotationList : aliased constant Windows.IID := (2991034087, 56457, 23421, (180, 163, 179, 190, 41, 82, 32, 159 ));
   
   type AsyncOperationCompletedHandler_IContactAnnotationList_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationList ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IContactAnnotationList'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContactAnnotationList_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationList
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IContactAnnotation : aliased constant Windows.IID := (600361453, 35104, 23966, (176, 82, 195, 94, 49, 252, 35, 67 ));
   
   type AsyncOperationCompletedHandler_IContactAnnotation_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotation ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IContactAnnotation'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContactAnnotation_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IContactStore2_add_ContactChanged : aliased constant Windows.IID := (1570987624, 29971, 24237, (170, 212, 205, 211, 222, 78, 90, 231 ));
   
   type TypedEventHandler_IContactStore2_add_ContactChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Contacts.IContactStore ; args : Windows.ApplicationModel.Contacts.IContactChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IContactStore2_add_ContactChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IContactStore2_add_ContactChanged_Interface
      ; sender : Windows.ApplicationModel.Contacts.IContactStore
      ; args : Windows.ApplicationModel.Contacts.IContactChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IContactList : aliased constant Windows.IID := (3563555570, 11460, 22672, (179, 162, 3, 165, 171, 123, 184, 248 ));
   
   type AsyncOperationCompletedHandler_IContactList_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactList ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IContactList'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContactList_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactList
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IContactList_add_ContactChanged : aliased constant Windows.IID := (3377716224, 12478, 21369, (188, 172, 67, 92, 107, 173, 60, 230 ));
   
   type TypedEventHandler_IContactList_add_ContactChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Contacts.IContactList ; args : Windows.ApplicationModel.Contacts.IContactChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IContactList_add_ContactChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IContactList_add_ContactChanged_Interface
      ; sender : Windows.ApplicationModel.Contacts.IContactList
      ; args : Windows.ApplicationModel.Contacts.IContactChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged : aliased constant Windows.IID := (4039429667, 20096, 23729, (159, 67, 251, 220, 28, 96, 145, 34 ));
   
   type TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Contacts.IContactListSyncManager ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged_Interface
      ; sender : Windows.ApplicationModel.Contacts.IContactListSyncManager
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IContactBatch : aliased constant Windows.IID := (3695822669, 6855, 22356, (130, 233, 37, 24, 12, 77, 216, 136 ));
   
   type AsyncOperationCompletedHandler_IContactBatch_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactBatch ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IContactBatch'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContactBatch_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactBatch
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IContactInformation : aliased constant Windows.IID := (3377168417, 20619, 22683, (147, 179, 37, 86, 203, 199, 58, 47 ));
   
   type AsyncOperationCompletedHandler_IContactInformation_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactInformation ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IContactInformation'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContactInformation_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactInformation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult : aliased constant Windows.IID := (2466915234, 10447, 22022, (130, 241, 101, 223, 238, 34, 135, 53 ));
   
   type AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IPinnedContactIdsQueryResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IPinnedContactIdsQueryResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IContactPanel_add_LaunchFullAppRequested : aliased constant Windows.IID := (3288534514, 44340, 21877, (163, 105, 86, 22, 87, 120, 120, 235 ));
   
   type TypedEventHandler_IContactPanel_add_LaunchFullAppRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Contacts.IContactPanel ; args : Windows.ApplicationModel.Contacts.IContactPanelLaunchFullAppRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IContactPanel_add_LaunchFullAppRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IContactPanel_add_LaunchFullAppRequested_Interface
      ; sender : Windows.ApplicationModel.Contacts.IContactPanel
      ; args : Windows.ApplicationModel.Contacts.IContactPanelLaunchFullAppRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IContactPanel_add_Closing : aliased constant Windows.IID := (1129813323, 48358, 21590, (165, 17, 254, 137, 4, 232, 9, 11 ));
   
   type TypedEventHandler_IContactPanel_add_Closing_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Contacts.IContactPanel ; args : Windows.ApplicationModel.Contacts.IContactPanelClosingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IContactPanel_add_Closing'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IContactPanel_add_Closing_Interface
      ; sender : Windows.ApplicationModel.Contacts.IContactPanel
      ; args : Windows.ApplicationModel.Contacts.IContactPanelClosingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ContactCardDelayedDataLoader is Windows.ApplicationModel.Contacts.IContactCardDelayedDataLoader;
   subtype ContactStore is Windows.ApplicationModel.Contacts.IContactStore;
   subtype ContactAnnotationStore is Windows.ApplicationModel.Contacts.IContactAnnotationStore;
   subtype ContactCardOptions is Windows.ApplicationModel.Contacts.IContactCardOptions;
   function CreateContactCardOptions return Windows.ApplicationModel.Contacts.IContactCardOptions;
   
   subtype FullContactCardOptions is Windows.ApplicationModel.Contacts.IFullContactCardOptions;
   function CreateFullContactCardOptions return Windows.ApplicationModel.Contacts.IFullContactCardOptions;
   
   subtype ContactManagerForUser is Windows.ApplicationModel.Contacts.IContactManagerForUser;
   subtype ContactAnnotation is Windows.ApplicationModel.Contacts.IContactAnnotation;
   function CreateContactAnnotation return Windows.ApplicationModel.Contacts.IContactAnnotation;
   
   subtype ContactAnnotationList is Windows.ApplicationModel.Contacts.IContactAnnotationList;
   subtype ContactChangeTracker is Windows.ApplicationModel.Contacts.IContactChangeTracker;
   subtype ContactChangedEventArgs is Windows.ApplicationModel.Contacts.IContactChangedEventArgs;
   subtype AggregateContactManager is Windows.ApplicationModel.Contacts.IAggregateContactManager;
   subtype ContactList is Windows.ApplicationModel.Contacts.IContactList;
   subtype ContactReader is Windows.ApplicationModel.Contacts.IContactReader;
   subtype ContactQueryOptions is Windows.ApplicationModel.Contacts.IContactQueryOptions;
   function CreateWithText
   (
      text : Windows.String
   )
   return Windows.ApplicationModel.Contacts.IContactQueryOptions;
   
   function CreateWithTextAndFields
   (
      text : Windows.String
      ; fields : Windows.ApplicationModel.Contacts.ContactQuerySearchFields
   )
   return Windows.ApplicationModel.Contacts.IContactQueryOptions;
   
   subtype ContactListSyncManager is Windows.ApplicationModel.Contacts.IContactListSyncManager;
   subtype ContactListSyncConstraints is Windows.ApplicationModel.Contacts.IContactListSyncConstraints;
   subtype ContactListLimitedWriteOperations is Windows.ApplicationModel.Contacts.IContactListLimitedWriteOperations;
   subtype ContactChangedDeferral is Windows.ApplicationModel.Contacts.IContactChangedDeferral;
   subtype ContactChange is Windows.ApplicationModel.Contacts.IContactChange;
   subtype ContactChangeReader is Windows.ApplicationModel.Contacts.IContactChangeReader;
   subtype ContactBatch is Windows.ApplicationModel.Contacts.IContactBatch;
   subtype ContactMatchReason is Windows.ApplicationModel.Contacts.IContactMatchReason;
   subtype ContactQueryTextSearch is Windows.ApplicationModel.Contacts.IContactQueryTextSearch;
   subtype ContactStoreNotificationTriggerDetails is Windows.ApplicationModel.Contacts.IContactStoreNotificationTriggerDetails;
   subtype ContactGroup is Windows.ApplicationModel.Contacts.IContactGroup;
   subtype ContactPicker is Windows.ApplicationModel.Contacts.IContactPicker;
   function CreateContactPicker return Windows.ApplicationModel.Contacts.IContactPicker;
   
   subtype ContactPhone is Windows.ApplicationModel.Contacts.IContactPhone;
   function CreateContactPhone return Windows.ApplicationModel.Contacts.IContactPhone;
   
   subtype ContactEmail is Windows.ApplicationModel.Contacts.IContactEmail;
   function CreateContactEmail return Windows.ApplicationModel.Contacts.IContactEmail;
   
   subtype ContactAddress is Windows.ApplicationModel.Contacts.IContactAddress;
   function CreateContactAddress return Windows.ApplicationModel.Contacts.IContactAddress;
   
   subtype ContactConnectedServiceAccount is Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount;
   function CreateContactConnectedServiceAccount return Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount;
   
   subtype ContactDate is Windows.ApplicationModel.Contacts.IContactDate;
   function CreateContactDate return Windows.ApplicationModel.Contacts.IContactDate;
   
   subtype ContactJobInfo is Windows.ApplicationModel.Contacts.IContactJobInfo;
   function CreateContactJobInfo return Windows.ApplicationModel.Contacts.IContactJobInfo;
   
   subtype ContactSignificantOther is Windows.ApplicationModel.Contacts.IContactSignificantOther;
   function CreateContactSignificantOther return Windows.ApplicationModel.Contacts.IContactSignificantOther;
   
   subtype ContactWebsite is Windows.ApplicationModel.Contacts.IContactWebsite;
   function CreateContactWebsite return Windows.ApplicationModel.Contacts.IContactWebsite;
   
   subtype Contact is Windows.ApplicationModel.Contacts.IContact;
   function CreateContact return Windows.ApplicationModel.Contacts.IContact;
   
   subtype ContactField is Windows.ApplicationModel.Contacts.IContactField;
   function CreateField_Default
   (
      value : Windows.String
      ; type_x : Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.ApplicationModel.Contacts.IContactField;
   
   function CreateField_Category
   (
      value : Windows.String
      ; type_x : Windows.ApplicationModel.Contacts.ContactFieldType
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
   )
   return Windows.ApplicationModel.Contacts.IContactField;
   
   function CreateField_Custom
   (
      name : Windows.String
      ; value : Windows.String
      ; type_x : Windows.ApplicationModel.Contacts.ContactFieldType
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
   )
   return Windows.ApplicationModel.Contacts.IContactField;
   
   subtype ContactLocationField is Windows.ApplicationModel.Contacts.IContactLocationField;
   function CreateLocation_Default
   (
      unstructuredAddress : Windows.String
   )
   return Windows.ApplicationModel.Contacts.IContactLocationField;
   
   function CreateLocation_Category
   (
      unstructuredAddress : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
   )
   return Windows.ApplicationModel.Contacts.IContactLocationField;
   
   function CreateLocation_All
   (
      unstructuredAddress : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
      ; street : Windows.String
      ; city : Windows.String
      ; region : Windows.String
      ; country : Windows.String
      ; postalCode : Windows.String
   )
   return Windows.ApplicationModel.Contacts.IContactLocationField;
   
   subtype ContactInstantMessageField is Windows.ApplicationModel.Contacts.IContactInstantMessageField;
   function CreateInstantMessage_Default
   (
      userName : Windows.String
   )
   return Windows.ApplicationModel.Contacts.IContactInstantMessageField;
   
   function CreateInstantMessage_Category
   (
      userName : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
   )
   return Windows.ApplicationModel.Contacts.IContactInstantMessageField;
   
   function CreateInstantMessage_All
   (
      userName : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
      ; service : Windows.String
      ; displayText : Windows.String
      ; verb : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.ApplicationModel.Contacts.IContactInstantMessageField;
   
   subtype ContactInformation is Windows.ApplicationModel.Contacts.IContactInformation;
   subtype ContactFieldFactory is Windows.ApplicationModel.Contacts.IContactFieldFactory;
   function CreateContactFieldFactory return Windows.ApplicationModel.Contacts.IContactFieldFactory;
   
   subtype PinnedContactIdsQueryResult is Windows.ApplicationModel.Contacts.IPinnedContactIdsQueryResult;
   subtype PinnedContactManager is Windows.ApplicationModel.Contacts.IPinnedContactManager;
   subtype ContactPanelLaunchFullAppRequestedEventArgs is Windows.ApplicationModel.Contacts.IContactPanelLaunchFullAppRequestedEventArgs;
   subtype ContactPanelClosingEventArgs is Windows.ApplicationModel.Contacts.IContactPanelClosingEventArgs;
   subtype ContactPanel is Windows.ApplicationModel.Contacts.IContactPanel;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   procedure ShowContactCard
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
   )
   ;
   
   procedure ShowContactCardWithPlacement
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   ;
   
   function ShowDelayLoadedContactCard
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.ApplicationModel.Contacts.IContactCardDelayedDataLoader;
   
   function IsShowFullContactCardSupportedAsync
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function get_IncludeMiddleNameInSystemDisplayAndSort
   return Windows.Boolean;
   
   procedure put_IncludeMiddleNameInSystemDisplayAndSort
   (
      value : Windows.Boolean
   )
   ;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Contacts.IContactManagerForUser;
   
   function ConvertContactToVCardAsync
   (
      contact : Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference;
   
   function ConvertContactToVCardAsyncWithMaxBytes
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; maxBytes : Windows.UInt32
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference;
   
   function ConvertVCardToContactAsync
   (
      vCard : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.ApplicationModel.Contacts.IAsyncOperation_IContact;
   
   function RequestStoreAsyncWithAccessType
   (
      accessType : Windows.ApplicationModel.Contacts.ContactStoreAccessType
   )
   return Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore;
   
   function RequestAnnotationStoreAsync
   (
      accessType : Windows.ApplicationModel.Contacts.ContactAnnotationStoreAccessType
   )
   return Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationStore;
   
   function IsShowContactCardSupported
   return Windows.Boolean;
   
   procedure ShowContactCardWithOptions
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; contactCardOptions : Windows.ApplicationModel.Contacts.IContactCardOptions
   )
   ;
   
   function IsShowDelayLoadedContactCardSupported
   return Windows.Boolean;
   
   function ShowDelayLoadedContactCardWithOptions
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; contactCardOptions : Windows.ApplicationModel.Contacts.IContactCardOptions
   )
   return Windows.ApplicationModel.Contacts.IContactCardDelayedDataLoader;
   
   procedure ShowFullContactCard
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; fullContactCardOptions : Windows.ApplicationModel.Contacts.IFullContactCardOptions
   )
   ;
   
   function get_SystemDisplayNameOrder
   return Windows.ApplicationModel.Contacts.ContactNameOrder;
   
   procedure put_SystemDisplayNameOrder
   (
      value : Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   ;
   
   function get_SystemSortOrder
   return Windows.ApplicationModel.Contacts.ContactNameOrder;
   
   procedure put_SystemSortOrder
   (
      value : Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   ;
   
   function RequestStoreAsync
   return Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore;
   
   function get_Call
   return Windows.String;
   
   function get_Message
   return Windows.String;
   
   function get_Map
   return Windows.String;
   
   function get_Post
   return Windows.String;
   
   function get_VideoCall
   return Windows.String;
   
   function CreateForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Contacts.IContactPicker;
   
   function IsSupportedAsync
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function get_Email
   return Windows.String;
   
   function get_PhoneNumber
   return Windows.String;
   
   function get_Location
   return Windows.String;
   
   function get_InstantMessage
   return Windows.String;
   
   function ConvertNameToType
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Contacts.ContactFieldType;
   
   function ConvertTypeToName
   (
      type_x : Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.String;
   
   function GetDefault
   return Windows.ApplicationModel.Contacts.IPinnedContactManager;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Contacts.IPinnedContactManager;
   
   function IsSupported
   return Windows.Boolean;
   
end;
