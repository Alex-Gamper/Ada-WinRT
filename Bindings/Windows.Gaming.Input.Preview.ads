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
limited with Windows.Gaming.Input.Custom;
--------------------------------------------------------------------------------
package Windows.Gaming.Input.Preview is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGameControllerProviderInfoStatics_Interface;
   type IGameControllerProviderInfoStatics is access all IGameControllerProviderInfoStatics_Interface'Class;
   type IGameControllerProviderInfoStatics_Ptr is access all IGameControllerProviderInfoStatics;
   
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
   type IGameControllerProviderInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetParentProviderId
   (
      This       : access IGameControllerProviderInfoStatics_Interface
      ; provider : Windows.Gaming.Input.Custom.IGameControllerProvider
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetProviderId
   (
      This       : access IGameControllerProviderInfoStatics_Interface
      ; provider : Windows.Gaming.Input.Custom.IGameControllerProvider
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameControllerProviderInfoStatics : aliased constant Windows.IID := (199354053, 55741, 17646, (131, 98, 72, 139, 46, 70, 75, 251 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetParentProviderId
   (
      provider : Windows.Gaming.Input.Custom.IGameControllerProvider
   )
   return Windows.String;
   
   function GetProviderId
   (
      provider : Windows.Gaming.Input.Custom.IGameControllerProvider
   )
   return Windows.String;

end;
