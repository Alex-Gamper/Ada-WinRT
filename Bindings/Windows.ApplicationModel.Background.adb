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
with Windows.ApplicationModel.Calls.Background;
with Windows.Devices.SmartCards;
with Windows.Storage.Provider;
with Windows.System;
with Windows.ApplicationModel.Activation;
with Windows.Devices.Sms;
with Windows.Storage;
with Windows.Devices.Bluetooth.Background;
with Windows.Networking.Sockets;
with Windows.Networking;
with Windows.Devices.Bluetooth.GenericAttributeProfile;
with Windows.Devices.Bluetooth;
with Windows.Devices.Bluetooth.Advertisement;
with Windows.Devices.Geolocation;
with Windows.Devices.Sensors;
with Windows.UI.Notifications;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Background is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access BackgroundTaskCanceledEventHandler_Interface
      ; sender : Windows.ApplicationModel.Background.IBackgroundTaskInstance
      ; reason : Windows.ApplicationModel.Background.BackgroundTaskCancellationReason
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, reason);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access BackgroundTaskProgressEventHandler_Interface
      ; sender : Windows.ApplicationModel.Background.IBackgroundTaskRegistration
      ; args : Windows.ApplicationModel.Background.IBackgroundTaskProgressEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Background.IBackgroundTaskRegistration(sender), Windows.ApplicationModel.Background.IBackgroundTaskProgressEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access BackgroundTaskCompletedEventHandler_Interface
      ; sender : Windows.ApplicationModel.Background.IBackgroundTaskRegistration
      ; args : Windows.ApplicationModel.Background.IBackgroundTaskCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Background.IBackgroundTaskRegistration(sender), Windows.ApplicationModel.Background.IBackgroundTaskCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_AlarmAccessStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_AlarmAccessStatus
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
      This       : access AsyncOperationCompletedHandler_BackgroundAccessStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus
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
      This       : access AsyncOperationCompletedHandler_ApplicationTriggerResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_ApplicationTriggerResult
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
      This       : access AsyncOperationCompletedHandler_MediaProcessingTriggerResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_MediaProcessingTriggerResult
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
      This       : access TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated_Interface
      ; sender : Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup
      ; args : Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup(sender), Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DeviceTriggerResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_DeviceTriggerResult
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
      This       : access AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_IDeviceConnectionChangeTrigger
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
      This       : access AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_IGattServiceProviderTriggerResult
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
   
   function Create
   (
      type_x : Windows.ApplicationModel.Calls.Background.PhoneTriggerType
      ; oneShot : Windows.Boolean
   )
   return Windows.ApplicationModel.Background.IPhoneTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.PhoneTrigger");
      m_Factory     : Windows.ApplicationModel.Background.IPhoneTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IPhoneTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPhoneTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(type_x, oneShot, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCommunicationBlockingAppSetAsActiveTrigger return Windows.ApplicationModel.Background.ICommunicationBlockingAppSetAsActiveTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.CommunicationBlockingAppSetAsActiveTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.ICommunicationBlockingAppSetAsActiveTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_ICommunicationBlockingAppSetAsActiveTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      triggerType : Windows.Devices.SmartCards.SmartCardTriggerType
   )
   return Windows.ApplicationModel.Background.ISmartCardTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.SmartCardTrigger");
      m_Factory     : Windows.ApplicationModel.Background.ISmartCardTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.ISmartCardTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmartCardTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(triggerType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateApplicationTrigger return Windows.ApplicationModel.Background.IApplicationTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.ApplicationTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IApplicationTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IApplicationTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateMediaProcessingTrigger return Windows.ApplicationModel.Background.IMediaProcessingTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.MediaProcessingTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IMediaProcessingTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IMediaProcessingTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContentPrefetchTrigger return Windows.ApplicationModel.Background.IContentPrefetchTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.ContentPrefetchTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IContentPrefetchTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IContentPrefetchTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSecondaryAuthenticationFactorAuthenticationTrigger return Windows.ApplicationModel.Background.ISecondaryAuthenticationFactorAuthenticationTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.SecondaryAuthenticationFactorAuthenticationTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.ISecondaryAuthenticationFactorAuthenticationTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_ISecondaryAuthenticationFactorAuthenticationTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      triggerType : Windows.ApplicationModel.Background.SystemTriggerType
      ; oneShot : Windows.Boolean
   )
   return Windows.ApplicationModel.Background.ISystemTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.SystemTrigger");
      m_Factory     : Windows.ApplicationModel.Background.ISystemTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.ISystemTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(triggerType, oneShot, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      conditionType : Windows.ApplicationModel.Background.SystemConditionType
   )
   return Windows.ApplicationModel.Background.ISystemCondition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.SystemCondition");
      m_Factory     : Windows.ApplicationModel.Background.ISystemConditionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.ISystemCondition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemConditionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(conditionType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      networkAccountId : Windows.String
   )
   return Windows.ApplicationModel.Background.INetworkOperatorNotificationTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.NetworkOperatorNotificationTrigger");
      m_Factory     : Windows.ApplicationModel.Background.INetworkOperatorNotificationTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.INetworkOperatorNotificationTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkOperatorNotificationTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(networkAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      triggerQualifier : Windows.String
      ; oneShot : Windows.Boolean
   )
   return Windows.ApplicationModel.Background.IDeviceManufacturerNotificationTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.DeviceManufacturerNotificationTrigger");
      m_Factory     : Windows.ApplicationModel.Background.IDeviceManufacturerNotificationTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IDeviceManufacturerNotificationTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceManufacturerNotificationTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(triggerQualifier, oneShot, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCachedFileUpdaterTrigger return Windows.ApplicationModel.Background.ICachedFileUpdaterTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.CachedFileUpdaterTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.ICachedFileUpdaterTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_ICachedFileUpdaterTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      freshnessTime : Windows.UInt32
      ; oneShot : Windows.Boolean
   )
   return Windows.ApplicationModel.Background.ITimeTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.TimeTrigger");
      m_Factory     : Windows.ApplicationModel.Background.ITimeTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.ITimeTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimeTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(freshnessTime, oneShot, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      freshnessTime : Windows.UInt32
      ; oneShot : Windows.Boolean
   )
   return Windows.ApplicationModel.Background.IMaintenanceTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.MaintenanceTrigger");
      m_Factory     : Windows.ApplicationModel.Background.IMaintenanceTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IMaintenanceTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMaintenanceTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(freshnessTime, oneShot, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAppointmentStoreNotificationTrigger return Windows.ApplicationModel.Background.IAppointmentStoreNotificationTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.AppointmentStoreNotificationTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IAppointmentStoreNotificationTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IAppointmentStoreNotificationTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      id : Windows.String
   )
   return Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundTaskRegistrationGroup");
      m_Factory     : Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundTaskRegistrationGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(id, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithName
   (
      id : Windows.String
      ; name : Windows.String
   )
   return Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundTaskRegistrationGroup");
      m_Factory     : Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundTaskRegistrationGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithName(id, name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBackgroundTaskBuilder return Windows.ApplicationModel.Background.IBackgroundTaskBuilder is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundTaskBuilder");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBackgroundTaskBuilder) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTaskBuilder'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateChatMessageNotificationTrigger return Windows.ApplicationModel.Background.IChatMessageNotificationTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.ChatMessageNotificationTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IChatMessageNotificationTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IChatMessageNotificationTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateChatMessageReceivedNotificationTrigger return Windows.ApplicationModel.Background.IChatMessageReceivedNotificationTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.ChatMessageReceivedNotificationTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IChatMessageReceivedNotificationTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IChatMessageReceivedNotificationTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateRcsEndUserMessageAvailableTrigger return Windows.ApplicationModel.Background.IRcsEndUserMessageAvailableTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.RcsEndUserMessageAvailableTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IRcsEndUserMessageAvailableTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IRcsEndUserMessageAvailableTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateContactStoreNotificationTrigger return Windows.ApplicationModel.Background.IContactStoreNotificationTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.ContactStoreNotificationTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IContactStoreNotificationTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IContactStoreNotificationTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateEmailStoreNotificationTrigger return Windows.ApplicationModel.Background.IEmailStoreNotificationTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.EmailStoreNotificationTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IEmailStoreNotificationTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IEmailStoreNotificationTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateMobileBroadbandRegistrationStateChangeTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.MobileBroadbandRegistrationStateChangeTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBackgroundTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateMobileBroadbandRadioStateChangeTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.MobileBroadbandRadioStateChangeTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBackgroundTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateMobileBroadbandPinLockStateChangeTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.MobileBroadbandPinLockStateChangeTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBackgroundTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateMobileBroadbandDeviceServiceNotificationTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.MobileBroadbandDeviceServiceNotificationTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBackgroundTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      filterRules : Windows.Devices.Sms.ISmsFilterRules
   )
   return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.SmsMessageReceivedTrigger");
      m_Factory     : Windows.ApplicationModel.Background.ISmsMessageReceivedTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IBackgroundTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISmsMessageReceivedTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(filterRules, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePaymentAppCanMakePaymentTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.PaymentAppCanMakePaymentTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBackgroundTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateDeviceUseTrigger return Windows.ApplicationModel.Background.IDeviceUseTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.DeviceUseTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IDeviceUseTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IDeviceUseTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateDeviceServicingTrigger return Windows.ApplicationModel.Background.IDeviceServicingTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.DeviceServicingTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IDeviceServicingTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IDeviceServicingTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateRfcommConnectionTrigger return Windows.ApplicationModel.Background.IRfcommConnectionTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.RfcommConnectionTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IRfcommConnectionTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IRfcommConnectionTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWithEventTriggeringMode
   (
      characteristic : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
      ; eventTriggeringMode : Windows.Devices.Bluetooth.Background.BluetoothEventTriggeringMode
   )
   return Windows.ApplicationModel.Background.IGattCharacteristicNotificationTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.GattCharacteristicNotificationTrigger");
      m_Factory     : Windows.ApplicationModel.Background.IGattCharacteristicNotificationTriggerFactory2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IGattCharacteristicNotificationTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattCharacteristicNotificationTriggerFactory2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithEventTriggeringMode(characteristic, eventTriggeringMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBluetoothLEAdvertisementWatcherTrigger return Windows.ApplicationModel.Background.IBluetoothLEAdvertisementWatcherTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BluetoothLEAdvertisementWatcherTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBluetoothLEAdvertisementWatcherTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBluetoothLEAdvertisementWatcherTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateBluetoothLEAdvertisementPublisherTrigger return Windows.ApplicationModel.Background.IBluetoothLEAdvertisementPublisherTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BluetoothLEAdvertisementPublisherTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBluetoothLEAdvertisementPublisherTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBluetoothLEAdvertisementPublisherTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      triggerType : Windows.ApplicationModel.Background.LocationTriggerType
   )
   return Windows.ApplicationModel.Background.ILocationTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.LocationTrigger");
      m_Factory     : Windows.ApplicationModel.Background.ILocationTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.ILocationTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocationTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(triggerType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateGeovisitTrigger return Windows.ApplicationModel.Background.IGeovisitTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.GeovisitTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IGeovisitTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IGeovisitTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      reportIntervalInMilliseconds : Windows.UInt32
   )
   return Windows.ApplicationModel.Background.IActivitySensorTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.ActivitySensorTrigger");
      m_Factory     : Windows.ApplicationModel.Background.IActivitySensorTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IActivitySensorTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IActivitySensorTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(reportIntervalInMilliseconds, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      threshold : Windows.Devices.Sensors.ISensorDataThreshold
   )
   return Windows.ApplicationModel.Background.ISensorDataThresholdTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.SensorDataThresholdTrigger");
      m_Factory     : Windows.ApplicationModel.Background.ISensorDataThresholdTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.ISensorDataThresholdTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISensorDataThresholdTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(threshold, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNetworkOperatorHotspotAuthenticationTrigger return Windows.ApplicationModel.Background.INetworkOperatorHotspotAuthenticationTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.NetworkOperatorHotspotAuthenticationTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.INetworkOperatorHotspotAuthenticationTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_INetworkOperatorHotspotAuthenticationTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSocketActivityTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.SocketActivityTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBackgroundTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePushNotificationTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.PushNotificationTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBackgroundTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      applicationId : Windows.String
   )
   return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.ToastNotificationHistoryChangedTrigger");
      m_Factory     : Windows.ApplicationModel.Background.IToastNotificationHistoryChangedTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IBackgroundTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToastNotificationHistoryChangedTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(applicationId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateToastNotificationActionTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.ToastNotificationActionTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Background.IBackgroundTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Background.IID_IBackgroundTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      notificationKinds : Windows.UI.Notifications.NotificationKinds
   )
   return Windows.ApplicationModel.Background.IBackgroundTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.UserNotificationChangedTrigger");
      m_Factory     : Windows.ApplicationModel.Background.IUserNotificationChangedTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IBackgroundTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserNotificationChangedTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(notificationKinds, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAppBroadcastTrigger
   (
      providerKey : Windows.String
   )
   return Windows.ApplicationModel.Background.IAppBroadcastTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.AppBroadcastTrigger");
      m_Factory     : Windows.ApplicationModel.Background.IAppBroadcastTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IAppBroadcastTrigger := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAppBroadcastTrigger(providerKey, RetVal'Access);
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
   
   function RequestAccessAsync
   return Windows.ApplicationModel.Background.IAsyncOperation_AlarmAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.AlarmApplicationManager");
      m_Factory     : IAlarmApplicationManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IAsyncOperation_AlarmAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAlarmApplicationManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAccessStatus
   return Windows.ApplicationModel.Background.AlarmAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.AlarmApplicationManager");
      m_Factory     : IAlarmApplicationManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.AlarmAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAlarmApplicationManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAccessStatus(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessAsync
   return Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundExecutionManager");
      m_Factory     : IBackgroundExecutionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundExecutionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessForApplicationAsync
   (
      applicationId : Windows.String
   )
   return Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundExecutionManager");
      m_Factory     : IBackgroundExecutionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundExecutionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessForApplicationAsync(applicationId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure RemoveAccess
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundExecutionManager");
      m_Factory     : IBackgroundExecutionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundExecutionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RemoveAccess;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure RemoveAccessForApplication
   (
      applicationId : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundExecutionManager");
      m_Factory     : IBackgroundExecutionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundExecutionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RemoveAccessForApplication(applicationId);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetAccessStatus
   return Windows.ApplicationModel.Background.BackgroundAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundExecutionManager");
      m_Factory     : IBackgroundExecutionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.BackgroundAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundExecutionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAccessStatus(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAccessStatusForApplication
   (
      applicationId : Windows.String
   )
   return Windows.ApplicationModel.Background.BackgroundAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundExecutionManager");
      m_Factory     : IBackgroundExecutionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.BackgroundAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundExecutionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAccessStatusForApplication(applicationId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllTasks
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundTaskRegistration");
      m_Factory     : IBackgroundTaskRegistrationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundTaskRegistrationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllTasks(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllTaskGroups
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundTaskRegistration");
      m_Factory     : IBackgroundTaskRegistrationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundTaskRegistrationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllTaskGroups(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTaskGroup
   (
      groupId : Windows.String
   )
   return Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundTaskRegistration");
      m_Factory     : IBackgroundTaskRegistrationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundTaskRegistrationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTaskGroup(groupId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CurrentBackgroundWorkCost
   return Windows.ApplicationModel.Background.BackgroundWorkCostValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.BackgroundWorkCost");
      m_Factory     : IBackgroundWorkCostStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.BackgroundWorkCostValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundWorkCostStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CurrentBackgroundWorkCost(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      storageLibrary : Windows.Storage.IStorageLibrary
   )
   return Windows.ApplicationModel.Background.IStorageLibraryContentChangedTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.StorageLibraryContentChangedTrigger");
      m_Factory     : IStorageLibraryContentChangedTriggerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IStorageLibraryContentChangedTrigger;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageLibraryContentChangedTriggerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(storageLibrary, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLibraries
   (
      storageLibraries : Windows.Storage.IIterable_IStorageLibrary
   )
   return Windows.ApplicationModel.Background.IStorageLibraryContentChangedTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.StorageLibraryContentChangedTrigger");
      m_Factory     : IStorageLibraryContentChangedTriggerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IStorageLibraryContentChangedTrigger;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageLibraryContentChangedTriggerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLibraries(storageLibraries, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.ApplicationModel.Background.IAsyncOperation_IDeviceConnectionChangeTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.DeviceConnectionChangeTrigger");
      m_Factory     : IDeviceConnectionChangeTriggerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IAsyncOperation_IDeviceConnectionChangeTrigger;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceConnectionChangeTriggerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAsync
   (
      triggerId : Windows.String
      ; serviceUuid : Windows.Guid
   )
   return Windows.ApplicationModel.Background.IAsyncOperation_IGattServiceProviderTriggerResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Background.GattServiceProviderTrigger");
      m_Factory     : IGattServiceProviderTriggerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Background.IAsyncOperation_IGattServiceProviderTriggerResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGattServiceProviderTriggerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsync(triggerId, serviceUuid, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
