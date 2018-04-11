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
with Windows; use Windows;
with Windows.Foundation.Collections;
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Store is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ProductPurchaseStatus is (
      Succeeded,
      AlreadyPurchased,
      NotFulfilled,
      NotPurchased
   );
   for ProductPurchaseStatus use (
      Succeeded => 0,
      AlreadyPurchased => 1,
      NotFulfilled => 2,
      NotPurchased => 3
   );
   for ProductPurchaseStatus'Size use 32;
   
   type ProductPurchaseStatus_Ptr is access ProductPurchaseStatus;
   
   type ProductType is (
      Unknown,
      Durable,
      Consumable
   );
   for ProductType use (
      Unknown => 0,
      Durable => 1,
      Consumable => 2
   );
   for ProductType'Size use 32;
   
   type ProductType_Ptr is access ProductType;
   
   type FulfillmentResult is (
      Succeeded,
      NothingToFulfill,
      PurchasePending,
      PurchaseReverted,
      ServerError
   );
   for FulfillmentResult use (
      Succeeded => 0,
      NothingToFulfill => 1,
      PurchasePending => 2,
      PurchaseReverted => 3,
      ServerError => 4
   );
   for FulfillmentResult'Size use 32;
   
   type FulfillmentResult_Ptr is access FulfillmentResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type LicenseChangedEventHandler_Interface;
   type LicenseChangedEventHandler is access all LicenseChangedEventHandler_Interface'Class;
   type LicenseChangedEventHandler_Ptr is access all LicenseChangedEventHandler;
   type AsyncOperationCompletedHandler_IListingInformation_Interface;
   type AsyncOperationCompletedHandler_IListingInformation is access all AsyncOperationCompletedHandler_IListingInformation_Interface'Class;
   type AsyncOperationCompletedHandler_IListingInformation_Ptr is access all AsyncOperationCompletedHandler_IListingInformation;
   type AsyncOperationCompletedHandler_FulfillmentResult_Interface;
   type AsyncOperationCompletedHandler_FulfillmentResult is access all AsyncOperationCompletedHandler_FulfillmentResult_Interface'Class;
   type AsyncOperationCompletedHandler_FulfillmentResult_Ptr is access all AsyncOperationCompletedHandler_FulfillmentResult;
   type AsyncOperationCompletedHandler_IPurchaseResults_Interface;
   type AsyncOperationCompletedHandler_IPurchaseResults is access all AsyncOperationCompletedHandler_IPurchaseResults_Interface'Class;
   type AsyncOperationCompletedHandler_IPurchaseResults_Ptr is access all AsyncOperationCompletedHandler_IPurchaseResults;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICurrentApp_Interface;
   type ICurrentApp is access all ICurrentApp_Interface'Class;
   type ICurrentApp_Ptr is access all ICurrentApp;
   type ICurrentAppWithConsumables_Interface;
   type ICurrentAppWithConsumables is access all ICurrentAppWithConsumables_Interface'Class;
   type ICurrentAppWithConsumables_Ptr is access all ICurrentAppWithConsumables;
   type ICurrentAppWithCampaignId_Interface;
   type ICurrentAppWithCampaignId is access all ICurrentAppWithCampaignId_Interface'Class;
   type ICurrentAppWithCampaignId_Ptr is access all ICurrentAppWithCampaignId;
   type ICurrentApp2Statics_Interface;
   type ICurrentApp2Statics is access all ICurrentApp2Statics_Interface'Class;
   type ICurrentApp2Statics_Ptr is access all ICurrentApp2Statics;
   type ICurrentAppSimulator_Interface;
   type ICurrentAppSimulator is access all ICurrentAppSimulator_Interface'Class;
   type ICurrentAppSimulator_Ptr is access all ICurrentAppSimulator;
   type ICurrentAppSimulatorWithCampaignId_Interface;
   type ICurrentAppSimulatorWithCampaignId is access all ICurrentAppSimulatorWithCampaignId_Interface'Class;
   type ICurrentAppSimulatorWithCampaignId_Ptr is access all ICurrentAppSimulatorWithCampaignId;
   type ICurrentAppSimulatorWithConsumables_Interface;
   type ICurrentAppSimulatorWithConsumables is access all ICurrentAppSimulatorWithConsumables_Interface'Class;
   type ICurrentAppSimulatorWithConsumables_Ptr is access all ICurrentAppSimulatorWithConsumables;
   type IPurchaseResults_Interface;
   type IPurchaseResults is access all IPurchaseResults_Interface'Class;
   type IPurchaseResults_Ptr is access all IPurchaseResults;
   type ILicenseInformation_Interface;
   type ILicenseInformation is access all ILicenseInformation_Interface'Class;
   type ILicenseInformation_Ptr is access all ILicenseInformation;
   type IProductLicense_Interface;
   type IProductLicense is access all IProductLicense_Interface'Class;
   type IProductLicense_Ptr is access all IProductLicense;
   type IListingInformation_Interface;
   type IListingInformation is access all IListingInformation_Interface'Class;
   type IListingInformation_Ptr is access all IListingInformation;
   type IListingInformation2_Interface;
   type IListingInformation2 is access all IListingInformation2_Interface'Class;
   type IListingInformation2_Ptr is access all IListingInformation2;
   type IProductListing_Interface;
   type IProductListing is access all IProductListing_Interface'Class;
   type IProductListing_Ptr is access all IProductListing;
   type IProductListingWithConsumables_Interface;
   type IProductListingWithConsumables is access all IProductListingWithConsumables_Interface'Class;
   type IProductListingWithConsumables_Ptr is access all IProductListingWithConsumables;
   type IProductListing2_Interface;
   type IProductListing2 is access all IProductListing2_Interface'Class;
   type IProductListing2_Ptr is access all IProductListing2;
   type ICurrentAppStaticsWithFiltering_Interface;
   type ICurrentAppStaticsWithFiltering is access all ICurrentAppStaticsWithFiltering_Interface'Class;
   type ICurrentAppStaticsWithFiltering_Ptr is access all ICurrentAppStaticsWithFiltering;
   type ICurrentAppSimulatorStaticsWithFiltering_Interface;
   type ICurrentAppSimulatorStaticsWithFiltering is access all ICurrentAppSimulatorStaticsWithFiltering_Interface'Class;
   type ICurrentAppSimulatorStaticsWithFiltering_Ptr is access all ICurrentAppSimulatorStaticsWithFiltering;
   type IProductLicenseWithFulfillment_Interface;
   type IProductLicenseWithFulfillment is access all IProductLicenseWithFulfillment_Interface'Class;
   type IProductLicenseWithFulfillment_Ptr is access all IProductLicenseWithFulfillment;
   type IProductListingWithMetadata_Interface;
   type IProductListingWithMetadata is access all IProductListingWithMetadata_Interface'Class;
   type IProductListingWithMetadata_Ptr is access all IProductListingWithMetadata;
   type IUnfulfilledConsumable_Interface;
   type IUnfulfilledConsumable is access all IUnfulfilledConsumable_Interface'Class;
   type IUnfulfilledConsumable_Ptr is access all IUnfulfilledConsumable;
   type IProductPurchaseDisplayProperties_Interface;
   type IProductPurchaseDisplayProperties is access all IProductPurchaseDisplayProperties_Interface'Class;
   type IProductPurchaseDisplayProperties_Ptr is access all IProductPurchaseDisplayProperties;
   type IProductPurchaseDisplayPropertiesFactory_Interface;
   type IProductPurchaseDisplayPropertiesFactory is access all IProductPurchaseDisplayPropertiesFactory_Interface'Class;
   type IProductPurchaseDisplayPropertiesFactory_Ptr is access all IProductPurchaseDisplayPropertiesFactory;
   type IAsyncOperation_IListingInformation_Interface;
   type IAsyncOperation_IListingInformation is access all IAsyncOperation_IListingInformation_Interface'Class;
   type IAsyncOperation_IListingInformation_Ptr is access all IAsyncOperation_IListingInformation;
   type IAsyncOperation_FulfillmentResult_Interface;
   type IAsyncOperation_FulfillmentResult is access all IAsyncOperation_FulfillmentResult_Interface'Class;
   type IAsyncOperation_FulfillmentResult_Ptr is access all IAsyncOperation_FulfillmentResult;
   type IAsyncOperation_IPurchaseResults_Interface;
   type IAsyncOperation_IPurchaseResults is access all IAsyncOperation_IPurchaseResults_Interface'Class;
   type IAsyncOperation_IPurchaseResults_Ptr is access all IAsyncOperation_IPurchaseResults;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICurrentApp : aliased constant Windows.IID := (3576545381, 55871, 18053, (153, 94, 155, 72, 46, 181, 230, 3 ));
   
   type ICurrentApp_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LicenseInformation
   (
      This       : access ICurrentApp_Interface
      ; RetVal : access Windows.ApplicationModel.Store.ILicenseInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_LinkUri
   (
      This       : access ICurrentApp_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AppId
   (
      This       : access ICurrentApp_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function RequestAppPurchaseAsync
   (
      This       : access ICurrentApp_Interface
      ; includeReceipt : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestProductPurchaseAsync
   (
      This       : access ICurrentApp_Interface
      ; productId : Windows.String
      ; includeReceipt : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadListingInformationAsync
   (
      This       : access ICurrentApp_Interface
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppReceiptAsync
   (
      This       : access ICurrentApp_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetProductReceiptAsync
   (
      This       : access ICurrentApp_Interface
      ; productId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrentAppWithConsumables : aliased constant Windows.IID := (2219704433, 40527, 20345, (153, 90, 95, 145, 23, 46, 108, 239 ));
   
   type ICurrentAppWithConsumables_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportConsumableFulfillmentAsync
   (
      This       : access ICurrentAppWithConsumables_Interface
      ; productId : Windows.String
      ; transactionId : Windows.Guid
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestProductPurchaseWithResultsAsync
   (
      This       : access ICurrentAppWithConsumables_Interface
      ; productId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestProductPurchaseWithDisplayPropertiesAsync
   (
      This       : access ICurrentAppWithConsumables_Interface
      ; productId : Windows.String
      ; offerId : Windows.String
      ; displayProperties : Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetUnfulfilledConsumablesAsync
   (
      This       : access ICurrentAppWithConsumables_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrentAppWithCampaignId : aliased constant Windows.IID := (825183440, 14017, 17574, (179, 43, 67, 45, 96, 142, 77, 214 ));
   
   type ICurrentAppWithCampaignId_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAppPurchaseCampaignIdAsync
   (
      This       : access ICurrentAppWithCampaignId_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrentApp2Statics : aliased constant Windows.IID := (3746459181, 12657, 19155, (134, 20, 44, 97, 36, 67, 115, 203 ));
   
   type ICurrentApp2Statics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCustomerPurchaseIdAsync
   (
      This       : access ICurrentApp2Statics_Interface
      ; serviceTicket : Windows.String
      ; publisherUserId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCustomerCollectionsIdAsync
   (
      This       : access ICurrentApp2Statics_Interface
      ; serviceTicket : Windows.String
      ; publisherUserId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrentAppSimulator : aliased constant Windows.IID := (4051672497, 29901, 18311, (151, 135, 25, 134, 110, 154, 85, 89 ));
   
   type ICurrentAppSimulator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LicenseInformation
   (
      This       : access ICurrentAppSimulator_Interface
      ; RetVal : access Windows.ApplicationModel.Store.ILicenseInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_LinkUri
   (
      This       : access ICurrentAppSimulator_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AppId
   (
      This       : access ICurrentAppSimulator_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function RequestAppPurchaseAsync
   (
      This       : access ICurrentAppSimulator_Interface
      ; includeReceipt : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestProductPurchaseAsync
   (
      This       : access ICurrentAppSimulator_Interface
      ; productId : Windows.String
      ; includeReceipt : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadListingInformationAsync
   (
      This       : access ICurrentAppSimulator_Interface
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppReceiptAsync
   (
      This       : access ICurrentAppSimulator_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetProductReceiptAsync
   (
      This       : access ICurrentAppSimulator_Interface
      ; productId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReloadSimulatorAsync
   (
      This       : access ICurrentAppSimulator_Interface
      ; simulatorSettingsFile : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrentAppSimulatorWithCampaignId : aliased constant Windows.IID := (2221378115, 57088, 18034, (164, 63, 178, 91, 20, 65, 207, 207 ));
   
   type ICurrentAppSimulatorWithCampaignId_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAppPurchaseCampaignIdAsync
   (
      This       : access ICurrentAppSimulatorWithCampaignId_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrentAppSimulatorWithConsumables : aliased constant Windows.IID := (1313992875, 8423, 17426, (155, 133, 89, 187, 120, 56, 134, 103 ));
   
   type ICurrentAppSimulatorWithConsumables_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportConsumableFulfillmentAsync
   (
      This       : access ICurrentAppSimulatorWithConsumables_Interface
      ; productId : Windows.String
      ; transactionId : Windows.Guid
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestProductPurchaseWithResultsAsync
   (
      This       : access ICurrentAppSimulatorWithConsumables_Interface
      ; productId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestProductPurchaseWithDisplayPropertiesAsync
   (
      This       : access ICurrentAppSimulatorWithConsumables_Interface
      ; productId : Windows.String
      ; offerId : Windows.String
      ; displayProperties : Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetUnfulfilledConsumablesAsync
   (
      This       : access ICurrentAppSimulatorWithConsumables_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPurchaseResults : aliased constant Windows.IID := (3981489022, 34390, 20325, (184, 200, 172, 126, 12, 177, 161, 194 ));
   
   type IPurchaseResults_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IPurchaseResults_Interface
      ; RetVal : access Windows.ApplicationModel.Store.ProductPurchaseStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_TransactionId
   (
      This       : access IPurchaseResults_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ReceiptXml
   (
      This       : access IPurchaseResults_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OfferId
   (
      This       : access IPurchaseResults_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILicenseInformation : aliased constant Windows.IID := (2394414128, 61808, 20181, (142, 33, 21, 22, 218, 63, 211, 103 ));
   
   type ILicenseInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProductLicenses
   (
      This       : access ILicenseInformation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsActive
   (
      This       : access ILicenseInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTrial
   (
      This       : access ILicenseInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationDate
   (
      This       : access ILicenseInformation_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function add_LicenseChanged
   (
      This       : access ILicenseInformation_Interface
      ; handler : Windows.ApplicationModel.Store.LicenseChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LicenseChanged
   (
      This       : access ILicenseInformation_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProductLicense : aliased constant Windows.IID := (909314247, 11215, 19470, (143, 47, 232, 8, 170, 168, 249, 157 ));
   
   type IProductLicense_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProductId
   (
      This       : access IProductLicense_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsActive
   (
      This       : access IProductLicense_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationDate
   (
      This       : access IProductLicense_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListingInformation : aliased constant Windows.IID := (1485523647, 48244, 17283, (183, 140, 153, 96, 99, 35, 222, 206 ));
   
   type IListingInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentMarket
   (
      This       : access IListingInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IListingInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProductListings
   (
      This       : access IListingInformation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FormattedPrice
   (
      This       : access IListingInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IListingInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AgeRating
   (
      This       : access IListingInformation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IListingInformation2 : aliased constant Windows.IID := (3237817373, 45838, 17284, (132, 234, 114, 254, 250, 130, 34, 62 ));
   
   type IListingInformation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FormattedBasePrice
   (
      This       : access IListingInformation2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SaleEndDate
   (
      This       : access IListingInformation2_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOnSale
   (
      This       : access IListingInformation2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrencyCode
   (
      This       : access IListingInformation2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProductListing : aliased constant Windows.IID := (1168627373, 51024, 19868, (148, 124, 176, 13, 203, 249, 233, 194 ));
   
   type IProductListing_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProductId
   (
      This       : access IProductListing_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FormattedPrice
   (
      This       : access IProductListing_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IProductListing_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProductListingWithConsumables : aliased constant Windows.IID := (3953039248, 36715, 18463, (147, 167, 92, 58, 99, 6, 129, 73 ));
   
   type IProductListingWithConsumables_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProductType
   (
      This       : access IProductListingWithConsumables_Interface
      ; RetVal : access Windows.ApplicationModel.Store.ProductType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProductListing2 : aliased constant Windows.IID := (4171114767, 29694, 18765, (169, 57, 8, 169, 178, 73, 90, 190 ));
   
   type IProductListing2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FormattedBasePrice
   (
      This       : access IProductListing2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SaleEndDate
   (
      This       : access IProductListing2_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOnSale
   (
      This       : access IProductListing2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrencyCode
   (
      This       : access IProductListing2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrentAppStaticsWithFiltering : aliased constant Windows.IID := (3547161922, 36997, 17294, (151, 186, 162, 92, 151, 107, 226, 253 ));
   
   type ICurrentAppStaticsWithFiltering_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadListingInformationByProductIdsAsync
   (
      This       : access ICurrentAppStaticsWithFiltering_Interface
      ; productIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadListingInformationByKeywordsAsync
   (
      This       : access ICurrentAppStaticsWithFiltering_Interface
      ; keywords : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReportProductFulfillment
   (
      This       : access ICurrentAppStaticsWithFiltering_Interface
      ; productId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrentAppSimulatorStaticsWithFiltering : aliased constant Windows.IID := (1635676386, 63599, 19284, (150, 102, 221, 226, 133, 9, 44, 104 ));
   
   type ICurrentAppSimulatorStaticsWithFiltering_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadListingInformationByProductIdsAsync
   (
      This       : access ICurrentAppSimulatorStaticsWithFiltering_Interface
      ; productIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadListingInformationByKeywordsAsync
   (
      This       : access ICurrentAppSimulatorStaticsWithFiltering_Interface
      ; keywords : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProductLicenseWithFulfillment : aliased constant Windows.IID := (4233321610, 63079, 16627, (186, 60, 4, 90, 99, 171, 179, 172 ));
   
   type IProductLicenseWithFulfillment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsConsumable
   (
      This       : access IProductLicenseWithFulfillment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProductListingWithMetadata : aliased constant Windows.IID := (307078503, 9208, 16958, (149, 50, 24, 153, 67, 196, 10, 206 ));
   
   type IProductListingWithMetadata_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Description
   (
      This       : access IProductListingWithMetadata_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Keywords
   (
      This       : access IProductListingWithMetadata_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterable_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ProductType
   (
      This       : access IProductListingWithMetadata_Interface
      ; RetVal : access Windows.ApplicationModel.Store.ProductType
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access IProductListingWithMetadata_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ImageUri
   (
      This       : access IProductListingWithMetadata_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUnfulfilledConsumable : aliased constant Windows.IID := (771226555, 7389, 19640, (160, 20, 123, 156, 248, 152, 105, 39 ));
   
   type IUnfulfilledConsumable_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProductId
   (
      This       : access IUnfulfilledConsumable_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TransactionId
   (
      This       : access IUnfulfilledConsumable_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_OfferId
   (
      This       : access IUnfulfilledConsumable_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProductPurchaseDisplayProperties : aliased constant Windows.IID := (3607852064, 48274, 16411, (168, 9, 201, 178, 229, 219, 189, 175 ));
   
   type IProductPurchaseDisplayProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IProductPurchaseDisplayProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IProductPurchaseDisplayProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IProductPurchaseDisplayProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IProductPurchaseDisplayProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Image
   (
      This       : access IProductPurchaseDisplayProperties_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Image
   (
      This       : access IProductPurchaseDisplayProperties_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProductPurchaseDisplayPropertiesFactory : aliased constant Windows.IID := (1867062772, 13014, 19264, (180, 116, 184, 48, 56, 164, 217, 207 ));
   
   type IProductPurchaseDisplayPropertiesFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateProductPurchaseDisplayProperties
   (
      This       : access IProductPurchaseDisplayPropertiesFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IListingInformation : aliased constant Windows.IID := (370540791, 27983, 20493, (147, 168, 9, 173, 107, 90, 196, 171 ));
   
   type IAsyncOperation_IListingInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IListingInformation_Interface
      ; handler : Windows.ApplicationModel.Store.AsyncOperationCompletedHandler_IListingInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IListingInformation_Interface
      ; RetVal : access Windows.ApplicationModel.Store.AsyncOperationCompletedHandler_IListingInformation
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IListingInformation_Interface
      ; RetVal : access Windows.ApplicationModel.Store.IListingInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_FulfillmentResult : aliased constant Windows.IID := (1552232876, 23949, 24071, (182, 238, 124, 171, 150, 147, 14, 138 ));
   
   type IAsyncOperation_FulfillmentResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_FulfillmentResult_Interface
      ; handler : Windows.ApplicationModel.Store.AsyncOperationCompletedHandler_FulfillmentResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_FulfillmentResult_Interface
      ; RetVal : access Windows.ApplicationModel.Store.AsyncOperationCompletedHandler_FulfillmentResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_FulfillmentResult_Interface
      ; RetVal : access Windows.ApplicationModel.Store.FulfillmentResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPurchaseResults : aliased constant Windows.IID := (606038800, 27382, 20836, (133, 235, 186, 230, 189, 174, 11, 232 ));
   
   type IAsyncOperation_IPurchaseResults_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPurchaseResults_Interface
      ; handler : Windows.ApplicationModel.Store.AsyncOperationCompletedHandler_IPurchaseResults
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPurchaseResults_Interface
      ; RetVal : access Windows.ApplicationModel.Store.AsyncOperationCompletedHandler_IPurchaseResults
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPurchaseResults_Interface
      ; RetVal : access Windows.ApplicationModel.Store.IPurchaseResults
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_LicenseChangedEventHandler : aliased constant Windows.IID := (3567583829, 4969, 19510, (131, 47, 111, 45, 136, 227, 101, 155 ));
   
   type LicenseChangedEventHandler_Interface(Callback : access procedure) is new Windows.IMulticastDelegate_Interface(IID_LicenseChangedEventHandler'access) with null record;
   function Invoke
   (
      This       : access LicenseChangedEventHandler_Interface
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IListingInformation : aliased constant Windows.IID := (4260903202, 30254, 22492, (183, 33, 199, 46, 229, 104, 253, 150 ));
   
   type AsyncOperationCompletedHandler_IListingInformation_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IListingInformation'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IListingInformation_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_FulfillmentResult : aliased constant Windows.IID := (2272636105, 47534, 23758, (137, 92, 151, 27, 249, 39, 8, 146 ));
   
   type AsyncOperationCompletedHandler_FulfillmentResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_FulfillmentResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_FulfillmentResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPurchaseResults : aliased constant Windows.IID := (615944746, 64945, 20483, (174, 137, 200, 191, 22, 202, 1, 67 ));
   
   type AsyncOperationCompletedHandler_IPurchaseResults_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPurchaseResults'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPurchaseResults_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype LicenseInformation is Windows.ApplicationModel.Store.ILicenseInformation;
   subtype ListingInformation is Windows.ApplicationModel.Store.IListingInformation;
   subtype PurchaseResults is Windows.ApplicationModel.Store.IPurchaseResults;
   subtype ProductPurchaseDisplayProperties is Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties;
   function CreateProductPurchaseDisplayProperties return Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties;
   
   subtype UnfulfilledConsumable is Windows.ApplicationModel.Store.IUnfulfilledConsumable;
   subtype ProductLicense is Windows.ApplicationModel.Store.IProductLicense;
   subtype ProductListing is Windows.ApplicationModel.Store.IProductListing;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetAppPurchaseCampaignIdAsync
   return Windows.Foundation.IAsyncOperation_String;
   
   function get_LicenseInformation
   return Windows.ApplicationModel.Store.ILicenseInformation;
   
   function get_LinkUri
   return Windows.Foundation.IUriRuntimeClass;
   
   function get_AppId
   return Windows.Guid;
   
   function RequestAppPurchaseAsync
   (
      includeReceipt : Windows.Boolean
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function RequestProductPurchaseAsync
   (
      productId : Windows.String
      ; includeReceipt : Windows.Boolean
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function LoadListingInformationAsync
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   
   function GetAppReceiptAsync
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetProductReceiptAsync
   (
      productId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetCustomerPurchaseIdAsync
   (
      serviceTicket : Windows.String
      ; publisherUserId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetCustomerCollectionsIdAsync
   (
      serviceTicket : Windows.String
      ; publisherUserId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function ReportConsumableFulfillmentAsync
   (
      productId : Windows.String
      ; transactionId : Windows.Guid
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult;
   
   function RequestProductPurchaseWithResultsAsync
   (
      productId : Windows.String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults;
   
   function RequestProductPurchaseWithDisplayPropertiesAsync
   (
      productId : Windows.String
      ; offerId : Windows.String
      ; displayProperties : Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults;
   
   function GetUnfulfilledConsumablesAsync
   return Windows.Address;
   
   function LoadListingInformationByProductIdsAsync
   (
      productIds : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   
   function LoadListingInformationByKeywordsAsync
   (
      keywords : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   
   procedure ReportProductFulfillment
   (
      productId : Windows.String
   )
   ;
   
   function ReportConsumableFulfillmentAsync_CurrentAppSimulator
   (
      productId : Windows.String
      ; transactionId : Windows.Guid
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_FulfillmentResult;
   
   function RequestProductPurchaseWithResultsAsync_CurrentAppSimulator
   (
      productId : Windows.String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults;
   
   function RequestProductPurchaseWithDisplayPropertiesAsync_CurrentAppSimulator
   (
      productId : Windows.String
      ; offerId : Windows.String
      ; displayProperties : Windows.ApplicationModel.Store.IProductPurchaseDisplayProperties
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IPurchaseResults;
   
   function GetUnfulfilledConsumablesAsync_CurrentAppSimulator
   return Windows.Address;
   
   function GetAppPurchaseCampaignIdAsync_CurrentAppSimulator
   return Windows.Foundation.IAsyncOperation_String;
   
   function get_LicenseInformation_CurrentAppSimulator
   return Windows.ApplicationModel.Store.ILicenseInformation;
   
   function get_LinkUri_CurrentAppSimulator
   return Windows.Foundation.IUriRuntimeClass;
   
   function get_AppId_CurrentAppSimulator
   return Windows.Guid;
   
   function RequestAppPurchaseAsync_CurrentAppSimulator
   (
      includeReceipt : Windows.Boolean
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function RequestProductPurchaseAsync_CurrentAppSimulator
   (
      productId : Windows.String
      ; includeReceipt : Windows.Boolean
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function LoadListingInformationAsync_CurrentAppSimulator
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   
   function GetAppReceiptAsync_CurrentAppSimulator
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetProductReceiptAsync_CurrentAppSimulator
   (
      productId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function ReloadSimulatorAsync
   (
      simulatorSettingsFile : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncAction;
   
   function LoadListingInformationByProductIdsAsync_CurrentAppSimulator
   (
      productIds : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   
   function LoadListingInformationByKeywordsAsync_CurrentAppSimulator
   (
      keywords : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Store.IAsyncOperation_IListingInformation;
   
end;
