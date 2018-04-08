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
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Contacts.DataProvider is

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
   
   type TypedEventHandler_IContactDataProviderConnection_add_SyncRequested_Interface;
   type TypedEventHandler_IContactDataProviderConnection_add_SyncRequested is access all TypedEventHandler_IContactDataProviderConnection_add_SyncRequested_Interface'Class;
   type TypedEventHandler_IContactDataProviderConnection_add_SyncRequested_Ptr is access all TypedEventHandler_IContactDataProviderConnection_add_SyncRequested;
   type TypedEventHandler_IContactDataProviderConnection_add_ServerSearchReadBatchRequested_Interface;
   type TypedEventHandler_IContactDataProviderConnection_add_ServerSearchReadBatchRequested is access all TypedEventHandler_IContactDataProviderConnection_add_ServerSearchReadBatchRequested_Interface'Class;
   type TypedEventHandler_IContactDataProviderConnection_add_ServerSearchReadBatchRequested_Ptr is access all TypedEventHandler_IContactDataProviderConnection_add_ServerSearchReadBatchRequested;
   type TypedEventHandler_IContactDataProviderConnection2_add_CreateOrUpdateContactRequested_Interface;
   type TypedEventHandler_IContactDataProviderConnection2_add_CreateOrUpdateContactRequested is access all TypedEventHandler_IContactDataProviderConnection2_add_CreateOrUpdateContactRequested_Interface'Class;
   type TypedEventHandler_IContactDataProviderConnection2_add_CreateOrUpdateContactRequested_Ptr is access all TypedEventHandler_IContactDataProviderConnection2_add_CreateOrUpdateContactRequested;
   type TypedEventHandler_IContactDataProviderConnection2_add_DeleteContactRequested_Interface;
   type TypedEventHandler_IContactDataProviderConnection2_add_DeleteContactRequested is access all TypedEventHandler_IContactDataProviderConnection2_add_DeleteContactRequested_Interface'Class;
   type TypedEventHandler_IContactDataProviderConnection2_add_DeleteContactRequested_Ptr is access all TypedEventHandler_IContactDataProviderConnection2_add_DeleteContactRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IContactDataProviderTriggerDetails_Interface;
   type IContactDataProviderTriggerDetails is access all IContactDataProviderTriggerDetails_Interface'Class;
   type IContactDataProviderTriggerDetails_Ptr is access all IContactDataProviderTriggerDetails;
   type IContactDataProviderConnection_Interface;
   type IContactDataProviderConnection is access all IContactDataProviderConnection_Interface'Class;
   type IContactDataProviderConnection_Ptr is access all IContactDataProviderConnection;
   type IContactDataProviderConnection2_Interface;
   type IContactDataProviderConnection2 is access all IContactDataProviderConnection2_Interface'Class;
   type IContactDataProviderConnection2_Ptr is access all IContactDataProviderConnection2;
   type IContactListSyncManagerSyncRequest_Interface;
   type IContactListSyncManagerSyncRequest is access all IContactListSyncManagerSyncRequest_Interface'Class;
   type IContactListSyncManagerSyncRequest_Ptr is access all IContactListSyncManagerSyncRequest;
   type IContactListServerSearchReadBatchRequest_Interface;
   type IContactListServerSearchReadBatchRequest is access all IContactListServerSearchReadBatchRequest_Interface'Class;
   type IContactListServerSearchReadBatchRequest_Ptr is access all IContactListServerSearchReadBatchRequest;
   type IContactListCreateOrUpdateContactRequest_Interface;
   type IContactListCreateOrUpdateContactRequest is access all IContactListCreateOrUpdateContactRequest_Interface'Class;
   type IContactListCreateOrUpdateContactRequest_Ptr is access all IContactListCreateOrUpdateContactRequest;
   type IContactListDeleteContactRequest_Interface;
   type IContactListDeleteContactRequest is access all IContactListDeleteContactRequest_Interface'Class;
   type IContactListDeleteContactRequest_Ptr is access all IContactListDeleteContactRequest;
   type IContactListSyncManagerSyncRequestEventArgs_Interface;
   type IContactListSyncManagerSyncRequestEventArgs is access all IContactListSyncManagerSyncRequestEventArgs_Interface'Class;
   type IContactListSyncManagerSyncRequestEventArgs_Ptr is access all IContactListSyncManagerSyncRequestEventArgs;
   type IContactListServerSearchReadBatchRequestEventArgs_Interface;
   type IContactListServerSearchReadBatchRequestEventArgs is access all IContactListServerSearchReadBatchRequestEventArgs_Interface'Class;
   type IContactListServerSearchReadBatchRequestEventArgs_Ptr is access all IContactListServerSearchReadBatchRequestEventArgs;
   type IContactListCreateOrUpdateContactRequestEventArgs_Interface;
   type IContactListCreateOrUpdateContactRequestEventArgs is access all IContactListCreateOrUpdateContactRequestEventArgs_Interface'Class;
   type IContactListCreateOrUpdateContactRequestEventArgs_Ptr is access all IContactListCreateOrUpdateContactRequestEventArgs;
   type IContactListDeleteContactRequestEventArgs_Interface;
   type IContactListDeleteContactRequestEventArgs is access all IContactListDeleteContactRequestEventArgs_Interface'Class;
   type IContactListDeleteContactRequestEventArgs_Ptr is access all IContactListDeleteContactRequestEventArgs;
   
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
   
   IID_IContactDataProviderTriggerDetails : aliased constant Windows.IID := (1383138494, 15458, 17352, (154, 231, 219, 83, 22, 133, 205, 153 ));
   
   type IContactDataProviderTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Connection
   (
      This       : access IContactDataProviderTriggerDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderConnection
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactDataProviderConnection : aliased constant Windows.IID := (439978578, 35997, 19823, (164, 224, 17, 30, 154, 18, 90, 48 ));
   
   type IContactDataProviderConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SyncRequested
   (
      This       : access IContactDataProviderConnection_Interface
      ; handler : TypedEventHandler_IContactDataProviderConnection_add_SyncRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SyncRequested
   (
      This       : access IContactDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ServerSearchReadBatchRequested
   (
      This       : access IContactDataProviderConnection_Interface
      ; handler : TypedEventHandler_IContactDataProviderConnection_add_ServerSearchReadBatchRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ServerSearchReadBatchRequested
   (
      This       : access IContactDataProviderConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IContactDataProviderConnection_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactDataProviderConnection2 : aliased constant Windows.IID := (2714970032, 6508, 19453, (143, 15, 198, 141, 103, 242, 73, 211 ));
   
   type IContactDataProviderConnection2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_CreateOrUpdateContactRequested
   (
      This       : access IContactDataProviderConnection2_Interface
      ; handler : TypedEventHandler_IContactDataProviderConnection2_add_CreateOrUpdateContactRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CreateOrUpdateContactRequested
   (
      This       : access IContactDataProviderConnection2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DeleteContactRequested
   (
      This       : access IContactDataProviderConnection2_Interface
      ; handler : TypedEventHandler_IContactDataProviderConnection2_add_DeleteContactRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DeleteContactRequested
   (
      This       : access IContactDataProviderConnection2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactListSyncManagerSyncRequest : aliased constant Windows.IID := (1007572900, 50407, 18800, (154, 143, 154, 102, 162, 187, 108, 26 ));
   
   type IContactListSyncManagerSyncRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactListId
   (
      This       : access IContactListSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IContactListSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IContactListSyncManagerSyncRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactListServerSearchReadBatchRequest : aliased constant Windows.IID := (3128388247, 16432, 18725, (159, 180, 20, 59, 41, 94, 101, 59 ));
   
   type IContactListServerSearchReadBatchRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SessionId
   (
      This       : access IContactListServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContactListId
   (
      This       : access IContactListServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Options
   (
      This       : access IContactListServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactQueryOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_SuggestedBatchSize
   (
      This       : access IContactListServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SaveContactAsync
   (
      This       : access IContactListServerSearchReadBatchRequest_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IContactListServerSearchReadBatchRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IContactListServerSearchReadBatchRequest_Interface
      ; batchStatus : Windows.ApplicationModel.Contacts.ContactBatchStatus
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactListCreateOrUpdateContactRequest : aliased constant Windows.IID := (3031384351, 51273, 18384, (177, 25, 145, 207, 96, 91, 47, 42 ));
   
   type IContactListCreateOrUpdateContactRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactListId
   (
      This       : access IContactListCreateOrUpdateContactRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactListCreateOrUpdateContactRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IContactListCreateOrUpdateContactRequest_Interface
      ; createdOrUpdatedContact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IContactListCreateOrUpdateContactRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactListDeleteContactRequest : aliased constant Windows.IID := (1578190471, 52739, 19941, (133, 87, 156, 207, 85, 45, 71, 42 ));
   
   type IContactListDeleteContactRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactListId
   (
      This       : access IContactListDeleteContactRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContactId
   (
      This       : access IContactListDeleteContactRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedAsync
   (
      This       : access IContactListDeleteContactRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ReportFailedAsync
   (
      This       : access IContactListDeleteContactRequest_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactListSyncManagerSyncRequestEventArgs : aliased constant Windows.IID := (361647532, 17517, 20240, (175, 194, 2, 104, 62, 197, 51, 166 ));
   
   type IContactListSyncManagerSyncRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IContactListSyncManagerSyncRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.DataProvider.IContactListSyncManagerSyncRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IContactListSyncManagerSyncRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactListServerSearchReadBatchRequestEventArgs : aliased constant Windows.IID := (438823035, 27095, 20046, (128, 66, 134, 28, 186, 97, 71, 30 ));
   
   type IContactListServerSearchReadBatchRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IContactListServerSearchReadBatchRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.DataProvider.IContactListServerSearchReadBatchRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IContactListServerSearchReadBatchRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactListCreateOrUpdateContactRequestEventArgs : aliased constant Windows.IID := (2233210512, 6737, 19212, (174, 239, 18, 64, 172, 91, 237, 117 ));
   
   type IContactListCreateOrUpdateContactRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IContactListCreateOrUpdateContactRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.DataProvider.IContactListCreateOrUpdateContactRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IContactListCreateOrUpdateContactRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactListDeleteContactRequestEventArgs : aliased constant Windows.IID := (2988463265, 59642, 19893, (147, 137, 45, 18, 238, 125, 21, 238 ));
   
   type IContactListDeleteContactRequestEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IContactListDeleteContactRequestEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.DataProvider.IContactListDeleteContactRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IContactListDeleteContactRequestEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IContactDataProviderConnection_add_SyncRequested : aliased constant Windows.IID := (3147776271, 42809, 21120, (155, 183, 182, 169, 56, 199, 166, 32 ));
   
   type TypedEventHandler_IContactDataProviderConnection_add_SyncRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderConnection ; args : Windows.ApplicationModel.Contacts.DataProvider.IContactListSyncManagerSyncRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IContactDataProviderConnection_add_SyncRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IContactDataProviderConnection_add_SyncRequested_Interface
      ; sender : Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderConnection
      ; args : Windows.ApplicationModel.Contacts.DataProvider.IContactListSyncManagerSyncRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IContactDataProviderConnection_add_ServerSearchReadBatchRequested : aliased constant Windows.IID := (3136166703, 42422, 23043, (174, 89, 251, 24, 243, 224, 37, 183 ));
   
   type TypedEventHandler_IContactDataProviderConnection_add_ServerSearchReadBatchRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderConnection ; args : Windows.ApplicationModel.Contacts.DataProvider.IContactListServerSearchReadBatchRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IContactDataProviderConnection_add_ServerSearchReadBatchRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IContactDataProviderConnection_add_ServerSearchReadBatchRequested_Interface
      ; sender : Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderConnection
      ; args : Windows.ApplicationModel.Contacts.DataProvider.IContactListServerSearchReadBatchRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IContactDataProviderConnection2_add_CreateOrUpdateContactRequested : aliased constant Windows.IID := (2609949366, 31651, 20841, (183, 60, 126, 100, 19, 210, 189, 87 ));
   
   type TypedEventHandler_IContactDataProviderConnection2_add_CreateOrUpdateContactRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderConnection ; args : Windows.ApplicationModel.Contacts.DataProvider.IContactListCreateOrUpdateContactRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IContactDataProviderConnection2_add_CreateOrUpdateContactRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IContactDataProviderConnection2_add_CreateOrUpdateContactRequested_Interface
      ; sender : Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderConnection
      ; args : Windows.ApplicationModel.Contacts.DataProvider.IContactListCreateOrUpdateContactRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IContactDataProviderConnection2_add_DeleteContactRequested : aliased constant Windows.IID := (2683553639, 46216, 21474, (164, 148, 50, 112, 97, 97, 202, 1 ));
   
   type TypedEventHandler_IContactDataProviderConnection2_add_DeleteContactRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderConnection ; args : Windows.ApplicationModel.Contacts.DataProvider.IContactListDeleteContactRequestEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IContactDataProviderConnection2_add_DeleteContactRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IContactDataProviderConnection2_add_DeleteContactRequested_Interface
      ; sender : Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderConnection
      ; args : Windows.ApplicationModel.Contacts.DataProvider.IContactListDeleteContactRequestEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ContactDataProviderConnection is Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderConnection;
   subtype ContactListSyncManagerSyncRequestEventArgs is Windows.ApplicationModel.Contacts.DataProvider.IContactListSyncManagerSyncRequestEventArgs;
   subtype ContactListServerSearchReadBatchRequestEventArgs is Windows.ApplicationModel.Contacts.DataProvider.IContactListServerSearchReadBatchRequestEventArgs;
   subtype ContactListCreateOrUpdateContactRequestEventArgs is Windows.ApplicationModel.Contacts.DataProvider.IContactListCreateOrUpdateContactRequestEventArgs;
   subtype ContactListDeleteContactRequestEventArgs is Windows.ApplicationModel.Contacts.DataProvider.IContactListDeleteContactRequestEventArgs;
   subtype ContactDataProviderTriggerDetails is Windows.ApplicationModel.Contacts.DataProvider.IContactDataProviderTriggerDetails;
   subtype ContactListSyncManagerSyncRequest is Windows.ApplicationModel.Contacts.DataProvider.IContactListSyncManagerSyncRequest;
   subtype ContactListServerSearchReadBatchRequest is Windows.ApplicationModel.Contacts.DataProvider.IContactListServerSearchReadBatchRequest;
   subtype ContactListCreateOrUpdateContactRequest is Windows.ApplicationModel.Contacts.DataProvider.IContactListCreateOrUpdateContactRequest;
   subtype ContactListDeleteContactRequest is Windows.ApplicationModel.Contacts.DataProvider.IContactListDeleteContactRequest;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
