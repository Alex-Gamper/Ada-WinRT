--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Devices.I2c.Provider;
--------------------------------------------------------------------------------
package Windows.Devices.I2c is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type I2cBusSpeed is (
      StandardMode,
      FastMode
   );
   for I2cBusSpeed use (
      StandardMode => 0,
      FastMode => 1
   );
   for I2cBusSpeed'Size use 32;
   
   type I2cBusSpeed_Ptr is access I2cBusSpeed;
   
   type I2cTransferStatus is (
      FullTransfer,
      PartialTransfer,
      SlaveAddressNotAcknowledged,
      ClockStretchTimeout,
      UnknownError
   );
   for I2cTransferStatus use (
      FullTransfer => 0,
      PartialTransfer => 1,
      SlaveAddressNotAcknowledged => 2,
      ClockStretchTimeout => 3,
      UnknownError => 4
   );
   for I2cTransferStatus'Size use 32;
   
   type I2cTransferStatus_Ptr is access I2cTransferStatus;
   
   type I2cSharingMode is (
      Exclusive,
      Shared
   );
   for I2cSharingMode use (
      Exclusive => 0,
      Shared => 1
   );
   for I2cSharingMode'Size use 32;
   
   type I2cSharingMode_Ptr is access I2cSharingMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type I2cTransferResult is record
      Status : Windows.Devices.I2c.I2cTransferStatus;
      BytesTransferred : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , I2cTransferResult);
   
   type I2cTransferResult_Ptr is access I2cTransferResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_II2cDevice_Interface;
   type AsyncOperationCompletedHandler_II2cDevice is access all AsyncOperationCompletedHandler_II2cDevice_Interface'Class;
   type AsyncOperationCompletedHandler_II2cDevice_Ptr is access all AsyncOperationCompletedHandler_II2cDevice;
   type AsyncOperationCompletedHandler_II2cController_Interface;
   type AsyncOperationCompletedHandler_II2cController is access all AsyncOperationCompletedHandler_II2cController_Interface'Class;
   type AsyncOperationCompletedHandler_II2cController_Ptr is access all AsyncOperationCompletedHandler_II2cController;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type II2cConnectionSettingsFactory_Interface;
   type II2cConnectionSettingsFactory is access all II2cConnectionSettingsFactory_Interface'Class;
   type II2cConnectionSettingsFactory_Ptr is access all II2cConnectionSettingsFactory;
   type II2cConnectionSettings_Interface;
   type II2cConnectionSettings is access all II2cConnectionSettings_Interface'Class;
   type II2cConnectionSettings_Ptr is access all II2cConnectionSettings;
   type II2cDeviceStatics_Interface;
   type II2cDeviceStatics is access all II2cDeviceStatics_Interface'Class;
   type II2cDeviceStatics_Ptr is access all II2cDeviceStatics;
   type II2cController_Interface;
   type II2cController is access all II2cController_Interface'Class;
   type II2cController_Ptr is access all II2cController;
   type II2cControllerStatics_Interface;
   type II2cControllerStatics is access all II2cControllerStatics_Interface'Class;
   type II2cControllerStatics_Ptr is access all II2cControllerStatics;
   type II2cDevice_Interface;
   type II2cDevice is access all II2cDevice_Interface'Class;
   type II2cDevice_Ptr is access all II2cDevice;
   type IAsyncOperation_II2cDevice_Interface;
   type IAsyncOperation_II2cDevice is access all IAsyncOperation_II2cDevice_Interface'Class;
   type IAsyncOperation_II2cDevice_Ptr is access all IAsyncOperation_II2cDevice;
   type IAsyncOperation_II2cController_Interface;
   type IAsyncOperation_II2cController is access all IAsyncOperation_II2cController_Interface'Class;
   type IAsyncOperation_II2cController_Ptr is access all IAsyncOperation_II2cController;
   
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
   type II2cConnectionSettingsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access II2cConnectionSettingsFactory_Interface
      ; slaveAddress : Windows.Int32
      ; RetVal : access Windows.Devices.I2c.II2cConnectionSettings
   )
   return Windows.HRESULT is abstract;
   
   IID_II2cConnectionSettingsFactory : aliased constant Windows.IID := (2176157363, 38547, 16817, (162, 67, 222, 212, 246, 230, 105, 38 ));
   
   ------------------------------------------------------------------------
   type II2cConnectionSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SlaveAddress
   (
      This       : access II2cConnectionSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_SlaveAddress
   (
      This       : access II2cConnectionSettings_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_BusSpeed
   (
      This       : access II2cConnectionSettings_Interface
      ; RetVal : access Windows.Devices.I2c.I2cBusSpeed
   )
   return Windows.HRESULT is abstract;
   
   function put_BusSpeed
   (
      This       : access II2cConnectionSettings_Interface
      ; value : Windows.Devices.I2c.I2cBusSpeed
   )
   return Windows.HRESULT is abstract;
   
   function get_SharingMode
   (
      This       : access II2cConnectionSettings_Interface
      ; RetVal : access Windows.Devices.I2c.I2cSharingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_SharingMode
   (
      This       : access II2cConnectionSettings_Interface
      ; value : Windows.Devices.I2c.I2cSharingMode
   )
   return Windows.HRESULT is abstract;
   
   IID_II2cConnectionSettings : aliased constant Windows.IID := (4074443527, 43887, 17977, (167, 103, 84, 83, 109, 195, 70, 15 ));
   
   ------------------------------------------------------------------------
   type II2cDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access II2cDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromFriendlyName
   (
      This       : access II2cDeviceStatics_Interface
      ; friendlyName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access II2cDeviceStatics_Interface
      ; deviceId : Windows.String
      ; settings : Windows.Devices.I2c.II2cConnectionSettings
      ; RetVal : access Windows.Devices.I2c.IAsyncOperation_II2cDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_II2cDeviceStatics : aliased constant Windows.IID := (2443394019, 29492, 17682, (150, 188, 251, 174, 148, 89, 245, 246 ));
   
   ------------------------------------------------------------------------
   type II2cController_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDevice
   (
      This       : access II2cController_Interface
      ; settings : Windows.Devices.I2c.II2cConnectionSettings
      ; RetVal : access Windows.Devices.I2c.II2cDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_II2cController : aliased constant Windows.IID := (3297423794, 34720, 16742, (142, 62, 180, 184, 249, 124, 215, 41 ));
   
   ------------------------------------------------------------------------
   type II2cControllerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetControllersAsync
   (
      This       : access II2cControllerStatics_Interface
      ; provider : Windows.Devices.I2c.Provider.II2cProvider
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultAsync
   (
      This       : access II2cControllerStatics_Interface
      ; RetVal : access Windows.Devices.I2c.IAsyncOperation_II2cController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_II2cControllerStatics : aliased constant Windows.IID := (1090257765, 24325, 20094, (132, 189, 16, 13, 184, 224, 174, 197 ));
   
   ------------------------------------------------------------------------
   type II2cDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access II2cDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionSettings
   (
      This       : access II2cDevice_Interface
      ; RetVal : access Windows.Devices.I2c.II2cConnectionSettings
   )
   return Windows.HRESULT is abstract;
   
   function Write
   (
      This       : access II2cDevice_Interface
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function WritePartial
   (
      This       : access II2cDevice_Interface
      ; buffer : Windows.UInt8_Ptr
      ; RetVal : access Windows.Devices.I2c.I2cTransferResult
   )
   return Windows.HRESULT is abstract;
   
   function Read
   (
      This       : access II2cDevice_Interface
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function ReadPartial
   (
      This       : access II2cDevice_Interface
      ; buffer : Windows.UInt8_Ptr
      ; RetVal : access Windows.Devices.I2c.I2cTransferResult
   )
   return Windows.HRESULT is abstract;
   
   function WriteRead
   (
      This       : access II2cDevice_Interface
      ; writeBuffer : Windows.UInt8_Ptr
      ; readBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function WriteReadPartial
   (
      This       : access II2cDevice_Interface
      ; writeBuffer : Windows.UInt8_Ptr
      ; readBuffer : Windows.UInt8_Ptr
      ; RetVal : access Windows.Devices.I2c.I2cTransferResult
   )
   return Windows.HRESULT is abstract;
   
   IID_II2cDevice : aliased constant Windows.IID := (2251735350, 47557, 20336, (148, 73, 204, 70, 220, 111, 87, 235 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_II2cDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_II2cDevice_Interface
      ; handler : Windows.Devices.I2c.AsyncOperationCompletedHandler_II2cDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_II2cDevice_Interface
      ; RetVal : access Windows.Devices.I2c.AsyncOperationCompletedHandler_II2cDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_II2cDevice_Interface
      ; RetVal : access Windows.Devices.I2c.II2cDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_II2cDevice : aliased constant Windows.IID := (512392408, 58395, 23105, (130, 177, 128, 5, 80, 18, 174, 0 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_II2cController_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_II2cController_Interface
      ; handler : Windows.Devices.I2c.AsyncOperationCompletedHandler_II2cController
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_II2cController_Interface
      ; RetVal : access Windows.Devices.I2c.AsyncOperationCompletedHandler_II2cController
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_II2cController_Interface
      ; RetVal : access Windows.Devices.I2c.II2cController
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_II2cController : aliased constant Windows.IID := (2767920596, 32969, 23137, (174, 141, 200, 167, 175, 192, 50, 117 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_II2cDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.I2c.IAsyncOperation_II2cDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_II2cDevice_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_II2cDevice_Interface
      ; asyncInfo : Windows.Devices.I2c.IAsyncOperation_II2cDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_II2cDevice : aliased constant Windows.IID := (771079018, 24179, 23267, (160, 178, 34, 225, 201, 216, 239, 77 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_II2cController_Interface(Callback : access procedure (asyncInfo : Windows.Devices.I2c.IAsyncOperation_II2cController ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_II2cController_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_II2cController_Interface
      ; asyncInfo : Windows.Devices.I2c.IAsyncOperation_II2cController
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_II2cController : aliased constant Windows.IID := (1878412146, 42410, 22918, (181, 99, 39, 97, 42, 251, 55, 60 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype I2cConnectionSettings is Windows.Devices.I2c.II2cConnectionSettings;
   
   function Create
   (
      slaveAddress : Windows.Int32
   )
   return Windows.Devices.I2c.II2cConnectionSettings;
   
   subtype I2cDevice is Windows.Devices.I2c.II2cDevice;
   subtype I2cController is Windows.Devices.I2c.II2cController;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetDeviceSelector
   return Windows.String;
   
   function GetDeviceSelectorFromFriendlyName
   (
      friendlyName : Windows.String
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
      ; settings : Windows.Devices.I2c.II2cConnectionSettings
   )
   return Windows.Devices.I2c.IAsyncOperation_II2cDevice;
   
   function GetControllersAsync
   (
      provider : Windows.Devices.I2c.Provider.II2cProvider
   )
   return Windows.Address;
   
   function GetDefaultAsync
   return Windows.Devices.I2c.IAsyncOperation_II2cController;

end;
