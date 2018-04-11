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
package Windows.Devices.Gpio.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ProviderGpioSharingMode is (
      Exclusive,
      SharedReadOnly
   );
   for ProviderGpioSharingMode use (
      Exclusive => 0,
      SharedReadOnly => 1
   );
   for ProviderGpioSharingMode'Size use 32;
   
   type ProviderGpioSharingMode_Ptr is access ProviderGpioSharingMode;
   
   type ProviderGpioPinDriveMode is (
      Input,
      Output,
      InputPullUp,
      InputPullDown,
      OutputOpenDrain,
      OutputOpenDrainPullUp,
      OutputOpenSource,
      OutputOpenSourcePullDown
   );
   for ProviderGpioPinDriveMode use (
      Input => 0,
      Output => 1,
      InputPullUp => 2,
      InputPullDown => 3,
      OutputOpenDrain => 4,
      OutputOpenDrainPullUp => 5,
      OutputOpenSource => 6,
      OutputOpenSourcePullDown => 7
   );
   for ProviderGpioPinDriveMode'Size use 32;
   
   type ProviderGpioPinDriveMode_Ptr is access ProviderGpioPinDriveMode;
   
   type ProviderGpioPinValue is (
      Low,
      High
   );
   for ProviderGpioPinValue use (
      Low => 0,
      High => 1
   );
   for ProviderGpioPinValue'Size use 32;
   
   type ProviderGpioPinValue_Ptr is access ProviderGpioPinValue;
   
   type ProviderGpioPinEdge is (
      FallingEdge,
      RisingEdge
   );
   for ProviderGpioPinEdge use (
      FallingEdge => 0,
      RisingEdge => 1
   );
   for ProviderGpioPinEdge'Size use 32;
   
   type ProviderGpioPinEdge_Ptr is access ProviderGpioPinEdge;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IGpioPinProvider_add_ValueChanged_Interface;
   type TypedEventHandler_IGpioPinProvider_add_ValueChanged is access all TypedEventHandler_IGpioPinProvider_add_ValueChanged_Interface'Class;
   type TypedEventHandler_IGpioPinProvider_add_ValueChanged_Ptr is access all TypedEventHandler_IGpioPinProvider_add_ValueChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGpioPinProviderValueChangedEventArgsFactory_Interface;
   type IGpioPinProviderValueChangedEventArgsFactory is access all IGpioPinProviderValueChangedEventArgsFactory_Interface'Class;
   type IGpioPinProviderValueChangedEventArgsFactory_Ptr is access all IGpioPinProviderValueChangedEventArgsFactory;
   type IGpioPinProviderValueChangedEventArgs_Interface;
   type IGpioPinProviderValueChangedEventArgs is access all IGpioPinProviderValueChangedEventArgs_Interface'Class;
   type IGpioPinProviderValueChangedEventArgs_Ptr is access all IGpioPinProviderValueChangedEventArgs;
   type IGpioPinProvider_Interface;
   type IGpioPinProvider is access all IGpioPinProvider_Interface'Class;
   type IGpioPinProvider_Ptr is access all IGpioPinProvider;
   type IGpioControllerProvider_Interface;
   type IGpioControllerProvider is access all IGpioControllerProvider_Interface'Class;
   type IGpioControllerProvider_Ptr is access all IGpioControllerProvider;
   type IGpioProvider_Interface;
   type IGpioProvider is access all IGpioProvider_Interface'Class;
   type IGpioProvider_Ptr is access all IGpioProvider;
   type IIterator_IGpioControllerProvider_Interface;
   type IIterator_IGpioControllerProvider is access all IIterator_IGpioControllerProvider_Interface'Class;
   type IIterator_IGpioControllerProvider_Ptr is access all IIterator_IGpioControllerProvider;
   type IIterable_IGpioControllerProvider_Interface;
   type IIterable_IGpioControllerProvider is access all IIterable_IGpioControllerProvider_Interface'Class;
   type IIterable_IGpioControllerProvider_Ptr is access all IIterable_IGpioControllerProvider;
   type IVectorView_IGpioControllerProvider_Interface;
   type IVectorView_IGpioControllerProvider is access all IVectorView_IGpioControllerProvider_Interface'Class;
   type IVectorView_IGpioControllerProvider_Ptr is access all IVectorView_IGpioControllerProvider;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IGpioPinProviderValueChangedEventArgsFactory : aliased constant Windows.IID := (1053494105, 22156, 17298, (178, 74, 138, 89, 169, 2, 177, 241 ));
   
   type IGpioPinProviderValueChangedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IGpioPinProviderValueChangedEventArgsFactory_Interface
      ; edge : Windows.Devices.Gpio.Provider.ProviderGpioPinEdge
      ; RetVal : access Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioPinProviderValueChangedEventArgs : aliased constant Windows.IID := (849794802, 15707, 17613, (143, 190, 19, 166, 159, 46, 219, 36 ));
   
   type IGpioPinProviderValueChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Edge
   (
      This       : access IGpioPinProviderValueChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Gpio.Provider.ProviderGpioPinEdge
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioPinProvider : aliased constant Windows.IID := (1110723767, 27324, 16639, (156, 231, 115, 184, 83, 1, 185, 0 ));
   
   type IGpioPinProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ValueChanged
   (
      This       : access IGpioPinProvider_Interface
      ; handler : TypedEventHandler_IGpioPinProvider_add_ValueChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ValueChanged
   (
      This       : access IGpioPinProvider_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_DebounceTimeout
   (
      This       : access IGpioPinProvider_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_DebounceTimeout
   (
      This       : access IGpioPinProvider_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_PinNumber
   (
      This       : access IGpioPinProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SharingMode
   (
      This       : access IGpioPinProvider_Interface
      ; RetVal : access Windows.Devices.Gpio.Provider.ProviderGpioSharingMode
   )
   return Windows.HRESULT is abstract;
   
   function IsDriveModeSupported
   (
      This       : access IGpioPinProvider_Interface
      ; driveMode : Windows.Devices.Gpio.Provider.ProviderGpioPinDriveMode
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDriveMode
   (
      This       : access IGpioPinProvider_Interface
      ; RetVal : access Windows.Devices.Gpio.Provider.ProviderGpioPinDriveMode
   )
   return Windows.HRESULT is abstract;
   
   function SetDriveMode
   (
      This       : access IGpioPinProvider_Interface
      ; value : Windows.Devices.Gpio.Provider.ProviderGpioPinDriveMode
   )
   return Windows.HRESULT is abstract;
   
   function Write
   (
      This       : access IGpioPinProvider_Interface
      ; value : Windows.Devices.Gpio.Provider.ProviderGpioPinValue
   )
   return Windows.HRESULT is abstract;
   
   function Read
   (
      This       : access IGpioPinProvider_Interface
      ; RetVal : access Windows.Devices.Gpio.Provider.ProviderGpioPinValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioControllerProvider : aliased constant Windows.IID := (2903625415, 6634, 19233, (135, 79, 185, 26, 237, 74, 37, 219 ));
   
   type IGpioControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PinCount
   (
      This       : access IGpioControllerProvider_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function OpenPinProvider
   (
      This       : access IGpioControllerProvider_Interface
      ; pin : Windows.Int32
      ; sharingMode : Windows.Devices.Gpio.Provider.ProviderGpioSharingMode
      ; RetVal : access Windows.Devices.Gpio.Provider.IGpioPinProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGpioProvider : aliased constant Windows.IID := (1156065031, 2250, 17226, (175, 224, 214, 21, 128, 68, 111, 126 ));
   
   type IGpioProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetControllers
   (
      This       : access IGpioProvider_Interface
      ; RetVal : access Windows.Devices.Gpio.Provider.IVectorView_IGpioControllerProvider -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGpioControllerProvider : aliased constant Windows.IID := (1791028665, 58313, 22592, (138, 168, 27, 196, 83, 102, 246, 202 ));
   
   type IIterator_IGpioControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGpioControllerProvider_Interface
      ; RetVal : access Windows.Devices.Gpio.Provider.IGpioControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGpioControllerProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGpioControllerProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGpioControllerProvider_Interface
      ; items : Windows.Devices.Gpio.Provider.IGpioControllerProvider_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGpioControllerProvider : aliased constant Windows.IID := (153168852, 34075, 21181, (184, 44, 66, 27, 243, 214, 245, 17 ));
   
   type IIterable_IGpioControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGpioControllerProvider_Interface
      ; RetVal : access Windows.Devices.Gpio.Provider.IIterator_IGpioControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGpioControllerProvider : aliased constant Windows.IID := (4096341343, 31254, 24015, (165, 117, 219, 125, 42, 32, 236, 237 ));
   
   type IVectorView_IGpioControllerProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGpioControllerProvider_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Gpio.Provider.IGpioControllerProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGpioControllerProvider_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGpioControllerProvider_Interface
      ; value : Windows.Devices.Gpio.Provider.IGpioControllerProvider
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGpioControllerProvider_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Gpio.Provider.IGpioControllerProvider_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGpioPinProvider_add_ValueChanged : aliased constant Windows.IID := (2938477961, 40449, 21150, (168, 121, 198, 118, 49, 66, 209, 96 ));
   
   type TypedEventHandler_IGpioPinProvider_add_ValueChanged_Interface(Callback : access procedure (sender : Windows.Devices.Gpio.Provider.IGpioPinProvider ; args : Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGpioPinProvider_add_ValueChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGpioPinProvider_add_ValueChanged_Interface
      ; sender : Windows.Devices.Gpio.Provider.IGpioPinProvider
      ; args : Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GpioPinProviderValueChangedEventArgs is Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs;
   function Create
   (
      edge : Windows.Devices.Gpio.Provider.ProviderGpioPinEdge
   )
   return Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs;
   
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
