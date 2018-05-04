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
with Windows.Foundation.Collections;
package Windows.Devices.Adc.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ProviderAdcChannelMode is (
      SingleEnded,
      Differential
   );
   for ProviderAdcChannelMode use (
      SingleEnded => 0,
      Differential => 1
   );
   for ProviderAdcChannelMode'Size use 32;
   
   type ProviderAdcChannelMode_Ptr is access ProviderAdcChannelMode;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAdcControllerProvider_Interface;
   type IAdcControllerProvider is access all IAdcControllerProvider_Interface'Class;
   type IAdcControllerProvider_Ptr is access all IAdcControllerProvider;
   type IAdcProvider_Interface;
   type IAdcProvider is access all IAdcProvider_Interface'Class;
   type IAdcProvider_Ptr is access all IAdcProvider;
   type IIterator_IAdcControllerProvider_Interface;
   type IIterator_IAdcControllerProvider is access all IIterator_IAdcControllerProvider_Interface'Class;
   type IIterator_IAdcControllerProvider_Ptr is access all IIterator_IAdcControllerProvider;
   type IIterable_IAdcControllerProvider_Interface;
   type IIterable_IAdcControllerProvider is access all IIterable_IAdcControllerProvider_Interface'Class;
   type IIterable_IAdcControllerProvider_Ptr is access all IIterable_IAdcControllerProvider;
   type IVectorView_IAdcControllerProvider_Interface;
   type IVectorView_IAdcControllerProvider is access all IVectorView_IAdcControllerProvider_Interface'Class;
   type IVectorView_IAdcControllerProvider_Ptr is access all IVectorView_IAdcControllerProvider;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAdcControllerProvider : aliased constant Windows.IID := (3193198632, 33133, 19941, (160, 72, 171, 160, 105, 88, 170, 168 ));
   
   type IAdcControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChannelCount
   (
      This       : access IAdcControllerProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolutionInBits
   (
      This       : access IAdcControllerProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MinValue
   (
      This       : access IAdcControllerProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxValue
   (
      This       : access IAdcControllerProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ChannelMode
   (
      This       : access IAdcControllerProvider_Interface
      ; RetVal : access Windows.Devices.Adc.Provider.ProviderAdcChannelMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ChannelMode
   (
      This       : access IAdcControllerProvider_Interface
      ; value : Windows.Devices.Adc.Provider.ProviderAdcChannelMode
   )
   return Windows.HRESULT is abstract;
   
   function IsChannelModeSupported
   (
      This       : access IAdcControllerProvider_Interface
      ; channelMode : Windows.Devices.Adc.Provider.ProviderAdcChannelMode
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function AcquireChannel
   (
      This       : access IAdcControllerProvider_Interface
      ; channel : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function ReleaseChannel
   (
      This       : access IAdcControllerProvider_Interface
      ; channel : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function ReadValue
   (
      This       : access IAdcControllerProvider_Interface
      ; channelNumber : Windows.Int32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAdcProvider : aliased constant Windows.IID := (680867432, 37721, 19543, (188, 136, 226, 117, 232, 22, 56, 201 ));
   
   type IAdcProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetControllers
   (
      This       : access IAdcProvider_Interface
      ; RetVal : access Windows.Devices.Adc.Provider.IVectorView_IAdcControllerProvider -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAdcControllerProvider : aliased constant Windows.IID := (3023752981, 41546, 23296, (183, 16, 23, 55, 186, 85, 10, 24 ));
   
   type IIterator_IAdcControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAdcControllerProvider_Interface
      ; RetVal : access Windows.Devices.Adc.Provider.IAdcControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAdcControllerProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAdcControllerProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAdcControllerProvider_Interface
      ; items : Windows.Devices.Adc.Provider.IAdcControllerProvider_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAdcControllerProvider : aliased constant Windows.IID := (805597525, 8049, 21027, (132, 130, 229, 21, 157, 1, 55, 208 ));
   
   type IIterable_IAdcControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAdcControllerProvider_Interface
      ; RetVal : access Windows.Devices.Adc.Provider.IIterator_IAdcControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAdcControllerProvider : aliased constant Windows.IID := (2085063104, 33861, 22359, (170, 183, 101, 156, 191, 80, 170, 167 ));
   
   type IVectorView_IAdcControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAdcControllerProvider_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Adc.Provider.IAdcControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAdcControllerProvider_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAdcControllerProvider_Interface
      ; value : Windows.Devices.Adc.Provider.IAdcControllerProvider
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAdcControllerProvider_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Adc.Provider.IAdcControllerProvider_Ptr
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
