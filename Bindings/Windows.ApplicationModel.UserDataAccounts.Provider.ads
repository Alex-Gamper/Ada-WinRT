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
package Windows.ApplicationModel.UserDataAccounts.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type UserDataAccountProviderOperationKind is (
      AddAccount,
      Settings,
      ResolveErrors
   );
   for UserDataAccountProviderOperationKind use (
      AddAccount => 0,
      Settings => 1,
      ResolveErrors => 2
   );
   for UserDataAccountProviderOperationKind'Size use 32;
   
   type UserDataAccountProviderOperationKind_Ptr is access UserDataAccountProviderOperationKind;
   
   type UserDataAccountProviderPartnerAccountKind is (
      Exchange,
      PopOrImap
   );
   for UserDataAccountProviderPartnerAccountKind use (
      Exchange => 0,
      PopOrImap => 1
   );
   for UserDataAccountProviderPartnerAccountKind'Size use 32;
   
   type UserDataAccountProviderPartnerAccountKind_Ptr is access UserDataAccountProviderPartnerAccountKind;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IUserDataAccountProviderOperation_Interface;
   type IUserDataAccountProviderOperation is access all IUserDataAccountProviderOperation_Interface'Class;
   type IUserDataAccountProviderOperation_Ptr is access all IUserDataAccountProviderOperation;
   type IUserDataAccountProviderAddAccountOperation_Interface;
   type IUserDataAccountProviderAddAccountOperation is access all IUserDataAccountProviderAddAccountOperation_Interface'Class;
   type IUserDataAccountProviderAddAccountOperation_Ptr is access all IUserDataAccountProviderAddAccountOperation;
   type IUserDataAccountPartnerAccountInfo_Interface;
   type IUserDataAccountPartnerAccountInfo is access all IUserDataAccountPartnerAccountInfo_Interface'Class;
   type IUserDataAccountPartnerAccountInfo_Ptr is access all IUserDataAccountPartnerAccountInfo;
   type IUserDataAccountProviderSettingsOperation_Interface;
   type IUserDataAccountProviderSettingsOperation is access all IUserDataAccountProviderSettingsOperation_Interface'Class;
   type IUserDataAccountProviderSettingsOperation_Ptr is access all IUserDataAccountProviderSettingsOperation;
   type IUserDataAccountProviderResolveErrorsOperation_Interface;
   type IUserDataAccountProviderResolveErrorsOperation is access all IUserDataAccountProviderResolveErrorsOperation_Interface'Class;
   type IUserDataAccountProviderResolveErrorsOperation_Ptr is access all IUserDataAccountProviderResolveErrorsOperation;
   type IIterator_IUserDataAccountPartnerAccountInfo_Interface;
   type IIterator_IUserDataAccountPartnerAccountInfo is access all IIterator_IUserDataAccountPartnerAccountInfo_Interface'Class;
   type IIterator_IUserDataAccountPartnerAccountInfo_Ptr is access all IIterator_IUserDataAccountPartnerAccountInfo;
   type IIterable_IUserDataAccountPartnerAccountInfo_Interface;
   type IIterable_IUserDataAccountPartnerAccountInfo is access all IIterable_IUserDataAccountPartnerAccountInfo_Interface'Class;
   type IIterable_IUserDataAccountPartnerAccountInfo_Ptr is access all IIterable_IUserDataAccountPartnerAccountInfo;
   type IVectorView_IUserDataAccountPartnerAccountInfo_Interface;
   type IVectorView_IUserDataAccountPartnerAccountInfo is access all IVectorView_IUserDataAccountPartnerAccountInfo_Interface'Class;
   type IVectorView_IUserDataAccountPartnerAccountInfo_Ptr is access all IVectorView_IUserDataAccountPartnerAccountInfo;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IUserDataAccountProviderOperation : aliased constant Windows.IID := (2718608739, 34956, 19042, (163, 221, 52, 208, 122, 128, 43, 43 ));
   
   type IUserDataAccountProviderOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IUserDataAccountProviderOperation_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.Provider.UserDataAccountProviderOperationKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataAccountProviderAddAccountOperation : aliased constant Windows.IID := (3116836144, 16260, 19293, (142, 170, 69, 233, 122, 168, 66, 237 ));
   
   type IUserDataAccountProviderAddAccountOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentKinds
   (
      This       : access IUserDataAccountProviderAddAccountOperation_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.UserDataAccountContentKinds
   )
   return Windows.HRESULT is abstract;
   
   function get_PartnerAccountInfos
   (
      This       : access IUserDataAccountProviderAddAccountOperation_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.Provider.IVectorView_IUserDataAccountPartnerAccountInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompleted
   (
      This       : access IUserDataAccountProviderAddAccountOperation_Interface
      ; userDataAccountId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataAccountPartnerAccountInfo : aliased constant Windows.IID := (1595932727, 63215, 20163, (134, 48, 1, 44, 89, 193, 20, 159 ));
   
   type IUserDataAccountPartnerAccountInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IUserDataAccountPartnerAccountInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Priority
   (
      This       : access IUserDataAccountPartnerAccountInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AccountKind
   (
      This       : access IUserDataAccountPartnerAccountInfo_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.Provider.UserDataAccountProviderPartnerAccountKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataAccountProviderSettingsOperation : aliased constant Windows.IID := (2449690039, 34376, 20272, (172, 250, 48, 2, 101, 140, 168, 13 ));
   
   type IUserDataAccountProviderSettingsOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UserDataAccountId
   (
      This       : access IUserDataAccountProviderSettingsOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompleted
   (
      This       : access IUserDataAccountProviderSettingsOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataAccountProviderResolveErrorsOperation : aliased constant Windows.IID := (1647696917, 49099, 16865, (153, 87, 151, 89, 162, 136, 70, 204 ));
   
   type IUserDataAccountProviderResolveErrorsOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UserDataAccountId
   (
      This       : access IUserDataAccountProviderResolveErrorsOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompleted
   (
      This       : access IUserDataAccountProviderResolveErrorsOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IUserDataAccountPartnerAccountInfo : aliased constant Windows.IID := (2889882406, 16063, 23743, (150, 67, 201, 106, 64, 171, 64, 162 ));
   
   type IIterator_IUserDataAccountPartnerAccountInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUserDataAccountPartnerAccountInfo_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountPartnerAccountInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUserDataAccountPartnerAccountInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUserDataAccountPartnerAccountInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUserDataAccountPartnerAccountInfo_Interface
      ; items : Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountPartnerAccountInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IUserDataAccountPartnerAccountInfo : aliased constant Windows.IID := (1557873246, 55898, 22010, (179, 73, 84, 103, 153, 108, 171, 50 ));
   
   type IIterable_IUserDataAccountPartnerAccountInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUserDataAccountPartnerAccountInfo_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.Provider.IIterator_IUserDataAccountPartnerAccountInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IUserDataAccountPartnerAccountInfo : aliased constant Windows.IID := (3073437843, 58107, 23328, (157, 158, 79, 157, 239, 230, 71, 176 ));
   
   type IVectorView_IUserDataAccountPartnerAccountInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUserDataAccountPartnerAccountInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountPartnerAccountInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUserDataAccountPartnerAccountInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUserDataAccountPartnerAccountInfo_Interface
      ; value : Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountPartnerAccountInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUserDataAccountPartnerAccountInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountPartnerAccountInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype UserDataAccountPartnerAccountInfo is Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountPartnerAccountInfo;
   subtype UserDataAccountProviderAddAccountOperation is Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountProviderAddAccountOperation;
   subtype UserDataAccountProviderSettingsOperation is Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountProviderSettingsOperation;
   subtype UserDataAccountProviderResolveErrorsOperation is Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountProviderResolveErrorsOperation;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
