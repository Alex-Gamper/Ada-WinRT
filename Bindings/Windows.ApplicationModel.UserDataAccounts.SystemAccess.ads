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
limited with Windows.Security.Credentials;
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.UserDataAccounts.SystemAccess is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DeviceAccountServerType is (
      Exchange,
      Pop,
      Imap
   );
   for DeviceAccountServerType use (
      Exchange => 0,
      Pop => 1,
      Imap => 2
   );
   for DeviceAccountServerType'Size use 32;
   
   type DeviceAccountServerType_Ptr is access DeviceAccountServerType;
   
   type DeviceAccountAuthenticationType is (
      Basic,
      OAuth,
      SingleSignOn
   );
   for DeviceAccountAuthenticationType use (
      Basic => 0,
      OAuth => 1,
      SingleSignOn => 2
   );
   for DeviceAccountAuthenticationType'Size use 32;
   
   type DeviceAccountAuthenticationType_Ptr is access DeviceAccountAuthenticationType;
   
   type DeviceAccountSyncScheduleKind is (
      Manual,
      Every15Minutes,
      Every30Minutes,
      Every60Minutes,
      Every2Hours,
      Daily,
      AsItemsArrive
   );
   for DeviceAccountSyncScheduleKind use (
      Manual => 0,
      Every15Minutes => 1,
      Every30Minutes => 2,
      Every60Minutes => 3,
      Every2Hours => 4,
      Daily => 5,
      AsItemsArrive => 6
   );
   for DeviceAccountSyncScheduleKind'Size use 32;
   
   type DeviceAccountSyncScheduleKind_Ptr is access DeviceAccountSyncScheduleKind;
   
   type DeviceAccountMailAgeFilter is (
      All_x,
      Last1Day,
      Last3Days,
      Last7Days,
      Last14Days,
      Last30Days,
      Last90Days
   );
   for DeviceAccountMailAgeFilter use (
      All_x => 0,
      Last1Day => 1,
      Last3Days => 2,
      Last7Days => 3,
      Last14Days => 4,
      Last30Days => 5,
      Last90Days => 6
   );
   for DeviceAccountMailAgeFilter'Size use 32;
   
   type DeviceAccountMailAgeFilter_Ptr is access DeviceAccountMailAgeFilter;
   
   type DeviceAccountIconId is (
      Exchange,
      Msa,
      Outlook,
      Generic_x
   );
   for DeviceAccountIconId use (
      Exchange => 0,
      Msa => 1,
      Outlook => 2,
      Generic_x => 3
   );
   for DeviceAccountIconId'Size use 32;
   
   type DeviceAccountIconId_Ptr is access DeviceAccountIconId;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IDeviceAccountConfiguration_Interface;
   type AsyncOperationCompletedHandler_IDeviceAccountConfiguration is access all AsyncOperationCompletedHandler_IDeviceAccountConfiguration_Interface'Class;
   type AsyncOperationCompletedHandler_IDeviceAccountConfiguration_Ptr is access all AsyncOperationCompletedHandler_IDeviceAccountConfiguration;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDeviceAccountConfiguration_Interface;
   type IDeviceAccountConfiguration is access all IDeviceAccountConfiguration_Interface'Class;
   type IDeviceAccountConfiguration_Ptr is access all IDeviceAccountConfiguration;
   type IDeviceAccountConfiguration2_Interface;
   type IDeviceAccountConfiguration2 is access all IDeviceAccountConfiguration2_Interface'Class;
   type IDeviceAccountConfiguration2_Ptr is access all IDeviceAccountConfiguration2;
   type IUserDataAccountSystemAccessManagerStatics_Interface;
   type IUserDataAccountSystemAccessManagerStatics is access all IUserDataAccountSystemAccessManagerStatics_Interface'Class;
   type IUserDataAccountSystemAccessManagerStatics_Ptr is access all IUserDataAccountSystemAccessManagerStatics;
   type IUserDataAccountSystemAccessManagerStatics2_Interface;
   type IUserDataAccountSystemAccessManagerStatics2 is access all IUserDataAccountSystemAccessManagerStatics2_Interface'Class;
   type IUserDataAccountSystemAccessManagerStatics2_Ptr is access all IUserDataAccountSystemAccessManagerStatics2;
   type IIterator_IDeviceAccountConfiguration_Interface;
   type IIterator_IDeviceAccountConfiguration is access all IIterator_IDeviceAccountConfiguration_Interface'Class;
   type IIterator_IDeviceAccountConfiguration_Ptr is access all IIterator_IDeviceAccountConfiguration;
   type IIterable_IDeviceAccountConfiguration_Interface;
   type IIterable_IDeviceAccountConfiguration is access all IIterable_IDeviceAccountConfiguration_Interface'Class;
   type IIterable_IDeviceAccountConfiguration_Ptr is access all IIterable_IDeviceAccountConfiguration;
   type IAsyncOperation_IDeviceAccountConfiguration_Interface;
   type IAsyncOperation_IDeviceAccountConfiguration is access all IAsyncOperation_IDeviceAccountConfiguration_Interface'Class;
   type IAsyncOperation_IDeviceAccountConfiguration_Ptr is access all IAsyncOperation_IDeviceAccountConfiguration;
   
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
   
   IID_IDeviceAccountConfiguration : aliased constant Windows.IID := (2902533027, 64476, 19739, (190, 67, 90, 39, 234, 74, 27, 99 ));
   
   type IDeviceAccountConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AccountName
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AccountName
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceAccountTypeId
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DeviceAccountTypeId
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerType
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountServerType
   )
   return Windows.HRESULT is abstract;
   
   function put_ServerType
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountServerType
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailAddress
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_EmailAddress
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Domain
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Domain
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EmailSyncEnabled
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EmailSyncEnabled
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ContactsSyncEnabled
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ContactsSyncEnabled
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CalendarSyncEnabled
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CalendarSyncEnabled
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IncomingServerAddress
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_IncomingServerAddress
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IncomingServerPort
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_IncomingServerPort
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IncomingServerRequiresSsl
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IncomingServerRequiresSsl
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IncomingServerUsername
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_IncomingServerUsername
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OutgoingServerAddress
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_OutgoingServerAddress
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OutgoingServerPort
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_OutgoingServerPort
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_OutgoingServerRequiresSsl
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_OutgoingServerRequiresSsl
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_OutgoingServerUsername
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_OutgoingServerUsername
   (
      This       : access IDeviceAccountConfiguration_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceAccountConfiguration2 : aliased constant Windows.IID := (4071810470, 29325, 19018, (137, 69, 43, 248, 88, 1, 54, 222 ));
   
   type IDeviceAccountConfiguration2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IncomingServerCredential
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_IncomingServerCredential
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_OutgoingServerCredential
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_OutgoingServerCredential
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_OAuthRefreshToken
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_OAuthRefreshToken
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsExternallyManaged
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsExternallyManaged
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AccountIconId
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountIconId
   )
   return Windows.HRESULT is abstract;
   
   function put_AccountIconId
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountIconId
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationType
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountAuthenticationType
   )
   return Windows.HRESULT is abstract;
   
   function put_AuthenticationType
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountAuthenticationType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSsoAuthenticationSupported
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SsoAccountId
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SsoAccountId
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AlwaysDownloadFullMessage
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AlwaysDownloadFullMessage
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DoesPolicyAllowMailSync
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SyncScheduleKind
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountSyncScheduleKind
   )
   return Windows.HRESULT is abstract;
   
   function put_SyncScheduleKind
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountSyncScheduleKind
   )
   return Windows.HRESULT is abstract;
   
   function get_MailAgeFilter
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountMailAgeFilter
   )
   return Windows.HRESULT is abstract;
   
   function put_MailAgeFilter
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountMailAgeFilter
   )
   return Windows.HRESULT is abstract;
   
   function get_IsClientAuthenticationCertificateRequired
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsClientAuthenticationCertificateRequired
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoSelectAuthenticationCertificate
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoSelectAuthenticationCertificate
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationCertificateId
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AuthenticationCertificateId
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CardDavSyncScheduleKind
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountSyncScheduleKind
   )
   return Windows.HRESULT is abstract;
   
   function put_CardDavSyncScheduleKind
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountSyncScheduleKind
   )
   return Windows.HRESULT is abstract;
   
   function get_CalDavSyncScheduleKind
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountSyncScheduleKind
   )
   return Windows.HRESULT is abstract;
   
   function put_CalDavSyncScheduleKind
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountSyncScheduleKind
   )
   return Windows.HRESULT is abstract;
   
   function get_CardDavServerUrl
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_CardDavServerUrl
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_CardDavRequiresSsl
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CardDavRequiresSsl
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CalDavServerUrl
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_CalDavServerUrl
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_CalDavRequiresSsl
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CalDavRequiresSsl
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_WasModifiedByUser
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_WasModifiedByUser
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_WasIncomingServerCertificateHashConfirmed
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_WasIncomingServerCertificateHashConfirmed
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IncomingServerCertificateHash
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_IncomingServerCertificateHash
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOutgoingServerAuthenticationRequired
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsOutgoingServerAuthenticationRequired
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOutgoingServerAuthenticationEnabled
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsOutgoingServerAuthenticationEnabled
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_WasOutgoingServerCertificateHashConfirmed
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_WasOutgoingServerCertificateHashConfirmed
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_OutgoingServerCertificateHash
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_OutgoingServerCertificateHash
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSyncScheduleManagedBySystem
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSyncScheduleManagedBySystem
   (
      This       : access IDeviceAccountConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataAccountSystemAccessManagerStatics : aliased constant Windows.IID := (2641039801, 52197, 17909, (130, 43, 194, 103, 184, 29, 189, 182 ));
   
   type IUserDataAccountSystemAccessManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function AddAndShowDeviceAccountsAsync
   (
      This       : access IUserDataAccountSystemAccessManagerStatics_Interface
      ; accounts : Windows.ApplicationModel.UserDataAccounts.SystemAccess.IIterable_IDeviceAccountConfiguration
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataAccountSystemAccessManagerStatics2 : aliased constant Windows.IID := (2487190861, 19278, 17311, (131, 211, 151, 155, 39, 192, 90, 199 ));
   
   type IUserDataAccountSystemAccessManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function SuppressLocalAccountWithAccountAsync
   (
      This       : access IUserDataAccountSystemAccessManagerStatics2_Interface
      ; userDataAccountId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CreateDeviceAccountAsync
   (
      This       : access IUserDataAccountSystemAccessManagerStatics2_Interface
      ; account : Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteDeviceAccountAsync
   (
      This       : access IUserDataAccountSystemAccessManagerStatics2_Interface
      ; accountId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceAccountConfigurationAsync
   (
      This       : access IUserDataAccountSystemAccessManagerStatics2_Interface
      ; accountId : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.IAsyncOperation_IDeviceAccountConfiguration -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IDeviceAccountConfiguration : aliased constant Windows.IID := (1366317703, 36299, 22897, (141, 107, 202, 138, 230, 169, 85, 173 ));
   
   type IIterator_IDeviceAccountConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IDeviceAccountConfiguration_Interface
      ; items : Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IDeviceAccountConfiguration : aliased constant Windows.IID := (2848189038, 40409, 21246, (157, 39, 249, 228, 222, 221, 77, 63 ));
   
   type IIterable_IDeviceAccountConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.IIterator_IDeviceAccountConfiguration
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IDeviceAccountConfiguration : aliased constant Windows.IID := (1184389619, 27515, 21401, (138, 140, 254, 97, 91, 149, 174, 7 ));
   
   type IAsyncOperation_IDeviceAccountConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDeviceAccountConfiguration_Interface
      ; handler : Windows.ApplicationModel.UserDataAccounts.SystemAccess.AsyncOperationCompletedHandler_IDeviceAccountConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.AsyncOperationCompletedHandler_IDeviceAccountConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDeviceAccountConfiguration_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IDeviceAccountConfiguration : aliased constant Windows.IID := (3421383752, 58349, 24253, (164, 174, 86, 88, 51, 136, 164, 154 ));
   
   type AsyncOperationCompletedHandler_IDeviceAccountConfiguration_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.UserDataAccounts.SystemAccess.IAsyncOperation_IDeviceAccountConfiguration ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IDeviceAccountConfiguration'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDeviceAccountConfiguration_Interface
      ; asyncInfo : Windows.ApplicationModel.UserDataAccounts.SystemAccess.IAsyncOperation_IDeviceAccountConfiguration
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DeviceAccountConfiguration is Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration;
   
   function CreateDeviceAccountConfiguration return Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function AddAndShowDeviceAccountsAsync
   (
      accounts : Windows.ApplicationModel.UserDataAccounts.SystemAccess.IIterable_IDeviceAccountConfiguration
   )
   return Windows.Address;
   
   function SuppressLocalAccountWithAccountAsync
   (
      userDataAccountId : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function CreateDeviceAccountAsync
   (
      account : Windows.ApplicationModel.UserDataAccounts.SystemAccess.IDeviceAccountConfiguration
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function DeleteDeviceAccountAsync
   (
      accountId : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function GetDeviceAccountConfigurationAsync
   (
      accountId : Windows.String
   )
   return Windows.ApplicationModel.UserDataAccounts.SystemAccess.IAsyncOperation_IDeviceAccountConfiguration;
   

end;
