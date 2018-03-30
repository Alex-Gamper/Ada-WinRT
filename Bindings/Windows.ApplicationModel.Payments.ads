--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Payments is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PaymentRequestStatus is (
      Succeeded,
      Failed,
      Canceled
   );
   for PaymentRequestStatus use (
      Succeeded => 0,
      Failed => 1,
      Canceled => 2
   );
   for PaymentRequestStatus'Size use 32;
   
   type PaymentRequestStatus_Ptr is access PaymentRequestStatus;
   
   type PaymentRequestCompletionStatus is (
      Succeeded,
      Failed,
      Unknown
   );
   for PaymentRequestCompletionStatus use (
      Succeeded => 0,
      Failed => 1,
      Unknown => 2
   );
   for PaymentRequestCompletionStatus'Size use 32;
   
   type PaymentRequestCompletionStatus_Ptr is access PaymentRequestCompletionStatus;
   
   type PaymentRequestChangeKind is (
      ShippingOption,
      ShippingAddress
   );
   for PaymentRequestChangeKind use (
      ShippingOption => 0,
      ShippingAddress => 1
   );
   for PaymentRequestChangeKind'Size use 32;
   
   type PaymentRequestChangeKind_Ptr is access PaymentRequestChangeKind;
   
   type PaymentOptionPresence is (
      None,
      Optional,
      Required
   );
   for PaymentOptionPresence use (
      None => 0,
      Optional => 1,
      Required => 2
   );
   for PaymentOptionPresence'Size use 32;
   
   type PaymentOptionPresence_Ptr is access PaymentOptionPresence;
   
   type PaymentShippingType is (
      Shipping,
      Delivery,
      Pickup
   );
   for PaymentShippingType use (
      Shipping => 0,
      Delivery => 1,
      Pickup => 2
   );
   for PaymentShippingType'Size use 32;
   
   type PaymentShippingType_Ptr is access PaymentShippingType;
   
   type PaymentCanMakePaymentResultStatus is (
      Unknown,
      Yes,
      No,
      NotAllowed,
      UserNotSignedIn,
      SpecifiedPaymentMethodIdsNotSupported,
      NoQualifyingCardOnFile
   );
   for PaymentCanMakePaymentResultStatus use (
      Unknown => 0,
      Yes => 1,
      No => 2,
      NotAllowed => 3,
      UserNotSignedIn => 4,
      SpecifiedPaymentMethodIdsNotSupported => 5,
      NoQualifyingCardOnFile => 6
   );
   for PaymentCanMakePaymentResultStatus'Size use 32;
   
   type PaymentCanMakePaymentResultStatus_Ptr is access PaymentCanMakePaymentResultStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type PaymentRequestChangedHandler_Interface;
   type PaymentRequestChangedHandler is access all PaymentRequestChangedHandler_Interface'Class;
   type PaymentRequestChangedHandler_Ptr is access all PaymentRequestChangedHandler;
   type AsyncOperationCompletedHandler_IPaymentRequestChangedResult_Interface;
   type AsyncOperationCompletedHandler_IPaymentRequestChangedResult is access all AsyncOperationCompletedHandler_IPaymentRequestChangedResult_Interface'Class;
   type AsyncOperationCompletedHandler_IPaymentRequestChangedResult_Ptr is access all AsyncOperationCompletedHandler_IPaymentRequestChangedResult;
   type AsyncOperationCompletedHandler_IPaymentRequestSubmitResult_Interface;
   type AsyncOperationCompletedHandler_IPaymentRequestSubmitResult is access all AsyncOperationCompletedHandler_IPaymentRequestSubmitResult_Interface'Class;
   type AsyncOperationCompletedHandler_IPaymentRequestSubmitResult_Ptr is access all AsyncOperationCompletedHandler_IPaymentRequestSubmitResult;
   type AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult_Interface;
   type AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult is access all AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult_Interface'Class;
   type AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult_Ptr is access all AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPaymentRequest_Interface;
   type IPaymentRequest is access all IPaymentRequest_Interface'Class;
   type IPaymentRequest_Ptr is access all IPaymentRequest;
   type IPaymentRequest2_Interface;
   type IPaymentRequest2 is access all IPaymentRequest2_Interface'Class;
   type IPaymentRequest2_Ptr is access all IPaymentRequest2;
   type IPaymentRequestFactory_Interface;
   type IPaymentRequestFactory is access all IPaymentRequestFactory_Interface'Class;
   type IPaymentRequestFactory_Ptr is access all IPaymentRequestFactory;
   type IPaymentRequestFactory2_Interface;
   type IPaymentRequestFactory2 is access all IPaymentRequestFactory2_Interface'Class;
   type IPaymentRequestFactory2_Ptr is access all IPaymentRequestFactory2;
   type IPaymentResponse_Interface;
   type IPaymentResponse is access all IPaymentResponse_Interface'Class;
   type IPaymentResponse_Ptr is access all IPaymentResponse;
   type IPaymentDetails_Interface;
   type IPaymentDetails is access all IPaymentDetails_Interface'Class;
   type IPaymentDetails_Ptr is access all IPaymentDetails;
   type IPaymentDetailsFactory_Interface;
   type IPaymentDetailsFactory is access all IPaymentDetailsFactory_Interface'Class;
   type IPaymentDetailsFactory_Ptr is access all IPaymentDetailsFactory;
   type IPaymentDetailsModifier_Interface;
   type IPaymentDetailsModifier is access all IPaymentDetailsModifier_Interface'Class;
   type IPaymentDetailsModifier_Ptr is access all IPaymentDetailsModifier;
   type IPaymentDetailsModifierFactory_Interface;
   type IPaymentDetailsModifierFactory is access all IPaymentDetailsModifierFactory_Interface'Class;
   type IPaymentDetailsModifierFactory_Ptr is access all IPaymentDetailsModifierFactory;
   type IPaymentToken_Interface;
   type IPaymentToken is access all IPaymentToken_Interface'Class;
   type IPaymentToken_Ptr is access all IPaymentToken;
   type IPaymentTokenFactory_Interface;
   type IPaymentTokenFactory is access all IPaymentTokenFactory_Interface'Class;
   type IPaymentTokenFactory_Ptr is access all IPaymentTokenFactory;
   type IPaymentMethodData_Interface;
   type IPaymentMethodData is access all IPaymentMethodData_Interface'Class;
   type IPaymentMethodData_Ptr is access all IPaymentMethodData;
   type IPaymentMethodDataFactory_Interface;
   type IPaymentMethodDataFactory is access all IPaymentMethodDataFactory_Interface'Class;
   type IPaymentMethodDataFactory_Ptr is access all IPaymentMethodDataFactory;
   type IPaymentCurrencyAmount_Interface;
   type IPaymentCurrencyAmount is access all IPaymentCurrencyAmount_Interface'Class;
   type IPaymentCurrencyAmount_Ptr is access all IPaymentCurrencyAmount;
   type IPaymentCurrencyAmountFactory_Interface;
   type IPaymentCurrencyAmountFactory is access all IPaymentCurrencyAmountFactory_Interface'Class;
   type IPaymentCurrencyAmountFactory_Ptr is access all IPaymentCurrencyAmountFactory;
   type IPaymentItem_Interface;
   type IPaymentItem is access all IPaymentItem_Interface'Class;
   type IPaymentItem_Ptr is access all IPaymentItem;
   type IPaymentItemFactory_Interface;
   type IPaymentItemFactory is access all IPaymentItemFactory_Interface'Class;
   type IPaymentItemFactory_Ptr is access all IPaymentItemFactory;
   type IPaymentShippingOption_Interface;
   type IPaymentShippingOption is access all IPaymentShippingOption_Interface'Class;
   type IPaymentShippingOption_Ptr is access all IPaymentShippingOption;
   type IPaymentShippingOptionFactory_Interface;
   type IPaymentShippingOptionFactory is access all IPaymentShippingOptionFactory_Interface'Class;
   type IPaymentShippingOptionFactory_Ptr is access all IPaymentShippingOptionFactory;
   type IPaymentAddress_Interface;
   type IPaymentAddress is access all IPaymentAddress_Interface'Class;
   type IPaymentAddress_Ptr is access all IPaymentAddress;
   type IPaymentMerchantInfo_Interface;
   type IPaymentMerchantInfo is access all IPaymentMerchantInfo_Interface'Class;
   type IPaymentMerchantInfo_Ptr is access all IPaymentMerchantInfo;
   type IPaymentMerchantInfoFactory_Interface;
   type IPaymentMerchantInfoFactory is access all IPaymentMerchantInfoFactory_Interface'Class;
   type IPaymentMerchantInfoFactory_Ptr is access all IPaymentMerchantInfoFactory;
   type IPaymentOptions_Interface;
   type IPaymentOptions is access all IPaymentOptions_Interface'Class;
   type IPaymentOptions_Ptr is access all IPaymentOptions;
   type IPaymentRequestChangedArgs_Interface;
   type IPaymentRequestChangedArgs is access all IPaymentRequestChangedArgs_Interface'Class;
   type IPaymentRequestChangedArgs_Ptr is access all IPaymentRequestChangedArgs;
   type IPaymentRequestChangedResult_Interface;
   type IPaymentRequestChangedResult is access all IPaymentRequestChangedResult_Interface'Class;
   type IPaymentRequestChangedResult_Ptr is access all IPaymentRequestChangedResult;
   type IPaymentRequestChangedResultFactory_Interface;
   type IPaymentRequestChangedResultFactory is access all IPaymentRequestChangedResultFactory_Interface'Class;
   type IPaymentRequestChangedResultFactory_Ptr is access all IPaymentRequestChangedResultFactory;
   type IPaymentMediator_Interface;
   type IPaymentMediator is access all IPaymentMediator_Interface'Class;
   type IPaymentMediator_Ptr is access all IPaymentMediator;
   type IPaymentMediator2_Interface;
   type IPaymentMediator2 is access all IPaymentMediator2_Interface'Class;
   type IPaymentMediator2_Ptr is access all IPaymentMediator2;
   type IPaymentRequestSubmitResult_Interface;
   type IPaymentRequestSubmitResult is access all IPaymentRequestSubmitResult_Interface'Class;
   type IPaymentRequestSubmitResult_Ptr is access all IPaymentRequestSubmitResult;
   type IPaymentCanMakePaymentResult_Interface;
   type IPaymentCanMakePaymentResult is access all IPaymentCanMakePaymentResult_Interface'Class;
   type IPaymentCanMakePaymentResult_Ptr is access all IPaymentCanMakePaymentResult;
   type IPaymentCanMakePaymentResultFactory_Interface;
   type IPaymentCanMakePaymentResultFactory is access all IPaymentCanMakePaymentResultFactory_Interface'Class;
   type IPaymentCanMakePaymentResultFactory_Ptr is access all IPaymentCanMakePaymentResultFactory;
   type IAsyncOperation_IPaymentRequestChangedResult_Interface;
   type IAsyncOperation_IPaymentRequestChangedResult is access all IAsyncOperation_IPaymentRequestChangedResult_Interface'Class;
   type IAsyncOperation_IPaymentRequestChangedResult_Ptr is access all IAsyncOperation_IPaymentRequestChangedResult;
   type IIterator_IPaymentMethodData_Interface;
   type IIterator_IPaymentMethodData is access all IIterator_IPaymentMethodData_Interface'Class;
   type IIterator_IPaymentMethodData_Ptr is access all IIterator_IPaymentMethodData;
   type IIterable_IPaymentMethodData_Interface;
   type IIterable_IPaymentMethodData is access all IIterable_IPaymentMethodData_Interface'Class;
   type IIterable_IPaymentMethodData_Ptr is access all IIterable_IPaymentMethodData;
   type IVectorView_IPaymentMethodData_Interface;
   type IVectorView_IPaymentMethodData is access all IVectorView_IPaymentMethodData_Interface'Class;
   type IVectorView_IPaymentMethodData_Ptr is access all IVectorView_IPaymentMethodData;
   type IIterator_IPaymentItem_Interface;
   type IIterator_IPaymentItem is access all IIterator_IPaymentItem_Interface'Class;
   type IIterator_IPaymentItem_Ptr is access all IIterator_IPaymentItem;
   type IIterable_IPaymentItem_Interface;
   type IIterable_IPaymentItem is access all IIterable_IPaymentItem_Interface'Class;
   type IIterable_IPaymentItem_Ptr is access all IIterable_IPaymentItem;
   type IVectorView_IPaymentItem_Interface;
   type IVectorView_IPaymentItem is access all IVectorView_IPaymentItem_Interface'Class;
   type IVectorView_IPaymentItem_Ptr is access all IVectorView_IPaymentItem;
   type IIterator_IPaymentShippingOption_Interface;
   type IIterator_IPaymentShippingOption is access all IIterator_IPaymentShippingOption_Interface'Class;
   type IIterator_IPaymentShippingOption_Ptr is access all IIterator_IPaymentShippingOption;
   type IIterable_IPaymentShippingOption_Interface;
   type IIterable_IPaymentShippingOption is access all IIterable_IPaymentShippingOption_Interface'Class;
   type IIterable_IPaymentShippingOption_Ptr is access all IIterable_IPaymentShippingOption;
   type IVectorView_IPaymentShippingOption_Interface;
   type IVectorView_IPaymentShippingOption is access all IVectorView_IPaymentShippingOption_Interface'Class;
   type IVectorView_IPaymentShippingOption_Ptr is access all IVectorView_IPaymentShippingOption;
   type IIterator_IPaymentDetailsModifier_Interface;
   type IIterator_IPaymentDetailsModifier is access all IIterator_IPaymentDetailsModifier_Interface'Class;
   type IIterator_IPaymentDetailsModifier_Ptr is access all IIterator_IPaymentDetailsModifier;
   type IIterable_IPaymentDetailsModifier_Interface;
   type IIterable_IPaymentDetailsModifier is access all IIterable_IPaymentDetailsModifier_Interface'Class;
   type IIterable_IPaymentDetailsModifier_Ptr is access all IIterable_IPaymentDetailsModifier;
   type IVectorView_IPaymentDetailsModifier_Interface;
   type IVectorView_IPaymentDetailsModifier is access all IVectorView_IPaymentDetailsModifier_Interface'Class;
   type IVectorView_IPaymentDetailsModifier_Ptr is access all IVectorView_IPaymentDetailsModifier;
   type IAsyncOperation_IPaymentRequestSubmitResult_Interface;
   type IAsyncOperation_IPaymentRequestSubmitResult is access all IAsyncOperation_IPaymentRequestSubmitResult_Interface'Class;
   type IAsyncOperation_IPaymentRequestSubmitResult_Ptr is access all IAsyncOperation_IPaymentRequestSubmitResult;
   type IAsyncOperation_IPaymentCanMakePaymentResult_Interface;
   type IAsyncOperation_IPaymentCanMakePaymentResult is access all IAsyncOperation_IPaymentCanMakePaymentResult_Interface'Class;
   type IAsyncOperation_IPaymentCanMakePaymentResult_Ptr is access all IAsyncOperation_IPaymentCanMakePaymentResult;
   
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
   type IPaymentRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MerchantInfo
   (
      This       : access IPaymentRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentMerchantInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Details
   (
      This       : access IPaymentRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentDetails
   )
   return Windows.HRESULT is abstract;
   
   function get_MethodData
   (
      This       : access IPaymentRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IVectorView_IPaymentMethodData -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Options
   (
      This       : access IPaymentRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentOptions
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentRequest : aliased constant Windows.IID := (3075031777, 60795, 18411, (188, 8, 120, 204, 93, 104, 150, 182 ));
   
   ------------------------------------------------------------------------
   type IPaymentRequest2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IPaymentRequest2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentRequest2 : aliased constant Windows.IID := (3057438645, 22936, 18750, (160, 76, 103, 4, 138, 80, 241, 65 ));
   
   ------------------------------------------------------------------------
   type IPaymentRequestFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentRequestFactory_Interface
      ; details : Windows.ApplicationModel.Payments.IPaymentDetails
      ; methodData : Windows.ApplicationModel.Payments.IIterable_IPaymentMethodData
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentRequest
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithMerchantInfo
   (
      This       : access IPaymentRequestFactory_Interface
      ; details : Windows.ApplicationModel.Payments.IPaymentDetails
      ; methodData : Windows.ApplicationModel.Payments.IIterable_IPaymentMethodData
      ; merchantInfo : Windows.ApplicationModel.Payments.IPaymentMerchantInfo
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentRequest
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithMerchantInfoAndOptions
   (
      This       : access IPaymentRequestFactory_Interface
      ; details : Windows.ApplicationModel.Payments.IPaymentDetails
      ; methodData : Windows.ApplicationModel.Payments.IIterable_IPaymentMethodData
      ; merchantInfo : Windows.ApplicationModel.Payments.IPaymentMerchantInfo
      ; options : Windows.ApplicationModel.Payments.IPaymentOptions
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentRequestFactory : aliased constant Windows.IID := (1049262556, 27508, 17107, (177, 3, 240, 222, 53, 251, 24, 72 ));
   
   ------------------------------------------------------------------------
   type IPaymentRequestFactory2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithMerchantInfoOptionsAndId
   (
      This       : access IPaymentRequestFactory2_Interface
      ; details : Windows.ApplicationModel.Payments.IPaymentDetails
      ; methodData : Windows.ApplicationModel.Payments.IIterable_IPaymentMethodData
      ; merchantInfo : Windows.ApplicationModel.Payments.IPaymentMerchantInfo
      ; options : Windows.ApplicationModel.Payments.IPaymentOptions
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentRequestFactory2 : aliased constant Windows.IID := (3872264997, 42246, 17266, (183, 239, 26, 3, 29, 86, 98, 209 ));
   
   ------------------------------------------------------------------------
   type IPaymentResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PaymentToken
   (
      This       : access IPaymentResponse_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentToken
   )
   return Windows.HRESULT is abstract;
   
   function get_ShippingOption
   (
      This       : access IPaymentResponse_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentShippingOption
   )
   return Windows.HRESULT is abstract;
   
   function get_ShippingAddress
   (
      This       : access IPaymentResponse_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_PayerEmail
   (
      This       : access IPaymentResponse_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PayerName
   (
      This       : access IPaymentResponse_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PayerPhoneNumber
   (
      This       : access IPaymentResponse_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function CompleteAsync
   (
      This       : access IPaymentResponse_Interface
      ; status : Windows.ApplicationModel.Payments.PaymentRequestCompletionStatus
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentResponse : aliased constant Windows.IID := (3778581591, 35794, 18568, (159, 168, 151, 152, 85, 69, 16, 142 ));
   
   ------------------------------------------------------------------------
   type IPaymentDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Total
   (
      This       : access IPaymentDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentItem
   )
   return Windows.HRESULT is abstract;
   
   function put_Total
   (
      This       : access IPaymentDetails_Interface
      ; value : Windows.ApplicationModel.Payments.IPaymentItem
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayItems
   (
      This       : access IPaymentDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IVectorView_IPaymentItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayItems
   (
      This       : access IPaymentDetails_Interface
      ; value : Windows.ApplicationModel.Payments.IVectorView_IPaymentItem
   )
   return Windows.HRESULT is abstract;
   
   function get_ShippingOptions
   (
      This       : access IPaymentDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IVectorView_IPaymentShippingOption -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ShippingOptions
   (
      This       : access IPaymentDetails_Interface
      ; value : Windows.ApplicationModel.Payments.IVectorView_IPaymentShippingOption
   )
   return Windows.HRESULT is abstract;
   
   function get_Modifiers
   (
      This       : access IPaymentDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IVectorView_IPaymentDetailsModifier -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Modifiers
   (
      This       : access IPaymentDetails_Interface
      ; value : Windows.ApplicationModel.Payments.IVectorView_IPaymentDetailsModifier
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentDetails : aliased constant Windows.IID := (1404775805, 57579, 16467, (142, 174, 206, 124, 72, 224, 41, 69 ));
   
   ------------------------------------------------------------------------
   type IPaymentDetailsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentDetailsFactory_Interface
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentDetails
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithDisplayItems
   (
      This       : access IPaymentDetailsFactory_Interface
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
      ; displayItems : Windows.ApplicationModel.Payments.IIterable_IPaymentItem
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentDetails
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentDetailsFactory : aliased constant Windows.IID := (3488133102, 49386, 19617, (139, 199, 109, 230, 123, 31, 55, 99 ));
   
   ------------------------------------------------------------------------
   type IPaymentDetailsModifier_Interface is interface and Windows.IInspectable_Interface;
   
   function get_JsonData
   (
      This       : access IPaymentDetailsModifier_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedMethodIds
   (
      This       : access IPaymentDetailsModifier_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Total
   (
      This       : access IPaymentDetailsModifier_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentItem
   )
   return Windows.HRESULT is abstract;
   
   function get_AdditionalDisplayItems
   (
      This       : access IPaymentDetailsModifier_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IVectorView_IPaymentItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentDetailsModifier : aliased constant Windows.IID := (3189538149, 17187, 16855, (179, 5, 223, 203, 118, 95, 105, 222 ));
   
   ------------------------------------------------------------------------
   type IPaymentDetailsModifierFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentDetailsModifierFactory_Interface
      ; supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentDetailsModifier
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAdditionalDisplayItems
   (
      This       : access IPaymentDetailsModifierFactory_Interface
      ; supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
      ; additionalDisplayItems : Windows.ApplicationModel.Payments.IIterable_IPaymentItem
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentDetailsModifier
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAdditionalDisplayItemsAndJsonData
   (
      This       : access IPaymentDetailsModifierFactory_Interface
      ; supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
      ; additionalDisplayItems : Windows.ApplicationModel.Payments.IIterable_IPaymentItem
      ; jsonData : Windows.String
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentDetailsModifier
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentDetailsModifierFactory : aliased constant Windows.IID := (2030064262, 21726, 17052, (158, 79, 93, 206, 110, 16, 235, 206 ));
   
   ------------------------------------------------------------------------
   type IPaymentToken_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PaymentMethodId
   (
      This       : access IPaymentToken_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_JsonDetails
   (
      This       : access IPaymentToken_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentToken : aliased constant Windows.IID := (3150626835, 52432, 16882, (178, 161, 10, 46, 75, 93, 206, 37 ));
   
   ------------------------------------------------------------------------
   type IPaymentTokenFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentTokenFactory_Interface
      ; paymentMethodId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentToken
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithJsonDetails
   (
      This       : access IPaymentTokenFactory_Interface
      ; paymentMethodId : Windows.String
      ; jsonDetails : Windows.String
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentTokenFactory : aliased constant Windows.IID := (2559367082, 18259, 18692, (131, 115, 221, 123, 8, 185, 149, 193 ));
   
   ------------------------------------------------------------------------
   type IPaymentMethodData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportedMethodIds
   (
      This       : access IPaymentMethodData_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_JsonData
   (
      This       : access IPaymentMethodData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentMethodData : aliased constant Windows.IID := (3520318196, 56984, 16681, (177, 183, 195, 173, 134, 35, 123, 244 ));
   
   ------------------------------------------------------------------------
   type IPaymentMethodDataFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentMethodDataFactory_Interface
      ; supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentMethodData
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithJsonData
   (
      This       : access IPaymentMethodDataFactory_Interface
      ; supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; jsonData : Windows.String
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentMethodData
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentMethodDataFactory : aliased constant Windows.IID := (2329793151, 39850, 19074, (131, 66, 168, 33, 9, 146, 163, 107 ));
   
   ------------------------------------------------------------------------
   type IPaymentCurrencyAmount_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Currency
   (
      This       : access IPaymentCurrencyAmount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Currency
   (
      This       : access IPaymentCurrencyAmount_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrencySystem
   (
      This       : access IPaymentCurrencyAmount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CurrencySystem
   (
      This       : access IPaymentCurrencyAmount_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IPaymentCurrencyAmount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IPaymentCurrencyAmount_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentCurrencyAmount : aliased constant Windows.IID := (3819170272, 46111, 18823, (189, 203, 7, 19, 49, 242, 218, 164 ));
   
   ------------------------------------------------------------------------
   type IPaymentCurrencyAmountFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentCurrencyAmountFactory_Interface
      ; value : Windows.String
      ; currency : Windows.String
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithCurrencySystem
   (
      This       : access IPaymentCurrencyAmountFactory_Interface
      ; value : Windows.String
      ; currency : Windows.String
      ; currencySystem : Windows.String
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentCurrencyAmountFactory : aliased constant Windows.IID := (844616504, 5132, 17781, (133, 53, 247, 115, 23, 140, 9, 167 ));
   
   ------------------------------------------------------------------------
   type IPaymentItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Label
   (
      This       : access IPaymentItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Label
   (
      This       : access IPaymentItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Amount
   (
      This       : access IPaymentItem_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
   )
   return Windows.HRESULT is abstract;
   
   function put_Amount
   (
      This       : access IPaymentItem_Interface
      ; value : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
   )
   return Windows.HRESULT is abstract;
   
   function get_Pending
   (
      This       : access IPaymentItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Pending
   (
      This       : access IPaymentItem_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentItem : aliased constant Windows.IID := (1750780043, 31154, 19318, (158, 3, 168, 118, 34, 61, 254, 114 ));
   
   ------------------------------------------------------------------------
   type IPaymentItemFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentItemFactory_Interface
      ; label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentItemFactory : aliased constant Windows.IID := (3333126872, 9475, 19741, (167, 120, 2, 178, 229, 146, 123, 44 ));
   
   ------------------------------------------------------------------------
   type IPaymentShippingOption_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Label
   (
      This       : access IPaymentShippingOption_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Label
   (
      This       : access IPaymentShippingOption_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Amount
   (
      This       : access IPaymentShippingOption_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
   )
   return Windows.HRESULT is abstract;
   
   function put_Amount
   (
      This       : access IPaymentShippingOption_Interface
      ; value : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access IPaymentShippingOption_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Tag
   (
      This       : access IPaymentShippingOption_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSelected
   (
      This       : access IPaymentShippingOption_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSelected
   (
      This       : access IPaymentShippingOption_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentShippingOption : aliased constant Windows.IID := (322382554, 38739, 17780, (137, 102, 147, 20, 90, 118, 199, 249 ));
   
   ------------------------------------------------------------------------
   type IPaymentShippingOptionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentShippingOptionFactory_Interface
      ; label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentShippingOption
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithSelected
   (
      This       : access IPaymentShippingOptionFactory_Interface
      ; label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
      ; selected : Windows.Boolean
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentShippingOption
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithSelectedAndTag
   (
      This       : access IPaymentShippingOptionFactory_Interface
      ; label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
      ; selected : Windows.Boolean
      ; tag : Windows.String
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentShippingOption
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentShippingOptionFactory : aliased constant Windows.IID := (1575352599, 45783, 17515, (157, 115, 97, 35, 251, 202, 59, 198 ));
   
   ------------------------------------------------------------------------
   type IPaymentAddress_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Country
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Country
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AddressLines
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_AddressLines
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.Foundation.Collections.IVectorView_String
   )
   return Windows.HRESULT is abstract;
   
   function get_Region
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Region
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_City
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_City
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DependentLocality
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DependentLocality
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PostalCode
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PostalCode
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SortingCode
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SortingCode
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LanguageCode
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_LanguageCode
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Organization
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Organization
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Recipient
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Recipient
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PhoneNumber
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PhoneNumber
   (
      This       : access IPaymentAddress_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPaymentAddress_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentAddress : aliased constant Windows.IID := (1596089577, 28474, 16742, (160, 24, 10, 11, 6, 187, 50, 181 ));
   
   ------------------------------------------------------------------------
   type IPaymentMerchantInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PackageFullName
   (
      This       : access IPaymentMerchantInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IPaymentMerchantInfo_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentMerchantInfo : aliased constant Windows.IID := (1665421392, 3732, 20182, (170, 203, 230, 1, 43, 211, 39, 167 ));
   
   ------------------------------------------------------------------------
   type IPaymentMerchantInfoFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentMerchantInfoFactory_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentMerchantInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentMerchantInfoFactory : aliased constant Windows.IID := (2659831507, 52407, 16743, (168, 236, 225, 10, 233, 109, 188, 209 ));
   
   ------------------------------------------------------------------------
   type IPaymentOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestPayerEmail
   (
      This       : access IPaymentOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.PaymentOptionPresence
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestPayerEmail
   (
      This       : access IPaymentOptions_Interface
      ; value : Windows.ApplicationModel.Payments.PaymentOptionPresence
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestPayerName
   (
      This       : access IPaymentOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.PaymentOptionPresence
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestPayerName
   (
      This       : access IPaymentOptions_Interface
      ; value : Windows.ApplicationModel.Payments.PaymentOptionPresence
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestPayerPhoneNumber
   (
      This       : access IPaymentOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.PaymentOptionPresence
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestPayerPhoneNumber
   (
      This       : access IPaymentOptions_Interface
      ; value : Windows.ApplicationModel.Payments.PaymentOptionPresence
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestShipping
   (
      This       : access IPaymentOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestShipping
   (
      This       : access IPaymentOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShippingType
   (
      This       : access IPaymentOptions_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.PaymentShippingType
   )
   return Windows.HRESULT is abstract;
   
   function put_ShippingType
   (
      This       : access IPaymentOptions_Interface
      ; value : Windows.ApplicationModel.Payments.PaymentShippingType
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentOptions : aliased constant Windows.IID := (2862811220, 7979, 17253, (130, 81, 1, 181, 137, 21, 165, 188 ));
   
   ------------------------------------------------------------------------
   type IPaymentRequestChangedArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeKind
   (
      This       : access IPaymentRequestChangedArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.PaymentRequestChangeKind
   )
   return Windows.HRESULT is abstract;
   
   function get_ShippingAddress
   (
      This       : access IPaymentRequestChangedArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedShippingOption
   (
      This       : access IPaymentRequestChangedArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentShippingOption
   )
   return Windows.HRESULT is abstract;
   
   function Acknowledge
   (
      This       : access IPaymentRequestChangedArgs_Interface
      ; changeResult : Windows.ApplicationModel.Payments.IPaymentRequestChangedResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentRequestChangedArgs : aliased constant Windows.IID := (3323223620, 52619, 19428, (181, 85, 39, 201, 145, 148, 192, 197 ));
   
   ------------------------------------------------------------------------
   type IPaymentRequestChangedResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeAcceptedByMerchant
   (
      This       : access IPaymentRequestChangedResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ChangeAcceptedByMerchant
   (
      This       : access IPaymentRequestChangedResult_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IPaymentRequestChangedResult_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Message
   (
      This       : access IPaymentRequestChangedResult_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UpdatedPaymentDetails
   (
      This       : access IPaymentRequestChangedResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentDetails
   )
   return Windows.HRESULT is abstract;
   
   function put_UpdatedPaymentDetails
   (
      This       : access IPaymentRequestChangedResult_Interface
      ; value : Windows.ApplicationModel.Payments.IPaymentDetails
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentRequestChangedResult : aliased constant Windows.IID := (3748240988, 5828, 18349, (148, 1, 132, 64, 236, 7, 87, 219 ));
   
   ------------------------------------------------------------------------
   type IPaymentRequestChangedResultFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentRequestChangedResultFactory_Interface
      ; changeAcceptedByMerchant : Windows.Boolean
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentRequestChangedResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithPaymentDetails
   (
      This       : access IPaymentRequestChangedResultFactory_Interface
      ; changeAcceptedByMerchant : Windows.Boolean
      ; updatedPaymentDetails : Windows.ApplicationModel.Payments.IPaymentDetails
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentRequestChangedResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentRequestChangedResultFactory : aliased constant Windows.IID := (141823830, 7475, 17457, (129, 75, 103, 234, 36, 191, 33, 219 ));
   
   ------------------------------------------------------------------------
   type IPaymentMediator_Interface is interface and Windows.IInspectable_Interface;
   
   function GetSupportedMethodIdsAsync
   (
      This       : access IPaymentMediator_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SubmitPaymentRequestAsync
   (
      This       : access IPaymentMediator_Interface
      ; paymentRequest : Windows.ApplicationModel.Payments.IPaymentRequest
      ; RetVal : access Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentRequestSubmitResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SubmitPaymentRequestWithChangeHandlerAsync
   (
      This       : access IPaymentMediator_Interface
      ; paymentRequest : Windows.ApplicationModel.Payments.IPaymentRequest
      ; changeHandler : Windows.ApplicationModel.Payments.PaymentRequestChangedHandler
      ; RetVal : access Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentRequestSubmitResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentMediator : aliased constant Windows.IID := (4212058153, 60428, 17562, (131, 218, 122, 227, 7, 51, 101, 162 ));
   
   ------------------------------------------------------------------------
   type IPaymentMediator2_Interface is interface and Windows.IInspectable_Interface;
   
   function CanMakePaymentAsync
   (
      This       : access IPaymentMediator2_Interface
      ; paymentRequest : Windows.ApplicationModel.Payments.IPaymentRequest
      ; RetVal : access Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentCanMakePaymentResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentMediator2 : aliased constant Windows.IID := (3471808753, 58375, 16680, (142, 115, 217, 61, 95, 130, 39, 134 ));
   
   ------------------------------------------------------------------------
   type IPaymentRequestSubmitResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IPaymentRequestSubmitResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.PaymentRequestStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Response
   (
      This       : access IPaymentRequestSubmitResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentResponse
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentRequestSubmitResult : aliased constant Windows.IID := (2073835794, 12530, 20112, (178, 73, 140, 231, 215, 143, 254, 86 ));
   
   ------------------------------------------------------------------------
   type IPaymentCanMakePaymentResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IPaymentCanMakePaymentResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.PaymentCanMakePaymentResultStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentCanMakePaymentResult : aliased constant Windows.IID := (1989606997, 54739, 19773, (179, 69, 69, 89, 23, 89, 197, 16 ));
   
   ------------------------------------------------------------------------
   type IPaymentCanMakePaymentResultFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPaymentCanMakePaymentResultFactory_Interface
      ; value : Windows.ApplicationModel.Payments.PaymentCanMakePaymentResultStatus
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IPaymentCanMakePaymentResultFactory : aliased constant Windows.IID := (3151800894, 32073, 20329, (170, 83, 42, 15, 129, 100, 183, 201 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPaymentRequestChangedResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPaymentRequestChangedResult_Interface
      ; handler : Windows.ApplicationModel.Payments.AsyncOperationCompletedHandler_IPaymentRequestChangedResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPaymentRequestChangedResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.AsyncOperationCompletedHandler_IPaymentRequestChangedResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPaymentRequestChangedResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentRequestChangedResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPaymentRequestChangedResult : aliased constant Windows.IID := (214114341, 44135, 22498, (160, 246, 58, 142, 17, 108, 239, 76 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPaymentMethodData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPaymentMethodData_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentMethodData
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPaymentMethodData_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPaymentMethodData_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPaymentMethodData_Interface
      ; items : Windows.ApplicationModel.Payments.IPaymentMethodData_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPaymentMethodData : aliased constant Windows.IID := (2523288110, 58796, 21364, (165, 217, 92, 245, 124, 75, 246, 137 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPaymentMethodData_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPaymentMethodData_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IIterator_IPaymentMethodData
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPaymentMethodData : aliased constant Windows.IID := (2359220350, 19165, 22696, (173, 154, 157, 250, 72, 202, 37, 10 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IPaymentMethodData_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPaymentMethodData_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentMethodData
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPaymentMethodData_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPaymentMethodData_Interface
      ; value : Windows.ApplicationModel.Payments.IPaymentMethodData
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPaymentMethodData_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Payments.IPaymentMethodData_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IPaymentMethodData : aliased constant Windows.IID := (269597114, 27141, 23318, (130, 207, 1, 117, 8, 81, 5, 224 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPaymentItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPaymentItem_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPaymentItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPaymentItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPaymentItem_Interface
      ; items : Windows.ApplicationModel.Payments.IPaymentItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPaymentItem : aliased constant Windows.IID := (2478910659, 27147, 24322, (172, 116, 5, 96, 7, 71, 39, 49 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPaymentItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPaymentItem_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IIterator_IPaymentItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPaymentItem : aliased constant Windows.IID := (3055251532, 58874, 21796, (139, 149, 125, 3, 245, 211, 106, 233 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IPaymentItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPaymentItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPaymentItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPaymentItem_Interface
      ; value : Windows.ApplicationModel.Payments.IPaymentItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPaymentItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Payments.IPaymentItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IPaymentItem : aliased constant Windows.IID := (1806635585, 8102, 23586, (131, 239, 65, 94, 147, 205, 247, 177 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPaymentShippingOption_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPaymentShippingOption_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentShippingOption
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPaymentShippingOption_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPaymentShippingOption_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPaymentShippingOption_Interface
      ; items : Windows.ApplicationModel.Payments.IPaymentShippingOption_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPaymentShippingOption : aliased constant Windows.IID := (1240320500, 11494, 21324, (181, 41, 92, 238, 199, 5, 222, 245 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPaymentShippingOption_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPaymentShippingOption_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IIterator_IPaymentShippingOption
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPaymentShippingOption : aliased constant Windows.IID := (3733462121, 26178, 21726, (168, 247, 209, 168, 139, 36, 4, 207 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IPaymentShippingOption_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPaymentShippingOption_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentShippingOption
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPaymentShippingOption_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPaymentShippingOption_Interface
      ; value : Windows.ApplicationModel.Payments.IPaymentShippingOption
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPaymentShippingOption_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Payments.IPaymentShippingOption_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IPaymentShippingOption : aliased constant Windows.IID := (2357274859, 35891, 22237, (150, 72, 57, 232, 4, 3, 18, 212 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPaymentDetailsModifier_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPaymentDetailsModifier_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentDetailsModifier
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPaymentDetailsModifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPaymentDetailsModifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPaymentDetailsModifier_Interface
      ; items : Windows.ApplicationModel.Payments.IPaymentDetailsModifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPaymentDetailsModifier : aliased constant Windows.IID := (4210780020, 46693, 23435, (177, 239, 149, 3, 140, 58, 171, 225 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPaymentDetailsModifier_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPaymentDetailsModifier_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IIterator_IPaymentDetailsModifier
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPaymentDetailsModifier : aliased constant Windows.IID := (1482500925, 52020, 22724, (129, 244, 30, 161, 87, 153, 109, 239 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IPaymentDetailsModifier_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPaymentDetailsModifier_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentDetailsModifier
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPaymentDetailsModifier_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPaymentDetailsModifier_Interface
      ; value : Windows.ApplicationModel.Payments.IPaymentDetailsModifier
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPaymentDetailsModifier_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Payments.IPaymentDetailsModifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IPaymentDetailsModifier : aliased constant Windows.IID := (3665725212, 28172, 24114, (190, 64, 16, 113, 90, 159, 117, 235 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPaymentRequestSubmitResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPaymentRequestSubmitResult_Interface
      ; handler : Windows.ApplicationModel.Payments.AsyncOperationCompletedHandler_IPaymentRequestSubmitResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPaymentRequestSubmitResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.AsyncOperationCompletedHandler_IPaymentRequestSubmitResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPaymentRequestSubmitResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPaymentRequestSubmitResult : aliased constant Windows.IID := (3475574251, 21833, 22467, (138, 189, 83, 183, 108, 100, 60, 202 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPaymentCanMakePaymentResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPaymentCanMakePaymentResult_Interface
      ; handler : Windows.ApplicationModel.Payments.AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPaymentCanMakePaymentResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPaymentCanMakePaymentResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPaymentCanMakePaymentResult : aliased constant Windows.IID := (2758230282, 4574, 20624, (185, 5, 150, 165, 98, 216, 93, 229 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type PaymentRequestChangedHandler_Interface(Callback : access procedure (paymentRequest : Windows.ApplicationModel.Payments.IPaymentRequest ; args : Windows.ApplicationModel.Payments.IPaymentRequestChangedArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access PaymentRequestChangedHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access PaymentRequestChangedHandler_Interface
      ; paymentRequest : Windows.ApplicationModel.Payments.IPaymentRequest
      ; args : Windows.ApplicationModel.Payments.IPaymentRequestChangedArgs
   )
   return Windows.HRESULT;
   
   IID_PaymentRequestChangedHandler : aliased constant Windows.IID := (1350089185, 62360, 20268, (162, 126, 148, 211, 113, 207, 108, 125 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPaymentRequestChangedResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentRequestChangedResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPaymentRequestChangedResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPaymentRequestChangedResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentRequestChangedResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPaymentRequestChangedResult : aliased constant Windows.IID := (3200825126, 36950, 24135, (178, 42, 13, 160, 154, 168, 74, 254 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPaymentRequestSubmitResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentRequestSubmitResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPaymentRequestSubmitResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPaymentRequestSubmitResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentRequestSubmitResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPaymentRequestSubmitResult : aliased constant Windows.IID := (3419211686, 44586, 23152, (188, 11, 145, 32, 86, 8, 37, 209 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentCanMakePaymentResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentCanMakePaymentResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult : aliased constant Windows.IID := (2309905289, 27909, 22594, (156, 223, 244, 203, 247, 6, 220, 94 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PaymentMerchantInfo is Windows.ApplicationModel.Payments.IPaymentMerchantInfo;
   
   function CreatePaymentMerchantInfo return Windows.ApplicationModel.Payments.IPaymentMerchantInfo;
   
   subtype PaymentDetails is Windows.ApplicationModel.Payments.IPaymentDetails;
   
   function CreatePaymentDetails return Windows.ApplicationModel.Payments.IPaymentDetails;
   
   subtype PaymentMethodData is Windows.ApplicationModel.Payments.IPaymentMethodData;
   
   function Create
   (
      supportedMethodIds : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Payments.IPaymentMethodData;
   
   function CreateWithJsonData
   (
      supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; jsonData : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentMethodData;
   
   subtype PaymentOptions is Windows.ApplicationModel.Payments.IPaymentOptions;
   
   function CreatePaymentOptions return Windows.ApplicationModel.Payments.IPaymentOptions;
   
   subtype PaymentRequest is Windows.ApplicationModel.Payments.IPaymentRequest;
   
   function CreateWithMerchantInfoOptionsAndId
   (
      details : Windows.ApplicationModel.Payments.IPaymentDetails
      ; methodData : Windows.ApplicationModel.Payments.IIterable_IPaymentMethodData
      ; merchantInfo : Windows.ApplicationModel.Payments.IPaymentMerchantInfo
      ; options : Windows.ApplicationModel.Payments.IPaymentOptions
      ; id : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentRequest;
   
   subtype PaymentToken is Windows.ApplicationModel.Payments.IPaymentToken;
   
   function Create
   (
      paymentMethodId : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentToken;
   
   function CreateWithJsonDetails
   (
      paymentMethodId : Windows.String
      ; jsonDetails : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentToken;
   
   subtype PaymentShippingOption is Windows.ApplicationModel.Payments.IPaymentShippingOption;
   
   function Create
   (
      label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
   )
   return Windows.ApplicationModel.Payments.IPaymentShippingOption;
   
   function CreateWithSelected
   (
      label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
      ; selected : Windows.Boolean
   )
   return Windows.ApplicationModel.Payments.IPaymentShippingOption;
   
   function CreateWithSelectedAndTag
   (
      label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
      ; selected : Windows.Boolean
      ; tag : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentShippingOption;
   
   subtype PaymentAddress is Windows.ApplicationModel.Payments.IPaymentAddress;
   
   function CreatePaymentAddress return Windows.ApplicationModel.Payments.IPaymentAddress;
   
   subtype PaymentItem is Windows.ApplicationModel.Payments.IPaymentItem;
   
   function Create
   (
      label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
   )
   return Windows.ApplicationModel.Payments.IPaymentItem;
   
   subtype PaymentDetailsModifier is Windows.ApplicationModel.Payments.IPaymentDetailsModifier;
   
   function Create
   (
      supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
   )
   return Windows.ApplicationModel.Payments.IPaymentDetailsModifier;
   
   function CreateWithAdditionalDisplayItems
   (
      supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
      ; additionalDisplayItems : Windows.ApplicationModel.Payments.IIterable_IPaymentItem
   )
   return Windows.ApplicationModel.Payments.IPaymentDetailsModifier;
   
   function CreateWithAdditionalDisplayItemsAndJsonData
   (
      supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
      ; additionalDisplayItems : Windows.ApplicationModel.Payments.IIterable_IPaymentItem
      ; jsonData : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentDetailsModifier;
   
   subtype PaymentCurrencyAmount is Windows.ApplicationModel.Payments.IPaymentCurrencyAmount;
   
   function Create
   (
      value : Windows.String
      ; currency : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentCurrencyAmount;
   
   function CreateWithCurrencySystem
   (
      value : Windows.String
      ; currency : Windows.String
      ; currencySystem : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentCurrencyAmount;
   
   subtype PaymentRequestChangedResult is Windows.ApplicationModel.Payments.IPaymentRequestChangedResult;
   
   function Create
   (
      changeAcceptedByMerchant : Windows.Boolean
   )
   return Windows.ApplicationModel.Payments.IPaymentRequestChangedResult;
   
   function CreateWithPaymentDetails
   (
      changeAcceptedByMerchant : Windows.Boolean
      ; updatedPaymentDetails : Windows.ApplicationModel.Payments.IPaymentDetails
   )
   return Windows.ApplicationModel.Payments.IPaymentRequestChangedResult;
   
   subtype PaymentRequestChangedArgs is Windows.ApplicationModel.Payments.IPaymentRequestChangedArgs;
   subtype PaymentRequestSubmitResult is Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult;
   subtype PaymentCanMakePaymentResult is Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult;
   
   function Create
   (
      value : Windows.ApplicationModel.Payments.PaymentCanMakePaymentResultStatus
   )
   return Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult;
   
   subtype PaymentResponse is Windows.ApplicationModel.Payments.IPaymentResponse;
   subtype PaymentMediator is Windows.ApplicationModel.Payments.IPaymentMediator;
   
   function CreatePaymentMediator return Windows.ApplicationModel.Payments.IPaymentMediator;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
