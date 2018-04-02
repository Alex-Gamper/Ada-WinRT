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
limited with Windows.UI.Popups;
with Windows.Foundation.Collections;
limited with Windows.System;
limited with Windows.UI;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Appointments is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AppointmentStoreAccessType is (
      AppCalendarsReadWrite,
      AllCalendarsReadOnly,
      AllCalendarsReadWrite
   );
   for AppointmentStoreAccessType use (
      AppCalendarsReadWrite => 0,
      AllCalendarsReadOnly => 1,
      AllCalendarsReadWrite => 2
   );
   for AppointmentStoreAccessType'Size use 32;
   
   type AppointmentStoreAccessType_Ptr is access AppointmentStoreAccessType;
   
   type AppointmentSensitivity is (
      Public,
      Private_x
   );
   for AppointmentSensitivity use (
      Public => 0,
      Private_x => 1
   );
   for AppointmentSensitivity'Size use 32;
   
   type AppointmentSensitivity_Ptr is access AppointmentSensitivity;
   
   type AppointmentBusyStatus is (
      Busy,
      Tentative,
      Free,
      OutOfOffice,
      WorkingElsewhere
   );
   for AppointmentBusyStatus use (
      Busy => 0,
      Tentative => 1,
      Free => 2,
      OutOfOffice => 3,
      WorkingElsewhere => 4
   );
   for AppointmentBusyStatus'Size use 32;
   
   type AppointmentBusyStatus_Ptr is access AppointmentBusyStatus;
   
   type AppointmentParticipantResponse is (
      None,
      Tentative,
      Accepted,
      Declined,
      Unknown
   );
   for AppointmentParticipantResponse use (
      None => 0,
      Tentative => 1,
      Accepted => 2,
      Declined => 3,
      Unknown => 4
   );
   for AppointmentParticipantResponse'Size use 32;
   
   type AppointmentParticipantResponse_Ptr is access AppointmentParticipantResponse;
   
   type AppointmentParticipantRole is (
      RequiredAttendee,
      OptionalAttendee,
      Resource
   );
   for AppointmentParticipantRole use (
      RequiredAttendee => 0,
      OptionalAttendee => 1,
      Resource => 2
   );
   for AppointmentParticipantRole'Size use 32;
   
   type AppointmentParticipantRole_Ptr is access AppointmentParticipantRole;
   
   type AppointmentRecurrenceUnit is (
      Daily,
      Weekly,
      Monthly,
      MonthlyOnDay,
      Yearly,
      YearlyOnDay
   );
   for AppointmentRecurrenceUnit use (
      Daily => 0,
      Weekly => 1,
      Monthly => 2,
      MonthlyOnDay => 3,
      Yearly => 4,
      YearlyOnDay => 5
   );
   for AppointmentRecurrenceUnit'Size use 32;
   
   type AppointmentRecurrenceUnit_Ptr is access AppointmentRecurrenceUnit;
   
   type AppointmentDaysOfWeek is (
      None,
      Sunday,
      Monday,
      Tuesday,
      Wednesday,
      Thursday,
      Friday,
      Saturday
   );
   for AppointmentDaysOfWeek use (
      None => 0,
      Sunday => 1,
      Monday => 2,
      Tuesday => 4,
      Wednesday => 8,
      Thursday => 16,
      Friday => 32,
      Saturday => 64
   );
   for AppointmentDaysOfWeek'Size use 32;
   
   type AppointmentDaysOfWeek_Ptr is access AppointmentDaysOfWeek;
   
   type AppointmentWeekOfMonth is (
      First,
      Second,
      Third,
      Fourth,
      Last
   );
   for AppointmentWeekOfMonth use (
      First => 0,
      Second => 1,
      Third => 2,
      Fourth => 3,
      Last => 4
   );
   for AppointmentWeekOfMonth'Size use 32;
   
   type AppointmentWeekOfMonth_Ptr is access AppointmentWeekOfMonth;
   
   type AppointmentCalendarSyncStatus is (
      Idle,
      Syncing,
      UpToDate,
      AuthenticationError,
      PolicyError,
      UnknownError,
      ManualAccountRemovalRequired
   );
   for AppointmentCalendarSyncStatus use (
      Idle => 0,
      Syncing => 1,
      UpToDate => 2,
      AuthenticationError => 3,
      PolicyError => 4,
      UnknownError => 5,
      ManualAccountRemovalRequired => 6
   );
   for AppointmentCalendarSyncStatus'Size use 32;
   
   type AppointmentCalendarSyncStatus_Ptr is access AppointmentCalendarSyncStatus;
   
   type RecurrenceType is (
      Master,
      Instance,
      ExceptionInstance
   );
   for RecurrenceType use (
      Master => 0,
      Instance => 1,
      ExceptionInstance => 2
   );
   for RecurrenceType'Size use 32;
   
   type RecurrenceType_Ptr is access RecurrenceType;
   
   type AppointmentDetailsKind is (
      PlainText,
      Html
   );
   for AppointmentDetailsKind use (
      PlainText => 0,
      Html => 1
   );
   for AppointmentDetailsKind'Size use 32;
   
   type AppointmentDetailsKind_Ptr is access AppointmentDetailsKind;
   
   type FindAppointmentCalendarsOptions is (
      None,
      IncludeHidden
   );
   for FindAppointmentCalendarsOptions use (
      None => 0,
      IncludeHidden => 1
   );
   for FindAppointmentCalendarsOptions'Size use 32;
   
   type FindAppointmentCalendarsOptions_Ptr is access FindAppointmentCalendarsOptions;
   
   type AppointmentSummaryCardView is (
      System,
      App
   );
   for AppointmentSummaryCardView use (
      System => 0,
      App => 1
   );
   for AppointmentSummaryCardView'Size use 32;
   
   type AppointmentSummaryCardView_Ptr is access AppointmentSummaryCardView;
   
   type AppointmentCalendarOtherAppReadAccess is (
      SystemOnly,
      Limited_x,
      Full,
      None
   );
   for AppointmentCalendarOtherAppReadAccess use (
      SystemOnly => 0,
      Limited_x => 1,
      Full => 2,
      None => 3
   );
   for AppointmentCalendarOtherAppReadAccess'Size use 32;
   
   type AppointmentCalendarOtherAppReadAccess_Ptr is access AppointmentCalendarOtherAppReadAccess;
   
   type AppointmentCalendarOtherAppWriteAccess is (
      None,
      SystemOnly,
      Limited_x
   );
   for AppointmentCalendarOtherAppWriteAccess use (
      None => 0,
      SystemOnly => 1,
      Limited_x => 2
   );
   for AppointmentCalendarOtherAppWriteAccess'Size use 32;
   
   type AppointmentCalendarOtherAppWriteAccess_Ptr is access AppointmentCalendarOtherAppWriteAccess;
   
   type AppointmentConflictType is (
      None,
      Adjacent,
      Overlap
   );
   for AppointmentConflictType use (
      None => 0,
      Adjacent => 1,
      Overlap => 2
   );
   for AppointmentConflictType'Size use 32;
   
   type AppointmentConflictType_Ptr is access AppointmentConflictType;
   
   type AppointmentStoreChangeType is (
      AppointmentCreated,
      AppointmentModified,
      AppointmentDeleted,
      ChangeTrackingLost,
      CalendarCreated,
      CalendarModified,
      CalendarDeleted
   );
   for AppointmentStoreChangeType use (
      AppointmentCreated => 0,
      AppointmentModified => 1,
      AppointmentDeleted => 2,
      ChangeTrackingLost => 3,
      CalendarCreated => 4,
      CalendarModified => 5,
      CalendarDeleted => 6
   );
   for AppointmentStoreChangeType'Size use 32;
   
   type AppointmentStoreChangeType_Ptr is access AppointmentStoreChangeType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IAppointmentStore_Interface;
   type AsyncOperationCompletedHandler_IAppointmentStore is access all AsyncOperationCompletedHandler_IAppointmentStore_Interface'Class;
   type AsyncOperationCompletedHandler_IAppointmentStore_Ptr is access all AsyncOperationCompletedHandler_IAppointmentStore;
   type AsyncOperationCompletedHandler_IAppointment_Interface;
   type AsyncOperationCompletedHandler_IAppointment is access all AsyncOperationCompletedHandler_IAppointment_Interface'Class;
   type AsyncOperationCompletedHandler_IAppointment_Ptr is access all AsyncOperationCompletedHandler_IAppointment;
   type TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged_Interface;
   type TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged is access all TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged_Interface'Class;
   type TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged_Ptr is access all TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged;
   type AsyncOperationCompletedHandler_IAppointmentCalendar_Interface;
   type AsyncOperationCompletedHandler_IAppointmentCalendar is access all AsyncOperationCompletedHandler_IAppointmentCalendar_Interface'Class;
   type AsyncOperationCompletedHandler_IAppointmentCalendar_Ptr is access all AsyncOperationCompletedHandler_IAppointmentCalendar;
   type AsyncOperationCompletedHandler_IAppointmentConflictResult_Interface;
   type AsyncOperationCompletedHandler_IAppointmentConflictResult is access all AsyncOperationCompletedHandler_IAppointmentConflictResult_Interface'Class;
   type AsyncOperationCompletedHandler_IAppointmentConflictResult_Ptr is access all AsyncOperationCompletedHandler_IAppointmentConflictResult;
   type TypedEventHandler_IAppointmentStore2_add_StoreChanged_Interface;
   type TypedEventHandler_IAppointmentStore2_add_StoreChanged is access all TypedEventHandler_IAppointmentStore2_add_StoreChanged_Interface'Class;
   type TypedEventHandler_IAppointmentStore2_add_StoreChanged_Ptr is access all TypedEventHandler_IAppointmentStore2_add_StoreChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAppointmentManagerStatics_Interface;
   type IAppointmentManagerStatics is access all IAppointmentManagerStatics_Interface'Class;
   type IAppointmentManagerStatics_Ptr is access all IAppointmentManagerStatics;
   type IAppointmentManagerStatics2_Interface;
   type IAppointmentManagerStatics2 is access all IAppointmentManagerStatics2_Interface'Class;
   type IAppointmentManagerStatics2_Ptr is access all IAppointmentManagerStatics2;
   type IAppointmentManagerStatics3_Interface;
   type IAppointmentManagerStatics3 is access all IAppointmentManagerStatics3_Interface'Class;
   type IAppointmentManagerStatics3_Ptr is access all IAppointmentManagerStatics3;
   type IAppointmentManagerForUser_Interface;
   type IAppointmentManagerForUser is access all IAppointmentManagerForUser_Interface'Class;
   type IAppointmentManagerForUser_Ptr is access all IAppointmentManagerForUser;
   type IAppointmentParticipant_Interface;
   type IAppointmentParticipant is access all IAppointmentParticipant_Interface'Class;
   type IAppointmentParticipant_Ptr is access all IAppointmentParticipant;
   type IAppointmentInvitee_Interface;
   type IAppointmentInvitee is access all IAppointmentInvitee_Interface'Class;
   type IAppointmentInvitee_Ptr is access all IAppointmentInvitee;
   type IAppointmentRecurrence_Interface;
   type IAppointmentRecurrence is access all IAppointmentRecurrence_Interface'Class;
   type IAppointmentRecurrence_Ptr is access all IAppointmentRecurrence;
   type IAppointmentRecurrence2_Interface;
   type IAppointmentRecurrence2 is access all IAppointmentRecurrence2_Interface'Class;
   type IAppointmentRecurrence2_Ptr is access all IAppointmentRecurrence2;
   type IAppointmentRecurrence3_Interface;
   type IAppointmentRecurrence3 is access all IAppointmentRecurrence3_Interface'Class;
   type IAppointmentRecurrence3_Ptr is access all IAppointmentRecurrence3;
   type IAppointment_Interface;
   type IAppointment is access all IAppointment_Interface'Class;
   type IAppointment_Ptr is access all IAppointment;
   type IAppointment2_Interface;
   type IAppointment2 is access all IAppointment2_Interface'Class;
   type IAppointment2_Ptr is access all IAppointment2;
   type IAppointment3_Interface;
   type IAppointment3 is access all IAppointment3_Interface'Class;
   type IAppointment3_Ptr is access all IAppointment3;
   type IFindAppointmentsOptions_Interface;
   type IFindAppointmentsOptions is access all IFindAppointmentsOptions_Interface'Class;
   type IFindAppointmentsOptions_Ptr is access all IFindAppointmentsOptions;
   type IAppointmentCalendar_Interface;
   type IAppointmentCalendar is access all IAppointmentCalendar_Interface'Class;
   type IAppointmentCalendar_Ptr is access all IAppointmentCalendar;
   type IAppointmentCalendar2_Interface;
   type IAppointmentCalendar2 is access all IAppointmentCalendar2_Interface'Class;
   type IAppointmentCalendar2_Ptr is access all IAppointmentCalendar2;
   type IAppointmentCalendar3_Interface;
   type IAppointmentCalendar3 is access all IAppointmentCalendar3_Interface'Class;
   type IAppointmentCalendar3_Ptr is access all IAppointmentCalendar3;
   type IAppointmentCalendarSyncManager_Interface;
   type IAppointmentCalendarSyncManager is access all IAppointmentCalendarSyncManager_Interface'Class;
   type IAppointmentCalendarSyncManager_Ptr is access all IAppointmentCalendarSyncManager;
   type IAppointmentCalendarSyncManager2_Interface;
   type IAppointmentCalendarSyncManager2 is access all IAppointmentCalendarSyncManager2_Interface'Class;
   type IAppointmentCalendarSyncManager2_Ptr is access all IAppointmentCalendarSyncManager2;
   type IAppointmentPropertiesStatics_Interface;
   type IAppointmentPropertiesStatics is access all IAppointmentPropertiesStatics_Interface'Class;
   type IAppointmentPropertiesStatics_Ptr is access all IAppointmentPropertiesStatics;
   type IAppointmentPropertiesStatics2_Interface;
   type IAppointmentPropertiesStatics2 is access all IAppointmentPropertiesStatics2_Interface'Class;
   type IAppointmentPropertiesStatics2_Ptr is access all IAppointmentPropertiesStatics2;
   type IAppointmentConflictResult_Interface;
   type IAppointmentConflictResult is access all IAppointmentConflictResult_Interface'Class;
   type IAppointmentConflictResult_Ptr is access all IAppointmentConflictResult;
   type IAppointmentStoreChange_Interface;
   type IAppointmentStoreChange is access all IAppointmentStoreChange_Interface'Class;
   type IAppointmentStoreChange_Ptr is access all IAppointmentStoreChange;
   type IAppointmentStoreChange2_Interface;
   type IAppointmentStoreChange2 is access all IAppointmentStoreChange2_Interface'Class;
   type IAppointmentStoreChange2_Ptr is access all IAppointmentStoreChange2;
   type IAppointmentStoreChangeReader_Interface;
   type IAppointmentStoreChangeReader is access all IAppointmentStoreChangeReader_Interface'Class;
   type IAppointmentStoreChangeReader_Ptr is access all IAppointmentStoreChangeReader;
   type IAppointmentStoreChangeTracker_Interface;
   type IAppointmentStoreChangeTracker is access all IAppointmentStoreChangeTracker_Interface'Class;
   type IAppointmentStoreChangeTracker_Ptr is access all IAppointmentStoreChangeTracker;
   type IAppointmentStoreChangeTracker2_Interface;
   type IAppointmentStoreChangeTracker2 is access all IAppointmentStoreChangeTracker2_Interface'Class;
   type IAppointmentStoreChangeTracker2_Ptr is access all IAppointmentStoreChangeTracker2;
   type IAppointmentStoreChangedEventArgs_Interface;
   type IAppointmentStoreChangedEventArgs is access all IAppointmentStoreChangedEventArgs_Interface'Class;
   type IAppointmentStoreChangedEventArgs_Ptr is access all IAppointmentStoreChangedEventArgs;
   type IAppointmentStoreChangedDeferral_Interface;
   type IAppointmentStoreChangedDeferral is access all IAppointmentStoreChangedDeferral_Interface'Class;
   type IAppointmentStoreChangedDeferral_Ptr is access all IAppointmentStoreChangedDeferral;
   type IAppointmentStoreNotificationTriggerDetails_Interface;
   type IAppointmentStoreNotificationTriggerDetails is access all IAppointmentStoreNotificationTriggerDetails_Interface'Class;
   type IAppointmentStoreNotificationTriggerDetails_Ptr is access all IAppointmentStoreNotificationTriggerDetails;
   type IAppointmentStore_Interface;
   type IAppointmentStore is access all IAppointmentStore_Interface'Class;
   type IAppointmentStore_Ptr is access all IAppointmentStore;
   type IAppointmentStore2_Interface;
   type IAppointmentStore2 is access all IAppointmentStore2_Interface'Class;
   type IAppointmentStore2_Ptr is access all IAppointmentStore2;
   type IAppointmentStore3_Interface;
   type IAppointmentStore3 is access all IAppointmentStore3_Interface'Class;
   type IAppointmentStore3_Ptr is access all IAppointmentStore3;
   type IAppointmentException_Interface;
   type IAppointmentException is access all IAppointmentException_Interface'Class;
   type IAppointmentException_Ptr is access all IAppointmentException;
   type IAsyncOperation_IAppointmentStore_Interface;
   type IAsyncOperation_IAppointmentStore is access all IAsyncOperation_IAppointmentStore_Interface'Class;
   type IAsyncOperation_IAppointmentStore_Ptr is access all IAsyncOperation_IAppointmentStore;
   type IIterator_IAppointmentInvitee_Interface;
   type IIterator_IAppointmentInvitee is access all IIterator_IAppointmentInvitee_Interface'Class;
   type IIterator_IAppointmentInvitee_Ptr is access all IIterator_IAppointmentInvitee;
   type IIterable_IAppointmentInvitee_Interface;
   type IIterable_IAppointmentInvitee is access all IIterable_IAppointmentInvitee_Interface'Class;
   type IIterable_IAppointmentInvitee_Ptr is access all IIterable_IAppointmentInvitee;
   type IVectorView_IAppointmentInvitee_Interface;
   type IVectorView_IAppointmentInvitee is access all IVectorView_IAppointmentInvitee_Interface'Class;
   type IVectorView_IAppointmentInvitee_Ptr is access all IVectorView_IAppointmentInvitee;
   type IVector_IAppointmentInvitee_Interface;
   type IVector_IAppointmentInvitee is access all IVector_IAppointmentInvitee_Interface'Class;
   type IVector_IAppointmentInvitee_Ptr is access all IVector_IAppointmentInvitee;
   type IAsyncOperation_IAppointment_Interface;
   type IAsyncOperation_IAppointment is access all IAsyncOperation_IAppointment_Interface'Class;
   type IAsyncOperation_IAppointment_Ptr is access all IAsyncOperation_IAppointment;
   type IAsyncOperation_IAppointmentCalendar_Interface;
   type IAsyncOperation_IAppointmentCalendar is access all IAsyncOperation_IAppointmentCalendar_Interface'Class;
   type IAsyncOperation_IAppointmentCalendar_Ptr is access all IAsyncOperation_IAppointmentCalendar;
   type IAsyncOperation_IAppointmentConflictResult_Interface;
   type IAsyncOperation_IAppointmentConflictResult is access all IAsyncOperation_IAppointmentConflictResult_Interface'Class;
   type IAsyncOperation_IAppointmentConflictResult_Ptr is access all IAsyncOperation_IAppointmentConflictResult;
   
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
   type IAppointmentManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowAddAppointmentAsync
   (
      This       : access IAppointmentManagerStatics_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowAddAppointmentWithPlacementAsync
   (
      This       : access IAppointmentManagerStatics_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowReplaceAppointmentAsync
   (
      This       : access IAppointmentManagerStatics_Interface
      ; appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowReplaceAppointmentWithPlacementAsync
   (
      This       : access IAppointmentManagerStatics_Interface
      ; appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowReplaceAppointmentWithPlacementAndDateAsync
   (
      This       : access IAppointmentManagerStatics_Interface
      ; appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; instanceStartDate : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowRemoveAppointmentAsync
   (
      This       : access IAppointmentManagerStatics_Interface
      ; appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowRemoveAppointmentWithPlacementAsync
   (
      This       : access IAppointmentManagerStatics_Interface
      ; appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowRemoveAppointmentWithPlacementAndDateAsync
   (
      This       : access IAppointmentManagerStatics_Interface
      ; appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; instanceStartDate : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowTimeFrameAsync
   (
      This       : access IAppointmentManagerStatics_Interface
      ; timeToShow : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentManagerStatics : aliased constant Windows.IID := (976288257, 23616, 18845, (179, 63, 164, 48, 80, 247, 79, 196 ));
   
   ------------------------------------------------------------------------
   type IAppointmentManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowAppointmentDetailsAsync
   (
      This       : access IAppointmentManagerStatics2_Interface
      ; appointmentId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowAppointmentDetailsWithDateAsync
   (
      This       : access IAppointmentManagerStatics2_Interface
      ; appointmentId : Windows.String
      ; instanceStartDate : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowEditNewAppointmentAsync
   (
      This       : access IAppointmentManagerStatics2_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestStoreAsync
   (
      This       : access IAppointmentManagerStatics2_Interface
      ; options : Windows.ApplicationModel.Appointments.AppointmentStoreAccessType
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentManagerStatics2 : aliased constant Windows.IID := (176289293, 53327, 16436, (175, 114, 163, 101, 115, 180, 95, 240 ));
   
   ------------------------------------------------------------------------
   type IAppointmentManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IAppointmentManagerStatics3_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentManagerStatics3 : aliased constant Windows.IID := (798679196, 45900, 19911, (163, 93, 202, 253, 136, 174, 62, 198 ));
   
   ------------------------------------------------------------------------
   type IAppointmentManagerForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowAddAppointmentAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowAddAppointmentWithPlacementAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowReplaceAppointmentAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowReplaceAppointmentWithPlacementAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowReplaceAppointmentWithPlacementAndDateAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; instanceStartDate : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowRemoveAppointmentAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowRemoveAppointmentWithPlacementAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowRemoveAppointmentWithPlacementAndDateAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; instanceStartDate : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowTimeFrameAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; timeToShow : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowAppointmentDetailsAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointmentId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowAppointmentDetailsWithDateAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointmentId : Windows.String
      ; instanceStartDate : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowEditNewAppointmentAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestStoreAsync
   (
      This       : access IAppointmentManagerForUser_Interface
      ; options : Windows.ApplicationModel.Appointments.AppointmentStoreAccessType
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IAppointmentManagerForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentManagerForUser : aliased constant Windows.IID := (1881543715, 29644, 18016, (179, 24, 176, 19, 101, 48, 42, 3 ));
   
   ------------------------------------------------------------------------
   type IAppointmentParticipant_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IAppointmentParticipant_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IAppointmentParticipant_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Address
   (
      This       : access IAppointmentParticipant_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Address
   (
      This       : access IAppointmentParticipant_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentParticipant : aliased constant Windows.IID := (1633560834, 38680, 18043, (131, 251, 178, 147, 161, 145, 33, 222 ));
   
   ------------------------------------------------------------------------
   type IAppointmentInvitee_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Role
   (
      This       : access IAppointmentInvitee_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentParticipantRole
   )
   return Windows.HRESULT is abstract;
   
   function put_Role
   (
      This       : access IAppointmentInvitee_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentParticipantRole
   )
   return Windows.HRESULT is abstract;
   
   function get_Response
   (
      This       : access IAppointmentInvitee_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentParticipantResponse
   )
   return Windows.HRESULT is abstract;
   
   function put_Response
   (
      This       : access IAppointmentInvitee_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentParticipantResponse
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentInvitee : aliased constant Windows.IID := (331286422, 38978, 18779, (176, 231, 239, 143, 121, 192, 112, 29 ));
   
   ------------------------------------------------------------------------
   type IAppointmentRecurrence_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Unit
   (
      This       : access IAppointmentRecurrence_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentRecurrenceUnit
   )
   return Windows.HRESULT is abstract;
   
   function put_Unit
   (
      This       : access IAppointmentRecurrence_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentRecurrenceUnit
   )
   return Windows.HRESULT is abstract;
   
   function get_Occurrences
   (
      This       : access IAppointmentRecurrence_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Occurrences
   (
      This       : access IAppointmentRecurrence_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Until
   (
      This       : access IAppointmentRecurrence_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Until
   (
      This       : access IAppointmentRecurrence_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Interval
   (
      This       : access IAppointmentRecurrence_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Interval
   (
      This       : access IAppointmentRecurrence_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DaysOfWeek
   (
      This       : access IAppointmentRecurrence_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentDaysOfWeek
   )
   return Windows.HRESULT is abstract;
   
   function put_DaysOfWeek
   (
      This       : access IAppointmentRecurrence_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentDaysOfWeek
   )
   return Windows.HRESULT is abstract;
   
   function get_WeekOfMonth
   (
      This       : access IAppointmentRecurrence_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentWeekOfMonth
   )
   return Windows.HRESULT is abstract;
   
   function put_WeekOfMonth
   (
      This       : access IAppointmentRecurrence_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentWeekOfMonth
   )
   return Windows.HRESULT is abstract;
   
   function get_Month
   (
      This       : access IAppointmentRecurrence_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Month
   (
      This       : access IAppointmentRecurrence_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Day
   (
      This       : access IAppointmentRecurrence_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Day
   (
      This       : access IAppointmentRecurrence_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentRecurrence : aliased constant Windows.IID := (3631955587, 5542, 18555, (185, 89, 12, 54, 30, 96, 233, 84 ));
   
   ------------------------------------------------------------------------
   type IAppointmentRecurrence2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RecurrenceType
   (
      This       : access IAppointmentRecurrence2_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.RecurrenceType
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeZone
   (
      This       : access IAppointmentRecurrence2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TimeZone
   (
      This       : access IAppointmentRecurrence2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentRecurrence2 : aliased constant Windows.IID := (1039377120, 1447, 20304, (159, 134, 176, 63, 148, 54, 37, 77 ));
   
   ------------------------------------------------------------------------
   type IAppointmentRecurrence3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CalendarIdentifier
   (
      This       : access IAppointmentRecurrence3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentRecurrence3 : aliased constant Windows.IID := (2315228889, 55885, 18967, (141, 210, 28, 235, 194, 181, 255, 157 ));
   
   ------------------------------------------------------------------------
   type IAppointment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartTime
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_StartTime
   (
      This       : access IAppointment_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access IAppointment_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Location
   (
      This       : access IAppointment_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Subject
   (
      This       : access IAppointment_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Details
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Details
   (
      This       : access IAppointment_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Reminder
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Reminder
   (
      This       : access IAppointment_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Organizer
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentParticipant
   )
   return Windows.HRESULT is abstract;
   
   function put_Organizer
   (
      This       : access IAppointment_Interface
      ; value : Windows.ApplicationModel.Appointments.IAppointmentParticipant
   )
   return Windows.HRESULT is abstract;
   
   function get_Invitees
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IVector_IAppointmentInvitee -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Recurrence
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function put_Recurrence
   (
      This       : access IAppointment_Interface
      ; value : Windows.ApplicationModel.Appointments.IAppointmentRecurrence
   )
   return Windows.HRESULT is abstract;
   
   function get_BusyStatus
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentBusyStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_BusyStatus
   (
      This       : access IAppointment_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentBusyStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_AllDay
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllDay
   (
      This       : access IAppointment_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Sensitivity
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentSensitivity
   )
   return Windows.HRESULT is abstract;
   
   function put_Sensitivity
   (
      This       : access IAppointment_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentSensitivity
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IAppointment_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Uri
   (
      This       : access IAppointment_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointment : aliased constant Windows.IID := (3707776815, 11229, 16502, (144, 163, 34, 194, 117, 49, 41, 101 ));
   
   ------------------------------------------------------------------------
   type IAppointment2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalId
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CalendarId
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RoamingId
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RoamingId
   (
      This       : access IAppointment2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginalStartTime
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsResponseRequested
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsResponseRequested
   (
      This       : access IAppointment2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowNewTimeProposal
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowNewTimeProposal
   (
      This       : access IAppointment2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_OnlineMeetingLink
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_OnlineMeetingLink
   (
      This       : access IAppointment2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ReplyTime
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ReplyTime
   (
      This       : access IAppointment2_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_UserResponse
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentParticipantResponse
   )
   return Windows.HRESULT is abstract;
   
   function put_UserResponse
   (
      This       : access IAppointment2_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentParticipantResponse
   )
   return Windows.HRESULT is abstract;
   
   function get_HasInvitees
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCanceledMeeting
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCanceledMeeting
   (
      This       : access IAppointment2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOrganizedByUser
   (
      This       : access IAppointment2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsOrganizedByUser
   (
      This       : access IAppointment2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointment2 : aliased constant Windows.IID := (1585813564, 21519, 13394, (155, 92, 13, 215, 173, 76, 101, 162 ));
   
   ------------------------------------------------------------------------
   type IAppointment3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeNumber
   (
      This       : access IAppointment3_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteChangeNumber
   (
      This       : access IAppointment3_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteChangeNumber
   (
      This       : access IAppointment3_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_DetailsKind
   (
      This       : access IAppointment3_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentDetailsKind
   )
   return Windows.HRESULT is abstract;
   
   function put_DetailsKind
   (
      This       : access IAppointment3_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentDetailsKind
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointment3 : aliased constant Windows.IID := (3217835433, 35169, 18833, (147, 75, 196, 135, 104, 229, 169, 108 ));
   
   ------------------------------------------------------------------------
   type IFindAppointmentsOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CalendarIds
   (
      This       : access IFindAppointmentsOptions_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FetchProperties
   (
      This       : access IFindAppointmentsOptions_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeHidden
   (
      This       : access IFindAppointmentsOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IncludeHidden
   (
      This       : access IFindAppointmentsOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxCount
   (
      This       : access IFindAppointmentsOptions_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxCount
   (
      This       : access IFindAppointmentsOptions_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IFindAppointmentsOptions : aliased constant Windows.IID := (1442307157, 39234, 12422, (130, 181, 44, 178, 159, 100, 213, 245 ));
   
   ------------------------------------------------------------------------
   type IAppointmentCalendar_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayColor
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IAppointmentCalendar_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalId
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHidden
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherAppReadAccess
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentCalendarOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function put_OtherAppReadAccess
   (
      This       : access IAppointmentCalendar_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentCalendarOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherAppWriteAccess
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentCalendarOtherAppWriteAccess
   )
   return Windows.HRESULT is abstract;
   
   function put_OtherAppWriteAccess
   (
      This       : access IAppointmentCalendar_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentCalendarOtherAppWriteAccess
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceDisplayName
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SummaryCardView
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentSummaryCardView
   )
   return Windows.HRESULT is abstract;
   
   function put_SummaryCardView
   (
      This       : access IAppointmentCalendar_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentSummaryCardView
   )
   return Windows.HRESULT is abstract;
   
   function FindAppointmentsAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; rangeStart : Windows.Foundation.DateTime
      ; rangeLength : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAppointmentsAsyncWithOptions
   (
      This       : access IAppointmentCalendar_Interface
      ; rangeStart : Windows.Foundation.DateTime
      ; rangeLength : Windows.Foundation.TimeSpan
      ; options : Windows.ApplicationModel.Appointments.IFindAppointmentsOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindExceptionsFromMasterAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; masterLocalId : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllInstancesAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; masterLocalId : Windows.String
      ; rangeStart : Windows.Foundation.DateTime
      ; rangeLength : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllInstancesAsyncWithOptions
   (
      This       : access IAppointmentCalendar_Interface
      ; masterLocalId : Windows.String
      ; rangeStart : Windows.Foundation.DateTime
      ; rangeLength : Windows.Foundation.TimeSpan
      ; pOptions : Windows.ApplicationModel.Appointments.IFindAppointmentsOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppointmentAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; localId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppointmentInstanceAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; localId : Windows.String
      ; instanceStartTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindUnexpandedAppointmentsAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindUnexpandedAppointmentsAsyncWithOptions
   (
      This       : access IAppointmentCalendar_Interface
      ; options : Windows.ApplicationModel.Appointments.IFindAppointmentsOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAppointmentAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; localId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAppointmentInstanceAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; localId : Windows.String
      ; instanceStartTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SaveAppointmentAsync
   (
      This       : access IAppointmentCalendar_Interface
      ; pAppointment : Windows.ApplicationModel.Appointments.IAppointment
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentCalendar : aliased constant Windows.IID := (1383301533, 33593, 15695, (160, 47, 100, 8, 68, 82, 187, 93 ));
   
   ------------------------------------------------------------------------
   type IAppointmentCalendar2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SyncManager
   (
      This       : access IAppointmentCalendar2_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentCalendarSyncManager
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access IAppointmentCalendar2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access IAppointmentCalendar2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayColor
   (
      This       : access IAppointmentCalendar2_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_IsHidden
   (
      This       : access IAppointmentCalendar2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_UserDataAccountId
   (
      This       : access IAppointmentCalendar2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CanCreateOrUpdateAppointments
   (
      This       : access IAppointmentCalendar2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanCreateOrUpdateAppointments
   (
      This       : access IAppointmentCalendar2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanCancelMeetings
   (
      This       : access IAppointmentCalendar2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanCancelMeetings
   (
      This       : access IAppointmentCalendar2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanForwardMeetings
   (
      This       : access IAppointmentCalendar2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanForwardMeetings
   (
      This       : access IAppointmentCalendar2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanProposeNewTimeForMeetings
   (
      This       : access IAppointmentCalendar2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanProposeNewTimeForMeetings
   (
      This       : access IAppointmentCalendar2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanUpdateMeetingResponses
   (
      This       : access IAppointmentCalendar2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanUpdateMeetingResponses
   (
      This       : access IAppointmentCalendar2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanNotifyInvitees
   (
      This       : access IAppointmentCalendar2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanNotifyInvitees
   (
      This       : access IAppointmentCalendar2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MustNofityInvitees
   (
      This       : access IAppointmentCalendar2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_MustNofityInvitees
   (
      This       : access IAppointmentCalendar2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateOrUpdateAppointmentAsync
   (
      This       : access IAppointmentCalendar2_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; notifyInvitees : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryCancelMeetingAsync
   (
      This       : access IAppointmentCalendar2_Interface
      ; meeting : Windows.ApplicationModel.Appointments.IAppointment
      ; subject : Windows.String
      ; comment : Windows.String
      ; notifyInvitees : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryForwardMeetingAsync
   (
      This       : access IAppointmentCalendar2_Interface
      ; meeting : Windows.ApplicationModel.Appointments.IAppointment
      ; invitees : Windows.ApplicationModel.Appointments.IIterable_IAppointmentInvitee
      ; subject : Windows.String
      ; forwardHeader : Windows.String
      ; comment : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryProposeNewTimeForMeetingAsync
   (
      This       : access IAppointmentCalendar2_Interface
      ; meeting : Windows.ApplicationModel.Appointments.IAppointment
      ; newStartTime : Windows.Foundation.DateTime
      ; newDuration : Windows.Foundation.TimeSpan
      ; subject : Windows.String
      ; comment : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdateMeetingResponseAsync
   (
      This       : access IAppointmentCalendar2_Interface
      ; meeting : Windows.ApplicationModel.Appointments.IAppointment
      ; response : Windows.ApplicationModel.Appointments.AppointmentParticipantResponse
      ; subject : Windows.String
      ; comment : Windows.String
      ; sendUpdate : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentCalendar2 : aliased constant Windows.IID := (417850402, 9319, 19996, (164, 89, 216, 162, 147, 3, 208, 146 ));
   
   ------------------------------------------------------------------------
   type IAppointmentCalendar3_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterSyncManagerAsync
   (
      This       : access IAppointmentCalendar3_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentCalendar3 : aliased constant Windows.IID := (3944993323, 42629, 17070, (132, 149, 179, 17, 154, 219, 65, 103 ));
   
   ------------------------------------------------------------------------
   type IAppointmentCalendarSyncManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IAppointmentCalendarSyncManager_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentCalendarSyncStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_LastSuccessfulSyncTime
   (
      This       : access IAppointmentCalendarSyncManager_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_LastAttemptedSyncTime
   (
      This       : access IAppointmentCalendarSyncManager_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function SyncAsync
   (
      This       : access IAppointmentCalendarSyncManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_SyncStatusChanged
   (
      This       : access IAppointmentCalendarSyncManager_Interface
      ; handler : TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SyncStatusChanged
   (
      This       : access IAppointmentCalendarSyncManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentCalendarSyncManager : aliased constant Windows.IID := (723628960, 19199, 17298, (188, 95, 86, 69, 255, 207, 251, 23 ));
   
   ------------------------------------------------------------------------
   type IAppointmentCalendarSyncManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Status
   (
      This       : access IAppointmentCalendarSyncManager2_Interface
      ; value : Windows.ApplicationModel.Appointments.AppointmentCalendarSyncStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_LastSuccessfulSyncTime
   (
      This       : access IAppointmentCalendarSyncManager2_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_LastAttemptedSyncTime
   (
      This       : access IAppointmentCalendarSyncManager2_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentCalendarSyncManager2 : aliased constant Windows.IID := (1685399725, 3369, 19580, (170, 167, 191, 153, 104, 5, 83, 124 ));
   
   ------------------------------------------------------------------------
   type IAppointmentPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Subject
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTime
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Reminder
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BusyStatus
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sensitivity
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginalStartTime
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsResponseRequested
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowNewTimeProposal
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AllDay
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Details
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OnlineMeetingLink
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ReplyTime
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Organizer
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserResponse
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HasInvitees
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCanceledMeeting
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOrganizedByUser
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Recurrence
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Invitees
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultProperties
   (
      This       : access IAppointmentPropertiesStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentPropertiesStatics : aliased constant Windows.IID := (622075881, 26798, 15022, (133, 95, 188, 68, 65, 202, 162, 52 ));
   
   ------------------------------------------------------------------------
   type IAppointmentPropertiesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeNumber
   (
      This       : access IAppointmentPropertiesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteChangeNumber
   (
      This       : access IAppointmentPropertiesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DetailsKind
   (
      This       : access IAppointmentPropertiesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentPropertiesStatics2 : aliased constant Windows.IID := (3757851467, 45079, 17885, (138, 245, 209, 99, 209, 8, 1, 187 ));
   
   ------------------------------------------------------------------------
   type IAppointmentConflictResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IAppointmentConflictResult_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentConflictType
   )
   return Windows.HRESULT is abstract;
   
   function get_Date
   (
      This       : access IAppointmentConflictResult_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentConflictResult : aliased constant Windows.IID := (3587043518, 12079, 15229, (175, 10, 167, 226, 15, 58, 70, 227 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStoreChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Appointment
   (
      This       : access IAppointmentStoreChange_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointment
   )
   return Windows.HRESULT is abstract;
   
   function get_ChangeType
   (
      This       : access IAppointmentStoreChange_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentStoreChangeType
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentStoreChange : aliased constant Windows.IID := (2779177013, 2611, 13908, (132, 99, 181, 67, 233, 12, 59, 121 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStoreChange2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppointmentCalendar
   (
      This       : access IAppointmentStoreChange2_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentCalendar
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentStoreChange2 : aliased constant Windows.IID := (3011317198, 21009, 17410, (166, 8, 169, 111, 231, 11, 142, 226 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStoreChangeReader_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchAsync
   (
      This       : access IAppointmentStoreChangeReader_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AcceptChanges
   (
      This       : access IAppointmentStoreChangeReader_Interface
   )
   return Windows.HRESULT is abstract;
   
   function AcceptChangesThrough
   (
      This       : access IAppointmentStoreChangeReader_Interface
      ; lastChangeToAccept : Windows.ApplicationModel.Appointments.IAppointmentStoreChange
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentStoreChangeReader : aliased constant Windows.IID := (2334394865, 26099, 17056, (150, 29, 76, 32, 155, 243, 3, 112 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStoreChangeTracker_Interface is interface and Windows.IInspectable_Interface;
   
   function GetChangeReader
   (
      This       : access IAppointmentStoreChangeTracker_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentStoreChangeReader
   )
   return Windows.HRESULT is abstract;
   
   function Enable
   (
      This       : access IAppointmentStoreChangeTracker_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Reset
   (
      This       : access IAppointmentStoreChangeTracker_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentStoreChangeTracker : aliased constant Windows.IID := (455472305, 36558, 20247, (147, 200, 230, 65, 36, 88, 253, 92 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStoreChangeTracker2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTracking
   (
      This       : access IAppointmentStoreChangeTracker2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentStoreChangeTracker2 : aliased constant Windows.IID := (3060444997, 38210, 19703, (133, 80, 235, 55, 14, 12, 8, 211 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStoreChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IAppointmentStoreChangedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentStoreChangedDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentStoreChangedEventArgs : aliased constant Windows.IID := (579205305, 1937, 16766, (191, 234, 204, 109, 65, 99, 108, 140 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStoreChangedDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IAppointmentStoreChangedDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentStoreChangedDeferral : aliased constant Windows.IID := (1287135270, 65243, 19395, (150, 98, 149, 169, 190, 253, 244, 223 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStoreNotificationTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IAppointmentStoreNotificationTriggerDetails : aliased constant Windows.IID := (2603862801, 49921, 16926, (175, 239, 4, 126, 207, 167, 106, 219 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStore_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeTracker
   (
      This       : access IAppointmentStore_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentStoreChangeTracker
   )
   return Windows.HRESULT is abstract;
   
   function CreateAppointmentCalendarAsync
   (
      This       : access IAppointmentStore_Interface
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentCalendar -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppointmentCalendarAsync
   (
      This       : access IAppointmentStore_Interface
      ; calendarId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentCalendar -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppointmentAsync
   (
      This       : access IAppointmentStore_Interface
      ; localId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppointmentInstanceAsync
   (
      This       : access IAppointmentStore_Interface
      ; localId : Windows.String
      ; instanceStartTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAppointmentCalendarsAsync
   (
      This       : access IAppointmentStore_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAppointmentCalendarsAsyncWithOptions
   (
      This       : access IAppointmentStore_Interface
      ; options : Windows.ApplicationModel.Appointments.FindAppointmentCalendarsOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAppointmentsAsync
   (
      This       : access IAppointmentStore_Interface
      ; rangeStart : Windows.Foundation.DateTime
      ; rangeLength : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAppointmentsAsyncWithOptions
   (
      This       : access IAppointmentStore_Interface
      ; rangeStart : Windows.Foundation.DateTime
      ; rangeLength : Windows.Foundation.TimeSpan
      ; options : Windows.ApplicationModel.Appointments.IFindAppointmentsOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindConflictAsync
   (
      This       : access IAppointmentStore_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentConflictResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindConflictAsyncWithInstanceStart
   (
      This       : access IAppointmentStore_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; instanceStartTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentConflictResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function MoveAppointmentAsync
   (
      This       : access IAppointmentStore_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; destinationCalendar : Windows.ApplicationModel.Appointments.IAppointmentCalendar
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowAddAppointmentAsync
   (
      This       : access IAppointmentStore_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowReplaceAppointmentAsync
   (
      This       : access IAppointmentStore_Interface
      ; localId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowReplaceAppointmentWithPlacementAndDateAsync
   (
      This       : access IAppointmentStore_Interface
      ; localId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; instanceStartDate : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowRemoveAppointmentAsync
   (
      This       : access IAppointmentStore_Interface
      ; localId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowRemoveAppointmentWithPlacementAndDateAsync
   (
      This       : access IAppointmentStore_Interface
      ; localId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; instanceStartDate : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowAppointmentDetailsAsync
   (
      This       : access IAppointmentStore_Interface
      ; localId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowAppointmentDetailsWithDateAsync
   (
      This       : access IAppointmentStore_Interface
      ; localId : Windows.String
      ; instanceStartDate : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowEditNewAppointmentAsync
   (
      This       : access IAppointmentStore_Interface
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindLocalIdsFromRoamingIdAsync
   (
      This       : access IAppointmentStore_Interface
      ; roamingId : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentStore : aliased constant Windows.IID := (2757857676, 31303, 19862, (150, 201, 21, 205, 138, 5, 167, 53 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStore2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_StoreChanged
   (
      This       : access IAppointmentStore2_Interface
      ; pHandler : TypedEventHandler_IAppointmentStore2_add_StoreChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StoreChanged
   (
      This       : access IAppointmentStore2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CreateAppointmentCalendarInAccountAsync
   (
      This       : access IAppointmentStore2_Interface
      ; name : Windows.String
      ; userDataAccountId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentCalendar -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentStore2 : aliased constant Windows.IID := (633637920, 7233, 16975, (128, 132, 103, 193, 207, 224, 168, 84 ));
   
   ------------------------------------------------------------------------
   type IAppointmentStore3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetChangeTracker
   (
      This       : access IAppointmentStore3_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentStoreChangeTracker
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentStore3 : aliased constant Windows.IID := (1112642571, 45176, 18186, (154, 64, 194, 224, 23, 97, 247, 47 ));
   
   ------------------------------------------------------------------------
   type IAppointmentException_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Appointment
   (
      This       : access IAppointmentException_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointment
   )
   return Windows.HRESULT is abstract;
   
   function get_ExceptionProperties
   (
      This       : access IAppointmentException_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDeleted
   (
      This       : access IAppointmentException_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IAppointmentException : aliased constant Windows.IID := (2718394215, 5878, 19406, (159, 90, 134, 0, 184, 1, 159, 203 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IAppointmentStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAppointmentStore_Interface
      ; handler : Windows.ApplicationModel.Appointments.AsyncOperationCompletedHandler_IAppointmentStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAppointmentStore_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AsyncOperationCompletedHandler_IAppointmentStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAppointmentStore_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentStore
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IAppointmentStore : aliased constant Windows.IID := (1668908053, 19743, 24519, (135, 41, 121, 162, 130, 188, 236, 164 ));
   
   ------------------------------------------------------------------------
   type IIterator_IAppointmentInvitee_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAppointmentInvitee_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentInvitee
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAppointmentInvitee_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAppointmentInvitee_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAppointmentInvitee_Interface
      ; items : Windows.ApplicationModel.Appointments.IAppointmentInvitee_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IAppointmentInvitee : aliased constant Windows.IID := (1474515352, 6977, 21722, (173, 175, 80, 239, 30, 147, 253, 237 ));
   
   ------------------------------------------------------------------------
   type IIterable_IAppointmentInvitee_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAppointmentInvitee_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IIterator_IAppointmentInvitee
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IAppointmentInvitee : aliased constant Windows.IID := (4220983465, 61529, 21168, (169, 4, 26, 101, 228, 40, 30, 64 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IAppointmentInvitee_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAppointmentInvitee_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentInvitee
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAppointmentInvitee_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAppointmentInvitee_Interface
      ; value : Windows.ApplicationModel.Appointments.IAppointmentInvitee
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAppointmentInvitee_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Appointments.IAppointmentInvitee_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IAppointmentInvitee : aliased constant Windows.IID := (3123667770, 20866, 24282, (142, 46, 166, 110, 85, 179, 32, 206 ));
   
   ------------------------------------------------------------------------
   type IVector_IAppointmentInvitee_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IAppointmentInvitee_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentInvitee
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IAppointmentInvitee_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IAppointmentInvitee_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IVectorView_IAppointmentInvitee
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IAppointmentInvitee_Interface
      ; value : Windows.ApplicationModel.Appointments.IAppointmentInvitee
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IAppointmentInvitee_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Appointments.IAppointmentInvitee
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IAppointmentInvitee_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Appointments.IAppointmentInvitee
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IAppointmentInvitee_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IAppointmentInvitee_Interface
      ; value : Windows.ApplicationModel.Appointments.IAppointmentInvitee
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IAppointmentInvitee_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IAppointmentInvitee_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IAppointmentInvitee_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Appointments.IAppointmentInvitee_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IAppointmentInvitee_Interface
      ; items : Windows.ApplicationModel.Appointments.IAppointmentInvitee_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IAppointmentInvitee : aliased constant Windows.IID := (1895084846, 63774, 21947, (154, 146, 2, 70, 218, 115, 75, 176 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IAppointment_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAppointment_Interface
      ; handler : Windows.ApplicationModel.Appointments.AsyncOperationCompletedHandler_IAppointment
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAppointment_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AsyncOperationCompletedHandler_IAppointment
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAppointment_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointment
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IAppointment : aliased constant Windows.IID := (207041272, 23481, 23475, (147, 229, 184, 126, 67, 224, 205, 106 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IAppointmentCalendar_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAppointmentCalendar_Interface
      ; handler : Windows.ApplicationModel.Appointments.AsyncOperationCompletedHandler_IAppointmentCalendar
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAppointmentCalendar_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AsyncOperationCompletedHandler_IAppointmentCalendar
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAppointmentCalendar_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentCalendar
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IAppointmentCalendar : aliased constant Windows.IID := (1806793365, 37262, 23248, (187, 194, 188, 197, 250, 31, 249, 54 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IAppointmentConflictResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAppointmentConflictResult_Interface
      ; handler : Windows.ApplicationModel.Appointments.AsyncOperationCompletedHandler_IAppointmentConflictResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAppointmentConflictResult_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AsyncOperationCompletedHandler_IAppointmentConflictResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAppointmentConflictResult_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointmentConflictResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IAppointmentConflictResult : aliased constant Windows.IID := (3010856975, 58802, 23266, (153, 1, 134, 207, 119, 186, 93, 0 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IAppointmentStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IAppointmentStore_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAppointmentStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IAppointmentStore : aliased constant Windows.IID := (3167710506, 43890, 24355, (183, 213, 76, 44, 155, 212, 91, 121 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IAppointment_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointment ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IAppointment_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAppointment_Interface
      ; asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointment
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IAppointment : aliased constant Windows.IID := (3057708292, 37681, 23336, (146, 71, 1, 70, 188, 245, 183, 42 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Appointments.IAppointmentCalendarSyncManager ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged_Interface
      ; sender : Windows.ApplicationModel.Appointments.IAppointmentCalendarSyncManager
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged : aliased constant Windows.IID := (3172141278, 27950, 21825, (178, 84, 189, 182, 24, 57, 186, 193 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IAppointmentCalendar_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentCalendar ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IAppointmentCalendar_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAppointmentCalendar_Interface
      ; asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentCalendar
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IAppointmentCalendar : aliased constant Windows.IID := (1838986833, 23286, 20912, (156, 211, 69, 221, 81, 241, 121, 73 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IAppointmentConflictResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentConflictResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IAppointmentConflictResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAppointmentConflictResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentConflictResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IAppointmentConflictResult : aliased constant Windows.IID := (2197504254, 1457, 21052, (155, 83, 179, 221, 117, 156, 159, 117 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAppointmentStore2_add_StoreChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Appointments.IAppointmentStore ; args : Windows.ApplicationModel.Appointments.IAppointmentStoreChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAppointmentStore2_add_StoreChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentStore2_add_StoreChanged_Interface
      ; sender : Windows.ApplicationModel.Appointments.IAppointmentStore
      ; args : Windows.ApplicationModel.Appointments.IAppointmentStoreChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAppointmentStore2_add_StoreChanged : aliased constant Windows.IID := (2657256273, 50745, 23791, (171, 29, 139, 234, 233, 215, 93, 82 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Appointment is Windows.ApplicationModel.Appointments.IAppointment;
   
   function CreateAppointment return Windows.ApplicationModel.Appointments.IAppointment;
   
   subtype AppointmentStore is Windows.ApplicationModel.Appointments.IAppointmentStore;
   subtype AppointmentManagerForUser is Windows.ApplicationModel.Appointments.IAppointmentManagerForUser;
   subtype AppointmentOrganizer is Windows.ApplicationModel.Appointments.IAppointmentParticipant;
   
   function CreateAppointmentOrganizer return Windows.ApplicationModel.Appointments.IAppointmentParticipant;
   
   subtype AppointmentInvitee is Windows.ApplicationModel.Appointments.IAppointmentInvitee;
   
   function CreateAppointmentInvitee return Windows.ApplicationModel.Appointments.IAppointmentInvitee;
   
   subtype AppointmentRecurrence is Windows.ApplicationModel.Appointments.IAppointmentRecurrence;
   
   function CreateAppointmentRecurrence return Windows.ApplicationModel.Appointments.IAppointmentRecurrence;
   
   subtype FindAppointmentsOptions is Windows.ApplicationModel.Appointments.IFindAppointmentsOptions;
   
   function CreateFindAppointmentsOptions return Windows.ApplicationModel.Appointments.IFindAppointmentsOptions;
   
   subtype AppointmentException is Windows.ApplicationModel.Appointments.IAppointmentException;
   subtype AppointmentCalendarSyncManager is Windows.ApplicationModel.Appointments.IAppointmentCalendarSyncManager;
   subtype AppointmentCalendar is Windows.ApplicationModel.Appointments.IAppointmentCalendar;
   subtype AppointmentStoreChange is Windows.ApplicationModel.Appointments.IAppointmentStoreChange;
   subtype AppointmentStoreChangeReader is Windows.ApplicationModel.Appointments.IAppointmentStoreChangeReader;
   subtype AppointmentStoreChangedDeferral is Windows.ApplicationModel.Appointments.IAppointmentStoreChangedDeferral;
   subtype AppointmentStoreChangeTracker is Windows.ApplicationModel.Appointments.IAppointmentStoreChangeTracker;
   subtype AppointmentConflictResult is Windows.ApplicationModel.Appointments.IAppointmentConflictResult;
   subtype AppointmentStoreChangedEventArgs is Windows.ApplicationModel.Appointments.IAppointmentStoreChangedEventArgs;
   subtype AppointmentStoreNotificationTriggerDetails is Windows.ApplicationModel.Appointments.IAppointmentStoreNotificationTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Appointments.IAppointmentManagerForUser;
   
   function ShowAppointmentDetailsAsync
   (
      appointmentId : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function ShowAppointmentDetailsWithDateAsync
   (
      appointmentId : Windows.String
      ; instanceStartDate : Windows.Foundation.DateTime
   )
   return Windows.Foundation.IAsyncAction;
   
   function ShowEditNewAppointmentAsync
   (
      appointment : Windows.ApplicationModel.Appointments.IAppointment
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function RequestStoreAsync
   (
      options : Windows.ApplicationModel.Appointments.AppointmentStoreAccessType
   )
   return Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentStore;
   
   function ShowAddAppointmentAsync
   (
      appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function ShowAddAppointmentWithPlacementAsync
   (
      appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function ShowReplaceAppointmentAsync
   (
      appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function ShowReplaceAppointmentWithPlacementAsync
   (
      appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function ShowReplaceAppointmentWithPlacementAndDateAsync
   (
      appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; instanceStartDate : Windows.Foundation.DateTime
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function ShowRemoveAppointmentAsync
   (
      appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function ShowRemoveAppointmentWithPlacementAsync
   (
      appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function ShowRemoveAppointmentWithPlacementAndDateAsync
   (
      appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; instanceStartDate : Windows.Foundation.DateTime
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function ShowTimeFrameAsync
   (
      timeToShow : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.Foundation.IAsyncAction;
   
   function get_Subject
   return Windows.String;
   
   function get_Location
   return Windows.String;
   
   function get_StartTime
   return Windows.String;
   
   function get_Duration
   return Windows.String;
   
   function get_Reminder
   return Windows.String;
   
   function get_BusyStatus
   return Windows.String;
   
   function get_Sensitivity
   return Windows.String;
   
   function get_OriginalStartTime
   return Windows.String;
   
   function get_IsResponseRequested
   return Windows.String;
   
   function get_AllowNewTimeProposal
   return Windows.String;
   
   function get_AllDay
   return Windows.String;
   
   function get_Details
   return Windows.String;
   
   function get_OnlineMeetingLink
   return Windows.String;
   
   function get_ReplyTime
   return Windows.String;
   
   function get_Organizer
   return Windows.String;
   
   function get_UserResponse
   return Windows.String;
   
   function get_HasInvitees
   return Windows.String;
   
   function get_IsCanceledMeeting
   return Windows.String;
   
   function get_IsOrganizedByUser
   return Windows.String;
   
   function get_Recurrence
   return Windows.String;
   
   function get_Uri
   return Windows.String;
   
   function get_Invitees
   return Windows.String;
   
   function get_DefaultProperties
   return Windows.Foundation.Collections.IVector_String;
   
   function get_ChangeNumber
   return Windows.String;
   
   function get_RemoteChangeNumber
   return Windows.String;
   
   function get_DetailsKind
   return Windows.String;

end;
