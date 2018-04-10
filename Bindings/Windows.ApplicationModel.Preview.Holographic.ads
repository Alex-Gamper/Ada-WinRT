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
limited with Windows.ApplicationModel.Activation;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Preview.Holographic is

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
   
   type IHolographicApplicationPreviewStatics_Interface;
   type IHolographicApplicationPreviewStatics is access all IHolographicApplicationPreviewStatics_Interface'Class;
   type IHolographicApplicationPreviewStatics_Ptr is access all IHolographicApplicationPreviewStatics;
   
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
   
   IID_IHolographicApplicationPreviewStatics : aliased constant Windows.IID := (4261643921, 10810, 17833, (162, 8, 123, 237, 105, 25, 25, 243 ));
   
   type IHolographicApplicationPreviewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsCurrentViewPresentedOnHolographicDisplay
   (
      This       : access IHolographicApplicationPreviewStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsHolographicActivation
   (
      This       : access IHolographicApplicationPreviewStatics_Interface
      ; activatedEventArgs : Windows.ApplicationModel.Activation.IActivatedEventArgs
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function IsCurrentViewPresentedOnHolographicDisplay
   return Windows.Boolean;
   
   function IsHolographicActivation
   (
      activatedEventArgs : Windows.ApplicationModel.Activation.IActivatedEventArgs
   )
   return Windows.Boolean;
   

end;
