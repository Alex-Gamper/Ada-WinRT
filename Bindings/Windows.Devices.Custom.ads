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
with Windows; use Windows;
with Windows.Foundation;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Devices.Custom is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type IOControlAccessMode is (
      Any,
      Read,
      Write,
      ReadWrite
   );
   for IOControlAccessMode use (
      Any => 0,
      Read => 1,
      Write => 2,
      ReadWrite => 3
   );
   for IOControlAccessMode'Size use 32;
   
   type IOControlAccessMode_Ptr is access IOControlAccessMode;
   
   type IOControlBufferingMethod is (
      Buffered,
      DirectInput,
      DirectOutput,
      Neither
   );
   for IOControlBufferingMethod use (
      Buffered => 0,
      DirectInput => 1,
      DirectOutput => 2,
      Neither => 3
   );
   for IOControlBufferingMethod'Size use 32;
   
   type IOControlBufferingMethod_Ptr is access IOControlBufferingMethod;
   
   type DeviceAccessMode is (
      Read,
      Write,
      ReadWrite
   );
   for DeviceAccessMode use (
      Read => 0,
      Write => 1,
      ReadWrite => 2
   );
   for DeviceAccessMode'Size use 32;
   
   type DeviceAccessMode_Ptr is access DeviceAccessMode;
   
   type DeviceSharingMode is (
      Shared,
      Exclusive
   );
   for DeviceSharingMode use (
      Shared => 0,
      Exclusive => 1
   );
   for DeviceSharingMode'Size use 32;
   
   type DeviceSharingMode_Ptr is access DeviceSharingMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type CustomDeviceContract is null record;
   pragma Convention (C_Pass_By_Copy , CustomDeviceContract);
   
   type CustomDeviceContract_Ptr is access CustomDeviceContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ICustomDevice_Interface;
   type AsyncOperationCompletedHandler_ICustomDevice is access all AsyncOperationCompletedHandler_ICustomDevice_Interface'Class;
   type AsyncOperationCompletedHandler_ICustomDevice_Ptr is access all AsyncOperationCompletedHandler_ICustomDevice;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IKnownDeviceTypesStatics_Interface;
   type IKnownDeviceTypesStatics is access all IKnownDeviceTypesStatics_Interface'Class;
   type IKnownDeviceTypesStatics_Ptr is access all IKnownDeviceTypesStatics;
   type IIOControlCode_Interface;
   type IIOControlCode is access all IIOControlCode_Interface'Class;
   type IIOControlCode_Ptr is access all IIOControlCode;
   type IIOControlCodeFactory_Interface;
   type IIOControlCodeFactory is access all IIOControlCodeFactory_Interface'Class;
   type IIOControlCodeFactory_Ptr is access all IIOControlCodeFactory;
   type ICustomDeviceStatics_Interface;
   type ICustomDeviceStatics is access all ICustomDeviceStatics_Interface'Class;
   type ICustomDeviceStatics_Ptr is access all ICustomDeviceStatics;
   type ICustomDevice_Interface;
   type ICustomDevice is access all ICustomDevice_Interface'Class;
   type ICustomDevice_Ptr is access all ICustomDevice;
   type IAsyncOperation_ICustomDevice_Interface;
   type IAsyncOperation_ICustomDevice is access all IAsyncOperation_ICustomDevice_Interface'Class;
   type IAsyncOperation_ICustomDevice_Ptr is access all IAsyncOperation_ICustomDevice;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IKnownDeviceTypesStatics : aliased constant Windows.IID := (3998513602, 21576, 17882, (173, 27, 36, 148, 140, 35, 144, 148 ));
   
   type IKnownDeviceTypesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Unknown
   (
      This       : access IKnownDeviceTypesStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIOControlCode : aliased constant Windows.IID := (244668903, 24776, 17269, (167, 97, 127, 136, 8, 6, 108, 96 ));
   
   type IIOControlCode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AccessMode
   (
      This       : access IIOControlCode_Interface
      ; RetVal : access Windows.Devices.Custom.IOControlAccessMode
   )
   return Windows.HRESULT is abstract;
   
   function get_BufferingMethod
   (
      This       : access IIOControlCode_Interface
      ; RetVal : access Windows.Devices.Custom.IOControlBufferingMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Function
   (
      This       : access IIOControlCode_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceType
   (
      This       : access IIOControlCode_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlCode
   (
      This       : access IIOControlCode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIOControlCodeFactory : aliased constant Windows.IID := (2238348528, 19473, 17582, (175, 198, 184, 212, 162, 18, 120, 143 ));
   
   type IIOControlCodeFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateIOControlCode
   (
      This       : access IIOControlCodeFactory_Interface
      ; deviceType : Windows.UInt16
      ; function_x : Windows.UInt16
      ; accessMode : Windows.Devices.Custom.IOControlAccessMode
      ; bufferingMethod : Windows.Devices.Custom.IOControlBufferingMethod
      ; RetVal : access Windows.Devices.Custom.IIOControlCode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICustomDeviceStatics : aliased constant Windows.IID := (3357672210, 61260, 18097, (165, 142, 238, 179, 8, 220, 137, 23 ));
   
   type ICustomDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ICustomDeviceStatics_Interface
      ; classGuid : Windows.Guid
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ICustomDeviceStatics_Interface
      ; deviceId : Windows.String
      ; desiredAccess : Windows.Devices.Custom.DeviceAccessMode
      ; sharingMode : Windows.Devices.Custom.DeviceSharingMode
      ; RetVal : access Windows.Devices.Custom.IAsyncOperation_ICustomDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICustomDevice : aliased constant Windows.IID := (3710919967, 50315, 17341, (188, 177, 222, 200, 143, 21, 20, 62 ));
   
   type ICustomDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InputStream
   (
      This       : access ICustomDevice_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputStream
   (
      This       : access ICustomDevice_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function SendIOControlAsync
   (
      This       : access ICustomDevice_Interface
      ; ioControlCode : Windows.Devices.Custom.IIOControlCode
      ; inputBuffer : Windows.Storage.Streams.IBuffer
      ; outputBuffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySendIOControlAsync
   (
      This       : access ICustomDevice_Interface
      ; ioControlCode : Windows.Devices.Custom.IIOControlCode
      ; inputBuffer : Windows.Storage.Streams.IBuffer
      ; outputBuffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICustomDevice : aliased constant Windows.IID := (711148714, 1384, 21646, (161, 162, 182, 187, 69, 29, 34, 140 ));
   
   type IAsyncOperation_ICustomDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICustomDevice_Interface
      ; handler : Windows.Devices.Custom.AsyncOperationCompletedHandler_ICustomDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICustomDevice_Interface
      ; RetVal : access Windows.Devices.Custom.AsyncOperationCompletedHandler_ICustomDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICustomDevice_Interface
      ; RetVal : access Windows.Devices.Custom.ICustomDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICustomDevice : aliased constant Windows.IID := (534591920, 57573, 23641, (178, 125, 165, 73, 177, 7, 92, 233 ));
   
   type AsyncOperationCompletedHandler_ICustomDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Custom.IAsyncOperation_ICustomDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICustomDevice'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICustomDevice_Interface
      ; asyncInfo : Windows.Devices.Custom.IAsyncOperation_ICustomDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype IOControlCode is Windows.Devices.Custom.IIOControlCode;
   function CreateIOControlCode
   (
      deviceType : Windows.UInt16
      ; function_x : Windows.UInt16
      ; accessMode : Windows.Devices.Custom.IOControlAccessMode
      ; bufferingMethod : Windows.Devices.Custom.IOControlBufferingMethod
   )
   return Windows.Devices.Custom.IIOControlCode;
   
   
   subtype CustomDevice is Windows.Devices.Custom.ICustomDevice;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Unknown
   return Windows.UInt16;
   
   function GetDeviceSelector
   (
      classGuid : Windows.Guid
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
      ; desiredAccess : Windows.Devices.Custom.DeviceAccessMode
      ; sharingMode : Windows.Devices.Custom.DeviceSharingMode
   )
   return Windows.Devices.Custom.IAsyncOperation_ICustomDevice;
   
end;
