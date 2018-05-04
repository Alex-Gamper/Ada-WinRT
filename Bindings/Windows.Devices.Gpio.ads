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
with Windows.Foundation.Collections;
limited with Windows.Devices.Gpio.Provider;
--------------------------------------------------------------------------------
package Windows.Devices.Gpio is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GpioSharingMode is (
      Exclusive,
      SharedReadOnly
   );
   for GpioSharingMode use (
      Exclusive => 0,
      SharedReadOnly => 1
   );
   for GpioSharingMode'Size use 32;
   
   type GpioSharingMode_Ptr is access GpioSharingMode;
   
   type GpioOpenStatus is (
      PinOpened,
      PinUnavailable,
      SharingViolation,
      MuxingConflict,
      UnknownError
   );
   for GpioOpenStatus use (
      PinOpened => 0,
      PinUnavailable => 1,
      SharingViolation => 2,
      MuxingConflict => 3,
      UnknownError => 4
   );
   for GpioOpenStatus'Size use 32;
   
   type GpioOpenStatus_Ptr is access GpioOpenStatus;
   
   type GpioPinDriveMode is (
      Input,
      Output,
      InputPullUp,
      InputPullDown,
      OutputOpenDrain,
      OutputOpenDrainPullUp,
      OutputOpenSource,
      OutputOpenSourcePullDown
   );
   for GpioPinDriveMode use (
      Input => 0,
      Output => 1,
      InputPullUp => 2,
      InputPullDown => 3,
      OutputOpenDrain => 4,
      OutputOpenDrainPullUp => 5,
      OutputOpenSource => 6,
      OutputOpenSourcePullDown => 7
   );
   for GpioPinDriveMode'Size use 32;
   
   type GpioPinDriveMode_Ptr is access GpioPinDriveMode;
   
   type GpioPinValue is (
      Low,
      High
   );
   for GpioPinValue use (
      Low => 0,
      High => 1
   );
   for GpioPinValue'Size use 32;
   
   type GpioPinValue_Ptr is access GpioPinValue;
   
   type GpioPinEdge is (
      FallingEdge,
      RisingEdge
   );
   for GpioPinEdge use (
      FallingEdge => 0,
      RisingEdge => 1
   );
   for GpioPinEdge'Size use 32;
   
   type GpioPinEdge_Ptr is access GpioPinEdge;
   
   type GpioChangePolarity is (
      Falling,
      Rising,
      Both
   );
   for GpioChangePolarity use (
      Falling => 0,
      Rising => 1,
      Both => 2
   );
   for GpioChangePolarity'Size use 32;
   
   type GpioChangePolarity_Ptr is access GpioChangePolarity;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type GpioChangeRecord is record
      RelativeTime : Windows.Foundation.TimeSpan;
      Edge : Windows.Devices.Gpio.GpioPinEdge;
   end record;
   pragma Convention (C_Pass_By_Copy , GpioChangeRecord);
   
   type GpioChangeRecord_Ptr is access GpioChangeRecord;
   
   type GpioChangeCount is record
      Count : Windows.UInt64;
      RelativeTime : Windows.Foundation.TimeSpan;
   end record;
   pragma Convention (C_Pass_By_Copy , GpioChangeCount);
   
   type GpioChangeCount_Ptr is access GpioChangeCount;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IGpioController_Interface;
   type AsyncOperationCompletedHandler_IGpioController is access all AsyncOperationCompletedHandler_IGpioController_Interface'Class;
   type AsyncOperationCompletedHandler_IGpioController_Ptr is access all AsyncOperationCompletedHandler_IGpioController;
   type TypedEventHandler_IGpioPin_add_ValueChanged_Interface;
   type TypedEventHandler_IGpioPin_add_ValueChanged is access all TypedEventHandler_IGpioPin_add_ValueChanged_Interface'Class;
   type TypedEventHandler_IGpioPin_add_ValueChanged_Ptr is access all TypedEventHandler_IGpioPin_add_ValueChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGpioPinValueChangedEventArgs_Interface;
   type IGpioPinValueChangedEventArgs is access all IGpioPinValueChangedEventArgs_Interface'Class;
   type IGpioPinValueChangedEventArgs_Ptr is access all IGpioPinValueChangedEventArgs;
   type IGpioController_Interface;
   type IGpioController is access all IGpioController_Interface'Class;
   type IGpioController_Ptr is access all IGpioController;
   type IGpioControllerStatics_Interface;
   type IGpioControllerStatics is access all IGpioControllerStatics_Interface'Class;
   type IGpioControllerStatics_Ptr is access all IGpioControllerStatics;
   type IGpioControllerStatics2_Interface;
   type IGpioControllerStatics2 is access all IGpioControllerStatics2_Interface'Class;
   type IGpioControllerStatics2_Ptr is access all IGpioControllerStatics2;
   type IGpioChangeReaderFactory_Interface;
   type IGpioChangeReaderFactory is access all IGpioChangeReaderFactory_Interface'Class;
   type IGpioChangeReaderFactory_Ptr is access all IGpioChangeReaderFactory;
   type IGpioChangeCounterFactory_Interface;
   type IGpioChangeCounterFactory is access all IGpioChangeCounterFactory_Interface'Class;
   type IGpioChangeCounterFactory_Ptr is access all IGpioChangeCounterFactory;
   type IGpioPin_Interface;
   type IGpioPin is access all IGpioPin_Interface'Class;
   type IGpioPin_Ptr is access all IGpioPin;
   type IGpioChangeReader_Interface;
   type IGpioChangeReader is access all IGpioChangeReader_Interface'Class;
   type IGpioChangeReader_Ptr is access all IGpioChangeReader;
   type IGpioChangeCounter_Interface;
   type IGpioChangeCounter is access all IGpioChangeCounter_Interface'Class;
   type IGpioChangeCounter_Ptr is access all IGpioChangeCounter;
   type IAsyncOperation_IGpioController_Interface;
   type IAsyncOperation_IGpioController is access all IAsyncOperation_IGpioController_Interface'Class;
   type IAsyncOperation_IGpioController_Ptr is access all IAsyncOperation_IGpioController;
   type IIterator_GpioChangeRecord_Interface;
   type IIterator_GpioChangeRecord is access all IIterator_GpioChangeRecord_Interface'Class;
   type IIterator_GpioChangeRecord_Ptr is access all IIterator_GpioChangeRecord;
   type IIterable_GpioChangeRecord_Interface;
   type IIterable_GpioChangeRecord is access all IIterable_GpioChangeRecord_Interface'Class;
   type IIterable_GpioChangeRecord_Ptr is access all IIterable_GpioChangeRecord;
   type IVectorView_GpioChangeRecord_Interface;
   type IVectorView_GpioChangeRecord is access all IVectorView_GpioChangeRecord_Interface'Class;
   type IVectorView_GpioChangeRecord_Ptr is access all IVectorView_GpioChangeRecord;
   type IVector_GpioChangeRecord_Interface;
   type IVector_GpioChangeRecord is access all IVector_GpioChangeRecord_Interface'Class;
   type IVector_GpioChangeRecord_Ptr is access all IVector_GpioChangeRecord;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IGpioPinValueChangedEventArgs : aliased constant Windows.IID := (825731809, 28733, 16473, (189, 36, 181, 178, 93, 255, 184, 78 ));
   
   type IGpioPinValueChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Edge
   (
      This       : access IGpioPinValueChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioPinEdge
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioController : aliased constant Windows.IID := (675287779, 29793, 18076, (168, 188, 97, 214, 157, 8, 165, 60 ));
   
   type IGpioController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PinCount
   (
      This       : access IGpioController_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function OpenPin
   (
      This       : access IGpioController_Interface
      ; pinNumber : Windows.Int32
      ; RetVal : access Windows.Devices.Gpio.IGpioPin
   )
   return Windows.HRESULT is abstract;
   
   function OpenPinWithSharingMode
   (
      This       : access IGpioController_Interface
      ; pinNumber : Windows.Int32
      ; sharingMode : Windows.Devices.Gpio.GpioSharingMode
      ; RetVal : access Windows.Devices.Gpio.IGpioPin
   )
   return Windows.HRESULT is abstract;
   
   function TryOpenPin
   (
      This       : access IGpioController_Interface
      ; pinNumber : Windows.Int32
      ; sharingMode : Windows.Devices.Gpio.GpioSharingMode
      ; pin : access Windows.Devices.Gpio.IGpioPin
      ; openStatus : access Windows.Devices.Gpio.GpioOpenStatus
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioControllerStatics : aliased constant Windows.IID := (785839150, 31479, 16662, (149, 51, 196, 61, 153, 161, 251, 100 ));
   
   type IGpioControllerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IGpioControllerStatics_Interface
      ; RetVal : access Windows.Devices.Gpio.IGpioController
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioControllerStatics2 : aliased constant Windows.IID := (2435546400, 27812, 16646, (163, 115, 255, 253, 52, 107, 14, 91 ));
   
   type IGpioControllerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetControllersAsync
   (
      This       : access IGpioControllerStatics2_Interface
      ; provider : Windows.Devices.Gpio.Provider.IGpioProvider
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultAsync
   (
      This       : access IGpioControllerStatics2_Interface
      ; RetVal : access Windows.Devices.Gpio.IAsyncOperation_IGpioController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioChangeReaderFactory : aliased constant Windows.IID := (2841218803, 14606, 17434, (157, 28, 232, 222, 11, 45, 240, 223 ));
   
   type IGpioChangeReaderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IGpioChangeReaderFactory_Interface
      ; pin : Windows.Devices.Gpio.IGpioPin
      ; RetVal : access Windows.Devices.Gpio.IGpioChangeReader
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithCapacity
   (
      This       : access IGpioChangeReaderFactory_Interface
      ; pin : Windows.Devices.Gpio.IGpioPin
      ; minCapacity : Windows.Int32
      ; RetVal : access Windows.Devices.Gpio.IGpioChangeReader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioChangeCounterFactory : aliased constant Windows.IID := (343774390, 2718, 16652, (180, 250, 248, 159, 64, 82, 8, 77 ));
   
   type IGpioChangeCounterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IGpioChangeCounterFactory_Interface
      ; pin : Windows.Devices.Gpio.IGpioPin
      ; RetVal : access Windows.Devices.Gpio.IGpioChangeCounter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioPin : aliased constant Windows.IID := (299479175, 44974, 18320, (158, 233, 224, 234, 201, 66, 210, 1 ));
   
   type IGpioPin_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ValueChanged
   (
      This       : access IGpioPin_Interface
      ; handler : TypedEventHandler_IGpioPin_add_ValueChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ValueChanged
   (
      This       : access IGpioPin_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_DebounceTimeout
   (
      This       : access IGpioPin_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_DebounceTimeout
   (
      This       : access IGpioPin_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_PinNumber
   (
      This       : access IGpioPin_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SharingMode
   (
      This       : access IGpioPin_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioSharingMode
   )
   return Windows.HRESULT is abstract;
   
   function IsDriveModeSupported
   (
      This       : access IGpioPin_Interface
      ; driveMode : Windows.Devices.Gpio.GpioPinDriveMode
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDriveMode
   (
      This       : access IGpioPin_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioPinDriveMode
   )
   return Windows.HRESULT is abstract;
   
   function SetDriveMode
   (
      This       : access IGpioPin_Interface
      ; value : Windows.Devices.Gpio.GpioPinDriveMode
   )
   return Windows.HRESULT is abstract;
   
   function Write
   (
      This       : access IGpioPin_Interface
      ; value : Windows.Devices.Gpio.GpioPinValue
   )
   return Windows.HRESULT is abstract;
   
   function Read
   (
      This       : access IGpioPin_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioPinValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioChangeReader : aliased constant Windows.IID := (180127839, 57393, 18664, (133, 144, 112, 222, 120, 54, 60, 109 ));
   
   type IGpioChangeReader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Capacity
   (
      This       : access IGpioChangeReader_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Length
   (
      This       : access IGpioChangeReader_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEmpty
   (
      This       : access IGpioChangeReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOverflowed
   (
      This       : access IGpioChangeReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Polarity
   (
      This       : access IGpioChangeReader_Interface
      ; value : Windows.Devices.Gpio.GpioChangePolarity
   )
   return Windows.HRESULT is abstract;
   
   function get_Polarity
   (
      This       : access IGpioChangeReader_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioChangePolarity
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStarted
   (
      This       : access IGpioChangeReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IGpioChangeReader_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IGpioChangeReader_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IGpioChangeReader_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetNextItem
   (
      This       : access IGpioChangeReader_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioChangeRecord
   )
   return Windows.HRESULT is abstract;
   
   function PeekNextItem
   (
      This       : access IGpioChangeReader_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioChangeRecord
   )
   return Windows.HRESULT is abstract;
   
   function GetAllItems
   (
      This       : access IGpioChangeReader_Interface
      ; RetVal : access Windows.Devices.Gpio.IVector_GpioChangeRecord -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WaitForItemsAsync
   (
      This       : access IGpioChangeReader_Interface
      ; count : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioChangeCounter : aliased constant Windows.IID := (3411984606, 26625, 17407, (128, 61, 69, 118, 98, 138, 139, 38 ));
   
   type IGpioChangeCounter_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Polarity
   (
      This       : access IGpioChangeCounter_Interface
      ; value : Windows.Devices.Gpio.GpioChangePolarity
   )
   return Windows.HRESULT is abstract;
   
   function get_Polarity
   (
      This       : access IGpioChangeCounter_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioChangePolarity
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStarted
   (
      This       : access IGpioChangeCounter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IGpioChangeCounter_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IGpioChangeCounter_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Read
   (
      This       : access IGpioChangeCounter_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioChangeCount
   )
   return Windows.HRESULT is abstract;
   
   function Reset
   (
      This       : access IGpioChangeCounter_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioChangeCount
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGpioController : aliased constant Windows.IID := (3976485143, 38599, 22325, (180, 190, 215, 150, 25, 212, 131, 94 ));
   
   type IAsyncOperation_IGpioController_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGpioController_Interface
      ; handler : Windows.Devices.Gpio.AsyncOperationCompletedHandler_IGpioController
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGpioController_Interface
      ; RetVal : access Windows.Devices.Gpio.AsyncOperationCompletedHandler_IGpioController
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGpioController_Interface
      ; RetVal : access Windows.Devices.Gpio.IGpioController
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_GpioChangeRecord : aliased constant Windows.IID := (2764447929, 52105, 23077, (191, 22, 95, 65, 44, 26, 51, 136 ));
   
   type IIterator_GpioChangeRecord_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_GpioChangeRecord_Interface
      ; RetVal : access Windows.Devices.Gpio.GpioChangeRecord
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_GpioChangeRecord_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_GpioChangeRecord_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_GpioChangeRecord_Interface
      ; items : Windows.Devices.Gpio.GpioChangeRecord_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_GpioChangeRecord : aliased constant Windows.IID := (3031416655, 25102, 22309, (135, 138, 120, 198, 237, 16, 55, 78 ));
   
   type IIterable_GpioChangeRecord_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_GpioChangeRecord_Interface
      ; RetVal : access Windows.Devices.Gpio.IIterator_GpioChangeRecord
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_GpioChangeRecord : aliased constant Windows.IID := (3540694565, 4708, 21406, (172, 239, 48, 109, 210, 20, 220, 59 ));
   
   type IVectorView_GpioChangeRecord_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_GpioChangeRecord_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Gpio.GpioChangeRecord
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_GpioChangeRecord_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_GpioChangeRecord_Interface
      ; value : Windows.Devices.Gpio.GpioChangeRecord
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_GpioChangeRecord_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Gpio.GpioChangeRecord_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_GpioChangeRecord : aliased constant Windows.IID := (3368305602, 63444, 21382, (173, 21, 49, 131, 136, 130, 189, 158 ));
   
   type IVector_GpioChangeRecord_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_GpioChangeRecord_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Gpio.GpioChangeRecord
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_GpioChangeRecord_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_GpioChangeRecord_Interface
      ; RetVal : access Windows.Devices.Gpio.IVectorView_GpioChangeRecord
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_GpioChangeRecord_Interface
      ; value : Windows.Devices.Gpio.GpioChangeRecord
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_GpioChangeRecord_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Gpio.GpioChangeRecord
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_GpioChangeRecord_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Gpio.GpioChangeRecord
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_GpioChangeRecord_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_GpioChangeRecord_Interface
      ; value : Windows.Devices.Gpio.GpioChangeRecord
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_GpioChangeRecord_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_GpioChangeRecord_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_GpioChangeRecord_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Gpio.GpioChangeRecord_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_GpioChangeRecord_Interface
      ; items : Windows.Devices.Gpio.GpioChangeRecord_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGpioController : aliased constant Windows.IID := (922838976, 3963, 24183, (155, 174, 211, 80, 137, 163, 219, 117 ));
   
   type AsyncOperationCompletedHandler_IGpioController_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Gpio.IAsyncOperation_IGpioController ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGpioController'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGpioController_Interface
      ; asyncInfo : Windows.Devices.Gpio.IAsyncOperation_IGpioController
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGpioPin_add_ValueChanged : aliased constant Windows.IID := (1153067163, 32066, 21364, (173, 217, 171, 65, 232, 119, 163, 75 ));
   
   type TypedEventHandler_IGpioPin_add_ValueChanged_Interface(Callback : access procedure (sender : Windows.Devices.Gpio.IGpioPin ; args : Windows.Devices.Gpio.IGpioPinValueChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGpioPin_add_ValueChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGpioPin_add_ValueChanged_Interface
      ; sender : Windows.Devices.Gpio.IGpioPin
      ; args : Windows.Devices.Gpio.IGpioPinValueChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GpioPinValueChangedEventArgs is Windows.Devices.Gpio.IGpioPinValueChangedEventArgs;
   subtype GpioPin is Windows.Devices.Gpio.IGpioPin;
   subtype GpioController is Windows.Devices.Gpio.IGpioController;
   subtype GpioChangeReader is Windows.Devices.Gpio.IGpioChangeReader;
   function Create
   (
      pin : Windows.Devices.Gpio.IGpioPin
   )
   return Windows.Devices.Gpio.IGpioChangeReader;
   
   function CreateWithCapacity
   (
      pin : Windows.Devices.Gpio.IGpioPin
      ; minCapacity : Windows.Int32
   )
   return Windows.Devices.Gpio.IGpioChangeReader;
   
   subtype GpioChangeCounter is Windows.Devices.Gpio.IGpioChangeCounter;
   function Create
   (
      pin : Windows.Devices.Gpio.IGpioPin
   )
   return Windows.Devices.Gpio.IGpioChangeCounter;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetControllersAsync
   (
      provider : Windows.Devices.Gpio.Provider.IGpioProvider
   )
   return Windows.Address;
   
   function GetDefaultAsync
   return Windows.Devices.Gpio.IAsyncOperation_IGpioController;
   
   function GetDefault
   return Windows.Devices.Gpio.IGpioController;
   
end;
