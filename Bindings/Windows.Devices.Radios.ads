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
package Windows.Devices.Radios is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type RadioState is (
      Unknown,
      On,
      Off,
      Disabled
   );
   for RadioState use (
      Unknown => 0,
      On => 1,
      Off => 2,
      Disabled => 3
   );
   for RadioState'Size use 32;
   
   type RadioState_Ptr is access RadioState;
   
   type RadioKind is (
      Other,
      WiFi,
      MobileBroadband,
      Bluetooth,
      FM
   );
   for RadioKind use (
      Other => 0,
      WiFi => 1,
      MobileBroadband => 2,
      Bluetooth => 3,
      FM => 4
   );
   for RadioKind'Size use 32;
   
   type RadioKind_Ptr is access RadioKind;
   
   type RadioAccessStatus is (
      Unspecified,
      Allowed,
      DeniedByUser,
      DeniedBySystem
   );
   for RadioAccessStatus use (
      Unspecified => 0,
      Allowed => 1,
      DeniedByUser => 2,
      DeniedBySystem => 3
   );
   for RadioAccessStatus'Size use 32;
   
   type RadioAccessStatus_Ptr is access RadioAccessStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IRadio_Interface;
   type AsyncOperationCompletedHandler_IRadio is access all AsyncOperationCompletedHandler_IRadio_Interface'Class;
   type AsyncOperationCompletedHandler_IRadio_Ptr is access all AsyncOperationCompletedHandler_IRadio;
   type AsyncOperationCompletedHandler_RadioAccessStatus_Interface;
   type AsyncOperationCompletedHandler_RadioAccessStatus is access all AsyncOperationCompletedHandler_RadioAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_RadioAccessStatus_Ptr is access all AsyncOperationCompletedHandler_RadioAccessStatus;
   type TypedEventHandler_IRadio_add_StateChanged_Interface;
   type TypedEventHandler_IRadio_add_StateChanged is access all TypedEventHandler_IRadio_add_StateChanged_Interface'Class;
   type TypedEventHandler_IRadio_add_StateChanged_Ptr is access all TypedEventHandler_IRadio_add_StateChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IRadioStatics_Interface;
   type IRadioStatics is access all IRadioStatics_Interface'Class;
   type IRadioStatics_Ptr is access all IRadioStatics;
   type IRadio_Interface;
   type IRadio is access all IRadio_Interface'Class;
   type IRadio_Ptr is access all IRadio;
   type IAsyncOperation_IRadio_Interface;
   type IAsyncOperation_IRadio is access all IAsyncOperation_IRadio_Interface'Class;
   type IAsyncOperation_IRadio_Ptr is access all IAsyncOperation_IRadio;
   type IAsyncOperation_RadioAccessStatus_Interface;
   type IAsyncOperation_RadioAccessStatus is access all IAsyncOperation_RadioAccessStatus_Interface'Class;
   type IAsyncOperation_RadioAccessStatus_Ptr is access all IAsyncOperation_RadioAccessStatus;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IRadioStatics : aliased constant Windows.IID := (1605804334, 26571, 18094, (170, 233, 101, 145, 159, 134, 239, 244 ));
   
   type IRadioStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetRadiosAsync
   (
      This       : access IRadioStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IRadioStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IRadioStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Radios.IAsyncOperation_IRadio -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IRadioStatics_Interface
      ; RetVal : access Windows.Devices.Radios.IAsyncOperation_RadioAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRadio : aliased constant Windows.IID := (622926047, 45886, 16746, (135, 95, 28, 243, 138, 226, 216, 62 ));
   
   type IRadio_Interface is interface and Windows.IInspectable_Interface;
   
   function SetStateAsync
   (
      This       : access IRadio_Interface
      ; value : Windows.Devices.Radios.RadioState
      ; RetVal : access Windows.Devices.Radios.IAsyncOperation_RadioAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_StateChanged
   (
      This       : access IRadio_Interface
      ; handler : TypedEventHandler_IRadio_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access IRadio_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IRadio_Interface
      ; RetVal : access Windows.Devices.Radios.RadioState
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IRadio_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IRadio_Interface
      ; RetVal : access Windows.Devices.Radios.RadioKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IRadio : aliased constant Windows.IID := (3938856000, 36284, 22612, (139, 160, 183, 185, 148, 14, 115, 137 ));
   
   type IAsyncOperation_IRadio_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRadio_Interface
      ; handler : Windows.Devices.Radios.AsyncOperationCompletedHandler_IRadio
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRadio_Interface
      ; RetVal : access Windows.Devices.Radios.AsyncOperationCompletedHandler_IRadio
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRadio_Interface
      ; RetVal : access Windows.Devices.Radios.IRadio
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_RadioAccessStatus : aliased constant Windows.IID := (570110191, 1839, 20524, (152, 152, 208, 195, 178, 205, 154, 197 ));
   
   type IAsyncOperation_RadioAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_RadioAccessStatus_Interface
      ; handler : Windows.Devices.Radios.AsyncOperationCompletedHandler_RadioAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_RadioAccessStatus_Interface
      ; RetVal : access Windows.Devices.Radios.AsyncOperationCompletedHandler_RadioAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_RadioAccessStatus_Interface
      ; RetVal : access Windows.Devices.Radios.RadioAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IRadio : aliased constant Windows.IID := (2321317434, 32994, 22619, (134, 48, 122, 142, 119, 127, 3, 84 ));
   
   type AsyncOperationCompletedHandler_IRadio_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Radios.IAsyncOperation_IRadio ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IRadio'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRadio_Interface
      ; asyncInfo : Windows.Devices.Radios.IAsyncOperation_IRadio
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_RadioAccessStatus : aliased constant Windows.IID := (3173289587, 61535, 22348, (174, 61, 155, 149, 196, 191, 40, 42 ));
   
   type AsyncOperationCompletedHandler_RadioAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Radios.IAsyncOperation_RadioAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_RadioAccessStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_RadioAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Radios.IAsyncOperation_RadioAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRadio_add_StateChanged : aliased constant Windows.IID := (4234847017, 46470, 24251, (158, 133, 63, 107, 132, 235, 223, 24 ));
   
   type TypedEventHandler_IRadio_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Devices.Radios.IRadio ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRadio_add_StateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IRadio_add_StateChanged_Interface
      ; sender : Windows.Devices.Radios.IRadio
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Radio is Windows.Devices.Radios.IRadio;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetRadiosAsync
   return Windows.Address;
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Radios.IAsyncOperation_IRadio;
   
   function RequestAccessAsync
   return Windows.Devices.Radios.IAsyncOperation_RadioAccessStatus;
   
end;
