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
package Windows.System.Power.Diagnostics is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IBackgroundEnergyDiagnosticsStatics_Interface;
   type IBackgroundEnergyDiagnosticsStatics is access all IBackgroundEnergyDiagnosticsStatics_Interface'Class;
   type IBackgroundEnergyDiagnosticsStatics_Ptr is access all IBackgroundEnergyDiagnosticsStatics;
   type IForegroundEnergyDiagnosticsStatics_Interface;
   type IForegroundEnergyDiagnosticsStatics is access all IForegroundEnergyDiagnosticsStatics_Interface'Class;
   type IForegroundEnergyDiagnosticsStatics_Ptr is access all IForegroundEnergyDiagnosticsStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundEnergyDiagnosticsStatics : aliased constant Windows.IID := (3613800194, 54182, 18144, (143, 155, 80, 185, 91, 180, 249, 197 ));
   
   type IBackgroundEnergyDiagnosticsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceSpecificConversionFactor
   (
      This       : access IBackgroundEnergyDiagnosticsStatics_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function ComputeTotalEnergyUsage
   (
      This       : access IBackgroundEnergyDiagnosticsStatics_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function ResetTotalEnergyUsage
   (
      This       : access IBackgroundEnergyDiagnosticsStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IForegroundEnergyDiagnosticsStatics : aliased constant Windows.IID := (600443159, 52487, 17929, (190, 21, 143, 232, 148, 197, 228, 30 ));
   
   type IForegroundEnergyDiagnosticsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceSpecificConversionFactor
   (
      This       : access IForegroundEnergyDiagnosticsStatics_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function ComputeTotalEnergyUsage
   (
      This       : access IForegroundEnergyDiagnosticsStatics_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function ResetTotalEnergyUsage
   (
      This       : access IForegroundEnergyDiagnosticsStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_DeviceSpecificConversionFactor
   return Windows.Double;
   
   function ComputeTotalEnergyUsage
   return Windows.UInt64;
   
   procedure ResetTotalEnergyUsage
   ;
   
   function get_DeviceSpecificConversionFactor_ForegroundEnergyDiagnostics
   return Windows.Double;
   
   function ComputeTotalEnergyUsage_ForegroundEnergyDiagnostics
   return Windows.UInt64;
   
   procedure ResetTotalEnergyUsage_ForegroundEnergyDiagnostics
   ;
   
end;
