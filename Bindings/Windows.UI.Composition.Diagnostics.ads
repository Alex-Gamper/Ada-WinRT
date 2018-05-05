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
package Windows.UI.Composition.Diagnostics is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CompositionDebugOverdrawContentKinds is (
      None,
      OffscreenRendered,
      Colors,
      Effects,
      Shadows,
      Lights,
      Surfaces,
      SwapChains,
      All_x
   );
   for CompositionDebugOverdrawContentKinds use (
      None => 0,
      OffscreenRendered => 1,
      Colors => 2,
      Effects => 4,
      Shadows => 8,
      Lights => 16,
      Surfaces => 32,
      SwapChains => 64,
      All_x => 4294967295
   );
   for CompositionDebugOverdrawContentKinds'Size use 32;
   
   type CompositionDebugOverdrawContentKinds_Ptr is access CompositionDebugOverdrawContentKinds;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICompositionDebugSettings_Interface;
   type ICompositionDebugSettings is access all ICompositionDebugSettings_Interface'Class;
   type ICompositionDebugSettings_Ptr is access all ICompositionDebugSettings;
   type ICompositionDebugSettingsStatics_Interface;
   type ICompositionDebugSettingsStatics is access all ICompositionDebugSettingsStatics_Interface'Class;
   type ICompositionDebugSettingsStatics_Ptr is access all ICompositionDebugSettingsStatics;
   type ICompositionDebugHeatMaps_Interface;
   type ICompositionDebugHeatMaps is access all ICompositionDebugHeatMaps_Interface'Class;
   type ICompositionDebugHeatMaps_Ptr is access all ICompositionDebugHeatMaps;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICompositionDebugSettings : aliased constant Windows.IID := (674338942, 7554, 19768, (183, 183, 239, 209, 28, 123, 195, 209 ));
   
   type ICompositionDebugSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HeatMaps
   (
      This       : access ICompositionDebugSettings_Interface
      ; RetVal : access Windows.UI.Composition.Diagnostics.ICompositionDebugHeatMaps
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionDebugSettingsStatics : aliased constant Windows.IID := (1693196062, 27384, 19192, (184, 20, 200, 112, 253, 90, 149, 5 ));
   
   type ICompositionDebugSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetSettings
   (
      This       : access ICompositionDebugSettingsStatics_Interface
      ; compositor : Windows.UI.Composition.ICompositor
      ; RetVal : access Windows.UI.Composition.Diagnostics.ICompositionDebugSettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionDebugHeatMaps : aliased constant Windows.IID := (3835465900, 12275, 22533, (113, 140, 183, 37, 238, 7, 101, 15 ));
   
   type ICompositionDebugHeatMaps_Interface is interface and Windows.IInspectable_Interface;
   
   function Hide
   (
      This       : access ICompositionDebugHeatMaps_Interface
      ; subtree : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function ShowMemoryUsage
   (
      This       : access ICompositionDebugHeatMaps_Interface
      ; subtree : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function ShowOverdraw
   (
      This       : access ICompositionDebugHeatMaps_Interface
      ; subtree : Windows.UI.Composition.IVisual
      ; contentKinds : Windows.UI.Composition.Diagnostics.CompositionDebugOverdrawContentKinds
   )
   return Windows.HRESULT is abstract;
   
   function ShowRedraw
   (
      This       : access ICompositionDebugHeatMaps_Interface
      ; subtree : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CompositionDebugHeatMaps is Windows.UI.Composition.Diagnostics.ICompositionDebugHeatMaps;
   subtype CompositionDebugSettings is Windows.UI.Composition.Diagnostics.ICompositionDebugSettings;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function TryGetSettings
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Diagnostics.ICompositionDebugSettings;
   
end;
