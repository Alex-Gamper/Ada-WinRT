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
limited with Windows.System;
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.UserDataTasks is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type UserDataTaskStoreAccessType is (
      AppTasksReadWrite,
      AllTasksLimitedReadWrite
   );
   for UserDataTaskStoreAccessType use (
      AppTasksReadWrite => 0,
      AllTasksLimitedReadWrite => 1
   );
   for UserDataTaskStoreAccessType'Size use 32;
   
   type UserDataTaskStoreAccessType_Ptr is access UserDataTaskStoreAccessType;
   
   type UserDataTaskListOtherAppReadAccess is (
      Full,
      SystemOnly,
      None
   );
   for UserDataTaskListOtherAppReadAccess use (
      Full => 0,
      SystemOnly => 1,
      None => 2
   );
   for UserDataTaskListOtherAppReadAccess'Size use 32;
   
   type UserDataTaskListOtherAppReadAccess_Ptr is access UserDataTaskListOtherAppReadAccess;
   
   type UserDataTaskListOtherAppWriteAccess is (
      Limited_x,
      None
   );
   for UserDataTaskListOtherAppWriteAccess use (
      Limited_x => 0,
      None => 1
   );
   for UserDataTaskListOtherAppWriteAccess'Size use 32;
   
   type UserDataTaskListOtherAppWriteAccess_Ptr is access UserDataTaskListOtherAppWriteAccess;
   
   type UserDataTaskKind is (
      Single,
      Recurring,
      Regenerating
   );
   for UserDataTaskKind use (
      Single => 0,
      Recurring => 1,
      Regenerating => 2
   );
   for UserDataTaskKind'Size use 32;
   
   type UserDataTaskKind_Ptr is access UserDataTaskKind;
   
   type UserDataTaskPriority is (
      Low,
      Normal,
      High
   );
   for UserDataTaskPriority use (
      Low => -1,
      Normal => 0,
      High => 1
   );
   for UserDataTaskPriority'Size use 32;
   
   type UserDataTaskPriority_Ptr is access UserDataTaskPriority;
   
   type UserDataTaskSensitivity is (
      Public,
      Private_x
   );
   for UserDataTaskSensitivity use (
      Public => 0,
      Private_x => 1
   );
   for UserDataTaskSensitivity'Size use 32;
   
   type UserDataTaskSensitivity_Ptr is access UserDataTaskSensitivity;
   
   type UserDataTaskDetailsKind is (
      PlainText,
      Html
   );
   for UserDataTaskDetailsKind use (
      PlainText => 0,
      Html => 1
   );
   for UserDataTaskDetailsKind'Size use 32;
   
   type UserDataTaskDetailsKind_Ptr is access UserDataTaskDetailsKind;
   
   type UserDataTaskRecurrenceUnit is (
      Daily,
      Weekly,
      Monthly,
      MonthlyOnDay,
      Yearly,
      YearlyOnDay
   );
   for UserDataTaskRecurrenceUnit use (
      Daily => 0,
      Weekly => 1,
      Monthly => 2,
      MonthlyOnDay => 3,
      Yearly => 4,
      YearlyOnDay => 5
   );
   for UserDataTaskRecurrenceUnit'Size use 32;
   
   type UserDataTaskRecurrenceUnit_Ptr is access UserDataTaskRecurrenceUnit;
   
   type UserDataTaskRegenerationUnit is (
      Daily,
      Weekly,
      Monthly,
      Yearly
   );
   for UserDataTaskRegenerationUnit use (
      Daily => 0,
      Weekly => 1,
      Monthly => 2,
      Yearly => 4
   );
   for UserDataTaskRegenerationUnit'Size use 32;
   
   type UserDataTaskRegenerationUnit_Ptr is access UserDataTaskRegenerationUnit;
   
   type UserDataTaskDaysOfWeek is (
      None,
      Sunday,
      Monday,
      Tuesday,
      Wednesday,
      Thursday,
      Friday,
      Saturday
   );
   for UserDataTaskDaysOfWeek use (
      None => 0,
      Sunday => 1,
      Monday => 2,
      Tuesday => 4,
      Wednesday => 8,
      Thursday => 16,
      Friday => 32,
      Saturday => 64
   );
   for UserDataTaskDaysOfWeek'Size use 32;
   
   type UserDataTaskDaysOfWeek_Ptr is access UserDataTaskDaysOfWeek;
   
   type UserDataTaskQuerySortProperty is (
      DueDate
   );
   for UserDataTaskQuerySortProperty use (
      DueDate => 0
   );
   for UserDataTaskQuerySortProperty'Size use 32;
   
   type UserDataTaskQuerySortProperty_Ptr is access UserDataTaskQuerySortProperty;
   
   type UserDataTaskQueryKind is (
      All_x,
      Incomplete,
      Complete
   );
   for UserDataTaskQueryKind use (
      All_x => 0,
      Incomplete => 1,
      Complete => 2
   );
   for UserDataTaskQueryKind'Size use 32;
   
   type UserDataTaskQueryKind_Ptr is access UserDataTaskQueryKind;
   
   type UserDataTaskWeekOfMonth is (
      First,
      Second,
      Third,
      Fourth,
      Last
   );
   for UserDataTaskWeekOfMonth use (
      First => 0,
      Second => 1,
      Third => 2,
      Fourth => 3,
      Last => 4
   );
   for UserDataTaskWeekOfMonth'Size use 32;
   
   type UserDataTaskWeekOfMonth_Ptr is access UserDataTaskWeekOfMonth;
   
   type UserDataTaskListSyncStatus is (
      Idle,
      Syncing,
      UpToDate,
      AuthenticationError,
      PolicyError,
      UnknownError
   );
   for UserDataTaskListSyncStatus use (
      Idle => 0,
      Syncing => 1,
      UpToDate => 2,
      AuthenticationError => 3,
      PolicyError => 4,
      UnknownError => 5
   );
   for UserDataTaskListSyncStatus'Size use 32;
   
   type UserDataTaskListSyncStatus_Ptr is access UserDataTaskListSyncStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IUserDataTaskStore_Interface;
   type AsyncOperationCompletedHandler_IUserDataTaskStore is access all AsyncOperationCompletedHandler_IUserDataTaskStore_Interface'Class;
   type AsyncOperationCompletedHandler_IUserDataTaskStore_Ptr is access all AsyncOperationCompletedHandler_IUserDataTaskStore;
   type AsyncOperationCompletedHandler_IUserDataTaskList_Interface;
   type AsyncOperationCompletedHandler_IUserDataTaskList is access all AsyncOperationCompletedHandler_IUserDataTaskList_Interface'Class;
   type AsyncOperationCompletedHandler_IUserDataTaskList_Ptr is access all AsyncOperationCompletedHandler_IUserDataTaskList;
   type AsyncOperationCompletedHandler_IUserDataTask_Interface;
   type AsyncOperationCompletedHandler_IUserDataTask is access all AsyncOperationCompletedHandler_IUserDataTask_Interface'Class;
   type AsyncOperationCompletedHandler_IUserDataTask_Ptr is access all AsyncOperationCompletedHandler_IUserDataTask;
   type AsyncOperationCompletedHandler_IUserDataTaskBatch_Interface;
   type AsyncOperationCompletedHandler_IUserDataTaskBatch is access all AsyncOperationCompletedHandler_IUserDataTaskBatch_Interface'Class;
   type AsyncOperationCompletedHandler_IUserDataTaskBatch_Ptr is access all AsyncOperationCompletedHandler_IUserDataTaskBatch;
   type TypedEventHandler_IUserDataTaskListSyncManager_add_SyncStatusChanged_Interface;
   type TypedEventHandler_IUserDataTaskListSyncManager_add_SyncStatusChanged is access all TypedEventHandler_IUserDataTaskListSyncManager_add_SyncStatusChanged_Interface'Class;
   type TypedEventHandler_IUserDataTaskListSyncManager_add_SyncStatusChanged_Ptr is access all TypedEventHandler_IUserDataTaskListSyncManager_add_SyncStatusChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IUserDataTaskManagerStatics_Interface;
   type IUserDataTaskManagerStatics is access all IUserDataTaskManagerStatics_Interface'Class;
   type IUserDataTaskManagerStatics_Ptr is access all IUserDataTaskManagerStatics;
   type IUserDataTaskManager_Interface;
   type IUserDataTaskManager is access all IUserDataTaskManager_Interface'Class;
   type IUserDataTaskManager_Ptr is access all IUserDataTaskManager;
   type IUserDataTaskStore_Interface;
   type IUserDataTaskStore is access all IUserDataTaskStore_Interface'Class;
   type IUserDataTaskStore_Ptr is access all IUserDataTaskStore;
   type IUserDataTaskQueryOptions_Interface;
   type IUserDataTaskQueryOptions is access all IUserDataTaskQueryOptions_Interface'Class;
   type IUserDataTaskQueryOptions_Ptr is access all IUserDataTaskQueryOptions;
   type IUserDataTaskList_Interface;
   type IUserDataTaskList is access all IUserDataTaskList_Interface'Class;
   type IUserDataTaskList_Ptr is access all IUserDataTaskList;
   type IUserDataTaskListLimitedWriteOperations_Interface;
   type IUserDataTaskListLimitedWriteOperations is access all IUserDataTaskListLimitedWriteOperations_Interface'Class;
   type IUserDataTaskListLimitedWriteOperations_Ptr is access all IUserDataTaskListLimitedWriteOperations;
   type IUserDataTaskBatch_Interface;
   type IUserDataTaskBatch is access all IUserDataTaskBatch_Interface'Class;
   type IUserDataTaskBatch_Ptr is access all IUserDataTaskBatch;
   type IUserDataTaskReader_Interface;
   type IUserDataTaskReader is access all IUserDataTaskReader_Interface'Class;
   type IUserDataTaskReader_Ptr is access all IUserDataTaskReader;
   type IUserDataTask_Interface;
   type IUserDataTask is access all IUserDataTask_Interface'Class;
   type IUserDataTask_Ptr is access all IUserDataTask;
   type IUserDataTaskRecurrenceProperties_Interface;
   type IUserDataTaskRecurrenceProperties is access all IUserDataTaskRecurrenceProperties_Interface'Class;
   type IUserDataTaskRecurrenceProperties_Ptr is access all IUserDataTaskRecurrenceProperties;
   type IUserDataTaskRegenerationProperties_Interface;
   type IUserDataTaskRegenerationProperties is access all IUserDataTaskRegenerationProperties_Interface'Class;
   type IUserDataTaskRegenerationProperties_Ptr is access all IUserDataTaskRegenerationProperties;
   type IUserDataTaskListSyncManager_Interface;
   type IUserDataTaskListSyncManager is access all IUserDataTaskListSyncManager_Interface'Class;
   type IUserDataTaskListSyncManager_Ptr is access all IUserDataTaskListSyncManager;
   type IAsyncOperation_IUserDataTaskStore_Interface;
   type IAsyncOperation_IUserDataTaskStore is access all IAsyncOperation_IUserDataTaskStore_Interface'Class;
   type IAsyncOperation_IUserDataTaskStore_Ptr is access all IAsyncOperation_IUserDataTaskStore;
   type IAsyncOperation_IUserDataTaskList_Interface;
   type IAsyncOperation_IUserDataTaskList is access all IAsyncOperation_IUserDataTaskList_Interface'Class;
   type IAsyncOperation_IUserDataTaskList_Ptr is access all IAsyncOperation_IUserDataTaskList;
   type IAsyncOperation_IUserDataTask_Interface;
   type IAsyncOperation_IUserDataTask is access all IAsyncOperation_IUserDataTask_Interface'Class;
   type IAsyncOperation_IUserDataTask_Ptr is access all IAsyncOperation_IUserDataTask;
   type IIterator_IUserDataTask_Interface;
   type IIterator_IUserDataTask is access all IIterator_IUserDataTask_Interface'Class;
   type IIterator_IUserDataTask_Ptr is access all IIterator_IUserDataTask;
   type IIterable_IUserDataTask_Interface;
   type IIterable_IUserDataTask is access all IIterable_IUserDataTask_Interface'Class;
   type IIterable_IUserDataTask_Ptr is access all IIterable_IUserDataTask;
   type IVectorView_IUserDataTask_Interface;
   type IVectorView_IUserDataTask is access all IVectorView_IUserDataTask_Interface'Class;
   type IVectorView_IUserDataTask_Ptr is access all IVectorView_IUserDataTask;
   type IAsyncOperation_IUserDataTaskBatch_Interface;
   type IAsyncOperation_IUserDataTaskBatch is access all IAsyncOperation_IUserDataTaskBatch_Interface'Class;
   type IAsyncOperation_IUserDataTaskBatch_Ptr is access all IAsyncOperation_IUserDataTaskBatch;
   type IReference_UserDataTaskDaysOfWeek_Interface;
   type IReference_UserDataTaskDaysOfWeek is access all IReference_UserDataTaskDaysOfWeek_Interface'Class;
   type IReference_UserDataTaskDaysOfWeek_Ptr is access all IReference_UserDataTaskDaysOfWeek;
   type IReference_UserDataTaskWeekOfMonth_Interface;
   type IReference_UserDataTaskWeekOfMonth is access all IReference_UserDataTaskWeekOfMonth_Interface'Class;
   type IReference_UserDataTaskWeekOfMonth_Ptr is access all IReference_UserDataTaskWeekOfMonth;
   
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
   
   IID_IUserDataTaskManagerStatics : aliased constant Windows.IID := (3008707064, 50434, 18428, (168, 30, 16, 8, 131, 113, 157, 85 ));
   
   type IUserDataTaskManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IUserDataTaskManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskManager
   )
   return Windows.HRESULT is abstract;
   
   function GetForUser
   (
      This       : access IUserDataTaskManagerStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskManager : aliased constant Windows.IID := (2219952404, 58891, 18601, (146, 17, 127, 184, 165, 108, 184, 76 ));
   
   type IUserDataTaskManager_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStoreAsync
   (
      This       : access IUserDataTaskManager_Interface
      ; accessType : Windows.ApplicationModel.UserDataTasks.UserDataTaskStoreAccessType
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IUserDataTaskManager_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskStore : aliased constant Windows.IID := (4033518768, 61915, 17850, (138, 98, 8, 96, 4, 192, 33, 61 ));
   
   type IUserDataTaskStore_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateListAsync
   (
      This       : access IUserDataTaskStore_Interface
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskList -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateListInAccountAsync
   (
      This       : access IUserDataTaskStore_Interface
      ; name : Windows.String
      ; userDataAccountId : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskList -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindListsAsync
   (
      This       : access IUserDataTaskStore_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetListAsync
   (
      This       : access IUserDataTaskStore_Interface
      ; taskListId : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskList -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskQueryOptions : aliased constant Windows.IID := (2510235629, 37018, 19760, (140, 27, 51, 29, 143, 230, 103, 226 ));
   
   type IUserDataTaskQueryOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SortProperty
   (
      This       : access IUserDataTaskQueryOptions_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskQuerySortProperty
   )
   return Windows.HRESULT is abstract;
   
   function put_SortProperty
   (
      This       : access IUserDataTaskQueryOptions_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.UserDataTaskQuerySortProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IUserDataTaskQueryOptions_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskQueryKind
   )
   return Windows.HRESULT is abstract;
   
   function put_Kind
   (
      This       : access IUserDataTaskQueryOptions_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.UserDataTaskQueryKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskList : aliased constant Windows.IID := (1229008441, 31773, 19953, (190, 211, 49, 75, 124, 191, 94, 78 ));
   
   type IUserDataTaskList_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserDataAccountId
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IUserDataTaskList_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceDisplayName
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherAppReadAccess
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskListOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function put_OtherAppReadAccess
   (
      This       : access IUserDataTaskList_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.UserDataTaskListOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherAppWriteAccess
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskListOtherAppWriteAccess
   )
   return Windows.HRESULT is abstract;
   
   function put_OtherAppWriteAccess
   (
      This       : access IUserDataTaskList_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.UserDataTaskListOtherAppWriteAccess
   )
   return Windows.HRESULT is abstract;
   
   function get_LimitedWriteOperations
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskListLimitedWriteOperations
   )
   return Windows.HRESULT is abstract;
   
   function get_SyncManager
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskListSyncManager
   )
   return Windows.HRESULT is abstract;
   
   function RegisterSyncManagerAsync
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetTaskReader
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskReader
   )
   return Windows.HRESULT is abstract;
   
   function GetTaskReaderWithOptions
   (
      This       : access IUserDataTaskList_Interface
      ; options : Windows.ApplicationModel.UserDataTasks.IUserDataTaskQueryOptions
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskReader
   )
   return Windows.HRESULT is abstract;
   
   function GetTaskAsync
   (
      This       : access IUserDataTaskList_Interface
      ; userDataTask : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTask -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveTaskAsync
   (
      This       : access IUserDataTaskList_Interface
      ; userDataTask : Windows.ApplicationModel.UserDataTasks.IUserDataTask
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteTaskAsync
   (
      This       : access IUserDataTaskList_Interface
      ; userDataTaskId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IUserDataTaskList_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListLimitedWriteOperations : aliased constant Windows.IID := (2057463794, 24696, 16771, (145, 158, 79, 41, 241, 156, 250, 233 ));
   
   type IUserDataTaskListLimitedWriteOperations_Interface is interface and Windows.IInspectable_Interface;
   
   function TryCompleteTaskAsync
   (
      This       : access IUserDataTaskListLimitedWriteOperations_Interface
      ; userDataTaskId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateOrUpdateTaskAsync
   (
      This       : access IUserDataTaskListLimitedWriteOperations_Interface
      ; userDataTask : Windows.ApplicationModel.UserDataTasks.IUserDataTask
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryDeleteTaskAsync
   (
      This       : access IUserDataTaskListLimitedWriteOperations_Interface
      ; userDataTaskId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySkipOccurrenceAsync
   (
      This       : access IUserDataTaskListLimitedWriteOperations_Interface
      ; userDataTaskId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskBatch : aliased constant Windows.IID := (942515710, 8373, 17180, (143, 66, 165, 210, 146, 236, 147, 12 ));
   
   type IUserDataTaskBatch_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Tasks
   (
      This       : access IUserDataTaskBatch_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IVectorView_IUserDataTask -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskReader : aliased constant Windows.IID := (65439921, 19663, 17664, (136, 59, 231, 98, 144, 207, 237, 99 ));
   
   type IUserDataTaskReader_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchAsync
   (
      This       : access IUserDataTaskReader_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskBatch -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTask : aliased constant Windows.IID := (2087028177, 57556, 20377, (174, 226, 188, 45, 93, 218, 223, 76 ));
   
   type IUserDataTask_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ListId
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CompletedDate
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_CompletedDate
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Details
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Details
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DetailsKind
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskDetailsKind
   )
   return Windows.HRESULT is abstract;
   
   function put_DetailsKind
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.UserDataTaskDetailsKind
   )
   return Windows.HRESULT is abstract;
   
   function get_DueDate
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DueDate
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Priority
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskPriority
   )
   return Windows.HRESULT is abstract;
   
   function put_Priority
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.UserDataTaskPriority
   )
   return Windows.HRESULT is abstract;
   
   function get_RecurrenceProperties
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskRecurrenceProperties
   )
   return Windows.HRESULT is abstract;
   
   function put_RecurrenceProperties
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.IUserDataTaskRecurrenceProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_RegenerationProperties
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskRegenerationProperties
   )
   return Windows.HRESULT is abstract;
   
   function put_RegenerationProperties
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.IUserDataTaskRegenerationProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Reminder
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Reminder
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Sensitivity
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskSensitivity
   )
   return Windows.HRESULT is abstract;
   
   function put_Sensitivity
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.UserDataTaskSensitivity
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Subject
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StartDate
   (
      This       : access IUserDataTask_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_StartDate
   (
      This       : access IUserDataTask_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskRecurrenceProperties : aliased constant Windows.IID := (1944027312, 10182, 16590, (177, 73, 156, 212, 20, 133, 166, 158 ));
   
   type IUserDataTaskRecurrenceProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Unit
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskRecurrenceUnit
   )
   return Windows.HRESULT is abstract;
   
   function put_Unit
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.UserDataTaskRecurrenceUnit
   )
   return Windows.HRESULT is abstract;
   
   function get_Occurrences
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Occurrences
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Until
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Until
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Interval
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Interval
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_DaysOfWeek
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IReference_UserDataTaskDaysOfWeek -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DaysOfWeek
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.IReference_UserDataTaskDaysOfWeek
   )
   return Windows.HRESULT is abstract;
   
   function get_WeekOfMonth
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IReference_UserDataTaskWeekOfMonth -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_WeekOfMonth
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.IReference_UserDataTaskWeekOfMonth
   )
   return Windows.HRESULT is abstract;
   
   function get_Month
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Month
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Day
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Day
   (
      This       : access IUserDataTaskRecurrenceProperties_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskRegenerationProperties : aliased constant Windows.IID := (2460680199, 2318, 18180, (187, 92, 132, 252, 11, 13, 156, 49 ));
   
   type IUserDataTaskRegenerationProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Unit
   (
      This       : access IUserDataTaskRegenerationProperties_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskRegenerationUnit
   )
   return Windows.HRESULT is abstract;
   
   function put_Unit
   (
      This       : access IUserDataTaskRegenerationProperties_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.UserDataTaskRegenerationUnit
   )
   return Windows.HRESULT is abstract;
   
   function get_Occurrences
   (
      This       : access IUserDataTaskRegenerationProperties_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Occurrences
   (
      This       : access IUserDataTaskRegenerationProperties_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Until
   (
      This       : access IUserDataTaskRegenerationProperties_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Until
   (
      This       : access IUserDataTaskRegenerationProperties_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Interval
   (
      This       : access IUserDataTaskRegenerationProperties_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Interval
   (
      This       : access IUserDataTaskRegenerationProperties_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListSyncManager : aliased constant Windows.IID := (2388204181, 7631, 18079, (147, 236, 186, 72, 187, 85, 60, 107 ));
   
   type IUserDataTaskListSyncManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LastAttemptedSyncTime
   (
      This       : access IUserDataTaskListSyncManager_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_LastAttemptedSyncTime
   (
      This       : access IUserDataTaskListSyncManager_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_LastSuccessfulSyncTime
   (
      This       : access IUserDataTaskListSyncManager_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_LastSuccessfulSyncTime
   (
      This       : access IUserDataTaskListSyncManager_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IUserDataTaskListSyncManager_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskListSyncStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_Status
   (
      This       : access IUserDataTaskListSyncManager_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.UserDataTaskListSyncStatus
   )
   return Windows.HRESULT is abstract;
   
   function SyncAsync
   (
      This       : access IUserDataTaskListSyncManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_SyncStatusChanged
   (
      This       : access IUserDataTaskListSyncManager_Interface
      ; handler : TypedEventHandler_IUserDataTaskListSyncManager_add_SyncStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SyncStatusChanged
   (
      This       : access IUserDataTaskListSyncManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IUserDataTaskStore : aliased constant Windows.IID := (3761000032, 30890, 24248, (186, 219, 234, 210, 45, 202, 150, 121 ));
   
   type IAsyncOperation_IUserDataTaskStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUserDataTaskStore_Interface
      ; handler : Windows.ApplicationModel.UserDataTasks.AsyncOperationCompletedHandler_IUserDataTaskStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUserDataTaskStore_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.AsyncOperationCompletedHandler_IUserDataTaskStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUserDataTaskStore_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IUserDataTaskList : aliased constant Windows.IID := (3643231986, 25568, 21580, (141, 178, 254, 45, 91, 130, 93, 158 ));
   
   type IAsyncOperation_IUserDataTaskList_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUserDataTaskList_Interface
      ; handler : Windows.ApplicationModel.UserDataTasks.AsyncOperationCompletedHandler_IUserDataTaskList
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUserDataTaskList_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.AsyncOperationCompletedHandler_IUserDataTaskList
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUserDataTaskList_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskList
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IUserDataTask : aliased constant Windows.IID := (3099019697, 43079, 23604, (134, 108, 234, 86, 12, 222, 31, 73 ));
   
   type IAsyncOperation_IUserDataTask_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUserDataTask_Interface
      ; handler : Windows.ApplicationModel.UserDataTasks.AsyncOperationCompletedHandler_IUserDataTask
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUserDataTask_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.AsyncOperationCompletedHandler_IUserDataTask
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUserDataTask_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTask
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IUserDataTask : aliased constant Windows.IID := (2557689799, 6408, 21295, (191, 227, 56, 104, 68, 93, 41, 214 ));
   
   type IIterator_IUserDataTask_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUserDataTask_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTask
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUserDataTask_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUserDataTask_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUserDataTask_Interface
      ; items : Windows.ApplicationModel.UserDataTasks.IUserDataTask_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IUserDataTask : aliased constant Windows.IID := (2330509005, 14175, 22834, (145, 237, 248, 42, 116, 34, 67, 101 ));
   
   type IIterable_IUserDataTask_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUserDataTask_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IIterator_IUserDataTask
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IUserDataTask : aliased constant Windows.IID := (218017691, 34648, 23206, (152, 6, 50, 176, 234, 64, 212, 184 ));
   
   type IVectorView_IUserDataTask_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUserDataTask_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTask
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUserDataTask_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUserDataTask_Interface
      ; value : Windows.ApplicationModel.UserDataTasks.IUserDataTask
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUserDataTask_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.UserDataTasks.IUserDataTask_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IUserDataTaskBatch : aliased constant Windows.IID := (3547009247, 7339, 21580, (140, 46, 60, 123, 196, 210, 75, 36 ));
   
   type IAsyncOperation_IUserDataTaskBatch_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUserDataTaskBatch_Interface
      ; handler : Windows.ApplicationModel.UserDataTasks.AsyncOperationCompletedHandler_IUserDataTaskBatch
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUserDataTaskBatch_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.AsyncOperationCompletedHandler_IUserDataTaskBatch
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUserDataTaskBatch_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTaskBatch
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_UserDataTaskDaysOfWeek : aliased constant Windows.IID := (2419614149, 53917, 20611, (160, 61, 107, 42, 2, 51, 220, 202 ));
   
   type IReference_UserDataTaskDaysOfWeek_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_UserDataTaskDaysOfWeek_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskDaysOfWeek
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_UserDataTaskWeekOfMonth : aliased constant Windows.IID := (1380383359, 63977, 21876, (128, 247, 74, 163, 89, 176, 2, 61 ));
   
   type IReference_UserDataTaskWeekOfMonth_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_UserDataTaskWeekOfMonth_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.UserDataTaskWeekOfMonth
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IUserDataTaskStore : aliased constant Windows.IID := (868861461, 12160, 22653, (159, 81, 2, 126, 196, 87, 183, 163 ));
   
   type AsyncOperationCompletedHandler_IUserDataTaskStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IUserDataTaskStore'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUserDataTaskStore_Interface
      ; asyncInfo : Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IUserDataTaskList : aliased constant Windows.IID := (4009460042, 27383, 23897, (191, 63, 182, 199, 59, 140, 116, 162 ));
   
   type AsyncOperationCompletedHandler_IUserDataTaskList_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskList ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IUserDataTaskList'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUserDataTaskList_Interface
      ; asyncInfo : Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskList
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IUserDataTask : aliased constant Windows.IID := (2805055693, 8301, 23288, (173, 100, 133, 183, 32, 15, 76, 226 ));
   
   type AsyncOperationCompletedHandler_IUserDataTask_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTask ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IUserDataTask'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUserDataTask_Interface
      ; asyncInfo : Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTask
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IUserDataTaskBatch : aliased constant Windows.IID := (3862689976, 37360, 24339, (161, 201, 222, 225, 135, 157, 10, 82 ));
   
   type AsyncOperationCompletedHandler_IUserDataTaskBatch_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskBatch ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IUserDataTaskBatch'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUserDataTaskBatch_Interface
      ; asyncInfo : Windows.ApplicationModel.UserDataTasks.IAsyncOperation_IUserDataTaskBatch
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserDataTaskListSyncManager_add_SyncStatusChanged : aliased constant Windows.IID := (65507570, 60111, 21483, (144, 96, 107, 254, 236, 91, 195, 117 ));
   
   type TypedEventHandler_IUserDataTaskListSyncManager_add_SyncStatusChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.UserDataTasks.IUserDataTaskListSyncManager ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserDataTaskListSyncManager_add_SyncStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserDataTaskListSyncManager_add_SyncStatusChanged_Interface
      ; sender : Windows.ApplicationModel.UserDataTasks.IUserDataTaskListSyncManager
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype UserDataTaskManager is Windows.ApplicationModel.UserDataTasks.IUserDataTaskManager;
   subtype UserDataTaskStore is Windows.ApplicationModel.UserDataTasks.IUserDataTaskStore;
   subtype UserDataTaskList is Windows.ApplicationModel.UserDataTasks.IUserDataTaskList;
   subtype UserDataTaskListLimitedWriteOperations is Windows.ApplicationModel.UserDataTasks.IUserDataTaskListLimitedWriteOperations;
   subtype UserDataTaskListSyncManager is Windows.ApplicationModel.UserDataTasks.IUserDataTaskListSyncManager;
   subtype UserDataTaskReader is Windows.ApplicationModel.UserDataTasks.IUserDataTaskReader;
   subtype UserDataTaskQueryOptions is Windows.ApplicationModel.UserDataTasks.IUserDataTaskQueryOptions;
   
   function CreateUserDataTaskQueryOptions return Windows.ApplicationModel.UserDataTasks.IUserDataTaskQueryOptions;
   
   subtype UserDataTask is Windows.ApplicationModel.UserDataTasks.IUserDataTask;
   
   function CreateUserDataTask return Windows.ApplicationModel.UserDataTasks.IUserDataTask;
   
   subtype UserDataTaskBatch is Windows.ApplicationModel.UserDataTasks.IUserDataTaskBatch;
   subtype UserDataTaskRecurrenceProperties is Windows.ApplicationModel.UserDataTasks.IUserDataTaskRecurrenceProperties;
   
   function CreateUserDataTaskRecurrenceProperties return Windows.ApplicationModel.UserDataTasks.IUserDataTaskRecurrenceProperties;
   
   subtype UserDataTaskRegenerationProperties is Windows.ApplicationModel.UserDataTasks.IUserDataTaskRegenerationProperties;
   
   function CreateUserDataTaskRegenerationProperties return Windows.ApplicationModel.UserDataTasks.IUserDataTaskRegenerationProperties;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDefault
   return Windows.ApplicationModel.UserDataTasks.IUserDataTaskManager;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.UserDataTasks.IUserDataTaskManager;
   

end;
