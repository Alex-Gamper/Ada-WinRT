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
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Authentication.Identity.Provider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult
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
      This       : access AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus
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
      This       : access AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult
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
      This       : access EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo
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
      This       : access AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
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
   
   function RegisterDevicePresenceMonitoringAsync
   (
      deviceId : Windows.String
      ; deviceInstancePath : Windows.String
      ; monitoringMode : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresenceMonitoringMode
   )
   return Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration");
      m_Factory     : ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterDevicePresenceMonitoringAsync(deviceId, deviceInstancePath, monitoringMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RegisterDevicePresenceMonitoringWithNewDeviceAsync
   (
      deviceId : Windows.String
      ; deviceInstancePath : Windows.String
      ; monitoringMode : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresenceMonitoringMode
      ; deviceFriendlyName : Windows.String
      ; deviceModelNumber : Windows.String
      ; deviceConfigurationData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration");
      m_Factory     : ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterDevicePresenceMonitoringWithNewDeviceAsync(deviceId, deviceInstancePath, monitoringMode, deviceFriendlyName, deviceModelNumber, deviceConfigurationData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnregisterDevicePresenceMonitoringAsync
   (
      deviceId : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration");
      m_Factory     : ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnregisterDevicePresenceMonitoringAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsDevicePresenceMonitoringSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration");
      m_Factory     : ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsDevicePresenceMonitoringSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestStartRegisteringDeviceAsync
   (
      deviceId : Windows.String
      ; capabilities : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDeviceCapabilities
      ; deviceFriendlyName : Windows.String
      ; deviceModelNumber : Windows.String
      ; deviceKey : Windows.Storage.Streams.IBuffer
      ; mutualAuthenticationKey : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration");
      m_Factory     : ISecondaryAuthenticationFactorRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStartRegisteringDeviceAsync(deviceId, capabilities, deviceFriendlyName, deviceModelNumber, deviceKey, mutualAuthenticationKey, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllRegisteredDeviceInfoAsync
   (
      queryType : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDeviceFindScope
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration");
      m_Factory     : ISecondaryAuthenticationFactorRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllRegisteredDeviceInfoAsync(queryType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnregisterDeviceAsync
   (
      deviceId : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration");
      m_Factory     : ISecondaryAuthenticationFactorRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnregisterDeviceAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UpdateDeviceConfigurationDataAsync
   (
      deviceId : Windows.String
      ; deviceConfigurationData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration");
      m_Factory     : ISecondaryAuthenticationFactorRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UpdateDeviceConfigurationDataAsync(deviceId, deviceConfigurationData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowNotificationMessageAsync
   (
      deviceName : Windows.String
      ; message : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthenticationMessage
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthentication");
      m_Factory     : ISecondaryAuthenticationFactorAuthenticationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorAuthenticationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowNotificationMessageAsync(deviceName, message, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function StartAuthenticationAsync
   (
      deviceId : Windows.String
      ; serviceAuthenticationNonce : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthentication");
      m_Factory     : ISecondaryAuthenticationFactorAuthenticationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorAuthenticationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.StartAuthenticationAsync(deviceId, serviceAuthenticationNonce, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_AuthenticationStageChanged
   (
      handler : Windows.Security.Authentication.Identity.Provider.EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthentication");
      m_Factory     : ISecondaryAuthenticationFactorAuthenticationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorAuthenticationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_AuthenticationStageChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_AuthenticationStageChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthentication");
      m_Factory     : ISecondaryAuthenticationFactorAuthenticationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorAuthenticationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_AuthenticationStageChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetAuthenticationStageInfoAsync
   return Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthentication");
      m_Factory     : ISecondaryAuthenticationFactorAuthenticationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISecondaryAuthenticationFactorAuthenticationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAuthenticationStageInfoAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
