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
with Windows.Foundation;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Devices.SerialCommunication is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SerialParity is (
      None,
      Odd,
      Even,
      Mark,
      Space
   );
   for SerialParity use (
      None => 0,
      Odd => 1,
      Even => 2,
      Mark => 3,
      Space => 4
   );
   for SerialParity'Size use 32;
   
   type SerialParity_Ptr is access SerialParity;
   
   type SerialHandshake is (
      None,
      RequestToSend,
      XOnXOff,
      RequestToSendXOnXOff
   );
   for SerialHandshake use (
      None => 0,
      RequestToSend => 1,
      XOnXOff => 2,
      RequestToSendXOnXOff => 3
   );
   for SerialHandshake'Size use 32;
   
   type SerialHandshake_Ptr is access SerialHandshake;
   
   type SerialStopBitCount is (
      One,
      OnePointFive,
      Two
   );
   for SerialStopBitCount use (
      One => 0,
      OnePointFive => 1,
      Two => 2
   );
   for SerialStopBitCount'Size use 32;
   
   type SerialStopBitCount_Ptr is access SerialStopBitCount;
   
   type SerialError is (
      Frame,
      BufferOverrun,
      ReceiveFull,
      ReceiveParity,
      TransmitFull
   );
   for SerialError use (
      Frame => 0,
      BufferOverrun => 1,
      ReceiveFull => 2,
      ReceiveParity => 3,
      TransmitFull => 4
   );
   for SerialError'Size use 32;
   
   type SerialError_Ptr is access SerialError;
   
   type SerialPinChange is (
      BreakSignal,
      CarrierDetect,
      ClearToSend,
      DataSetReady,
      RingIndicator
   );
   for SerialPinChange use (
      BreakSignal => 0,
      CarrierDetect => 1,
      ClearToSend => 2,
      DataSetReady => 3,
      RingIndicator => 4
   );
   for SerialPinChange'Size use 32;
   
   type SerialPinChange_Ptr is access SerialPinChange;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ISerialDevice_Interface;
   type AsyncOperationCompletedHandler_ISerialDevice is access all AsyncOperationCompletedHandler_ISerialDevice_Interface'Class;
   type AsyncOperationCompletedHandler_ISerialDevice_Ptr is access all AsyncOperationCompletedHandler_ISerialDevice;
   type TypedEventHandler_ISerialDevice_add_ErrorReceived_Interface;
   type TypedEventHandler_ISerialDevice_add_ErrorReceived is access all TypedEventHandler_ISerialDevice_add_ErrorReceived_Interface'Class;
   type TypedEventHandler_ISerialDevice_add_ErrorReceived_Ptr is access all TypedEventHandler_ISerialDevice_add_ErrorReceived;
   type TypedEventHandler_ISerialDevice_add_PinChanged_Interface;
   type TypedEventHandler_ISerialDevice_add_PinChanged is access all TypedEventHandler_ISerialDevice_add_PinChanged_Interface'Class;
   type TypedEventHandler_ISerialDevice_add_PinChanged_Ptr is access all TypedEventHandler_ISerialDevice_add_PinChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISerialDeviceStatics_Interface;
   type ISerialDeviceStatics is access all ISerialDeviceStatics_Interface'Class;
   type ISerialDeviceStatics_Ptr is access all ISerialDeviceStatics;
   type ISerialDevice_Interface;
   type ISerialDevice is access all ISerialDevice_Interface'Class;
   type ISerialDevice_Ptr is access all ISerialDevice;
   type IErrorReceivedEventArgs_Interface;
   type IErrorReceivedEventArgs is access all IErrorReceivedEventArgs_Interface'Class;
   type IErrorReceivedEventArgs_Ptr is access all IErrorReceivedEventArgs;
   type IPinChangedEventArgs_Interface;
   type IPinChangedEventArgs is access all IPinChangedEventArgs_Interface'Class;
   type IPinChangedEventArgs_Ptr is access all IPinChangedEventArgs;
   type IAsyncOperation_ISerialDevice_Interface;
   type IAsyncOperation_ISerialDevice is access all IAsyncOperation_ISerialDevice_Interface'Class;
   type IAsyncOperation_ISerialDevice_Ptr is access all IAsyncOperation_ISerialDevice;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISerialDeviceStatics : aliased constant Windows.IID := (93080176, 2102, 18835, (174, 26, 182, 26, 227, 190, 5, 107 ));
   
   type ISerialDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ISerialDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromPortName
   (
      This       : access ISerialDeviceStatics_Interface
      ; portName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromUsbVidPid
   (
      This       : access ISerialDeviceStatics_Interface
      ; vendorId : Windows.UInt16
      ; productId : Windows.UInt16
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ISerialDeviceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.SerialCommunication.IAsyncOperation_ISerialDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISerialDevice : aliased constant Windows.IID := (3783773382, 8720, 16719, (182, 90, 245, 85, 58, 3, 55, 42 ));
   
   type ISerialDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BaudRate
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_BaudRate
   (
      This       : access ISerialDevice_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BreakSignalState
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_BreakSignalState
   (
      This       : access ISerialDevice_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BytesReceived
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CarrierDetectState
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ClearToSendState
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DataBits
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function put_DataBits
   (
      This       : access ISerialDevice_Interface
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_DataSetReadyState
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Handshake
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Devices.SerialCommunication.SerialHandshake
   )
   return Windows.HRESULT is abstract;
   
   function put_Handshake
   (
      This       : access ISerialDevice_Interface
      ; value : Windows.Devices.SerialCommunication.SerialHandshake
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDataTerminalReadyEnabled
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDataTerminalReadyEnabled
   (
      This       : access ISerialDevice_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRequestToSendEnabled
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsRequestToSendEnabled
   (
      This       : access ISerialDevice_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Parity
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Devices.SerialCommunication.SerialParity
   )
   return Windows.HRESULT is abstract;
   
   function put_Parity
   (
      This       : access ISerialDevice_Interface
      ; value : Windows.Devices.SerialCommunication.SerialParity
   )
   return Windows.HRESULT is abstract;
   
   function get_PortName
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadTimeout
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_ReadTimeout
   (
      This       : access ISerialDevice_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_StopBits
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Devices.SerialCommunication.SerialStopBitCount
   )
   return Windows.HRESULT is abstract;
   
   function put_StopBits
   (
      This       : access ISerialDevice_Interface
      ; value : Windows.Devices.SerialCommunication.SerialStopBitCount
   )
   return Windows.HRESULT is abstract;
   
   function get_UsbVendorId
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_UsbProductId
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteTimeout
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_WriteTimeout
   (
      This       : access ISerialDevice_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_InputStream
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputStream
   (
      This       : access ISerialDevice_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function add_ErrorReceived
   (
      This       : access ISerialDevice_Interface
      ; reportHandler : TypedEventHandler_ISerialDevice_add_ErrorReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ErrorReceived
   (
      This       : access ISerialDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PinChanged
   (
      This       : access ISerialDevice_Interface
      ; reportHandler : TypedEventHandler_ISerialDevice_add_PinChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PinChanged
   (
      This       : access ISerialDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IErrorReceivedEventArgs : aliased constant Windows.IID := (4240883545, 4739, 19850, (191, 223, 86, 107, 51, 221, 178, 143 ));
   
   type IErrorReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IErrorReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.SerialCommunication.SerialError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPinChangedEventArgs : aliased constant Windows.IID := (2730433968, 64668, 17927, (147, 208, 250, 94, 131, 67, 238, 34 ));
   
   type IPinChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PinChange
   (
      This       : access IPinChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.SerialCommunication.SerialPinChange
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISerialDevice : aliased constant Windows.IID := (1156523757, 49663, 21610, (164, 107, 106, 55, 222, 145, 135, 251 ));
   
   type IAsyncOperation_ISerialDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISerialDevice_Interface
      ; handler : Windows.Devices.SerialCommunication.AsyncOperationCompletedHandler_ISerialDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISerialDevice_Interface
      ; RetVal : access Windows.Devices.SerialCommunication.AsyncOperationCompletedHandler_ISerialDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISerialDevice_Interface
      ; RetVal : access Windows.Devices.SerialCommunication.ISerialDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISerialDevice : aliased constant Windows.IID := (2225294131, 1788, 24163, (142, 226, 234, 180, 255, 105, 172, 183 ));
   
   type AsyncOperationCompletedHandler_ISerialDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.SerialCommunication.IAsyncOperation_ISerialDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISerialDevice'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISerialDevice_Interface
      ; asyncInfo : Windows.Devices.SerialCommunication.IAsyncOperation_ISerialDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISerialDevice_add_ErrorReceived : aliased constant Windows.IID := (3643712291, 47039, 24066, (185, 251, 198, 31, 151, 208, 128, 233 ));
   
   type TypedEventHandler_ISerialDevice_add_ErrorReceived_Interface(Callback : access procedure (sender : Windows.Devices.SerialCommunication.ISerialDevice ; args : Windows.Devices.SerialCommunication.IErrorReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISerialDevice_add_ErrorReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISerialDevice_add_ErrorReceived_Interface
      ; sender : Windows.Devices.SerialCommunication.ISerialDevice
      ; args : Windows.Devices.SerialCommunication.IErrorReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISerialDevice_add_PinChanged : aliased constant Windows.IID := (3835085807, 22530, 23236, (172, 46, 150, 188, 35, 250, 148, 71 ));
   
   type TypedEventHandler_ISerialDevice_add_PinChanged_Interface(Callback : access procedure (sender : Windows.Devices.SerialCommunication.ISerialDevice ; args : Windows.Devices.SerialCommunication.IPinChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISerialDevice_add_PinChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISerialDevice_add_PinChanged_Interface
      ; sender : Windows.Devices.SerialCommunication.ISerialDevice
      ; args : Windows.Devices.SerialCommunication.IPinChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SerialDevice is Windows.Devices.SerialCommunication.ISerialDevice;
   subtype ErrorReceivedEventArgs is Windows.Devices.SerialCommunication.IErrorReceivedEventArgs;
   subtype PinChangedEventArgs is Windows.Devices.SerialCommunication.IPinChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   return Windows.String;
   
   function GetDeviceSelectorFromPortName
   (
      portName : Windows.String
   )
   return Windows.String;
   
   function GetDeviceSelectorFromUsbVidPid
   (
      vendorId : Windows.UInt16
      ; productId : Windows.UInt16
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.SerialCommunication.IAsyncOperation_ISerialDevice;
   
end;
