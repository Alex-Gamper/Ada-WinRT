--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Radios is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRadio_Interface
      ; asyncInfo : Windows.Devices.Radios.IAsyncOperation_IRadio
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
      This       : access AsyncOperationCompletedHandler_RadioAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Radios.IAsyncOperation_RadioAccessStatus
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
      This       : access TypedEventHandler_IRadio_add_StateChanged_Interface
      ; sender : Windows.Devices.Radios.IRadio
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Radios.IRadio(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetRadiosAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Radios.Radio");
      m_Factory     : IRadioStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadioStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetRadiosAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Radios.Radio");
      m_Factory     : IRadioStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadioStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Radios.IAsyncOperation_IRadio is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Radios.Radio");
      m_Factory     : IRadioStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Radios.IAsyncOperation_IRadio;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadioStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessAsync
   return Windows.Devices.Radios.IAsyncOperation_RadioAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Radios.Radio");
      m_Factory     : IRadioStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Radios.IAsyncOperation_RadioAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadioStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
