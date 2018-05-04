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
with Windows; use Windows;
limited with Windows.Foundation.Collections;
package Windows.Foundation is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PropertyType is (
      Empty,
      UInt8,
      Int16,
      UInt16,
      Int32,
      UInt32,
      Int64,
      UInt64,
      Single,
      Double,
      Char16,
      Boolean,
      String,
      Inspectable,
      DateTime_x,
      TimeSpan_x,
      Guid,
      Point_x,
      Size_x,
      Rect_x,
      OtherType,
      UInt8Array,
      Int16Array,
      UInt16Array,
      Int32Array,
      UInt32Array,
      Int64Array,
      UInt64Array,
      SingleArray,
      DoubleArray,
      Char16Array,
      BooleanArray,
      StringArray,
      InspectableArray,
      DateTimeArray,
      TimeSpanArray,
      GuidArray,
      PointArray,
      SizeArray,
      RectArray,
      OtherTypeArray
   );
   for PropertyType use (
      Empty => 0,
      UInt8 => 1,
      Int16 => 2,
      UInt16 => 3,
      Int32 => 4,
      UInt32 => 5,
      Int64 => 6,
      UInt64 => 7,
      Single => 8,
      Double => 9,
      Char16 => 10,
      Boolean => 11,
      String => 12,
      Inspectable => 13,
      DateTime_x => 14,
      TimeSpan_x => 15,
      Guid => 16,
      Point_x => 17,
      Size_x => 18,
      Rect_x => 19,
      OtherType => 20,
      UInt8Array => 1025,
      Int16Array => 1026,
      UInt16Array => 1027,
      Int32Array => 1028,
      UInt32Array => 1029,
      Int64Array => 1030,
      UInt64Array => 1031,
      SingleArray => 1032,
      DoubleArray => 1033,
      Char16Array => 1034,
      BooleanArray => 1035,
      StringArray => 1036,
      InspectableArray => 1037,
      DateTimeArray => 1038,
      TimeSpanArray => 1039,
      GuidArray => 1040,
      PointArray => 1041,
      SizeArray => 1042,
      RectArray => 1043,
      OtherTypeArray => 1044
   );
   for PropertyType'Size use 32;
   
   type PropertyType_Ptr is access PropertyType;
   
   type AsyncStatus is (
      Started,
      Completed,
      Canceled,
      Error
   );
   for AsyncStatus use (
      Started => 0,
      Completed => 1,
      Canceled => 2,
      Error => 3
   );
   for AsyncStatus'Size use 32;
   
   type AsyncStatus_Ptr is access AsyncStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type Point is record
      X : Windows.Single;
      Y : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , Point);
   
   type Point_Ptr is access Point;
   
   type Size is record
      Width : Windows.Single;
      Height : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , Size);
   
   type Size_Ptr is access Size;
   
   type Rect is record
      X : Windows.Single;
      Y : Windows.Single;
      Width : Windows.Single;
      Height : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , Rect);
   
   type Rect_Ptr is access Rect;
   
   type DateTime is record
      UniversalTime : Windows.Int64;
   end record;
   pragma Convention (C_Pass_By_Copy , DateTime);
   
   type DateTime_Ptr is access DateTime;
   
   type TimeSpan is record
      Duration : Windows.Int64;
   end record;
   pragma Convention (C_Pass_By_Copy , TimeSpan);
   
   type TimeSpan_Ptr is access TimeSpan;
   
   type EventRegistrationToken is record
      Value : Windows.Int64;
   end record;
   pragma Convention (C_Pass_By_Copy , EventRegistrationToken);
   
   type EventRegistrationToken_Ptr is access EventRegistrationToken;
   
   type HResult is record
      Value : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , HResult);
   
   type HResult_Ptr is access HResult;
   
   type FoundationContract is null record;
   pragma Convention (C_Pass_By_Copy , FoundationContract);
   
   type FoundationContract_Ptr is access FoundationContract;
   
   type UniversalApiContract is null record;
   pragma Convention (C_Pass_By_Copy , UniversalApiContract);
   
   type UniversalApiContract_Ptr is access UniversalApiContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncActionCompletedHandler_Interface;
   type AsyncActionCompletedHandler is access all AsyncActionCompletedHandler_Interface'Class;
   type AsyncActionCompletedHandler_Ptr is access all AsyncActionCompletedHandler;
   type DeferralCompletedHandler_Interface;
   type DeferralCompletedHandler is access all DeferralCompletedHandler_Interface'Class;
   type DeferralCompletedHandler_Ptr is access all DeferralCompletedHandler;
   type AsyncOperationCompletedHandler_Object_Interface;
   type AsyncOperationCompletedHandler_Object is access all AsyncOperationCompletedHandler_Object_Interface'Class;
   type AsyncOperationCompletedHandler_Object_Ptr is access all AsyncOperationCompletedHandler_Object;
   type AsyncOperationCompletedHandler_UInt8_Interface;
   type AsyncOperationCompletedHandler_UInt8 is access all AsyncOperationCompletedHandler_UInt8_Interface'Class;
   type AsyncOperationCompletedHandler_UInt8_Ptr is access all AsyncOperationCompletedHandler_UInt8;
   type AsyncOperationCompletedHandler_UInt16_Interface;
   type AsyncOperationCompletedHandler_UInt16 is access all AsyncOperationCompletedHandler_UInt16_Interface'Class;
   type AsyncOperationCompletedHandler_UInt16_Ptr is access all AsyncOperationCompletedHandler_UInt16;
   type AsyncOperationCompletedHandler_UInt32_Interface;
   type AsyncOperationCompletedHandler_UInt32 is access all AsyncOperationCompletedHandler_UInt32_Interface'Class;
   type AsyncOperationCompletedHandler_UInt32_Ptr is access all AsyncOperationCompletedHandler_UInt32;
   type AsyncOperationCompletedHandler_UInt64_Interface;
   type AsyncOperationCompletedHandler_UInt64 is access all AsyncOperationCompletedHandler_UInt64_Interface'Class;
   type AsyncOperationCompletedHandler_UInt64_Ptr is access all AsyncOperationCompletedHandler_UInt64;
   type AsyncOperationCompletedHandler_Int8_Interface;
   type AsyncOperationCompletedHandler_Int8 is access all AsyncOperationCompletedHandler_Int8_Interface'Class;
   type AsyncOperationCompletedHandler_Int8_Ptr is access all AsyncOperationCompletedHandler_Int8;
   type AsyncOperationCompletedHandler_Int16_Interface;
   type AsyncOperationCompletedHandler_Int16 is access all AsyncOperationCompletedHandler_Int16_Interface'Class;
   type AsyncOperationCompletedHandler_Int16_Ptr is access all AsyncOperationCompletedHandler_Int16;
   type AsyncOperationCompletedHandler_Int32_Interface;
   type AsyncOperationCompletedHandler_Int32 is access all AsyncOperationCompletedHandler_Int32_Interface'Class;
   type AsyncOperationCompletedHandler_Int32_Ptr is access all AsyncOperationCompletedHandler_Int32;
   type AsyncOperationCompletedHandler_Int64_Interface;
   type AsyncOperationCompletedHandler_Int64 is access all AsyncOperationCompletedHandler_Int64_Interface'Class;
   type AsyncOperationCompletedHandler_Int64_Ptr is access all AsyncOperationCompletedHandler_Int64;
   type AsyncOperationCompletedHandler_Guid_Interface;
   type AsyncOperationCompletedHandler_Guid is access all AsyncOperationCompletedHandler_Guid_Interface'Class;
   type AsyncOperationCompletedHandler_Guid_Ptr is access all AsyncOperationCompletedHandler_Guid;
   type AsyncOperationCompletedHandler_Single_Interface;
   type AsyncOperationCompletedHandler_Single is access all AsyncOperationCompletedHandler_Single_Interface'Class;
   type AsyncOperationCompletedHandler_Single_Ptr is access all AsyncOperationCompletedHandler_Single;
   type AsyncOperationCompletedHandler_Double_Interface;
   type AsyncOperationCompletedHandler_Double is access all AsyncOperationCompletedHandler_Double_Interface'Class;
   type AsyncOperationCompletedHandler_Double_Ptr is access all AsyncOperationCompletedHandler_Double;
   type AsyncOperationCompletedHandler_String_Interface;
   type AsyncOperationCompletedHandler_String is access all AsyncOperationCompletedHandler_String_Interface'Class;
   type AsyncOperationCompletedHandler_String_Ptr is access all AsyncOperationCompletedHandler_String;
   type AsyncOperationCompletedHandler_Boolean_Interface;
   type AsyncOperationCompletedHandler_Boolean is access all AsyncOperationCompletedHandler_Boolean_Interface'Class;
   type AsyncOperationCompletedHandler_Boolean_Ptr is access all AsyncOperationCompletedHandler_Boolean;
   type AsyncOperationCompletedHandler_DateTime_Interface;
   type AsyncOperationCompletedHandler_DateTime is access all AsyncOperationCompletedHandler_DateTime_Interface'Class;
   type AsyncOperationCompletedHandler_DateTime_Ptr is access all AsyncOperationCompletedHandler_DateTime;
   type AsyncOperationCompletedHandler_TimeSpan_Interface;
   type AsyncOperationCompletedHandler_TimeSpan is access all AsyncOperationCompletedHandler_TimeSpan_Interface'Class;
   type AsyncOperationCompletedHandler_TimeSpan_Ptr is access all AsyncOperationCompletedHandler_TimeSpan;
   type EventHandler_Object_Interface;
   type EventHandler_Object is access all EventHandler_Object_Interface'Class;
   type EventHandler_Object_Ptr is access all EventHandler_Object;
   type TypedEventHandler_IMemoryBufferReference_add_Closed_Interface;
   type TypedEventHandler_IMemoryBufferReference_add_Closed is access all TypedEventHandler_IMemoryBufferReference_add_Closed_Interface'Class;
   type TypedEventHandler_IMemoryBufferReference_add_Closed_Ptr is access all TypedEventHandler_IMemoryBufferReference_add_Closed;
   type AsyncOperationCompletedHandler_IUriRuntimeClass_Interface;
   type AsyncOperationCompletedHandler_IUriRuntimeClass is access all AsyncOperationCompletedHandler_IUriRuntimeClass_Interface'Class;
   type AsyncOperationCompletedHandler_IUriRuntimeClass_Ptr is access all AsyncOperationCompletedHandler_IUriRuntimeClass;
   type AsyncActionProgressHandler_Double_Interface;
   type AsyncActionProgressHandler_Double is access all AsyncActionProgressHandler_Double_Interface'Class;
   type AsyncActionProgressHandler_Double_Ptr is access all AsyncActionProgressHandler_Double;
   type AsyncActionWithProgressCompletedHandler_Double_Interface;
   type AsyncActionWithProgressCompletedHandler_Double is access all AsyncActionWithProgressCompletedHandler_Double_Interface'Class;
   type AsyncActionWithProgressCompletedHandler_Double_Ptr is access all AsyncActionWithProgressCompletedHandler_Double;
   type AsyncActionProgressHandler_UInt64_Interface;
   type AsyncActionProgressHandler_UInt64 is access all AsyncActionProgressHandler_UInt64_Interface'Class;
   type AsyncActionProgressHandler_UInt64_Ptr is access all AsyncActionProgressHandler_UInt64;
   type AsyncActionWithProgressCompletedHandler_UInt64_Interface;
   type AsyncActionWithProgressCompletedHandler_UInt64 is access all AsyncActionWithProgressCompletedHandler_UInt64_Interface'Class;
   type AsyncActionWithProgressCompletedHandler_UInt64_Ptr is access all AsyncActionWithProgressCompletedHandler_UInt64;
   type VectorChangedEventHandler_Object_Interface;
   type VectorChangedEventHandler_Object is access all VectorChangedEventHandler_Object_Interface'Class;
   type VectorChangedEventHandler_Object_Ptr is access all VectorChangedEventHandler_Object;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IClosable_Interface;
   type IClosable is access all IClosable_Interface'Class;
   type IClosable_Ptr is access all IClosable;
   type IPropertyValue_Interface;
   type IPropertyValue is access all IPropertyValue_Interface'Class;
   type IPropertyValue_Ptr is access all IPropertyValue;
   type IPropertyValueStatics_Interface;
   type IPropertyValueStatics is access all IPropertyValueStatics_Interface'Class;
   type IPropertyValueStatics_Ptr is access all IPropertyValueStatics;
   type IStringable_Interface;
   type IStringable is access all IStringable_Interface'Class;
   type IStringable_Ptr is access all IStringable;
   type IDeferral_Interface;
   type IDeferral is access all IDeferral_Interface'Class;
   type IDeferral_Ptr is access all IDeferral;
   type IDeferralFactory_Interface;
   type IDeferralFactory is access all IDeferralFactory_Interface'Class;
   type IDeferralFactory_Ptr is access all IDeferralFactory;
   type IAsyncInfo_Interface;
   type IAsyncInfo is access all IAsyncInfo_Interface'Class;
   type IAsyncInfo_Ptr is access all IAsyncInfo;
   type IAsyncAction_Interface;
   type IAsyncAction is access all IAsyncAction_Interface'Class;
   type IAsyncAction_Ptr is access all IAsyncAction;
   type IMemoryBufferReference_Interface;
   type IMemoryBufferReference is access all IMemoryBufferReference_Interface'Class;
   type IMemoryBufferReference_Ptr is access all IMemoryBufferReference;
   type IMemoryBuffer_Interface;
   type IMemoryBuffer is access all IMemoryBuffer_Interface'Class;
   type IMemoryBuffer_Ptr is access all IMemoryBuffer;
   type IMemoryBufferFactory_Interface;
   type IMemoryBufferFactory is access all IMemoryBufferFactory_Interface'Class;
   type IMemoryBufferFactory_Ptr is access all IMemoryBufferFactory;
   type IUriRuntimeClass_Interface;
   type IUriRuntimeClass is access all IUriRuntimeClass_Interface'Class;
   type IUriRuntimeClass_Ptr is access all IUriRuntimeClass;
   type IVectorView_IWwwFormUrlDecoderEntry_Interface;
   type IVectorView_IWwwFormUrlDecoderEntry is access all IVectorView_IWwwFormUrlDecoderEntry_Interface'Class;
   type IVectorView_IWwwFormUrlDecoderEntry_Ptr is access all IVectorView_IWwwFormUrlDecoderEntry;
   type IIterable_IWwwFormUrlDecoderEntry_Interface;
   type IIterable_IWwwFormUrlDecoderEntry is access all IIterable_IWwwFormUrlDecoderEntry_Interface'Class;
   type IIterable_IWwwFormUrlDecoderEntry_Ptr is access all IIterable_IWwwFormUrlDecoderEntry;
   type IUriRuntimeClassWithAbsoluteCanonicalUri_Interface;
   type IUriRuntimeClassWithAbsoluteCanonicalUri is access all IUriRuntimeClassWithAbsoluteCanonicalUri_Interface'Class;
   type IUriRuntimeClassWithAbsoluteCanonicalUri_Ptr is access all IUriRuntimeClassWithAbsoluteCanonicalUri;
   type IUriEscapeStatics_Interface;
   type IUriEscapeStatics is access all IUriEscapeStatics_Interface'Class;
   type IUriEscapeStatics_Ptr is access all IUriEscapeStatics;
   type IUriRuntimeClassFactory_Interface;
   type IUriRuntimeClassFactory is access all IUriRuntimeClassFactory_Interface'Class;
   type IUriRuntimeClassFactory_Ptr is access all IUriRuntimeClassFactory;
   type IWwwFormUrlDecoderEntry_Interface;
   type IWwwFormUrlDecoderEntry is access all IWwwFormUrlDecoderEntry_Interface'Class;
   type IWwwFormUrlDecoderEntry_Ptr is access all IWwwFormUrlDecoderEntry;
   type IWwwFormUrlDecoderRuntimeClass_Interface;
   type IWwwFormUrlDecoderRuntimeClass is access all IWwwFormUrlDecoderRuntimeClass_Interface'Class;
   type IWwwFormUrlDecoderRuntimeClass_Ptr is access all IWwwFormUrlDecoderRuntimeClass;
   type IWwwFormUrlDecoderRuntimeClassFactory_Interface;
   type IWwwFormUrlDecoderRuntimeClassFactory is access all IWwwFormUrlDecoderRuntimeClassFactory_Interface'Class;
   type IWwwFormUrlDecoderRuntimeClassFactory_Ptr is access all IWwwFormUrlDecoderRuntimeClassFactory;
   type IGetActivationFactory_Interface;
   type IGetActivationFactory is access all IGetActivationFactory_Interface'Class;
   type IGetActivationFactory_Ptr is access all IGetActivationFactory;
   type IReference_Object_Interface;
   type IReference_Object is access all IReference_Object_Interface'Class;
   type IReference_Object_Ptr is access all IReference_Object;
   type IAsyncOperation_Object_Interface;
   type IAsyncOperation_Object is access all IAsyncOperation_Object_Interface'Class;
   type IAsyncOperation_Object_Ptr is access all IAsyncOperation_Object;
   type IReference_UInt8_Interface;
   type IReference_UInt8 is access all IReference_UInt8_Interface'Class;
   type IReference_UInt8_Ptr is access all IReference_UInt8;
   type IAsyncOperation_UInt8_Interface;
   type IAsyncOperation_UInt8 is access all IAsyncOperation_UInt8_Interface'Class;
   type IAsyncOperation_UInt8_Ptr is access all IAsyncOperation_UInt8;
   type IReference_UInt16_Interface;
   type IReference_UInt16 is access all IReference_UInt16_Interface'Class;
   type IReference_UInt16_Ptr is access all IReference_UInt16;
   type IAsyncOperation_UInt16_Interface;
   type IAsyncOperation_UInt16 is access all IAsyncOperation_UInt16_Interface'Class;
   type IAsyncOperation_UInt16_Ptr is access all IAsyncOperation_UInt16;
   type IReference_UInt32_Interface;
   type IReference_UInt32 is access all IReference_UInt32_Interface'Class;
   type IReference_UInt32_Ptr is access all IReference_UInt32;
   type IAsyncOperation_UInt32_Interface;
   type IAsyncOperation_UInt32 is access all IAsyncOperation_UInt32_Interface'Class;
   type IAsyncOperation_UInt32_Ptr is access all IAsyncOperation_UInt32;
   type IReference_UInt64_Interface;
   type IReference_UInt64 is access all IReference_UInt64_Interface'Class;
   type IReference_UInt64_Ptr is access all IReference_UInt64;
   type IAsyncOperation_UInt64_Interface;
   type IAsyncOperation_UInt64 is access all IAsyncOperation_UInt64_Interface'Class;
   type IAsyncOperation_UInt64_Ptr is access all IAsyncOperation_UInt64;
   type IReference_Int8_Interface;
   type IReference_Int8 is access all IReference_Int8_Interface'Class;
   type IReference_Int8_Ptr is access all IReference_Int8;
   type IAsyncOperation_Int8_Interface;
   type IAsyncOperation_Int8 is access all IAsyncOperation_Int8_Interface'Class;
   type IAsyncOperation_Int8_Ptr is access all IAsyncOperation_Int8;
   type IReference_Int16_Interface;
   type IReference_Int16 is access all IReference_Int16_Interface'Class;
   type IReference_Int16_Ptr is access all IReference_Int16;
   type IAsyncOperation_Int16_Interface;
   type IAsyncOperation_Int16 is access all IAsyncOperation_Int16_Interface'Class;
   type IAsyncOperation_Int16_Ptr is access all IAsyncOperation_Int16;
   type IReference_Int32_Interface;
   type IReference_Int32 is access all IReference_Int32_Interface'Class;
   type IReference_Int32_Ptr is access all IReference_Int32;
   type IAsyncOperation_Int32_Interface;
   type IAsyncOperation_Int32 is access all IAsyncOperation_Int32_Interface'Class;
   type IAsyncOperation_Int32_Ptr is access all IAsyncOperation_Int32;
   type IReference_Int64_Interface;
   type IReference_Int64 is access all IReference_Int64_Interface'Class;
   type IReference_Int64_Ptr is access all IReference_Int64;
   type IAsyncOperation_Int64_Interface;
   type IAsyncOperation_Int64 is access all IAsyncOperation_Int64_Interface'Class;
   type IAsyncOperation_Int64_Ptr is access all IAsyncOperation_Int64;
   type IReference_Guid_Interface;
   type IReference_Guid is access all IReference_Guid_Interface'Class;
   type IReference_Guid_Ptr is access all IReference_Guid;
   type IAsyncOperation_Guid_Interface;
   type IAsyncOperation_Guid is access all IAsyncOperation_Guid_Interface'Class;
   type IAsyncOperation_Guid_Ptr is access all IAsyncOperation_Guid;
   type IReference_Single_Interface;
   type IReference_Single is access all IReference_Single_Interface'Class;
   type IReference_Single_Ptr is access all IReference_Single;
   type IAsyncOperation_Single_Interface;
   type IAsyncOperation_Single is access all IAsyncOperation_Single_Interface'Class;
   type IAsyncOperation_Single_Ptr is access all IAsyncOperation_Single;
   type IReference_Double_Interface;
   type IReference_Double is access all IReference_Double_Interface'Class;
   type IReference_Double_Ptr is access all IReference_Double;
   type IAsyncOperation_Double_Interface;
   type IAsyncOperation_Double is access all IAsyncOperation_Double_Interface'Class;
   type IAsyncOperation_Double_Ptr is access all IAsyncOperation_Double;
   type IReference_String_Interface;
   type IReference_String is access all IReference_String_Interface'Class;
   type IReference_String_Ptr is access all IReference_String;
   type IAsyncOperation_String_Interface;
   type IAsyncOperation_String is access all IAsyncOperation_String_Interface'Class;
   type IAsyncOperation_String_Ptr is access all IAsyncOperation_String;
   type IReference_Boolean_Interface;
   type IReference_Boolean is access all IReference_Boolean_Interface'Class;
   type IReference_Boolean_Ptr is access all IReference_Boolean;
   type IAsyncOperation_Boolean_Interface;
   type IAsyncOperation_Boolean is access all IAsyncOperation_Boolean_Interface'Class;
   type IAsyncOperation_Boolean_Ptr is access all IAsyncOperation_Boolean;
   type IReference_DateTime_Interface;
   type IReference_DateTime is access all IReference_DateTime_Interface'Class;
   type IReference_DateTime_Ptr is access all IReference_DateTime;
   type IAsyncOperation_DateTime_Interface;
   type IAsyncOperation_DateTime is access all IAsyncOperation_DateTime_Interface'Class;
   type IAsyncOperation_DateTime_Ptr is access all IAsyncOperation_DateTime;
   type IReference_TimeSpan_Interface;
   type IReference_TimeSpan is access all IReference_TimeSpan_Interface'Class;
   type IReference_TimeSpan_Ptr is access all IReference_TimeSpan;
   type IAsyncOperation_TimeSpan_Interface;
   type IAsyncOperation_TimeSpan is access all IAsyncOperation_TimeSpan_Interface'Class;
   type IAsyncOperation_TimeSpan_Ptr is access all IAsyncOperation_TimeSpan;
   type IIterator_IUriRuntimeClass_Interface;
   type IIterator_IUriRuntimeClass is access all IIterator_IUriRuntimeClass_Interface'Class;
   type IIterator_IUriRuntimeClass_Ptr is access all IIterator_IUriRuntimeClass;
   type IIterable_IUriRuntimeClass_Interface;
   type IIterable_IUriRuntimeClass is access all IIterable_IUriRuntimeClass_Interface'Class;
   type IIterable_IUriRuntimeClass_Ptr is access all IIterable_IUriRuntimeClass;
   type IVectorView_IUriRuntimeClass_Interface;
   type IVectorView_IUriRuntimeClass is access all IVectorView_IUriRuntimeClass_Interface'Class;
   type IVectorView_IUriRuntimeClass_Ptr is access all IVectorView_IUriRuntimeClass;
   type IAsyncOperation_IUriRuntimeClass_Interface;
   type IAsyncOperation_IUriRuntimeClass is access all IAsyncOperation_IUriRuntimeClass_Interface'Class;
   type IAsyncOperation_IUriRuntimeClass_Ptr is access all IAsyncOperation_IUriRuntimeClass;
   type IReference_Rect_Interface;
   type IReference_Rect is access all IReference_Rect_Interface'Class;
   type IReference_Rect_Ptr is access all IReference_Rect;
   type IIterator_Size_Interface;
   type IIterator_Size is access all IIterator_Size_Interface'Class;
   type IIterator_Size_Ptr is access all IIterator_Size;
   type IIterable_Size_Interface;
   type IIterable_Size is access all IIterable_Size_Interface'Class;
   type IIterable_Size_Ptr is access all IIterable_Size;
   type IVectorView_Size_Interface;
   type IVectorView_Size is access all IVectorView_Size_Interface'Class;
   type IVectorView_Size_Ptr is access all IVectorView_Size;
   type IAsyncActionWithProgress_Double_Interface;
   type IAsyncActionWithProgress_Double is access all IAsyncActionWithProgress_Double_Interface'Class;
   type IAsyncActionWithProgress_Double_Ptr is access all IAsyncActionWithProgress_Double;
   type IVector_IUriRuntimeClass_Interface;
   type IVector_IUriRuntimeClass is access all IVector_IUriRuntimeClass_Interface'Class;
   type IVector_IUriRuntimeClass_Ptr is access all IVector_IUriRuntimeClass;
   type IIterator_Point_Interface;
   type IIterator_Point is access all IIterator_Point_Interface'Class;
   type IIterator_Point_Ptr is access all IIterator_Point;
   type IIterable_Point_Interface;
   type IIterable_Point is access all IIterable_Point_Interface'Class;
   type IIterable_Point_Ptr is access all IIterable_Point;
   type IVectorView_Point_Interface;
   type IVectorView_Point is access all IVectorView_Point_Interface'Class;
   type IVectorView_Point_Ptr is access all IVectorView_Point;
   type IAsyncActionWithProgress_UInt64_Interface;
   type IAsyncActionWithProgress_UInt64 is access all IAsyncActionWithProgress_UInt64_Interface'Class;
   type IAsyncActionWithProgress_UInt64_Ptr is access all IAsyncActionWithProgress_UInt64;
   type IObservableVector_Object_Interface;
   type IObservableVector_Object is access all IObservableVector_Object_Interface'Class;
   type IObservableVector_Object_Ptr is access all IObservableVector_Object;
   type IReference_Point_Interface;
   type IReference_Point is access all IReference_Point_Interface'Class;
   type IReference_Point_Ptr is access all IReference_Point;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IClosable : aliased constant Windows.IID := (819308585, 32676, 16422, (131, 187, 215, 91, 174, 78, 169, 158 ));
   
   type IClosable_Interface is interface and Windows.IInspectable_Interface;
   
   function Close
   (
      This       : access IClosable_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPropertyValue : aliased constant Windows.IID := (1272349405, 30036, 16617, (154, 155, 130, 101, 78, 222, 126, 98 ));
   
   type IPropertyValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Foundation.PropertyType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsNumericScalar
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetUInt8
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function GetInt16
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function GetUInt16
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function GetInt32
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetUInt32
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetInt64
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function GetUInt64
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function GetSingle
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function GetDouble
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function GetChar16
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function GetBoolean
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetString
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetGuid
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function GetDateTime
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function GetTimeSpan
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function GetPoint
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function GetSize
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function GetRect
   (
      This       : access IPropertyValue_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function GetUInt8Array
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetInt16Array
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Int16_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetUInt16Array
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.UInt16_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetInt32Array
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Int32_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetUInt32Array
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.UInt32_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetInt64Array
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Int64_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetUInt64Array
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.UInt64_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetSingleArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Single_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetDoubleArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Double_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetChar16Array
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetBooleanArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Boolean_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetStringArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.String_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetInspectableArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Object_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetGuidArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Guid_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetDateTimeArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Foundation.DateTime_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetTimeSpanArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Foundation.TimeSpan_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetPointArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Foundation.Point_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetSizeArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Foundation.Size_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetRectArray
   (
      This       : access IPropertyValue_Interface
      ; value : access Windows.Foundation.Rect_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPropertyValueStatics : aliased constant Windows.IID := (1654381512, 55602, 20468, (150, 185, 141, 150, 197, 193, 232, 88 ));
   
   type IPropertyValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateEmpty
   (
      This       : access IPropertyValueStatics_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateUInt8
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.UInt8
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateInt16
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Int16
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateUInt16
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.UInt16
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateInt32
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Int32
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateUInt32
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.UInt32
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateInt64
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Int64
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateUInt64
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.UInt64
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateSingle
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Single
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateDouble
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Double
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateChar16
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.UInt8
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateBoolean
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Boolean
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateString
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateInspectable
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Object
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateGuid
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Guid
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateDateTime
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Foundation.DateTime
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateTimeSpan
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreatePoint
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Foundation.Point
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateSize
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Foundation.Size
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateRect
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Foundation.Rect
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateUInt8Array
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.UInt8_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateInt16Array
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Int16_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateUInt16Array
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.UInt16_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateInt32Array
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Int32_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateUInt32Array
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.UInt32_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateInt64Array
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Int64_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateUInt64Array
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.UInt64_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateSingleArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Single_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateDoubleArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Double_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateChar16Array
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.UInt8_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateBooleanArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Boolean_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateStringArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.String_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateInspectableArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Object_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateGuidArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Guid_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateDateTimeArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Foundation.DateTime_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateTimeSpanArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Foundation.TimeSpan_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreatePointArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Foundation.Point_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateSizeArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Foundation.Size_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateRectArray
   (
      This       : access IPropertyValueStatics_Interface
      ; value : Windows.Foundation.Rect_Ptr
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStringable : aliased constant Windows.IID := (2520162132, 36534, 18672, (171, 206, 193, 178, 17, 230, 39, 195 ));
   
   type IStringable_Interface is interface and Windows.IInspectable_Interface;
   
   function ToString
   (
      This       : access IStringable_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeferral : aliased constant Windows.IID := (3592853298, 15231, 18087, (180, 11, 79, 220, 162, 162, 198, 147 ));
   
   type IDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeferralFactory : aliased constant Windows.IID := (1705110725, 16309, 18482, (140, 169, 240, 97, 178, 129, 209, 58 ));
   
   type IDeferralFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IDeferralFactory_Interface
      ; handler : Windows.Foundation.DeferralCompletedHandler
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncInfo : aliased constant Windows.IID := (54, 0, 0, (192, 0, 0, 0, 0, 0, 0, 70 ));
   
   type IAsyncInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IAsyncInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IAsyncInfo_Interface
      ; RetVal : access Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IAsyncInfo_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function Cancel
   (
      This       : access IAsyncInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access IAsyncInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncAction : aliased constant Windows.IID := (1516535814, 33850, 19881, (134, 91, 157, 38, 229, 223, 173, 123 ));
   
   type IAsyncAction_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncAction_Interface
      ; handler : Windows.Foundation.AsyncActionCompletedHandler
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncAction_Interface
      ; RetVal : access Windows.Foundation.AsyncActionCompletedHandler
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncAction_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMemoryBufferReference : aliased constant Windows.IID := (4223982889, 9307, 4580, (175, 152, 104, 148, 35, 38, 12, 248 ));
   
   type IMemoryBufferReference_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Capacity
   (
      This       : access IMemoryBufferReference_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_Closed
   (
      This       : access IMemoryBufferReference_Interface
      ; handler : TypedEventHandler_IMemoryBufferReference_add_Closed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access IMemoryBufferReference_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMemoryBuffer : aliased constant Windows.IID := (4223982890, 9307, 4580, (175, 152, 104, 148, 35, 38, 12, 248 ));
   
   type IMemoryBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateReference
   (
      This       : access IMemoryBuffer_Interface
      ; RetVal : access Windows.Foundation.IMemoryBufferReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMemoryBufferFactory : aliased constant Windows.IID := (4223982891, 9307, 4580, (175, 152, 104, 148, 35, 38, 12, 248 ));
   
   type IMemoryBufferFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IMemoryBufferFactory_Interface
      ; capacity : Windows.UInt32
      ; RetVal : access Windows.Foundation.IMemoryBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUriRuntimeClass : aliased constant Windows.IID := (2654363223, 18610, 16736, (149, 111, 199, 56, 81, 32, 187, 252 ));
   
   type IUriRuntimeClass_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AbsoluteUri
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayUri
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Domain
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Extension
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Fragment
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Host
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Password
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Query
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_QueryParsed
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.Foundation.IWwwFormUrlDecoderRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_RawUri
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SchemeName
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserName
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Port
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Suspicious
   (
      This       : access IUriRuntimeClass_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Equals
   (
      This       : access IUriRuntimeClass_Interface
      ; pUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CombineUri
   (
      This       : access IUriRuntimeClass_Interface
      ; relativeUri : Windows.String
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWwwFormUrlDecoderEntry : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_IWwwFormUrlDecoderEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWwwFormUrlDecoderEntry_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Foundation.IWwwFormUrlDecoderEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWwwFormUrlDecoderEntry_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWwwFormUrlDecoderEntry_Interface
      ; value : Windows.Foundation.IWwwFormUrlDecoderEntry
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWwwFormUrlDecoderEntry_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Foundation.IWwwFormUrlDecoderEntry_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWwwFormUrlDecoderEntry : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IWwwFormUrlDecoderEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWwwFormUrlDecoderEntry_Interface
      ; RetVal : access Windows.Foundation.IWwwFormUrlDecoderEntry
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUriRuntimeClassWithAbsoluteCanonicalUri : aliased constant Windows.IID := (1972213345, 8732, 18447, (163, 57, 80, 101, 102, 115, 244, 111 ));
   
   type IUriRuntimeClassWithAbsoluteCanonicalUri_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AbsoluteCanonicalUri
   (
      This       : access IUriRuntimeClassWithAbsoluteCanonicalUri_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayIri
   (
      This       : access IUriRuntimeClassWithAbsoluteCanonicalUri_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUriEscapeStatics : aliased constant Windows.IID := (3251909306, 51236, 17490, (167, 253, 81, 43, 195, 187, 233, 161 ));
   
   type IUriEscapeStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function UnescapeComponent
   (
      This       : access IUriEscapeStatics_Interface
      ; toUnescape : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function EscapeComponent
   (
      This       : access IUriEscapeStatics_Interface
      ; toEscape : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUriRuntimeClassFactory : aliased constant Windows.IID := (1151957359, 29246, 20447, (162, 24, 3, 62, 117, 176, 192, 132 ));
   
   type IUriRuntimeClassFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateUri
   (
      This       : access IUriRuntimeClassFactory_Interface
      ; uri : Windows.String
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithRelativeUri
   (
      This       : access IUriRuntimeClassFactory_Interface
      ; baseUri : Windows.String
      ; relativeUri : Windows.String
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWwwFormUrlDecoderEntry : aliased constant Windows.IID := (308180017, 63096, 20110, (182, 112, 32, 169, 176, 108, 81, 45 ));
   
   type IWwwFormUrlDecoderEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IWwwFormUrlDecoderEntry_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IWwwFormUrlDecoderEntry_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWwwFormUrlDecoderRuntimeClass : aliased constant Windows.IID := (3562669137, 61989, 17730, (146, 150, 14, 29, 245, 210, 84, 223 ));
   
   type IWwwFormUrlDecoderRuntimeClass_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFirstValueByName
   (
      This       : access IWwwFormUrlDecoderRuntimeClass_Interface
      ; name : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWwwFormUrlDecoderRuntimeClassFactory : aliased constant Windows.IID := (1535929149, 9390, 16821, (161, 191, 240, 195, 213, 68, 132, 91 ));
   
   type IWwwFormUrlDecoderRuntimeClassFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWwwFormUrlDecoder
   (
      This       : access IWwwFormUrlDecoderRuntimeClassFactory_Interface
      ; query : Windows.String
      ; RetVal : access Windows.Foundation.IWwwFormUrlDecoderRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGetActivationFactory : aliased constant Windows.IID := (1323011810, 38621, 18855, (148, 247, 70, 7, 221, 171, 142, 60 ));
   
   type IGetActivationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function GetActivationFactory
   (
      This       : access IGetActivationFactory_Interface
      ; activatableClassId : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Object_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_Object_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_Object_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_Object
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_Object_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_UInt8_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_UInt8_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_UInt8_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_UInt8_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_UInt8_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_UInt8
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_UInt8_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_UInt16_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_UInt16_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_UInt16_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_UInt16_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_UInt16_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_UInt16
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_UInt16_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_UInt32_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_UInt32_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_UInt32_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_UInt32_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_UInt32_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_UInt32_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_UInt64_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_UInt64_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_UInt64_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_UInt64_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_UInt64_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_UInt64
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_UInt64_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_Int8_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Int8_Interface
      ; RetVal : access Windows.Int8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_Int8_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_Int8_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_Int8
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_Int8_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_Int8
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_Int8_Interface
      ; RetVal : access Windows.Int8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_Int16_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Int16_Interface
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_Int16_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_Int16_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_Int16
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_Int16_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_Int16
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_Int16_Interface
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_Int32_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Int32_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_Int32_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_Int32_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_Int32_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_Int32_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_Int64_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Int64_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_Int64_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_Int64_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_Int64_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_Int64
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_Int64_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_Guid_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Guid_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_Guid_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_Guid_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_Guid_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_Guid
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_Guid_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_Single_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Single_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_Single_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_Single_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_Single_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_Single
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_Single_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_Double_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Double_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_Double_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_Double_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_Double_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_Double
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_Double_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_String_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_String_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_String_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_String_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_String
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_String_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_String
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_String_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_Boolean_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Boolean_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_Boolean_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_Boolean_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_Boolean_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_Boolean_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_DateTime_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_DateTime_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_DateTime_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_DateTime_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_DateTime_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_DateTime_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IReference_TimeSpan_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_TimeSpan_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAsyncOperation_TimeSpan_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_TimeSpan_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_TimeSpan_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_TimeSpan_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IUriRuntimeClass : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_IUriRuntimeClass_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUriRuntimeClass_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUriRuntimeClass_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUriRuntimeClass_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUriRuntimeClass_Interface
      ; items : Windows.Foundation.IUriRuntimeClass_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IUriRuntimeClass : aliased constant Windows.IID := (2966829944, 30893, 24113, (182, 216, 227, 42, 14, 22, 196, 71 ));
   
   type IIterable_IUriRuntimeClass_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUriRuntimeClass_Interface
      ; RetVal : access Windows.Foundation.IIterator_IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IUriRuntimeClass : aliased constant Windows.IID := (1266910653, 41677, 24561, (191, 116, 126, 165, 128, 66, 62, 80 ));
   
   type IVectorView_IUriRuntimeClass_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUriRuntimeClass_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUriRuntimeClass_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUriRuntimeClass_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUriRuntimeClass_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Foundation.IUriRuntimeClass_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IUriRuntimeClass : aliased constant Windows.IID := (1679604189, 41613, 23010, (184, 219, 162, 39, 237, 166, 207, 46 ));
   
   type IAsyncOperation_IUriRuntimeClass_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUriRuntimeClass_Interface
      ; handler : Windows.Foundation.AsyncOperationCompletedHandler_IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUriRuntimeClass_Interface
      ; RetVal : access Windows.Foundation.AsyncOperationCompletedHandler_IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUriRuntimeClass_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_Rect : aliased constant Windows.IID := (2151825169, 1359, 24236, (175, 211, 99, 182, 206, 21, 231, 123 ));
   
   type IReference_Rect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Rect_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_Size : aliased constant Windows.IID := (2739965664, 13607, 20804, (137, 77, 66, 46, 173, 239, 67, 215 ));
   
   type IIterator_Size_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Size_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Size_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Size_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Size_Interface
      ; items : Windows.Foundation.Size_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_Size : aliased constant Windows.IID := (3386856899, 19777, 24208, (186, 118, 232, 158, 213, 100, 68, 107 ));
   
   type IIterable_Size_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Size_Interface
      ; RetVal : access Windows.Foundation.IIterator_Size
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_Size : aliased constant Windows.IID := (3411032061, 26123, 20981, (157, 40, 135, 244, 8, 120, 38, 141 ));
   
   type IVectorView_Size_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Size_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Size_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Size_Interface
      ; value : Windows.Foundation.Size
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Size_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Foundation.Size_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncActionWithProgress_Double : aliased constant Windows.IID := (1326723238, 43045, 22218, (176, 71, 26, 155, 173, 82, 186, 103 ));
   
   type IAsyncActionWithProgress_Double_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Progress
   (
      This       : access IAsyncActionWithProgress_Double_Interface
      ; handler : Windows.Foundation.AsyncActionProgressHandler_Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IAsyncActionWithProgress_Double_Interface
      ; RetVal : access Windows.Foundation.AsyncActionProgressHandler_Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Completed
   (
      This       : access IAsyncActionWithProgress_Double_Interface
      ; handler : Windows.Foundation.AsyncActionWithProgressCompletedHandler_Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncActionWithProgress_Double_Interface
      ; RetVal : access Windows.Foundation.AsyncActionWithProgressCompletedHandler_Double
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncActionWithProgress_Double_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IUriRuntimeClass : aliased constant Windows.IID := (226672013, 65122, 23911, (167, 185, 120, 134, 221, 117, 188, 78 ));
   
   type IVector_IUriRuntimeClass_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IUriRuntimeClass_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IUriRuntimeClass_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IUriRuntimeClass_Interface
      ; RetVal : access Windows.Foundation.IVectorView_IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IUriRuntimeClass_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IUriRuntimeClass_Interface
      ; index : Windows.UInt32
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IUriRuntimeClass_Interface
      ; index : Windows.UInt32
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IUriRuntimeClass_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IUriRuntimeClass_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IUriRuntimeClass_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IUriRuntimeClass_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IUriRuntimeClass_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Foundation.IUriRuntimeClass_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IUriRuntimeClass_Interface
      ; items : Windows.Foundation.IUriRuntimeClass_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_Point : aliased constant Windows.IID := (3322066334, 2702, 24217, (180, 120, 43, 86, 69, 133, 39, 141 ));
   
   type IIterator_Point_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Point_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Point_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Point_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Point_Interface
      ; items : Windows.Foundation.Point_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_Point : aliased constant Windows.IID := (3247581197, 14857, 21539, (157, 197, 103, 184, 62, 189, 228, 29 ));
   
   type IIterable_Point_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Point_Interface
      ; RetVal : access Windows.Foundation.IIterator_Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_Point : aliased constant Windows.IID := (192629917, 6191, 22570, (189, 219, 66, 177, 170, 195, 12, 173 ));
   
   type IVectorView_Point_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Point_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Point_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Point_Interface
      ; value : Windows.Foundation.Point
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Point_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Foundation.Point_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncActionWithProgress_UInt64 : aliased constant Windows.IID := (1140265936, 50333, 24149, (174, 191, 175, 57, 87, 104, 53, 30 ));
   
   type IAsyncActionWithProgress_UInt64_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Progress
   (
      This       : access IAsyncActionWithProgress_UInt64_Interface
      ; handler : Windows.Foundation.AsyncActionProgressHandler_UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IAsyncActionWithProgress_UInt64_Interface
      ; RetVal : access Windows.Foundation.AsyncActionProgressHandler_UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_Completed
   (
      This       : access IAsyncActionWithProgress_UInt64_Interface
      ; handler : Windows.Foundation.AsyncActionWithProgressCompletedHandler_UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncActionWithProgress_UInt64_Interface
      ; RetVal : access Windows.Foundation.AsyncActionWithProgressCompletedHandler_UInt64
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncActionWithProgress_UInt64_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IObservableVector_Object : aliased constant Windows.IID := (2072102250, 2437, 20877, (186, 169, 13, 169, 174, 0, 159, 101 ));
   
   type IObservableVector_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VectorChanged
   (
      This       : access IObservableVector_Object_Interface
      ; vhnd : Windows.Foundation.VectorChangedEventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VectorChanged
   (
      This       : access IObservableVector_Object_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_Point : aliased constant Windows.IID := (2230406178, 40970, 21106, (141, 61, 130, 17, 46, 102, 223, 0 ));
   
   type IReference_Point_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Point_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncActionCompletedHandler : aliased constant Windows.IID := (2767019137, 30409, 16573, (139, 230, 177, 217, 15, 178, 10, 231 ));
   
   type AsyncActionCompletedHandler_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncAction ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncActionCompletedHandler'access) with null record;
   function Invoke
   (
      This       : access AsyncActionCompletedHandler_Interface
      ; asyncInfo : Windows.Foundation.IAsyncAction
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_DeferralCompletedHandler : aliased constant Windows.IID := (3979518834, 62408, 20394, (156, 251, 71, 1, 72, 218, 56, 136 ));
   
   type DeferralCompletedHandler_Interface(Callback : access procedure) is new Windows.IMulticastDelegate_Interface(IID_DeferralCompletedHandler'access) with null record;
   function Invoke
   (
      This       : access DeferralCompletedHandler_Interface
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_Object : aliased constant Windows.IID := (1057498670, 41697, 20788, (146, 151, 233, 33, 31, 72, 26, 45 ));
   
   type AsyncOperationCompletedHandler_Object_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_Object ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_Object'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_Object_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Object
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_UInt8 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_UInt8_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_UInt8 ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_UInt8'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_UInt8_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_UInt8
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_UInt16 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_UInt16_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_UInt16 ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_UInt16'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_UInt16_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_UInt16
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_UInt32 : aliased constant Windows.IID := (2470688487, 58322, 24138, (171, 45, 43, 206, 73, 25, 166, 164 ));
   
   type AsyncOperationCompletedHandler_UInt32_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_UInt32 ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_UInt32'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_UInt32_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_UInt32
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_UInt64 : aliased constant Windows.IID := (4002081538, 64256, 20986, (143, 87, 50, 88, 62, 162, 65, 249 ));
   
   type AsyncOperationCompletedHandler_UInt64_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_UInt64 ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_UInt64'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_UInt64_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_UInt64
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_Int8 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_Int8_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_Int8 ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_Int8'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_Int8_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Int8
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_Int16 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_Int16_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_Int16 ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_Int16'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_Int16_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Int16
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_Int32 : aliased constant Windows.IID := (3591155357, 35019, 23025, (133, 118, 63, 186, 68, 121, 107, 232 ));
   
   type AsyncOperationCompletedHandler_Int32_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_Int32 ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_Int32'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_Int32_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Int32
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_Int64 : aliased constant Windows.IID := (3555678322, 32078, 22971, (149, 237, 121, 254, 15, 13, 190, 137 ));
   
   type AsyncOperationCompletedHandler_Int64_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_Int64 ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_Int64'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_Int64_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Int64
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_Guid : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_Guid_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_Guid ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_Guid'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_Guid_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Guid
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_Single : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_Single_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_Single ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_Single'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_Single_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Single
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_Double : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_Double_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_Double ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_Double'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_Double_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Double
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_String : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_String_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_String ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_String'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_String_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_String
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_Boolean : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_Boolean_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_Boolean ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_Boolean'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_Boolean_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Boolean
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_DateTime : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_DateTime_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_DateTime ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_DateTime'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DateTime_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_DateTime
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_TimeSpan : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_TimeSpan_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_TimeSpan ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_TimeSpan'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_TimeSpan_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_TimeSpan
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_Object : aliased constant Windows.IID := (3305674998, 50486, 24391, (133, 131, 139, 44, 36, 56, 161, 59 ));
   
   type EventHandler_Object_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_Object'access) with null record;
   function Invoke
   (
      This       : access EventHandler_Object_Interface
      ; sender : Windows.Object
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMemoryBufferReference_add_Closed : aliased constant Windows.IID := (4100160842, 1888, 21553, (191, 192, 36, 235, 29, 79, 108, 79 ));
   
   type TypedEventHandler_IMemoryBufferReference_add_Closed_Interface(Callback : access procedure (sender : Windows.Foundation.IMemoryBufferReference ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMemoryBufferReference_add_Closed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMemoryBufferReference_add_Closed_Interface
      ; sender : Windows.Foundation.IMemoryBufferReference
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IUriRuntimeClass : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_IUriRuntimeClass_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncOperation_IUriRuntimeClass ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IUriRuntimeClass'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUriRuntimeClass_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_IUriRuntimeClass
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncActionProgressHandler_Double : aliased constant Windows.IID := (1149394044, 3497, 22161, (178, 180, 145, 79, 35, 30, 236, 237 ));
   
   type AsyncActionProgressHandler_Double_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncActionWithProgress_Double ; progressInfo : Windows.Double)) is new Windows.IMulticastDelegate_Interface(IID_AsyncActionProgressHandler_Double'access) with null record;
   function Invoke
   (
      This       : access AsyncActionProgressHandler_Double_Interface
      ; asyncInfo : Windows.Foundation.IAsyncActionWithProgress_Double
      ; progressInfo : Windows.Double
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncActionWithProgressCompletedHandler_Double : aliased constant Windows.IID := (2497071814, 17553, 21487, (139, 232, 54, 72, 31, 63, 241, 232 ));
   
   type AsyncActionWithProgressCompletedHandler_Double_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncActionWithProgress_Double ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncActionWithProgressCompletedHandler_Double'access) with null record;
   function Invoke
   (
      This       : access AsyncActionWithProgressCompletedHandler_Double_Interface
      ; asyncInfo : Windows.Foundation.IAsyncActionWithProgress_Double
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncActionProgressHandler_UInt64 : aliased constant Windows.IID := (1440887754, 62019, 23266, (133, 59, 249, 204, 124, 10, 224, 207 ));
   
   type AsyncActionProgressHandler_UInt64_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncActionWithProgress_UInt64 ; progressInfo : Windows.UInt64)) is new Windows.IMulticastDelegate_Interface(IID_AsyncActionProgressHandler_UInt64'access) with null record;
   function Invoke
   (
      This       : access AsyncActionProgressHandler_UInt64_Interface
      ; asyncInfo : Windows.Foundation.IAsyncActionWithProgress_UInt64
      ; progressInfo : Windows.UInt64
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncActionWithProgressCompletedHandler_UInt64 : aliased constant Windows.IID := (3875505531, 61792, 22298, (169, 52, 44, 97, 249, 140, 134, 45 ));
   
   type AsyncActionWithProgressCompletedHandler_UInt64_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.IAsyncActionWithProgress_UInt64 ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncActionWithProgressCompletedHandler_UInt64'access) with null record;
   function Invoke
   (
      This       : access AsyncActionWithProgressCompletedHandler_UInt64_Interface
      ; asyncInfo : Windows.Foundation.IAsyncActionWithProgress_UInt64
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_VectorChangedEventHandler_Object : aliased constant Windows.IID := (3022235649, 54110, 22201, (129, 59, 0, 136, 149, 54, 203, 152 ));
   
   type VectorChangedEventHandler_Object_Interface(Callback : access procedure (sender : Windows.Foundation.IObservableVector_Object ; event : Windows.Foundation.Collections.IVectorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_VectorChangedEventHandler_Object'access) with null record;
   function Invoke
   (
      This       : access VectorChangedEventHandler_Object_Interface
      ; sender : Windows.Foundation.IObservableVector_Object
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Deferral is Windows.Foundation.IDeferral;
   function Create
   (
      handler : Windows.Foundation.DeferralCompletedHandler
   )
   return Windows.Foundation.IDeferral;
   
   subtype MemoryBuffer is Windows.Foundation.IMemoryBuffer;
   function Create
   (
      capacity : Windows.UInt32
   )
   return Windows.Foundation.IMemoryBuffer;
   
   subtype WwwFormUrlDecoder is Windows.Foundation.IWwwFormUrlDecoderRuntimeClass;
   function CreateWwwFormUrlDecoder
   (
      query : Windows.String
   )
   return Windows.Foundation.IWwwFormUrlDecoderRuntimeClass;
   
   subtype Uri is Windows.Foundation.IUriRuntimeClass;
   function CreateUri
   (
      uri : Windows.String
   )
   return Windows.Foundation.IUriRuntimeClass;
   
   function CreateWithRelativeUri
   (
      baseUri : Windows.String
      ; relativeUri : Windows.String
   )
   return Windows.Foundation.IUriRuntimeClass;
   
   subtype WwwFormUrlDecoderEntry is Windows.Foundation.IWwwFormUrlDecoderEntry;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateEmpty
   return Windows.Object;
   
   function CreateUInt8
   (
      value : Windows.UInt8
   )
   return Windows.Object;
   
   function CreateInt16
   (
      value : Windows.Int16
   )
   return Windows.Object;
   
   function CreateUInt16
   (
      value : Windows.UInt16
   )
   return Windows.Object;
   
   function CreateInt32
   (
      value : Windows.Int32
   )
   return Windows.Object;
   
   function CreateUInt32
   (
      value : Windows.UInt32
   )
   return Windows.Object;
   
   function CreateInt64
   (
      value : Windows.Int64
   )
   return Windows.Object;
   
   function CreateUInt64
   (
      value : Windows.UInt64
   )
   return Windows.Object;
   
   function CreateSingle
   (
      value : Windows.Single
   )
   return Windows.Object;
   
   function CreateDouble
   (
      value : Windows.Double
   )
   return Windows.Object;
   
   function CreateChar16
   (
      value : Windows.UInt8
   )
   return Windows.Object;
   
   function CreateBoolean
   (
      value : Windows.Boolean
   )
   return Windows.Object;
   
   function CreateString
   (
      value : Windows.String
   )
   return Windows.Object;
   
   function CreateInspectable
   (
      value : Windows.Object
   )
   return Windows.Object;
   
   function CreateGuid
   (
      value : Windows.Guid
   )
   return Windows.Object;
   
   function CreateDateTime
   (
      value : Windows.Foundation.DateTime
   )
   return Windows.Object;
   
   function CreateTimeSpan
   (
      value : Windows.Foundation.TimeSpan
   )
   return Windows.Object;
   
   function CreatePoint
   (
      value : Windows.Foundation.Point
   )
   return Windows.Object;
   
   function CreateSize
   (
      value : Windows.Foundation.Size
   )
   return Windows.Object;
   
   function CreateRect
   (
      value : Windows.Foundation.Rect
   )
   return Windows.Object;
   
   function CreateUInt8Array
   (
      value : Windows.UInt8_Ptr
   )
   return Windows.Object;
   
   function CreateInt16Array
   (
      value : Windows.Int16_Ptr
   )
   return Windows.Object;
   
   function CreateUInt16Array
   (
      value : Windows.UInt16_Ptr
   )
   return Windows.Object;
   
   function CreateInt32Array
   (
      value : Windows.Int32_Ptr
   )
   return Windows.Object;
   
   function CreateUInt32Array
   (
      value : Windows.UInt32_Ptr
   )
   return Windows.Object;
   
   function CreateInt64Array
   (
      value : Windows.Int64_Ptr
   )
   return Windows.Object;
   
   function CreateUInt64Array
   (
      value : Windows.UInt64_Ptr
   )
   return Windows.Object;
   
   function CreateSingleArray
   (
      value : Windows.Single_Ptr
   )
   return Windows.Object;
   
   function CreateDoubleArray
   (
      value : Windows.Double_Ptr
   )
   return Windows.Object;
   
   function CreateChar16Array
   (
      value : Windows.UInt8_Ptr
   )
   return Windows.Object;
   
   function CreateBooleanArray
   (
      value : Windows.Boolean_Ptr
   )
   return Windows.Object;
   
   function CreateStringArray
   (
      value : Windows.String_Ptr
   )
   return Windows.Object;
   
   function CreateInspectableArray
   (
      value : Windows.Object_Ptr
   )
   return Windows.Object;
   
   function CreateGuidArray
   (
      value : Windows.Guid_Ptr
   )
   return Windows.Object;
   
   function CreateDateTimeArray
   (
      value : Windows.Foundation.DateTime_Ptr
   )
   return Windows.Object;
   
   function CreateTimeSpanArray
   (
      value : Windows.Foundation.TimeSpan_Ptr
   )
   return Windows.Object;
   
   function CreatePointArray
   (
      value : Windows.Foundation.Point_Ptr
   )
   return Windows.Object;
   
   function CreateSizeArray
   (
      value : Windows.Foundation.Size_Ptr
   )
   return Windows.Object;
   
   function CreateRectArray
   (
      value : Windows.Foundation.Rect_Ptr
   )
   return Windows.Object;
   
   function UnescapeComponent
   (
      toUnescape : Windows.String
   )
   return Windows.String;
   
   function EscapeComponent
   (
      toEscape : Windows.String
   )
   return Windows.String;
   
end;
