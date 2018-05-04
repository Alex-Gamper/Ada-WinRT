--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
limited with Windows.Storage.Streams;
limited with Windows.System;
limited with Windows.Storage;
limited with Windows.ApplicationModel.Core;
with Windows; use Windows;
--------------------------------------------------------------------------------
package Windows.ApplicationModel is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type StartupTaskState is (
      Disabled,
      DisabledByUser,
      Enabled,
      DisabledByPolicy
   );
   for StartupTaskState use (
      Disabled => 0,
      DisabledByUser => 1,
      Enabled => 2,
      DisabledByPolicy => 3
   );
   for StartupTaskState'Size use 32;
   
   type StartupTaskState_Ptr is access StartupTaskState;
   
   type PackageSignatureKind is (
      None,
      Developer,
      Enterprise,
      Store_x,
      System
   );
   for PackageSignatureKind use (
      None => 0,
      Developer => 1,
      Enterprise => 2,
      Store_x => 3,
      System => 4
   );
   for PackageSignatureKind'Size use 32;
   
   type PackageSignatureKind_Ptr is access PackageSignatureKind;
   
   type PackageContentGroupState is (
      NotStaged,
      Queued,
      Staging,
      Staged
   );
   for PackageContentGroupState use (
      NotStaged => 0,
      Queued => 1,
      Staging => 2,
      Staged => 3
   );
   for PackageContentGroupState'Size use 32;
   
   type PackageContentGroupState_Ptr is access PackageContentGroupState;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type FullTrustAppContract is null record;
   pragma Convention (C_Pass_By_Copy , FullTrustAppContract);
   
   type FullTrustAppContract_Ptr is access FullTrustAppContract;
   
   type StartupTaskContract is null record;
   pragma Convention (C_Pass_By_Copy , StartupTaskContract);
   
   type StartupTaskContract_Ptr is access StartupTaskContract;
   
   type PackageVersion is record
      Major : Windows.UInt16;
      Minor : Windows.UInt16;
      Build : Windows.UInt16;
      Revision : Windows.UInt16;
   end record;
   pragma Convention (C_Pass_By_Copy , PackageVersion);
   
   type PackageVersion_Ptr is access PackageVersion;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_StartupTaskState_Interface;
   type AsyncOperationCompletedHandler_StartupTaskState is access all AsyncOperationCompletedHandler_StartupTaskState_Interface'Class;
   type AsyncOperationCompletedHandler_StartupTaskState_Ptr is access all AsyncOperationCompletedHandler_StartupTaskState;
   type AsyncOperationCompletedHandler_IStartupTask_Interface;
   type AsyncOperationCompletedHandler_IStartupTask is access all AsyncOperationCompletedHandler_IStartupTask_Interface'Class;
   type AsyncOperationCompletedHandler_IStartupTask_Ptr is access all AsyncOperationCompletedHandler_IStartupTask;
   type AsyncOperationCompletedHandler_IPackageContentGroup_Interface;
   type AsyncOperationCompletedHandler_IPackageContentGroup is access all AsyncOperationCompletedHandler_IPackageContentGroup_Interface'Class;
   type AsyncOperationCompletedHandler_IPackageContentGroup_Ptr is access all AsyncOperationCompletedHandler_IPackageContentGroup;
   type TypedEventHandler_IPackageCatalog_add_PackageStaging_Interface;
   type TypedEventHandler_IPackageCatalog_add_PackageStaging is access all TypedEventHandler_IPackageCatalog_add_PackageStaging_Interface'Class;
   type TypedEventHandler_IPackageCatalog_add_PackageStaging_Ptr is access all TypedEventHandler_IPackageCatalog_add_PackageStaging;
   type TypedEventHandler_IPackageCatalog_add_PackageInstalling_Interface;
   type TypedEventHandler_IPackageCatalog_add_PackageInstalling is access all TypedEventHandler_IPackageCatalog_add_PackageInstalling_Interface'Class;
   type TypedEventHandler_IPackageCatalog_add_PackageInstalling_Ptr is access all TypedEventHandler_IPackageCatalog_add_PackageInstalling;
   type TypedEventHandler_IPackageCatalog_add_PackageUpdating_Interface;
   type TypedEventHandler_IPackageCatalog_add_PackageUpdating is access all TypedEventHandler_IPackageCatalog_add_PackageUpdating_Interface'Class;
   type TypedEventHandler_IPackageCatalog_add_PackageUpdating_Ptr is access all TypedEventHandler_IPackageCatalog_add_PackageUpdating;
   type TypedEventHandler_IPackageCatalog_add_PackageUninstalling_Interface;
   type TypedEventHandler_IPackageCatalog_add_PackageUninstalling is access all TypedEventHandler_IPackageCatalog_add_PackageUninstalling_Interface'Class;
   type TypedEventHandler_IPackageCatalog_add_PackageUninstalling_Ptr is access all TypedEventHandler_IPackageCatalog_add_PackageUninstalling;
   type TypedEventHandler_IPackageCatalog_add_PackageStatusChanged_Interface;
   type TypedEventHandler_IPackageCatalog_add_PackageStatusChanged is access all TypedEventHandler_IPackageCatalog_add_PackageStatusChanged_Interface'Class;
   type TypedEventHandler_IPackageCatalog_add_PackageStatusChanged_Ptr is access all TypedEventHandler_IPackageCatalog_add_PackageStatusChanged;
   type TypedEventHandler_IPackageCatalog2_add_PackageContentGroupStaging_Interface;
   type TypedEventHandler_IPackageCatalog2_add_PackageContentGroupStaging is access all TypedEventHandler_IPackageCatalog2_add_PackageContentGroupStaging_Interface'Class;
   type TypedEventHandler_IPackageCatalog2_add_PackageContentGroupStaging_Ptr is access all TypedEventHandler_IPackageCatalog2_add_PackageContentGroupStaging;
   type AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult_Interface;
   type AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult is access all AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult_Interface'Class;
   type AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult_Ptr is access all AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult;
   type AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult_Interface;
   type AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult is access all AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult_Interface'Class;
   type AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult_Ptr is access all AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult;
   type EventHandler_ISuspendingEventArgs_Interface;
   type EventHandler_ISuspendingEventArgs is access all EventHandler_ISuspendingEventArgs_Interface'Class;
   type EventHandler_ISuspendingEventArgs_Ptr is access all EventHandler_ISuspendingEventArgs;
   type EventHandler_ILeavingBackgroundEventArgs_Interface;
   type EventHandler_ILeavingBackgroundEventArgs is access all EventHandler_ILeavingBackgroundEventArgs_Interface'Class;
   type EventHandler_ILeavingBackgroundEventArgs_Ptr is access all EventHandler_ILeavingBackgroundEventArgs;
   type EventHandler_IEnteredBackgroundEventArgs_Interface;
   type EventHandler_IEnteredBackgroundEventArgs is access all EventHandler_IEnteredBackgroundEventArgs_Interface'Class;
   type EventHandler_IEnteredBackgroundEventArgs_Ptr is access all EventHandler_IEnteredBackgroundEventArgs;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IFullTrustProcessLauncherStatics_Interface;
   type IFullTrustProcessLauncherStatics is access all IFullTrustProcessLauncherStatics_Interface'Class;
   type IFullTrustProcessLauncherStatics_Ptr is access all IFullTrustProcessLauncherStatics;
   type IStartupTask_Interface;
   type IStartupTask is access all IStartupTask_Interface'Class;
   type IStartupTask_Ptr is access all IStartupTask;
   type IStartupTaskStatics_Interface;
   type IStartupTaskStatics is access all IStartupTaskStatics_Interface'Class;
   type IStartupTaskStatics_Ptr is access all IStartupTaskStatics;
   type IAppDisplayInfo_Interface;
   type IAppDisplayInfo is access all IAppDisplayInfo_Interface'Class;
   type IAppDisplayInfo_Ptr is access all IAppDisplayInfo;
   type IAppInfo_Interface;
   type IAppInfo is access all IAppInfo_Interface'Class;
   type IAppInfo_Ptr is access all IAppInfo;
   type IPackageIdWithMetadata_Interface;
   type IPackageIdWithMetadata is access all IPackageIdWithMetadata_Interface'Class;
   type IPackageIdWithMetadata_Ptr is access all IPackageIdWithMetadata;
   type IPackageWithMetadata_Interface;
   type IPackageWithMetadata is access all IPackageWithMetadata_Interface'Class;
   type IPackageWithMetadata_Ptr is access all IPackageWithMetadata;
   type IPackageStatus_Interface;
   type IPackageStatus is access all IPackageStatus_Interface'Class;
   type IPackageStatus_Ptr is access all IPackageStatus;
   type IPackageStatus2_Interface;
   type IPackageStatus2 is access all IPackageStatus2_Interface'Class;
   type IPackageStatus2_Ptr is access all IPackageStatus2;
   type IPackageId_Interface;
   type IPackageId is access all IPackageId_Interface'Class;
   type IPackageId_Ptr is access all IPackageId;
   type IPackage_Interface;
   type IPackage is access all IPackage_Interface'Class;
   type IPackage_Ptr is access all IPackage;
   type IPackage2_Interface;
   type IPackage2 is access all IPackage2_Interface'Class;
   type IPackage2_Ptr is access all IPackage2;
   type IPackage3_Interface;
   type IPackage3 is access all IPackage3_Interface'Class;
   type IPackage3_Ptr is access all IPackage3;
   type IPackage4_Interface;
   type IPackage4 is access all IPackage4_Interface'Class;
   type IPackage4_Ptr is access all IPackage4;
   type IPackage5_Interface;
   type IPackage5 is access all IPackage5_Interface'Class;
   type IPackage5_Ptr is access all IPackage5;
   type IPackageStatics_Interface;
   type IPackageStatics is access all IPackageStatics_Interface'Class;
   type IPackageStatics_Ptr is access all IPackageStatics;
   type IPackageStagingEventArgs_Interface;
   type IPackageStagingEventArgs is access all IPackageStagingEventArgs_Interface'Class;
   type IPackageStagingEventArgs_Ptr is access all IPackageStagingEventArgs;
   type IPackageInstallingEventArgs_Interface;
   type IPackageInstallingEventArgs is access all IPackageInstallingEventArgs_Interface'Class;
   type IPackageInstallingEventArgs_Ptr is access all IPackageInstallingEventArgs;
   type IPackageUpdatingEventArgs_Interface;
   type IPackageUpdatingEventArgs is access all IPackageUpdatingEventArgs_Interface'Class;
   type IPackageUpdatingEventArgs_Ptr is access all IPackageUpdatingEventArgs;
   type IPackageUninstallingEventArgs_Interface;
   type IPackageUninstallingEventArgs is access all IPackageUninstallingEventArgs_Interface'Class;
   type IPackageUninstallingEventArgs_Ptr is access all IPackageUninstallingEventArgs;
   type IPackageStatusChangedEventArgs_Interface;
   type IPackageStatusChangedEventArgs is access all IPackageStatusChangedEventArgs_Interface'Class;
   type IPackageStatusChangedEventArgs_Ptr is access all IPackageStatusChangedEventArgs;
   type IPackageContentGroupStagingEventArgs_Interface;
   type IPackageContentGroupStagingEventArgs is access all IPackageContentGroupStagingEventArgs_Interface'Class;
   type IPackageContentGroupStagingEventArgs_Ptr is access all IPackageContentGroupStagingEventArgs;
   type IPackageCatalog_Interface;
   type IPackageCatalog is access all IPackageCatalog_Interface'Class;
   type IPackageCatalog_Ptr is access all IPackageCatalog;
   type IPackageCatalogAddOptionalPackageResult_Interface;
   type IPackageCatalogAddOptionalPackageResult is access all IPackageCatalogAddOptionalPackageResult_Interface'Class;
   type IPackageCatalogAddOptionalPackageResult_Ptr is access all IPackageCatalogAddOptionalPackageResult;
   type IPackageCatalog2_Interface;
   type IPackageCatalog2 is access all IPackageCatalog2_Interface'Class;
   type IPackageCatalog2_Ptr is access all IPackageCatalog2;
   type IPackageCatalogRemoveOptionalPackagesResult_Interface;
   type IPackageCatalogRemoveOptionalPackagesResult is access all IPackageCatalogRemoveOptionalPackagesResult_Interface'Class;
   type IPackageCatalogRemoveOptionalPackagesResult_Ptr is access all IPackageCatalogRemoveOptionalPackagesResult;
   type IPackageCatalog3_Interface;
   type IPackageCatalog3 is access all IPackageCatalog3_Interface'Class;
   type IPackageCatalog3_Ptr is access all IPackageCatalog3;
   type IPackageCatalogStatics_Interface;
   type IPackageCatalogStatics is access all IPackageCatalogStatics_Interface'Class;
   type IPackageCatalogStatics_Ptr is access all IPackageCatalogStatics;
   type IPackageContentGroup_Interface;
   type IPackageContentGroup is access all IPackageContentGroup_Interface'Class;
   type IPackageContentGroup_Ptr is access all IPackageContentGroup;
   type IPackageContentGroupStatics_Interface;
   type IPackageContentGroupStatics is access all IPackageContentGroupStatics_Interface'Class;
   type IPackageContentGroupStatics_Ptr is access all IPackageContentGroupStatics;
   type IDesignModeStatics_Interface;
   type IDesignModeStatics is access all IDesignModeStatics_Interface'Class;
   type IDesignModeStatics_Ptr is access all IDesignModeStatics;
   type IDesignModeStatics2_Interface;
   type IDesignModeStatics2 is access all IDesignModeStatics2_Interface'Class;
   type IDesignModeStatics2_Ptr is access all IDesignModeStatics2;
   type ISuspendingDeferral_Interface;
   type ISuspendingDeferral is access all ISuspendingDeferral_Interface'Class;
   type ISuspendingDeferral_Ptr is access all ISuspendingDeferral;
   type ISuspendingOperation_Interface;
   type ISuspendingOperation is access all ISuspendingOperation_Interface'Class;
   type ISuspendingOperation_Ptr is access all ISuspendingOperation;
   type ISuspendingEventArgs_Interface;
   type ISuspendingEventArgs is access all ISuspendingEventArgs_Interface'Class;
   type ISuspendingEventArgs_Ptr is access all ISuspendingEventArgs;
   type ILeavingBackgroundEventArgs_Interface;
   type ILeavingBackgroundEventArgs is access all ILeavingBackgroundEventArgs_Interface'Class;
   type ILeavingBackgroundEventArgs_Ptr is access all ILeavingBackgroundEventArgs;
   type IEnteredBackgroundEventArgs_Interface;
   type IEnteredBackgroundEventArgs is access all IEnteredBackgroundEventArgs_Interface'Class;
   type IEnteredBackgroundEventArgs_Ptr is access all IEnteredBackgroundEventArgs;
   type ICameraApplicationManagerStatics_Interface;
   type ICameraApplicationManagerStatics is access all ICameraApplicationManagerStatics_Interface'Class;
   type ICameraApplicationManagerStatics_Ptr is access all ICameraApplicationManagerStatics;
   type IAsyncOperation_StartupTaskState_Interface;
   type IAsyncOperation_StartupTaskState is access all IAsyncOperation_StartupTaskState_Interface'Class;
   type IAsyncOperation_StartupTaskState_Ptr is access all IAsyncOperation_StartupTaskState;
   type IAsyncOperation_IStartupTask_Interface;
   type IAsyncOperation_IStartupTask is access all IAsyncOperation_IStartupTask_Interface'Class;
   type IAsyncOperation_IStartupTask_Ptr is access all IAsyncOperation_IStartupTask;
   type IIterator_IPackage_Interface;
   type IIterator_IPackage is access all IIterator_IPackage_Interface'Class;
   type IIterator_IPackage_Ptr is access all IIterator_IPackage;
   type IIterable_IPackage_Interface;
   type IIterable_IPackage is access all IIterable_IPackage_Interface'Class;
   type IIterable_IPackage_Ptr is access all IIterable_IPackage;
   type IVectorView_IPackage_Interface;
   type IVectorView_IPackage is access all IVectorView_IPackage_Interface'Class;
   type IVectorView_IPackage_Ptr is access all IVectorView_IPackage;
   type IVector_IPackage_Interface;
   type IVector_IPackage is access all IVector_IPackage_Interface'Class;
   type IVector_IPackage_Ptr is access all IVector_IPackage;
   type IAsyncOperation_IPackageContentGroup_Interface;
   type IAsyncOperation_IPackageContentGroup is access all IAsyncOperation_IPackageContentGroup_Interface'Class;
   type IAsyncOperation_IPackageContentGroup_Ptr is access all IAsyncOperation_IPackageContentGroup;
   type IAsyncOperation_IPackageCatalogAddOptionalPackageResult_Interface;
   type IAsyncOperation_IPackageCatalogAddOptionalPackageResult is access all IAsyncOperation_IPackageCatalogAddOptionalPackageResult_Interface'Class;
   type IAsyncOperation_IPackageCatalogAddOptionalPackageResult_Ptr is access all IAsyncOperation_IPackageCatalogAddOptionalPackageResult;
   type IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult_Interface;
   type IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult is access all IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult_Interface'Class;
   type IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult_Ptr is access all IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IFullTrustProcessLauncherStatics : aliased constant Windows.IID := (3615785855, 4352, 15467, (164, 85, 246, 38, 44, 195, 49, 182 ));
   
   type IFullTrustProcessLauncherStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function LaunchFullTrustProcessForCurrentAppAsync
   (
      This       : access IFullTrustProcessLauncherStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function LaunchFullTrustProcessForCurrentAppWithParametersAsync
   (
      This       : access IFullTrustProcessLauncherStatics_Interface
      ; parameterGroupId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function LaunchFullTrustProcessForAppAsync
   (
      This       : access IFullTrustProcessLauncherStatics_Interface
      ; fullTrustPackageRelativeAppId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function LaunchFullTrustProcessForAppWithParametersAsync
   (
      This       : access IFullTrustProcessLauncherStatics_Interface
      ; fullTrustPackageRelativeAppId : Windows.String
      ; parameterGroupId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStartupTask : aliased constant Windows.IID := (4150010824, 46578, 20332, (136, 221, 54, 203, 29, 89, 157, 23 ));
   
   type IStartupTask_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestEnableAsync
   (
      This       : access IStartupTask_Interface
      ; RetVal : access Windows.ApplicationModel.IAsyncOperation_StartupTaskState -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Disable
   (
      This       : access IStartupTask_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IStartupTask_Interface
      ; RetVal : access Windows.ApplicationModel.StartupTaskState
   )
   return Windows.HRESULT is abstract;
   
   function get_TaskId
   (
      This       : access IStartupTask_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStartupTaskStatics : aliased constant Windows.IID := (3998965949, 41288, 16807, (178, 110, 232, 184, 138, 30, 98, 248 ));
   
   type IStartupTaskStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentPackageAsync
   (
      This       : access IStartupTaskStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAsync
   (
      This       : access IStartupTaskStatics_Interface
      ; taskId : Windows.String
      ; RetVal : access Windows.ApplicationModel.IAsyncOperation_IStartupTask -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppDisplayInfo : aliased constant Windows.IID := (451612931, 58580, 16810, (164, 246, 196, 162, 118, 231, 158, 172 ));
   
   type IAppDisplayInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IAppDisplayInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IAppDisplayInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetLogo
   (
      This       : access IAppDisplayInfo_Interface
      ; size : Windows.Foundation.Size
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInfo : aliased constant Windows.IID := (3481229747, 27145, 19944, (166, 192, 87, 146, 213, 104, 128, 209 ));
   
   type IAppInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IAppInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppUserModelId
   (
      This       : access IAppInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayInfo
   (
      This       : access IAppInfo_Interface
      ; RetVal : access Windows.ApplicationModel.IAppDisplayInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_PackageFamilyName
   (
      This       : access IAppInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageIdWithMetadata : aliased constant Windows.IID := (1079474812, 3230, 17469, (144, 116, 133, 95, 92, 224, 160, 141 ));
   
   type IPackageIdWithMetadata_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProductId
   (
      This       : access IPackageIdWithMetadata_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Author
   (
      This       : access IPackageIdWithMetadata_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageWithMetadata : aliased constant Windows.IID := (2509543296, 7657, 16626, (180, 82, 13, 233, 241, 145, 0, 18 ));
   
   type IPackageWithMetadata_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InstallDate
   (
      This       : access IPackageWithMetadata_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function GetThumbnailToken
   (
      This       : access IPackageWithMetadata_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Launch
   (
      This       : access IPackageWithMetadata_Interface
      ; parameters : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageStatus : aliased constant Windows.IID := (1608994673, 41829, 19465, (160, 45, 4, 109, 82, 94, 161, 218 ));
   
   type IPackageStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function VerifyIsOK
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NotAvailable
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PackageOffline
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DataOffline
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Disabled
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NeedsRemediation
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LicenseIssue
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Modified
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Tampered
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DependencyIssue
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Servicing
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DeploymentInProgress
   (
      This       : access IPackageStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageStatus2 : aliased constant Windows.IID := (4096326291, 31830, 18530, (172, 250, 171, 174, 220, 192, 105, 77 ));
   
   type IPackageStatus2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPartiallyStaged
   (
      This       : access IPackageStatus2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageId : aliased constant Windows.IID := (450586206, 14279, 18320, (153, 128, 221, 122, 231, 78, 139, 178 ));
   
   type IPackageId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPackageId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Version
   (
      This       : access IPackageId_Interface
      ; RetVal : access Windows.ApplicationModel.PackageVersion
   )
   return Windows.HRESULT is abstract;
   
   function get_Architecture
   (
      This       : access IPackageId_Interface
      ; RetVal : access Windows.System.ProcessorArchitecture
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceId
   (
      This       : access IPackageId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Publisher
   (
      This       : access IPackageId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PublisherId
   (
      This       : access IPackageId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FullName
   (
      This       : access IPackageId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FamilyName
   (
      This       : access IPackageId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackage : aliased constant Windows.IID := (373061935, 48501, 16700, (191, 35, 177, 254, 123, 149, 216, 37 ));
   
   type IPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IPackage_Interface
      ; RetVal : access Windows.ApplicationModel.IPackageId
   )
   return Windows.HRESULT is abstract;
   
   function get_InstalledLocation
   (
      This       : access IPackage_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFramework
   (
      This       : access IPackage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Dependencies
   (
      This       : access IPackage_Interface
      ; RetVal : access Windows.ApplicationModel.IVectorView_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackage2 : aliased constant Windows.IID := (2791387062, 30344, 19150, (149, 251, 53, 149, 56, 231, 170, 1 ));
   
   type IPackage2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IPackage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PublisherDisplayName
   (
      This       : access IPackage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IPackage2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Logo
   (
      This       : access IPackage2_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_IsResourcePackage
   (
      This       : access IPackage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBundle
   (
      This       : access IPackage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDevelopmentMode
   (
      This       : access IPackage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackage3 : aliased constant Windows.IID := (1601407841, 63594, 18711, (147, 209, 241, 238, 157, 59, 53, 217 ));
   
   type IPackage3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IPackage3_Interface
      ; RetVal : access Windows.ApplicationModel.IPackageStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_InstalledDate
   (
      This       : access IPackage3_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function GetAppListEntriesAsync
   (
      This       : access IPackage3_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackage4 : aliased constant Windows.IID := (1705955758, 47451, 17676, (136, 43, 98, 85, 24, 127, 57, 126 ));
   
   type IPackage4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SignatureKind
   (
      This       : access IPackage4_Interface
      ; RetVal : access Windows.ApplicationModel.PackageSignatureKind
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOptional
   (
      This       : access IPackage4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function VerifyContentIntegrityAsync
   (
      This       : access IPackage4_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackage5 : aliased constant Windows.IID := (243543508, 55724, 17901, (154, 30, 116, 206, 5, 107, 38, 53 ));
   
   type IPackage5_Interface is interface and Windows.IInspectable_Interface;
   
   function GetContentGroupsAsync
   (
      This       : access IPackage5_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetContentGroupAsync
   (
      This       : access IPackage5_Interface
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.IAsyncOperation_IPackageContentGroup -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StageContentGroupsAsync
   (
      This       : access IPackage5_Interface
      ; names : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StageContentGroupsWithPriorityAsync
   (
      This       : access IPackage5_Interface
      ; names : Windows.Foundation.Collections.IIterable_String
      ; moveToHeadOfQueue : Windows.Boolean
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetInUseAsync
   (
      This       : access IPackage5_Interface
      ; inUse : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageStatics : aliased constant Windows.IID := (1314081759, 10592, 18552, (151, 164, 150, 36, 222, 183, 47, 45 ));
   
   type IPackageStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IPackageStatics_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageStagingEventArgs : aliased constant Windows.IID := (272721965, 21730, 20305, (184, 40, 158, 247, 4, 108, 33, 15 ));
   
   type IPackageStagingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivityId
   (
      This       : access IPackageStagingEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IPackageStagingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IPackageStagingEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsComplete
   (
      This       : access IPackageStagingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IPackageStagingEventArgs_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageInstallingEventArgs : aliased constant Windows.IID := (2540969655, 43898, 16410, (139, 97, 235, 14, 127, 175, 242, 55 ));
   
   type IPackageInstallingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivityId
   (
      This       : access IPackageInstallingEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IPackageInstallingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IPackageInstallingEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsComplete
   (
      This       : access IPackageInstallingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IPackageInstallingEventArgs_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageUpdatingEventArgs : aliased constant Windows.IID := (3447407144, 64884, 17470, (177, 20, 35, 230, 119, 176, 232, 111 ));
   
   type IPackageUpdatingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivityId
   (
      This       : access IPackageUpdatingEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_SourcePackage
   (
      This       : access IPackageUpdatingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetPackage
   (
      This       : access IPackageUpdatingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IPackageUpdatingEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsComplete
   (
      This       : access IPackageUpdatingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IPackageUpdatingEventArgs_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageUninstallingEventArgs : aliased constant Windows.IID := (1145285202, 43810, 17613, (130, 187, 78, 201, 184, 39, 54, 122 ));
   
   type IPackageUninstallingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivityId
   (
      This       : access IPackageUninstallingEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IPackageUninstallingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IPackageUninstallingEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsComplete
   (
      This       : access IPackageUninstallingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IPackageUninstallingEventArgs_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageStatusChangedEventArgs : aliased constant Windows.IID := (1132294477, 48512, 19056, (188, 80, 246, 231, 150, 80, 149, 117 ));
   
   type IPackageStatusChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Package
   (
      This       : access IPackageStatusChangedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageContentGroupStagingEventArgs : aliased constant Windows.IID := (1031520894, 28455, 17516, (152, 110, 212, 115, 61, 77, 145, 19 ));
   
   type IPackageContentGroupStagingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivityId
   (
      This       : access IPackageContentGroupStagingEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IPackageContentGroupStagingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IPackageContentGroupStagingEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsComplete
   (
      This       : access IPackageContentGroupStagingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IPackageContentGroupStagingEventArgs_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentGroupName
   (
      This       : access IPackageContentGroupStagingEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsContentGroupRequired
   (
      This       : access IPackageContentGroupStagingEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageCatalog : aliased constant Windows.IID := (587872081, 40419, 17477, (190, 116, 145, 251, 50, 90, 190, 254 ));
   
   type IPackageCatalog_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PackageStaging
   (
      This       : access IPackageCatalog_Interface
      ; handler : TypedEventHandler_IPackageCatalog_add_PackageStaging
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageStaging
   (
      This       : access IPackageCatalog_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PackageInstalling
   (
      This       : access IPackageCatalog_Interface
      ; handler : TypedEventHandler_IPackageCatalog_add_PackageInstalling
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageInstalling
   (
      This       : access IPackageCatalog_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PackageUpdating
   (
      This       : access IPackageCatalog_Interface
      ; handler : TypedEventHandler_IPackageCatalog_add_PackageUpdating
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageUpdating
   (
      This       : access IPackageCatalog_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PackageUninstalling
   (
      This       : access IPackageCatalog_Interface
      ; handler : TypedEventHandler_IPackageCatalog_add_PackageUninstalling
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageUninstalling
   (
      This       : access IPackageCatalog_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PackageStatusChanged
   (
      This       : access IPackageCatalog_Interface
      ; handler : TypedEventHandler_IPackageCatalog_add_PackageStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageStatusChanged
   (
      This       : access IPackageCatalog_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageCatalogAddOptionalPackageResult : aliased constant Windows.IID := (1005653204, 46303, 18355, (169, 99, 226, 250, 131, 47, 125, 211 ));
   
   type IPackageCatalogAddOptionalPackageResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Package
   (
      This       : access IPackageCatalogAddOptionalPackageResult_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IPackageCatalogAddOptionalPackageResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageCatalog2 : aliased constant Windows.IID := (2527464502, 36855, 17220, (182, 191, 238, 100, 194, 32, 126, 210 ));
   
   type IPackageCatalog2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PackageContentGroupStaging
   (
      This       : access IPackageCatalog2_Interface
      ; handler : TypedEventHandler_IPackageCatalog2_add_PackageContentGroupStaging
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PackageContentGroupStaging
   (
      This       : access IPackageCatalog2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function AddOptionalPackageAsync
   (
      This       : access IPackageCatalog2_Interface
      ; optionalPackageFamilyName : Windows.String
      ; RetVal : access Windows.ApplicationModel.IAsyncOperation_IPackageCatalogAddOptionalPackageResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageCatalogRemoveOptionalPackagesResult : aliased constant Windows.IID := (701692283, 55668, 20068, (147, 89, 34, 202, 223, 215, 152, 40 ));
   
   type IPackageCatalogRemoveOptionalPackagesResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PackagesRemoved
   (
      This       : access IPackageCatalogRemoveOptionalPackagesResult_Interface
      ; RetVal : access Windows.ApplicationModel.IVectorView_IPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IPackageCatalogRemoveOptionalPackagesResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageCatalog3 : aliased constant Windows.IID := (2531089544, 34871, 17401, (144, 21, 3, 52, 52, 186, 20, 243 ));
   
   type IPackageCatalog3_Interface is interface and Windows.IInspectable_Interface;
   
   function RemoveOptionalPackagesAsync
   (
      This       : access IPackageCatalog3_Interface
      ; optionalPackageFamilyNames : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.ApplicationModel.IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageCatalogStatics : aliased constant Windows.IID := (2710345366, 58971, 17972, (186, 33, 94, 99, 235, 114, 68, 167 ));
   
   type IPackageCatalogStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenForCurrentPackage
   (
      This       : access IPackageCatalogStatics_Interface
      ; RetVal : access Windows.ApplicationModel.IPackageCatalog
   )
   return Windows.HRESULT is abstract;
   
   function OpenForCurrentUser
   (
      This       : access IPackageCatalogStatics_Interface
      ; RetVal : access Windows.ApplicationModel.IPackageCatalog
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageContentGroup : aliased constant Windows.IID := (2405591389, 4618, 18328, (181, 225, 88, 0, 221, 168, 242, 225 ));
   
   type IPackageContentGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Package
   (
      This       : access IPackageContentGroup_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IPackageContentGroup_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IPackageContentGroup_Interface
      ; RetVal : access Windows.ApplicationModel.PackageContentGroupState
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRequired
   (
      This       : access IPackageContentGroup_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPackageContentGroupStatics : aliased constant Windows.IID := (1894675993, 24338, 19346, (185, 234, 108, 202, 218, 19, 188, 117 ));
   
   type IPackageContentGroupStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequiredGroupName
   (
      This       : access IPackageContentGroupStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDesignModeStatics : aliased constant Windows.IID := (741905356, 63514, 20090, (184, 87, 118, 168, 8, 135, 225, 133 ));
   
   type IDesignModeStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesignModeEnabled
   (
      This       : access IDesignModeStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDesignModeStatics2 : aliased constant Windows.IID := (2161082679, 45156, 18520, (190, 200, 62, 186, 34, 53, 117, 53 ));
   
   type IDesignModeStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesignMode2Enabled
   (
      This       : access IDesignModeStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISuspendingDeferral : aliased constant Windows.IID := (1494484233, 35785, 20148, (182, 54, 218, 189, 196, 244, 111, 102 ));
   
   type ISuspendingDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access ISuspendingDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISuspendingOperation : aliased constant Windows.IID := (2644822593, 8417, 20123, (159, 101, 169, 244, 53, 52, 12, 58 ));
   
   type ISuspendingOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access ISuspendingOperation_Interface
      ; RetVal : access Windows.ApplicationModel.ISuspendingDeferral
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access ISuspendingOperation_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISuspendingEventArgs : aliased constant Windows.IID := (2516982789, 11706, 19720, (176, 189, 43, 48, 161, 49, 198, 170 ));
   
   type ISuspendingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SuspendingOperation
   (
      This       : access ISuspendingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.ISuspendingOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILeavingBackgroundEventArgs : aliased constant Windows.IID := (969338010, 44654, 18169, (160, 122, 207, 194, 63, 136, 115, 62 ));
   
   type ILeavingBackgroundEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access ILeavingBackgroundEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEnteredBackgroundEventArgs : aliased constant Windows.IID := (4146257090, 38951, 16445, (170, 237, 236, 202, 154, 193, 115, 152 ));
   
   type IEnteredBackgroundEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IEnteredBackgroundEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICameraApplicationManagerStatics : aliased constant Windows.IID := (2509888974, 39891, 17244, (128, 84, 193, 173, 213, 0, 40, 254 ));
   
   type ICameraApplicationManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowInstalledApplicationsUI
   (
      This       : access ICameraApplicationManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_StartupTaskState : aliased constant Windows.IID := (1379510580, 32994, 20879, (184, 25, 31, 49, 111, 55, 154, 63 ));
   
   type IAsyncOperation_StartupTaskState_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_StartupTaskState_Interface
      ; handler : Windows.ApplicationModel.AsyncOperationCompletedHandler_StartupTaskState
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_StartupTaskState_Interface
      ; RetVal : access Windows.ApplicationModel.AsyncOperationCompletedHandler_StartupTaskState
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_StartupTaskState_Interface
      ; RetVal : access Windows.ApplicationModel.StartupTaskState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IStartupTask : aliased constant Windows.IID := (3421272654, 41030, 21296, (135, 61, 15, 206, 34, 135, 146, 250 ));
   
   type IAsyncOperation_IStartupTask_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStartupTask_Interface
      ; handler : Windows.ApplicationModel.AsyncOperationCompletedHandler_IStartupTask
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStartupTask_Interface
      ; RetVal : access Windows.ApplicationModel.AsyncOperationCompletedHandler_IStartupTask
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStartupTask_Interface
      ; RetVal : access Windows.ApplicationModel.IStartupTask
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPackage : aliased constant Windows.IID := (35123305, 604, 24294, (168, 127, 231, 130, 227, 182, 35, 174 ));
   
   type IIterator_IPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPackage_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPackage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPackage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPackage_Interface
      ; items : Windows.ApplicationModel.IPackage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPackage : aliased constant Windows.IID := (1772972711, 3145, 24359, (165, 235, 239, 77, 89, 70, 123, 109 ));
   
   type IIterable_IPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPackage_Interface
      ; RetVal : access Windows.ApplicationModel.IIterator_IPackage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPackage : aliased constant Windows.IID := (40092884, 6492, 24005, (167, 202, 104, 6, 206, 202, 66, 11 ));
   
   type IVectorView_IPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPackage_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPackage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPackage_Interface
      ; value : Windows.ApplicationModel.IPackage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPackage_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.IPackage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPackage : aliased constant Windows.IID := (3518714014, 27017, 23657, (177, 255, 209, 112, 47, 232, 172, 163 ));
   
   type IVector_IPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPackage_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPackage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPackage_Interface
      ; RetVal : access Windows.ApplicationModel.IVectorView_IPackage
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPackage_Interface
      ; value : Windows.ApplicationModel.IPackage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPackage_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPackage_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPackage_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPackage_Interface
      ; value : Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPackage_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPackage_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPackage_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.IPackage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPackage_Interface
      ; items : Windows.ApplicationModel.IPackage_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPackageContentGroup : aliased constant Windows.IID := (3151139555, 56223, 22530, (164, 136, 64, 241, 86, 51, 44, 4 ));
   
   type IAsyncOperation_IPackageContentGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPackageContentGroup_Interface
      ; handler : Windows.ApplicationModel.AsyncOperationCompletedHandler_IPackageContentGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPackageContentGroup_Interface
      ; RetVal : access Windows.ApplicationModel.AsyncOperationCompletedHandler_IPackageContentGroup
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPackageContentGroup_Interface
      ; RetVal : access Windows.ApplicationModel.IPackageContentGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPackageCatalogAddOptionalPackageResult : aliased constant Windows.IID := (1504856447, 34539, 21551, (190, 166, 27, 229, 62, 147, 225, 61 ));
   
   type IAsyncOperation_IPackageCatalogAddOptionalPackageResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPackageCatalogAddOptionalPackageResult_Interface
      ; handler : Windows.ApplicationModel.AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPackageCatalogAddOptionalPackageResult_Interface
      ; RetVal : access Windows.ApplicationModel.AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPackageCatalogAddOptionalPackageResult_Interface
      ; RetVal : access Windows.ApplicationModel.IPackageCatalogAddOptionalPackageResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult : aliased constant Windows.IID := (3485563306, 64408, 21743, (142, 168, 100, 73, 147, 71, 183, 247 ));
   
   type IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult_Interface
      ; handler : Windows.ApplicationModel.AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult_Interface
      ; RetVal : access Windows.ApplicationModel.AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult_Interface
      ; RetVal : access Windows.ApplicationModel.IPackageCatalogRemoveOptionalPackagesResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_StartupTaskState : aliased constant Windows.IID := (1889582951, 6632, 23174, (163, 46, 60, 152, 99, 130, 90, 4 ));
   
   type AsyncOperationCompletedHandler_StartupTaskState_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.IAsyncOperation_StartupTaskState ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_StartupTaskState'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_StartupTaskState_Interface
      ; asyncInfo : Windows.ApplicationModel.IAsyncOperation_StartupTaskState
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IStartupTask : aliased constant Windows.IID := (1948219031, 9298, 23680, (131, 198, 59, 111, 130, 43, 144, 76 ));
   
   type AsyncOperationCompletedHandler_IStartupTask_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.IAsyncOperation_IStartupTask ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IStartupTask'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStartupTask_Interface
      ; asyncInfo : Windows.ApplicationModel.IAsyncOperation_IStartupTask
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPackageContentGroup : aliased constant Windows.IID := (575921208, 39450, 21348, (154, 59, 3, 167, 218, 97, 84, 153 ));
   
   type AsyncOperationCompletedHandler_IPackageContentGroup_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.IAsyncOperation_IPackageContentGroup ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPackageContentGroup'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPackageContentGroup_Interface
      ; asyncInfo : Windows.ApplicationModel.IAsyncOperation_IPackageContentGroup
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPackageCatalog_add_PackageStaging : aliased constant Windows.IID := (388429101, 11148, 21066, (152, 198, 242, 207, 8, 147, 192, 242 ));
   
   type TypedEventHandler_IPackageCatalog_add_PackageStaging_Interface(Callback : access procedure (sender : Windows.ApplicationModel.IPackageCatalog ; args : Windows.ApplicationModel.IPackageStagingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPackageCatalog_add_PackageStaging'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPackageCatalog_add_PackageStaging_Interface
      ; sender : Windows.ApplicationModel.IPackageCatalog
      ; args : Windows.ApplicationModel.IPackageStagingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPackageCatalog_add_PackageInstalling : aliased constant Windows.IID := (2829648070, 55819, 23500, (167, 26, 190, 11, 146, 101, 216, 122 ));
   
   type TypedEventHandler_IPackageCatalog_add_PackageInstalling_Interface(Callback : access procedure (sender : Windows.ApplicationModel.IPackageCatalog ; args : Windows.ApplicationModel.IPackageInstallingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPackageCatalog_add_PackageInstalling'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPackageCatalog_add_PackageInstalling_Interface
      ; sender : Windows.ApplicationModel.IPackageCatalog
      ; args : Windows.ApplicationModel.IPackageInstallingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPackageCatalog_add_PackageUpdating : aliased constant Windows.IID := (3258848758, 50712, 21034, (130, 171, 79, 171, 54, 102, 92, 229 ));
   
   type TypedEventHandler_IPackageCatalog_add_PackageUpdating_Interface(Callback : access procedure (sender : Windows.ApplicationModel.IPackageCatalog ; args : Windows.ApplicationModel.IPackageUpdatingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPackageCatalog_add_PackageUpdating'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPackageCatalog_add_PackageUpdating_Interface
      ; sender : Windows.ApplicationModel.IPackageCatalog
      ; args : Windows.ApplicationModel.IPackageUpdatingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPackageCatalog_add_PackageUninstalling : aliased constant Windows.IID := (3177409777, 21535, 21482, (142, 252, 225, 96, 74, 57, 91, 26 ));
   
   type TypedEventHandler_IPackageCatalog_add_PackageUninstalling_Interface(Callback : access procedure (sender : Windows.ApplicationModel.IPackageCatalog ; args : Windows.ApplicationModel.IPackageUninstallingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPackageCatalog_add_PackageUninstalling'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPackageCatalog_add_PackageUninstalling_Interface
      ; sender : Windows.ApplicationModel.IPackageCatalog
      ; args : Windows.ApplicationModel.IPackageUninstallingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPackageCatalog_add_PackageStatusChanged : aliased constant Windows.IID := (3006102883, 52494, 23598, (162, 81, 251, 141, 41, 8, 36, 228 ));
   
   type TypedEventHandler_IPackageCatalog_add_PackageStatusChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.IPackageCatalog ; args : Windows.ApplicationModel.IPackageStatusChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPackageCatalog_add_PackageStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPackageCatalog_add_PackageStatusChanged_Interface
      ; sender : Windows.ApplicationModel.IPackageCatalog
      ; args : Windows.ApplicationModel.IPackageStatusChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPackageCatalog2_add_PackageContentGroupStaging : aliased constant Windows.IID := (3743443041, 40240, 22329, (136, 178, 151, 224, 113, 124, 197, 240 ));
   
   type TypedEventHandler_IPackageCatalog2_add_PackageContentGroupStaging_Interface(Callback : access procedure (sender : Windows.ApplicationModel.IPackageCatalog ; args : Windows.ApplicationModel.IPackageContentGroupStagingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPackageCatalog2_add_PackageContentGroupStaging'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPackageCatalog2_add_PackageContentGroupStaging_Interface
      ; sender : Windows.ApplicationModel.IPackageCatalog
      ; args : Windows.ApplicationModel.IPackageContentGroupStagingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult : aliased constant Windows.IID := (1818205021, 15396, 20615, (174, 21, 106, 180, 148, 44, 70, 57 ));
   
   type AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.IAsyncOperation_IPackageCatalogAddOptionalPackageResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPackageCatalogAddOptionalPackageResult_Interface
      ; asyncInfo : Windows.ApplicationModel.IAsyncOperation_IPackageCatalogAddOptionalPackageResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult : aliased constant Windows.IID := (4050149676, 26754, 23692, (164, 100, 126, 162, 94, 38, 152, 118 ));
   
   type AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPackageCatalogRemoveOptionalPackagesResult_Interface
      ; asyncInfo : Windows.ApplicationModel.IAsyncOperation_IPackageCatalogRemoveOptionalPackagesResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_ISuspendingEventArgs : aliased constant Windows.IID := (864385471, 6709, 23748, (166, 34, 166, 243, 132, 253, 137, 44 ));
   
   type EventHandler_ISuspendingEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.ApplicationModel.ISuspendingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_ISuspendingEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_ISuspendingEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.ApplicationModel.ISuspendingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_ILeavingBackgroundEventArgs : aliased constant Windows.IID := (2606854594, 43954, 20884, (175, 192, 206, 241, 103, 196, 36, 235 ));
   
   type EventHandler_ILeavingBackgroundEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.ApplicationModel.ILeavingBackgroundEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_ILeavingBackgroundEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_ILeavingBackgroundEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.ApplicationModel.ILeavingBackgroundEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_IEnteredBackgroundEventArgs : aliased constant Windows.IID := (3765673010, 64532, 21345, (168, 179, 8, 9, 105, 159, 188, 189 ));
   
   type EventHandler_IEnteredBackgroundEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.ApplicationModel.IEnteredBackgroundEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_IEnteredBackgroundEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_IEnteredBackgroundEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.ApplicationModel.IEnteredBackgroundEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype StartupTask is Windows.ApplicationModel.IStartupTask;
   subtype AppDisplayInfo is Windows.ApplicationModel.IAppDisplayInfo;
   subtype AppInfo is Windows.ApplicationModel.IAppInfo;
   subtype PackageStatus is Windows.ApplicationModel.IPackageStatus;
   subtype PackageId is Windows.ApplicationModel.IPackageId;
   subtype Package_x is Windows.ApplicationModel.IPackage;
   subtype PackageContentGroup is Windows.ApplicationModel.IPackageContentGroup;
   subtype PackageStagingEventArgs is Windows.ApplicationModel.IPackageStagingEventArgs;
   subtype PackageInstallingEventArgs is Windows.ApplicationModel.IPackageInstallingEventArgs;
   subtype PackageUpdatingEventArgs is Windows.ApplicationModel.IPackageUpdatingEventArgs;
   subtype PackageUninstallingEventArgs is Windows.ApplicationModel.IPackageUninstallingEventArgs;
   subtype PackageStatusChangedEventArgs is Windows.ApplicationModel.IPackageStatusChangedEventArgs;
   subtype PackageContentGroupStagingEventArgs is Windows.ApplicationModel.IPackageContentGroupStagingEventArgs;
   subtype PackageCatalog is Windows.ApplicationModel.IPackageCatalog;
   subtype PackageCatalogAddOptionalPackageResult is Windows.ApplicationModel.IPackageCatalogAddOptionalPackageResult;
   subtype PackageCatalogRemoveOptionalPackagesResult is Windows.ApplicationModel.IPackageCatalogRemoveOptionalPackagesResult;
   subtype SuspendingEventArgs is Windows.ApplicationModel.ISuspendingEventArgs;
   subtype LeavingBackgroundEventArgs is Windows.ApplicationModel.ILeavingBackgroundEventArgs;
   subtype EnteredBackgroundEventArgs is Windows.ApplicationModel.IEnteredBackgroundEventArgs;
   subtype SuspendingDeferral is Windows.ApplicationModel.ISuspendingDeferral;
   subtype SuspendingOperation is Windows.ApplicationModel.ISuspendingOperation;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function LaunchFullTrustProcessForCurrentAppAsync
   return Windows.Foundation.IAsyncAction;
   
   function LaunchFullTrustProcessForCurrentAppWithParametersAsync
   (
      parameterGroupId : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function LaunchFullTrustProcessForAppAsync
   (
      fullTrustPackageRelativeAppId : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function LaunchFullTrustProcessForAppWithParametersAsync
   (
      fullTrustPackageRelativeAppId : Windows.String
      ; parameterGroupId : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function GetForCurrentPackageAsync
   return Windows.Address;
   
   function GetAsync
   (
      taskId : Windows.String
   )
   return Windows.ApplicationModel.IAsyncOperation_IStartupTask;
   
   function get_Current
   return Windows.ApplicationModel.IPackage;
   
   function get_RequiredGroupName
   return Windows.String;
   
   function OpenForCurrentPackage
   return Windows.ApplicationModel.IPackageCatalog;
   
   function OpenForCurrentUser
   return Windows.ApplicationModel.IPackageCatalog;
   
   function get_DesignModeEnabled
   return Windows.Boolean;
   
   function get_DesignMode2Enabled
   return Windows.Boolean;
   
   procedure ShowInstalledApplicationsUI
   ;
   
end;
