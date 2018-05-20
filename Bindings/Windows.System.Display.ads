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
package Windows.System.Display is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDisplayRequest_Interface;
   type IDisplayRequest is access all IDisplayRequest_Interface'Class;
   type IDisplayRequest_Ptr is access all IDisplayRequest;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDisplayRequest : aliased constant Windows.IID := (3849527364, 62623, 19296, (141, 212, 94, 126, 58, 99, 42, 192 ));
   
   type IDisplayRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestActive
   (
      This       : access IDisplayRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RequestRelease
   (
      This       : access IDisplayRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DisplayRequest is Windows.System.Display.IDisplayRequest;
   function Create return Windows.System.Display.IDisplayRequest;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
