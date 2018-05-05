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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Data.Json is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type JsonValueType is (
      Null_x,
      Boolean,
      Number,
      String,
      Array_x,
      Object
   );
   for JsonValueType use (
      Null_x => 0,
      Boolean => 1,
      Number => 2,
      String => 3,
      Array_x => 4,
      Object => 5
   );
   for JsonValueType'Size use 32;
   
   type JsonValueType_Ptr is access JsonValueType;
   
   type JsonErrorStatus is (
      Unknown,
      InvalidJsonString,
      InvalidJsonNumber,
      JsonValueNotFound,
      ImplementationLimit
   );
   for JsonErrorStatus use (
      Unknown => 0,
      InvalidJsonString => 1,
      InvalidJsonNumber => 2,
      JsonValueNotFound => 3,
      ImplementationLimit => 4
   );
   for JsonErrorStatus'Size use 32;
   
   type JsonErrorStatus_Ptr is access JsonErrorStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IJsonValue_Interface;
   type IJsonValue is access all IJsonValue_Interface'Class;
   type IJsonValue_Ptr is access all IJsonValue;
   type IVector_IJsonValue_Interface;
   type IVector_IJsonValue is access all IVector_IJsonValue_Interface'Class;
   type IVector_IJsonValue_Ptr is access all IVector_IJsonValue;
   type IIterable_IJsonValue_Interface;
   type IIterable_IJsonValue is access all IIterable_IJsonValue_Interface'Class;
   type IIterable_IJsonValue_Ptr is access all IIterable_IJsonValue;
   type IMap_String_IJsonValue_Interface;
   type IMap_String_IJsonValue is access all IMap_String_IJsonValue_Interface'Class;
   type IMap_String_IJsonValue_Ptr is access all IMap_String_IJsonValue;
   type IJsonValueStatics_Interface;
   type IJsonValueStatics is access all IJsonValueStatics_Interface'Class;
   type IJsonValueStatics_Ptr is access all IJsonValueStatics;
   type IJsonValueStatics2_Interface;
   type IJsonValueStatics2 is access all IJsonValueStatics2_Interface'Class;
   type IJsonValueStatics2_Ptr is access all IJsonValueStatics2;
   type IJsonObject_Interface;
   type IJsonObject is access all IJsonObject_Interface'Class;
   type IJsonObject_Ptr is access all IJsonObject;
   type IJsonObjectWithDefaultValues_Interface;
   type IJsonObjectWithDefaultValues is access all IJsonObjectWithDefaultValues_Interface'Class;
   type IJsonObjectWithDefaultValues_Ptr is access all IJsonObjectWithDefaultValues;
   type IJsonObjectStatics_Interface;
   type IJsonObjectStatics is access all IJsonObjectStatics_Interface'Class;
   type IJsonObjectStatics_Ptr is access all IJsonObjectStatics;
   type IJsonArray_Interface;
   type IJsonArray is access all IJsonArray_Interface'Class;
   type IJsonArray_Ptr is access all IJsonArray;
   type IJsonArrayStatics_Interface;
   type IJsonArrayStatics is access all IJsonArrayStatics_Interface'Class;
   type IJsonArrayStatics_Ptr is access all IJsonArrayStatics;
   type IJsonErrorStatics2_Interface;
   type IJsonErrorStatics2 is access all IJsonErrorStatics2_Interface'Class;
   type IJsonErrorStatics2_Ptr is access all IJsonErrorStatics2;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IJsonValue : aliased constant Windows.IID := (2736889547, 61619, 19917, (190, 238, 25, 212, 140, 211, 237, 30 ));
   
   type IJsonValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ValueType
   (
      This       : access IJsonValue_Interface
      ; RetVal : access Windows.Data.Json.JsonValueType
   )
   return Windows.HRESULT is abstract;
   
   function Stringify
   (
      This       : access IJsonValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetString
   (
      This       : access IJsonValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetNumber
   (
      This       : access IJsonValue_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function GetBoolean
   (
      This       : access IJsonValue_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetArray
   (
      This       : access IJsonValue_Interface
      ; RetVal : access Windows.Data.Json.IJsonArray
   )
   return Windows.HRESULT is abstract;
   
   function GetObject
   (
      This       : access IJsonValue_Interface
      ; RetVal : access Windows.Data.Json.IJsonObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IJsonValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_IJsonValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IJsonValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IJsonValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IJsonValue_Interface
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IJsonValue_Interface
      ; value : Windows.Data.Json.IJsonValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IJsonValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IJsonValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IJsonValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IJsonValue_Interface
      ; value : Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IJsonValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IJsonValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IJsonValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Data.Json.IJsonValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IJsonValue_Interface
      ; items : Windows.Data.Json.IJsonValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IJsonValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IJsonValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IJsonValue_Interface
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMap_String_IJsonValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IMap_String_IJsonValue_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_IJsonValue_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_IJsonValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_IJsonValue_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_IJsonValue_Interface
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_IJsonValue_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_IJsonValue_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_IJsonValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJsonValueStatics : aliased constant Windows.IID := (1600869450, 12115, 18657, (145, 163, 247, 139, 80, 166, 52, 92 ));
   
   type IJsonValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IJsonValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IJsonValueStatics_Interface
      ; input : Windows.String
      ; result : access Windows.Data.Json.IJsonValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CreateBooleanValue
   (
      This       : access IJsonValueStatics_Interface
      ; input : Windows.Boolean
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateNumberValue
   (
      This       : access IJsonValueStatics_Interface
      ; input : Windows.Double
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateStringValue
   (
      This       : access IJsonValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJsonValueStatics2 : aliased constant Windows.IID := (496946148, 16360, 17205, (131, 146, 147, 216, 227, 104, 101, 240 ));
   
   type IJsonValueStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateNullValue
   (
      This       : access IJsonValueStatics2_Interface
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJsonObject : aliased constant Windows.IID := (105784541, 10690, 20355, (154, 193, 158, 225, 21, 120, 190, 179 ));
   
   type IJsonObject_Interface is interface and Windows.IInspectable_Interface;
   
   function GetNamedValue
   (
      This       : access IJsonObject_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function SetNamedValue
   (
      This       : access IJsonObject_Interface
      ; name : Windows.String
      ; value : Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedObject
   (
      This       : access IJsonObject_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Data.Json.IJsonObject
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedArray
   (
      This       : access IJsonObject_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Data.Json.IJsonArray
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedString
   (
      This       : access IJsonObject_Interface
      ; name : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedNumber
   (
      This       : access IJsonObject_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedBoolean
   (
      This       : access IJsonObject_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJsonObjectWithDefaultValues : aliased constant Windows.IID := (3647001250, 47088, 20224, (142, 68, 216, 44, 244, 21, 234, 19 ));
   
   type IJsonObjectWithDefaultValues_Interface is interface and Windows.IInspectable_Interface;
   
   function GetNamedValueOrDefault
   (
      This       : access IJsonObjectWithDefaultValues_Interface
      ; name : Windows.String
      ; defaultValue : Windows.Data.Json.IJsonValue
      ; RetVal : access Windows.Data.Json.IJsonValue
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedObjectOrDefault
   (
      This       : access IJsonObjectWithDefaultValues_Interface
      ; name : Windows.String
      ; defaultValue : Windows.Data.Json.IJsonObject
      ; RetVal : access Windows.Data.Json.IJsonObject
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedStringOrDefault
   (
      This       : access IJsonObjectWithDefaultValues_Interface
      ; name : Windows.String
      ; defaultValue : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedArrayOrDefault
   (
      This       : access IJsonObjectWithDefaultValues_Interface
      ; name : Windows.String
      ; defaultValue : Windows.Data.Json.IJsonArray
      ; RetVal : access Windows.Data.Json.IJsonArray
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedNumberOrDefault
   (
      This       : access IJsonObjectWithDefaultValues_Interface
      ; name : Windows.String
      ; defaultValue : Windows.Double
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function GetNamedBooleanOrDefault
   (
      This       : access IJsonObjectWithDefaultValues_Interface
      ; name : Windows.String
      ; defaultValue : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJsonObjectStatics : aliased constant Windows.IID := (579465561, 21726, 17880, (171, 204, 34, 96, 63, 160, 102, 160 ));
   
   type IJsonObjectStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IJsonObjectStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Data.Json.IJsonObject
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IJsonObjectStatics_Interface
      ; input : Windows.String
      ; result : access Windows.Data.Json.IJsonObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJsonArray : aliased constant Windows.IID := (146922934, 3261, 19098, (181, 211, 47, 133, 45, 195, 126, 129 ));
   
   type IJsonArray_Interface is interface and Windows.IInspectable_Interface;
   
   function GetObjectAt
   (
      This       : access IJsonArray_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Data.Json.IJsonObject
   )
   return Windows.HRESULT is abstract;
   
   function GetArrayAt
   (
      This       : access IJsonArray_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Data.Json.IJsonArray
   )
   return Windows.HRESULT is abstract;
   
   function GetStringAt
   (
      This       : access IJsonArray_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetNumberAt
   (
      This       : access IJsonArray_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function GetBooleanAt
   (
      This       : access IJsonArray_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJsonArrayStatics : aliased constant Windows.IID := (3675534505, 57700, 18847, (147, 226, 138, 143, 73, 187, 144, 186 ));
   
   type IJsonArrayStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IJsonArrayStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Data.Json.IJsonArray
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IJsonArrayStatics_Interface
      ; input : Windows.String
      ; result : access Windows.Data.Json.IJsonArray
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJsonErrorStatics2 : aliased constant Windows.IID := (1077948634, 34768, 17260, (131, 171, 252, 123, 18, 192, 204, 38 ));
   
   type IJsonErrorStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetJsonStatus
   (
      This       : access IJsonErrorStatics2_Interface
      ; hresult : Windows.Int32
      ; RetVal : access Windows.Data.Json.JsonErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype JsonArray is Windows.Data.Json.IJsonArray;
   function CreateJsonArray return Windows.Data.Json.IJsonArray;
   
   subtype JsonObject is Windows.Data.Json.IJsonObject;
   function CreateJsonObject return Windows.Data.Json.IJsonObject;
   
   subtype JsonValue is Windows.Data.Json.IJsonValue;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Data.Json.IJsonArray;
   
   function TryParse
   (
      input : Windows.String
      ; result : access Windows.Data.Json.IJsonArray
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Data.Json.IJsonObject;
   
   function TryParse
   (
      input : Windows.String
      ; result : access Windows.Data.Json.IJsonObject
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Data.Json.IJsonValue;
   
   function TryParse
   (
      input : Windows.String
      ; result : access Windows.Data.Json.IJsonValue
   )
   return Windows.Boolean;
   
   function CreateBooleanValue
   (
      input : Windows.Boolean
   )
   return Windows.Data.Json.IJsonValue;
   
   function CreateNumberValue
   (
      input : Windows.Double
   )
   return Windows.Data.Json.IJsonValue;
   
   function CreateStringValue
   (
      input : Windows.String
   )
   return Windows.Data.Json.IJsonValue;
   
   function CreateNullValue
   return Windows.Data.Json.IJsonValue;
   
   function GetJsonStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Data.Json.JsonErrorStatus;
   
end;
