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
with Windows.Storage;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.HumanInterfaceDevice is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IHidDevice_Interface
      ; asyncInfo : Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidDevice
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
      This       : access AsyncOperationCompletedHandler_IHidInputReport_Interface
      ; asyncInfo : Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidInputReport
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
      This       : access AsyncOperationCompletedHandler_IHidFeatureReport_Interface
      ; asyncInfo : Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidFeatureReport
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
      This       : access TypedEventHandler_IHidDevice_add_InputReportReceived_Interface
      ; sender : Windows.Devices.HumanInterfaceDevice.IHidDevice
      ; args : Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.HumanInterfaceDevice.IHidDevice(sender), Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs(args));
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
   
   function GetDeviceSelector
   (
      usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.HumanInterfaceDevice.HidDevice");
      m_Factory     : IHidDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHidDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(usagePage, usageId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorVidPid
   (
      usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; vendorId : Windows.UInt16
      ; productId : Windows.UInt16
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.HumanInterfaceDevice.HidDevice");
      m_Factory     : IHidDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHidDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorVidPid(usagePage, usageId, vendorId, productId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
   )
   return Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.HumanInterfaceDevice.HidDevice");
      m_Factory     : IHidDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHidDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, accessMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
