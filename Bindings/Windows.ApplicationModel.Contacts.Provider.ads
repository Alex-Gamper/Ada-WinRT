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
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Contacts.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AddContactResult is (
      Added,
      AlreadyAdded,
      Unavailable
   );
   for AddContactResult use (
      Added => 0,
      AlreadyAdded => 1,
      Unavailable => 2
   );
   for AddContactResult'Size use 32;
   
   type AddContactResult_Ptr is access AddContactResult;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IContactPickerUI_add_ContactRemoved_Interface;
   type TypedEventHandler_IContactPickerUI_add_ContactRemoved is access all TypedEventHandler_IContactPickerUI_add_ContactRemoved_Interface'Class;
   type TypedEventHandler_IContactPickerUI_add_ContactRemoved_Ptr is access all TypedEventHandler_IContactPickerUI_add_ContactRemoved;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IContactRemovedEventArgs_Interface;
   type IContactRemovedEventArgs is access all IContactRemovedEventArgs_Interface'Class;
   type IContactRemovedEventArgs_Ptr is access all IContactRemovedEventArgs;
   type IContactPickerUI_Interface;
   type IContactPickerUI is access all IContactPickerUI_Interface'Class;
   type IContactPickerUI_Ptr is access all IContactPickerUI;
   type IContactPickerUI2_Interface;
   type IContactPickerUI2 is access all IContactPickerUI2_Interface'Class;
   type IContactPickerUI2_Ptr is access all IContactPickerUI2;
   
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
   
   IID_IContactRemovedEventArgs : aliased constant Windows.IID := (1865761592, 13058, 19731, (173, 141, 173, 204, 15, 249, 228, 124 ));
   
   type IContactRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IContactRemovedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactPickerUI : aliased constant Windows.IID := (3805025126, 53094, 17348, (169, 106, 165, 161, 18, 219, 71, 70 ));
   
   type IContactPickerUI_Interface is interface and Windows.IInspectable_Interface;
   
   function AddContact
   (
      This       : access IContactPickerUI_Interface
      ; id : Windows.String
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.ApplicationModel.Contacts.Provider.AddContactResult
   )
   return Windows.HRESULT is abstract;
   
   function RemoveContact
   (
      This       : access IContactPickerUI_Interface
      ; id : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ContainsContact
   (
      This       : access IContactPickerUI_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredFields
   (
      This       : access IContactPickerUI_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectionMode
   (
      This       : access IContactPickerUI_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.ContactSelectionMode
   )
   return Windows.HRESULT is abstract;
   
   function add_ContactRemoved
   (
      This       : access IContactPickerUI_Interface
      ; handler : TypedEventHandler_IContactPickerUI_add_ContactRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ContactRemoved
   (
      This       : access IContactPickerUI_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IContactPickerUI2 : aliased constant Windows.IID := (1849990696, 31525, 18841, (155, 11, 135, 84, 0, 161, 232, 200 ));
   
   type IContactPickerUI2_Interface is interface and Windows.IInspectable_Interface;
   
   function AddContact
   (
      This       : access IContactPickerUI2_Interface
      ; contact : Windows.ApplicationModel.Contacts.IContact
      ; RetVal : access Windows.ApplicationModel.Contacts.Provider.AddContactResult
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredFieldsWithContactFieldType
   (
      This       : access IContactPickerUI2_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVector_ContactFieldType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IContactPickerUI_add_ContactRemoved : aliased constant Windows.IID := (2744839038, 30300, 24195, (178, 49, 132, 190, 173, 152, 233, 160 ));
   
   type TypedEventHandler_IContactPickerUI_add_ContactRemoved_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Contacts.Provider.IContactPickerUI ; args : Windows.ApplicationModel.Contacts.Provider.IContactRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IContactPickerUI_add_ContactRemoved'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IContactPickerUI_add_ContactRemoved_Interface
      ; sender : Windows.ApplicationModel.Contacts.Provider.IContactPickerUI
      ; args : Windows.ApplicationModel.Contacts.Provider.IContactRemovedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ContactRemovedEventArgs is Windows.ApplicationModel.Contacts.Provider.IContactRemovedEventArgs;
   subtype ContactPickerUI is Windows.ApplicationModel.Contacts.Provider.IContactPickerUI;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
