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
with Windows.UI.ViewManagement;
with Windows.UI.Popups;
with Windows.Storage.Streams;
with Windows.System;
with Windows.Data.Text;
with Windows.UI;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Contacts is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContactStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore
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
      This       : access AsyncOperationCompletedHandler_IContact_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContact
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
      This       : access AsyncOperationCompletedHandler_IContactAnnotationStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationStore
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
      This       : access AsyncOperationCompletedHandler_IContactAnnotationList_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationList
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
      This       : access AsyncOperationCompletedHandler_IContactAnnotation_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotation
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
      This       : access TypedEventHandler_IContactStore2_add_ContactChanged_Interface
      ; sender : Windows.ApplicationModel.Contacts.IContactStore
      ; args : Windows.ApplicationModel.Contacts.IContactChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Contacts.IContactStore(sender), Windows.ApplicationModel.Contacts.IContactChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContactList_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactList
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
      This       : access TypedEventHandler_IContactList_add_ContactChanged_Interface
      ; sender : Windows.ApplicationModel.Contacts.IContactList
      ; args : Windows.ApplicationModel.Contacts.IContactChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Contacts.IContactList(sender), Windows.ApplicationModel.Contacts.IContactChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IContactListSyncManager_add_SyncStatusChanged_Interface
      ; sender : Windows.ApplicationModel.Contacts.IContactListSyncManager
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Contacts.IContactListSyncManager(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContactBatch_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactBatch
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
      This       : access AsyncOperationCompletedHandler_IContactInformation_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IContactInformation
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
      This       : access AsyncOperationCompletedHandler_IPinnedContactIdsQueryResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Contacts.IAsyncOperation_IPinnedContactIdsQueryResult
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
      This       : access TypedEventHandler_IContactPanel_add_LaunchFullAppRequested_Interface
      ; sender : Windows.ApplicationModel.Contacts.IContactPanel
      ; args : Windows.ApplicationModel.Contacts.IContactPanelLaunchFullAppRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Contacts.IContactPanel(sender), Windows.ApplicationModel.Contacts.IContactPanelLaunchFullAppRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IContactPanel_add_Closing_Interface
      ; sender : Windows.ApplicationModel.Contacts.IContactPanel
      ; args : Windows.ApplicationModel.Contacts.IContactPanelClosingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Contacts.IContactPanel(sender), Windows.ApplicationModel.Contacts.IContactPanelClosingEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateContactCardOptions return Windows.ApplicationModel.Contacts.IContactCardOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactCardOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactCardOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactCardOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateFullContactCardOptions return Windows.ApplicationModel.Contacts.IFullContactCardOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.FullContactCardOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IFullContactCardOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IFullContactCardOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactAnnotation return Windows.ApplicationModel.Contacts.IContactAnnotation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactAnnotation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactAnnotation) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactAnnotation'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactQueryOptions return Windows.ApplicationModel.Contacts.IContactQueryOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactQueryOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactQueryOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactQueryOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactPicker return Windows.ApplicationModel.Contacts.IContactPicker is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactPicker");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactPicker) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactPicker'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactPhone return Windows.ApplicationModel.Contacts.IContactPhone is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactPhone");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactPhone) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactPhone'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactEmail return Windows.ApplicationModel.Contacts.IContactEmail is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactEmail");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactEmail) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactEmail'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactAddress return Windows.ApplicationModel.Contacts.IContactAddress is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactAddress");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactAddress) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactAddress'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactConnectedServiceAccount return Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactConnectedServiceAccount");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactConnectedServiceAccount) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactConnectedServiceAccount'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactDate return Windows.ApplicationModel.Contacts.IContactDate is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactDate");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactDate) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactDate'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactJobInfo return Windows.ApplicationModel.Contacts.IContactJobInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactJobInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactJobInfo) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactJobInfo'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactSignificantOther return Windows.ApplicationModel.Contacts.IContactSignificantOther is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactSignificantOther");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactSignificantOther) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactSignificantOther'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactWebsite return Windows.ApplicationModel.Contacts.IContactWebsite is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactWebsite");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactWebsite) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactWebsite'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContact return Windows.ApplicationModel.Contacts.IContact is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.Contact");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContact) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContact'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateField_Default
   (
      value : Windows.String
      ; type_x : Windows.ApplicationModel.Contacts.ContactFieldType
   )
   return Windows.ApplicationModel.Contacts.IContactField is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactField");
      m_Factory     : Windows.ApplicationModel.Contacts.IContactFieldFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactField := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactFieldFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateField_Default(value, type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateField_Category
   (
      value : Windows.String
      ; type_x : Windows.ApplicationModel.Contacts.ContactFieldType
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
   )
   return Windows.ApplicationModel.Contacts.IContactField is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactField");
      m_Factory     : Windows.ApplicationModel.Contacts.IContactFieldFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactField := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactFieldFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateField_Category(value, type_x, category, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateField_Custom
   (
      name : Windows.String
      ; value : Windows.String
      ; type_x : Windows.ApplicationModel.Contacts.ContactFieldType
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
   )
   return Windows.ApplicationModel.Contacts.IContactField is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactField");
      m_Factory     : Windows.ApplicationModel.Contacts.IContactFieldFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactField := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactFieldFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateField_Custom(name, value, type_x, category, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateLocation_Default
   (
      unstructuredAddress : Windows.String
   )
   return Windows.ApplicationModel.Contacts.IContactLocationField is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactLocationField");
      m_Factory     : Windows.ApplicationModel.Contacts.IContactLocationFieldFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactLocationField := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactLocationFieldFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateLocation_Default(unstructuredAddress, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateLocation_Category
   (
      unstructuredAddress : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
   )
   return Windows.ApplicationModel.Contacts.IContactLocationField is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactLocationField");
      m_Factory     : Windows.ApplicationModel.Contacts.IContactLocationFieldFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactLocationField := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactLocationFieldFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateLocation_Category(unstructuredAddress, category, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
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
   return Windows.ApplicationModel.Contacts.IContactLocationField is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactLocationField");
      m_Factory     : Windows.ApplicationModel.Contacts.IContactLocationFieldFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactLocationField := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactLocationFieldFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateLocation_All(unstructuredAddress, category, street, city, region, country, postalCode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstantMessage_Default
   (
      userName : Windows.String
   )
   return Windows.ApplicationModel.Contacts.IContactInstantMessageField is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactInstantMessageField");
      m_Factory     : Windows.ApplicationModel.Contacts.IContactInstantMessageFieldFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactInstantMessageField := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactInstantMessageFieldFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstantMessage_Default(userName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstantMessage_Category
   (
      userName : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
   )
   return Windows.ApplicationModel.Contacts.IContactInstantMessageField is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactInstantMessageField");
      m_Factory     : Windows.ApplicationModel.Contacts.IContactInstantMessageFieldFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactInstantMessageField := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactInstantMessageFieldFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstantMessage_Category(userName, category, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstantMessage_All
   (
      userName : Windows.String
      ; category : Windows.ApplicationModel.Contacts.ContactFieldCategory
      ; service : Windows.String
      ; displayText : Windows.String
      ; verb : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.ApplicationModel.Contacts.IContactInstantMessageField is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactInstantMessageField");
      m_Factory     : Windows.ApplicationModel.Contacts.IContactInstantMessageFieldFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactInstantMessageField := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactInstantMessageFieldFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstantMessage_All(userName, category, service, displayText, verb, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateContactFieldFactory return Windows.ApplicationModel.Contacts.IContactFieldFactory is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactFieldFactory");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Contacts.IContactFieldFactory) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Contacts.IID_IContactFieldFactory'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   procedure ShowContactCard
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowContactCard(contact, selection);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ShowContactCardWithPlacement
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowContactCardWithPlacement(contact, selection, preferredPlacement);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function ShowDelayLoadedContactCard
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.ApplicationModel.Contacts.IContactCardDelayedDataLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactCardDelayedDataLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowDelayLoadedContactCard(contact, selection, preferredPlacement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestStoreAsync
   return Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStoreAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ConvertContactToVCardAsync
   (
      contact : Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConvertContactToVCardAsync(contact, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ConvertContactToVCardAsyncWithMaxBytes
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; maxBytes : Windows.UInt32
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConvertContactToVCardAsyncWithMaxBytes(contact, maxBytes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ConvertVCardToContactAsync
   (
      vCard : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.ApplicationModel.Contacts.IAsyncOperation_IContact is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IAsyncOperation_IContact;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConvertVCardToContactAsync(vCard, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestStoreAsyncWithAccessType
   (
      accessType : Windows.ApplicationModel.Contacts.ContactStoreAccessType
   )
   return Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IAsyncOperation_IContactStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStoreAsyncWithAccessType(accessType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAnnotationStoreAsync
   (
      accessType : Windows.ApplicationModel.Contacts.ContactAnnotationStoreAccessType
   )
   return Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IAsyncOperation_IContactAnnotationStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAnnotationStoreAsync(accessType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsShowContactCardSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsShowContactCardSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ShowContactCardWithOptions
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; contactCardOptions : Windows.ApplicationModel.Contacts.IContactCardOptions
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowContactCardWithOptions(contact, selection, preferredPlacement, contactCardOptions);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function IsShowDelayLoadedContactCardSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsShowDelayLoadedContactCardSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowDelayLoadedContactCardWithOptions
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; contactCardOptions : Windows.ApplicationModel.Contacts.IContactCardOptions
   )
   return Windows.ApplicationModel.Contacts.IContactCardDelayedDataLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactCardDelayedDataLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowDelayLoadedContactCardWithOptions(contact, selection, preferredPlacement, contactCardOptions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ShowFullContactCard
   (
      contact : Windows.ApplicationModel.Contacts.IContact
      ; fullContactCardOptions : Windows.ApplicationModel.Contacts.IFullContactCardOptions
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowFullContactCard(contact, fullContactCardOptions);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_SystemDisplayNameOrder
   return Windows.ApplicationModel.Contacts.ContactNameOrder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.ContactNameOrder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SystemDisplayNameOrder(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_SystemDisplayNameOrder
   (
      value : Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_SystemDisplayNameOrder(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_SystemSortOrder
   return Windows.ApplicationModel.Contacts.ContactNameOrder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.ContactNameOrder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SystemSortOrder(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_SystemSortOrder
   (
      value : Windows.ApplicationModel.Contacts.ContactNameOrder
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_SystemSortOrder(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function IsShowFullContactCardSupportedAsync
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsShowFullContactCardSupportedAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IncludeMiddleNameInSystemDisplayAndSort
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IncludeMiddleNameInSystemDisplayAndSort(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_IncludeMiddleNameInSystemDisplayAndSort
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_IncludeMiddleNameInSystemDisplayAndSort(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Contacts.IContactManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactManager");
      m_Factory     : IContactManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Call
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs");
      m_Factory     : IContactLaunchActionVerbsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactLaunchActionVerbsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Call(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Message
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs");
      m_Factory     : IContactLaunchActionVerbsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactLaunchActionVerbsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Message(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Map
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs");
      m_Factory     : IContactLaunchActionVerbsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactLaunchActionVerbsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Map(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Post
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs");
      m_Factory     : IContactLaunchActionVerbsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactLaunchActionVerbsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Post(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoCall
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs");
      m_Factory     : IContactLaunchActionVerbsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactLaunchActionVerbsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoCall(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Contacts.IContactPicker is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactPicker");
      m_Factory     : IContactPickerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IContactPicker;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactPickerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupportedAsync
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.ContactPicker");
      m_Factory     : IContactPickerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContactPickerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupportedAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.ApplicationModel.Contacts.IPinnedContactManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.PinnedContactManager");
      m_Factory     : IPinnedContactManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IPinnedContactManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPinnedContactManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Contacts.IPinnedContactManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.PinnedContactManager");
      m_Factory     : IPinnedContactManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Contacts.IPinnedContactManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPinnedContactManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Contacts.PinnedContactManager");
      m_Factory     : IPinnedContactManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPinnedContactManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
