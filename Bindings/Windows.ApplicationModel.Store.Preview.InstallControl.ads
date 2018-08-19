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
limited with Windows.System;
with Windows.Foundation.Collections;
limited with Windows.Management.Deployment;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Store.Preview.InstallControl is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GetEntitlementStatus is (
      Succeeded,
      NoStoreAccount,
      NetworkError,
      ServerError
   );
   for GetEntitlementStatus use (
      Succeeded => 0,
      NoStoreAccount => 1,
      NetworkError => 2,
      ServerError => 3
   );
   for GetEntitlementStatus'Size use 32;
   
   type GetEntitlementStatus_Ptr is access GetEntitlementStatus;
   
   type AppInstallState is (
      Pending,
      Starting,
      AcquiringLicense,
      Downloading,
      RestoringData,
      Installing,
      Completed,
      Canceled,
      Paused,
      Error,
      PausedLowBattery,
      PausedWiFiRecommended,
      PausedWiFiRequired,
      ReadyToDownload
   );
   for AppInstallState use (
      Pending => 0,
      Starting => 1,
      AcquiringLicense => 2,
      Downloading => 3,
      RestoringData => 4,
      Installing => 5,
      Completed => 6,
      Canceled => 7,
      Paused => 8,
      Error => 9,
      PausedLowBattery => 10,
      PausedWiFiRecommended => 11,
      PausedWiFiRequired => 12,
      ReadyToDownload => 13
   );
   for AppInstallState'Size use 32;
   
   type AppInstallState_Ptr is access AppInstallState;
   
   type AppInstallType is (
      Install,
      Update,
      Repair
   );
   for AppInstallType use (
      Install => 0,
      Update => 1,
      Repair => 2
   );
   for AppInstallType'Size use 32;
   
   type AppInstallType_Ptr is access AppInstallType;
   
   type AutoUpdateSetting is (
      Disabled,
      Enabled,
      DisabledByPolicy,
      EnabledByPolicy
   );
   for AutoUpdateSetting use (
      Disabled => 0,
      Enabled => 1,
      DisabledByPolicy => 2,
      EnabledByPolicy => 3
   );
   for AutoUpdateSetting'Size use 32;
   
   type AutoUpdateSetting_Ptr is access AutoUpdateSetting;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IAppInstallItem_add_Completed_Interface;
   type TypedEventHandler_IAppInstallItem_add_Completed is access all TypedEventHandler_IAppInstallItem_add_Completed_Interface'Class;
   type TypedEventHandler_IAppInstallItem_add_Completed_Ptr is access all TypedEventHandler_IAppInstallItem_add_Completed;
   type TypedEventHandler_IAppInstallItem_add_StatusChanged_Interface;
   type TypedEventHandler_IAppInstallItem_add_StatusChanged is access all TypedEventHandler_IAppInstallItem_add_StatusChanged_Interface'Class;
   type TypedEventHandler_IAppInstallItem_add_StatusChanged_Ptr is access all TypedEventHandler_IAppInstallItem_add_StatusChanged;
   type TypedEventHandler_IAppInstallManager_add_ItemCompleted_Interface;
   type TypedEventHandler_IAppInstallManager_add_ItemCompleted is access all TypedEventHandler_IAppInstallManager_add_ItemCompleted_Interface'Class;
   type TypedEventHandler_IAppInstallManager_add_ItemCompleted_Ptr is access all TypedEventHandler_IAppInstallManager_add_ItemCompleted;
   type TypedEventHandler_IAppInstallManager_add_ItemStatusChanged_Interface;
   type TypedEventHandler_IAppInstallManager_add_ItemStatusChanged is access all TypedEventHandler_IAppInstallManager_add_ItemStatusChanged_Interface'Class;
   type TypedEventHandler_IAppInstallManager_add_ItemStatusChanged_Ptr is access all TypedEventHandler_IAppInstallManager_add_ItemStatusChanged;
   type AsyncOperationCompletedHandler_IAppInstallItem_Interface;
   type AsyncOperationCompletedHandler_IAppInstallItem is access all AsyncOperationCompletedHandler_IAppInstallItem_Interface'Class;
   type AsyncOperationCompletedHandler_IAppInstallItem_Ptr is access all AsyncOperationCompletedHandler_IAppInstallItem;
   type AsyncOperationCompletedHandler_IGetEntitlementResult_Interface;
   type AsyncOperationCompletedHandler_IGetEntitlementResult is access all AsyncOperationCompletedHandler_IGetEntitlementResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGetEntitlementResult_Ptr is access all AsyncOperationCompletedHandler_IGetEntitlementResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAppInstallStatus_Interface;
   type IAppInstallStatus is access all IAppInstallStatus_Interface'Class;
   type IAppInstallStatus_Ptr is access all IAppInstallStatus;
   type IAppInstallStatus2_Interface;
   type IAppInstallStatus2 is access all IAppInstallStatus2_Interface'Class;
   type IAppInstallStatus2_Ptr is access all IAppInstallStatus2;
   type IAppInstallStatus3_Interface;
   type IAppInstallStatus3 is access all IAppInstallStatus3_Interface'Class;
   type IAppInstallStatus3_Ptr is access all IAppInstallStatus3;
   type IAppInstallItem_Interface;
   type IAppInstallItem is access all IAppInstallItem_Interface'Class;
   type IAppInstallItem_Ptr is access all IAppInstallItem;
   type IAppInstallItem2_Interface;
   type IAppInstallItem2 is access all IAppInstallItem2_Interface'Class;
   type IAppInstallItem2_Ptr is access all IAppInstallItem2;
   type IAppInstallItem3_Interface;
   type IAppInstallItem3 is access all IAppInstallItem3_Interface'Class;
   type IAppInstallItem3_Ptr is access all IAppInstallItem3;
   type IAppInstallItem4_Interface;
   type IAppInstallItem4 is access all IAppInstallItem4_Interface'Class;
   type IAppInstallItem4_Ptr is access all IAppInstallItem4;
   type IGetEntitlementResult_Interface;
   type IGetEntitlementResult is access all IGetEntitlementResult_Interface'Class;
   type IGetEntitlementResult_Ptr is access all IGetEntitlementResult;
   type IAppInstallManagerItemEventArgs_Interface;
   type IAppInstallManagerItemEventArgs is access all IAppInstallManagerItemEventArgs_Interface'Class;
   type IAppInstallManagerItemEventArgs_Ptr is access all IAppInstallManagerItemEventArgs;
   type IAppUpdateOptions_Interface;
   type IAppUpdateOptions is access all IAppUpdateOptions_Interface'Class;
   type IAppUpdateOptions_Ptr is access all IAppUpdateOptions;
   type IAppInstallOptions_Interface;
   type IAppInstallOptions is access all IAppInstallOptions_Interface'Class;
   type IAppInstallOptions_Ptr is access all IAppInstallOptions;
   type IAppInstallManager_Interface;
   type IAppInstallManager is access all IAppInstallManager_Interface'Class;
   type IAppInstallManager_Ptr is access all IAppInstallManager;
   type IAppInstallManager2_Interface;
   type IAppInstallManager2 is access all IAppInstallManager2_Interface'Class;
   type IAppInstallManager2_Ptr is access all IAppInstallManager2;
   type IAppInstallManager3_Interface;
   type IAppInstallManager3 is access all IAppInstallManager3_Interface'Class;
   type IAppInstallManager3_Ptr is access all IAppInstallManager3;
   type IAppInstallManager4_Interface;
   type IAppInstallManager4 is access all IAppInstallManager4_Interface'Class;
   type IAppInstallManager4_Ptr is access all IAppInstallManager4;
   type IAppInstallManager5_Interface;
   type IAppInstallManager5 is access all IAppInstallManager5_Interface'Class;
   type IAppInstallManager5_Ptr is access all IAppInstallManager5;
   type IAppInstallManager6_Interface;
   type IAppInstallManager6 is access all IAppInstallManager6_Interface'Class;
   type IAppInstallManager6_Ptr is access all IAppInstallManager6;
   type IIterator_IAppInstallItem_Interface;
   type IIterator_IAppInstallItem is access all IIterator_IAppInstallItem_Interface'Class;
   type IIterator_IAppInstallItem_Ptr is access all IIterator_IAppInstallItem;
   type IIterable_IAppInstallItem_Interface;
   type IIterable_IAppInstallItem is access all IIterable_IAppInstallItem_Interface'Class;
   type IIterable_IAppInstallItem_Ptr is access all IIterable_IAppInstallItem;
   type IVectorView_IAppInstallItem_Interface;
   type IVectorView_IAppInstallItem is access all IVectorView_IAppInstallItem_Interface'Class;
   type IVectorView_IAppInstallItem_Ptr is access all IVectorView_IAppInstallItem;
   type IAsyncOperation_IAppInstallItem_Interface;
   type IAsyncOperation_IAppInstallItem is access all IAsyncOperation_IAppInstallItem_Interface'Class;
   type IAsyncOperation_IAppInstallItem_Ptr is access all IAsyncOperation_IAppInstallItem;
   type IAsyncOperation_IGetEntitlementResult_Interface;
   type IAsyncOperation_IGetEntitlementResult is access all IAsyncOperation_IGetEntitlementResult_Interface'Class;
   type IAsyncOperation_IGetEntitlementResult_Ptr is access all IAsyncOperation_IGetEntitlementResult;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallStatus : aliased constant Windows.IID := (2473446650, 9296, 16678, (136, 177, 97, 39, 166, 68, 221, 92 ));
   
   type IAppInstallStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InstallState
   (
      This       : access IAppInstallStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.AppInstallState
   )
   return Windows.HRESULT is abstract;
   
   function get_DownloadSizeInBytes
   (
      This       : access IAppInstallStatus_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_BytesDownloaded
   (
      This       : access IAppInstallStatus_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_PercentComplete
   (
      This       : access IAppInstallStatus_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IAppInstallStatus_Interface
      ; RetVal : access Windows.HResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallStatus2 : aliased constant Windows.IID := (2531754378, 24210, 19113, (142, 220, 88, 254, 212, 184, 126, 0 ));
   
   type IAppInstallStatus2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IAppInstallStatus2_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadyForLaunch
   (
      This       : access IAppInstallStatus2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallStatus3 : aliased constant Windows.IID := (3414690902, 33659, 19276, (158, 187, 109, 68, 160, 169, 99, 7 ));
   
   type IAppInstallStatus3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsStaged
   (
      This       : access IAppInstallStatus3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallItem : aliased constant Windows.IID := (1238622123, 5770, 19647, (169, 58, 158, 68, 140, 130, 115, 125 ));
   
   type IAppInstallItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProductId
   (
      This       : access IAppInstallItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PackageFamilyName
   (
      This       : access IAppInstallItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InstallType
   (
      This       : access IAppInstallItem_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.AppInstallType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsUserInitiated
   (
      This       : access IAppInstallItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentStatus
   (
      This       : access IAppInstallItem_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallStatus
   )
   return Windows.HRESULT is abstract;
   
   function Cancel
   (
      This       : access IAppInstallItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Pause
   (
      This       : access IAppInstallItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Restart
   (
      This       : access IAppInstallItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_Completed
   (
      This       : access IAppInstallItem_Interface
      ; handler : TypedEventHandler_IAppInstallItem_add_Completed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Completed
   (
      This       : access IAppInstallItem_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusChanged
   (
      This       : access IAppInstallItem_Interface
      ; handler : TypedEventHandler_IAppInstallItem_add_StatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusChanged
   (
      This       : access IAppInstallItem_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallItem2 : aliased constant Windows.IID := (3549899512, 16576, 20439, (170, 108, 10, 161, 60, 166, 24, 140 ));
   
   type IAppInstallItem2_Interface is interface and Windows.IInspectable_Interface;
   
   function CancelWithTelemetry
   (
      This       : access IAppInstallItem2_Interface
      ; correlationVector : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function PauseWithTelemetry
   (
      This       : access IAppInstallItem2_Interface
      ; correlationVector : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RestartWithTelemetry
   (
      This       : access IAppInstallItem2_Interface
      ; correlationVector : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallItem3 : aliased constant Windows.IID := (1866320280, 56647, 17212, (146, 52, 86, 1, 114, 214, 122, 69 ));
   
   type IAppInstallItem3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Children
   (
      This       : access IAppInstallItem3_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IVectorView_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemOperationsMightAffectOtherItems
   (
      This       : access IAppInstallItem3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallItem4 : aliased constant Windows.IID := (3268529682, 29183, 20424, (181, 64, 69, 61, 75, 55, 225, 209 ));
   
   type IAppInstallItem4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LaunchAfterInstall
   (
      This       : access IAppInstallItem4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_LaunchAfterInstall
   (
      This       : access IAppInstallItem4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGetEntitlementResult : aliased constant Windows.IID := (1962705983, 6814, 17929, (142, 77, 129, 144, 134, 208, 138, 61 ));
   
   type IGetEntitlementResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGetEntitlementResult_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.GetEntitlementStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallManagerItemEventArgs : aliased constant Windows.IID := (3159381827, 18036, 19921, (149, 126, 194, 86, 130, 8, 106, 20 ));
   
   type IAppInstallManagerItemEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Item
   (
      This       : access IAppInstallManagerItemEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppUpdateOptions : aliased constant Windows.IID := (653307951, 49907, 19178, (175, 140, 99, 8, 221, 157, 184, 95 ));
   
   type IAppUpdateOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CatalogId
   (
      This       : access IAppUpdateOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CatalogId
   (
      This       : access IAppUpdateOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowForcedAppRestart
   (
      This       : access IAppUpdateOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowForcedAppRestart
   (
      This       : access IAppUpdateOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallOptions : aliased constant Windows.IID := (3380642560, 7352, 20150, (140, 159, 106, 48, 198, 74, 91, 81 ));
   
   type IAppInstallOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CatalogId
   (
      This       : access IAppInstallOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CatalogId
   (
      This       : access IAppInstallOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ForceUseOfNonRemovableStorage
   (
      This       : access IAppInstallOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ForceUseOfNonRemovableStorage
   (
      This       : access IAppInstallOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowForcedAppRestart
   (
      This       : access IAppInstallOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowForcedAppRestart
   (
      This       : access IAppInstallOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Repair
   (
      This       : access IAppInstallOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Repair
   (
      This       : access IAppInstallOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetVolume
   (
      This       : access IAppInstallOptions_Interface
      ; RetVal : access Windows.Management.Deployment.IPackageVolume
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetVolume
   (
      This       : access IAppInstallOptions_Interface
      ; value : Windows.Management.Deployment.IPackageVolume
   )
   return Windows.HRESULT is abstract;
   
   function get_LaunchAfterInstall
   (
      This       : access IAppInstallOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_LaunchAfterInstall
   (
      This       : access IAppInstallOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallManager : aliased constant Windows.IID := (2471747952, 33857, 19269, (189, 114, 124, 47, 169, 37, 190, 238 ));
   
   type IAppInstallManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppInstallItems
   (
      This       : access IAppInstallManager_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IVectorView_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Cancel
   (
      This       : access IAppInstallManager_Interface
      ; productId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Pause
   (
      This       : access IAppInstallManager_Interface
      ; productId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Restart
   (
      This       : access IAppInstallManager_Interface
      ; productId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_ItemCompleted
   (
      This       : access IAppInstallManager_Interface
      ; handler : TypedEventHandler_IAppInstallManager_add_ItemCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ItemCompleted
   (
      This       : access IAppInstallManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ItemStatusChanged
   (
      This       : access IAppInstallManager_Interface
      ; handler : TypedEventHandler_IAppInstallManager_add_ItemStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ItemStatusChanged
   (
      This       : access IAppInstallManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoUpdateSetting
   (
      This       : access IAppInstallManager_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.AutoUpdateSetting
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoUpdateSetting
   (
      This       : access IAppInstallManager_Interface
      ; value : Windows.ApplicationModel.Store.Preview.InstallControl.AutoUpdateSetting
   )
   return Windows.HRESULT is abstract;
   
   function get_AcquisitionIdentity
   (
      This       : access IAppInstallManager_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AcquisitionIdentity
   (
      This       : access IAppInstallManager_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetIsApplicableAsync
   (
      This       : access IAppInstallManager_Interface
      ; productId : Windows.String
      ; skuId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StartAppInstallAsync
   (
      This       : access IAppInstallManager_Interface
      ; productId : Windows.String
      ; skuId : Windows.String
      ; repair : Windows.Boolean
      ; forceUseOfNonRemovableStorage : Windows.Boolean
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateAppByPackageFamilyNameAsync
   (
      This       : access IAppInstallManager_Interface
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SearchForUpdatesAsync
   (
      This       : access IAppInstallManager_Interface
      ; productId : Windows.String
      ; skuId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SearchForAllUpdatesAsync
   (
      This       : access IAppInstallManager_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsStoreBlockedByPolicyAsync
   (
      This       : access IAppInstallManager_Interface
      ; storeClientName : Windows.String
      ; storeClientPublisher : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIsAppAllowedToInstallAsync
   (
      This       : access IAppInstallManager_Interface
      ; productId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallManager2 : aliased constant Windows.IID := (378763345, 60727, 18445, (131, 20, 82, 226, 124, 3, 240, 74 ));
   
   type IAppInstallManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function StartAppInstallWithTelemetryAsync
   (
      This       : access IAppInstallManager2_Interface
      ; productId : Windows.String
      ; skuId : Windows.String
      ; repair : Windows.Boolean
      ; forceUseOfNonRemovableStorage : Windows.Boolean
      ; catalogId : Windows.String
      ; bundleId : Windows.String
      ; correlationVector : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateAppByPackageFamilyNameWithTelemetryAsync
   (
      This       : access IAppInstallManager2_Interface
      ; packageFamilyName : Windows.String
      ; correlationVector : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SearchForUpdatesWithTelemetryAsync
   (
      This       : access IAppInstallManager2_Interface
      ; productId : Windows.String
      ; skuId : Windows.String
      ; catalogId : Windows.String
      ; correlationVector : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SearchForAllUpdatesWithTelemetryAsync
   (
      This       : access IAppInstallManager2_Interface
      ; correlationVector : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIsAppAllowedToInstallWithTelemetryAsync
   (
      This       : access IAppInstallManager2_Interface
      ; productId : Windows.String
      ; skuId : Windows.String
      ; catalogId : Windows.String
      ; correlationVector : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CancelWithTelemetry
   (
      This       : access IAppInstallManager2_Interface
      ; productId : Windows.String
      ; correlationVector : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function PauseWithTelemetry
   (
      This       : access IAppInstallManager2_Interface
      ; productId : Windows.String
      ; correlationVector : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RestartWithTelemetry
   (
      This       : access IAppInstallManager2_Interface
      ; productId : Windows.String
      ; correlationVector : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallManager3 : aliased constant Windows.IID := (2511489815, 59754, 19726, (132, 225, 200, 203, 65, 122, 1, 120 ));
   
   type IAppInstallManager3_Interface is interface and Windows.IInspectable_Interface;
   
   function StartProductInstallAsync
   (
      This       : access IAppInstallManager3_Interface
      ; productId : Windows.String
      ; catalogId : Windows.String
      ; flightId : Windows.String
      ; clientId : Windows.String
      ; repair : Windows.Boolean
      ; forceUseOfNonRemovableStorage : Windows.Boolean
      ; correlationVector : Windows.String
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StartProductInstallForUserAsync
   (
      This       : access IAppInstallManager3_Interface
      ; user : Windows.System.IUser
      ; productId : Windows.String
      ; catalogId : Windows.String
      ; flightId : Windows.String
      ; clientId : Windows.String
      ; repair : Windows.Boolean
      ; forceUseOfNonRemovableStorage : Windows.Boolean
      ; correlationVector : Windows.String
      ; targetVolume : Windows.Management.Deployment.IPackageVolume
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateAppByPackageFamilyNameForUserAsync
   (
      This       : access IAppInstallManager3_Interface
      ; user : Windows.System.IUser
      ; packageFamilyName : Windows.String
      ; correlationVector : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SearchForUpdatesForUserAsync
   (
      This       : access IAppInstallManager3_Interface
      ; user : Windows.System.IUser
      ; productId : Windows.String
      ; skuId : Windows.String
      ; catalogId : Windows.String
      ; correlationVector : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SearchForAllUpdatesForUserAsync
   (
      This       : access IAppInstallManager3_Interface
      ; user : Windows.System.IUser
      ; correlationVector : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIsAppAllowedToInstallForUserAsync
   (
      This       : access IAppInstallManager3_Interface
      ; user : Windows.System.IUser
      ; productId : Windows.String
      ; skuId : Windows.String
      ; catalogId : Windows.String
      ; correlationVector : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIsApplicableForUserAsync
   (
      This       : access IAppInstallManager3_Interface
      ; user : Windows.System.IUser
      ; productId : Windows.String
      ; skuId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function MoveToFrontOfDownloadQueue
   (
      This       : access IAppInstallManager3_Interface
      ; productId : Windows.String
      ; correlationVector : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallManager4 : aliased constant Windows.IID := (638200342, 23198, 20157, (185, 68, 242, 186, 117, 195, 17, 89 ));
   
   type IAppInstallManager4_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFreeUserEntitlementAsync
   (
      This       : access IAppInstallManager4_Interface
      ; storeId : Windows.String
      ; campaignId : Windows.String
      ; correlationVector : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IGetEntitlementResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFreeUserEntitlementForUserAsync
   (
      This       : access IAppInstallManager4_Interface
      ; user : Windows.System.IUser
      ; storeId : Windows.String
      ; campaignId : Windows.String
      ; correlationVector : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IGetEntitlementResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFreeDeviceEntitlementAsync
   (
      This       : access IAppInstallManager4_Interface
      ; storeId : Windows.String
      ; campaignId : Windows.String
      ; correlationVector : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IGetEntitlementResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallManager5 : aliased constant Windows.IID := (1020771916, 7145, 20351, (182, 117, 170, 29, 100, 165, 41, 178 ));
   
   type IAppInstallManager5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppInstallItemsWithGroupSupport
   (
      This       : access IAppInstallManager5_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IVectorView_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppInstallManager6 : aliased constant Windows.IID := (3387413512, 62074, 17521, (178, 244, 231, 110, 252, 190, 188, 202 ));
   
   type IAppInstallManager6_Interface is interface and Windows.IInspectable_Interface;
   
   function SearchForAllUpdatesWithUpdateOptionsAsync
   (
      This       : access IAppInstallManager6_Interface
      ; correlationVector : Windows.String
      ; clientId : Windows.String
      ; updateOptions : Windows.ApplicationModel.Store.Preview.InstallControl.IAppUpdateOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SearchForAllUpdatesWithUpdateOptionsForUserAsync
   (
      This       : access IAppInstallManager6_Interface
      ; user : Windows.System.IUser
      ; correlationVector : Windows.String
      ; clientId : Windows.String
      ; updateOptions : Windows.ApplicationModel.Store.Preview.InstallControl.IAppUpdateOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SearchForUpdatesWithUpdateOptionsAsync
   (
      This       : access IAppInstallManager6_Interface
      ; productId : Windows.String
      ; skuId : Windows.String
      ; correlationVector : Windows.String
      ; clientId : Windows.String
      ; updateOptions : Windows.ApplicationModel.Store.Preview.InstallControl.IAppUpdateOptions
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SearchForUpdatesWithUpdateOptionsForUserAsync
   (
      This       : access IAppInstallManager6_Interface
      ; user : Windows.System.IUser
      ; productId : Windows.String
      ; skuId : Windows.String
      ; correlationVector : Windows.String
      ; clientId : Windows.String
      ; updateOptions : Windows.ApplicationModel.Store.Preview.InstallControl.IAppUpdateOptions
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StartProductInstallWithOptionsAsync
   (
      This       : access IAppInstallManager6_Interface
      ; productId : Windows.String
      ; flightId : Windows.String
      ; clientId : Windows.String
      ; correlationVector : Windows.String
      ; installOptions : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StartProductInstallWithOptionsForUserAsync
   (
      This       : access IAppInstallManager6_Interface
      ; user : Windows.System.IUser
      ; productId : Windows.String
      ; flightId : Windows.String
      ; clientId : Windows.String
      ; correlationVector : Windows.String
      ; installOptions : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIsPackageIdentityAllowedToInstallAsync
   (
      This       : access IAppInstallManager6_Interface
      ; correlationVector : Windows.String
      ; packageIdentityName : Windows.String
      ; publisherCertificateName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIsPackageIdentityAllowedToInstallForUserAsync
   (
      This       : access IAppInstallManager6_Interface
      ; user : Windows.System.IUser
      ; correlationVector : Windows.String
      ; packageIdentityName : Windows.String
      ; publisherCertificateName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAppInstallItem : aliased constant Windows.IID := (3433867291, 27895, 22256, (183, 255, 138, 197, 25, 30, 121, 191 ));
   
   type IIterator_IAppInstallItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAppInstallItem_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAppInstallItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAppInstallItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAppInstallItem_Interface
      ; items : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAppInstallItem : aliased constant Windows.IID := (2481049032, 20543, 21937, (145, 91, 192, 220, 120, 136, 206, 49 ));
   
   type IIterable_IAppInstallItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAppInstallItem_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IIterator_IAppInstallItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAppInstallItem : aliased constant Windows.IID := (1222113396, 43068, 21979, (178, 230, 148, 11, 233, 86, 152, 105 ));
   
   type IVectorView_IAppInstallItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAppInstallItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAppInstallItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAppInstallItem_Interface
      ; value : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAppInstallItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAppInstallItem : aliased constant Windows.IID := (2209684671, 13792, 22957, (171, 62, 255, 179, 240, 55, 4, 249 ));
   
   type IAsyncOperation_IAppInstallItem_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAppInstallItem_Interface
      ; handler : Windows.ApplicationModel.Store.Preview.InstallControl.AsyncOperationCompletedHandler_IAppInstallItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAppInstallItem_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.AsyncOperationCompletedHandler_IAppInstallItem
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAppInstallItem_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGetEntitlementResult : aliased constant Windows.IID := (1277482990, 19346, 23786, (164, 244, 122, 93, 110, 145, 144, 98 ));
   
   type IAsyncOperation_IGetEntitlementResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGetEntitlementResult_Interface
      ; handler : Windows.ApplicationModel.Store.Preview.InstallControl.AsyncOperationCompletedHandler_IGetEntitlementResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGetEntitlementResult_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.AsyncOperationCompletedHandler_IGetEntitlementResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGetEntitlementResult_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.InstallControl.IGetEntitlementResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppInstallItem_add_Completed : aliased constant Windows.IID := (2457011303, 20510, 23301, (136, 38, 146, 111, 134, 146, 91, 3 ));
   
   type TypedEventHandler_IAppInstallItem_add_Completed_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppInstallItem_add_Completed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppInstallItem_add_Completed_Interface
      ; sender : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppInstallItem_add_StatusChanged : aliased constant Windows.IID := (2457011303, 20510, 23301, (136, 38, 146, 111, 134, 146, 91, 3 ));
   
   type TypedEventHandler_IAppInstallItem_add_StatusChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppInstallItem_add_StatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppInstallItem_add_StatusChanged_Interface
      ; sender : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppInstallManager_add_ItemCompleted : aliased constant Windows.IID := (2884749367, 56013, 21574, (160, 50, 62, 233, 2, 136, 2, 68 ));
   
   type TypedEventHandler_IAppInstallManager_add_ItemCompleted_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManager ; args : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManagerItemEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppInstallManager_add_ItemCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppInstallManager_add_ItemCompleted_Interface
      ; sender : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManager
      ; args : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManagerItemEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppInstallManager_add_ItemStatusChanged : aliased constant Windows.IID := (2884749367, 56013, 21574, (160, 50, 62, 233, 2, 136, 2, 68 ));
   
   type TypedEventHandler_IAppInstallManager_add_ItemStatusChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManager ; args : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManagerItemEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppInstallManager_add_ItemStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppInstallManager_add_ItemStatusChanged_Interface
      ; sender : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManager
      ; args : Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManagerItemEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAppInstallItem : aliased constant Windows.IID := (2824609003, 3724, 21538, (178, 239, 173, 72, 237, 51, 135, 6 ));
   
   type AsyncOperationCompletedHandler_IAppInstallItem_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAppInstallItem'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAppInstallItem_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IAppInstallItem
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGetEntitlementResult : aliased constant Windows.IID := (1649778320, 7178, 22280, (146, 48, 3, 166, 88, 101, 45, 179 ));
   
   type AsyncOperationCompletedHandler_IGetEntitlementResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IGetEntitlementResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGetEntitlementResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGetEntitlementResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.Preview.InstallControl.IAsyncOperation_IGetEntitlementResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AppInstallStatus is Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallStatus;
   subtype AppInstallItem is Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallItem;
   subtype GetEntitlementResult is Windows.ApplicationModel.Store.Preview.InstallControl.IGetEntitlementResult;
   subtype AppInstallManagerItemEventArgs is Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManagerItemEventArgs;
   subtype AppUpdateOptions is Windows.ApplicationModel.Store.Preview.InstallControl.IAppUpdateOptions;
   function Create return Windows.ApplicationModel.Store.Preview.InstallControl.IAppUpdateOptions;
   
   subtype AppInstallOptions is Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallOptions;
   function Create return Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallOptions;
   
   subtype AppInstallManager is Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManager;
   function Create return Windows.ApplicationModel.Store.Preview.InstallControl.IAppInstallManager;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
