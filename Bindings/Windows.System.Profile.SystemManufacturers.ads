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
with Windows.Foundation;
package Windows.System.Profile.SystemManufacturers is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type SystemManufacturersContract is null record;
   pragma Convention (C_Pass_By_Copy , SystemManufacturersContract);
   
   type SystemManufacturersContract_Ptr is access SystemManufacturersContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IOemSupportInfo_Interface;
   type IOemSupportInfo is access all IOemSupportInfo_Interface'Class;
   type IOemSupportInfo_Ptr is access all IOemSupportInfo;
   type ISystemSupportInfoStatics_Interface;
   type ISystemSupportInfoStatics is access all ISystemSupportInfoStatics_Interface'Class;
   type ISystemSupportInfoStatics_Ptr is access all ISystemSupportInfoStatics;
   type ISmbiosInformationStatics_Interface;
   type ISmbiosInformationStatics is access all ISmbiosInformationStatics_Interface'Class;
   type ISmbiosInformationStatics_Ptr is access all ISmbiosInformationStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IOemSupportInfo : aliased constant Windows.IID := (2368646741, 34799, 16998, (134, 208, 196, 175, 190, 178, 155, 185 ));
   
   type IOemSupportInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportLink
   (
      This       : access IOemSupportInfo_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportAppLink
   (
      This       : access IOemSupportInfo_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportProvider
   (
      This       : access IOemSupportInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISystemSupportInfoStatics : aliased constant Windows.IID := (4017424756, 50210, 17879, (164, 77, 92, 28, 0, 67, 162, 179 ));
   
   type ISystemSupportInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalSystemEdition
   (
      This       : access ISystemSupportInfoStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OemSupportInfo
   (
      This       : access ISystemSupportInfoStatics_Interface
      ; RetVal : access Windows.System.Profile.SystemManufacturers.IOemSupportInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISmbiosInformationStatics : aliased constant Windows.IID := (135055996, 25468, 18628, (183, 40, 249, 39, 56, 18, 219, 142 ));
   
   type ISmbiosInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SerialNumber
   (
      This       : access ISmbiosInformationStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype OemSupportInfo is Windows.System.Profile.SystemManufacturers.IOemSupportInfo;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_LocalSystemEdition
   return Windows.String;
   
   function get_OemSupportInfo
   return Windows.System.Profile.SystemManufacturers.IOemSupportInfo;
   
   function get_SerialNumber
   return Windows.String;
   
end;
