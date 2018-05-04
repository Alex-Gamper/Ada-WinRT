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
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Sms is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access SmsMessageReceivedEventHandler_Interface
      ; sender : Windows.Devices.Sms.ISmsDevice
      ; e : Windows.Devices.Sms.ISmsMessageReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sms.ISmsDevice(sender), Windows.Devices.Sms.ISmsMessageReceivedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access SmsDeviceStatusChangedEventHandler_Interface
      ; sender : Windows.Devices.Sms.ISmsDevice
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sms.ISmsDevice(sender));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISmsMessage_Interface
      ; asyncInfo : Windows.Devices.Sms.IAsyncOperation_ISmsMessage
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
      This       : access AsyncOperationCompletedHandler_ISmsDevice_Interface
      ; asyncInfo : Windows.Devices.Sms.IAsyncOperation_ISmsDevice
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
      This       : access AsyncOperationCompletedHandler_ISmsSendMessageResult_Interface
      ; asyncInfo : Windows.Devices.Sms.IAsyncOperation_ISmsSendMessageResult
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
      This       : access TypedEventHandler_ISmsDevice2_add_DeviceStatusChanged_Interface
      ; sender : Windows.Devices.Sms.ISmsDevice2
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sms.ISmsDevice2(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISmsMessageRegistration_add_MessageReceived_Interface
      ; sender : Windows.Devices.Sms.ISmsMessageRegistration
      ; args : Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Sms.ISmsMessageRegistration(sender), Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateSmsBinaryMessage return Windows.Devices.Sms.ISmsBinaryMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsBinaryMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Sms.ISmsBinaryMessage) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Sms.IID_ISmsBinaryMessage'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSmsTextMessage return Windows.Devices.Sms.ISmsTextMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsTextMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Sms.ISmsTextMessage) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Sms.IID_ISmsTextMessage'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSmsTextMessage2 return Windows.Devices.Sms.ISmsTextMessage2 is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsTextMessage2");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Sms.ISmsTextMessage2) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Sms.IID_ISmsTextMessage2'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSmsAppMessage return Windows.Devices.Sms.ISmsAppMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsAppMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Sms.ISmsAppMessage) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Sms.IID_ISmsAppMessage'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateFilterRule
   (
      messageType : Windows.Devices.Sms.SmsMessageType
   )
   return Windows.Devices.Sms.ISmsFilterRule is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsFilterRule");
      m_Factory     : Windows.Devices.Sms.ISmsFilterRuleFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sms.ISmsFilterRule := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmsFilterRuleFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFilterRule(messageType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFilterRules
   (
      actionType : Windows.Devices.Sms.SmsFilterActionType
   )
   return Windows.Devices.Sms.ISmsFilterRules is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsFilterRules");
      m_Factory     : Windows.Devices.Sms.ISmsFilterRulesFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sms.ISmsFilterRules := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmsFilterRulesFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFilterRules(actionType, RetVal'Access);
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
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsDevice2");
      m_Factory     : ISmsDevice2Statics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmsDevice2Statics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sms.ISmsDevice2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsDevice2");
      m_Factory     : ISmsDevice2Statics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sms.ISmsDevice2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmsDevice2Statics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromId(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Sms.ISmsDevice2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsDevice2");
      m_Factory     : ISmsDevice2Statics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sms.ISmsDevice2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmsDevice2Statics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromParentId
   (
      parentDeviceId : Windows.String
   )
   return Windows.Devices.Sms.ISmsDevice2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsDevice2");
      m_Factory     : ISmsDevice2Statics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sms.ISmsDevice2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmsDevice2Statics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromParentId(parentDeviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllRegistrations
   return Windows.Devices.Sms.IVectorView_ISmsMessageRegistration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsMessageRegistration");
      m_Factory     : ISmsMessageRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sms.IVectorView_ISmsMessageRegistration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmsMessageRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllRegistrations(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Register
   (
      id : Windows.String
      ; filterRules : Windows.Devices.Sms.ISmsFilterRules
   )
   return Windows.Devices.Sms.ISmsMessageRegistration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Sms.SmsMessageRegistration");
      m_Factory     : ISmsMessageRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Sms.ISmsMessageRegistration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmsMessageRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Register(id, filterRules, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
