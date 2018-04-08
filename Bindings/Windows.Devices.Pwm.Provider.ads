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
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Devices.Pwm.Provider is

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
   
   type IPwmControllerProvider_Interface;
   type IPwmControllerProvider is access all IPwmControllerProvider_Interface'Class;
   type IPwmControllerProvider_Ptr is access all IPwmControllerProvider;
   type IPwmProvider_Interface;
   type IPwmProvider is access all IPwmProvider_Interface'Class;
   type IPwmProvider_Ptr is access all IPwmProvider;
   type IIterator_IPwmControllerProvider_Interface;
   type IIterator_IPwmControllerProvider is access all IIterator_IPwmControllerProvider_Interface'Class;
   type IIterator_IPwmControllerProvider_Ptr is access all IIterator_IPwmControllerProvider;
   type IIterable_IPwmControllerProvider_Interface;
   type IIterable_IPwmControllerProvider is access all IIterable_IPwmControllerProvider_Interface'Class;
   type IIterable_IPwmControllerProvider_Ptr is access all IIterable_IPwmControllerProvider;
   type IVectorView_IPwmControllerProvider_Interface;
   type IVectorView_IPwmControllerProvider is access all IVectorView_IPwmControllerProvider_Interface'Class;
   type IVectorView_IPwmControllerProvider_Ptr is access all IVectorView_IPwmControllerProvider;
   
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
   
   IID_IPwmControllerProvider : aliased constant Windows.IID := (318789947, 58083, 16548, (183, 217, 72, 223, 240, 55, 122, 82 ));
   
   type IPwmControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PinCount
   (
      This       : access IPwmControllerProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualFrequency
   (
      This       : access IPwmControllerProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetDesiredFrequency
   (
      This       : access IPwmControllerProvider_Interface
      ; frequency : Windows.Double
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxFrequency
   (
      This       : access IPwmControllerProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MinFrequency
   (
      This       : access IPwmControllerProvider_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function AcquirePin
   (
      This       : access IPwmControllerProvider_Interface
      ; pin : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function ReleasePin
   (
      This       : access IPwmControllerProvider_Interface
      ; pin : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function EnablePin
   (
      This       : access IPwmControllerProvider_Interface
      ; pin : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function DisablePin
   (
      This       : access IPwmControllerProvider_Interface
      ; pin : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetPulseParameters
   (
      This       : access IPwmControllerProvider_Interface
      ; pin : Windows.Int32
      ; dutyCycle : Windows.Double
      ; invertPolarity : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IPwmProvider : aliased constant Windows.IID := (2737836584, 21233, 18352, (147, 73, 102, 186, 67, 210, 89, 2 ));
   
   type IPwmProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetControllers
   (
      This       : access IPwmProvider_Interface
      ; RetVal : access Windows.Devices.Pwm.Provider.IVectorView_IPwmControllerProvider -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IPwmControllerProvider : aliased constant Windows.IID := (2419627778, 61494, 22241, (169, 79, 109, 153, 213, 43, 149, 120 ));
   
   type IIterator_IPwmControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPwmControllerProvider_Interface
      ; RetVal : access Windows.Devices.Pwm.Provider.IPwmControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPwmControllerProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPwmControllerProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPwmControllerProvider_Interface
      ; items : Windows.Devices.Pwm.Provider.IPwmControllerProvider_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IPwmControllerProvider : aliased constant Windows.IID := (1228336473, 46228, 20776, (188, 126, 3, 230, 48, 52, 100, 117 ));
   
   type IIterable_IPwmControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPwmControllerProvider_Interface
      ; RetVal : access Windows.Devices.Pwm.Provider.IIterator_IPwmControllerProvider
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPwmControllerProvider : aliased constant Windows.IID := (437674131, 6778, 24082, (157, 56, 248, 146, 254, 195, 236, 102 ));
   
   type IVectorView_IPwmControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPwmControllerProvider_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Pwm.Provider.IPwmControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPwmControllerProvider_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPwmControllerProvider_Interface
      ; value : Windows.Devices.Pwm.Provider.IPwmControllerProvider
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPwmControllerProvider_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Pwm.Provider.IPwmControllerProvider_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
