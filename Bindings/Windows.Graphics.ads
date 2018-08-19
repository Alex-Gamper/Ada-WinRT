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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
package Windows.Graphics is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PointInt32 is record
      X : Windows.Int32;
      Y : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , PointInt32);
   
   type PointInt32_Ptr is access PointInt32;
   
   type SizeInt32 is record
      Width : Windows.Int32;
      Height : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , SizeInt32);
   
   type SizeInt32_Ptr is access SizeInt32;
   
   type RectInt32 is record
      X : Windows.Int32;
      Y : Windows.Int32;
      Width : Windows.Int32;
      Height : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , RectInt32);
   
   type RectInt32_Ptr is access RectInt32;
   
   type DisplayAdapterId is record
      LowPart : Windows.UInt32;
      HighPart : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , DisplayAdapterId);
   
   type DisplayAdapterId_Ptr is access DisplayAdapterId;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGeometrySource2D_Interface;
   type IGeometrySource2D is access all IGeometrySource2D_Interface'Class;
   type IGeometrySource2D_Ptr is access all IGeometrySource2D;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IGeometrySource2D : aliased constant Windows.IID := (3405740290, 26380, 16769, (166, 36, 218, 151, 114, 3, 184, 69 ));
   
   type IGeometrySource2D_Interface is interface and Windows.IInspectable_Interface;
   
end;
