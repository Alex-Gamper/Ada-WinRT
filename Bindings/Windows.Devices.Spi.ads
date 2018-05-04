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
with Windows.Foundation;
limited with Windows.Devices.Spi.Provider;
--------------------------------------------------------------------------------
package Windows.Devices.Spi is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SpiMode is (
      Mode0,
      Mode1,
      Mode2,
      Mode3
   );
   for SpiMode use (
      Mode0 => 0,
      Mode1 => 1,
      Mode2 => 2,
      Mode3 => 3
   );
   for SpiMode'Size use 32;
   
   type SpiMode_Ptr is access SpiMode;
   
   type SpiSharingMode is (
      Exclusive,
      Shared
   );
   for SpiSharingMode use (
      Exclusive => 0,
      Shared => 1
   );
   for SpiSharingMode'Size use 32;
   
   type SpiSharingMode_Ptr is access SpiSharingMode;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ISpiDevice_Interface;
   type AsyncOperationCompletedHandler_ISpiDevice is access all AsyncOperationCompletedHandler_ISpiDevice_Interface'Class;
   type AsyncOperationCompletedHandler_ISpiDevice_Ptr is access all AsyncOperationCompletedHandler_ISpiDevice;
   type AsyncOperationCompletedHandler_ISpiController_Interface;
   type AsyncOperationCompletedHandler_ISpiController is access all AsyncOperationCompletedHandler_ISpiController_Interface'Class;
   type AsyncOperationCompletedHandler_ISpiController_Ptr is access all AsyncOperationCompletedHandler_ISpiController;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISpiConnectionSettingsFactory_Interface;
   type ISpiConnectionSettingsFactory is access all ISpiConnectionSettingsFactory_Interface'Class;
   type ISpiConnectionSettingsFactory_Ptr is access all ISpiConnectionSettingsFactory;
   type ISpiConnectionSettings_Interface;
   type ISpiConnectionSettings is access all ISpiConnectionSettings_Interface'Class;
   type ISpiConnectionSettings_Ptr is access all ISpiConnectionSettings;
   type ISpiBusInfo_Interface;
   type ISpiBusInfo is access all ISpiBusInfo_Interface'Class;
   type ISpiBusInfo_Ptr is access all ISpiBusInfo;
   type ISpiDeviceStatics_Interface;
   type ISpiDeviceStatics is access all ISpiDeviceStatics_Interface'Class;
   type ISpiDeviceStatics_Ptr is access all ISpiDeviceStatics;
   type ISpiController_Interface;
   type ISpiController is access all ISpiController_Interface'Class;
   type ISpiController_Ptr is access all ISpiController;
   type ISpiControllerStatics_Interface;
   type ISpiControllerStatics is access all ISpiControllerStatics_Interface'Class;
   type ISpiControllerStatics_Ptr is access all ISpiControllerStatics;
   type ISpiDevice_Interface;
   type ISpiDevice is access all ISpiDevice_Interface'Class;
   type ISpiDevice_Ptr is access all ISpiDevice;
   type IAsyncOperation_ISpiDevice_Interface;
   type IAsyncOperation_ISpiDevice is access all IAsyncOperation_ISpiDevice_Interface'Class;
   type IAsyncOperation_ISpiDevice_Ptr is access all IAsyncOperation_ISpiDevice;
   type IAsyncOperation_ISpiController_Interface;
   type IAsyncOperation_ISpiController is access all IAsyncOperation_ISpiController_Interface'Class;
   type IAsyncOperation_ISpiController_Ptr is access all IAsyncOperation_ISpiController;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISpiConnectionSettingsFactory : aliased constant Windows.IID := (4288219166, 4292, 17591, (159, 234, 167, 72, 181, 164, 111, 49 ));
   
   type ISpiConnectionSettingsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISpiConnectionSettingsFactory_Interface
      ; chipSelectLine : Windows.Int32
      ; RetVal : access Windows.Devices.Spi.ISpiConnectionSettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpiConnectionSettings : aliased constant Windows.IID := (1384358783, 63797, 19359, (167, 167, 58, 120, 144, 175, 165, 206 ));
   
   type ISpiConnectionSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChipSelectLine
   (
      This       : access ISpiConnectionSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ChipSelectLine
   (
      This       : access ISpiConnectionSettings_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Mode
   (
      This       : access ISpiConnectionSettings_Interface
      ; RetVal : access Windows.Devices.Spi.SpiMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access ISpiConnectionSettings_Interface
      ; value : Windows.Devices.Spi.SpiMode
   )
   return Windows.HRESULT is abstract;
   
   function get_DataBitLength
   (
      This       : access ISpiConnectionSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_DataBitLength
   (
      This       : access ISpiConnectionSettings_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ClockFrequency
   (
      This       : access ISpiConnectionSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ClockFrequency
   (
      This       : access ISpiConnectionSettings_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SharingMode
   (
      This       : access ISpiConnectionSettings_Interface
      ; RetVal : access Windows.Devices.Spi.SpiSharingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_SharingMode
   (
      This       : access ISpiConnectionSettings_Interface
      ; value : Windows.Devices.Spi.SpiSharingMode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpiBusInfo : aliased constant Windows.IID := (2569618506, 21746, 18630, (185, 82, 156, 50, 252, 2, 198, 105 ));
   
   type ISpiBusInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChipSelectLineCount
   (
      This       : access ISpiBusInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MinClockFrequency
   (
      This       : access ISpiBusInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxClockFrequency
   (
      This       : access ISpiBusInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedDataBitLengths
   (
      This       : access ISpiBusInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpiDeviceStatics : aliased constant Windows.IID := (2725832025, 22304, 19775, (189, 147, 86, 245, 255, 90, 88, 121 ));
   
   type ISpiDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ISpiDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromFriendlyName
   (
      This       : access ISpiDeviceStatics_Interface
      ; friendlyName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetBusInfo
   (
      This       : access ISpiDeviceStatics_Interface
      ; busId : Windows.String
      ; RetVal : access Windows.Devices.Spi.ISpiBusInfo
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ISpiDeviceStatics_Interface
      ; busId : Windows.String
      ; settings : Windows.Devices.Spi.ISpiConnectionSettings
      ; RetVal : access Windows.Devices.Spi.IAsyncOperation_ISpiDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpiController : aliased constant Windows.IID := (2832451625, 39061, 16729, (169, 52, 135, 65, 241, 238, 109, 39 ));
   
   type ISpiController_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDevice
   (
      This       : access ISpiController_Interface
      ; settings : Windows.Devices.Spi.ISpiConnectionSettings
      ; RetVal : access Windows.Devices.Spi.ISpiDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpiControllerStatics : aliased constant Windows.IID := (223488482, 5003, 20040, (185, 100, 79, 47, 121, 185, 197, 162 ));
   
   type ISpiControllerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultAsync
   (
      This       : access ISpiControllerStatics_Interface
      ; RetVal : access Windows.Devices.Spi.IAsyncOperation_ISpiController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetControllersAsync
   (
      This       : access ISpiControllerStatics_Interface
      ; provider : Windows.Devices.Spi.Provider.ISpiProvider
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpiDevice : aliased constant Windows.IID := (97858925, 4534, 19769, (132, 213, 149, 223, 180, 201, 242, 206 ));
   
   type ISpiDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ISpiDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionSettings
   (
      This       : access ISpiDevice_Interface
      ; RetVal : access Windows.Devices.Spi.ISpiConnectionSettings
   )
   return Windows.HRESULT is abstract;
   
   function Write
   (
      This       : access ISpiDevice_Interface
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function Read
   (
      This       : access ISpiDevice_Interface
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function TransferSequential
   (
      This       : access ISpiDevice_Interface
      ; writeBuffer : Windows.UInt8_Ptr
      ; readBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function TransferFullDuplex
   (
      This       : access ISpiDevice_Interface
      ; writeBuffer : Windows.UInt8_Ptr
      ; readBuffer : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISpiDevice : aliased constant Windows.IID := (4273489514, 34703, 22395, (187, 202, 137, 87, 92, 252, 86, 228 ));
   
   type IAsyncOperation_ISpiDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISpiDevice_Interface
      ; handler : Windows.Devices.Spi.AsyncOperationCompletedHandler_ISpiDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISpiDevice_Interface
      ; RetVal : access Windows.Devices.Spi.AsyncOperationCompletedHandler_ISpiDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISpiDevice_Interface
      ; RetVal : access Windows.Devices.Spi.ISpiDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISpiController : aliased constant Windows.IID := (3065044847, 49303, 22596, (147, 189, 120, 33, 153, 143, 219, 142 ));
   
   type IAsyncOperation_ISpiController_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISpiController_Interface
      ; handler : Windows.Devices.Spi.AsyncOperationCompletedHandler_ISpiController
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISpiController_Interface
      ; RetVal : access Windows.Devices.Spi.AsyncOperationCompletedHandler_ISpiController
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISpiController_Interface
      ; RetVal : access Windows.Devices.Spi.ISpiController
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISpiDevice : aliased constant Windows.IID := (2827626682, 26982, 21991, (140, 129, 124, 101, 247, 78, 57, 192 ));
   
   type AsyncOperationCompletedHandler_ISpiDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Spi.IAsyncOperation_ISpiDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISpiDevice'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpiDevice_Interface
      ; asyncInfo : Windows.Devices.Spi.IAsyncOperation_ISpiDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISpiController : aliased constant Windows.IID := (1586813257, 43076, 23333, (163, 204, 175, 171, 235, 24, 193, 210 ));
   
   type AsyncOperationCompletedHandler_ISpiController_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Spi.IAsyncOperation_ISpiController ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISpiController'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpiController_Interface
      ; asyncInfo : Windows.Devices.Spi.IAsyncOperation_ISpiController
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SpiConnectionSettings is Windows.Devices.Spi.ISpiConnectionSettings;
   function Create
   (
      chipSelectLine : Windows.Int32
   )
   return Windows.Devices.Spi.ISpiConnectionSettings;
   
   subtype SpiBusInfo is Windows.Devices.Spi.ISpiBusInfo;
   subtype SpiDevice is Windows.Devices.Spi.ISpiDevice;
   subtype SpiController is Windows.Devices.Spi.ISpiController;
   
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
   
   function GetBusInfo
   (
      busId : Windows.String
   )
   return Windows.Devices.Spi.ISpiBusInfo;
   
   function FromIdAsync
   (
      busId : Windows.String
      ; settings : Windows.Devices.Spi.ISpiConnectionSettings
   )
   return Windows.Devices.Spi.IAsyncOperation_ISpiDevice;
   
   function GetDefaultAsync
   return Windows.Devices.Spi.IAsyncOperation_ISpiController;
   
   function GetControllersAsync
   (
      provider : Windows.Devices.Spi.Provider.ISpiProvider
   )
   return Windows.Address;
   
end;
