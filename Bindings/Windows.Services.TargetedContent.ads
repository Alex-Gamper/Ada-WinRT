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
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Services.TargetedContent is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type TargetedContentInteraction is (
      Impression,
      ClickThrough,
      Hover,
      Like,
      Dislike,
      Dismiss,
      Ineligible,
      Accept_x,
      Decline,
      Defer,
      Canceled,
      Conversion,
      Opportunity
   );
   for TargetedContentInteraction use (
      Impression => 0,
      ClickThrough => 1,
      Hover => 2,
      Like => 3,
      Dislike => 4,
      Dismiss => 5,
      Ineligible => 6,
      Accept_x => 7,
      Decline => 8,
      Defer => 9,
      Canceled => 10,
      Conversion => 11,
      Opportunity => 12
   );
   for TargetedContentInteraction'Size use 32;
   
   type TargetedContentInteraction_Ptr is access TargetedContentInteraction;
   
   type TargetedContentValueKind is (
      String,
      Uri,
      Number,
      Boolean,
      File,
      ImageFile,
      Action,
      Strings,
      Uris,
      Numbers,
      Booleans,
      Files,
      ImageFiles,
      Actions
   );
   for TargetedContentValueKind use (
      String => 0,
      Uri => 1,
      Number => 2,
      Boolean => 3,
      File => 4,
      ImageFile => 5,
      Action => 6,
      Strings => 7,
      Uris => 8,
      Numbers => 9,
      Booleans => 10,
      Files => 11,
      ImageFiles => 12,
      Actions => 13
   );
   for TargetedContentValueKind'Size use 32;
   
   type TargetedContentValueKind_Ptr is access TargetedContentValueKind;
   
   type TargetedContentObjectKind is (
      Collection,
      Item,
      Value
   );
   for TargetedContentObjectKind use (
      Collection => 0,
      Item => 1,
      Value => 2
   );
   for TargetedContentObjectKind'Size use 32;
   
   type TargetedContentObjectKind_Ptr is access TargetedContentObjectKind;
   
   type TargetedContentAvailability is (
      None,
      Partial,
      All_x
   );
   for TargetedContentAvailability use (
      None => 0,
      Partial => 1,
      All_x => 2
   );
   for TargetedContentAvailability'Size use 32;
   
   type TargetedContentAvailability_Ptr is access TargetedContentAvailability;
   
   type TargetedContentAppInstallationState is (
      NotApplicable,
      NotInstalled,
      Installed
   );
   for TargetedContentAppInstallationState use (
      NotApplicable => 0,
      NotInstalled => 1,
      Installed => 2
   );
   for TargetedContentAppInstallationState'Size use 32;
   
   type TargetedContentAppInstallationState_Ptr is access TargetedContentAppInstallationState;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type TargetedContentContract is null record;
   pragma Convention (C_Pass_By_Copy , TargetedContentContract);
   
   type TargetedContentContract_Ptr is access TargetedContentContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ITargetedContentSubscription_Interface;
   type AsyncOperationCompletedHandler_ITargetedContentSubscription is access all AsyncOperationCompletedHandler_ITargetedContentSubscription_Interface'Class;
   type AsyncOperationCompletedHandler_ITargetedContentSubscription_Ptr is access all AsyncOperationCompletedHandler_ITargetedContentSubscription;
   type AsyncOperationCompletedHandler_ITargetedContentContainer_Interface;
   type AsyncOperationCompletedHandler_ITargetedContentContainer is access all AsyncOperationCompletedHandler_ITargetedContentContainer_Interface'Class;
   type AsyncOperationCompletedHandler_ITargetedContentContainer_Ptr is access all AsyncOperationCompletedHandler_ITargetedContentContainer;
   type TypedEventHandler_ITargetedContentSubscription_add_ContentChanged_Interface;
   type TypedEventHandler_ITargetedContentSubscription_add_ContentChanged is access all TypedEventHandler_ITargetedContentSubscription_add_ContentChanged_Interface'Class;
   type TypedEventHandler_ITargetedContentSubscription_add_ContentChanged_Ptr is access all TypedEventHandler_ITargetedContentSubscription_add_ContentChanged;
   type TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged_Interface;
   type TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged is access all TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged_Interface'Class;
   type TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged_Ptr is access all TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged;
   type TypedEventHandler_ITargetedContentSubscription_add_StateChanged_Interface;
   type TypedEventHandler_ITargetedContentSubscription_add_StateChanged is access all TypedEventHandler_ITargetedContentSubscription_add_StateChanged_Interface'Class;
   type TypedEventHandler_ITargetedContentSubscription_add_StateChanged_Ptr is access all TypedEventHandler_ITargetedContentSubscription_add_StateChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ITargetedContentSubscriptionOptions_Interface;
   type ITargetedContentSubscriptionOptions is access all ITargetedContentSubscriptionOptions_Interface'Class;
   type ITargetedContentSubscriptionOptions_Ptr is access all ITargetedContentSubscriptionOptions;
   type ITargetedContentSubscriptionStatics_Interface;
   type ITargetedContentSubscriptionStatics is access all ITargetedContentSubscriptionStatics_Interface'Class;
   type ITargetedContentSubscriptionStatics_Ptr is access all ITargetedContentSubscriptionStatics;
   type ITargetedContentSubscription_Interface;
   type ITargetedContentSubscription is access all ITargetedContentSubscription_Interface'Class;
   type ITargetedContentSubscription_Ptr is access all ITargetedContentSubscription;
   type ITargetedContentChangedEventArgs_Interface;
   type ITargetedContentChangedEventArgs is access all ITargetedContentChangedEventArgs_Interface'Class;
   type ITargetedContentChangedEventArgs_Ptr is access all ITargetedContentChangedEventArgs;
   type ITargetedContentAvailabilityChangedEventArgs_Interface;
   type ITargetedContentAvailabilityChangedEventArgs is access all ITargetedContentAvailabilityChangedEventArgs_Interface'Class;
   type ITargetedContentAvailabilityChangedEventArgs_Ptr is access all ITargetedContentAvailabilityChangedEventArgs;
   type ITargetedContentStateChangedEventArgs_Interface;
   type ITargetedContentStateChangedEventArgs is access all ITargetedContentStateChangedEventArgs_Interface'Class;
   type ITargetedContentStateChangedEventArgs_Ptr is access all ITargetedContentStateChangedEventArgs;
   type ITargetedContentImage_Interface;
   type ITargetedContentImage is access all ITargetedContentImage_Interface'Class;
   type ITargetedContentImage_Ptr is access all ITargetedContentImage;
   type ITargetedContentAction_Interface;
   type ITargetedContentAction is access all ITargetedContentAction_Interface'Class;
   type ITargetedContentAction_Ptr is access all ITargetedContentAction;
   type ITargetedContentContainerStatics_Interface;
   type ITargetedContentContainerStatics is access all ITargetedContentContainerStatics_Interface'Class;
   type ITargetedContentContainerStatics_Ptr is access all ITargetedContentContainerStatics;
   type ITargetedContentContainer_Interface;
   type ITargetedContentContainer is access all ITargetedContentContainer_Interface'Class;
   type ITargetedContentContainer_Ptr is access all ITargetedContentContainer;
   type ITargetedContentObject_Interface;
   type ITargetedContentObject is access all ITargetedContentObject_Interface'Class;
   type ITargetedContentObject_Ptr is access all ITargetedContentObject;
   type ITargetedContentCollection_Interface;
   type ITargetedContentCollection is access all ITargetedContentCollection_Interface'Class;
   type ITargetedContentCollection_Ptr is access all ITargetedContentCollection;
   type ITargetedContentItemState_Interface;
   type ITargetedContentItemState is access all ITargetedContentItemState_Interface'Class;
   type ITargetedContentItemState_Ptr is access all ITargetedContentItemState;
   type ITargetedContentItem_Interface;
   type ITargetedContentItem is access all ITargetedContentItem_Interface'Class;
   type ITargetedContentItem_Ptr is access all ITargetedContentItem;
   type ITargetedContentValue_Interface;
   type ITargetedContentValue is access all ITargetedContentValue_Interface'Class;
   type ITargetedContentValue_Ptr is access all ITargetedContentValue;
   type IRandomAccessStreamReference_Imported_Interface;
   type IRandomAccessStreamReference_Imported is access all IRandomAccessStreamReference_Imported_Interface'Class;
   type IRandomAccessStreamReference_Imported_Ptr is access all IRandomAccessStreamReference_Imported;
   type IAsyncOperation_ITargetedContentSubscription_Interface;
   type IAsyncOperation_ITargetedContentSubscription is access all IAsyncOperation_ITargetedContentSubscription_Interface'Class;
   type IAsyncOperation_ITargetedContentSubscription_Ptr is access all IAsyncOperation_ITargetedContentSubscription;
   type IAsyncOperation_ITargetedContentContainer_Interface;
   type IAsyncOperation_ITargetedContentContainer is access all IAsyncOperation_ITargetedContentContainer_Interface'Class;
   type IAsyncOperation_ITargetedContentContainer_Ptr is access all IAsyncOperation_ITargetedContentContainer;
   type IIterator_ITargetedContentCollection_Interface;
   type IIterator_ITargetedContentCollection is access all IIterator_ITargetedContentCollection_Interface'Class;
   type IIterator_ITargetedContentCollection_Ptr is access all IIterator_ITargetedContentCollection;
   type IIterable_ITargetedContentCollection_Interface;
   type IIterable_ITargetedContentCollection is access all IIterable_ITargetedContentCollection_Interface'Class;
   type IIterable_ITargetedContentCollection_Ptr is access all IIterable_ITargetedContentCollection;
   type IVectorView_ITargetedContentCollection_Interface;
   type IVectorView_ITargetedContentCollection is access all IVectorView_ITargetedContentCollection_Interface'Class;
   type IVectorView_ITargetedContentCollection_Ptr is access all IVectorView_ITargetedContentCollection;
   type IIterator_ITargetedContentItem_Interface;
   type IIterator_ITargetedContentItem is access all IIterator_ITargetedContentItem_Interface'Class;
   type IIterator_ITargetedContentItem_Ptr is access all IIterator_ITargetedContentItem;
   type IIterable_ITargetedContentItem_Interface;
   type IIterable_ITargetedContentItem is access all IIterable_ITargetedContentItem_Interface'Class;
   type IIterable_ITargetedContentItem_Ptr is access all IIterable_ITargetedContentItem;
   type IVectorView_ITargetedContentItem_Interface;
   type IVectorView_ITargetedContentItem is access all IVectorView_ITargetedContentItem_Interface'Class;
   type IVectorView_ITargetedContentItem_Ptr is access all IVectorView_ITargetedContentItem;
   type IIterator_ITargetedContentImage_Interface;
   type IIterator_ITargetedContentImage is access all IIterator_ITargetedContentImage_Interface'Class;
   type IIterator_ITargetedContentImage_Ptr is access all IIterator_ITargetedContentImage;
   type IIterable_ITargetedContentImage_Interface;
   type IIterable_ITargetedContentImage is access all IIterable_ITargetedContentImage_Interface'Class;
   type IIterable_ITargetedContentImage_Ptr is access all IIterable_ITargetedContentImage;
   type IVectorView_ITargetedContentImage_Interface;
   type IVectorView_ITargetedContentImage is access all IVectorView_ITargetedContentImage_Interface'Class;
   type IVectorView_ITargetedContentImage_Ptr is access all IVectorView_ITargetedContentImage;
   type IIterator_ITargetedContentAction_Interface;
   type IIterator_ITargetedContentAction is access all IIterator_ITargetedContentAction_Interface'Class;
   type IIterator_ITargetedContentAction_Ptr is access all IIterator_ITargetedContentAction;
   type IIterable_ITargetedContentAction_Interface;
   type IIterable_ITargetedContentAction is access all IIterable_ITargetedContentAction_Interface'Class;
   type IIterable_ITargetedContentAction_Ptr is access all IIterable_ITargetedContentAction;
   type IVectorView_ITargetedContentAction_Interface;
   type IVectorView_ITargetedContentAction is access all IVectorView_ITargetedContentAction_Interface'Class;
   type IVectorView_ITargetedContentAction_Ptr is access all IVectorView_ITargetedContentAction;
   
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
   
   IID_ITargetedContentSubscriptionOptions : aliased constant Windows.IID := (1643014864, 11395, 16923, (132, 103, 65, 62, 175, 26, 235, 151 ));
   
   type ITargetedContentSubscriptionOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SubscriptionId
   (
      This       : access ITargetedContentSubscriptionOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowPartialContentAvailability
   (
      This       : access ITargetedContentSubscriptionOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowPartialContentAvailability
   (
      This       : access ITargetedContentSubscriptionOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CloudQueryParameters
   (
      This       : access ITargetedContentSubscriptionOptions_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalFilters
   (
      This       : access ITargetedContentSubscriptionOptions_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Update
   (
      This       : access ITargetedContentSubscriptionOptions_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentSubscriptionStatics : aliased constant Windows.IID := (4208852608, 13837, 18710, (181, 60, 126, 162, 112, 144, 208, 42 ));
   
   type ITargetedContentSubscriptionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAsync
   (
      This       : access ITargetedContentSubscriptionStatics_Interface
      ; subscriptionId : Windows.String
      ; RetVal : access Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentSubscription -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetOptions
   (
      This       : access ITargetedContentSubscriptionStatics_Interface
      ; subscriptionId : Windows.String
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentSubscriptionOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentSubscription : aliased constant Windows.IID := (2284596297, 50770, 19578, (172, 173, 31, 127, 162, 152, 108, 115 ));
   
   type ITargetedContentSubscription_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ITargetedContentSubscription_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetContentContainerAsync
   (
      This       : access ITargetedContentSubscription_Interface
      ; RetVal : access Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentContainer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ContentChanged
   (
      This       : access ITargetedContentSubscription_Interface
      ; handler : TypedEventHandler_ITargetedContentSubscription_add_ContentChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ContentChanged
   (
      This       : access ITargetedContentSubscription_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AvailabilityChanged
   (
      This       : access ITargetedContentSubscription_Interface
      ; handler : TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AvailabilityChanged
   (
      This       : access ITargetedContentSubscription_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StateChanged
   (
      This       : access ITargetedContentSubscription_Interface
      ; handler : TypedEventHandler_ITargetedContentSubscription_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access ITargetedContentSubscription_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentChangedEventArgs : aliased constant Windows.IID := (2580842697, 22654, 17798, (142, 247, 181, 76, 169, 69, 58, 22 ));
   
   type ITargetedContentChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access ITargetedContentChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   function get_HasPreviousContentExpired
   (
      This       : access ITargetedContentChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentAvailabilityChangedEventArgs : aliased constant Windows.IID := (3774192934, 22823, 17488, (150, 92, 28, 235, 123, 236, 222, 101 ));
   
   type ITargetedContentAvailabilityChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access ITargetedContentAvailabilityChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentStateChangedEventArgs : aliased constant Windows.IID := (2585587517, 32883, 17430, (141, 242, 84, 104, 53, 166, 65, 79 ));
   
   type ITargetedContentStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access ITargetedContentStateChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentImage : aliased constant Windows.IID := (2812642777, 30623, 19230, (187, 177, 142, 175, 83, 251, 234, 178 ));
   
   type ITargetedContentImage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Height
   (
      This       : access ITargetedContentImage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access ITargetedContentImage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentAction : aliased constant Windows.IID := (3613092126, 27862, 19616, (157, 143, 71, 40, 176, 183, 230, 182 ));
   
   type ITargetedContentAction_Interface is interface and Windows.IInspectable_Interface;
   
   function InvokeAsync
   (
      This       : access ITargetedContentAction_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentContainerStatics : aliased constant Windows.IID := (1531439099, 8512, 19487, (167, 54, 197, 149, 131, 242, 39, 216 ));
   
   type ITargetedContentContainerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAsync
   (
      This       : access ITargetedContentContainerStatics_Interface
      ; contentId : Windows.String
      ; RetVal : access Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentContainer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentContainer : aliased constant Windows.IID := (3156513993, 34871, 18370, (133, 15, 215, 157, 100, 89, 89, 38 ));
   
   type ITargetedContentContainer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ITargetedContentContainer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access ITargetedContentContainer_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Availability
   (
      This       : access ITargetedContentContainer_Interface
      ; RetVal : access Windows.Services.TargetedContent.TargetedContentAvailability
   )
   return Windows.HRESULT is abstract;
   
   function get_Content
   (
      This       : access ITargetedContentContainer_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentCollection
   )
   return Windows.HRESULT is abstract;
   
   function SelectSingleObject
   (
      This       : access ITargetedContentContainer_Interface
      ; path : Windows.String
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentObject : aliased constant Windows.IID := (69040489, 8722, 17105, (157, 250, 136, 168, 227, 3, 58, 163 ));
   
   type ITargetedContentObject_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ObjectKind
   (
      This       : access ITargetedContentObject_Interface
      ; RetVal : access Windows.Services.TargetedContent.TargetedContentObjectKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Collection
   (
      This       : access ITargetedContentObject_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Item
   (
      This       : access ITargetedContentObject_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access ITargetedContentObject_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentCollection : aliased constant Windows.IID := (759916229, 61795, 17594, (159, 110, 225, 164, 194, 187, 85, 157 ));
   
   type ITargetedContentCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ITargetedContentCollection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportInteraction
   (
      This       : access ITargetedContentCollection_Interface
      ; interaction : Windows.Services.TargetedContent.TargetedContentInteraction
   )
   return Windows.HRESULT is abstract;
   
   function ReportCustomInteraction
   (
      This       : access ITargetedContentCollection_Interface
      ; customInteractionName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access ITargetedContentCollection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access ITargetedContentCollection_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Collections
   (
      This       : access ITargetedContentCollection_Interface
      ; RetVal : access Windows.Services.TargetedContent.IVectorView_ITargetedContentCollection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Items
   (
      This       : access ITargetedContentCollection_Interface
      ; RetVal : access Windows.Services.TargetedContent.IVectorView_ITargetedContentItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentItemState : aliased constant Windows.IID := (1939035220, 19557, 19271, (164, 65, 71, 45, 229, 60, 121, 182 ));
   
   type ITargetedContentItemState_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ShouldDisplay
   (
      This       : access ITargetedContentItemState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AppInstallationState
   (
      This       : access ITargetedContentItemState_Interface
      ; RetVal : access Windows.Services.TargetedContent.TargetedContentAppInstallationState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentItem : aliased constant Windows.IID := (941002180, 10092, 19506, (150, 186, 86, 92, 110, 64, 110, 116 ));
   
   type ITargetedContentItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Path
   (
      This       : access ITargetedContentItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReportInteraction
   (
      This       : access ITargetedContentItem_Interface
      ; interaction : Windows.Services.TargetedContent.TargetedContentInteraction
   )
   return Windows.HRESULT is abstract;
   
   function ReportCustomInteraction
   (
      This       : access ITargetedContentItem_Interface
      ; customInteractionName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access ITargetedContentItem_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentItemState
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access ITargetedContentItem_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Collections
   (
      This       : access ITargetedContentItem_Interface
      ; RetVal : access Windows.Services.TargetedContent.IVectorView_ITargetedContentCollection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetedContentValue : aliased constant Windows.IID := (2868765875, 16917, 19448, (134, 127, 67, 240, 72, 101, 249, 191 ));
   
   type ITargetedContentValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ValueKind
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Services.TargetedContent.TargetedContentValueKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_String
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Number
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Boolean
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_File
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_ImageFile
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentImage
   )
   return Windows.HRESULT is abstract;
   
   function get_Action
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Strings
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Uris
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Foundation.IVectorView_IUriRuntimeClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Numbers
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Booleans
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Files
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Storage.Streams.IVectorView_IRandomAccessStreamReference -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ImageFiles
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Services.TargetedContent.IVectorView_ITargetedContentImage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Actions
   (
      This       : access ITargetedContentValue_Interface
      ; RetVal : access Windows.Services.TargetedContent.IVectorView_ITargetedContentAction -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IRandomAccessStreamReference_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenReadAsync
   (
      This       : access IRandomAccessStreamReference_Imported_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ITargetedContentSubscription : aliased constant Windows.IID := (1190227787, 36545, 23631, (177, 245, 167, 231, 172, 214, 51, 102 ));
   
   type IAsyncOperation_ITargetedContentSubscription_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ITargetedContentSubscription_Interface
      ; handler : Windows.Services.TargetedContent.AsyncOperationCompletedHandler_ITargetedContentSubscription
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ITargetedContentSubscription_Interface
      ; RetVal : access Windows.Services.TargetedContent.AsyncOperationCompletedHandler_ITargetedContentSubscription
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ITargetedContentSubscription_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentSubscription
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ITargetedContentContainer : aliased constant Windows.IID := (3881296124, 310, 24419, (151, 184, 106, 150, 184, 208, 96, 30 ));
   
   type IAsyncOperation_ITargetedContentContainer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ITargetedContentContainer_Interface
      ; handler : Windows.Services.TargetedContent.AsyncOperationCompletedHandler_ITargetedContentContainer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ITargetedContentContainer_Interface
      ; RetVal : access Windows.Services.TargetedContent.AsyncOperationCompletedHandler_ITargetedContentContainer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ITargetedContentContainer_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentContainer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ITargetedContentCollection : aliased constant Windows.IID := (1620293885, 27997, 21453, (180, 151, 123, 69, 64, 241, 8, 87 ));
   
   type IIterator_ITargetedContentCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ITargetedContentCollection_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ITargetedContentCollection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ITargetedContentCollection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ITargetedContentCollection_Interface
      ; items : Windows.Services.TargetedContent.ITargetedContentCollection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ITargetedContentCollection : aliased constant Windows.IID := (541718547, 14318, 20824, (153, 150, 112, 152, 89, 240, 206, 73 ));
   
   type IIterable_ITargetedContentCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ITargetedContentCollection_Interface
      ; RetVal : access Windows.Services.TargetedContent.IIterator_ITargetedContentCollection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ITargetedContentCollection : aliased constant Windows.IID := (3466905689, 34614, 23669, (187, 131, 166, 134, 191, 127, 124, 111 ));
   
   type IVectorView_ITargetedContentCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ITargetedContentCollection_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ITargetedContentCollection_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ITargetedContentCollection_Interface
      ; value : Windows.Services.TargetedContent.ITargetedContentCollection
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ITargetedContentCollection_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.TargetedContent.ITargetedContentCollection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ITargetedContentItem : aliased constant Windows.IID := (1343266190, 63249, 20598, (131, 9, 228, 226, 48, 239, 126, 133 ));
   
   type IIterator_ITargetedContentItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ITargetedContentItem_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ITargetedContentItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ITargetedContentItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ITargetedContentItem_Interface
      ; items : Windows.Services.TargetedContent.ITargetedContentItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ITargetedContentItem : aliased constant Windows.IID := (66293686, 21734, 23537, (145, 59, 149, 16, 254, 200, 190, 31 ));
   
   type IIterable_ITargetedContentItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ITargetedContentItem_Interface
      ; RetVal : access Windows.Services.TargetedContent.IIterator_ITargetedContentItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ITargetedContentItem : aliased constant Windows.IID := (837020979, 34132, 21654, (134, 164, 215, 131, 146, 32, 76, 143 ));
   
   type IVectorView_ITargetedContentItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ITargetedContentItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ITargetedContentItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ITargetedContentItem_Interface
      ; value : Windows.Services.TargetedContent.ITargetedContentItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ITargetedContentItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.TargetedContent.ITargetedContentItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ITargetedContentImage : aliased constant Windows.IID := (2819076760, 40495, 22131, (188, 246, 30, 53, 254, 186, 6, 71 ));
   
   type IIterator_ITargetedContentImage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ITargetedContentImage_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentImage
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ITargetedContentImage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ITargetedContentImage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ITargetedContentImage_Interface
      ; items : Windows.Services.TargetedContent.ITargetedContentImage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ITargetedContentImage : aliased constant Windows.IID := (4021139135, 44824, 23289, (165, 9, 25, 136, 27, 197, 134, 245 ));
   
   type IIterable_ITargetedContentImage_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ITargetedContentImage_Interface
      ; RetVal : access Windows.Services.TargetedContent.IIterator_ITargetedContentImage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ITargetedContentImage : aliased constant Windows.IID := (4116367302, 5773, 20496, (132, 207, 54, 191, 69, 30, 222, 56 ));
   
   type IVectorView_ITargetedContentImage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ITargetedContentImage_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentImage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ITargetedContentImage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ITargetedContentImage_Interface
      ; value : Windows.Services.TargetedContent.ITargetedContentImage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ITargetedContentImage_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.TargetedContent.ITargetedContentImage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ITargetedContentAction : aliased constant Windows.IID := (2036689205, 22547, 23206, (142, 105, 98, 122, 13, 133, 8, 143 ));
   
   type IIterator_ITargetedContentAction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ITargetedContentAction_Interface
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentAction
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ITargetedContentAction_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ITargetedContentAction_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ITargetedContentAction_Interface
      ; items : Windows.Services.TargetedContent.ITargetedContentAction_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ITargetedContentAction : aliased constant Windows.IID := (3473257623, 15101, 23808, (133, 158, 159, 189, 26, 54, 213, 118 ));
   
   type IIterable_ITargetedContentAction_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ITargetedContentAction_Interface
      ; RetVal : access Windows.Services.TargetedContent.IIterator_ITargetedContentAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ITargetedContentAction : aliased constant Windows.IID := (1117371780, 58446, 24523, (164, 101, 225, 189, 67, 74, 49, 124 ));
   
   type IVectorView_ITargetedContentAction_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ITargetedContentAction_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.TargetedContent.ITargetedContentAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ITargetedContentAction_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ITargetedContentAction_Interface
      ; value : Windows.Services.TargetedContent.ITargetedContentAction
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ITargetedContentAction_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.TargetedContent.ITargetedContentAction_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ITargetedContentSubscription : aliased constant Windows.IID := (3826814065, 23182, 22508, (176, 222, 29, 49, 79, 179, 226, 207 ));
   
   type AsyncOperationCompletedHandler_ITargetedContentSubscription_Interface(Callback : access procedure (asyncInfo : Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentSubscription ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ITargetedContentSubscription'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ITargetedContentSubscription_Interface
      ; asyncInfo : Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentSubscription
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ITargetedContentContainer : aliased constant Windows.IID := (2412166186, 9934, 20661, (151, 187, 252, 200, 12, 160, 135, 29 ));
   
   type AsyncOperationCompletedHandler_ITargetedContentContainer_Interface(Callback : access procedure (asyncInfo : Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentContainer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ITargetedContentContainer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ITargetedContentContainer_Interface
      ; asyncInfo : Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentContainer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ITargetedContentSubscription_add_ContentChanged : aliased constant Windows.IID := (4010923857, 40278, 22541, (138, 159, 81, 174, 126, 128, 54, 227 ));
   
   type TypedEventHandler_ITargetedContentSubscription_add_ContentChanged_Interface(Callback : access procedure (sender : Windows.Services.TargetedContent.ITargetedContentSubscription ; args : Windows.Services.TargetedContent.ITargetedContentChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ITargetedContentSubscription_add_ContentChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ITargetedContentSubscription_add_ContentChanged_Interface
      ; sender : Windows.Services.TargetedContent.ITargetedContentSubscription
      ; args : Windows.Services.TargetedContent.ITargetedContentChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged : aliased constant Windows.IID := (2576521476, 5002, 22956, (161, 26, 254, 0, 66, 240, 253, 80 ));
   
   type TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged_Interface(Callback : access procedure (sender : Windows.Services.TargetedContent.ITargetedContentSubscription ; args : Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged_Interface
      ; sender : Windows.Services.TargetedContent.ITargetedContentSubscription
      ; args : Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ITargetedContentSubscription_add_StateChanged : aliased constant Windows.IID := (3302337726, 63067, 24484, (146, 66, 210, 134, 13, 232, 93, 82 ));
   
   type TypedEventHandler_ITargetedContentSubscription_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Services.TargetedContent.ITargetedContentSubscription ; args : Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ITargetedContentSubscription_add_StateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ITargetedContentSubscription_add_StateChanged_Interface
      ; sender : Windows.Services.TargetedContent.ITargetedContentSubscription
      ; args : Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype TargetedContentSubscription is Windows.Services.TargetedContent.ITargetedContentSubscription;
   subtype TargetedContentSubscriptionOptions is Windows.Services.TargetedContent.ITargetedContentSubscriptionOptions;
   subtype TargetedContentContainer is Windows.Services.TargetedContent.ITargetedContentContainer;
   subtype TargetedContentChangedEventArgs is Windows.Services.TargetedContent.ITargetedContentChangedEventArgs;
   subtype TargetedContentAvailabilityChangedEventArgs is Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs;
   subtype TargetedContentStateChangedEventArgs is Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs;
   subtype TargetedContentCollection is Windows.Services.TargetedContent.ITargetedContentCollection;
   subtype TargetedContentObject is Windows.Services.TargetedContent.ITargetedContentObject;
   subtype TargetedContentItem is Windows.Services.TargetedContent.ITargetedContentItem;
   subtype TargetedContentValue is Windows.Services.TargetedContent.ITargetedContentValue;
   subtype TargetedContentItemState is Windows.Services.TargetedContent.ITargetedContentItemState;
   subtype TargetedContentFile is Windows.Storage.Streams.IRandomAccessStreamReference;
   subtype TargetedContentImage is Windows.Services.TargetedContent.ITargetedContentImage;
   subtype TargetedContentAction is Windows.Services.TargetedContent.ITargetedContentAction;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetAsync
   (
      subscriptionId : Windows.String
   )
   return Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentSubscription;
   
   function GetOptions
   (
      subscriptionId : Windows.String
   )
   return Windows.Services.TargetedContent.ITargetedContentSubscriptionOptions;
   
   function GetAsync
   (
      contentId : Windows.String
   )
   return Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentContainer;
   

end;
