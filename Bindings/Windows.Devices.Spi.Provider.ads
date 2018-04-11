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
with Windows.Foundation;
with Windows.Foundation.Collections;
package Windows.Devices.Spi.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ProviderSpiMode is (
      Mode0,
      Mode1,
      Mode2,
      Mode3
   );
   for ProviderSpiMode use (
      Mode0 => 0,
      Mode1 => 1,
      Mode2 => 2,
      Mode3 => 3
   );
   for ProviderSpiMode'Size use 32;
   
   type ProviderSpiMode_Ptr is access ProviderSpiMode;
   
   type ProviderSpiSharingMode is (
      Exclusive,
      Shared
   );
   for ProviderSpiSharingMode use (
      Exclusive => 0,
      Shared => 1
   );
   for ProviderSpiSharingMode'Size use 32;
   
   type ProviderSpiSharingMode_Ptr is access ProviderSpiSharingMode;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IProviderSpiConnectionSettingsFactory_Interface;
   type IProviderSpiConnectionSettingsFactory is access all IProviderSpiConnectionSettingsFactory_Interface'Class;
   type IProviderSpiConnectionSettingsFactory_Ptr is access all IProviderSpiConnectionSettingsFactory;
   type IProviderSpiConnectionSettings_Interface;
   type IProviderSpiConnectionSettings is access all IProviderSpiConnectionSettings_Interface'Class;
   type IProviderSpiConnectionSettings_Ptr is access all IProviderSpiConnectionSettings;
   type ISpiControllerProvider_Interface;
   type ISpiControllerProvider is access all ISpiControllerProvider_Interface'Class;
   type ISpiControllerProvider_Ptr is access all ISpiControllerProvider;
   type ISpiProvider_Interface;
   type ISpiProvider is access all ISpiProvider_Interface'Class;
   type ISpiProvider_Ptr is access all ISpiProvider;
   type ISpiDeviceProvider_Interface;
   type ISpiDeviceProvider is access all ISpiDeviceProvider_Interface'Class;
   type ISpiDeviceProvider_Ptr is access all ISpiDeviceProvider;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IProviderSpiConnectionSettingsFactory : aliased constant Windows.IID := (1715825498, 3193, 17379, (159, 60, 229, 151, 128, 172, 24, 250 ));
   
   type IProviderSpiConnectionSettingsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IProviderSpiConnectionSettingsFactory_Interface
      ; chipSelectLine : Windows.Int32
      ; RetVal : access Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProviderSpiConnectionSettings : aliased constant Windows.IID := (4127409488, 42306, 20160, (150, 1, 164, 221, 104, 248, 105, 123 ));
   
   type IProviderSpiConnectionSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChipSelectLine
   (
      This       : access IProviderSpiConnectionSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ChipSelectLine
   (
      This       : access IProviderSpiConnectionSettings_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Mode
   (
      This       : access IProviderSpiConnectionSettings_Interface
      ; RetVal : access Windows.Devices.Spi.Provider.ProviderSpiMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IProviderSpiConnectionSettings_Interface
      ; value : Windows.Devices.Spi.Provider.ProviderSpiMode
   )
   return Windows.HRESULT is abstract;
   
   function get_DataBitLength
   (
      This       : access IProviderSpiConnectionSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_DataBitLength
   (
      This       : access IProviderSpiConnectionSettings_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ClockFrequency
   (
      This       : access IProviderSpiConnectionSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ClockFrequency
   (
      This       : access IProviderSpiConnectionSettings_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SharingMode
   (
      This       : access IProviderSpiConnectionSettings_Interface
      ; RetVal : access Windows.Devices.Spi.Provider.ProviderSpiSharingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_SharingMode
   (
      This       : access IProviderSpiConnectionSettings_Interface
      ; value : Windows.Devices.Spi.Provider.ProviderSpiSharingMode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpiControllerProvider : aliased constant Windows.IID := (3244844292, 718, 16934, (163, 133, 79, 17, 251, 4, 180, 27 ));
   
   type ISpiControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceProvider
   (
      This       : access ISpiControllerProvider_Interface
      ; settings : Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
      ; RetVal : access Windows.Devices.Spi.Provider.ISpiDeviceProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpiProvider : aliased constant Windows.IID := (2528403938, 30676, 18638, (170, 160, 117, 113, 90, 131, 98, 207 ));
   
   type ISpiProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetControllersAsync
   (
      This       : access ISpiProvider_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpiDeviceProvider : aliased constant Windows.IID := (219952195, 12363, 16476, (180, 247, 245, 171, 16, 116, 70, 30 ));
   
   type ISpiDeviceProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ISpiDeviceProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionSettings
   (
      This       : access ISpiDeviceProvider_Interface
      ; RetVal : access Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
   )
   return Windows.HRESULT is abstract;
   
   function Write
   (
      This       : access ISpiDeviceProvider_Interface
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function Read
   (
      This       : access ISpiDeviceProvider_Interface
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function TransferSequential
   (
      This       : access ISpiDeviceProvider_Interface
      ; writeBuffer : Windows.UInt8_Ptr
      ; readBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function TransferFullDuplex
   (
      This       : access ISpiDeviceProvider_Interface
      ; writeBuffer : Windows.UInt8_Ptr
      ; readBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ProviderSpiConnectionSettings is Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings;
   function Create
   (
      chipSelectLine : Windows.Int32
   )
   return Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
