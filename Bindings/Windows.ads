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
with System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package Windows is

   pragma preelaborate;
   
   type Int8  is range -(2**(8  - Integer'(1))) .. +(2**(8  - Integer'(1))) -1;
   type Int16 is range -(2**(16 - Integer'(1))) .. +(2**(16 - Integer'(1))) -1;
   type Int32 is range -(2**(32 - Integer'(1))) .. +(2**(32 - Integer'(1))) -1;
   type Int64 is range -(2**(64 - Integer'(1))) .. +(2**(64 - Integer'(1))) -1;
   
   type Int8_Ptr  is access Int8;
   type Int16_Ptr is access Int16;
   type Int32_Ptr is access Int32;
   type Int64_Ptr is access Int64;
   
   type UInt8  is mod 2 ** 8;
   type UInt16 is mod 2 ** 16;
   type UInt32 is mod 2 ** 32;
   type UInt64 is mod 2 ** 64;
   
   type UInt8_Ptr  is access UInt8;
   type UInt16_Ptr is access UInt16;
   type UInt32_Ptr is access UInt32;
   type UInt64_Ptr is access UInt64;
   
   type UInt8_Array  is array (UInt32 range <>) of aliased UInt8;
   type UInt16_Array is array (UInt32 range <>) of aliased UInt16;
   type UInt32_Array is array (UInt32 range <>) of aliased UInt32;
   type UInt64_Array is array (UInt32 range <>) of aliased UInt64;
   
   type Int8_Array  is array (UInt32 range <>) of aliased Int8;
   type Int16_Array is array (UInt32 range <>) of aliased Int16;
   type Int32_Array is array (UInt32 range <>) of aliased Int32;
   type Int64_Array is array (UInt32 range <>) of aliased Int64;
   
   type Single is new Standard.Float;
   type Single_Ptr is access Single;
   
   type Double is new Standard.Long_Float;
   type Double_Ptr is access Double;
   
   type Boolean is new Standard.Boolean;
   type Boolean_Ptr is access Boolean;
   
   type String is new System.Address;
   type String_Ptr is access String;
   
   subtype HResult is UInt32;
   
   subtype Address is System.Address;
   type Address_Ptr is access all System.Address;
   function Convert is new Ada.Unchecked_Conversion(Address, Address_Ptr);
   
   type GenericType is new System.Address;
   
   type DateTimeOffset is new System.Address;
   
   type Decimal is record
      Data1  : UInt32;
      Data2  : UInt32;
      Data3  : UInt32;
      Data4  : UInt32;
   end record;
   
   type Decimal_Ptr is access Decimal;
   
   type GUID is record
      Data1  : UInt32;
      Data2  : UInt16;
      Data3  : UInt16;
      Data4  : UInt8_Array(0..7);
   end record;
   
   subtype IID is GUID;
   subtype CLSID is GUID;
   
   type GUID_Ptr is access constant GUID;
   type IID_Ptr is access constant IID;
   type CLSID_Ptr is access constant CLSID;
   
   type VOID is null record;
   type VOID_Ptr is new System.Address;
   
   type TrustLevel is
   (
      BaseTrust,
      PartialTrust,
      FullTrust
   );
   
   --------------------------------------------------------------------------------
   
   function To_String(Value : Wide_String) return Windows.String;
   procedure OutputDebugString(OutputString : Standard.String);
   
   --------------------------------------------------------------------------------
   
   type IUnknown_Interface is interface;
   type IUnknown is access all IUnknown_Interface'Class;
   type IUnknown_Ptr is access all IUnknown;
   
   function QueryInterface
   (
      This       : access IUnknown_Interface;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HResult is abstract;
   
   function AddRef
   (
      This       : access IUnknown_Interface
   )
   return Windows.UInt32 is abstract;
   
   function Release
   (
      This       : access IUnknown_Interface
   )
   return Windows.UInt32 is abstract;
   
   --------------------------------------------------------------------------------
   
   type IMulticastDelegate_Interface (m_IID : GUID_Ptr) is new IUnknown_Interface with record
      m_RefCount : aliased UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type IMulticastDelegate is access all IMulticastDelegate_Interface'Class;
   type IMulticastDelegate_Ptr is access all IMulticastDelegate;
   
   function QueryInterface
   (
      This       : access IMulticastDelegate_Interface;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HResult;
   
   function AddRef
   (
      This       : access IMulticastDelegate_Interface
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IMulticastDelegate_Interface
   )
   return Windows.UInt32;
   
   --------------------------------------------------------------------------------
   
   type IInspectable_Interface is interface and IUnknown_Interface;
   type IInspectable is access all IInspectable_Interface'Class;
   type IInspectable_Ptr is access all IInspectable;
   
   function GetIids
   (
      This       : access IInspectable_Interface;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HResult is abstract;
   
   function GetRuntimeClassName
   (
      This       : access IInspectable_Interface;
      className  : access Windows.String
   )
   return Windows.HResult is abstract;
   
   function GetTrustLevel
   (
      This       : access IInspectable_Interface;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HResult is abstract;
   
   --------------------------------------------------------------------------------
   
   subtype Object_Interface is IInspectable_Interface;
   subtype Object is IInspectable;
   subtype Object_Ptr is IInspectable_Ptr;
   
   --------------------------------------------------------------------------------
   
   IID_IUnknown        : aliased constant Windows.GUID := (0, 0, 0, (192, 0, 0, 0, 0, 0, 0, 70 ));
   IID_IInspectable    : aliased constant Windows.GUID := (2944852704, 45357, 19562, (156, 90, 215, 170, 101, 16, 30, 144 ));
   IID_IMarshal        : aliased constant Windows.GUID := (3, 0, 0, (192, 0, 0, 0, 0, 0, 0, 70 ));
   IID_IAgileObject    : aliased constant Windows.GUID := (2498374548, 59852, 18912, (192, 255, 238, 100, 202, 143, 91, 144 ));
   
   S_OK                : constant := 0;
   S_FALSE             : constant := 1;
   E_NOTIMPL           : constant := 16#80004001#;
   E_NOINTERFACE       : constant := 16#80004002#;
   E_POINTER           : constant := 16#80004003#;
   
   --------------------------------------------------------------------------------
   
   function RoInitialize (InitType : Windows.UInt32 := 1) return Windows.HResult;
   pragma Import (StdCall, RoInitialize, "RoInitialize");
   
   procedure RoUninitialize;
   pragma Import (StdCall, RoUninitialize, "RoUninitialize");
   
   function RoActivateInstance(activatableClassId : Windows.String ; instance : System.Address) return Windows.HResult;
   pragma Import (StdCall, RoActivateInstance, "RoActivateInstance");
   
   function WindowsCreateString(sourceString : System.Address ; length : Windows.UInt32 ; string : access Windows.String) return Windows.HResult;
   pragma Import (StdCall, WindowsCreateString, "WindowsCreateString");
   
   function WindowsDeleteString(string : Windows.String) return Windows.HRESULT;
   pragma Import (StdCall, WindowsDeleteString, "WindowsDeleteString");
   
   function RoGetActivationFactory(activatableClassId : Windows.String ; iid : in Windows.IID_Ptr ; instance : System.Address) return Windows.HResult;
   pragma Import (StdCall, RoGetActivationFactory, "RoGetActivationFactory");
   
   function IsDebuggerPresent return Boolean;
   pragma import (stdcall, IsDebuggerPresent,"IsDebuggerPresent");
   
   function CoCreateFreeThreadedMarshaler(punkOuter : Windows.IUnknown ; ppunkMarshel : IUnknown_Ptr ) return Windows.HRESULT;
   pragma import (stdcall, CoCreateFreeThreadedMarshaler,"CoCreateFreeThreadedMarshaler");
   
   function StringFromIID(riid :  Windows.GUID_Ptr ; lplpsz : System.Address ) return Windows.HRESULT;
   pragma import (stdcall, StringFromIID,"StringFromIID");
   
   procedure OutputDebugStringW(OutputString : Windows.Address);
   pragma import (stdcall,  OutputDebugStringW, "OutputDebugStringW");
   
   function InterlockedIncrement (lpAddend : access UInt32) return UInt32;
   pragma import (stdcall , InterlockedIncrement , "_InterlockedIncrement");
   
   function InterlockedDecrement (lpAddend : access UInt32) return UInt32;
   pragma import (stdcall , InterlockedDecrement ,"_InterlockedDecrement");
   
   generic
      type ISource is interface and Windows.IInspectable_Interface;
      type IDestination is private;
      IID_Destination : Windows.GUID_Ptr;
   function GenericQI(Object : access ISource'Class) return IDestination;
   
end;
