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
limited with Windows.Storage.Streams;
limited with Windows.UI;
with Windows.Foundation.Collections;
limited with Windows.Devices.Geolocation;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Wallet is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WalletActionKind is (
      OpenItem,
      Transaction,
      MoreTransactions,
      Message,
      Verb
   );
   for WalletActionKind use (
      OpenItem => 0,
      Transaction => 1,
      MoreTransactions => 2,
      Message => 3,
      Verb => 4
   );
   for WalletActionKind'Size use 32;
   
   type WalletActionKind_Ptr is access WalletActionKind;
   
   type WalletBarcodeSymbology is (
      Invalid,
      Upca,
      Upce,
      Ean13,
      Ean8,
      Itf,
      Code39,
      Code128,
      Qr,
      Pdf417,
      Aztec,
      Custom
   );
   for WalletBarcodeSymbology use (
      Invalid => 0,
      Upca => 1,
      Upce => 2,
      Ean13 => 3,
      Ean8 => 4,
      Itf => 5,
      Code39 => 6,
      Code128 => 7,
      Qr => 8,
      Pdf417 => 9,
      Aztec => 10,
      Custom => 100000
   );
   for WalletBarcodeSymbology'Size use 32;
   
   type WalletBarcodeSymbology_Ptr is access WalletBarcodeSymbology;
   
   type WalletDetailViewPosition is (
      Hidden,
      HeaderField1,
      HeaderField2,
      PrimaryField1,
      PrimaryField2,
      SecondaryField1,
      SecondaryField2,
      SecondaryField3,
      SecondaryField4,
      SecondaryField5,
      CenterField1,
      FooterField1,
      FooterField2,
      FooterField3,
      FooterField4
   );
   for WalletDetailViewPosition use (
      Hidden => 0,
      HeaderField1 => 1,
      HeaderField2 => 2,
      PrimaryField1 => 3,
      PrimaryField2 => 4,
      SecondaryField1 => 5,
      SecondaryField2 => 6,
      SecondaryField3 => 7,
      SecondaryField4 => 8,
      SecondaryField5 => 9,
      CenterField1 => 10,
      FooterField1 => 11,
      FooterField2 => 12,
      FooterField3 => 13,
      FooterField4 => 14
   );
   for WalletDetailViewPosition'Size use 32;
   
   type WalletDetailViewPosition_Ptr is access WalletDetailViewPosition;
   
   type WalletSummaryViewPosition is (
      Hidden,
      Field1,
      Field2
   );
   for WalletSummaryViewPosition use (
      Hidden => 0,
      Field1 => 1,
      Field2 => 2
   );
   for WalletSummaryViewPosition'Size use 32;
   
   type WalletSummaryViewPosition_Ptr is access WalletSummaryViewPosition;
   
   type WalletItemKind is (
      Invalid,
      Deal,
      General,
      PaymentInstrument,
      Ticket,
      BoardingPass,
      MembershipCard
   );
   for WalletItemKind use (
      Invalid => 0,
      Deal => 1,
      General => 2,
      PaymentInstrument => 3,
      Ticket => 4,
      BoardingPass => 5,
      MembershipCard => 6
   );
   for WalletItemKind'Size use 32;
   
   type WalletItemKind_Ptr is access WalletItemKind;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type WalletContract is null record;
   pragma Convention (C_Pass_By_Copy , WalletContract);
   
   type WalletContract_Ptr is access WalletContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IWalletItem_Interface;
   type AsyncOperationCompletedHandler_IWalletItem is access all AsyncOperationCompletedHandler_IWalletItem_Interface'Class;
   type AsyncOperationCompletedHandler_IWalletItem_Ptr is access all AsyncOperationCompletedHandler_IWalletItem;
   type TypedEventHandler_IWalletItemStore2_add_ItemsChanged_Interface;
   type TypedEventHandler_IWalletItemStore2_add_ItemsChanged is access all TypedEventHandler_IWalletItemStore2_add_ItemsChanged_Interface'Class;
   type TypedEventHandler_IWalletItemStore2_add_ItemsChanged_Ptr is access all TypedEventHandler_IWalletItemStore2_add_ItemsChanged;
   type AsyncOperationCompletedHandler_IWalletItemStore_Interface;
   type AsyncOperationCompletedHandler_IWalletItemStore is access all AsyncOperationCompletedHandler_IWalletItemStore_Interface'Class;
   type AsyncOperationCompletedHandler_IWalletItemStore_Ptr is access all AsyncOperationCompletedHandler_IWalletItemStore;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWalletBarcode_Interface;
   type IWalletBarcode is access all IWalletBarcode_Interface'Class;
   type IWalletBarcode_Ptr is access all IWalletBarcode;
   type IWalletItemCustomProperty_Interface;
   type IWalletItemCustomProperty is access all IWalletItemCustomProperty_Interface'Class;
   type IWalletItemCustomProperty_Ptr is access all IWalletItemCustomProperty;
   type IWalletVerb_Interface;
   type IWalletVerb is access all IWalletVerb_Interface'Class;
   type IWalletVerb_Ptr is access all IWalletVerb;
   type IWalletItem_Interface;
   type IWalletItem is access all IWalletItem_Interface'Class;
   type IWalletItem_Ptr is access all IWalletItem;
   type IWalletTransaction_Interface;
   type IWalletTransaction is access all IWalletTransaction_Interface'Class;
   type IWalletTransaction_Ptr is access all IWalletTransaction;
   type IWalletRelevantLocation_Interface;
   type IWalletRelevantLocation is access all IWalletRelevantLocation_Interface'Class;
   type IWalletRelevantLocation_Ptr is access all IWalletRelevantLocation;
   type IWalletItemStore_Interface;
   type IWalletItemStore is access all IWalletItemStore_Interface'Class;
   type IWalletItemStore_Ptr is access all IWalletItemStore;
   type IWalletItemStore2_Interface;
   type IWalletItemStore2 is access all IWalletItemStore2_Interface'Class;
   type IWalletItemStore2_Ptr is access all IWalletItemStore2;
   type IWalletManagerStatics_Interface;
   type IWalletManagerStatics is access all IWalletManagerStatics_Interface'Class;
   type IWalletManagerStatics_Ptr is access all IWalletManagerStatics;
   type IWalletItemCustomPropertyFactory_Interface;
   type IWalletItemCustomPropertyFactory is access all IWalletItemCustomPropertyFactory_Interface'Class;
   type IWalletItemCustomPropertyFactory_Ptr is access all IWalletItemCustomPropertyFactory;
   type IWalletVerbFactory_Interface;
   type IWalletVerbFactory is access all IWalletVerbFactory_Interface'Class;
   type IWalletVerbFactory_Ptr is access all IWalletVerbFactory;
   type IWalletItemFactory_Interface;
   type IWalletItemFactory is access all IWalletItemFactory_Interface'Class;
   type IWalletItemFactory_Ptr is access all IWalletItemFactory;
   type IWalletBarcodeFactory_Interface;
   type IWalletBarcodeFactory is access all IWalletBarcodeFactory_Interface'Class;
   type IWalletBarcodeFactory_Ptr is access all IWalletBarcodeFactory;
   type IAsyncOperation_IWalletItem_Interface;
   type IAsyncOperation_IWalletItem is access all IAsyncOperation_IWalletItem_Interface'Class;
   type IAsyncOperation_IWalletItem_Ptr is access all IAsyncOperation_IWalletItem;
   type IAsyncOperation_IWalletItemStore_Interface;
   type IAsyncOperation_IWalletItemStore is access all IAsyncOperation_IWalletItemStore_Interface'Class;
   type IAsyncOperation_IWalletItemStore_Ptr is access all IAsyncOperation_IWalletItemStore;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IWalletBarcode : aliased constant Windows.IID := (1334147881, 56960, 20132, (161, 205, 129, 205, 8, 77, 172, 39 ));
   
   type IWalletBarcode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Symbology
   (
      This       : access IWalletBarcode_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.WalletBarcodeSymbology
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IWalletBarcode_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetImageAsync
   (
      This       : access IWalletBarcode_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletItemCustomProperty : aliased constant Windows.IID := (3108716787, 64000, 16637, (152, 220, 157, 228, 102, 151, 241, 231 ));
   
   type IWalletItemCustomProperty_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IWalletItemCustomProperty_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IWalletItemCustomProperty_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IWalletItemCustomProperty_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IWalletItemCustomProperty_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoDetectLinks
   (
      This       : access IWalletItemCustomProperty_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoDetectLinks
   (
      This       : access IWalletItemCustomProperty_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DetailViewPosition
   (
      This       : access IWalletItemCustomProperty_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.WalletDetailViewPosition
   )
   return Windows.HRESULT is abstract;
   
   function put_DetailViewPosition
   (
      This       : access IWalletItemCustomProperty_Interface
      ; value : Windows.ApplicationModel.Wallet.WalletDetailViewPosition
   )
   return Windows.HRESULT is abstract;
   
   function get_SummaryViewPosition
   (
      This       : access IWalletItemCustomProperty_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.WalletSummaryViewPosition
   )
   return Windows.HRESULT is abstract;
   
   function put_SummaryViewPosition
   (
      This       : access IWalletItemCustomProperty_Interface
      ; value : Windows.ApplicationModel.Wallet.WalletSummaryViewPosition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletVerb : aliased constant Windows.IID := (397944534, 58305, 19572, (138, 148, 33, 122, 173, 188, 72, 132 ));
   
   type IWalletVerb_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IWalletVerb_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IWalletVerb_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletItem : aliased constant Windows.IID := (548752360, 4493, 20164, (153, 108, 185, 99, 231, 189, 62, 116 ));
   
   type IWalletItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IWalletItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAcknowledged
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAcknowledged
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IssuerDisplayName
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_IssuerDisplayName
   (
      This       : access IWalletItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LastUpdated
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_LastUpdated
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.WalletItemKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Barcode
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.IWalletBarcode
   )
   return Windows.HRESULT is abstract;
   
   function put_Barcode
   (
      This       : access IWalletItem_Interface
      ; value : Windows.ApplicationModel.Wallet.IWalletBarcode
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationDate
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ExpirationDate
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Logo159x159
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Logo159x159
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Logo336x336
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Logo336x336
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Logo99x99
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Logo99x99
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayMessage
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayMessage
   (
      This       : access IWalletItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisplayMessageLaunchable
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDisplayMessageLaunchable
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LogoText
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_LogoText
   (
      This       : access IWalletItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderColor
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_HeaderColor
   (
      This       : access IWalletItem_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BodyColor
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_BodyColor
   (
      This       : access IWalletItem_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderFontColor
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_HeaderFontColor
   (
      This       : access IWalletItem_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BodyFontColor
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_BodyFontColor
   (
      This       : access IWalletItem_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_HeaderBackgroundImage
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_HeaderBackgroundImage
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_BodyBackgroundImage
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_BodyBackgroundImage
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_LogoImage
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_LogoImage
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_PromotionalImage
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_PromotionalImage
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_RelevantDate
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_RelevantDate
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_RelevantDateDisplayMessage
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RelevantDateDisplayMessage
   (
      This       : access IWalletItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TransactionHistory
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RelevantLocations
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMoreTransactionHistoryLaunchable
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsMoreTransactionHistoryLaunchable
   (
      This       : access IWalletItem_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayProperties
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Verbs
   (
      This       : access IWalletItem_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletTransaction : aliased constant Windows.IID := (1088547136, 9734, 17689, (129, 203, 191, 241, 198, 13, 31, 121 ));
   
   type IWalletTransaction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Description
   (
      This       : access IWalletTransaction_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IWalletTransaction_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayAmount
   (
      This       : access IWalletTransaction_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayAmount
   (
      This       : access IWalletTransaction_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IgnoreTimeOfDay
   (
      This       : access IWalletTransaction_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IgnoreTimeOfDay
   (
      This       : access IWalletTransaction_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayLocation
   (
      This       : access IWalletTransaction_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayLocation
   (
      This       : access IWalletTransaction_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TransactionDate
   (
      This       : access IWalletTransaction_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_TransactionDate
   (
      This       : access IWalletTransaction_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLaunchable
   (
      This       : access IWalletTransaction_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsLaunchable
   (
      This       : access IWalletTransaction_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletRelevantLocation : aliased constant Windows.IID := (2681763882, 58361, 19937, (186, 179, 187, 25, 46, 70, 179, 243 ));
   
   type IWalletRelevantLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IWalletRelevantLocation_Interface
      ; RetVal : access Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access IWalletRelevantLocation_Interface
      ; value : Windows.Devices.Geolocation.BasicGeoposition
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayMessage
   (
      This       : access IWalletRelevantLocation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayMessage
   (
      This       : access IWalletRelevantLocation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletItemStore : aliased constant Windows.IID := (1902135371, 27977, 18680, (145, 169, 64, 161, 208, 241, 62, 244 ));
   
   type IWalletItemStore_Interface is interface and Windows.IInspectable_Interface;
   
   function AddAsync
   (
      This       : access IWalletItemStore_Interface
      ; id : Windows.String
      ; item : Windows.ApplicationModel.Wallet.IWalletItem
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ClearAsync
   (
      This       : access IWalletItemStore_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetWalletItemAsync
   (
      This       : access IWalletItemStore_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemsAsync
   (
      This       : access IWalletItemStore_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemsWithKindAsync
   (
      This       : access IWalletItemStore_Interface
      ; kind : Windows.ApplicationModel.Wallet.WalletItemKind
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ImportItemAsync
   (
      This       : access IWalletItemStore_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IWalletItemStore_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowAsync
   (
      This       : access IWalletItemStore_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowItemAsync
   (
      This       : access IWalletItemStore_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UpdateAsync
   (
      This       : access IWalletItemStore_Interface
      ; item : Windows.ApplicationModel.Wallet.IWalletItem
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletItemStore2 : aliased constant Windows.IID := (1709605616, 28681, 18965, (189, 84, 79, 255, 55, 155, 255, 226 ));
   
   type IWalletItemStore2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ItemsChanged
   (
      This       : access IWalletItemStore2_Interface
      ; handler : TypedEventHandler_IWalletItemStore2_add_ItemsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ItemsChanged
   (
      This       : access IWalletItemStore2_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletManagerStatics : aliased constant Windows.IID := (1360123576, 51620, 19556, (180, 221, 225, 229, 72, 0, 28, 13 ));
   
   type IWalletManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStoreAsync
   (
      This       : access IWalletManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItemStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletItemCustomPropertyFactory : aliased constant Windows.IID := (3489950276, 24993, 16810, (178, 89, 165, 97, 10, 181, 213, 117 ));
   
   type IWalletItemCustomPropertyFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWalletItemCustomProperty
   (
      This       : access IWalletItemCustomPropertyFactory_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.ApplicationModel.Wallet.IWalletItemCustomProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletVerbFactory : aliased constant Windows.IID := (1979787121, 48728, 19806, (131, 237, 88, 177, 102, 156, 122, 217 ));
   
   type IWalletVerbFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWalletVerb
   (
      This       : access IWalletVerbFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Wallet.IWalletVerb
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletItemFactory : aliased constant Windows.IID := (1407349872, 20235, 19006, (153, 229, 11, 187, 30, 171, 56, 212 ));
   
   type IWalletItemFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWalletItem
   (
      This       : access IWalletItemFactory_Interface
      ; kind : Windows.ApplicationModel.Wallet.WalletItemKind
      ; displayName : Windows.String
      ; RetVal : access Windows.ApplicationModel.Wallet.IWalletItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletBarcodeFactory : aliased constant Windows.IID := (806449505, 60828, 18078, (187, 253, 48, 108, 149, 234, 113, 8 ));
   
   type IWalletBarcodeFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWalletBarcode
   (
      This       : access IWalletBarcodeFactory_Interface
      ; symbology : Windows.ApplicationModel.Wallet.WalletBarcodeSymbology
      ; value : Windows.String
      ; RetVal : access Windows.ApplicationModel.Wallet.IWalletBarcode
   )
   return Windows.HRESULT is abstract;
   
   function CreateCustomWalletBarcode
   (
      This       : access IWalletBarcodeFactory_Interface
      ; streamToBarcodeImage : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.ApplicationModel.Wallet.IWalletBarcode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWalletItem : aliased constant Windows.IID := (2388975024, 59996, 21907, (161, 243, 11, 130, 9, 223, 57, 5 ));
   
   type IAsyncOperation_IWalletItem_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWalletItem_Interface
      ; handler : Windows.ApplicationModel.Wallet.AsyncOperationCompletedHandler_IWalletItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWalletItem_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.AsyncOperationCompletedHandler_IWalletItem
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWalletItem_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.IWalletItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWalletItemStore : aliased constant Windows.IID := (2523198394, 73, 23743, (132, 95, 143, 11, 202, 210, 177, 76 ));
   
   type IAsyncOperation_IWalletItemStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWalletItemStore_Interface
      ; handler : Windows.ApplicationModel.Wallet.AsyncOperationCompletedHandler_IWalletItemStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWalletItemStore_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.AsyncOperationCompletedHandler_IWalletItemStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWalletItemStore_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.IWalletItemStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWalletItem : aliased constant Windows.IID := (2293249183, 20541, 22406, (162, 103, 85, 187, 55, 168, 161, 177 ));
   
   type AsyncOperationCompletedHandler_IWalletItem_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItem ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWalletItem'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWalletItem_Interface
      ; asyncInfo : Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItem
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWalletItemStore2_add_ItemsChanged : aliased constant Windows.IID := (133992580, 40609, 21765, (137, 204, 77, 117, 71, 25, 245, 130 ));
   
   type TypedEventHandler_IWalletItemStore2_add_ItemsChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Wallet.IWalletItemStore ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWalletItemStore2_add_ItemsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWalletItemStore2_add_ItemsChanged_Interface
      ; sender : Windows.ApplicationModel.Wallet.IWalletItemStore
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWalletItemStore : aliased constant Windows.IID := (1395955550, 8282, 23404, (150, 253, 137, 111, 185, 57, 73, 189 ));
   
   type AsyncOperationCompletedHandler_IWalletItemStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItemStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWalletItemStore'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWalletItemStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItemStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WalletBarcode is Windows.ApplicationModel.Wallet.IWalletBarcode;
   function CreateWalletBarcode
   (
      symbology : Windows.ApplicationModel.Wallet.WalletBarcodeSymbology
      ; value : Windows.String
   )
   return Windows.ApplicationModel.Wallet.IWalletBarcode;
   
   function CreateCustomWalletBarcode
   (
      streamToBarcodeImage : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.ApplicationModel.Wallet.IWalletBarcode;
   
   subtype WalletTransaction is Windows.ApplicationModel.Wallet.IWalletTransaction;
   function CreateWalletTransaction return Windows.ApplicationModel.Wallet.IWalletTransaction;
   
   subtype WalletRelevantLocation is Windows.ApplicationModel.Wallet.IWalletRelevantLocation;
   function CreateWalletRelevantLocation return Windows.ApplicationModel.Wallet.IWalletRelevantLocation;
   
   subtype WalletItemCustomProperty is Windows.ApplicationModel.Wallet.IWalletItemCustomProperty;
   function CreateWalletItemCustomProperty
   (
      name : Windows.String
      ; value : Windows.String
   )
   return Windows.ApplicationModel.Wallet.IWalletItemCustomProperty;
   
   subtype WalletVerb is Windows.ApplicationModel.Wallet.IWalletVerb;
   function CreateWalletVerb
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Wallet.IWalletVerb;
   
   subtype WalletItem is Windows.ApplicationModel.Wallet.IWalletItem;
   function CreateWalletItem
   (
      kind : Windows.ApplicationModel.Wallet.WalletItemKind
      ; displayName : Windows.String
   )
   return Windows.ApplicationModel.Wallet.IWalletItem;
   
   subtype WalletItemStore is Windows.ApplicationModel.Wallet.IWalletItemStore;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function RequestStoreAsync
   return Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItemStore;
   
end;
