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
   
end;
