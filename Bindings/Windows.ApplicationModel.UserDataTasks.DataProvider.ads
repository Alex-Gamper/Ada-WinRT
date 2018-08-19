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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
package Windows.ApplicationModel.UserDataTasks.DataProvider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_CreateOrUpdateTaskRequested_Interface;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_CreateOrUpdateTaskRequested is access all TypedEventHandler_IUserDataTaskDataProviderConnection_add_CreateOrUpdateTaskRequested_Interface'Class;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_CreateOrUpdateTaskRequested_Ptr is access all TypedEventHandler_IUserDataTaskDataProviderConnection_add_CreateOrUpdateTaskRequested;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_SyncRequested_Interface;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_SyncRequested is access all TypedEventHandler_IUserDataTaskDataProviderConnection_add_SyncRequested_Interface'Class;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_SyncRequested_Ptr is access all TypedEventHandler_IUserDataTaskDataProviderConnection_add_SyncRequested;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_SkipOccurrenceRequested_Interface;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_SkipOccurrenceRequested is access all TypedEventHandler_IUserDataTaskDataProviderConnection_add_SkipOccurrenceRequested_Interface'Class;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_SkipOccurrenceRequested_Ptr is access all TypedEventHandler_IUserDataTaskDataProviderConnection_add_SkipOccurrenceRequested;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_CompleteTaskRequested_Interface;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_CompleteTaskRequested is access all TypedEventHandler_IUserDataTaskDataProviderConnection_add_CompleteTaskRequested_Interface'Class;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_CompleteTaskRequested_Ptr is access all TypedEventHandler_IUserDataTaskDataProviderConnection_add_CompleteTaskRequested;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_DeleteTaskRequested_Interface;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_DeleteTaskRequested is access all TypedEventHandler_IUserDataTaskDataProviderConnection_add_DeleteTaskRequested_Interface'Class;
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_DeleteTaskRequested_Ptr is access all TypedEventHandler_IUserDataTaskDataProviderConnection_add_DeleteTaskRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IUserDataTaskDataProviderTriggerDetails_Interface;
   type IUserDataTaskDataProviderTriggerDetails is access all IUserDataTaskDataProviderTriggerDetails_Interface'Class;
   type IUserDataTaskDataProviderTriggerDetails_Ptr is access all IUserDataTaskDataProviderTriggerDetails;
   type IUserDataTaskDataProviderConnection_Interface;
   type IUserDataTaskDataProviderConnection is access all IUserDataTaskDataProviderConnection_Interface'Class;
   type IUserDataTaskDataProviderConnection_Ptr is access all IUserDataTaskDataProviderConnection;
   type IUserDataTaskListCreateOrUpdateTaskRequest_Interface;
   type IUserDataTaskListCreateOrUpdateTaskRequest is access all IUserDataTaskListCreateOrUpdateTaskRequest_Interface'Class;
   type IUserDataTaskListCreateOrUpdateTaskRequest_Ptr is access all IUserDataTaskListCreateOrUpdateTaskRequest;
   type IUserDataTaskListSyncManagerSyncRequest_Interface;
   type IUserDataTaskListSyncManagerSyncRequest is access all IUserDataTaskListSyncManagerSyncRequest_Interface'Class;
   type IUserDataTaskListSyncManagerSyncRequest_Ptr is access all IUserDataTaskListSyncManagerSyncRequest;
   type IUserDataTaskListSkipOccurrenceRequest_Interface;
   type IUserDataTaskListSkipOccurrenceRequest is access all IUserDataTaskListSkipOccurrenceRequest_Interface'Class;
   type IUserDataTaskListSkipOccurrenceRequest_Ptr is access all IUserDataTaskListSkipOccurrenceRequest;
   type IUserDataTaskListCompleteTaskRequest_Interface;
   type IUserDataTaskListCompleteTaskRequest is access all IUserDataTaskListCompleteTaskRequest_Interface'Class;
   type IUserDataTaskListCompleteTaskRequest_Ptr is access all IUserDataTaskListCompleteTaskRequest;
   type IUserDataTaskListDeleteTaskRequest_Interface;
   type IUserDataTaskListDeleteTaskRequest is access all IUserDataTaskListDeleteTaskRequest_Interface'Class;
   type IUserDataTaskListDeleteTaskRequest_Ptr is access all IUserDataTaskListDeleteTaskRequest;
   type IUserDataTaskListCreateOrUpdateTaskRequestEventArgs_Interface;
   type IUserDataTaskListCreateOrUpdateTaskRequestEventArgs is access all IUserDataTaskListCreateOrUpdateTaskRequestEventArgs_Interface'Class;
   type IUserDataTaskListCreateOrUpdateTaskRequestEventArgs_Ptr is access all IUserDataTaskListCreateOrUpdateTaskRequestEventArgs;
   type IUserDataTaskListSyncManagerSyncRequestEventArgs_Interface;
   type IUserDataTaskListSyncManagerSyncRequestEventArgs is access all IUserDataTaskListSyncManagerSyncRequestEventArgs_Interface'Class;
   type IUserDataTaskListSyncManagerSyncRequestEventArgs_Ptr is access all IUserDataTaskListSyncManagerSyncRequestEventArgs;
   type IUserDataTaskListSkipOccurrenceRequestEventArgs_Interface;
   type IUserDataTaskListSkipOccurrenceRequestEventArgs is access all IUserDataTaskListSkipOccurrenceRequestEventArgs_Interface'Class;
   type IUserDataTaskListSkipOccurrenceRequestEventArgs_Ptr is access all IUserDataTaskListSkipOccurrenceRequestEventArgs;
   type IUserDataTaskListCompleteTaskRequestEventArgs_Interface;
   type IUserDataTaskListCompleteTaskRequestEventArgs is access all IUserDataTaskListCompleteTaskRequestEventArgs_Interface'Class;
   type IUserDataTaskListCompleteTaskRequestEventArgs_Ptr is access all IUserDataTaskListCompleteTaskRequestEventArgs;
   type IUserDataTaskListDeleteTaskRequestEventArgs_Interface;
   type IUserDataTaskListDeleteTaskRequestEventArgs is access all IUserDataTaskListDeleteTaskRequestEventArgs_Interface'Class;
   type IUserDataTaskListDeleteTaskRequestEventArgs_Ptr is access all IUserDataTaskListDeleteTaskRequestEventArgs;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskDataProviderTriggerDetails : aliased constant Windows.IID := (2921804290, 45513, 17726, (175, 197, 179, 10, 243, 189, 33, 125 ));
   
   type IUserDataTaskDataProviderTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Connection
   (
      This       : access IUserDataTaskDataProviderTriggerDetails_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskDataProviderConnection : aliased constant Windows.IID := (2683542813, 42055, 17035, (175, 233, 229, 64, 43, 222, 176, 65 ));
   
   type IUserDataTaskDataProviderConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function add_CreateOrUpdateTaskRequested
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
      ; handler : TypedEventHandler_IUserDataTaskDataProviderConnection_add_CreateOrUpdateTaskRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CreateOrUpdateTaskRequested
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SyncRequested
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
      ; handler : TypedEventHandler_IUserDataTaskDataProviderConnection_add_SyncRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SyncRequested
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SkipOccurrenceRequested
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
      ; handler : TypedEventHandler_IUserDataTaskDataProviderConnection_add_SkipOccurrenceRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SkipOccurrenceRequested
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CompleteTaskRequested
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
      ; handler : TypedEventHandler_IUserDataTaskDataProviderConnection_add_CompleteTaskRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CompleteTaskRequested
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DeleteTaskRequested
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
      ; handler : TypedEventHandler_IUserDataTaskDataProviderConnection_add_DeleteTaskRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DeleteTaskRequested
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IUserDataTaskDataProviderConnection_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListCreateOrUpdateTaskRequest : aliased constant Windows.IID := (557020972, 21954, 17152, (130, 121, 4, 50, 110, 7, 204, 228 ));
   
   type IUserDataTaskListCreateOrUpdateTaskRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskListId
   (
      This       : access IUserDataTaskListCreateOrUpdateTaskRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Task
   (
      This       : access IUserDataTaskListCreateOrUpdateTaskRequest_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.IUserDataTask
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IUserDataTaskListCreateOrUpdateTaskRequest_Interface
      ; createdOrUpdatedUserDataTask : Windows.ApplicationModel.UserDataTasks.IUserDataTask
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IUserDataTaskListCreateOrUpdateTaskRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListSyncManagerSyncRequest : aliased constant Windows.IID := (1084700679, 30096, 16713, (174, 25, 178, 17, 67, 26, 159, 72 ));
   
   type IUserDataTaskListSyncManagerSyncRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskListId
   (
      This       : access IUserDataTaskListSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IUserDataTaskListSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IUserDataTaskListSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListSkipOccurrenceRequest : aliased constant Windows.IID := (2877809485, 7379, 17180, (159, 88, 8, 154, 164, 51, 141, 133 ));
   
   type IUserDataTaskListSkipOccurrenceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskListId
   (
      This       : access IUserDataTaskListSkipOccurrenceRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TaskId
   (
      This       : access IUserDataTaskListSkipOccurrenceRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IUserDataTaskListSkipOccurrenceRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IUserDataTaskListSkipOccurrenceRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListCompleteTaskRequest : aliased constant Windows.IID := (4133360803, 6722, 18906, (133, 82, 40, 115, 229, 44, 85, 235 ));
   
   type IUserDataTaskListCompleteTaskRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskListId
   (
      This       : access IUserDataTaskListCompleteTaskRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TaskId
   (
      This       : access IUserDataTaskListCompleteTaskRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IUserDataTaskListCompleteTaskRequest_Interface
      ; completedTaskId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IUserDataTaskListCompleteTaskRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListDeleteTaskRequest : aliased constant Windows.IID := (1267088488, 30295, 20285, (176, 116, 212, 126, 200, 223, 7, 231 ));
   
   type IUserDataTaskListDeleteTaskRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskListId
   (
      This       : access IUserDataTaskListDeleteTaskRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TaskId
   (
      This       : access IUserDataTaskListDeleteTaskRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IUserDataTaskListDeleteTaskRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IUserDataTaskListDeleteTaskRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListCreateOrUpdateTaskRequestEventArgs : aliased constant Windows.IID := (314923602, 58232, 16795, (174, 56, 165, 233, 230, 4, 71, 110 ));
   
   type IUserDataTaskListCreateOrUpdateTaskRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IUserDataTaskListCreateOrUpdateTaskRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListCreateOrUpdateTaskRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IUserDataTaskListCreateOrUpdateTaskRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListSyncManagerSyncRequestEventArgs : aliased constant Windows.IID := (2393709586, 30350, 17341, (131, 133, 92, 220, 53, 31, 253, 234 ));
   
   type IUserDataTaskListSyncManagerSyncRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IUserDataTaskListSyncManagerSyncRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListSyncManagerSyncRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IUserDataTaskListSyncManagerSyncRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListSkipOccurrenceRequestEventArgs : aliased constant Windows.IID := (2050724426, 52271, 20091, (170, 205, 165, 185, 210, 156, 250, 78 ));
   
   type IUserDataTaskListSkipOccurrenceRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IUserDataTaskListSkipOccurrenceRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListSkipOccurrenceRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IUserDataTaskListSkipOccurrenceRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListCompleteTaskRequestEventArgs : aliased constant Windows.IID := (3615242557, 19698, 18605, (135, 253, 150, 63, 14, 170, 122, 149 ));
   
   type IUserDataTaskListCompleteTaskRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IUserDataTaskListCompleteTaskRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListCompleteTaskRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IUserDataTaskListCompleteTaskRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataTaskListDeleteTaskRequestEventArgs : aliased constant Windows.IID := (1617156825, 62818, 16709, (142, 254, 213, 0, 120, 201, 43, 127 ));
   
   type IUserDataTaskListDeleteTaskRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IUserDataTaskListDeleteTaskRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListDeleteTaskRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IUserDataTaskListDeleteTaskRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserDataTaskDataProviderConnection_add_CreateOrUpdateTaskRequested : aliased constant Windows.IID := (682488924, 26631, 21904, (167, 241, 147, 71, 71, 147, 117, 146 ));
   
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_CreateOrUpdateTaskRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection ; args : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListCreateOrUpdateTaskRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserDataTaskDataProviderConnection_add_CreateOrUpdateTaskRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserDataTaskDataProviderConnection_add_CreateOrUpdateTaskRequested_Interface
      ; sender : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection
      ; args : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListCreateOrUpdateTaskRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserDataTaskDataProviderConnection_add_SyncRequested : aliased constant Windows.IID := (2976180463, 5756, 22610, (167, 146, 9, 48, 180, 0, 24, 113 ));
   
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_SyncRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection ; args : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListSyncManagerSyncRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserDataTaskDataProviderConnection_add_SyncRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserDataTaskDataProviderConnection_add_SyncRequested_Interface
      ; sender : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection
      ; args : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListSyncManagerSyncRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserDataTaskDataProviderConnection_add_SkipOccurrenceRequested : aliased constant Windows.IID := (143110520, 50502, 23240, (174, 16, 50, 146, 171, 82, 101, 188 ));
   
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_SkipOccurrenceRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection ; args : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListSkipOccurrenceRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserDataTaskDataProviderConnection_add_SkipOccurrenceRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserDataTaskDataProviderConnection_add_SkipOccurrenceRequested_Interface
      ; sender : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection
      ; args : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListSkipOccurrenceRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserDataTaskDataProviderConnection_add_CompleteTaskRequested : aliased constant Windows.IID := (1614150135, 54469, 21396, (176, 227, 93, 96, 105, 135, 186, 71 ));
   
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_CompleteTaskRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection ; args : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListCompleteTaskRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserDataTaskDataProviderConnection_add_CompleteTaskRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserDataTaskDataProviderConnection_add_CompleteTaskRequested_Interface
      ; sender : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection
      ; args : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListCompleteTaskRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserDataTaskDataProviderConnection_add_DeleteTaskRequested : aliased constant Windows.IID := (186181256, 45673, 23714, (168, 243, 214, 209, 15, 15, 179, 32 ));
   
   type TypedEventHandler_IUserDataTaskDataProviderConnection_add_DeleteTaskRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection ; args : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListDeleteTaskRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserDataTaskDataProviderConnection_add_DeleteTaskRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserDataTaskDataProviderConnection_add_DeleteTaskRequested_Interface
      ; sender : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection
      ; args : Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListDeleteTaskRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype UserDataTaskDataProviderConnection is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderConnection;
   subtype UserDataTaskListCreateOrUpdateTaskRequestEventArgs is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListCreateOrUpdateTaskRequestEventArgs;
   subtype UserDataTaskListSyncManagerSyncRequestEventArgs is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListSyncManagerSyncRequestEventArgs;
   subtype UserDataTaskListSkipOccurrenceRequestEventArgs is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListSkipOccurrenceRequestEventArgs;
   subtype UserDataTaskListCompleteTaskRequestEventArgs is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListCompleteTaskRequestEventArgs;
   subtype UserDataTaskListDeleteTaskRequestEventArgs is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListDeleteTaskRequestEventArgs;
   subtype UserDataTaskDataProviderTriggerDetails is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskDataProviderTriggerDetails;
   subtype UserDataTaskListCreateOrUpdateTaskRequest is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListCreateOrUpdateTaskRequest;
   subtype UserDataTaskListSyncManagerSyncRequest is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListSyncManagerSyncRequest;
   subtype UserDataTaskListSkipOccurrenceRequest is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListSkipOccurrenceRequest;
   subtype UserDataTaskListCompleteTaskRequest is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListCompleteTaskRequest;
   subtype UserDataTaskListDeleteTaskRequest is Windows.ApplicationModel.UserDataTasks.DataProvider.IUserDataTaskListDeleteTaskRequest;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
