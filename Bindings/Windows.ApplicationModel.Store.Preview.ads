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
limited with Windows.System;
limited with Windows.Storage.Streams;
limited with Windows.Security.Authentication.Web.Core;
limited with Windows.UI.Xaml;
limited with Windows.Security.Credentials;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Store.Preview is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type StorePreviewProductPurchaseStatus is (
      Succeeded,
      AlreadyPurchased,
      NotFulfilled,
      NotPurchased
   );
   for StorePreviewProductPurchaseStatus use (
      Succeeded => 0,
      AlreadyPurchased => 1,
      NotFulfilled => 2,
      NotPurchased => 3
   );
   for StorePreviewProductPurchaseStatus'Size use 32;
   
   type StorePreviewProductPurchaseStatus_Ptr is access StorePreviewProductPurchaseStatus;
   
   type StoreSystemFeature is (
      ArchitectureX86,
      ArchitectureX64,
      ArchitectureArm,
      DirectX9,
      DirectX10,
      DirectX11,
      D3D12HardwareFL11,
      D3D12HardwareFL12,
      Memory300MB,
      Memory750MB,
      Memory1GB,
      Memory2GB,
      CameraFront,
      CameraRear,
      Gyroscope,
      Hover,
      Magnetometer,
      Nfc,
      Resolution720P,
      ResolutionWvga,
      ResolutionWvgaOr720P,
      ResolutionWxga,
      ResolutionWvgaOrWxga,
      ResolutionWxgaOr720P,
      Memory4GB,
      Memory6GB,
      Memory8GB,
      Memory12GB,
      Memory16GB,
      Memory20GB,
      VideoMemory2GB,
      VideoMemory4GB,
      VideoMemory6GB,
      VideoMemory1GB
   );
   for StoreSystemFeature use (
      ArchitectureX86 => 0,
      ArchitectureX64 => 1,
      ArchitectureArm => 2,
      DirectX9 => 3,
      DirectX10 => 4,
      DirectX11 => 5,
      D3D12HardwareFL11 => 6,
      D3D12HardwareFL12 => 7,
      Memory300MB => 8,
      Memory750MB => 9,
      Memory1GB => 10,
      Memory2GB => 11,
      CameraFront => 12,
      CameraRear => 13,
      Gyroscope => 14,
      Hover => 15,
      Magnetometer => 16,
      Nfc => 17,
      Resolution720P => 18,
      ResolutionWvga => 19,
      ResolutionWvgaOr720P => 20,
      ResolutionWxga => 21,
      ResolutionWvgaOrWxga => 22,
      ResolutionWxgaOr720P => 23,
      Memory4GB => 24,
      Memory6GB => 25,
      Memory8GB => 26,
      Memory12GB => 27,
      Memory16GB => 28,
      Memory20GB => 29,
      VideoMemory2GB => 30,
      VideoMemory4GB => 31,
      VideoMemory6GB => 32,
      VideoMemory1GB => 33
   );
   for StoreSystemFeature'Size use 32;
   
   type StoreSystemFeature_Ptr is access StoreSystemFeature;
   
   type StoreLogOptions is (
      None,
      TryElevate
   );
   for StoreLogOptions use (
      None => 0,
      TryElevate => 1
   );
   for StoreLogOptions'Size use 32;
   
   type StoreLogOptions_Ptr is access StoreLogOptions;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IStorePreviewPurchaseResults_Interface;
   type AsyncOperationCompletedHandler_IStorePreviewPurchaseResults is access all AsyncOperationCompletedHandler_IStorePreviewPurchaseResults_Interface'Class;
   type AsyncOperationCompletedHandler_IStorePreviewPurchaseResults_Ptr is access all AsyncOperationCompletedHandler_IStorePreviewPurchaseResults;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IStorePreviewProductInfo_Interface;
   type IStorePreviewProductInfo is access all IStorePreviewProductInfo_Interface'Class;
   type IStorePreviewProductInfo_Ptr is access all IStorePreviewProductInfo;
   type IStorePreviewSkuInfo_Interface;
   type IStorePreviewSkuInfo is access all IStorePreviewSkuInfo_Interface'Class;
   type IStorePreviewSkuInfo_Ptr is access all IStorePreviewSkuInfo;
   type IStorePreviewPurchaseResults_Interface;
   type IStorePreviewPurchaseResults is access all IStorePreviewPurchaseResults_Interface'Class;
   type IStorePreviewPurchaseResults_Ptr is access all IStorePreviewPurchaseResults;
   type IStorePreview_Interface;
   type IStorePreview is access all IStorePreview_Interface'Class;
   type IStorePreview_Ptr is access all IStorePreview;
   type IStoreHardwareManufacturerInfo_Interface;
   type IStoreHardwareManufacturerInfo is access all IStoreHardwareManufacturerInfo_Interface'Class;
   type IStoreHardwareManufacturerInfo_Ptr is access all IStoreHardwareManufacturerInfo;
   type IStoreConfigurationStatics_Interface;
   type IStoreConfigurationStatics is access all IStoreConfigurationStatics_Interface'Class;
   type IStoreConfigurationStatics_Ptr is access all IStoreConfigurationStatics;
   type IStoreConfigurationStatics2_Interface;
   type IStoreConfigurationStatics2 is access all IStoreConfigurationStatics2_Interface'Class;
   type IStoreConfigurationStatics2_Ptr is access all IStoreConfigurationStatics2;
   type IStoreConfigurationStatics3_Interface;
   type IStoreConfigurationStatics3 is access all IStoreConfigurationStatics3_Interface'Class;
   type IStoreConfigurationStatics3_Ptr is access all IStoreConfigurationStatics3;
   type IStoreConfigurationStatics4_Interface;
   type IStoreConfigurationStatics4 is access all IStoreConfigurationStatics4_Interface'Class;
   type IStoreConfigurationStatics4_Ptr is access all IStoreConfigurationStatics4;
   type IWebAuthenticationCoreManagerHelper_Interface;
   type IWebAuthenticationCoreManagerHelper is access all IWebAuthenticationCoreManagerHelper_Interface'Class;
   type IWebAuthenticationCoreManagerHelper_Ptr is access all IWebAuthenticationCoreManagerHelper;
   type IIterator_IStorePreviewSkuInfo_Interface;
   type IIterator_IStorePreviewSkuInfo is access all IIterator_IStorePreviewSkuInfo_Interface'Class;
   type IIterator_IStorePreviewSkuInfo_Ptr is access all IIterator_IStorePreviewSkuInfo;
   type IIterable_IStorePreviewSkuInfo_Interface;
   type IIterable_IStorePreviewSkuInfo is access all IIterable_IStorePreviewSkuInfo_Interface'Class;
   type IIterable_IStorePreviewSkuInfo_Ptr is access all IIterable_IStorePreviewSkuInfo;
   type IVectorView_IStorePreviewSkuInfo_Interface;
   type IVectorView_IStorePreviewSkuInfo is access all IVectorView_IStorePreviewSkuInfo_Interface'Class;
   type IVectorView_IStorePreviewSkuInfo_Ptr is access all IVectorView_IStorePreviewSkuInfo;
   type IAsyncOperation_IStorePreviewPurchaseResults_Interface;
   type IAsyncOperation_IStorePreviewPurchaseResults is access all IAsyncOperation_IStorePreviewPurchaseResults_Interface'Class;
   type IAsyncOperation_IStorePreviewPurchaseResults_Ptr is access all IAsyncOperation_IStorePreviewPurchaseResults;
   type IIterator_StoreSystemFeature_Interface;
   type IIterator_StoreSystemFeature is access all IIterator_StoreSystemFeature_Interface'Class;
   type IIterator_StoreSystemFeature_Ptr is access all IIterator_StoreSystemFeature;
   type IIterable_StoreSystemFeature_Interface;
   type IIterable_StoreSystemFeature is access all IIterable_StoreSystemFeature_Interface'Class;
   type IIterable_StoreSystemFeature_Ptr is access all IIterable_StoreSystemFeature;
   
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
   
   IID_IStorePreviewProductInfo : aliased constant Windows.IID := (423091123, 27649, 19613, (133, 205, 91, 171, 170, 194, 179, 81 ));
   
   type IStorePreviewProductInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProductId
   (
      This       : access IStorePreviewProductInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProductType
   (
      This       : access IStorePreviewProductInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IStorePreviewProductInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IStorePreviewProductInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SkuInfoList
   (
      This       : access IStorePreviewProductInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.IVectorView_IStorePreviewSkuInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStorePreviewSkuInfo : aliased constant Windows.IID := (2180871906, 2854, 18649, (152, 206, 39, 70, 28, 102, 157, 108 ));
   
   type IStorePreviewSkuInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProductId
   (
      This       : access IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SkuId
   (
      This       : access IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SkuType
   (
      This       : access IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomDeveloperData
   (
      This       : access IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrencyCode
   (
      This       : access IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FormattedListPrice
   (
      This       : access IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedData
   (
      This       : access IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStorePreviewPurchaseResults : aliased constant Windows.IID := (2967121617, 54981, 20051, (160, 67, 251, 160, 216, 230, 18, 49 ));
   
   type IStorePreviewPurchaseResults_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProductPurchaseStatus
   (
      This       : access IStorePreviewPurchaseResults_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.StorePreviewProductPurchaseStatus
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStorePreview : aliased constant Windows.IID := (2316661313, 33806, 18857, (188, 1, 93, 91, 1, 251, 200, 233 ));
   
   type IStorePreview_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestProductPurchaseByProductIdAndSkuIdAsync
   (
      This       : access IStorePreview_Interface
      ; productId : Windows.String
      ; skuId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.Preview.IAsyncOperation_IStorePreviewPurchaseResults -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadAddOnProductInfosAsync
   (
      This       : access IStorePreview_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStoreHardwareManufacturerInfo : aliased constant Windows.IID := (4069710856, 50772, 17324, (162, 31, 52, 128, 28, 157, 51, 136 ));
   
   type IStoreHardwareManufacturerInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HardwareManufacturerId
   (
      This       : access IStoreHardwareManufacturerInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StoreContentModifierId
   (
      This       : access IStoreHardwareManufacturerInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelName
   (
      This       : access IStoreHardwareManufacturerInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ManufacturerName
   (
      This       : access IStoreHardwareManufacturerInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStoreConfigurationStatics : aliased constant Windows.IID := (1922006976, 34344, 17132, (132, 162, 7, 120, 14, 180, 77, 139 ));
   
   type IStoreConfigurationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function SetSystemConfiguration
   (
      This       : access IStoreConfigurationStatics_Interface
      ; catalogHardwareManufacturerId : Windows.String
      ; catalogStoreContentModifierId : Windows.String
      ; systemConfigurationExpiration : Windows.Foundation.DateTime
      ; catalogHardwareDescriptor : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetMobileOperatorConfiguration
   (
      This       : access IStoreConfigurationStatics_Interface
      ; mobileOperatorId : Windows.String
      ; appDownloadLimitInMegabytes : Windows.UInt32
      ; updateDownloadLimitInMegabytes : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetStoreWebAccountId
   (
      This       : access IStoreConfigurationStatics_Interface
      ; webAccountId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function IsStoreWebAccountId
   (
      This       : access IStoreConfigurationStatics_Interface
      ; webAccountId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareManufacturerInfo
   (
      This       : access IStoreConfigurationStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.IStoreHardwareManufacturerInfo
   )
   return Windows.HRESULT is abstract;
   
   function FilterUnsupportedSystemFeaturesAsync
   (
      This       : access IStoreConfigurationStatics_Interface
      ; systemFeatures : Windows.ApplicationModel.Store.Preview.IIterable_StoreSystemFeature
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStoreConfigurationStatics2 : aliased constant Windows.IID := (1702643093, 51383, 20457, (159, 76, 77, 113, 2, 125, 52, 126 ));
   
   type IStoreConfigurationStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PurchasePromptingPolicy
   (
      This       : access IStoreConfigurationStatics2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_PurchasePromptingPolicy
   (
      This       : access IStoreConfigurationStatics2_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStoreConfigurationStatics3 : aliased constant Windows.IID := (1833301372, 61764, 19637, (157, 63, 78, 176, 94, 48, 182, 211 ));
   
   type IStoreConfigurationStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function HasStoreWebAccount
   (
      This       : access IStoreConfigurationStatics3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function HasStoreWebAccountForUser
   (
      This       : access IStoreConfigurationStatics3_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetStoreLogDataAsync
   (
      This       : access IStoreConfigurationStatics3_Interface
      ; options : Windows.ApplicationModel.Store.Preview.StoreLogOptions
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetStoreWebAccountIdForUser
   (
      This       : access IStoreConfigurationStatics3_Interface
      ; user : Windows.System.IUser
      ; webAccountId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function IsStoreWebAccountIdForUser
   (
      This       : access IStoreConfigurationStatics3_Interface
      ; user : Windows.System.IUser
      ; webAccountId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetPurchasePromptingPolicyForUser
   (
      This       : access IStoreConfigurationStatics3_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetPurchasePromptingPolicyForUser
   (
      This       : access IStoreConfigurationStatics3_Interface
      ; user : Windows.System.IUser
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStoreConfigurationStatics4 : aliased constant Windows.IID := (553604818, 20195, 19696, (155, 18, 85, 44, 3, 49, 15, 117 ));
   
   type IStoreConfigurationStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStoreWebAccountId
   (
      This       : access IStoreConfigurationStatics4_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetStoreWebAccountIdForUser
   (
      This       : access IStoreConfigurationStatics4_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetEnterpriseStoreWebAccountId
   (
      This       : access IStoreConfigurationStatics4_Interface
      ; webAccountId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetEnterpriseStoreWebAccountIdForUser
   (
      This       : access IStoreConfigurationStatics4_Interface
      ; user : Windows.System.IUser
      ; webAccountId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetEnterpriseStoreWebAccountId
   (
      This       : access IStoreConfigurationStatics4_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetEnterpriseStoreWebAccountIdForUser
   (
      This       : access IStoreConfigurationStatics4_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ShouldRestrictToEnterpriseStoreOnly
   (
      This       : access IStoreConfigurationStatics4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ShouldRestrictToEnterpriseStoreOnlyForUser
   (
      This       : access IStoreConfigurationStatics4_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IWebAuthenticationCoreManagerHelper : aliased constant Windows.IID := (111478053, 59157, 16675, (146, 118, 157, 111, 134, 91, 165, 95 ));
   
   type IWebAuthenticationCoreManagerHelper_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestTokenWithUIElementHostingAsync
   (
      This       : access IWebAuthenticationCoreManagerHelper_Interface
      ; request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; uiElement : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestTokenWithUIElementHostingAndWebAccountAsync
   (
      This       : access IWebAuthenticationCoreManagerHelper_Interface
      ; request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; uiElement : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IStorePreviewSkuInfo : aliased constant Windows.IID := (3069817889, 32596, 23846, (156, 55, 159, 157, 122, 200, 147, 235 ));
   
   type IIterator_IStorePreviewSkuInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.IStorePreviewSkuInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStorePreviewSkuInfo_Interface
      ; items : Windows.ApplicationModel.Store.Preview.IStorePreviewSkuInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IStorePreviewSkuInfo : aliased constant Windows.IID := (739083737, 3575, 24038, (150, 46, 188, 143, 20, 159, 175, 25 ));
   
   type IIterable_IStorePreviewSkuInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.IIterator_IStorePreviewSkuInfo
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IStorePreviewSkuInfo : aliased constant Windows.IID := (1195476771, 42609, 24540, (134, 71, 104, 247, 216, 195, 20, 22 ));
   
   type IVectorView_IStorePreviewSkuInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStorePreviewSkuInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Store.Preview.IStorePreviewSkuInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStorePreviewSkuInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStorePreviewSkuInfo_Interface
      ; value : Windows.ApplicationModel.Store.Preview.IStorePreviewSkuInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStorePreviewSkuInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Store.Preview.IStorePreviewSkuInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IStorePreviewPurchaseResults : aliased constant Windows.IID := (2594353024, 3531, 24257, (132, 53, 11, 104, 126, 211, 116, 165 ));
   
   type IAsyncOperation_IStorePreviewPurchaseResults_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStorePreviewPurchaseResults_Interface
      ; handler : Windows.ApplicationModel.Store.Preview.AsyncOperationCompletedHandler_IStorePreviewPurchaseResults
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStorePreviewPurchaseResults_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.AsyncOperationCompletedHandler_IStorePreviewPurchaseResults
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStorePreviewPurchaseResults_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.IStorePreviewPurchaseResults
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_StoreSystemFeature : aliased constant Windows.IID := (3494206253, 55466, 21886, (137, 163, 99, 195, 62, 140, 238, 153 ));
   
   type IIterator_StoreSystemFeature_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_StoreSystemFeature_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.StoreSystemFeature
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_StoreSystemFeature_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_StoreSystemFeature_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_StoreSystemFeature_Interface
      ; items : Windows.ApplicationModel.Store.Preview.StoreSystemFeature_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_StoreSystemFeature : aliased constant Windows.IID := (2561169274, 45352, 21504, (141, 61, 88, 101, 78, 170, 249, 87 ));
   
   type IIterable_StoreSystemFeature_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_StoreSystemFeature_Interface
      ; RetVal : access Windows.ApplicationModel.Store.Preview.IIterator_StoreSystemFeature
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IStorePreviewPurchaseResults : aliased constant Windows.IID := (2984908519, 33384, 20991, (129, 41, 220, 239, 212, 147, 243, 95 ));
   
   type AsyncOperationCompletedHandler_IStorePreviewPurchaseResults_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Store.Preview.IAsyncOperation_IStorePreviewPurchaseResults ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IStorePreviewPurchaseResults'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStorePreviewPurchaseResults_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.Preview.IAsyncOperation_IStorePreviewPurchaseResults
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype StorePreviewSkuInfo is Windows.ApplicationModel.Store.Preview.IStorePreviewSkuInfo;
   subtype StorePreviewPurchaseResults is Windows.ApplicationModel.Store.Preview.IStorePreviewPurchaseResults;
   subtype StorePreviewProductInfo is Windows.ApplicationModel.Store.Preview.IStorePreviewProductInfo;
   subtype StoreHardwareManufacturerInfo is Windows.ApplicationModel.Store.Preview.IStoreHardwareManufacturerInfo;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function RequestProductPurchaseByProductIdAndSkuIdAsync
   (
      productId : Windows.String
      ; skuId : Windows.String
   )
   return Windows.ApplicationModel.Store.Preview.IAsyncOperation_IStorePreviewPurchaseResults;
   
   function LoadAddOnProductInfosAsync
   return Windows.Address;
   
   function HasStoreWebAccount
   return Windows.Boolean;
   
   function HasStoreWebAccountForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Boolean;
   
   function GetStoreLogDataAsync
   (
      options : Windows.ApplicationModel.Store.Preview.StoreLogOptions
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference;
   
   procedure SetStoreWebAccountIdForUser
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
   )
   ;
   
   function IsStoreWebAccountIdForUser
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
   )
   return Windows.Boolean;
   
   function GetPurchasePromptingPolicyForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Foundation.IReference_UInt32;
   
   procedure SetPurchasePromptingPolicyForUser
   (
      user : Windows.System.IUser
      ; value : Windows.Foundation.IReference_UInt32
   )
   ;
   
   function GetStoreWebAccountId
   return Windows.String;
   
   function GetStoreWebAccountIdForUser
   (
      user : Windows.System.IUser
   )
   return Windows.String;
   
   procedure SetEnterpriseStoreWebAccountId
   (
      webAccountId : Windows.String
   )
   ;
   
   procedure SetEnterpriseStoreWebAccountIdForUser
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
   )
   ;
   
   function GetEnterpriseStoreWebAccountId
   return Windows.String;
   
   function GetEnterpriseStoreWebAccountIdForUser
   (
      user : Windows.System.IUser
   )
   return Windows.String;
   
   function ShouldRestrictToEnterpriseStoreOnly
   return Windows.Boolean;
   
   function ShouldRestrictToEnterpriseStoreOnlyForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Boolean;
   
   procedure SetSystemConfiguration
   (
      catalogHardwareManufacturerId : Windows.String
      ; catalogStoreContentModifierId : Windows.String
      ; systemConfigurationExpiration : Windows.Foundation.DateTime
      ; catalogHardwareDescriptor : Windows.String
   )
   ;
   
   procedure SetMobileOperatorConfiguration
   (
      mobileOperatorId : Windows.String
      ; appDownloadLimitInMegabytes : Windows.UInt32
      ; updateDownloadLimitInMegabytes : Windows.UInt32
   )
   ;
   
   procedure SetStoreWebAccountId
   (
      webAccountId : Windows.String
   )
   ;
   
   function IsStoreWebAccountId
   (
      webAccountId : Windows.String
   )
   return Windows.Boolean;
   
   function get_HardwareManufacturerInfo
   return Windows.ApplicationModel.Store.Preview.IStoreHardwareManufacturerInfo;
   
   function FilterUnsupportedSystemFeaturesAsync
   (
      systemFeatures : Windows.ApplicationModel.Store.Preview.IIterable_StoreSystemFeature
   )
   return Windows.Address;
   
   function get_PurchasePromptingPolicy
   return Windows.Foundation.IReference_UInt32;
   
   procedure put_PurchasePromptingPolicy
   (
      value : Windows.Foundation.IReference_UInt32
   )
   ;
   
   function RequestTokenWithUIElementHostingAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; uiElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;
   
   function RequestTokenWithUIElementHostingAndWebAccountAsync
   (
      request : Windows.Security.Authentication.Web.Core.IWebTokenRequest
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; uiElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.Security.Authentication.Web.Core.IAsyncOperation_IWebTokenRequestResult;

end;
