--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
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
   -- Record types
   ------------------------------------------------------------------------
   
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
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IProviderSpiConnectionSettingsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IProviderSpiConnectionSettingsFactory_Interface
      ; chipSelectLine : Windows.Int32
      ; RetVal : access Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
   )
   return Windows.HRESULT is abstract;
   
   IID_IProviderSpiConnectionSettingsFactory : aliased constant Windows.IID := (1715825498, 3193, 17379, (159, 60, 229, 151, 128, 172, 24, 250 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IProviderSpiConnectionSettings : aliased constant Windows.IID := (4127409488, 42306, 20160, (150, 1, 164, 221, 104, 248, 105, 123 ));
   
   ------------------------------------------------------------------------
   type ISpiControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceProvider
   (
      This       : access ISpiControllerProvider_Interface
      ; settings : Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
      ; RetVal : access Windows.Devices.Spi.Provider.ISpiDeviceProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpiControllerProvider : aliased constant Windows.IID := (3244844292, 718, 16934, (163, 133, 79, 17, 251, 4, 180, 27 ));
   
   ------------------------------------------------------------------------
   type ISpiProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetControllersAsync
   (
      This       : access ISpiProvider_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpiProvider : aliased constant Windows.IID := (2528403938, 30676, 18638, (170, 160, 117, 113, 90, 131, 98, 207 ));
   
   ------------------------------------------------------------------------
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
   
   IID_ISpiDeviceProvider : aliased constant Windows.IID := (219952195, 12363, 16476, (180, 247, 245, 171, 16, 116, 70, 30 ));
   
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
