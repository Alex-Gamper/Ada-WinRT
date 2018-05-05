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
limited with Windows.System;
limited with Windows.Storage.Streams;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Management.Policies is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type NamedPolicyKind is (
      Invalid,
      Binary,
      Boolean,
      Int32,
      Int64,
      String
   );
   for NamedPolicyKind use (
      Invalid => 0,
      Binary => 1,
      Boolean => 2,
      Int32 => 3,
      Int64 => 4,
      String => 5
   );
   for NamedPolicyKind'Size use 32;
   
   type NamedPolicyKind_Ptr is access NamedPolicyKind;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_INamedPolicyData_add_Changed_Interface;
   type TypedEventHandler_INamedPolicyData_add_Changed is access all TypedEventHandler_INamedPolicyData_add_Changed_Interface'Class;
   type TypedEventHandler_INamedPolicyData_add_Changed_Ptr is access all TypedEventHandler_INamedPolicyData_add_Changed;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type INamedPolicyData_Interface;
   type INamedPolicyData is access all INamedPolicyData_Interface'Class;
   type INamedPolicyData_Ptr is access all INamedPolicyData;
   type INamedPolicyStatics_Interface;
   type INamedPolicyStatics is access all INamedPolicyStatics_Interface'Class;
   type INamedPolicyStatics_Ptr is access all INamedPolicyStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_INamedPolicyData : aliased constant Windows.IID := (953987480, 38316, 16503, (166, 67, 128, 120, 202, 226, 100, 0 ));
   
   type INamedPolicyData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Area
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.Management.Policies.NamedPolicyKind
   )
   return Windows.HRESULT is abstract;
   
   function get_IsManaged
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsUserPolicy
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function GetBoolean
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetBinary
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function GetInt32
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetInt64
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function GetString
   (
      This       : access INamedPolicyData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_Changed
   (
      This       : access INamedPolicyData_Interface
      ; changedHandler : TypedEventHandler_INamedPolicyData_add_Changed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Changed
   (
      This       : access INamedPolicyData_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INamedPolicyStatics : aliased constant Windows.IID := (2138651623, 30404, 16472, (140, 173, 103, 102, 44, 208, 95, 13 ));
   
   type INamedPolicyStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPolicyFromPath
   (
      This       : access INamedPolicyStatics_Interface
      ; area : Windows.String
      ; name : Windows.String
      ; RetVal : access Windows.Management.Policies.INamedPolicyData
   )
   return Windows.HRESULT is abstract;
   
   function GetPolicyFromPathForUser
   (
      This       : access INamedPolicyStatics_Interface
      ; user : Windows.System.IUser
      ; area : Windows.String
      ; name : Windows.String
      ; RetVal : access Windows.Management.Policies.INamedPolicyData
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_INamedPolicyData_add_Changed : aliased constant Windows.IID := (2031762432, 23202, 24334, (187, 23, 52, 128, 188, 45, 150, 204 ));
   
   type TypedEventHandler_INamedPolicyData_add_Changed_Interface(Callback : access procedure (sender : Windows.Management.Policies.INamedPolicyData ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_INamedPolicyData_add_Changed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_INamedPolicyData_add_Changed_Interface
      ; sender : Windows.Management.Policies.INamedPolicyData
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype NamedPolicyData is Windows.Management.Policies.INamedPolicyData;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetPolicyFromPath
   (
      area : Windows.String
      ; name : Windows.String
   )
   return Windows.Management.Policies.INamedPolicyData;
   
   function GetPolicyFromPathForUser
   (
      user : Windows.System.IUser
      ; area : Windows.String
      ; name : Windows.String
   )
   return Windows.Management.Policies.INamedPolicyData;
   
end;
