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
with Windows.Devices.Gpio.Provider;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Gpio is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGpioController_Interface
      ; asyncInfo : Windows.Devices.Gpio.IAsyncOperation_IGpioController
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGpioPin_add_ValueChanged_Interface
      ; sender : Windows.Devices.Gpio.IGpioPin
      ; args : Windows.Devices.Gpio.IGpioPinValueChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Gpio.IGpioPin(sender), Windows.Devices.Gpio.IGpioPinValueChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      pin : Windows.Devices.Gpio.IGpioPin
   )
   return Windows.Devices.Gpio.IGpioChangeReader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioChangeReader");
      m_Factory     : Windows.Devices.Gpio.IGpioChangeReaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.IGpioChangeReader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioChangeReaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(pin, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithCapacity
   (
      pin : Windows.Devices.Gpio.IGpioPin
      ; minCapacity : Windows.Int32
   )
   return Windows.Devices.Gpio.IGpioChangeReader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioChangeReader");
      m_Factory     : Windows.Devices.Gpio.IGpioChangeReaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.IGpioChangeReader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioChangeReaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithCapacity(pin, minCapacity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      pin : Windows.Devices.Gpio.IGpioPin
   )
   return Windows.Devices.Gpio.IGpioChangeCounter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioChangeCounter");
      m_Factory     : Windows.Devices.Gpio.IGpioChangeCounterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.IGpioChangeCounter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioChangeCounterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(pin, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetControllersAsync
   (
      provider : Windows.Devices.Gpio.Provider.IGpioProvider
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioController");
      m_Factory     : IGpioControllerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioControllerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetControllersAsync(provider, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultAsync
   return Windows.Devices.Gpio.IAsyncOperation_IGpioController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioController");
      m_Factory     : IGpioControllerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.IAsyncOperation_IGpioController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioControllerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Gpio.IGpioController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioController");
      m_Factory     : IGpioControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.IGpioController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
