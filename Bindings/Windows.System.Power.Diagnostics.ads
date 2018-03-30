--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.System.Power.Diagnostics is

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
   
   type IBackgroundEnergyDiagnosticsStatics_Interface;
   type IBackgroundEnergyDiagnosticsStatics is access all IBackgroundEnergyDiagnosticsStatics_Interface'Class;
   type IBackgroundEnergyDiagnosticsStatics_Ptr is access all IBackgroundEnergyDiagnosticsStatics;
   type IForegroundEnergyDiagnosticsStatics_Interface;
   type IForegroundEnergyDiagnosticsStatics is access all IForegroundEnergyDiagnosticsStatics_Interface'Class;
   type IForegroundEnergyDiagnosticsStatics_Ptr is access all IForegroundEnergyDiagnosticsStatics;
   
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
   
   IID_IBackgroundEnergyDiagnosticsStatics : aliased constant Windows.IID := (3613800194, 54182, 18144, (143, 155, 80, 185, 91, 180, 249, 197 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IForegroundEnergyDiagnosticsStatics : aliased constant Windows.IID := (600443159, 52487, 17929, (190, 21, 143, 232, 148, 197, 228, 30 ));
   
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
