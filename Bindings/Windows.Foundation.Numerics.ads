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
package Windows.Foundation.Numerics is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type Vector2 is record
      X : Windows.Single;
      Y : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , Vector2);
   
   type Vector2_Ptr is access Vector2;
   
   type Vector3 is record
      X : Windows.Single;
      Y : Windows.Single;
      Z : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , Vector3);
   
   type Vector3_Ptr is access Vector3;
   
   type Vector4 is record
      X : Windows.Single;
      Y : Windows.Single;
      Z : Windows.Single;
      W : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , Vector4);
   
   type Vector4_Ptr is access Vector4;
   
   type Matrix3x2 is record
      M11 : Windows.Single;
      M12 : Windows.Single;
      M21 : Windows.Single;
      M22 : Windows.Single;
      M31 : Windows.Single;
      M32 : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , Matrix3x2);
   
   type Matrix3x2_Ptr is access Matrix3x2;
   
   type Matrix4x4 is record
      M11 : Windows.Single;
      M12 : Windows.Single;
      M13 : Windows.Single;
      M14 : Windows.Single;
      M21 : Windows.Single;
      M22 : Windows.Single;
      M23 : Windows.Single;
      M24 : Windows.Single;
      M31 : Windows.Single;
      M32 : Windows.Single;
      M33 : Windows.Single;
      M34 : Windows.Single;
      M41 : Windows.Single;
      M42 : Windows.Single;
      M43 : Windows.Single;
      M44 : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , Matrix4x4);
   
   type Matrix4x4_Ptr is access Matrix4x4;
   
   type Plane is record
      Normal : Windows.Foundation.Numerics.Vector3;
      D : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , Plane);
   
   type Plane_Ptr is access Plane;
   
   type Quaternion is record
      X : Windows.Single;
      Y : Windows.Single;
      Z : Windows.Single;
      W : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , Quaternion);
   
   type Quaternion_Ptr is access Quaternion;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IReference_Matrix4x4_Interface;
   type IReference_Matrix4x4 is access all IReference_Matrix4x4_Interface'Class;
   type IReference_Matrix4x4_Ptr is access all IReference_Matrix4x4;
   type IReference_Vector3_Interface;
   type IReference_Vector3 is access all IReference_Vector3_Interface'Class;
   type IReference_Vector3_Ptr is access all IReference_Vector3;
   type IReference_Vector2_Interface;
   type IReference_Vector2 is access all IReference_Vector2_Interface'Class;
   type IReference_Vector2_Ptr is access all IReference_Vector2;
   type IReference_Quaternion_Interface;
   type IReference_Quaternion is access all IReference_Quaternion_Interface'Class;
   type IReference_Quaternion_Ptr is access all IReference_Quaternion;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IReference_Matrix4x4 : aliased constant Windows.IID := (3670802396, 26863, 24528, (182, 87, 120, 45, 10, 201, 128, 126 ));
   
   type IReference_Matrix4x4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Matrix4x4_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix4x4
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_Vector3 : aliased constant Windows.IID := (518484223, 51540, 22986, (167, 84, 97, 153, 169, 190, 40, 44 ));
   
   type IReference_Vector3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Vector3_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_Vector2 : aliased constant Windows.IID := (1224124062, 33893, 22446, (148, 0, 151, 100, 8, 127, 101, 173 ));
   
   type IReference_Vector2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Vector2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_Quaternion : aliased constant Windows.IID := (2993685691, 49172, 24014, (154, 33, 121, 156, 90, 60, 20, 97 ));
   
   type IReference_Quaternion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Quaternion_Interface
      ; RetVal : access Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
