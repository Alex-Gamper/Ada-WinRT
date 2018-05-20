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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.Devices.Enumeration;
with Windows.UI.Popups;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.DialProtocol is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DialAppLaunchResult_Interface
      ; asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_DialAppLaunchResult
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
      This       : access AsyncOperationCompletedHandler_DialAppStopResult_Interface
      ; asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_DialAppStopResult
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
      This       : access AsyncOperationCompletedHandler_IDialAppStateDetails_Interface
      ; asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_IDialAppStateDetails
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
      This       : access AsyncOperationCompletedHandler_IDialDevice_Interface
      ; asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_IDialDevice
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
      This       : access TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected_Interface
      ; sender : Windows.Media.DialProtocol.IDialDevicePicker
      ; args : Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.DialProtocol.IDialDevicePicker(sender), Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked_Interface
      ; sender : Windows.Media.DialProtocol.IDialDevicePicker
      ; args : Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.DialProtocol.IDialDevicePicker(sender), Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed_Interface
      ; sender : Windows.Media.DialProtocol.IDialDevicePicker
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.DialProtocol.IDialDevicePicker(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.Media.DialProtocol.IDialDevicePicker is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.DialProtocol.DialDevicePicker");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.DialProtocol.IDialDevicePicker) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.DialProtocol.IID_IDialDevicePicker'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   (
      appName : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.DialProtocol.DialDevice");
      m_Factory     : IDialDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDialDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(appName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      value : Windows.String
   )
   return Windows.Media.DialProtocol.IAsyncOperation_IDialDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.DialProtocol.DialDevice");
      m_Factory     : IDialDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.DialProtocol.IAsyncOperation_IDialDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDialDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DeviceInfoSupportsDialAsync
   (
      device : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.DialProtocol.DialDevice");
      m_Factory     : IDialDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDialDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeviceInfoSupportsDialAsync(device, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Current
   return Windows.Media.DialProtocol.IDialReceiverApp is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.DialProtocol.DialReceiverApp");
      m_Factory     : IDialReceiverAppStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.DialProtocol.IDialReceiverApp;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDialReceiverAppStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
