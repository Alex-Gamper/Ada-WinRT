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
limited with Windows.Devices.Adc.Provider;
limited with Windows.Devices.Pwm.Provider;
limited with Windows.Devices.Gpio.Provider;
limited with Windows.Devices.I2c.Provider;
limited with Windows.Devices.Spi.Provider;
--------------------------------------------------------------------------------
package Windows.Devices is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type DevicesLowLevelContract is null record;
   pragma Convention (C_Pass_By_Copy , DevicesLowLevelContract);
   
   type DevicesLowLevelContract_Ptr is access DevicesLowLevelContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ILowLevelDevicesAggregateProvider_Interface;
   type ILowLevelDevicesAggregateProvider is access all ILowLevelDevicesAggregateProvider_Interface'Class;
   type ILowLevelDevicesAggregateProvider_Ptr is access all ILowLevelDevicesAggregateProvider;
   type ILowLevelDevicesAggregateProviderFactory_Interface;
   type ILowLevelDevicesAggregateProviderFactory is access all ILowLevelDevicesAggregateProviderFactory_Interface'Class;
   type ILowLevelDevicesAggregateProviderFactory_Ptr is access all ILowLevelDevicesAggregateProviderFactory;
   type ILowLevelDevicesController_Interface;
   type ILowLevelDevicesController is access all ILowLevelDevicesController_Interface'Class;
   type ILowLevelDevicesController_Ptr is access all ILowLevelDevicesController;
   type ILowLevelDevicesControllerStatics_Interface;
   type ILowLevelDevicesControllerStatics is access all ILowLevelDevicesControllerStatics_Interface'Class;
   type ILowLevelDevicesControllerStatics_Ptr is access all ILowLevelDevicesControllerStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ILowLevelDevicesAggregateProvider : aliased constant Windows.IID := (2805880348, 43713, 20167, (168, 82, 71, 159, 112, 96, 208, 31 ));
   
   type ILowLevelDevicesAggregateProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AdcControllerProvider
   (
      This       : access ILowLevelDevicesAggregateProvider_Interface
      ; RetVal : access Windows.Devices.Adc.Provider.IAdcControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_PwmControllerProvider
   (
      This       : access ILowLevelDevicesAggregateProvider_Interface
      ; RetVal : access Windows.Devices.Pwm.Provider.IPwmControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_GpioControllerProvider
   (
      This       : access ILowLevelDevicesAggregateProvider_Interface
      ; RetVal : access Windows.Devices.Gpio.Provider.IGpioControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_I2cControllerProvider
   (
      This       : access ILowLevelDevicesAggregateProvider_Interface
      ; RetVal : access Windows.Devices.I2c.Provider.II2cControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_SpiControllerProvider
   (
      This       : access ILowLevelDevicesAggregateProvider_Interface
      ; RetVal : access Windows.Devices.Spi.Provider.ISpiControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILowLevelDevicesAggregateProviderFactory : aliased constant Windows.IID := (2596580086, 13427, 18014, (150, 213, 54, 40, 26, 44, 87, 175 ));
   
   type ILowLevelDevicesAggregateProviderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ILowLevelDevicesAggregateProviderFactory_Interface
      ; adc : Windows.Devices.Adc.Provider.IAdcControllerProvider
      ; pwm : Windows.Devices.Pwm.Provider.IPwmControllerProvider
      ; gpio : Windows.Devices.Gpio.Provider.IGpioControllerProvider
      ; i2c : Windows.Devices.I2c.Provider.II2cControllerProvider
      ; spi : Windows.Devices.Spi.Provider.ISpiControllerProvider
      ; RetVal : access Windows.Devices.ILowLevelDevicesAggregateProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILowLevelDevicesController : aliased constant Windows.IID := (784481748, 6043, 17886, (155, 57, 58, 224, 37, 39, 222, 82 ));
   
   type ILowLevelDevicesController_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ILowLevelDevicesControllerStatics : aliased constant Windows.IID := (155095658, 64715, 17300, (166, 151, 25, 222, 99, 124, 45, 179 ));
   
   type ILowLevelDevicesControllerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DefaultProvider
   (
      This       : access ILowLevelDevicesControllerStatics_Interface
      ; RetVal : access Windows.Devices.ILowLevelDevicesAggregateProvider
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultProvider
   (
      This       : access ILowLevelDevicesControllerStatics_Interface
      ; value : Windows.Devices.ILowLevelDevicesAggregateProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype LowLevelDevicesAggregateProvider is Windows.Devices.ILowLevelDevicesAggregateProvider;
   function Create
   (
      adc : Windows.Devices.Adc.Provider.IAdcControllerProvider
      ; pwm : Windows.Devices.Pwm.Provider.IPwmControllerProvider
      ; gpio : Windows.Devices.Gpio.Provider.IGpioControllerProvider
      ; i2c : Windows.Devices.I2c.Provider.II2cControllerProvider
      ; spi : Windows.Devices.Spi.Provider.ISpiControllerProvider
   )
   return Windows.Devices.ILowLevelDevicesAggregateProvider;
   
   subtype LowLevelDevicesController is Windows.Devices.ILowLevelDevicesController;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_DefaultProvider
   return Windows.Devices.ILowLevelDevicesAggregateProvider;
   
   procedure put_DefaultProvider
   (
      value : Windows.Devices.ILowLevelDevicesAggregateProvider
   )
   ;
   
end;
