--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Authentication.Identity.Provider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
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
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
