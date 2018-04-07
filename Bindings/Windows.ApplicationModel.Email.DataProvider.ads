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
with Windows.Foundation.Collections;
limited with Windows.Security.Cryptography.Certificates;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Email.DataProvider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested;
   type TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested_Interface;
   type TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested is access all TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested_Interface'Class;
   type TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested_Ptr is access all TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IEmailDataProviderTriggerDetails_Interface;
   type IEmailDataProviderTriggerDetails is access all IEmailDataProviderTriggerDetails_Interface'Class;
   type IEmailDataProviderTriggerDetails_Ptr is access all IEmailDataProviderTriggerDetails;
   type IEmailDataProviderConnection_Interface;
   type IEmailDataProviderConnection is access all IEmailDataProviderConnection_Interface'Class;
   type IEmailDataProviderConnection_Ptr is access all IEmailDataProviderConnection;
   type IEmailMailboxSyncManagerSyncRequest_Interface;
   type IEmailMailboxSyncManagerSyncRequest is access all IEmailMailboxSyncManagerSyncRequest_Interface'Class;
   type IEmailMailboxSyncManagerSyncRequest_Ptr is access all IEmailMailboxSyncManagerSyncRequest;
   type IEmailMailboxDownloadMessageRequest_Interface;
   type IEmailMailboxDownloadMessageRequest is access all IEmailMailboxDownloadMessageRequest_Interface'Class;
   type IEmailMailboxDownloadMessageRequest_Ptr is access all IEmailMailboxDownloadMessageRequest;
   type IEmailMailboxDownloadAttachmentRequest_Interface;
   type IEmailMailboxDownloadAttachmentRequest is access all IEmailMailboxDownloadAttachmentRequest_Interface'Class;
   type IEmailMailboxDownloadAttachmentRequest_Ptr is access all IEmailMailboxDownloadAttachmentRequest;
   type IEmailMailboxCreateFolderRequest_Interface;
   type IEmailMailboxCreateFolderRequest is access all IEmailMailboxCreateFolderRequest_Interface'Class;
   type IEmailMailboxCreateFolderRequest_Ptr is access all IEmailMailboxCreateFolderRequest;
   type IEmailMailboxDeleteFolderRequest_Interface;
   type IEmailMailboxDeleteFolderRequest is access all IEmailMailboxDeleteFolderRequest_Interface'Class;
   type IEmailMailboxDeleteFolderRequest_Ptr is access all IEmailMailboxDeleteFolderRequest;
   type IEmailMailboxEmptyFolderRequest_Interface;
   type IEmailMailboxEmptyFolderRequest is access all IEmailMailboxEmptyFolderRequest_Interface'Class;
   type IEmailMailboxEmptyFolderRequest_Ptr is access all IEmailMailboxEmptyFolderRequest;
   type IEmailMailboxMoveFolderRequest_Interface;
   type IEmailMailboxMoveFolderRequest is access all IEmailMailboxMoveFolderRequest_Interface'Class;
   type IEmailMailboxMoveFolderRequest_Ptr is access all IEmailMailboxMoveFolderRequest;
   type IEmailMailboxUpdateMeetingResponseRequest_Interface;
   type IEmailMailboxUpdateMeetingResponseRequest is access all IEmailMailboxUpdateMeetingResponseRequest_Interface'Class;
   type IEmailMailboxUpdateMeetingResponseRequest_Ptr is access all IEmailMailboxUpdateMeetingResponseRequest;
   type IEmailMailboxForwardMeetingRequest_Interface;
   type IEmailMailboxForwardMeetingRequest is access all IEmailMailboxForwardMeetingRequest_Interface'Class;
   type IEmailMailboxForwardMeetingRequest_Ptr is access all IEmailMailboxForwardMeetingRequest;
   type IEmailMailboxProposeNewTimeForMeetingRequest_Interface;
   type IEmailMailboxProposeNewTimeForMeetingRequest is access all IEmailMailboxProposeNewTimeForMeetingRequest_Interface'Class;
   type IEmailMailboxProposeNewTimeForMeetingRequest_Ptr is access all IEmailMailboxProposeNewTimeForMeetingRequest;
   type IEmailMailboxSetAutoReplySettingsRequest_Interface;
   type IEmailMailboxSetAutoReplySettingsRequest is access all IEmailMailboxSetAutoReplySettingsRequest_Interface'Class;
   type IEmailMailboxSetAutoReplySettingsRequest_Ptr is access all IEmailMailboxSetAutoReplySettingsRequest;
   type IEmailMailboxGetAutoReplySettingsRequest_Interface;
   type IEmailMailboxGetAutoReplySettingsRequest is access all IEmailMailboxGetAutoReplySettingsRequest_Interface'Class;
   type IEmailMailboxGetAutoReplySettingsRequest_Ptr is access all IEmailMailboxGetAutoReplySettingsRequest;
   type IEmailMailboxResolveRecipientsRequest_Interface;
   type IEmailMailboxResolveRecipientsRequest is access all IEmailMailboxResolveRecipientsRequest_Interface'Class;
   type IEmailMailboxResolveRecipientsRequest_Ptr is access all IEmailMailboxResolveRecipientsRequest;
   type IEmailMailboxValidateCertificatesRequest_Interface;
   type IEmailMailboxValidateCertificatesRequest is access all IEmailMailboxValidateCertificatesRequest_Interface'Class;
   type IEmailMailboxValidateCertificatesRequest_Ptr is access all IEmailMailboxValidateCertificatesRequest;
   type IEmailMailboxServerSearchReadBatchRequest_Interface;
   type IEmailMailboxServerSearchReadBatchRequest is access all IEmailMailboxServerSearchReadBatchRequest_Interface'Class;
   type IEmailMailboxServerSearchReadBatchRequest_Ptr is access all IEmailMailboxServerSearchReadBatchRequest;
   type IEmailMailboxSyncManagerSyncRequestEventArgs_Interface;
   type IEmailMailboxSyncManagerSyncRequestEventArgs is access all IEmailMailboxSyncManagerSyncRequestEventArgs_Interface'Class;
   type IEmailMailboxSyncManagerSyncRequestEventArgs_Ptr is access all IEmailMailboxSyncManagerSyncRequestEventArgs;
   type IEmailMailboxDownloadMessageRequestEventArgs_Interface;
   type IEmailMailboxDownloadMessageRequestEventArgs is access all IEmailMailboxDownloadMessageRequestEventArgs_Interface'Class;
   type IEmailMailboxDownloadMessageRequestEventArgs_Ptr is access all IEmailMailboxDownloadMessageRequestEventArgs;
   type IEmailMailboxDownloadAttachmentRequestEventArgs_Interface;
   type IEmailMailboxDownloadAttachmentRequestEventArgs is access all IEmailMailboxDownloadAttachmentRequestEventArgs_Interface'Class;
   type IEmailMailboxDownloadAttachmentRequestEventArgs_Ptr is access all IEmailMailboxDownloadAttachmentRequestEventArgs;
   type IEmailMailboxCreateFolderRequestEventArgs_Interface;
   type IEmailMailboxCreateFolderRequestEventArgs is access all IEmailMailboxCreateFolderRequestEventArgs_Interface'Class;
   type IEmailMailboxCreateFolderRequestEventArgs_Ptr is access all IEmailMailboxCreateFolderRequestEventArgs;
   type IEmailMailboxDeleteFolderRequestEventArgs_Interface;
   type IEmailMailboxDeleteFolderRequestEventArgs is access all IEmailMailboxDeleteFolderRequestEventArgs_Interface'Class;
   type IEmailMailboxDeleteFolderRequestEventArgs_Ptr is access all IEmailMailboxDeleteFolderRequestEventArgs;
   type IEmailMailboxEmptyFolderRequestEventArgs_Interface;
   type IEmailMailboxEmptyFolderRequestEventArgs is access all IEmailMailboxEmptyFolderRequestEventArgs_Interface'Class;
   type IEmailMailboxEmptyFolderRequestEventArgs_Ptr is access all IEmailMailboxEmptyFolderRequestEventArgs;
   type IEmailMailboxMoveFolderRequestEventArgs_Interface;
   type IEmailMailboxMoveFolderRequestEventArgs is access all IEmailMailboxMoveFolderRequestEventArgs_Interface'Class;
   type IEmailMailboxMoveFolderRequestEventArgs_Ptr is access all IEmailMailboxMoveFolderRequestEventArgs;
   type IEmailMailboxUpdateMeetingResponseRequestEventArgs_Interface;
   type IEmailMailboxUpdateMeetingResponseRequestEventArgs is access all IEmailMailboxUpdateMeetingResponseRequestEventArgs_Interface'Class;
   type IEmailMailboxUpdateMeetingResponseRequestEventArgs_Ptr is access all IEmailMailboxUpdateMeetingResponseRequestEventArgs;
   type IEmailMailboxForwardMeetingRequestEventArgs_Interface;
   type IEmailMailboxForwardMeetingRequestEventArgs is access all IEmailMailboxForwardMeetingRequestEventArgs_Interface'Class;
   type IEmailMailboxForwardMeetingRequestEventArgs_Ptr is access all IEmailMailboxForwardMeetingRequestEventArgs;
   type IEmailMailboxProposeNewTimeForMeetingRequestEventArgs_Interface;
   type IEmailMailboxProposeNewTimeForMeetingRequestEventArgs is access all IEmailMailboxProposeNewTimeForMeetingRequestEventArgs_Interface'Class;
   type IEmailMailboxProposeNewTimeForMeetingRequestEventArgs_Ptr is access all IEmailMailboxProposeNewTimeForMeetingRequestEventArgs;
   type IEmailMailboxSetAutoReplySettingsRequestEventArgs_Interface;
   type IEmailMailboxSetAutoReplySettingsRequestEventArgs is access all IEmailMailboxSetAutoReplySettingsRequestEventArgs_Interface'Class;
   type IEmailMailboxSetAutoReplySettingsRequestEventArgs_Ptr is access all IEmailMailboxSetAutoReplySettingsRequestEventArgs;
   type IEmailMailboxGetAutoReplySettingsRequestEventArgs_Interface;
   type IEmailMailboxGetAutoReplySettingsRequestEventArgs is access all IEmailMailboxGetAutoReplySettingsRequestEventArgs_Interface'Class;
   type IEmailMailboxGetAutoReplySettingsRequestEventArgs_Ptr is access all IEmailMailboxGetAutoReplySettingsRequestEventArgs;
   type IEmailMailboxResolveRecipientsRequestEventArgs_Interface;
   type IEmailMailboxResolveRecipientsRequestEventArgs is access all IEmailMailboxResolveRecipientsRequestEventArgs_Interface'Class;
   type IEmailMailboxResolveRecipientsRequestEventArgs_Ptr is access all IEmailMailboxResolveRecipientsRequestEventArgs;
   type IEmailMailboxValidateCertificatesRequestEventArgs_Interface;
   type IEmailMailboxValidateCertificatesRequestEventArgs is access all IEmailMailboxValidateCertificatesRequestEventArgs_Interface'Class;
   type IEmailMailboxValidateCertificatesRequestEventArgs_Ptr is access all IEmailMailboxValidateCertificatesRequestEventArgs;
   type IEmailMailboxServerSearchReadBatchRequestEventArgs_Interface;
   type IEmailMailboxServerSearchReadBatchRequestEventArgs is access all IEmailMailboxServerSearchReadBatchRequestEventArgs_Interface'Class;
   type IEmailMailboxServerSearchReadBatchRequestEventArgs_Ptr is access all IEmailMailboxServerSearchReadBatchRequestEventArgs;
   
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
   type IEmailDataProviderTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Connection
   (
      This       : access IEmailDataProviderTriggerDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailDataProviderTriggerDetails : aliased constant Windows.IID := (2403225168, 13342, 17907, (187, 160, 132, 160, 5, 225, 49, 154 ));
   
   ------------------------------------------------------------------------
   type IEmailDataProviderConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MailboxSyncRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MailboxSyncRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DownloadMessageRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DownloadMessageRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DownloadAttachmentRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DownloadAttachmentRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CreateFolderRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CreateFolderRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DeleteFolderRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DeleteFolderRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EmptyFolderRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EmptyFolderRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MoveFolderRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MoveFolderRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UpdateMeetingResponseRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UpdateMeetingResponseRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ForwardMeetingRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ForwardMeetingRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ProposeNewTimeForMeetingRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ProposeNewTimeForMeetingRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SetAutoReplySettingsRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SetAutoReplySettingsRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_GetAutoReplySettingsRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GetAutoReplySettingsRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ResolveRecipientsRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ResolveRecipientsRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ValidateCertificatesRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ValidateCertificatesRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ServerSearchReadBatchRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; handler : TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ServerSearchReadBatchRequested
   (
      This       : access IEmailDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IEmailDataProviderConnection_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailDataProviderConnection : aliased constant Windows.IID := (1000119751, 14258, 19440, (174, 48, 123, 100, 74, 28, 150, 225 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxSyncManagerSyncRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxSyncManagerSyncRequest : aliased constant Windows.IID := (1309731044, 32359, 16474, (182, 115, 220, 96, 201, 16, 144, 252 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxDownloadMessageRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxDownloadMessageRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailMessageId
   (
      This       : access IEmailMailboxDownloadMessageRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxDownloadMessageRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxDownloadMessageRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxDownloadMessageRequest : aliased constant Windows.IID := (1232814471, 23373, 19235, (129, 108, 243, 132, 43, 235, 117, 62 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxDownloadAttachmentRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxDownloadAttachmentRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailMessageId
   (
      This       : access IEmailMailboxDownloadAttachmentRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailAttachmentId
   (
      This       : access IEmailMailboxDownloadAttachmentRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxDownloadAttachmentRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxDownloadAttachmentRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxDownloadAttachmentRequest : aliased constant Windows.IID := (186497972, 29964, 18657, (188, 228, 141, 88, 150, 132, 255, 188 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxCreateFolderRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxCreateFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ParentFolderId
   (
      This       : access IEmailMailboxCreateFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IEmailMailboxCreateFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxCreateFolderRequest_Interface
      ; folder : Windows.ApplicationModel.Email.IEmailFolder
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxCreateFolderRequest_Interface
      ; status : Windows.ApplicationModel.Email.EmailMailboxCreateFolderStatus
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxCreateFolderRequest : aliased constant Windows.IID := (407713653, 51489, 19513, (163, 9, 225, 108, 159, 34, 176, 75 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxDeleteFolderRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxDeleteFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailFolderId
   (
      This       : access IEmailMailboxDeleteFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxDeleteFolderRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxDeleteFolderRequest_Interface
      ; status : Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxDeleteFolderRequest : aliased constant Windows.IID := (2489968778, 43313, 18297, (146, 61, 9, 163, 234, 41, 46, 41 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxEmptyFolderRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxEmptyFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailFolderId
   (
      This       : access IEmailMailboxEmptyFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxEmptyFolderRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxEmptyFolderRequest_Interface
      ; status : Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxEmptyFolderRequest : aliased constant Windows.IID := (4266329003, 63597, 18137, (180, 206, 188, 138, 109, 158, 146, 104 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxMoveFolderRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxMoveFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailFolderId
   (
      This       : access IEmailMailboxMoveFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NewParentFolderId
   (
      This       : access IEmailMailboxMoveFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NewFolderName
   (
      This       : access IEmailMailboxMoveFolderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxMoveFolderRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxMoveFolderRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxMoveFolderRequest : aliased constant Windows.IID := (280635478, 19093, 16488, (145, 204, 103, 204, 122, 207, 69, 79 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxUpdateMeetingResponseRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailMessageId
   (
      This       : access IEmailMailboxUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Response
   (
      This       : access IEmailMailboxUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMeetingResponseType
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IEmailMailboxUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Comment
   (
      This       : access IEmailMailboxUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SendUpdate
   (
      This       : access IEmailMailboxUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxUpdateMeetingResponseRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxUpdateMeetingResponseRequest : aliased constant Windows.IID := (1536797843, 45775, 18568, (186, 79, 48, 107, 107, 102, 223, 48 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxForwardMeetingRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxForwardMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailMessageId
   (
      This       : access IEmailMailboxForwardMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Recipients
   (
      This       : access IEmailMailboxForwardMeetingRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IVectorView_IEmailRecipient -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IEmailMailboxForwardMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ForwardHeaderType
   (
      This       : access IEmailMailboxForwardMeetingRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMessageBodyKind
   )
   return Windows.HRESULT is abstract;
   
   function get_ForwardHeader
   (
      This       : access IEmailMailboxForwardMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Comment
   (
      This       : access IEmailMailboxForwardMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxForwardMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxForwardMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxForwardMeetingRequest : aliased constant Windows.IID := (1634560753, 28884, 18482, (184, 105, 184, 5, 66, 174, 155, 232 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxProposeNewTimeForMeetingRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailMessageId
   (
      This       : access IEmailMailboxProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NewStartTime
   (
      This       : access IEmailMailboxProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_NewDuration
   (
      This       : access IEmailMailboxProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IEmailMailboxProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Comment
   (
      This       : access IEmailMailboxProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxProposeNewTimeForMeetingRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxProposeNewTimeForMeetingRequest : aliased constant Windows.IID := (1525674322, 38809, 20383, (163, 153, 255, 7, 243, 238, 240, 78 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxSetAutoReplySettingsRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxSetAutoReplySettingsRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoReplySettings
   (
      This       : access IEmailMailboxSetAutoReplySettingsRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailMailboxAutoReplySettings
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxSetAutoReplySettingsRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxSetAutoReplySettingsRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxSetAutoReplySettingsRequest : aliased constant Windows.IID := (1973691088, 43150, 20052, (141, 199, 194, 67, 24, 107, 119, 78 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxGetAutoReplySettingsRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxGetAutoReplySettingsRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestedFormat
   (
      This       : access IEmailMailboxGetAutoReplySettingsRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Email.EmailMailboxAutoReplyMessageResponseKind
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxGetAutoReplySettingsRequest_Interface
      ; autoReplySettings : Windows.ApplicationModel.Email.IEmailMailboxAutoReplySettings
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxGetAutoReplySettingsRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxGetAutoReplySettingsRequest : aliased constant Windows.IID := (2604140425, 7816, 19969, (132, 204, 19, 134, 173, 154, 44, 47 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxResolveRecipientsRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxResolveRecipientsRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Recipients
   (
      This       : access IEmailMailboxResolveRecipientsRequest_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxResolveRecipientsRequest_Interface
      ; resolutionResults : Windows.ApplicationModel.Email.IIterable_IEmailRecipientResolutionResult
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxResolveRecipientsRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxResolveRecipientsRequest : aliased constant Windows.IID := (4020555632, 31545, 19611, (129, 30, 65, 234, 244, 58, 51, 45 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxValidateCertificatesRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxValidateCertificatesRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Certificates
   (
      This       : access IEmailMailboxValidateCertificatesRequest_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxValidateCertificatesRequest_Interface
      ; validationStatuses : Windows.ApplicationModel.Email.IIterable_EmailCertificateValidationStatus
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxValidateCertificatesRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxValidateCertificatesRequest : aliased constant Windows.IID := (2840410417, 57626, 20375, (184, 26, 24, 122, 112, 168, 244, 26 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxServerSearchReadBatchRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SessionId
   (
      This       : access IEmailMailboxServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailMailboxId
   (
      This       : access IEmailMailboxServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailFolderId
   (
      This       : access IEmailMailboxServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Options
   (
      This       : access IEmailMailboxServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Email.IEmailQueryOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_SuggestedBatchSize
   (
      This       : access IEmailMailboxServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SaveMessageAsync
   (
      This       : access IEmailMailboxServerSearchReadBatchRequest_Interface
      ; message : Windows.ApplicationModel.Email.IEmailMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IEmailMailboxServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IEmailMailboxServerSearchReadBatchRequest_Interface
      ; batchStatus : Windows.ApplicationModel.Email.EmailBatchStatus
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxServerSearchReadBatchRequest : aliased constant Windows.IID := (151972831, 23190, 16851, (138, 216, 52, 145, 47, 154, 166, 14 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxSyncManagerSyncRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxSyncManagerSyncRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSyncManagerSyncRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxSyncManagerSyncRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxSyncManagerSyncRequestEventArgs : aliased constant Windows.IID := (1134166810, 36812, 19173, (185, 181, 212, 52, 224, 166, 90, 168 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxDownloadMessageRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxDownloadMessageRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadMessageRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxDownloadMessageRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxDownloadMessageRequestEventArgs : aliased constant Windows.IID := (1191446957, 53408, 19035, (187, 42, 55, 98, 16, 57, 197, 62 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxDownloadAttachmentRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxDownloadAttachmentRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadAttachmentRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxDownloadAttachmentRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxDownloadAttachmentRequestEventArgs : aliased constant Windows.IID := (3437085805, 65448, 18551, (159, 157, 254, 215, 188, 175, 65, 4 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxCreateFolderRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxCreateFolderRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxCreateFolderRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxCreateFolderRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxCreateFolderRequestEventArgs : aliased constant Windows.IID := (65323052, 9244, 20137, (166, 143, 255, 32, 188, 90, 252, 133 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxDeleteFolderRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxDeleteFolderRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDeleteFolderRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxDeleteFolderRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxDeleteFolderRequestEventArgs : aliased constant Windows.IID := (3033738502, 9010, 18040, (131, 120, 40, 181, 121, 51, 104, 70 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxEmptyFolderRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxEmptyFolderRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxEmptyFolderRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxEmptyFolderRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxEmptyFolderRequestEventArgs : aliased constant Windows.IID := (1904473220, 39002, 19136, (179, 63, 238, 14, 38, 39, 163, 192 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxMoveFolderRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxMoveFolderRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxMoveFolderRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxMoveFolderRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxMoveFolderRequestEventArgs : aliased constant Windows.IID := (945958944, 5306, 19592, (134, 152, 114, 57, 227, 200, 170, 167 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxUpdateMeetingResponseRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxUpdateMeetingResponseRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxUpdateMeetingResponseRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxUpdateMeetingResponseRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxUpdateMeetingResponseRequestEventArgs : aliased constant Windows.IID := (1754847073, 22217, 20247, (190, 49, 102, 253, 169, 75, 161, 89 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxForwardMeetingRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxForwardMeetingRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxForwardMeetingRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxForwardMeetingRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxForwardMeetingRequestEventArgs : aliased constant Windows.IID := (735638330, 10612, 18265, (165, 165, 88, 244, 77, 60, 2, 117 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxProposeNewTimeForMeetingRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxProposeNewTimeForMeetingRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxProposeNewTimeForMeetingRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxProposeNewTimeForMeetingRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxProposeNewTimeForMeetingRequestEventArgs : aliased constant Windows.IID := (4215802776, 13229, 19047, (130, 81, 15, 156, 36, 155, 106, 32 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxSetAutoReplySettingsRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxSetAutoReplySettingsRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSetAutoReplySettingsRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxSetAutoReplySettingsRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxSetAutoReplySettingsRequestEventArgs : aliased constant Windows.IID := (165286317, 55242, 16519, (172, 134, 83, 250, 103, 247, 98, 70 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxGetAutoReplySettingsRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxGetAutoReplySettingsRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxGetAutoReplySettingsRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxGetAutoReplySettingsRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxGetAutoReplySettingsRequestEventArgs : aliased constant Windows.IID := (3617543618, 64837, 16388, (138, 145, 155, 172, 243, 139, 112, 34 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxResolveRecipientsRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxResolveRecipientsRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxResolveRecipientsRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxResolveRecipientsRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxResolveRecipientsRequestEventArgs : aliased constant Windows.IID := (638557698, 45775, 16632, (140, 40, 227, 237, 67, 177, 232, 154 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxValidateCertificatesRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxValidateCertificatesRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxValidateCertificatesRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxValidateCertificatesRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxValidateCertificatesRequestEventArgs : aliased constant Windows.IID := (629391127, 767, 18942, (167, 60, 3, 243, 117, 102, 198, 145 ));
   
   ------------------------------------------------------------------------
   type IEmailMailboxServerSearchReadBatchRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IEmailMailboxServerSearchReadBatchRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Email.DataProvider.IEmailMailboxServerSearchReadBatchRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IEmailMailboxServerSearchReadBatchRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IEmailMailboxServerSearchReadBatchRequestEventArgs : aliased constant Windows.IID := (336599886, 60830, 17873, (173, 122, 204, 155, 127, 100, 58, 226 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSyncManagerSyncRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSyncManagerSyncRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested : aliased constant Windows.IID := (3059729388, 38006, 20932, (186, 112, 21, 5, 215, 152, 38, 185 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadMessageRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadMessageRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested : aliased constant Windows.IID := (3786775343, 56789, 20825, (174, 154, 20, 168, 102, 145, 32, 149 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadAttachmentRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadAttachmentRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested : aliased constant Windows.IID := (3538493465, 47511, 23766, (143, 136, 77, 188, 111, 150, 159, 21 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxCreateFolderRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxCreateFolderRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested : aliased constant Windows.IID := (2357048621, 18798, 21529, (189, 120, 184, 182, 87, 207, 78, 102 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDeleteFolderRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDeleteFolderRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested : aliased constant Windows.IID := (3647121846, 48052, 23938, (132, 180, 143, 112, 59, 243, 8, 111 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxEmptyFolderRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxEmptyFolderRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested : aliased constant Windows.IID := (2592414596, 48305, 20769, (171, 97, 62, 254, 86, 143, 104, 61 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxMoveFolderRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxMoveFolderRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested : aliased constant Windows.IID := (745272008, 17139, 21053, (128, 219, 23, 14, 79, 177, 86, 127 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxUpdateMeetingResponseRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxUpdateMeetingResponseRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested : aliased constant Windows.IID := (846527485, 49418, 23344, (173, 234, 43, 75, 134, 11, 74, 13 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxForwardMeetingRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxForwardMeetingRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested : aliased constant Windows.IID := (2640970111, 23152, 23939, (166, 128, 210, 128, 103, 72, 202, 11 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxProposeNewTimeForMeetingRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxProposeNewTimeForMeetingRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested : aliased constant Windows.IID := (815631326, 7776, 21067, (130, 140, 90, 61, 100, 166, 114, 170 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSetAutoReplySettingsRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSetAutoReplySettingsRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested : aliased constant Windows.IID := (2857340851, 1504, 21734, (175, 172, 162, 142, 133, 62, 117, 110 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxGetAutoReplySettingsRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxGetAutoReplySettingsRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested : aliased constant Windows.IID := (1484550034, 43369, 22451, (137, 95, 154, 6, 179, 101, 13, 58 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxResolveRecipientsRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxResolveRecipientsRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested : aliased constant Windows.IID := (3960792454, 58619, 24512, (145, 252, 147, 28, 225, 122, 63, 195 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxValidateCertificatesRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxValidateCertificatesRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested : aliased constant Windows.IID := (3727042039, 57711, 20782, (168, 198, 183, 68, 85, 50, 188, 198 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxServerSearchReadBatchRequestEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxServerSearchReadBatchRequestEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested : aliased constant Windows.IID := (4173303911, 32017, 22176, (163, 3, 22, 52, 53, 193, 64, 22 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype EmailDataProviderConnection is Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection;
   subtype EmailMailboxSyncManagerSyncRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSyncManagerSyncRequestEventArgs;
   subtype EmailMailboxDownloadMessageRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadMessageRequestEventArgs;
   subtype EmailMailboxDownloadAttachmentRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadAttachmentRequestEventArgs;
   subtype EmailMailboxCreateFolderRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxCreateFolderRequestEventArgs;
   subtype EmailMailboxDeleteFolderRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDeleteFolderRequestEventArgs;
   subtype EmailMailboxEmptyFolderRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxEmptyFolderRequestEventArgs;
   subtype EmailMailboxMoveFolderRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxMoveFolderRequestEventArgs;
   subtype EmailMailboxUpdateMeetingResponseRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxUpdateMeetingResponseRequestEventArgs;
   subtype EmailMailboxForwardMeetingRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxForwardMeetingRequestEventArgs;
   subtype EmailMailboxProposeNewTimeForMeetingRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxProposeNewTimeForMeetingRequestEventArgs;
   subtype EmailMailboxSetAutoReplySettingsRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSetAutoReplySettingsRequestEventArgs;
   subtype EmailMailboxGetAutoReplySettingsRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxGetAutoReplySettingsRequestEventArgs;
   subtype EmailMailboxResolveRecipientsRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxResolveRecipientsRequestEventArgs;
   subtype EmailMailboxValidateCertificatesRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxValidateCertificatesRequestEventArgs;
   subtype EmailMailboxServerSearchReadBatchRequestEventArgs is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxServerSearchReadBatchRequestEventArgs;
   subtype EmailDataProviderTriggerDetails is Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderTriggerDetails;
   subtype EmailMailboxSyncManagerSyncRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSyncManagerSyncRequest;
   subtype EmailMailboxDownloadMessageRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadMessageRequest;
   subtype EmailMailboxDownloadAttachmentRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadAttachmentRequest;
   subtype EmailMailboxCreateFolderRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxCreateFolderRequest;
   subtype EmailMailboxDeleteFolderRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDeleteFolderRequest;
   subtype EmailMailboxEmptyFolderRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxEmptyFolderRequest;
   subtype EmailMailboxMoveFolderRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxMoveFolderRequest;
   subtype EmailMailboxUpdateMeetingResponseRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxUpdateMeetingResponseRequest;
   subtype EmailMailboxForwardMeetingRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxForwardMeetingRequest;
   subtype EmailMailboxProposeNewTimeForMeetingRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxProposeNewTimeForMeetingRequest;
   subtype EmailMailboxSetAutoReplySettingsRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSetAutoReplySettingsRequest;
   subtype EmailMailboxGetAutoReplySettingsRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxGetAutoReplySettingsRequest;
   subtype EmailMailboxResolveRecipientsRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxResolveRecipientsRequest;
   subtype EmailMailboxValidateCertificatesRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxValidateCertificatesRequest;
   subtype EmailMailboxServerSearchReadBatchRequest is Windows.ApplicationModel.Email.DataProvider.IEmailMailboxServerSearchReadBatchRequest;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
