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
limited with Windows.Storage;
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
limited with Windows.Networking;
--------------------------------------------------------------------------------
package Windows.Security.EnterpriseData is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ProtectionPolicyEvaluationResult is (
      Allowed,
      Blocked,
      ConsentRequired
   );
   for ProtectionPolicyEvaluationResult use (
      Allowed => 0,
      Blocked => 1,
      ConsentRequired => 2
   );
   for ProtectionPolicyEvaluationResult'Size use 32;
   
   type ProtectionPolicyEvaluationResult_Ptr is access ProtectionPolicyEvaluationResult;
   
   type FileProtectionStatus is (
      Unknown,
      Unprotected,
      Revoked,
      Protected_x,
      NotProtectable,
      ProtectedToOtherIdentity,
      LicenseExpired,
      AccessSuspended,
      FileInUse
   );
   for FileProtectionStatus use (
      Unknown => 0,
      Unprotected => 1,
      Revoked => 2,
      Protected_x => 3,
      NotProtectable => 6,
      ProtectedToOtherIdentity => 7,
      LicenseExpired => 8,
      AccessSuspended => 9,
      FileInUse => 10
   );
   for FileProtectionStatus'Size use 32;
   
   type FileProtectionStatus_Ptr is access FileProtectionStatus;
   
   type ProtectedImportExportStatus is (
      Ok,
      Undetermined,
      Unprotected,
      Revoked,
      NotRoamable,
      ProtectedToOtherIdentity,
      LicenseExpired,
      AccessSuspended
   );
   for ProtectedImportExportStatus use (
      Ok => 0,
      Undetermined => 1,
      Unprotected => 2,
      Revoked => 3,
      NotRoamable => 4,
      ProtectedToOtherIdentity => 5,
      LicenseExpired => 6,
      AccessSuspended => 7
   );
   for ProtectedImportExportStatus'Size use 32;
   
   type ProtectedImportExportStatus_Ptr is access ProtectedImportExportStatus;
   
   type DataProtectionStatus is (
      ProtectedToOtherIdentity,
      Protected_x,
      Revoked,
      Unprotected,
      LicenseExpired,
      AccessSuspended
   );
   for DataProtectionStatus use (
      ProtectedToOtherIdentity => 0,
      Protected_x => 1,
      Revoked => 2,
      Unprotected => 3,
      LicenseExpired => 4,
      AccessSuspended => 5
   );
   for DataProtectionStatus'Size use 32;
   
   type DataProtectionStatus_Ptr is access DataProtectionStatus;
   
   type ProtectionPolicyAuditAction is (
      Decrypt,
      CopyToLocation,
      SendToRecipient,
      Other
   );
   for ProtectionPolicyAuditAction use (
      Decrypt => 0,
      CopyToLocation => 1,
      SendToRecipient => 2,
      Other => 3
   );
   for ProtectionPolicyAuditAction'Size use 32;
   
   type ProtectionPolicyAuditAction_Ptr is access ProtectionPolicyAuditAction;
   
   type ProtectionPolicyRequestAccessBehavior is (
      Decrypt,
      TreatOverridePolicyAsBlock
   );
   for ProtectionPolicyRequestAccessBehavior use (
      Decrypt => 0,
      TreatOverridePolicyAsBlock => 1
   );
   for ProtectionPolicyRequestAccessBehavior'Size use 32;
   
   type ProtectionPolicyRequestAccessBehavior_Ptr is access ProtectionPolicyRequestAccessBehavior;
   
   type EnforcementLevel is (
      NoProtection,
      Silent,
      Override,
      Block
   );
   for EnforcementLevel use (
      NoProtection => 0,
      Silent => 1,
      Override => 2,
      Block => 3
   );
   for EnforcementLevel'Size use 32;
   
   type EnforcementLevel_Ptr is access EnforcementLevel;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type EnterpriseDataContract is null record;
   pragma Convention (C_Pass_By_Copy , EnterpriseDataContract);
   
   type EnterpriseDataContract_Ptr is access EnterpriseDataContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult_Interface;
   type AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult is access all AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult_Interface'Class;
   type AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult_Ptr is access all AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult;
   type AsyncOperationCompletedHandler_FileProtectionStatus_Interface;
   type AsyncOperationCompletedHandler_FileProtectionStatus is access all AsyncOperationCompletedHandler_FileProtectionStatus_Interface'Class;
   type AsyncOperationCompletedHandler_FileProtectionStatus_Ptr is access all AsyncOperationCompletedHandler_FileProtectionStatus;
   type AsyncOperationCompletedHandler_IFileProtectionInfo_Interface;
   type AsyncOperationCompletedHandler_IFileProtectionInfo is access all AsyncOperationCompletedHandler_IFileProtectionInfo_Interface'Class;
   type AsyncOperationCompletedHandler_IFileProtectionInfo_Ptr is access all AsyncOperationCompletedHandler_IFileProtectionInfo;
   type AsyncOperationCompletedHandler_IProtectedContainerExportResult_Interface;
   type AsyncOperationCompletedHandler_IProtectedContainerExportResult is access all AsyncOperationCompletedHandler_IProtectedContainerExportResult_Interface'Class;
   type AsyncOperationCompletedHandler_IProtectedContainerExportResult_Ptr is access all AsyncOperationCompletedHandler_IProtectedContainerExportResult;
   type AsyncOperationCompletedHandler_IProtectedContainerImportResult_Interface;
   type AsyncOperationCompletedHandler_IProtectedContainerImportResult is access all AsyncOperationCompletedHandler_IProtectedContainerImportResult_Interface'Class;
   type AsyncOperationCompletedHandler_IProtectedContainerImportResult_Ptr is access all AsyncOperationCompletedHandler_IProtectedContainerImportResult;
   type AsyncOperationCompletedHandler_IProtectedFileCreateResult_Interface;
   type AsyncOperationCompletedHandler_IProtectedFileCreateResult is access all AsyncOperationCompletedHandler_IProtectedFileCreateResult_Interface'Class;
   type AsyncOperationCompletedHandler_IProtectedFileCreateResult_Ptr is access all AsyncOperationCompletedHandler_IProtectedFileCreateResult;
   type AsyncOperationCompletedHandler_IBufferProtectUnprotectResult_Interface;
   type AsyncOperationCompletedHandler_IBufferProtectUnprotectResult is access all AsyncOperationCompletedHandler_IBufferProtectUnprotectResult_Interface'Class;
   type AsyncOperationCompletedHandler_IBufferProtectUnprotectResult_Ptr is access all AsyncOperationCompletedHandler_IBufferProtectUnprotectResult;
   type AsyncOperationCompletedHandler_IDataProtectionInfo_Interface;
   type AsyncOperationCompletedHandler_IDataProtectionInfo is access all AsyncOperationCompletedHandler_IDataProtectionInfo_Interface'Class;
   type AsyncOperationCompletedHandler_IDataProtectionInfo_Ptr is access all AsyncOperationCompletedHandler_IDataProtectionInfo;
   type EventHandler_IProtectedAccessSuspendingEventArgs_Interface;
   type EventHandler_IProtectedAccessSuspendingEventArgs is access all EventHandler_IProtectedAccessSuspendingEventArgs_Interface'Class;
   type EventHandler_IProtectedAccessSuspendingEventArgs_Ptr is access all EventHandler_IProtectedAccessSuspendingEventArgs;
   type EventHandler_IProtectedAccessResumedEventArgs_Interface;
   type EventHandler_IProtectedAccessResumedEventArgs is access all EventHandler_IProtectedAccessResumedEventArgs_Interface'Class;
   type EventHandler_IProtectedAccessResumedEventArgs_Ptr is access all EventHandler_IProtectedAccessResumedEventArgs;
   type EventHandler_IProtectedContentRevokedEventArgs_Interface;
   type EventHandler_IProtectedContentRevokedEventArgs is access all EventHandler_IProtectedContentRevokedEventArgs_Interface'Class;
   type EventHandler_IProtectedContentRevokedEventArgs_Ptr is access all EventHandler_IProtectedContentRevokedEventArgs;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IFileRevocationManagerStatics_Interface;
   type IFileRevocationManagerStatics is access all IFileRevocationManagerStatics_Interface'Class;
   type IFileRevocationManagerStatics_Ptr is access all IFileRevocationManagerStatics;
   type IFileProtectionManagerStatics_Interface;
   type IFileProtectionManagerStatics is access all IFileProtectionManagerStatics_Interface'Class;
   type IFileProtectionManagerStatics_Ptr is access all IFileProtectionManagerStatics;
   type IFileProtectionManagerStatics2_Interface;
   type IFileProtectionManagerStatics2 is access all IFileProtectionManagerStatics2_Interface'Class;
   type IFileProtectionManagerStatics2_Ptr is access all IFileProtectionManagerStatics2;
   type IFileUnprotectOptionsFactory_Interface;
   type IFileUnprotectOptionsFactory is access all IFileUnprotectOptionsFactory_Interface'Class;
   type IFileUnprotectOptionsFactory_Ptr is access all IFileUnprotectOptionsFactory;
   type IFileUnprotectOptions_Interface;
   type IFileUnprotectOptions is access all IFileUnprotectOptions_Interface'Class;
   type IFileUnprotectOptions_Ptr is access all IFileUnprotectOptions;
   type IFileProtectionManagerStatics3_Interface;
   type IFileProtectionManagerStatics3 is access all IFileProtectionManagerStatics3_Interface'Class;
   type IFileProtectionManagerStatics3_Ptr is access all IFileProtectionManagerStatics3;
   type IProtectedFileCreateResult_Interface;
   type IProtectedFileCreateResult is access all IProtectedFileCreateResult_Interface'Class;
   type IProtectedFileCreateResult_Ptr is access all IProtectedFileCreateResult;
   type IFileProtectionInfo_Interface;
   type IFileProtectionInfo is access all IFileProtectionInfo_Interface'Class;
   type IFileProtectionInfo_Ptr is access all IFileProtectionInfo;
   type IFileProtectionInfo2_Interface;
   type IFileProtectionInfo2 is access all IFileProtectionInfo2_Interface'Class;
   type IFileProtectionInfo2_Ptr is access all IFileProtectionInfo2;
   type IProtectedContainerExportResult_Interface;
   type IProtectedContainerExportResult is access all IProtectedContainerExportResult_Interface'Class;
   type IProtectedContainerExportResult_Ptr is access all IProtectedContainerExportResult;
   type IProtectedContainerImportResult_Interface;
   type IProtectedContainerImportResult is access all IProtectedContainerImportResult_Interface'Class;
   type IProtectedContainerImportResult_Ptr is access all IProtectedContainerImportResult;
   type IDataProtectionManagerStatics_Interface;
   type IDataProtectionManagerStatics is access all IDataProtectionManagerStatics_Interface'Class;
   type IDataProtectionManagerStatics_Ptr is access all IDataProtectionManagerStatics;
   type IDataProtectionInfo_Interface;
   type IDataProtectionInfo is access all IDataProtectionInfo_Interface'Class;
   type IDataProtectionInfo_Ptr is access all IDataProtectionInfo;
   type IBufferProtectUnprotectResult_Interface;
   type IBufferProtectUnprotectResult is access all IBufferProtectUnprotectResult_Interface'Class;
   type IBufferProtectUnprotectResult_Ptr is access all IBufferProtectUnprotectResult;
   type IProtectionPolicyAuditInfoFactory_Interface;
   type IProtectionPolicyAuditInfoFactory is access all IProtectionPolicyAuditInfoFactory_Interface'Class;
   type IProtectionPolicyAuditInfoFactory_Ptr is access all IProtectionPolicyAuditInfoFactory;
   type IProtectionPolicyAuditInfo_Interface;
   type IProtectionPolicyAuditInfo is access all IProtectionPolicyAuditInfo_Interface'Class;
   type IProtectionPolicyAuditInfo_Ptr is access all IProtectionPolicyAuditInfo;
   type IProtectionPolicyManager_Interface;
   type IProtectionPolicyManager is access all IProtectionPolicyManager_Interface'Class;
   type IProtectionPolicyManager_Ptr is access all IProtectionPolicyManager;
   type IProtectionPolicyManager2_Interface;
   type IProtectionPolicyManager2 is access all IProtectionPolicyManager2_Interface'Class;
   type IProtectionPolicyManager2_Ptr is access all IProtectionPolicyManager2;
   type IProtectionPolicyManagerStatics_Interface;
   type IProtectionPolicyManagerStatics is access all IProtectionPolicyManagerStatics_Interface'Class;
   type IProtectionPolicyManagerStatics_Ptr is access all IProtectionPolicyManagerStatics;
   type IProtectionPolicyManagerStatics2_Interface;
   type IProtectionPolicyManagerStatics2 is access all IProtectionPolicyManagerStatics2_Interface'Class;
   type IProtectionPolicyManagerStatics2_Ptr is access all IProtectionPolicyManagerStatics2;
   type IProtectionPolicyManagerStatics3_Interface;
   type IProtectionPolicyManagerStatics3 is access all IProtectionPolicyManagerStatics3_Interface'Class;
   type IProtectionPolicyManagerStatics3_Ptr is access all IProtectionPolicyManagerStatics3;
   type IProtectionPolicyManagerStatics4_Interface;
   type IProtectionPolicyManagerStatics4 is access all IProtectionPolicyManagerStatics4_Interface'Class;
   type IProtectionPolicyManagerStatics4_Ptr is access all IProtectionPolicyManagerStatics4;
   type IThreadNetworkContext_Interface;
   type IThreadNetworkContext is access all IThreadNetworkContext_Interface'Class;
   type IThreadNetworkContext_Ptr is access all IThreadNetworkContext;
   type IProtectedAccessSuspendingEventArgs_Interface;
   type IProtectedAccessSuspendingEventArgs is access all IProtectedAccessSuspendingEventArgs_Interface'Class;
   type IProtectedAccessSuspendingEventArgs_Ptr is access all IProtectedAccessSuspendingEventArgs;
   type IProtectedAccessResumedEventArgs_Interface;
   type IProtectedAccessResumedEventArgs is access all IProtectedAccessResumedEventArgs_Interface'Class;
   type IProtectedAccessResumedEventArgs_Ptr is access all IProtectedAccessResumedEventArgs;
   type IProtectedContentRevokedEventArgs_Interface;
   type IProtectedContentRevokedEventArgs is access all IProtectedContentRevokedEventArgs_Interface'Class;
   type IProtectedContentRevokedEventArgs_Ptr is access all IProtectedContentRevokedEventArgs;
   type IAsyncOperation_ProtectionPolicyEvaluationResult_Interface;
   type IAsyncOperation_ProtectionPolicyEvaluationResult is access all IAsyncOperation_ProtectionPolicyEvaluationResult_Interface'Class;
   type IAsyncOperation_ProtectionPolicyEvaluationResult_Ptr is access all IAsyncOperation_ProtectionPolicyEvaluationResult;
   type IAsyncOperation_FileProtectionStatus_Interface;
   type IAsyncOperation_FileProtectionStatus is access all IAsyncOperation_FileProtectionStatus_Interface'Class;
   type IAsyncOperation_FileProtectionStatus_Ptr is access all IAsyncOperation_FileProtectionStatus;
   type IAsyncOperation_IFileProtectionInfo_Interface;
   type IAsyncOperation_IFileProtectionInfo is access all IAsyncOperation_IFileProtectionInfo_Interface'Class;
   type IAsyncOperation_IFileProtectionInfo_Ptr is access all IAsyncOperation_IFileProtectionInfo;
   type IAsyncOperation_IProtectedContainerExportResult_Interface;
   type IAsyncOperation_IProtectedContainerExportResult is access all IAsyncOperation_IProtectedContainerExportResult_Interface'Class;
   type IAsyncOperation_IProtectedContainerExportResult_Ptr is access all IAsyncOperation_IProtectedContainerExportResult;
   type IAsyncOperation_IProtectedContainerImportResult_Interface;
   type IAsyncOperation_IProtectedContainerImportResult is access all IAsyncOperation_IProtectedContainerImportResult_Interface'Class;
   type IAsyncOperation_IProtectedContainerImportResult_Ptr is access all IAsyncOperation_IProtectedContainerImportResult;
   type IAsyncOperation_IProtectedFileCreateResult_Interface;
   type IAsyncOperation_IProtectedFileCreateResult is access all IAsyncOperation_IProtectedFileCreateResult_Interface'Class;
   type IAsyncOperation_IProtectedFileCreateResult_Ptr is access all IAsyncOperation_IProtectedFileCreateResult;
   type IAsyncOperation_IBufferProtectUnprotectResult_Interface;
   type IAsyncOperation_IBufferProtectUnprotectResult is access all IAsyncOperation_IBufferProtectUnprotectResult_Interface'Class;
   type IAsyncOperation_IBufferProtectUnprotectResult_Ptr is access all IAsyncOperation_IBufferProtectUnprotectResult;
   type IAsyncOperation_IDataProtectionInfo_Interface;
   type IAsyncOperation_IDataProtectionInfo is access all IAsyncOperation_IDataProtectionInfo_Interface'Class;
   type IAsyncOperation_IDataProtectionInfo_Ptr is access all IAsyncOperation_IDataProtectionInfo;
   
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
   type IFileRevocationManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ProtectAsync
   (
      This       : access IFileRevocationManagerStatics_Interface
      ; storageItem : Windows.Storage.IStorageItem
      ; enterpriseIdentity : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_FileProtectionStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CopyProtectionAsync
   (
      This       : access IFileRevocationManagerStatics_Interface
      ; sourceStorageItem : Windows.Storage.IStorageItem
      ; targetStorageItem : Windows.Storage.IStorageItem
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Revoke
   (
      This       : access IFileRevocationManagerStatics_Interface
      ; enterpriseIdentity : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetStatusAsync
   (
      This       : access IFileRevocationManagerStatics_Interface
      ; storageItem : Windows.Storage.IStorageItem
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_FileProtectionStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileRevocationManagerStatics : aliased constant Windows.IID := (627817533, 7261, 16992, (140, 117, 145, 68, 207, 183, 139, 169 ));
   
   ------------------------------------------------------------------------
   type IFileProtectionManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ProtectAsync
   (
      This       : access IFileProtectionManagerStatics_Interface
      ; target : Windows.Storage.IStorageItem
      ; identity : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CopyProtectionAsync
   (
      This       : access IFileProtectionManagerStatics_Interface
      ; source : Windows.Storage.IStorageItem
      ; target : Windows.Storage.IStorageItem
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetProtectionInfoAsync
   (
      This       : access IFileProtectionManagerStatics_Interface
      ; source : Windows.Storage.IStorageItem
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveFileAsContainerAsync
   (
      This       : access IFileProtectionManagerStatics_Interface
      ; protectedFile : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadFileFromContainerAsync
   (
      This       : access IFileProtectionManagerStatics_Interface
      ; containerFile : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadFileFromContainerWithTargetAsync
   (
      This       : access IFileProtectionManagerStatics_Interface
      ; containerFile : Windows.Storage.IStorageFile
      ; target : Windows.Storage.IStorageItem
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateProtectedAndOpenAsync
   (
      This       : access IFileProtectionManagerStatics_Interface
      ; parentFolder : Windows.Storage.IStorageFolder
      ; desiredName : Windows.String
      ; identity : Windows.String
      ; collisionOption : Windows.Storage.CreationCollisionOption
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IProtectedFileCreateResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileProtectionManagerStatics : aliased constant Windows.IID := (1481047195, 58899, 17003, (187, 56, 136, 203, 161, 220, 154, 219 ));
   
   ------------------------------------------------------------------------
   type IFileProtectionManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function IsContainerAsync
   (
      This       : access IFileProtectionManagerStatics2_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadFileFromContainerWithTargetAndNameCollisionOptionAsync
   (
      This       : access IFileProtectionManagerStatics2_Interface
      ; containerFile : Windows.Storage.IStorageFile
      ; target : Windows.Storage.IStorageItem
      ; collisionOption : Windows.Storage.NameCollisionOption
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SaveFileAsContainerWithSharingAsync
   (
      This       : access IFileProtectionManagerStatics2_Interface
      ; protectedFile : Windows.Storage.IStorageFile
      ; sharedWithIdentities : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileProtectionManagerStatics2 : aliased constant Windows.IID := (2211620677, 1155, 16811, (178, 213, 188, 127, 35, 215, 78, 187 ));
   
   ------------------------------------------------------------------------
   type IFileUnprotectOptionsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IFileUnprotectOptionsFactory_Interface
      ; audit : Windows.Boolean
      ; RetVal : access Windows.Security.EnterpriseData.IFileUnprotectOptions
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileUnprotectOptionsFactory : aliased constant Windows.IID := (1370403740, 55948, 19519, (155, 251, 203, 115, 167, 204, 224, 221 ));
   
   ------------------------------------------------------------------------
   type IFileUnprotectOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Audit
   (
      This       : access IFileUnprotectOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Audit
   (
      This       : access IFileUnprotectOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileUnprotectOptions : aliased constant Windows.IID := (2098402033, 15117, 19928, (161, 248, 30, 197, 56, 34, 226, 243 ));
   
   ------------------------------------------------------------------------
   type IFileProtectionManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function UnprotectAsync
   (
      This       : access IFileProtectionManagerStatics3_Interface
      ; target : Windows.Storage.IStorageItem
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnprotectWithOptionsAsync
   (
      This       : access IFileProtectionManagerStatics3_Interface
      ; target : Windows.Storage.IStorageItem
      ; options : Windows.Security.EnterpriseData.IFileUnprotectOptions
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileProtectionManagerStatics3 : aliased constant Windows.IID := (1763214490, 25167, 18134, (178, 65, 233, 205, 95, 223, 62, 63 ));
   
   ------------------------------------------------------------------------
   type IProtectedFileCreateResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_File
   (
      This       : access IProtectedFileCreateResult_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_Stream
   (
      This       : access IProtectedFileCreateResult_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionInfo
   (
      This       : access IProtectedFileCreateResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.IFileProtectionInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectedFileCreateResult : aliased constant Windows.IID := (686026090, 59879, 18947, (159, 83, 189, 177, 97, 114, 105, 155 ));
   
   ------------------------------------------------------------------------
   type IFileProtectionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IFileProtectionInfo_Interface
      ; RetVal : access Windows.Security.EnterpriseData.FileProtectionStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRoamable
   (
      This       : access IFileProtectionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Identity
   (
      This       : access IFileProtectionInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileProtectionInfo : aliased constant Windows.IID := (1323918470, 5246, 19920, (143, 175, 82, 83, 237, 145, 173, 12 ));
   
   ------------------------------------------------------------------------
   type IFileProtectionInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsProtectWhileOpenSupported
   (
      This       : access IFileProtectionInfo2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IFileProtectionInfo2 : aliased constant Windows.IID := (2182232652, 21882, 18829, (142, 148, 148, 76, 213, 131, 100, 50 ));
   
   ------------------------------------------------------------------------
   type IProtectedContainerExportResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IProtectedContainerExportResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.ProtectedImportExportStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_File
   (
      This       : access IProtectedContainerExportResult_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectedContainerExportResult : aliased constant Windows.IID := (961081237, 63483, 19266, (175, 176, 223, 112, 180, 21, 67, 193 ));
   
   ------------------------------------------------------------------------
   type IProtectedContainerImportResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IProtectedContainerImportResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.ProtectedImportExportStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_File
   (
      This       : access IProtectedContainerImportResult_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectedContainerImportResult : aliased constant Windows.IID := (3451355345, 59323, 19738, (147, 57, 52, 220, 65, 20, 159, 155 ));
   
   ------------------------------------------------------------------------
   type IDataProtectionManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ProtectAsync
   (
      This       : access IDataProtectionManagerStatics_Interface
      ; data : Windows.Storage.Streams.IBuffer
      ; identity : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnprotectAsync
   (
      This       : access IDataProtectionManagerStatics_Interface
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ProtectStreamAsync
   (
      This       : access IDataProtectionManagerStatics_Interface
      ; unprotectedStream : Windows.Storage.Streams.IInputStream
      ; identity : Windows.String
      ; protectedStream : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnprotectStreamAsync
   (
      This       : access IDataProtectionManagerStatics_Interface
      ; protectedStream : Windows.Storage.Streams.IInputStream
      ; unprotectedStream : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetProtectionInfoAsync
   (
      This       : access IDataProtectionManagerStatics_Interface
      ; protectedData : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetStreamProtectionInfoAsync
   (
      This       : access IDataProtectionManagerStatics_Interface
      ; protectedStream : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IDataProtectionManagerStatics : aliased constant Windows.IID := (3054803828, 37188, 20196, (138, 138, 48, 181, 243, 97, 67, 14 ));
   
   ------------------------------------------------------------------------
   type IDataProtectionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IDataProtectionInfo_Interface
      ; RetVal : access Windows.Security.EnterpriseData.DataProtectionStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Identity
   (
      This       : access IDataProtectionInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IDataProtectionInfo : aliased constant Windows.IID := (2216734913, 24113, 17413, (149, 64, 63, 148, 58, 240, 203, 38 ));
   
   ------------------------------------------------------------------------
   type IBufferProtectUnprotectResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Buffer
   (
      This       : access IBufferProtectUnprotectResult_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionInfo
   (
      This       : access IBufferProtectUnprotectResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.IDataProtectionInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IBufferProtectUnprotectResult : aliased constant Windows.IID := (1201233628, 27884, 20026, (178, 81, 158, 116, 133, 215, 158, 122 ));
   
   ------------------------------------------------------------------------
   type IProtectionPolicyAuditInfoFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IProtectionPolicyAuditInfoFactory_Interface
      ; action : Windows.Security.EnterpriseData.ProtectionPolicyAuditAction
      ; dataDescription : Windows.String
      ; sourceDescription : Windows.String
      ; targetDescription : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithActionAndDataDescription
   (
      This       : access IProtectionPolicyAuditInfoFactory_Interface
      ; action : Windows.Security.EnterpriseData.ProtectionPolicyAuditAction
      ; dataDescription : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectionPolicyAuditInfoFactory : aliased constant Windows.IID := (2127829003, 37608, 17109, (131, 212, 37, 68, 11, 66, 53, 73 ));
   
   ------------------------------------------------------------------------
   type IProtectionPolicyAuditInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Action
   (
      This       : access IProtectionPolicyAuditInfo_Interface
      ; value : Windows.Security.EnterpriseData.ProtectionPolicyAuditAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Action
   (
      This       : access IProtectionPolicyAuditInfo_Interface
      ; RetVal : access Windows.Security.EnterpriseData.ProtectionPolicyAuditAction
   )
   return Windows.HRESULT is abstract;
   
   function put_DataDescription
   (
      This       : access IProtectionPolicyAuditInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DataDescription
   (
      This       : access IProtectionPolicyAuditInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SourceDescription
   (
      This       : access IProtectionPolicyAuditInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceDescription
   (
      This       : access IProtectionPolicyAuditInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetDescription
   (
      This       : access IProtectionPolicyAuditInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetDescription
   (
      This       : access IProtectionPolicyAuditInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectionPolicyAuditInfo : aliased constant Windows.IID := (1113241572, 65207, 17660, (179, 187, 195, 196, 215, 236, 190, 187 ));
   
   ------------------------------------------------------------------------
   type IProtectionPolicyManager_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Identity
   (
      This       : access IProtectionPolicyManager_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Identity
   (
      This       : access IProtectionPolicyManager_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectionPolicyManager : aliased constant Windows.IID := (3580902936, 41101, 18406, (162, 64, 153, 52, 215, 22, 94, 181 ));
   
   ------------------------------------------------------------------------
   type IProtectionPolicyManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ShowEnterpriseIndicator
   (
      This       : access IProtectionPolicyManager2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShowEnterpriseIndicator
   (
      This       : access IProtectionPolicyManager2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectionPolicyManager2 : aliased constant Windows.IID := (2885112442, 33845, 16767, (153, 182, 81, 190, 175, 54, 88, 136 ));
   
   ------------------------------------------------------------------------
   type IProtectionPolicyManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsIdentityManaged
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryApplyProcessUIPolicy
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ClearProcessUIPolicy
   (
      This       : access IProtectionPolicyManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function CreateCurrentThreadNetworkContext
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IThreadNetworkContext
   )
   return Windows.HRESULT is abstract;
   
   function GetPrimaryManagedIdentityForNetworkEndpointAsync
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; endpointHost : Windows.Networking.IHostName
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RevokeContent
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; identity : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetForCurrentView
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; RetVal : access Windows.Security.EnterpriseData.IProtectionPolicyManager
   )
   return Windows.HRESULT is abstract;
   
   function add_ProtectedAccessSuspending
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; handler : Windows.Security.EnterpriseData.EventHandler_IProtectedAccessSuspendingEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ProtectedAccessSuspending
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ProtectedAccessResumed
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; handler : Windows.Security.EnterpriseData.EventHandler_IProtectedAccessResumedEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ProtectedAccessResumed
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ProtectedContentRevoked
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; handler : Windows.Security.EnterpriseData.EventHandler_IProtectedContentRevokedEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ProtectedContentRevoked
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CheckAccess
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IProtectionPolicyManagerStatics_Interface
      ; sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectionPolicyManagerStatics : aliased constant Windows.IID := (3233807462, 35901, 19798, (136, 4, 198, 143, 10, 211, 46, 197 ));
   
   ------------------------------------------------------------------------
   type IProtectionPolicyManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function HasContentBeenRevokedSince
   (
      This       : access IProtectionPolicyManagerStatics2_Interface
      ; identity : Windows.String
      ; since : Windows.Foundation.DateTime
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CheckAccessForApp
   (
      This       : access IProtectionPolicyManagerStatics2_Interface
      ; sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessForAppAsync
   (
      This       : access IProtectionPolicyManagerStatics2_Interface
      ; sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetEnforcementLevel
   (
      This       : access IProtectionPolicyManagerStatics2_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.EnforcementLevel
   )
   return Windows.HRESULT is abstract;
   
   function IsUserDecryptionAllowed
   (
      This       : access IProtectionPolicyManagerStatics2_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsProtectionUnderLockRequired
   (
      This       : access IProtectionPolicyManagerStatics2_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_PolicyChanged
   (
      This       : access IProtectionPolicyManagerStatics2_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PolicyChanged
   (
      This       : access IProtectionPolicyManagerStatics2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_IsProtectionEnabled
   (
      This       : access IProtectionPolicyManagerStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectionPolicyManagerStatics2 : aliased constant Windows.IID := (3062864524, 14816, 17993, (178, 228, 7, 10, 184, 165, 121, 179 ));
   
   ------------------------------------------------------------------------
   type IProtectionPolicyManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAccessWithAuditingInfoAsync
   (
      This       : access IProtectionPolicyManagerStatics3_Interface
      ; sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessWithMessageAsync
   (
      This       : access IProtectionPolicyManagerStatics3_Interface
      ; sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessForAppWithAuditingInfoAsync
   (
      This       : access IProtectionPolicyManagerStatics3_Interface
      ; sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessForAppWithMessageAsync
   (
      This       : access IProtectionPolicyManagerStatics3_Interface
      ; sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LogAuditEvent
   (
      This       : access IProtectionPolicyManagerStatics3_Interface
      ; sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectionPolicyManagerStatics3 : aliased constant Windows.IID := (1224711820, 27247, 19871, (188, 237, 24, 171, 83, 122, 160, 21 ));
   
   ------------------------------------------------------------------------
   type IProtectionPolicyManagerStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function IsRoamableProtectionEnabled
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessWithBehaviorAsync
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessForAppWithBehaviorAsync
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessToFilesForAppAsync
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessToFilesForAppWithMessageAndBehaviorAsync
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessToFilesForProcessAsync
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; processId : Windows.UInt32
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessToFilesForProcessWithMessageAndBehaviorAsync
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; processId : Windows.UInt32
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsFileProtectionRequiredAsync
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; target : Windows.Storage.IStorageItem
      ; identity : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsFileProtectionRequiredForNewFileAsync
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; parentFolder : Windows.Storage.IStorageFolder
      ; identity : Windows.String
      ; desiredName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PrimaryManagedIdentity
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetPrimaryManagedIdentityForIdentity
   (
      This       : access IProtectionPolicyManagerStatics4_Interface
      ; identity : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectionPolicyManagerStatics4 : aliased constant Windows.IID := (548902107, 52413, 18703, (140, 131, 73, 204, 183, 122, 234, 108 ));
   
   ------------------------------------------------------------------------
   type IThreadNetworkContext_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IThreadNetworkContext : aliased constant Windows.IID := (4199459049, 61203, 16474, (177, 44, 215, 52, 140, 111, 65, 252 ));
   
   ------------------------------------------------------------------------
   type IProtectedAccessSuspendingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Identities
   (
      This       : access IProtectedAccessSuspendingEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access IProtectedAccessSuspendingEventArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IProtectedAccessSuspendingEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectedAccessSuspendingEventArgs : aliased constant Windows.IID := (1973523424, 41796, 17055, (185, 117, 4, 252, 31, 136, 193, 133 ));
   
   ------------------------------------------------------------------------
   type IProtectedAccessResumedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Identities
   (
      This       : access IProtectedAccessResumedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectedAccessResumedEventArgs : aliased constant Windows.IID := (2890779225, 23936, 20117, (140, 95, 133, 57, 69, 14, 235, 224 ));
   
   ------------------------------------------------------------------------
   type IProtectedContentRevokedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Identities
   (
      This       : access IProtectedContentRevokedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IProtectedContentRevokedEventArgs : aliased constant Windows.IID := (1667786785, 22713, 18414, (147, 217, 240, 247, 65, 207, 67, 240 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ProtectionPolicyEvaluationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ProtectionPolicyEvaluationResult_Interface
      ; handler : Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ProtectionPolicyEvaluationResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ProtectionPolicyEvaluationResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ProtectionPolicyEvaluationResult : aliased constant Windows.IID := (3906475797, 50540, 23147, (183, 56, 93, 246, 194, 119, 91, 123 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_FileProtectionStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_FileProtectionStatus_Interface
      ; handler : Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_FileProtectionStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_FileProtectionStatus_Interface
      ; RetVal : access Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_FileProtectionStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_FileProtectionStatus_Interface
      ; RetVal : access Windows.Security.EnterpriseData.FileProtectionStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_FileProtectionStatus : aliased constant Windows.IID := (54460028, 28830, 21416, (142, 100, 205, 171, 107, 209, 237, 89 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IFileProtectionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IFileProtectionInfo_Interface
      ; handler : Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IFileProtectionInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IFileProtectionInfo_Interface
      ; RetVal : access Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IFileProtectionInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IFileProtectionInfo_Interface
      ; RetVal : access Windows.Security.EnterpriseData.IFileProtectionInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IFileProtectionInfo : aliased constant Windows.IID := (1742751121, 11537, 20504, (159, 240, 11, 133, 82, 11, 136, 139 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IProtectedContainerExportResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IProtectedContainerExportResult_Interface
      ; handler : Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IProtectedContainerExportResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IProtectedContainerExportResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IProtectedContainerExportResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IProtectedContainerExportResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.IProtectedContainerExportResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IProtectedContainerExportResult : aliased constant Windows.IID := (3382643502, 26541, 20874, (134, 111, 227, 155, 69, 103, 177, 16 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IProtectedContainerImportResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IProtectedContainerImportResult_Interface
      ; handler : Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IProtectedContainerImportResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IProtectedContainerImportResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IProtectedContainerImportResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IProtectedContainerImportResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.IProtectedContainerImportResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IProtectedContainerImportResult : aliased constant Windows.IID := (944673945, 54417, 21143, (190, 186, 179, 58, 61, 103, 242, 7 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IProtectedFileCreateResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IProtectedFileCreateResult_Interface
      ; handler : Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IProtectedFileCreateResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IProtectedFileCreateResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IProtectedFileCreateResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IProtectedFileCreateResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.IProtectedFileCreateResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IProtectedFileCreateResult : aliased constant Windows.IID := (3623455388, 29582, 20726, (147, 227, 38, 8, 186, 245, 75, 233 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IBufferProtectUnprotectResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBufferProtectUnprotectResult_Interface
      ; handler : Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IBufferProtectUnprotectResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBufferProtectUnprotectResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IBufferProtectUnprotectResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBufferProtectUnprotectResult_Interface
      ; RetVal : access Windows.Security.EnterpriseData.IBufferProtectUnprotectResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IBufferProtectUnprotectResult : aliased constant Windows.IID := (301554222, 11911, 21577, (188, 163, 220, 223, 42, 230, 225, 122 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IDataProtectionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDataProtectionInfo_Interface
      ; handler : Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IDataProtectionInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDataProtectionInfo_Interface
      ; RetVal : access Windows.Security.EnterpriseData.AsyncOperationCompletedHandler_IDataProtectionInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDataProtectionInfo_Interface
      ; RetVal : access Windows.Security.EnterpriseData.IDataProtectionInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IDataProtectionInfo : aliased constant Windows.IID := (3371122454, 56688, 24200, (147, 35, 133, 221, 221, 205, 44, 165 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult : aliased constant Windows.IID := (674478676, 42209, 23597, (138, 122, 19, 110, 133, 16, 199, 139 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_FileProtectionStatus_Interface(Callback : access procedure (asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_FileProtectionStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_FileProtectionStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_FileProtectionStatus_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_FileProtectionStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_FileProtectionStatus : aliased constant Windows.IID := (3775197787, 47447, 24276, (177, 197, 25, 147, 96, 76, 254, 174 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IFileProtectionInfo_Interface(Callback : access procedure (asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IFileProtectionInfo_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IFileProtectionInfo_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IFileProtectionInfo : aliased constant Windows.IID := (689504234, 57489, 21474, (189, 229, 97, 124, 155, 179, 216, 254 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IProtectedContainerExportResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IProtectedContainerExportResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IProtectedContainerExportResult_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IProtectedContainerExportResult : aliased constant Windows.IID := (1443648801, 20488, 21106, (167, 102, 148, 31, 112, 113, 139, 198 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IProtectedContainerImportResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IProtectedContainerImportResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IProtectedContainerImportResult_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IProtectedContainerImportResult : aliased constant Windows.IID := (3488219384, 53933, 23250, (163, 150, 228, 247, 27, 154, 124, 63 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IProtectedFileCreateResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IProtectedFileCreateResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IProtectedFileCreateResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IProtectedFileCreateResult_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IProtectedFileCreateResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IProtectedFileCreateResult : aliased constant Windows.IID := (1816438888, 31872, 20871, (160, 141, 55, 155, 228, 25, 9, 246 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IBufferProtectUnprotectResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IBufferProtectUnprotectResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBufferProtectUnprotectResult_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IBufferProtectUnprotectResult : aliased constant Windows.IID := (1943503051, 44344, 23014, (162, 54, 204, 13, 246, 159, 21, 168 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IDataProtectionInfo_Interface(Callback : access procedure (asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IDataProtectionInfo_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDataProtectionInfo_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IDataProtectionInfo : aliased constant Windows.IID := (3777737845, 16171, 20937, (131, 198, 165, 102, 16, 134, 182, 195 ));
   
   ------------------------------------------------------------------------
   type EventHandler_IProtectedAccessSuspendingEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Security.EnterpriseData.IProtectedAccessSuspendingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_IProtectedAccessSuspendingEventArgs_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_IProtectedAccessSuspendingEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Security.EnterpriseData.IProtectedAccessSuspendingEventArgs
   )
   return Windows.HRESULT;
   
   IID_EventHandler_IProtectedAccessSuspendingEventArgs : aliased constant Windows.IID := (4270568664, 3389, 21526, (179, 144, 158, 173, 93, 217, 179, 132 ));
   
   ------------------------------------------------------------------------
   type EventHandler_IProtectedAccessResumedEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Security.EnterpriseData.IProtectedAccessResumedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_IProtectedAccessResumedEventArgs_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_IProtectedAccessResumedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Security.EnterpriseData.IProtectedAccessResumedEventArgs
   )
   return Windows.HRESULT;
   
   IID_EventHandler_IProtectedAccessResumedEventArgs : aliased constant Windows.IID := (2667466038, 25929, 21026, (155, 194, 77, 93, 146, 157, 0, 92 ));
   
   ------------------------------------------------------------------------
   type EventHandler_IProtectedContentRevokedEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Security.EnterpriseData.IProtectedContentRevokedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_IProtectedContentRevokedEventArgs_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_IProtectedContentRevokedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Security.EnterpriseData.IProtectedContentRevokedEventArgs
   )
   return Windows.HRESULT;
   
   IID_EventHandler_IProtectedContentRevokedEventArgs : aliased constant Windows.IID := (1341612887, 26629, 22334, (166, 125, 44, 89, 79, 80, 4, 183 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype FileProtectionInfo is Windows.Security.EnterpriseData.IFileProtectionInfo;
   subtype ProtectedContainerExportResult is Windows.Security.EnterpriseData.IProtectedContainerExportResult;
   subtype ProtectedContainerImportResult is Windows.Security.EnterpriseData.IProtectedContainerImportResult;
   subtype ProtectedFileCreateResult is Windows.Security.EnterpriseData.IProtectedFileCreateResult;
   subtype FileUnprotectOptions is Windows.Security.EnterpriseData.IFileUnprotectOptions;
   
   function Create
   (
      audit : Windows.Boolean
   )
   return Windows.Security.EnterpriseData.IFileUnprotectOptions;
   
   subtype BufferProtectUnprotectResult is Windows.Security.EnterpriseData.IBufferProtectUnprotectResult;
   subtype DataProtectionInfo is Windows.Security.EnterpriseData.IDataProtectionInfo;
   subtype ProtectionPolicyAuditInfo is Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo;
   
   function Create
   (
      action : Windows.Security.EnterpriseData.ProtectionPolicyAuditAction
      ; dataDescription : Windows.String
      ; sourceDescription : Windows.String
      ; targetDescription : Windows.String
   )
   return Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo;
   
   function CreateWithActionAndDataDescription
   (
      action : Windows.Security.EnterpriseData.ProtectionPolicyAuditAction
      ; dataDescription : Windows.String
   )
   return Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo;
   
   subtype ThreadNetworkContext is Windows.Security.EnterpriseData.IThreadNetworkContext;
   subtype ProtectionPolicyManager is Windows.Security.EnterpriseData.IProtectionPolicyManager;
   subtype ProtectedAccessSuspendingEventArgs is Windows.Security.EnterpriseData.IProtectedAccessSuspendingEventArgs;
   subtype ProtectedAccessResumedEventArgs is Windows.Security.EnterpriseData.IProtectedAccessResumedEventArgs;
   subtype ProtectedContentRevokedEventArgs is Windows.Security.EnterpriseData.IProtectedContentRevokedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function RequestAccessWithAuditingInfoAsync
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function RequestAccessWithMessageAsync
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function RequestAccessForAppWithAuditingInfoAsync
   (
      sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function RequestAccessForAppWithMessageAsync
   (
      sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   procedure LogAuditEvent
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   ;
   
   function IsIdentityManaged
   (
      identity : Windows.String
   )
   return Windows.Boolean;
   
   function TryApplyProcessUIPolicy
   (
      identity : Windows.String
   )
   return Windows.Boolean;
   
   procedure ClearProcessUIPolicy
   ;
   
   function CreateCurrentThreadNetworkContext
   (
      identity : Windows.String
   )
   return Windows.Security.EnterpriseData.IThreadNetworkContext;
   
   function GetPrimaryManagedIdentityForNetworkEndpointAsync
   (
      endpointHost : Windows.Networking.IHostName
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   procedure RevokeContent
   (
      identity : Windows.String
   )
   ;
   
   function GetForCurrentView
   return Windows.Security.EnterpriseData.IProtectionPolicyManager;
   
   function add_ProtectedAccessSuspending
   (
      handler : Windows.Security.EnterpriseData.EventHandler_IProtectedAccessSuspendingEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_ProtectedAccessSuspending
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_ProtectedAccessResumed
   (
      handler : Windows.Security.EnterpriseData.EventHandler_IProtectedAccessResumedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_ProtectedAccessResumed
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_ProtectedContentRevoked
   (
      handler : Windows.Security.EnterpriseData.EventHandler_IProtectedContentRevokedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_ProtectedContentRevoked
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function CheckAccess
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
   )
   return Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult;
   
   function RequestAccessAsync
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function HasContentBeenRevokedSince
   (
      identity : Windows.String
      ; since : Windows.Foundation.DateTime
   )
   return Windows.Boolean;
   
   function CheckAccessForApp
   (
      sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
   )
   return Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult;
   
   function RequestAccessForAppAsync
   (
      sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function GetEnforcementLevel
   (
      identity : Windows.String
   )
   return Windows.Security.EnterpriseData.EnforcementLevel;
   
   function IsUserDecryptionAllowed
   (
      identity : Windows.String
   )
   return Windows.Boolean;
   
   function IsProtectionUnderLockRequired
   (
      identity : Windows.String
   )
   return Windows.Boolean;
   
   function add_PolicyChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_PolicyChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_IsProtectionEnabled
   return Windows.Boolean;
   
   function IsRoamableProtectionEnabled
   (
      identity : Windows.String
   )
   return Windows.Boolean;
   
   function RequestAccessWithBehaviorAsync
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function RequestAccessForAppWithBehaviorAsync
   (
      sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function RequestAccessToFilesForAppAsync
   (
      sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function RequestAccessToFilesForAppWithMessageAndBehaviorAsync
   (
      sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function RequestAccessToFilesForProcessAsync
   (
      sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; processId : Windows.UInt32
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function RequestAccessToFilesForProcessWithMessageAndBehaviorAsync
   (
      sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; processId : Windows.UInt32
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   
   function IsFileProtectionRequiredAsync
   (
      target : Windows.Storage.IStorageItem
      ; identity : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function IsFileProtectionRequiredForNewFileAsync
   (
      parentFolder : Windows.Storage.IStorageFolder
      ; identity : Windows.String
      ; desiredName : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function get_PrimaryManagedIdentity
   return Windows.String;
   
   function GetPrimaryManagedIdentityForIdentity
   (
      identity : Windows.String
   )
   return Windows.String;
   
   function ProtectAsync
   (
      target : Windows.Storage.IStorageItem
      ; identity : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo;
   
   function CopyProtectionAsync
   (
      source : Windows.Storage.IStorageItem
      ; target : Windows.Storage.IStorageItem
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function GetProtectionInfoAsync
   (
      source : Windows.Storage.IStorageItem
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo;
   
   function SaveFileAsContainerAsync
   (
      protectedFile : Windows.Storage.IStorageFile
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult;
   
   function LoadFileFromContainerAsync
   (
      containerFile : Windows.Storage.IStorageFile
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult;
   
   function LoadFileFromContainerWithTargetAsync
   (
      containerFile : Windows.Storage.IStorageFile
      ; target : Windows.Storage.IStorageItem
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult;
   
   function CreateProtectedAndOpenAsync
   (
      parentFolder : Windows.Storage.IStorageFolder
      ; desiredName : Windows.String
      ; identity : Windows.String
      ; collisionOption : Windows.Storage.CreationCollisionOption
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedFileCreateResult;
   
   function UnprotectAsync
   (
      target : Windows.Storage.IStorageItem
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo;
   
   function UnprotectWithOptionsAsync
   (
      target : Windows.Storage.IStorageItem
      ; options : Windows.Security.EnterpriseData.IFileUnprotectOptions
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo;
   
   function IsContainerAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function LoadFileFromContainerWithTargetAndNameCollisionOptionAsync
   (
      containerFile : Windows.Storage.IStorageFile
      ; target : Windows.Storage.IStorageItem
      ; collisionOption : Windows.Storage.NameCollisionOption
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult;
   
   function SaveFileAsContainerWithSharingAsync
   (
      protectedFile : Windows.Storage.IStorageFile
      ; sharedWithIdentities : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult;
   
   function ProtectAsync
   (
      data : Windows.Storage.Streams.IBuffer
      ; identity : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult;
   
   function UnprotectAsync
   (
      data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult;
   
   function ProtectStreamAsync
   (
      unprotectedStream : Windows.Storage.Streams.IInputStream
      ; identity : Windows.String
      ; protectedStream : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo;
   
   function UnprotectStreamAsync
   (
      protectedStream : Windows.Storage.Streams.IInputStream
      ; unprotectedStream : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo;
   
   function GetProtectionInfoAsync
   (
      protectedData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo;
   
   function GetStreamProtectionInfoAsync
   (
      protectedStream : Windows.Storage.Streams.IInputStream
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo;

end;
