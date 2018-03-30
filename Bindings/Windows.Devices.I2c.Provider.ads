--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Devices.I2c.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ProviderI2cBusSpeed is (
      StandardMode,
      FastMode
   );
   for ProviderI2cBusSpeed use (
      StandardMode => 0,
      FastMode => 1
   );
   for ProviderI2cBusSpeed'Size use 32;
   
   type ProviderI2cBusSpeed_Ptr is access ProviderI2cBusSpeed;
   
   type ProviderI2cTransferStatus is (
      FullTransfer,
      PartialTransfer,
      SlaveAddressNotAcknowledged
   );
   for ProviderI2cTransferStatus use (
      FullTransfer => 0,
      PartialTransfer => 1,
      SlaveAddressNotAcknowledged => 2
   );
   for ProviderI2cTransferStatus'Size use 32;
   
   type ProviderI2cTransferStatus_Ptr is access ProviderI2cTransferStatus;
   
   type ProviderI2cSharingMode is (
      Exclusive,
      Shared
   );
   for ProviderI2cSharingMode use (
      Exclusive => 0,
      Shared => 1
   );
   for ProviderI2cSharingMode'Size use 32;
   
   type ProviderI2cSharingMode_Ptr is access ProviderI2cSharingMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ProviderI2cTransferResult is record
      Status : Windows.Devices.I2c.Provider.ProviderI2cTransferStatus;
      BytesTransferred : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , ProviderI2cTransferResult);
   
   type ProviderI2cTransferResult_Ptr is access ProviderI2cTransferResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IProviderI2cConnectionSettings_Interface;
   type IProviderI2cConnectionSettings is access all IProviderI2cConnectionSettings_Interface'Class;
   type IProviderI2cConnectionSettings_Ptr is access all IProviderI2cConnectionSettings;
   type II2cControllerProvider_Interface;
   type II2cControllerProvider is access all II2cControllerProvider_Interface'Class;
   type II2cControllerProvider_Ptr is access all II2cControllerProvider;
   type II2cProvider_Interface;
   type II2cProvider is access all II2cProvider_Interface'Class;
   type II2cProvider_Ptr is access all II2cProvider;
   type II2cDeviceProvider_Interface;
   type II2cDeviceProvider is access all II2cDeviceProvider_Interface'Class;
   type II2cDeviceProvider_Ptr is access all II2cDeviceProvider;
   
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
   type IProviderI2cConnectionSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SlaveAddress
   (
      This       : access IProviderI2cConnectionSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_SlaveAddress
   (
      This       : access IProviderI2cConnectionSettings_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_BusSpeed
   (
      This       : access IProviderI2cConnectionSettings_Interface
      ; RetVal : access Windows.Devices.I2c.Provider.ProviderI2cBusSpeed
   )
   return Windows.HRESULT is abstract;
   
   function put_BusSpeed
   (
      This       : access IProviderI2cConnectionSettings_Interface
      ; value : Windows.Devices.I2c.Provider.ProviderI2cBusSpeed
   )
   return Windows.HRESULT is abstract;
   
   function get_SharingMode
   (
      This       : access IProviderI2cConnectionSettings_Interface
      ; RetVal : access Windows.Devices.I2c.Provider.ProviderI2cSharingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_SharingMode
   (
      This       : access IProviderI2cConnectionSettings_Interface
      ; value : Windows.Devices.I2c.Provider.ProviderI2cSharingMode
   )
   return Windows.HRESULT is abstract;
   
   IID_IProviderI2cConnectionSettings : aliased constant Windows.IID := (3923463732, 58640, 17591, (128, 157, 242, 248, 91, 85, 83, 57 ));
   
   ------------------------------------------------------------------------
   type II2cControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceProvider
   (
      This       : access II2cControllerProvider_Interface
      ; settings : Windows.Devices.I2c.Provider.IProviderI2cConnectionSettings
      ; RetVal : access Windows.Devices.I2c.Provider.II2cDeviceProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_II2cControllerProvider : aliased constant Windows.IID := (1640151938, 17680, 16739, (168, 124, 78, 21, 169, 85, 137, 128 ));
   
   ------------------------------------------------------------------------
   type II2cProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetControllersAsync
   (
      This       : access II2cProvider_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_II2cProvider : aliased constant Windows.IID := (1863518270, 48994, 20450, (169, 90, 240, 137, 153, 102, 152, 24 ));
   
   ------------------------------------------------------------------------
   type II2cDeviceProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access II2cDeviceProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Write
   (
      This       : access II2cDeviceProvider_Interface
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function WritePartial
   (
      This       : access II2cDeviceProvider_Interface
      ; buffer : Windows.UInt8_Ptr
      ; RetVal : access Windows.Devices.I2c.Provider.ProviderI2cTransferResult
   )
   return Windows.HRESULT is abstract;
   
   function Read
   (
      This       : access II2cDeviceProvider_Interface
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function ReadPartial
   (
      This       : access II2cDeviceProvider_Interface
      ; buffer : Windows.UInt8_Ptr
      ; RetVal : access Windows.Devices.I2c.Provider.ProviderI2cTransferResult
   )
   return Windows.HRESULT is abstract;
   
   function WriteRead
   (
      This       : access II2cDeviceProvider_Interface
      ; writeBuffer : Windows.UInt8_Ptr
      ; readBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function WriteReadPartial
   (
      This       : access II2cDeviceProvider_Interface
      ; writeBuffer : Windows.UInt8_Ptr
      ; readBuffer : Windows.UInt8_Ptr
      ; RetVal : access Windows.Devices.I2c.Provider.ProviderI2cTransferResult
   )
   return Windows.HRESULT is abstract;
   
   IID_II2cDeviceProvider : aliased constant Windows.IID := (2905876052, 22504, 17726, (131, 41, 209, 228, 71, 209, 3, 169 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ProviderI2cConnectionSettings is Windows.Devices.I2c.Provider.IProviderI2cConnectionSettings;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
