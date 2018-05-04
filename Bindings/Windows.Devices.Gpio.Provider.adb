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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Gpio.Provider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IGpioPinProvider_add_ValueChanged_Interface
      ; sender : Windows.Devices.Gpio.Provider.IGpioPinProvider
      ; args : Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      edge : Windows.Devices.Gpio.Provider.ProviderGpioPinEdge
   )
   return Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.Provider.GpioPinProviderValueChangedEventArgs");
      m_Factory     : Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioPinProviderValueChangedEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(edge, RetVal'Access);
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
   
end;
