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
limited with Windows.ApplicationModel.Core;
limited with Windows.UI.Core;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.UI.Input.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IRadialControllerIndependentInputSourceStatics_Interface;
   type IRadialControllerIndependentInputSourceStatics is access all IRadialControllerIndependentInputSourceStatics_Interface'Class;
   type IRadialControllerIndependentInputSourceStatics_Ptr is access all IRadialControllerIndependentInputSourceStatics;
   type IRadialControllerIndependentInputSource_Interface;
   type IRadialControllerIndependentInputSource is access all IRadialControllerIndependentInputSource_Interface'Class;
   type IRadialControllerIndependentInputSource_Ptr is access all IRadialControllerIndependentInputSource;
   type IRadialControllerIndependentInputSource2_Interface;
   type IRadialControllerIndependentInputSource2 is access all IRadialControllerIndependentInputSource2_Interface'Class;
   type IRadialControllerIndependentInputSource2_Ptr is access all IRadialControllerIndependentInputSource2;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IRadialControllerIndependentInputSourceStatics : aliased constant Windows.IID := (1029144309, 19694, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   type IRadialControllerIndependentInputSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateForView
   (
      This       : access IRadialControllerIndependentInputSourceStatics_Interface
      ; view : Windows.ApplicationModel.Core.ICoreApplicationView
      ; RetVal : access Windows.UI.Input.Core.IRadialControllerIndependentInputSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRadialControllerIndependentInputSource : aliased constant Windows.IID := (1029144310, 19694, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   type IRadialControllerIndependentInputSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Controller
   (
      This       : access IRadialControllerIndependentInputSource_Interface
      ; RetVal : access Windows.UI.Input.IRadialController
   )
   return Windows.HRESULT is abstract;
   
   function get_Dispatcher
   (
      This       : access IRadialControllerIndependentInputSource_Interface
      ; RetVal : access Windows.UI.Core.ICoreDispatcher
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRadialControllerIndependentInputSource2 : aliased constant Windows.IID := (1886628568, 13811, 20203, (135, 81, 190, 77, 10, 102, 250, 244 ));
   
   type IRadialControllerIndependentInputSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DispatcherQueue
   (
      This       : access IRadialControllerIndependentInputSource2_Interface
      ; RetVal : access Windows.System.IDispatcherQueue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype RadialControllerIndependentInputSource is Windows.UI.Input.Core.IRadialControllerIndependentInputSource;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateForView
   (
      view : Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.UI.Input.Core.IRadialControllerIndependentInputSource;
   
end;
