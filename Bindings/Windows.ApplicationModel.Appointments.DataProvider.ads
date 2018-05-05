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
with Windows.Foundation;
with Windows.Foundation.Collections;
package Windows.ApplicationModel.Appointments.DataProvider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested_Interface;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested is access all TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested_Interface'Class;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested_Ptr is access all TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested_Interface;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested is access all TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested_Interface'Class;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested_Ptr is access all TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested_Interface;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested is access all TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested_Interface'Class;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested_Ptr is access all TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested_Interface;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested is access all TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested_Interface'Class;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested_Ptr is access all TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested is access all TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface'Class;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Ptr is access all TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested_Interface;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested is access all TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested_Interface'Class;
   type TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested_Ptr is access all TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAppointmentDataProviderTriggerDetails_Interface;
   type IAppointmentDataProviderTriggerDetails is access all IAppointmentDataProviderTriggerDetails_Interface'Class;
   type IAppointmentDataProviderTriggerDetails_Ptr is access all IAppointmentDataProviderTriggerDetails;
   type IAppointmentDataProviderConnection_Interface;
   type IAppointmentDataProviderConnection is access all IAppointmentDataProviderConnection_Interface'Class;
   type IAppointmentDataProviderConnection_Ptr is access all IAppointmentDataProviderConnection;
   type IAppointmentCalendarSyncManagerSyncRequest_Interface;
   type IAppointmentCalendarSyncManagerSyncRequest is access all IAppointmentCalendarSyncManagerSyncRequest_Interface'Class;
   type IAppointmentCalendarSyncManagerSyncRequest_Ptr is access all IAppointmentCalendarSyncManagerSyncRequest;
   type IAppointmentCalendarCreateOrUpdateAppointmentRequest_Interface;
   type IAppointmentCalendarCreateOrUpdateAppointmentRequest is access all IAppointmentCalendarCreateOrUpdateAppointmentRequest_Interface'Class;
   type IAppointmentCalendarCreateOrUpdateAppointmentRequest_Ptr is access all IAppointmentCalendarCreateOrUpdateAppointmentRequest;
   type IAppointmentCalendarCancelMeetingRequest_Interface;
   type IAppointmentCalendarCancelMeetingRequest is access all IAppointmentCalendarCancelMeetingRequest_Interface'Class;
   type IAppointmentCalendarCancelMeetingRequest_Ptr is access all IAppointmentCalendarCancelMeetingRequest;
   type IAppointmentCalendarForwardMeetingRequest_Interface;
   type IAppointmentCalendarForwardMeetingRequest is access all IAppointmentCalendarForwardMeetingRequest_Interface'Class;
   type IAppointmentCalendarForwardMeetingRequest_Ptr is access all IAppointmentCalendarForwardMeetingRequest;
   type IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface;
   type IAppointmentCalendarProposeNewTimeForMeetingRequest is access all IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface'Class;
   type IAppointmentCalendarProposeNewTimeForMeetingRequest_Ptr is access all IAppointmentCalendarProposeNewTimeForMeetingRequest;
   type IAppointmentCalendarUpdateMeetingResponseRequest_Interface;
   type IAppointmentCalendarUpdateMeetingResponseRequest is access all IAppointmentCalendarUpdateMeetingResponseRequest_Interface'Class;
   type IAppointmentCalendarUpdateMeetingResponseRequest_Ptr is access all IAppointmentCalendarUpdateMeetingResponseRequest;
   type IAppointmentCalendarSyncManagerSyncRequestEventArgs_Interface;
   type IAppointmentCalendarSyncManagerSyncRequestEventArgs is access all IAppointmentCalendarSyncManagerSyncRequestEventArgs_Interface'Class;
   type IAppointmentCalendarSyncManagerSyncRequestEventArgs_Ptr is access all IAppointmentCalendarSyncManagerSyncRequestEventArgs;
   type IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs_Interface;
   type IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs is access all IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs_Interface'Class;
   type IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs_Ptr is access all IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs;
   type IAppointmentCalendarCancelMeetingRequestEventArgs_Interface;
   type IAppointmentCalendarCancelMeetingRequestEventArgs is access all IAppointmentCalendarCancelMeetingRequestEventArgs_Interface'Class;
   type IAppointmentCalendarCancelMeetingRequestEventArgs_Ptr is access all IAppointmentCalendarCancelMeetingRequestEventArgs;
   type IAppointmentCalendarForwardMeetingRequestEventArgs_Interface;
   type IAppointmentCalendarForwardMeetingRequestEventArgs is access all IAppointmentCalendarForwardMeetingRequestEventArgs_Interface'Class;
   type IAppointmentCalendarForwardMeetingRequestEventArgs_Ptr is access all IAppointmentCalendarForwardMeetingRequestEventArgs;
   type IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs_Interface;
   type IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs is access all IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs_Interface'Class;
   type IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs_Ptr is access all IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs;
   type IAppointmentCalendarUpdateMeetingResponseRequestEventArgs_Interface;
   type IAppointmentCalendarUpdateMeetingResponseRequestEventArgs is access all IAppointmentCalendarUpdateMeetingResponseRequestEventArgs_Interface'Class;
   type IAppointmentCalendarUpdateMeetingResponseRequestEventArgs_Ptr is access all IAppointmentCalendarUpdateMeetingResponseRequestEventArgs;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentDataProviderTriggerDetails : aliased constant Windows.IID := (3005758465, 32274, 20062, (177, 239, 116, 251, 104, 172, 111, 42 ));
   
   type IAppointmentDataProviderTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Connection
   (
      This       : access IAppointmentDataProviderTriggerDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentDataProviderConnection : aliased constant Windows.IID := (4091387267, 12884, 18015, (171, 219, 146, 128, 70, 85, 44, 244 ));
   
   type IAppointmentDataProviderConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SyncRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; handler : TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SyncRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CreateOrUpdateAppointmentRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; handler : TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CreateOrUpdateAppointmentRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CancelMeetingRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; handler : TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CancelMeetingRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ForwardMeetingRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; handler : TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ForwardMeetingRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ProposeNewTimeForMeetingRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; handler : TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ProposeNewTimeForMeetingRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UpdateMeetingResponseRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; handler : TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UpdateMeetingResponseRequested
   (
      This       : access IAppointmentDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IAppointmentDataProviderConnection_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarSyncManagerSyncRequest : aliased constant Windows.IID := (313210923, 29027, 19030, (154, 78, 114, 35, 168, 74, 223, 70 ));
   
   type IAppointmentCalendarSyncManagerSyncRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppointmentCalendarLocalId
   (
      This       : access IAppointmentCalendarSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IAppointmentCalendarSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IAppointmentCalendarSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarCreateOrUpdateAppointmentRequest : aliased constant Windows.IID := (778236594, 51862, 18604, (145, 36, 64, 107, 25, 254, 250, 112 ));
   
   type IAppointmentCalendarCreateOrUpdateAppointmentRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppointmentCalendarLocalId
   (
      This       : access IAppointmentCalendarCreateOrUpdateAppointmentRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Appointment
   (
      This       : access IAppointmentCalendarCreateOrUpdateAppointmentRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IAppointment
   )
   return Windows.HRESULT is abstract;
   
   function get_NotifyInvitees
   (
      This       : access IAppointmentCalendarCreateOrUpdateAppointmentRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ChangedProperties
   (
      This       : access IAppointmentCalendarCreateOrUpdateAppointmentRequest_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IAppointmentCalendarCreateOrUpdateAppointmentRequest_Interface
      ; createdOrUpdatedAppointment : Windows.ApplicationModel.Appointments.IAppointment
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IAppointmentCalendarCreateOrUpdateAppointmentRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarCancelMeetingRequest : aliased constant Windows.IID := (1229328269, 25652, 16599, (173, 70, 98, 151, 65, 147, 20, 209 ));
   
   type IAppointmentCalendarCancelMeetingRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppointmentCalendarLocalId
   (
      This       : access IAppointmentCalendarCancelMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentLocalId
   (
      This       : access IAppointmentCalendarCancelMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentOriginalStartTime
   (
      This       : access IAppointmentCalendarCancelMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IAppointmentCalendarCancelMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Comment
   (
      This       : access IAppointmentCalendarCancelMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NotifyInvitees
   (
      This       : access IAppointmentCalendarCancelMeetingRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IAppointmentCalendarCancelMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IAppointmentCalendarCancelMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarForwardMeetingRequest : aliased constant Windows.IID := (2196106838, 9910, 16979, (138, 143, 108, 245, 242, 255, 120, 132 ));
   
   type IAppointmentCalendarForwardMeetingRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppointmentCalendarLocalId
   (
      This       : access IAppointmentCalendarForwardMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentLocalId
   (
      This       : access IAppointmentCalendarForwardMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentOriginalStartTime
   (
      This       : access IAppointmentCalendarForwardMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Invitees
   (
      This       : access IAppointmentCalendarForwardMeetingRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.IVectorView_IAppointmentInvitee -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IAppointmentCalendarForwardMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ForwardHeader
   (
      This       : access IAppointmentCalendarForwardMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Comment
   (
      This       : access IAppointmentCalendarForwardMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IAppointmentCalendarForwardMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IAppointmentCalendarForwardMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarProposeNewTimeForMeetingRequest : aliased constant Windows.IID := (3457967093, 60918, 17347, (130, 183, 190, 107, 54, 140, 105, 0 ));
   
   type IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppointmentCalendarLocalId
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentLocalId
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentOriginalStartTime
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NewStartTime
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_NewDuration
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Comment
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarUpdateMeetingResponseRequest : aliased constant Windows.IID := (2741854348, 49821, 19348, (176, 134, 126, 159, 247, 189, 132, 160 ));
   
   type IAppointmentCalendarUpdateMeetingResponseRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppointmentCalendarLocalId
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentLocalId
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppointmentOriginalStartTime
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Response
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentParticipantResponse
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Comment
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SendUpdate
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarSyncManagerSyncRequestEventArgs : aliased constant Windows.IID := (3390555895, 644, 20189, (135, 186, 77, 143, 105, 220, 245, 192 ));
   
   type IAppointmentCalendarSyncManagerSyncRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IAppointmentCalendarSyncManagerSyncRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarSyncManagerSyncRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAppointmentCalendarSyncManagerSyncRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs : aliased constant Windows.IID := (3482185000, 46, 19447, (142, 157, 94, 32, 212, 154, 163, 186 ));
   
   type IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCreateOrUpdateAppointmentRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarCancelMeetingRequestEventArgs : aliased constant Windows.IID := (444186134, 32560, 20021, (190, 239, 157, 44, 123, 109, 202, 225 ));
   
   type IAppointmentCalendarCancelMeetingRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IAppointmentCalendarCancelMeetingRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCancelMeetingRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAppointmentCalendarCancelMeetingRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarForwardMeetingRequestEventArgs : aliased constant Windows.IID := (822678810, 9122, 17149, (156, 130, 201, 166, 13, 89, 248, 168 ));
   
   type IAppointmentCalendarForwardMeetingRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IAppointmentCalendarForwardMeetingRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarForwardMeetingRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAppointmentCalendarForwardMeetingRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs : aliased constant Windows.IID := (3537336280, 65233, 17024, (163, 186, 46, 31, 71, 96, 154, 162 ));
   
   type IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarProposeNewTimeForMeetingRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentCalendarUpdateMeetingResponseRequestEventArgs : aliased constant Windows.IID := (2289408131, 38847, 18333, (174, 213, 11, 232, 206, 86, 125, 30 ));
   
   type IAppointmentCalendarUpdateMeetingResponseRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarUpdateMeetingResponseRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAppointmentCalendarUpdateMeetingResponseRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested : aliased constant Windows.IID := (938813047, 24378, 22502, (130, 245, 203, 171, 46, 77, 190, 142 ));
   
   type TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarSyncManagerSyncRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_SyncRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarSyncManagerSyncRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested : aliased constant Windows.IID := (3025227961, 57097, 23686, (181, 125, 62, 109, 239, 242, 71, 103 ));
   
   type TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_CreateOrUpdateAppointmentRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested : aliased constant Windows.IID := (245154264, 3366, 20999, (183, 217, 154, 209, 191, 102, 225, 230 ));
   
   type TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCancelMeetingRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_CancelMeetingRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCancelMeetingRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested : aliased constant Windows.IID := (2304890680, 60636, 21448, (176, 236, 231, 41, 216, 16, 148, 89 ));
   
   type TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarForwardMeetingRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_ForwardMeetingRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarForwardMeetingRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested : aliased constant Windows.IID := (1340367012, 59509, 22582, (158, 236, 39, 61, 82, 200, 106, 179 ));
   
   type TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested : aliased constant Windows.IID := (1399906091, 25293, 20787, (147, 230, 252, 128, 165, 2, 175, 100 ));
   
   type TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarUpdateMeetingResponseRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppointmentDataProviderConnection_add_UpdateMeetingResponseRequested_Interface
      ; sender : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection
      ; args : Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarUpdateMeetingResponseRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AppointmentDataProviderConnection is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderConnection;
   subtype AppointmentCalendarSyncManagerSyncRequestEventArgs is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarSyncManagerSyncRequestEventArgs;
   subtype AppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs;
   subtype AppointmentCalendarCancelMeetingRequestEventArgs is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCancelMeetingRequestEventArgs;
   subtype AppointmentCalendarForwardMeetingRequestEventArgs is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarForwardMeetingRequestEventArgs;
   subtype AppointmentCalendarProposeNewTimeForMeetingRequestEventArgs is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs;
   subtype AppointmentCalendarUpdateMeetingResponseRequestEventArgs is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarUpdateMeetingResponseRequestEventArgs;
   subtype AppointmentDataProviderTriggerDetails is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentDataProviderTriggerDetails;
   subtype AppointmentCalendarSyncManagerSyncRequest is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarSyncManagerSyncRequest;
   subtype AppointmentCalendarCreateOrUpdateAppointmentRequest is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCreateOrUpdateAppointmentRequest;
   subtype AppointmentCalendarCancelMeetingRequest is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarCancelMeetingRequest;
   subtype AppointmentCalendarForwardMeetingRequest is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarForwardMeetingRequest;
   subtype AppointmentCalendarProposeNewTimeForMeetingRequest is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarProposeNewTimeForMeetingRequest;
   subtype AppointmentCalendarUpdateMeetingResponseRequest is Windows.ApplicationModel.Appointments.DataProvider.IAppointmentCalendarUpdateMeetingResponseRequest;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
