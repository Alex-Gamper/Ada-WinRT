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
--------------------------------------------------------------------------------
package Windows.Foundation.Collections is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CollectionChange is (
      Reset,
      ItemInserted,
      ItemRemoved,
      ItemChanged
   );
   for CollectionChange use (
      Reset => 0,
      ItemInserted => 1,
      ItemRemoved => 2,
      ItemChanged => 3
   );
   for CollectionChange'Size use 32;
   
   type CollectionChange_Ptr is access CollectionChange;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IPropertySet_Interface;
   type AsyncOperationCompletedHandler_IPropertySet is access all AsyncOperationCompletedHandler_IPropertySet_Interface'Class;
   type AsyncOperationCompletedHandler_IPropertySet_Ptr is access all AsyncOperationCompletedHandler_IPropertySet;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IVectorChangedEventArgs_Interface;
   type IVectorChangedEventArgs is access all IVectorChangedEventArgs_Interface'Class;
   type IVectorChangedEventArgs_Ptr is access all IVectorChangedEventArgs;
   type IPropertySet_Interface;
   type IPropertySet is access all IPropertySet_Interface'Class;
   type IPropertySet_Ptr is access all IPropertySet;
   type IObservableMap_String_Object_Interface;
   type IObservableMap_String_Object is access all IObservableMap_String_Object_Interface'Class;
   type IObservableMap_String_Object_Ptr is access all IObservableMap_String_Object;
   type IMap_String_Object_Interface;
   type IMap_String_Object is access all IMap_String_Object_Interface'Class;
   type IMap_String_Object_Ptr is access all IMap_String_Object;
   type IIterable_IKeyValuePair_Interface;
   type IIterable_IKeyValuePair is access all IIterable_IKeyValuePair_Interface'Class;
   type IIterable_IKeyValuePair_Ptr is access all IIterable_IKeyValuePair;
   type IMap_String_String_Interface;
   type IMap_String_String is access all IMap_String_String_Interface'Class;
   type IMap_String_String_Ptr is access all IMap_String_String;
   type IObservableMap_String_String_Interface;
   type IObservableMap_String_String is access all IObservableMap_String_String_Interface'Class;
   type IObservableMap_String_String_Ptr is access all IObservableMap_String_String;
   type IIterator_Object_Interface;
   type IIterator_Object is access all IIterator_Object_Interface'Class;
   type IIterator_Object_Ptr is access all IIterator_Object;
   type IIterable_Object_Interface;
   type IIterable_Object is access all IIterable_Object_Interface'Class;
   type IIterable_Object_Ptr is access all IIterable_Object;
   type IVectorView_Object_Interface;
   type IVectorView_Object is access all IVectorView_Object_Interface'Class;
   type IVectorView_Object_Ptr is access all IVectorView_Object;
   type IVector_Object_Interface;
   type IVector_Object is access all IVector_Object_Interface'Class;
   type IVector_Object_Ptr is access all IVector_Object;
   type IIterator_UInt8_Interface;
   type IIterator_UInt8 is access all IIterator_UInt8_Interface'Class;
   type IIterator_UInt8_Ptr is access all IIterator_UInt8;
   type IIterable_UInt8_Interface;
   type IIterable_UInt8 is access all IIterable_UInt8_Interface'Class;
   type IIterable_UInt8_Ptr is access all IIterable_UInt8;
   type IVectorView_UInt8_Interface;
   type IVectorView_UInt8 is access all IVectorView_UInt8_Interface'Class;
   type IVectorView_UInt8_Ptr is access all IVectorView_UInt8;
   type IVector_UInt8_Interface;
   type IVector_UInt8 is access all IVector_UInt8_Interface'Class;
   type IVector_UInt8_Ptr is access all IVector_UInt8;
   type IIterator_UInt16_Interface;
   type IIterator_UInt16 is access all IIterator_UInt16_Interface'Class;
   type IIterator_UInt16_Ptr is access all IIterator_UInt16;
   type IIterable_UInt16_Interface;
   type IIterable_UInt16 is access all IIterable_UInt16_Interface'Class;
   type IIterable_UInt16_Ptr is access all IIterable_UInt16;
   type IVectorView_UInt16_Interface;
   type IVectorView_UInt16 is access all IVectorView_UInt16_Interface'Class;
   type IVectorView_UInt16_Ptr is access all IVectorView_UInt16;
   type IVector_UInt16_Interface;
   type IVector_UInt16 is access all IVector_UInt16_Interface'Class;
   type IVector_UInt16_Ptr is access all IVector_UInt16;
   type IIterator_UInt32_Interface;
   type IIterator_UInt32 is access all IIterator_UInt32_Interface'Class;
   type IIterator_UInt32_Ptr is access all IIterator_UInt32;
   type IIterable_UInt32_Interface;
   type IIterable_UInt32 is access all IIterable_UInt32_Interface'Class;
   type IIterable_UInt32_Ptr is access all IIterable_UInt32;
   type IVectorView_UInt32_Interface;
   type IVectorView_UInt32 is access all IVectorView_UInt32_Interface'Class;
   type IVectorView_UInt32_Ptr is access all IVectorView_UInt32;
   type IVector_UInt32_Interface;
   type IVector_UInt32 is access all IVector_UInt32_Interface'Class;
   type IVector_UInt32_Ptr is access all IVector_UInt32;
   type IIterator_UInt64_Interface;
   type IIterator_UInt64 is access all IIterator_UInt64_Interface'Class;
   type IIterator_UInt64_Ptr is access all IIterator_UInt64;
   type IIterable_UInt64_Interface;
   type IIterable_UInt64 is access all IIterable_UInt64_Interface'Class;
   type IIterable_UInt64_Ptr is access all IIterable_UInt64;
   type IVectorView_UInt64_Interface;
   type IVectorView_UInt64 is access all IVectorView_UInt64_Interface'Class;
   type IVectorView_UInt64_Ptr is access all IVectorView_UInt64;
   type IVector_UInt64_Interface;
   type IVector_UInt64 is access all IVector_UInt64_Interface'Class;
   type IVector_UInt64_Ptr is access all IVector_UInt64;
   type IIterator_Int8_Interface;
   type IIterator_Int8 is access all IIterator_Int8_Interface'Class;
   type IIterator_Int8_Ptr is access all IIterator_Int8;
   type IIterable_Int8_Interface;
   type IIterable_Int8 is access all IIterable_Int8_Interface'Class;
   type IIterable_Int8_Ptr is access all IIterable_Int8;
   type IVectorView_Int8_Interface;
   type IVectorView_Int8 is access all IVectorView_Int8_Interface'Class;
   type IVectorView_Int8_Ptr is access all IVectorView_Int8;
   type IVector_Int8_Interface;
   type IVector_Int8 is access all IVector_Int8_Interface'Class;
   type IVector_Int8_Ptr is access all IVector_Int8;
   type IIterator_Int16_Interface;
   type IIterator_Int16 is access all IIterator_Int16_Interface'Class;
   type IIterator_Int16_Ptr is access all IIterator_Int16;
   type IIterable_Int16_Interface;
   type IIterable_Int16 is access all IIterable_Int16_Interface'Class;
   type IIterable_Int16_Ptr is access all IIterable_Int16;
   type IVectorView_Int16_Interface;
   type IVectorView_Int16 is access all IVectorView_Int16_Interface'Class;
   type IVectorView_Int16_Ptr is access all IVectorView_Int16;
   type IVector_Int16_Interface;
   type IVector_Int16 is access all IVector_Int16_Interface'Class;
   type IVector_Int16_Ptr is access all IVector_Int16;
   type IIterator_Int32_Interface;
   type IIterator_Int32 is access all IIterator_Int32_Interface'Class;
   type IIterator_Int32_Ptr is access all IIterator_Int32;
   type IIterable_Int32_Interface;
   type IIterable_Int32 is access all IIterable_Int32_Interface'Class;
   type IIterable_Int32_Ptr is access all IIterable_Int32;
   type IVectorView_Int32_Interface;
   type IVectorView_Int32 is access all IVectorView_Int32_Interface'Class;
   type IVectorView_Int32_Ptr is access all IVectorView_Int32;
   type IVector_Int32_Interface;
   type IVector_Int32 is access all IVector_Int32_Interface'Class;
   type IVector_Int32_Ptr is access all IVector_Int32;
   type IIterator_Int64_Interface;
   type IIterator_Int64 is access all IIterator_Int64_Interface'Class;
   type IIterator_Int64_Ptr is access all IIterator_Int64;
   type IIterable_Int64_Interface;
   type IIterable_Int64 is access all IIterable_Int64_Interface'Class;
   type IIterable_Int64_Ptr is access all IIterable_Int64;
   type IVectorView_Int64_Interface;
   type IVectorView_Int64 is access all IVectorView_Int64_Interface'Class;
   type IVectorView_Int64_Ptr is access all IVectorView_Int64;
   type IVector_Int64_Interface;
   type IVector_Int64 is access all IVector_Int64_Interface'Class;
   type IVector_Int64_Ptr is access all IVector_Int64;
   type IIterator_Guid_Interface;
   type IIterator_Guid is access all IIterator_Guid_Interface'Class;
   type IIterator_Guid_Ptr is access all IIterator_Guid;
   type IIterable_Guid_Interface;
   type IIterable_Guid is access all IIterable_Guid_Interface'Class;
   type IIterable_Guid_Ptr is access all IIterable_Guid;
   type IVectorView_Guid_Interface;
   type IVectorView_Guid is access all IVectorView_Guid_Interface'Class;
   type IVectorView_Guid_Ptr is access all IVectorView_Guid;
   type IVector_Guid_Interface;
   type IVector_Guid is access all IVector_Guid_Interface'Class;
   type IVector_Guid_Ptr is access all IVector_Guid;
   type IIterator_Single_Interface;
   type IIterator_Single is access all IIterator_Single_Interface'Class;
   type IIterator_Single_Ptr is access all IIterator_Single;
   type IIterable_Single_Interface;
   type IIterable_Single is access all IIterable_Single_Interface'Class;
   type IIterable_Single_Ptr is access all IIterable_Single;
   type IVectorView_Single_Interface;
   type IVectorView_Single is access all IVectorView_Single_Interface'Class;
   type IVectorView_Single_Ptr is access all IVectorView_Single;
   type IVector_Single_Interface;
   type IVector_Single is access all IVector_Single_Interface'Class;
   type IVector_Single_Ptr is access all IVector_Single;
   type IIterator_Double_Interface;
   type IIterator_Double is access all IIterator_Double_Interface'Class;
   type IIterator_Double_Ptr is access all IIterator_Double;
   type IIterable_Double_Interface;
   type IIterable_Double is access all IIterable_Double_Interface'Class;
   type IIterable_Double_Ptr is access all IIterable_Double;
   type IVectorView_Double_Interface;
   type IVectorView_Double is access all IVectorView_Double_Interface'Class;
   type IVectorView_Double_Ptr is access all IVectorView_Double;
   type IVector_Double_Interface;
   type IVector_Double is access all IVector_Double_Interface'Class;
   type IVector_Double_Ptr is access all IVector_Double;
   type IIterator_String_Interface;
   type IIterator_String is access all IIterator_String_Interface'Class;
   type IIterator_String_Ptr is access all IIterator_String;
   type IIterable_String_Interface;
   type IIterable_String is access all IIterable_String_Interface'Class;
   type IIterable_String_Ptr is access all IIterable_String;
   type IVectorView_String_Interface;
   type IVectorView_String is access all IVectorView_String_Interface'Class;
   type IVectorView_String_Ptr is access all IVectorView_String;
   type IVector_String_Interface;
   type IVector_String is access all IVector_String_Interface'Class;
   type IVector_String_Ptr is access all IVector_String;
   type IIterator_Boolean_Interface;
   type IIterator_Boolean is access all IIterator_Boolean_Interface'Class;
   type IIterator_Boolean_Ptr is access all IIterator_Boolean;
   type IIterable_Boolean_Interface;
   type IIterable_Boolean is access all IIterable_Boolean_Interface'Class;
   type IIterable_Boolean_Ptr is access all IIterable_Boolean;
   type IVectorView_Boolean_Interface;
   type IVectorView_Boolean is access all IVectorView_Boolean_Interface'Class;
   type IVectorView_Boolean_Ptr is access all IVectorView_Boolean;
   type IVector_Boolean_Interface;
   type IVector_Boolean is access all IVector_Boolean_Interface'Class;
   type IVector_Boolean_Ptr is access all IVector_Boolean;
   type IIterator_DateTime_Interface;
   type IIterator_DateTime is access all IIterator_DateTime_Interface'Class;
   type IIterator_DateTime_Ptr is access all IIterator_DateTime;
   type IIterable_DateTime_Interface;
   type IIterable_DateTime is access all IIterable_DateTime_Interface'Class;
   type IIterable_DateTime_Ptr is access all IIterable_DateTime;
   type IVectorView_DateTime_Interface;
   type IVectorView_DateTime is access all IVectorView_DateTime_Interface'Class;
   type IVectorView_DateTime_Ptr is access all IVectorView_DateTime;
   type IVector_DateTime_Interface;
   type IVector_DateTime is access all IVector_DateTime_Interface'Class;
   type IVector_DateTime_Ptr is access all IVector_DateTime;
   type IIterator_TimeSpan_Interface;
   type IIterator_TimeSpan is access all IIterator_TimeSpan_Interface'Class;
   type IIterator_TimeSpan_Ptr is access all IIterator_TimeSpan;
   type IIterable_TimeSpan_Interface;
   type IIterable_TimeSpan is access all IIterable_TimeSpan_Interface'Class;
   type IIterable_TimeSpan_Ptr is access all IIterable_TimeSpan;
   type IVectorView_TimeSpan_Interface;
   type IVectorView_TimeSpan is access all IVectorView_TimeSpan_Interface'Class;
   type IVectorView_TimeSpan_Ptr is access all IVectorView_TimeSpan;
   type IVector_TimeSpan_Interface;
   type IVector_TimeSpan is access all IVector_TimeSpan_Interface'Class;
   type IVector_TimeSpan_Ptr is access all IVector_TimeSpan;
   type IAsyncOperation_IPropertySet_Interface;
   type IAsyncOperation_IPropertySet is access all IAsyncOperation_IPropertySet_Interface'Class;
   type IAsyncOperation_IPropertySet_Ptr is access all IAsyncOperation_IPropertySet;
   
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
   
   IID_IVectorChangedEventArgs : aliased constant Windows.IID := (1465463775, 13566, 17536, (175, 21, 7, 105, 31, 61, 93, 155 ));
   
   type IVectorChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CollectionChange
   (
      This       : access IVectorChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.CollectionChange
   )
   return Windows.HRESULT is abstract;
   
   function get_Index
   (
      This       : access IVectorChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IPropertySet : aliased constant Windows.IID := (2319707551, 62694, 17441, (172, 249, 29, 171, 41, 134, 130, 12 ));
   
   type IPropertySet_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IObservableMap_String_Object : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IObservableMap_String_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MapChanged
   (
      This       : access IObservableMap_String_Object_Interface
      ; vhnd : Windows.Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapChanged
   (
      This       : access IObservableMap_String_Object_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMap_String_Object : aliased constant Windows.IID := (453850480, 2167, 24258, (138, 44, 59, 149, 57, 80, 106, 202 ));
   
   type IMap_String_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_Object_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_Object_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IKeyValuePair : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IKeyValuePair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyValuePair_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMap_String_String : aliased constant Windows.IID := (4140955392, 18882, 21166, (129, 84, 130, 111, 153, 8, 119, 60 ));
   
   type IMap_String_String_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_String_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_String_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_String_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IObservableMap_String_String : aliased constant Windows.IID := (503538294, 12128, 22006, (183, 243, 248, 96, 121, 230, 144, 11 ));
   
   type IObservableMap_String_String_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MapChanged
   (
      This       : access IObservableMap_String_String_Interface
      ; vhnd : Windows.String
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapChanged
   (
      This       : access IObservableMap_String_String_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_Object : aliased constant Windows.IID := (1151946541, 1272, 20625, (179, 54, 190, 120, 146, 221, 16, 190 ));
   
   type IIterator_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Object_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Object_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Object_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Object_Interface
      ; items : Windows.Object_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_Object : aliased constant Windows.IID := (153846939, 24753, 21182, (164, 74, 111, 232, 233, 51, 203, 228 ));
   
   type IIterable_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Object_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_Object : aliased constant Windows.IID := (2789765987, 45172, 23648, (171, 22, 134, 109, 206, 78, 229, 77 ));
   
   type IVectorView_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Object_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Object_Interface
      ; value : Windows.Object
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Object_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Object_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Object_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Object_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Object
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Object_Interface
      ; value : Windows.Object
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Object_Interface
      ; index : Windows.UInt32
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Object_Interface
      ; index : Windows.UInt32
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Object_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Object_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Object_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Object_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Object_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Object_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Object_Interface
      ; items : Windows.Object_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_UInt8 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_UInt8_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_UInt8_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_UInt8_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_UInt8_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_UInt8_Interface
      ; items : Windows.UInt8_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_UInt8 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_UInt8_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_UInt8_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_UInt8
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_UInt8 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_UInt8_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_UInt8_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_UInt8_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_UInt8_Interface
      ; value : Windows.UInt8
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_UInt8_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UInt8_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_UInt8_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_UInt8_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_UInt8_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_UInt8_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt8
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_UInt8_Interface
      ; value : Windows.UInt8
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_UInt8_Interface
      ; index : Windows.UInt32
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_UInt8_Interface
      ; index : Windows.UInt32
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_UInt8_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_UInt8_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_UInt8_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_UInt8_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_UInt8_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UInt8_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_UInt8_Interface
      ; items : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_UInt16 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_UInt16_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_UInt16_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_UInt16_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_UInt16_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_UInt16_Interface
      ; items : Windows.UInt16_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_UInt16 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_UInt16_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_UInt16_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_UInt16
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_UInt16 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_UInt16_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_UInt16_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_UInt16_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_UInt16_Interface
      ; value : Windows.UInt16
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_UInt16_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UInt16_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_UInt16_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_UInt16_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_UInt16_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_UInt16_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt16
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_UInt16_Interface
      ; value : Windows.UInt16
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_UInt16_Interface
      ; index : Windows.UInt32
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_UInt16_Interface
      ; index : Windows.UInt32
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_UInt16_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_UInt16_Interface
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_UInt16_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_UInt16_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_UInt16_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UInt16_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_UInt16_Interface
      ; items : Windows.UInt16_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_UInt32 : aliased constant Windows.IID := (4033488697, 37955, 24304, (178, 132, 220, 90, 255, 62, 125, 16 ));
   
   type IIterator_UInt32_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_UInt32_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_UInt32_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_UInt32_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_UInt32_Interface
      ; items : Windows.UInt32_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_UInt32 : aliased constant Windows.IID := (1109216145, 45371, 24375, (174, 84, 181, 36, 155, 216, 5, 57 ));
   
   type IIterable_UInt32_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_UInt32_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_UInt32 : aliased constant Windows.IID := (3855489543, 36147, 20487, (186, 100, 125, 37, 8, 204, 248, 92 ));
   
   type IVectorView_UInt32_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_UInt32_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_UInt32_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_UInt32_Interface
      ; value : Windows.UInt32
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_UInt32_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UInt32_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_UInt32_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_UInt32_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_UInt32_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_UInt32_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_UInt32_Interface
      ; value : Windows.UInt32
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_UInt32_Interface
      ; index : Windows.UInt32
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_UInt32_Interface
      ; index : Windows.UInt32
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_UInt32_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_UInt32_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_UInt32_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_UInt32_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_UInt32_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UInt32_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_UInt32_Interface
      ; items : Windows.UInt32_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_UInt64 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_UInt64_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_UInt64_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_UInt64_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_UInt64_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_UInt64_Interface
      ; items : Windows.UInt64_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_UInt64 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_UInt64_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_UInt64_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_UInt64
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_UInt64 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_UInt64_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_UInt64_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_UInt64_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_UInt64_Interface
      ; value : Windows.UInt64
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_UInt64_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UInt64_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_UInt64_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_UInt64_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_UInt64_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_UInt64_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt64
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_UInt64_Interface
      ; value : Windows.UInt64
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_UInt64_Interface
      ; index : Windows.UInt32
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_UInt64_Interface
      ; index : Windows.UInt32
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_UInt64_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_UInt64_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_UInt64_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_UInt64_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_UInt64_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UInt64_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_UInt64_Interface
      ; items : Windows.UInt64_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_Int8 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_Int8_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Int8_Interface
      ; RetVal : access Windows.Int8
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Int8_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Int8_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Int8_Interface
      ; items : Windows.Int8_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_Int8 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_Int8_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Int8_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_Int8
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_Int8 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_Int8_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Int8_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Int8
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Int8_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Int8_Interface
      ; value : Windows.Int8
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Int8_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Int8_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_Int8_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Int8_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Int8
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Int8_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Int8_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Int8
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Int8_Interface
      ; value : Windows.Int8
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Int8_Interface
      ; index : Windows.UInt32
      ; value : Windows.Int8
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Int8_Interface
      ; index : Windows.UInt32
      ; value : Windows.Int8
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Int8_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Int8_Interface
      ; value : Windows.Int8
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Int8_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Int8_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Int8_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Int8_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Int8_Interface
      ; items : Windows.Int8_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_Int16 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_Int16_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Int16_Interface
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Int16_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Int16_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Int16_Interface
      ; items : Windows.Int16_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_Int16 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_Int16_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Int16_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_Int16
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_Int16 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_Int16_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Int16_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Int16_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Int16_Interface
      ; value : Windows.Int16
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Int16_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Int16_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_Int16_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Int16_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Int16_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Int16_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Int16
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Int16_Interface
      ; value : Windows.Int16
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Int16_Interface
      ; index : Windows.UInt32
      ; value : Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Int16_Interface
      ; index : Windows.UInt32
      ; value : Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Int16_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Int16_Interface
      ; value : Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Int16_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Int16_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Int16_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Int16_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Int16_Interface
      ; items : Windows.Int16_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_Int32 : aliased constant Windows.IID := (3219816312, 20674, 24349, (166, 234, 158, 151, 141, 38, 153, 255 ));
   
   type IIterator_Int32_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Int32_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Int32_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Int32_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Int32_Interface
      ; items : Windows.Int32_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_Int32 : aliased constant Windows.IID := (2175157243, 62748, 21861, (131, 196, 249, 100, 37, 119, 123, 102 ));
   
   type IIterable_Int32_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Int32_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_Int32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_Int32 : aliased constant Windows.IID := (2373061855, 14644, 23871, (154, 85, 64, 232, 6, 59, 8, 106 ));
   
   type IVectorView_Int32_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Int32_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Int32_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Int32_Interface
      ; value : Windows.Int32
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Int32_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Int32_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_Int32_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Int32_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Int32_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Int32_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Int32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Int32_Interface
      ; value : Windows.Int32
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Int32_Interface
      ; index : Windows.UInt32
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Int32_Interface
      ; index : Windows.UInt32
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Int32_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Int32_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Int32_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Int32_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Int32_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Int32_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Int32_Interface
      ; items : Windows.Int32_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_Int64 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_Int64_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Int64_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Int64_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Int64_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Int64_Interface
      ; items : Windows.Int64_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_Int64 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_Int64_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Int64_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_Int64
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_Int64 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_Int64_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Int64_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Int64_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Int64_Interface
      ; value : Windows.Int64
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Int64_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Int64_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_Int64_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Int64_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Int64_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Int64_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Int64
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Int64_Interface
      ; value : Windows.Int64
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Int64_Interface
      ; index : Windows.UInt32
      ; value : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Int64_Interface
      ; index : Windows.UInt32
      ; value : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Int64_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Int64_Interface
      ; value : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Int64_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Int64_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Int64_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Int64_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Int64_Interface
      ; items : Windows.Int64_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_Guid : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_Guid_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Guid_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Guid_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Guid_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Guid_Interface
      ; items : Windows.Guid_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_Guid : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_Guid_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Guid_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_Guid
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_Guid : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_Guid_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Guid_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Guid_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Guid_Interface
      ; value : Windows.Guid
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Guid_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Guid_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_Guid_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Guid_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Guid_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Guid_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Guid
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Guid_Interface
      ; value : Windows.Guid
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Guid_Interface
      ; index : Windows.UInt32
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Guid_Interface
      ; index : Windows.UInt32
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Guid_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Guid_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Guid_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Guid_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Guid_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Guid_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Guid_Interface
      ; items : Windows.Guid_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_Single : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_Single_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Single_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Single_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Single_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Single_Interface
      ; items : Windows.Single_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_Single : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_Single_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Single_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_Single
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_Single : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_Single_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Single_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Single_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Single_Interface
      ; value : Windows.Single
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Single_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Single_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_Single_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Single_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Single_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Single_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Single
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Single_Interface
      ; value : Windows.Single
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Single_Interface
      ; index : Windows.UInt32
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Single_Interface
      ; index : Windows.UInt32
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Single_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Single_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Single_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Single_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Single_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Single_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Single_Interface
      ; items : Windows.Single_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_Double : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_Double_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Double_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Double_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Double_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Double_Interface
      ; items : Windows.Double_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_Double : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_Double_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Double_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_Double
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_Double : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_Double_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Double_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Double_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Double_Interface
      ; value : Windows.Double
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Double_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Double_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_Double_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Double_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Double_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Double_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Double
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Double_Interface
      ; value : Windows.Double
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Double_Interface
      ; index : Windows.UInt32
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Double_Interface
      ; index : Windows.UInt32
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Double_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Double_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Double_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Double_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Double_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Double_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Double_Interface
      ; items : Windows.Double_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_String : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_String_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_String_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_String_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_String_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_String_Interface
      ; items : Windows.String_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_String : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_String_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_String_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_String : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_String_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_String_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_String_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_String_Interface
      ; value : Windows.String
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_String_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.String_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_String_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_String_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_String_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_String_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_String_Interface
      ; value : Windows.String
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_String_Interface
      ; index : Windows.UInt32
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_String_Interface
      ; index : Windows.UInt32
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_String_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_String_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_String_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_String_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_String_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.String_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_String_Interface
      ; items : Windows.String_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_Boolean : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_Boolean_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Boolean_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Boolean_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Boolean_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Boolean_Interface
      ; items : Windows.Boolean_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_Boolean : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_Boolean_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Boolean_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_Boolean : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_Boolean_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_Boolean_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_Boolean_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_Boolean_Interface
      ; value : Windows.Boolean
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_Boolean_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Boolean_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_Boolean_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Boolean_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Boolean_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Boolean_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Boolean_Interface
      ; value : Windows.Boolean
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Boolean_Interface
      ; index : Windows.UInt32
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Boolean_Interface
      ; index : Windows.UInt32
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Boolean_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Boolean_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Boolean_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Boolean_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Boolean_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Boolean_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Boolean_Interface
      ; items : Windows.Boolean_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_DateTime : aliased constant Windows.IID := (4116797663, 35143, 21632, (150, 237, 54, 193, 5, 120, 119, 234 ));
   
   type IIterator_DateTime_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_DateTime_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_DateTime_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_DateTime_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_DateTime_Interface
      ; items : Windows.Foundation.DateTime_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_DateTime : aliased constant Windows.IID := (1466572925, 38780, 23350, (181, 77, 98, 78, 200, 108, 83, 163 ));
   
   type IIterable_DateTime_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_DateTime_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_DateTime
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_DateTime : aliased constant Windows.IID := (324689778, 43032, 21672, (185, 85, 223, 242, 89, 58, 59, 245 ));
   
   type IVectorView_DateTime_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_DateTime_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_DateTime_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_DateTime_Interface
      ; value : Windows.Foundation.DateTime
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_DateTime_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Foundation.DateTime_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_DateTime_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_DateTime_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_DateTime_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_DateTime_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_DateTime_Interface
      ; value : Windows.Foundation.DateTime
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_DateTime_Interface
      ; index : Windows.UInt32
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_DateTime_Interface
      ; index : Windows.UInt32
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_DateTime_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_DateTime_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_DateTime_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_DateTime_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_DateTime_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Foundation.DateTime_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_DateTime_Interface
      ; items : Windows.Foundation.DateTime_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_TimeSpan : aliased constant Windows.IID := (1743383259, 12875, 22113, (164, 5, 222, 216, 68, 91, 30, 234 ));
   
   type IIterator_TimeSpan_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_TimeSpan_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_TimeSpan_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_TimeSpan_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_TimeSpan_Interface
      ; items : Windows.Foundation.TimeSpan_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_TimeSpan : aliased constant Windows.IID := (3925313318, 33434, 24423, (141, 25, 149, 239, 21, 75, 119, 66 ));
   
   type IIterable_TimeSpan_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_TimeSpan_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_TimeSpan
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_TimeSpan : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_TimeSpan_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_TimeSpan_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_TimeSpan_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_TimeSpan_Interface
      ; value : Windows.Foundation.TimeSpan
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_TimeSpan_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Foundation.TimeSpan_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IVector_TimeSpan_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_TimeSpan_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_TimeSpan_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_TimeSpan_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_TimeSpan_Interface
      ; value : Windows.Foundation.TimeSpan
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_TimeSpan_Interface
      ; index : Windows.UInt32
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_TimeSpan_Interface
      ; index : Windows.UInt32
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_TimeSpan_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_TimeSpan_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_TimeSpan_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_TimeSpan_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_TimeSpan_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Foundation.TimeSpan_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_TimeSpan_Interface
      ; items : Windows.Foundation.TimeSpan_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPropertySet : aliased constant Windows.IID := (1225459334, 45015, 20535, (150, 71, 216, 254, 36, 143, 24, 44 ));
   
   type IAsyncOperation_IPropertySet_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPropertySet_Interface
      ; handler : Windows.Foundation.Collections.AsyncOperationCompletedHandler_IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPropertySet_Interface
      ; RetVal : access Windows.Foundation.Collections.AsyncOperationCompletedHandler_IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPropertySet_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPropertySet : aliased constant Windows.IID := (1349887327, 26810, 22258, (151, 230, 155, 28, 191, 162, 197, 242 ));
   
   type AsyncOperationCompletedHandler_IPropertySet_Interface(Callback : access procedure (asyncInfo : Windows.Foundation.Collections.IAsyncOperation_IPropertySet ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPropertySet'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPropertySet_Interface
      ; asyncInfo : Windows.Foundation.Collections.IAsyncOperation_IPropertySet
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PropertySet is Windows.Foundation.Collections.IPropertySet;
   
   function CreatePropertySet return Windows.Foundation.Collections.IPropertySet;
   
   subtype ValueSet is Windows.Foundation.Collections.IPropertySet;
   
   function CreateValueSet return Windows.Foundation.Collections.IPropertySet;
   
   subtype StringMap is Windows.Foundation.Collections.IMap_String_String;
   
   function CreateStringMap return Windows.Foundation.Collections.IMap_String_String;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
