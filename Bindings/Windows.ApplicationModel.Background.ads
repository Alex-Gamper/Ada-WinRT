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
limited with Windows.ApplicationModel.Calls.Background;
limited with Windows.Devices.SmartCards;
with Windows.Foundation.Collections;
limited with Windows.Storage.Provider;
with Windows; use Windows;
limited with Windows.System;
limited with Windows.ApplicationModel.Activation;
limited with Windows.Devices.Sms;
limited with Windows.Storage;
limited with Windows.Devices.Bluetooth.Background;
limited with Windows.Networking.Sockets;
limited with Windows.Networking;
limited with Windows.Devices.Bluetooth.GenericAttributeProfile;
limited with Windows.Devices.Bluetooth;
limited with Windows.Devices.Bluetooth.Advertisement;
limited with Windows.Devices.Geolocation;
limited with Windows.Devices.Sensors;
limited with Windows.UI.Notifications;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Background is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AlarmAccessStatus is (
      Unspecified,
      AllowedWithWakeupCapability,
      AllowedWithoutWakeupCapability,
      Denied
   );
   for AlarmAccessStatus use (
      Unspecified => 0,
      AllowedWithWakeupCapability => 1,
      AllowedWithoutWakeupCapability => 2,
      Denied => 3
   );
   for AlarmAccessStatus'Size use 32;
   
   type AlarmAccessStatus_Ptr is access AlarmAccessStatus;
   
   type ApplicationTriggerResult is (
      Allowed,
      CurrentlyRunning,
      DisabledByPolicy,
      UnknownError
   );
   for ApplicationTriggerResult use (
      Allowed => 0,
      CurrentlyRunning => 1,
      DisabledByPolicy => 2,
      UnknownError => 3
   );
   for ApplicationTriggerResult'Size use 32;
   
   type ApplicationTriggerResult_Ptr is access ApplicationTriggerResult;
   
   type MediaProcessingTriggerResult is (
      Allowed,
      CurrentlyRunning,
      DisabledByPolicy,
      UnknownError
   );
   for MediaProcessingTriggerResult use (
      Allowed => 0,
      CurrentlyRunning => 1,
      DisabledByPolicy => 2,
      UnknownError => 3
   );
   for MediaProcessingTriggerResult'Size use 32;
   
   type MediaProcessingTriggerResult_Ptr is access MediaProcessingTriggerResult;
   
   type SystemTriggerType is (
      Invalid,
      SmsReceived,
      UserPresent,
      UserAway,
      NetworkStateChange,
      ControlChannelReset,
      InternetAvailable,
      SessionConnected,
      ServicingComplete,
      LockScreenApplicationAdded,
      LockScreenApplicationRemoved,
      TimeZoneChange,
      OnlineIdConnectedStateChange,
      BackgroundWorkCostChange,
      PowerStateChange,
      DefaultSignInAccountChange
   );
   for SystemTriggerType use (
      Invalid => 0,
      SmsReceived => 1,
      UserPresent => 2,
      UserAway => 3,
      NetworkStateChange => 4,
      ControlChannelReset => 5,
      InternetAvailable => 6,
      SessionConnected => 7,
      ServicingComplete => 8,
      LockScreenApplicationAdded => 9,
      LockScreenApplicationRemoved => 10,
      TimeZoneChange => 11,
      OnlineIdConnectedStateChange => 12,
      BackgroundWorkCostChange => 13,
      PowerStateChange => 14,
      DefaultSignInAccountChange => 15
   );
   for SystemTriggerType'Size use 32;
   
   type SystemTriggerType_Ptr is access SystemTriggerType;
   
   type SystemConditionType is (
      Invalid,
      UserPresent,
      UserNotPresent,
      InternetAvailable,
      InternetNotAvailable,
      SessionConnected,
      SessionDisconnected,
      FreeNetworkAvailable,
      BackgroundWorkCostNotHigh
   );
   for SystemConditionType use (
      Invalid => 0,
      UserPresent => 1,
      UserNotPresent => 2,
      InternetAvailable => 3,
      InternetNotAvailable => 4,
      SessionConnected => 5,
      SessionDisconnected => 6,
      FreeNetworkAvailable => 7,
      BackgroundWorkCostNotHigh => 8
   );
   for SystemConditionType'Size use 32;
   
   type SystemConditionType_Ptr is access SystemConditionType;
   
   type BackgroundAccessStatus is (
      Unspecified,
      AlwaysAllowed,
      AllowedSubjectToSystemPolicy,
      DeniedBySystemPolicy,
      DeniedByUser
   );
   for BackgroundAccessStatus use (
      Unspecified => 0,
      AlwaysAllowed => 4,
      AllowedSubjectToSystemPolicy => 5,
      DeniedBySystemPolicy => 6,
      DeniedByUser => 7
   );
   for BackgroundAccessStatus'Size use 32;
   
   type BackgroundAccessStatus_Ptr is access BackgroundAccessStatus;
   
   type BackgroundTaskCancellationReason is (
      Abort_x,
      Terminating,
      LoggingOff,
      ServicingUpdate,
      IdleTask,
      Uninstall,
      ConditionLoss,
      SystemPolicy,
      ExecutionTimeExceeded,
      ResourceRevocation,
      EnergySaver
   );
   for BackgroundTaskCancellationReason use (
      Abort_x => 0,
      Terminating => 1,
      LoggingOff => 2,
      ServicingUpdate => 3,
      IdleTask => 4,
      Uninstall => 5,
      ConditionLoss => 6,
      SystemPolicy => 7,
      ExecutionTimeExceeded => 9,
      ResourceRevocation => 10,
      EnergySaver => 11
   );
   for BackgroundTaskCancellationReason'Size use 32;
   
   type BackgroundTaskCancellationReason_Ptr is access BackgroundTaskCancellationReason;
   
   type BackgroundWorkCostValue is (
      Low,
      Medium,
      High
   );
   for BackgroundWorkCostValue use (
      Low => 0,
      Medium => 1,
      High => 2
   );
   for BackgroundWorkCostValue'Size use 32;
   
   type BackgroundWorkCostValue_Ptr is access BackgroundWorkCostValue;
   
   type BackgroundTaskThrottleCounter is (
      All_x,
      Cpu,
      Network
   );
   for BackgroundTaskThrottleCounter use (
      All_x => 0,
      Cpu => 1,
      Network => 2
   );
   for BackgroundTaskThrottleCounter'Size use 32;
   
   type BackgroundTaskThrottleCounter_Ptr is access BackgroundTaskThrottleCounter;
   
   type DeviceTriggerResult is (
      Allowed,
      DeniedByUser,
      DeniedBySystem,
      LowBattery
   );
   for DeviceTriggerResult use (
      Allowed => 0,
      DeniedByUser => 1,
      DeniedBySystem => 2,
      LowBattery => 3
   );
   for DeviceTriggerResult'Size use 32;
   
   type DeviceTriggerResult_Ptr is access DeviceTriggerResult;
   
   type LocationTriggerType is (
      Geofence
   );
   for LocationTriggerType use (
      Geofence => 0
   );
   for LocationTriggerType'Size use 32;
   
   type LocationTriggerType_Ptr is access LocationTriggerType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type BackgroundAlarmApplicationContract is null record;
   pragma Convention (C_Pass_By_Copy , BackgroundAlarmApplicationContract);
   
   type BackgroundAlarmApplicationContract_Ptr is access BackgroundAlarmApplicationContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type BackgroundTaskCanceledEventHandler_Interface;
   type BackgroundTaskCanceledEventHandler is access all BackgroundTaskCanceledEventHandler_Interface'Class;
   type BackgroundTaskCanceledEventHandler_Ptr is access all BackgroundTaskCanceledEventHandler;
   type BackgroundTaskProgressEventHandler_Interface;
   type BackgroundTaskProgressEventHandler is access all BackgroundTaskProgressEventHandler_Interface'Class;
   type BackgroundTaskProgressEventHandler_Ptr is access all BackgroundTaskProgressEventHandler;
   type BackgroundTaskCompletedEventHandler_Interface;
   type BackgroundTaskCompletedEventHandler is access all BackgroundTaskCompletedEventHandler_Interface'Class;
   type BackgroundTaskCompletedEventHandler_Ptr is access all BackgroundTaskCompletedEventHandler;
   type AsyncOperationCompletedHandler_AlarmAccessStatus_Interface;
   type AsyncOperationCompletedHandler_AlarmAccessStatus is access all AsyncOperationCompletedHandler_AlarmAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_AlarmAccessStatus_Ptr is access all AsyncOperationCompletedHandler_AlarmAccessStatus;
   type AsyncOperationCompletedHandler_BackgroundAccessStatus_Interface;
   type AsyncOperationCompletedHandler_BackgroundAccessStatus is access all AsyncOperationCompletedHandler_BackgroundAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_BackgroundAccessStatus_Ptr is access all AsyncOperationCompletedHandler_BackgroundAccessStatus;
   type AsyncOperationCompletedHandler_ApplicationTriggerResult_Interface;
   type AsyncOperationCompletedHandler_ApplicationTriggerResult is access all AsyncOperationCompletedHandler_ApplicationTriggerResult_Interface'Class;
   type AsyncOperationCompletedHandler_ApplicationTriggerResult_Ptr is access all AsyncOperationCompletedHandler_ApplicationTriggerResult;
   type AsyncOperationCompletedHandler_MediaProcessingTriggerResult_Interface;
   type AsyncOperationCompletedHandler_MediaProcessingTriggerResult is access all AsyncOperationCompletedHandler_MediaProcessingTriggerResult_Interface'Class;
   type AsyncOperationCompletedHandler_MediaProcessingTriggerResult_Ptr is access all AsyncOperationCompletedHandler_MediaProcessingTriggerResult;
   type TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated_Interface;
   type TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated is access all TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated_Interface'Class;
   type TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated_Ptr is access all TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated;
   type AsyncOperationCompletedHandler_DeviceTriggerResult_Interface;
   type AsyncOperationCompletedHandler_DeviceTriggerResult is access all AsyncOperationCompletedHandler_DeviceTriggerResult_Interface'Class;
   type AsyncOperationCompletedHandler_DeviceTriggerResult_Ptr is access all AsyncOperationCompletedHandler_DeviceTriggerResult;
   type AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger_Interface;
   type AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger is access all AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger_Interface'Class;
   type AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger_Ptr is access all AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger;
   type AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult_Interface;
   type AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult is access all AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult_Ptr is access all AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAlarmApplicationManagerStatics_Interface;
   type IAlarmApplicationManagerStatics is access all IAlarmApplicationManagerStatics_Interface'Class;
   type IAlarmApplicationManagerStatics_Ptr is access all IAlarmApplicationManagerStatics;
   type IPhoneTriggerFactory_Interface;
   type IPhoneTriggerFactory is access all IPhoneTriggerFactory_Interface'Class;
   type IPhoneTriggerFactory_Ptr is access all IPhoneTriggerFactory;
   type ISmartCardTriggerFactory_Interface;
   type ISmartCardTriggerFactory is access all ISmartCardTriggerFactory_Interface'Class;
   type ISmartCardTriggerFactory_Ptr is access all ISmartCardTriggerFactory;
   type IApplicationTriggerDetails_Interface;
   type IApplicationTriggerDetails is access all IApplicationTriggerDetails_Interface'Class;
   type IApplicationTriggerDetails_Ptr is access all IApplicationTriggerDetails;
   type IContentPrefetchTriggerFactory_Interface;
   type IContentPrefetchTriggerFactory is access all IContentPrefetchTriggerFactory_Interface'Class;
   type IContentPrefetchTriggerFactory_Ptr is access all IContentPrefetchTriggerFactory;
   type ISystemTriggerFactory_Interface;
   type ISystemTriggerFactory is access all ISystemTriggerFactory_Interface'Class;
   type ISystemTriggerFactory_Ptr is access all ISystemTriggerFactory;
   type ISystemConditionFactory_Interface;
   type ISystemConditionFactory is access all ISystemConditionFactory_Interface'Class;
   type ISystemConditionFactory_Ptr is access all ISystemConditionFactory;
   type INetworkOperatorNotificationTriggerFactory_Interface;
   type INetworkOperatorNotificationTriggerFactory is access all INetworkOperatorNotificationTriggerFactory_Interface'Class;
   type INetworkOperatorNotificationTriggerFactory_Ptr is access all INetworkOperatorNotificationTriggerFactory;
   type IDeviceManufacturerNotificationTriggerFactory_Interface;
   type IDeviceManufacturerNotificationTriggerFactory is access all IDeviceManufacturerNotificationTriggerFactory_Interface'Class;
   type IDeviceManufacturerNotificationTriggerFactory_Ptr is access all IDeviceManufacturerNotificationTriggerFactory;
   type ICachedFileUpdaterTriggerDetails_Interface;
   type ICachedFileUpdaterTriggerDetails is access all ICachedFileUpdaterTriggerDetails_Interface'Class;
   type ICachedFileUpdaterTriggerDetails_Ptr is access all ICachedFileUpdaterTriggerDetails;
   type ITimeTriggerFactory_Interface;
   type ITimeTriggerFactory is access all ITimeTriggerFactory_Interface'Class;
   type ITimeTriggerFactory_Ptr is access all ITimeTriggerFactory;
   type IMaintenanceTriggerFactory_Interface;
   type IMaintenanceTriggerFactory is access all IMaintenanceTriggerFactory_Interface'Class;
   type IMaintenanceTriggerFactory_Ptr is access all IMaintenanceTriggerFactory;
   type IBackgroundExecutionManagerStatics_Interface;
   type IBackgroundExecutionManagerStatics is access all IBackgroundExecutionManagerStatics_Interface'Class;
   type IBackgroundExecutionManagerStatics_Ptr is access all IBackgroundExecutionManagerStatics;
   type IBackgroundTaskInstance_Interface;
   type IBackgroundTaskInstance is access all IBackgroundTaskInstance_Interface'Class;
   type IBackgroundTaskInstance_Ptr is access all IBackgroundTaskInstance;
   type IBackgroundWorkCostStatics_Interface;
   type IBackgroundWorkCostStatics is access all IBackgroundWorkCostStatics_Interface'Class;
   type IBackgroundWorkCostStatics_Ptr is access all IBackgroundWorkCostStatics;
   type IBackgroundTaskDeferral_Interface;
   type IBackgroundTaskDeferral is access all IBackgroundTaskDeferral_Interface'Class;
   type IBackgroundTaskDeferral_Ptr is access all IBackgroundTaskDeferral;
   type IBackgroundTaskInstance2_Interface;
   type IBackgroundTaskInstance2 is access all IBackgroundTaskInstance2_Interface'Class;
   type IBackgroundTaskInstance2_Ptr is access all IBackgroundTaskInstance2;
   type IBackgroundTaskInstance4_Interface;
   type IBackgroundTaskInstance4 is access all IBackgroundTaskInstance4_Interface'Class;
   type IBackgroundTaskInstance4_Ptr is access all IBackgroundTaskInstance4;
   type IBackgroundTask_Interface;
   type IBackgroundTask is access all IBackgroundTask_Interface'Class;
   type IBackgroundTask_Ptr is access all IBackgroundTask;
   type IBackgroundTaskRegistration_Interface;
   type IBackgroundTaskRegistration is access all IBackgroundTaskRegistration_Interface'Class;
   type IBackgroundTaskRegistration_Ptr is access all IBackgroundTaskRegistration;
   type IBackgroundTaskRegistration2_Interface;
   type IBackgroundTaskRegistration2 is access all IBackgroundTaskRegistration2_Interface'Class;
   type IBackgroundTaskRegistration2_Ptr is access all IBackgroundTaskRegistration2;
   type IBackgroundTrigger_Interface;
   type IBackgroundTrigger is access all IBackgroundTrigger_Interface'Class;
   type IBackgroundTrigger_Ptr is access all IBackgroundTrigger;
   type IPhoneTrigger_Interface;
   type IPhoneTrigger is access all IPhoneTrigger_Interface'Class;
   type IPhoneTrigger_Ptr is access all IPhoneTrigger;
   type ICommunicationBlockingAppSetAsActiveTrigger_Interface;
   type ICommunicationBlockingAppSetAsActiveTrigger is access all ICommunicationBlockingAppSetAsActiveTrigger_Interface'Class;
   type ICommunicationBlockingAppSetAsActiveTrigger_Ptr is access all ICommunicationBlockingAppSetAsActiveTrigger;
   type ISmartCardTrigger_Interface;
   type ISmartCardTrigger is access all ISmartCardTrigger_Interface'Class;
   type ISmartCardTrigger_Ptr is access all ISmartCardTrigger;
   type IApplicationTrigger_Interface;
   type IApplicationTrigger is access all IApplicationTrigger_Interface'Class;
   type IApplicationTrigger_Ptr is access all IApplicationTrigger;
   type IMediaProcessingTrigger_Interface;
   type IMediaProcessingTrigger is access all IMediaProcessingTrigger_Interface'Class;
   type IMediaProcessingTrigger_Ptr is access all IMediaProcessingTrigger;
   type IContentPrefetchTrigger_Interface;
   type IContentPrefetchTrigger is access all IContentPrefetchTrigger_Interface'Class;
   type IContentPrefetchTrigger_Ptr is access all IContentPrefetchTrigger;
   type ISecondaryAuthenticationFactorAuthenticationTrigger_Interface;
   type ISecondaryAuthenticationFactorAuthenticationTrigger is access all ISecondaryAuthenticationFactorAuthenticationTrigger_Interface'Class;
   type ISecondaryAuthenticationFactorAuthenticationTrigger_Ptr is access all ISecondaryAuthenticationFactorAuthenticationTrigger;
   type ISystemTrigger_Interface;
   type ISystemTrigger is access all ISystemTrigger_Interface'Class;
   type ISystemTrigger_Ptr is access all ISystemTrigger;
   type INetworkOperatorNotificationTrigger_Interface;
   type INetworkOperatorNotificationTrigger is access all INetworkOperatorNotificationTrigger_Interface'Class;
   type INetworkOperatorNotificationTrigger_Ptr is access all INetworkOperatorNotificationTrigger;
   type IDeviceManufacturerNotificationTrigger_Interface;
   type IDeviceManufacturerNotificationTrigger is access all IDeviceManufacturerNotificationTrigger_Interface'Class;
   type IDeviceManufacturerNotificationTrigger_Ptr is access all IDeviceManufacturerNotificationTrigger;
   type ICachedFileUpdaterTrigger_Interface;
   type ICachedFileUpdaterTrigger is access all ICachedFileUpdaterTrigger_Interface'Class;
   type ICachedFileUpdaterTrigger_Ptr is access all ICachedFileUpdaterTrigger;
   type ITimeTrigger_Interface;
   type ITimeTrigger is access all ITimeTrigger_Interface'Class;
   type ITimeTrigger_Ptr is access all ITimeTrigger;
   type IMaintenanceTrigger_Interface;
   type IMaintenanceTrigger is access all IMaintenanceTrigger_Interface'Class;
   type IMaintenanceTrigger_Ptr is access all IMaintenanceTrigger;
   type IAppointmentStoreNotificationTrigger_Interface;
   type IAppointmentStoreNotificationTrigger is access all IAppointmentStoreNotificationTrigger_Interface'Class;
   type IAppointmentStoreNotificationTrigger_Ptr is access all IAppointmentStoreNotificationTrigger;
   type IBackgroundTaskRegistration3_Interface;
   type IBackgroundTaskRegistration3 is access all IBackgroundTaskRegistration3_Interface'Class;
   type IBackgroundTaskRegistration3_Ptr is access all IBackgroundTaskRegistration3;
   type IBackgroundTaskRegistrationStatics_Interface;
   type IBackgroundTaskRegistrationStatics is access all IBackgroundTaskRegistrationStatics_Interface'Class;
   type IBackgroundTaskRegistrationStatics_Ptr is access all IBackgroundTaskRegistrationStatics;
   type IBackgroundTaskRegistrationStatics2_Interface;
   type IBackgroundTaskRegistrationStatics2 is access all IBackgroundTaskRegistrationStatics2_Interface'Class;
   type IBackgroundTaskRegistrationStatics2_Ptr is access all IBackgroundTaskRegistrationStatics2;
   type IBackgroundTaskBuilder_Interface;
   type IBackgroundTaskBuilder is access all IBackgroundTaskBuilder_Interface'Class;
   type IBackgroundTaskBuilder_Ptr is access all IBackgroundTaskBuilder;
   type IBackgroundCondition_Interface;
   type IBackgroundCondition is access all IBackgroundCondition_Interface'Class;
   type IBackgroundCondition_Ptr is access all IBackgroundCondition;
   type ISystemCondition_Interface;
   type ISystemCondition is access all ISystemCondition_Interface'Class;
   type ISystemCondition_Ptr is access all ISystemCondition;
   type IBackgroundTaskBuilder2_Interface;
   type IBackgroundTaskBuilder2 is access all IBackgroundTaskBuilder2_Interface'Class;
   type IBackgroundTaskBuilder2_Ptr is access all IBackgroundTaskBuilder2;
   type IBackgroundTaskBuilder3_Interface;
   type IBackgroundTaskBuilder3 is access all IBackgroundTaskBuilder3_Interface'Class;
   type IBackgroundTaskBuilder3_Ptr is access all IBackgroundTaskBuilder3;
   type IBackgroundTaskBuilder4_Interface;
   type IBackgroundTaskBuilder4 is access all IBackgroundTaskBuilder4_Interface'Class;
   type IBackgroundTaskBuilder4_Ptr is access all IBackgroundTaskBuilder4;
   type IBackgroundTaskCompletedEventArgs_Interface;
   type IBackgroundTaskCompletedEventArgs is access all IBackgroundTaskCompletedEventArgs_Interface'Class;
   type IBackgroundTaskCompletedEventArgs_Ptr is access all IBackgroundTaskCompletedEventArgs;
   type IBackgroundTaskProgressEventArgs_Interface;
   type IBackgroundTaskProgressEventArgs is access all IBackgroundTaskProgressEventArgs_Interface'Class;
   type IBackgroundTaskProgressEventArgs_Ptr is access all IBackgroundTaskProgressEventArgs;
   type IBackgroundTaskRegistrationGroup_Interface;
   type IBackgroundTaskRegistrationGroup is access all IBackgroundTaskRegistrationGroup_Interface'Class;
   type IBackgroundTaskRegistrationGroup_Ptr is access all IBackgroundTaskRegistrationGroup;
   type IBackgroundTaskRegistrationGroupFactory_Interface;
   type IBackgroundTaskRegistrationGroupFactory is access all IBackgroundTaskRegistrationGroupFactory_Interface'Class;
   type IBackgroundTaskRegistrationGroupFactory_Ptr is access all IBackgroundTaskRegistrationGroupFactory;
   type IChatMessageNotificationTrigger_Interface;
   type IChatMessageNotificationTrigger is access all IChatMessageNotificationTrigger_Interface'Class;
   type IChatMessageNotificationTrigger_Ptr is access all IChatMessageNotificationTrigger;
   type IChatMessageReceivedNotificationTrigger_Interface;
   type IChatMessageReceivedNotificationTrigger is access all IChatMessageReceivedNotificationTrigger_Interface'Class;
   type IChatMessageReceivedNotificationTrigger_Ptr is access all IChatMessageReceivedNotificationTrigger;
   type IRcsEndUserMessageAvailableTrigger_Interface;
   type IRcsEndUserMessageAvailableTrigger is access all IRcsEndUserMessageAvailableTrigger_Interface'Class;
   type IRcsEndUserMessageAvailableTrigger_Ptr is access all IRcsEndUserMessageAvailableTrigger;
   type IContactStoreNotificationTrigger_Interface;
   type IContactStoreNotificationTrigger is access all IContactStoreNotificationTrigger_Interface'Class;
   type IContactStoreNotificationTrigger_Ptr is access all IContactStoreNotificationTrigger;
   type IEmailStoreNotificationTrigger_Interface;
   type IEmailStoreNotificationTrigger is access all IEmailStoreNotificationTrigger_Interface'Class;
   type IEmailStoreNotificationTrigger_Ptr is access all IEmailStoreNotificationTrigger;
   type ISmsMessageReceivedTriggerFactory_Interface;
   type ISmsMessageReceivedTriggerFactory is access all ISmsMessageReceivedTriggerFactory_Interface'Class;
   type ISmsMessageReceivedTriggerFactory_Ptr is access all ISmsMessageReceivedTriggerFactory;
   type IStorageLibraryContentChangedTrigger_Interface;
   type IStorageLibraryContentChangedTrigger is access all IStorageLibraryContentChangedTrigger_Interface'Class;
   type IStorageLibraryContentChangedTrigger_Ptr is access all IStorageLibraryContentChangedTrigger;
   type IStorageLibraryContentChangedTriggerStatics_Interface;
   type IStorageLibraryContentChangedTriggerStatics is access all IStorageLibraryContentChangedTriggerStatics_Interface'Class;
   type IStorageLibraryContentChangedTriggerStatics_Ptr is access all IStorageLibraryContentChangedTriggerStatics;
   type IDeviceUseTrigger_Interface;
   type IDeviceUseTrigger is access all IDeviceUseTrigger_Interface'Class;
   type IDeviceUseTrigger_Ptr is access all IDeviceUseTrigger;
   type IDeviceServicingTrigger_Interface;
   type IDeviceServicingTrigger is access all IDeviceServicingTrigger_Interface'Class;
   type IDeviceServicingTrigger_Ptr is access all IDeviceServicingTrigger;
   type IRfcommConnectionTrigger_Interface;
   type IRfcommConnectionTrigger is access all IRfcommConnectionTrigger_Interface'Class;
   type IRfcommConnectionTrigger_Ptr is access all IRfcommConnectionTrigger;
   type IDeviceConnectionChangeTrigger_Interface;
   type IDeviceConnectionChangeTrigger is access all IDeviceConnectionChangeTrigger_Interface'Class;
   type IDeviceConnectionChangeTrigger_Ptr is access all IDeviceConnectionChangeTrigger;
   type IDeviceConnectionChangeTriggerStatics_Interface;
   type IDeviceConnectionChangeTriggerStatics is access all IDeviceConnectionChangeTriggerStatics_Interface'Class;
   type IDeviceConnectionChangeTriggerStatics_Ptr is access all IDeviceConnectionChangeTriggerStatics;
   type IGattCharacteristicNotificationTriggerFactory_Interface;
   type IGattCharacteristicNotificationTriggerFactory is access all IGattCharacteristicNotificationTriggerFactory_Interface'Class;
   type IGattCharacteristicNotificationTriggerFactory_Ptr is access all IGattCharacteristicNotificationTriggerFactory;
   type IGattCharacteristicNotificationTriggerFactory2_Interface;
   type IGattCharacteristicNotificationTriggerFactory2 is access all IGattCharacteristicNotificationTriggerFactory2_Interface'Class;
   type IGattCharacteristicNotificationTriggerFactory2_Ptr is access all IGattCharacteristicNotificationTriggerFactory2;
   type IGattCharacteristicNotificationTrigger_Interface;
   type IGattCharacteristicNotificationTrigger is access all IGattCharacteristicNotificationTrigger_Interface'Class;
   type IGattCharacteristicNotificationTrigger_Ptr is access all IGattCharacteristicNotificationTrigger;
   type IGattCharacteristicNotificationTrigger2_Interface;
   type IGattCharacteristicNotificationTrigger2 is access all IGattCharacteristicNotificationTrigger2_Interface'Class;
   type IGattCharacteristicNotificationTrigger2_Ptr is access all IGattCharacteristicNotificationTrigger2;
   type IGattServiceProviderTriggerResult_Interface;
   type IGattServiceProviderTriggerResult is access all IGattServiceProviderTriggerResult_Interface'Class;
   type IGattServiceProviderTriggerResult_Ptr is access all IGattServiceProviderTriggerResult;
   type IGattServiceProviderTriggerStatics_Interface;
   type IGattServiceProviderTriggerStatics is access all IGattServiceProviderTriggerStatics_Interface'Class;
   type IGattServiceProviderTriggerStatics_Ptr is access all IGattServiceProviderTriggerStatics;
   type IGattServiceProviderTrigger_Interface;
   type IGattServiceProviderTrigger is access all IGattServiceProviderTrigger_Interface'Class;
   type IGattServiceProviderTrigger_Ptr is access all IGattServiceProviderTrigger;
   type IBluetoothLEAdvertisementWatcherTrigger_Interface;
   type IBluetoothLEAdvertisementWatcherTrigger is access all IBluetoothLEAdvertisementWatcherTrigger_Interface'Class;
   type IBluetoothLEAdvertisementWatcherTrigger_Ptr is access all IBluetoothLEAdvertisementWatcherTrigger;
   type IBluetoothLEAdvertisementPublisherTrigger_Interface;
   type IBluetoothLEAdvertisementPublisherTrigger is access all IBluetoothLEAdvertisementPublisherTrigger_Interface'Class;
   type IBluetoothLEAdvertisementPublisherTrigger_Ptr is access all IBluetoothLEAdvertisementPublisherTrigger;
   type IDeviceWatcherTrigger_Interface;
   type IDeviceWatcherTrigger is access all IDeviceWatcherTrigger_Interface'Class;
   type IDeviceWatcherTrigger_Ptr is access all IDeviceWatcherTrigger;
   type ILocationTrigger_Interface;
   type ILocationTrigger is access all ILocationTrigger_Interface'Class;
   type ILocationTrigger_Ptr is access all ILocationTrigger;
   type ILocationTriggerFactory_Interface;
   type ILocationTriggerFactory is access all ILocationTriggerFactory_Interface'Class;
   type ILocationTriggerFactory_Ptr is access all ILocationTriggerFactory;
   type IGeovisitTrigger_Interface;
   type IGeovisitTrigger is access all IGeovisitTrigger_Interface'Class;
   type IGeovisitTrigger_Ptr is access all IGeovisitTrigger;
   type IActivitySensorTrigger_Interface;
   type IActivitySensorTrigger is access all IActivitySensorTrigger_Interface'Class;
   type IActivitySensorTrigger_Ptr is access all IActivitySensorTrigger;
   type IActivitySensorTriggerFactory_Interface;
   type IActivitySensorTriggerFactory is access all IActivitySensorTriggerFactory_Interface'Class;
   type IActivitySensorTriggerFactory_Ptr is access all IActivitySensorTriggerFactory;
   type ISensorDataThresholdTrigger_Interface;
   type ISensorDataThresholdTrigger is access all ISensorDataThresholdTrigger_Interface'Class;
   type ISensorDataThresholdTrigger_Ptr is access all ISensorDataThresholdTrigger;
   type ISensorDataThresholdTriggerFactory_Interface;
   type ISensorDataThresholdTriggerFactory is access all ISensorDataThresholdTriggerFactory_Interface'Class;
   type ISensorDataThresholdTriggerFactory_Ptr is access all ISensorDataThresholdTriggerFactory;
   type INetworkOperatorHotspotAuthenticationTrigger_Interface;
   type INetworkOperatorHotspotAuthenticationTrigger is access all INetworkOperatorHotspotAuthenticationTrigger_Interface'Class;
   type INetworkOperatorHotspotAuthenticationTrigger_Ptr is access all INetworkOperatorHotspotAuthenticationTrigger;
   type ISocketActivityTrigger_Interface;
   type ISocketActivityTrigger is access all ISocketActivityTrigger_Interface'Class;
   type ISocketActivityTrigger_Ptr is access all ISocketActivityTrigger;
   type IPushNotificationTriggerFactory_Interface;
   type IPushNotificationTriggerFactory is access all IPushNotificationTriggerFactory_Interface'Class;
   type IPushNotificationTriggerFactory_Ptr is access all IPushNotificationTriggerFactory;
   type IToastNotificationHistoryChangedTriggerFactory_Interface;
   type IToastNotificationHistoryChangedTriggerFactory is access all IToastNotificationHistoryChangedTriggerFactory_Interface'Class;
   type IToastNotificationHistoryChangedTriggerFactory_Ptr is access all IToastNotificationHistoryChangedTriggerFactory;
   type IToastNotificationActionTriggerFactory_Interface;
   type IToastNotificationActionTriggerFactory is access all IToastNotificationActionTriggerFactory_Interface'Class;
   type IToastNotificationActionTriggerFactory_Ptr is access all IToastNotificationActionTriggerFactory;
   type IUserNotificationChangedTriggerFactory_Interface;
   type IUserNotificationChangedTriggerFactory is access all IUserNotificationChangedTriggerFactory_Interface'Class;
   type IUserNotificationChangedTriggerFactory_Ptr is access all IUserNotificationChangedTriggerFactory;
   type IAppBroadcastTriggerProviderInfo_Interface;
   type IAppBroadcastTriggerProviderInfo is access all IAppBroadcastTriggerProviderInfo_Interface'Class;
   type IAppBroadcastTriggerProviderInfo_Ptr is access all IAppBroadcastTriggerProviderInfo;
   type IAppBroadcastTriggerFactory_Interface;
   type IAppBroadcastTriggerFactory is access all IAppBroadcastTriggerFactory_Interface'Class;
   type IAppBroadcastTriggerFactory_Ptr is access all IAppBroadcastTriggerFactory;
   type IAppBroadcastTrigger_Interface;
   type IAppBroadcastTrigger is access all IAppBroadcastTrigger_Interface'Class;
   type IAppBroadcastTrigger_Ptr is access all IAppBroadcastTrigger;
   type IAsyncOperation_AlarmAccessStatus_Interface;
   type IAsyncOperation_AlarmAccessStatus is access all IAsyncOperation_AlarmAccessStatus_Interface'Class;
   type IAsyncOperation_AlarmAccessStatus_Ptr is access all IAsyncOperation_AlarmAccessStatus;
   type IAsyncOperation_BackgroundAccessStatus_Interface;
   type IAsyncOperation_BackgroundAccessStatus is access all IAsyncOperation_BackgroundAccessStatus_Interface'Class;
   type IAsyncOperation_BackgroundAccessStatus_Ptr is access all IAsyncOperation_BackgroundAccessStatus;
   type IAsyncOperation_ApplicationTriggerResult_Interface;
   type IAsyncOperation_ApplicationTriggerResult is access all IAsyncOperation_ApplicationTriggerResult_Interface'Class;
   type IAsyncOperation_ApplicationTriggerResult_Ptr is access all IAsyncOperation_ApplicationTriggerResult;
   type IAsyncOperation_MediaProcessingTriggerResult_Interface;
   type IAsyncOperation_MediaProcessingTriggerResult is access all IAsyncOperation_MediaProcessingTriggerResult_Interface'Class;
   type IAsyncOperation_MediaProcessingTriggerResult_Ptr is access all IAsyncOperation_MediaProcessingTriggerResult;
   type IAsyncOperation_DeviceTriggerResult_Interface;
   type IAsyncOperation_DeviceTriggerResult is access all IAsyncOperation_DeviceTriggerResult_Interface'Class;
   type IAsyncOperation_DeviceTriggerResult_Ptr is access all IAsyncOperation_DeviceTriggerResult;
   type IAsyncOperation_IDeviceConnectionChangeTrigger_Interface;
   type IAsyncOperation_IDeviceConnectionChangeTrigger is access all IAsyncOperation_IDeviceConnectionChangeTrigger_Interface'Class;
   type IAsyncOperation_IDeviceConnectionChangeTrigger_Ptr is access all IAsyncOperation_IDeviceConnectionChangeTrigger;
   type IAsyncOperation_IGattServiceProviderTriggerResult_Interface;
   type IAsyncOperation_IGattServiceProviderTriggerResult is access all IAsyncOperation_IGattServiceProviderTriggerResult_Interface'Class;
   type IAsyncOperation_IGattServiceProviderTriggerResult_Ptr is access all IAsyncOperation_IGattServiceProviderTriggerResult;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAlarmApplicationManagerStatics : aliased constant Windows.IID := (3389258299, 52454, 19938, (176, 155, 150, 40, 189, 51, 187, 190 ));
   
   type IAlarmApplicationManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAccessAsync
   (
      This       : access IAlarmApplicationManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_AlarmAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAccessStatus
   (
      This       : access IAlarmApplicationManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Background.AlarmAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPhoneTriggerFactory : aliased constant Windows.IID := (2698591450, 24513, 18683, (165, 70, 50, 38, 32, 64, 21, 123 ));
   
   type IPhoneTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPhoneTriggerFactory_Interface
      ; type_x : Windows.ApplicationModel.Calls.Background.PhoneTriggerType
      ; oneShot : Windows.Boolean
      ; RetVal : access Windows.ApplicationModel.Background.IPhoneTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISmartCardTriggerFactory : aliased constant Windows.IID := (1673483459, 35265, 19968, (169, 211, 151, 198, 41, 38, 157, 173 ));
   
   type ISmartCardTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISmartCardTriggerFactory_Interface
      ; triggerType : Windows.Devices.SmartCards.SmartCardTriggerType
      ; RetVal : access Windows.ApplicationModel.Background.ISmartCardTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationTriggerDetails : aliased constant Windows.IID := (2547804850, 8729, 19102, (156, 94, 65, 208, 71, 247, 110, 130 ));
   
   type IApplicationTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Arguments
   (
      This       : access IApplicationTriggerDetails_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContentPrefetchTriggerFactory : aliased constant Windows.IID := (3261349594, 35331, 16542, (184, 196, 136, 129, 76, 40, 204, 182 ));
   
   type IContentPrefetchTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IContentPrefetchTriggerFactory_Interface
      ; waitInterval : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.ApplicationModel.Background.IContentPrefetchTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISystemTriggerFactory : aliased constant Windows.IID := (3892585428, 34705, 17785, (129, 38, 135, 236, 138, 170, 64, 122 ));
   
   type ISystemTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISystemTriggerFactory_Interface
      ; triggerType : Windows.ApplicationModel.Background.SystemTriggerType
      ; oneShot : Windows.Boolean
      ; RetVal : access Windows.ApplicationModel.Background.ISystemTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISystemConditionFactory : aliased constant Windows.IID := (3530150385, 1447, 18862, (135, 215, 22, 178, 184, 185, 165, 83 ));
   
   type ISystemConditionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISystemConditionFactory_Interface
      ; conditionType : Windows.ApplicationModel.Background.SystemConditionType
      ; RetVal : access Windows.ApplicationModel.Background.ISystemCondition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorNotificationTriggerFactory : aliased constant Windows.IID := (170016256, 10199, 17235, (173, 185, 146, 101, 170, 234, 87, 157 ));
   
   type INetworkOperatorNotificationTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access INetworkOperatorNotificationTriggerFactory_Interface
      ; networkAccountId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.INetworkOperatorNotificationTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceManufacturerNotificationTriggerFactory : aliased constant Windows.IID := (2035670645, 9659, 16723, (161, 162, 48, 41, 252, 171, 182, 82 ));
   
   type IDeviceManufacturerNotificationTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IDeviceManufacturerNotificationTriggerFactory_Interface
      ; triggerQualifier : Windows.String
      ; oneShot : Windows.Boolean
      ; RetVal : access Windows.ApplicationModel.Background.IDeviceManufacturerNotificationTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICachedFileUpdaterTriggerDetails : aliased constant Windows.IID := (1904446483, 4884, 18356, (149, 151, 220, 126, 36, 140, 23, 204 ));
   
   type ICachedFileUpdaterTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UpdateTarget
   (
      This       : access ICachedFileUpdaterTriggerDetails_Interface
      ; RetVal : access Windows.Storage.Provider.CachedFileTarget
   )
   return Windows.HRESULT is abstract;
   
   function get_UpdateRequest
   (
      This       : access ICachedFileUpdaterTriggerDetails_Interface
      ; RetVal : access Windows.Storage.Provider.IFileUpdateRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRequestUserInput
   (
      This       : access ICachedFileUpdaterTriggerDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITimeTriggerFactory : aliased constant Windows.IID := (952533758, 39764, 17894, (178, 243, 38, 155, 135, 166, 247, 52 ));
   
   type ITimeTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ITimeTriggerFactory_Interface
      ; freshnessTime : Windows.UInt32
      ; oneShot : Windows.Boolean
      ; RetVal : access Windows.ApplicationModel.Background.ITimeTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMaintenanceTriggerFactory : aliased constant Windows.IID := (1262345006, 38877, 17961, (136, 176, 176, 108, 249, 72, 42, 229 ));
   
   type IMaintenanceTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IMaintenanceTriggerFactory_Interface
      ; freshnessTime : Windows.UInt32
      ; oneShot : Windows.Boolean
      ; RetVal : access Windows.ApplicationModel.Background.IMaintenanceTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundExecutionManagerStatics : aliased constant Windows.IID := (3894864472, 26281, 19777, (131, 212, 180, 193, 140, 135, 184, 70 ));
   
   type IBackgroundExecutionManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAccessAsync
   (
      This       : access IBackgroundExecutionManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessForApplicationAsync
   (
      This       : access IBackgroundExecutionManagerStatics_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAccess
   (
      This       : access IBackgroundExecutionManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAccessForApplication
   (
      This       : access IBackgroundExecutionManagerStatics_Interface
      ; applicationId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetAccessStatus
   (
      This       : access IBackgroundExecutionManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Background.BackgroundAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetAccessStatusForApplication
   (
      This       : access IBackgroundExecutionManagerStatics_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.BackgroundAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskInstance : aliased constant Windows.IID := (2254166650, 8664, 17779, (143, 50, 146, 138, 27, 6, 65, 246 ));
   
   type IBackgroundTaskInstance_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InstanceId
   (
      This       : access IBackgroundTaskInstance_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Task
   (
      This       : access IBackgroundTaskInstance_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskRegistration
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IBackgroundTaskInstance_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Progress
   (
      This       : access IBackgroundTaskInstance_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TriggerDetails
   (
      This       : access IBackgroundTaskInstance_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function add_Canceled
   (
      This       : access IBackgroundTaskInstance_Interface
      ; cancelHandler : Windows.ApplicationModel.Background.BackgroundTaskCanceledEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Canceled
   (
      This       : access IBackgroundTaskInstance_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_SuspendedCount
   (
      This       : access IBackgroundTaskInstance_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBackgroundTaskInstance_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundWorkCostStatics : aliased constant Windows.IID := (3342902882, 49936, 19330, (179, 227, 59, 207, 185, 228, 199, 125 ));
   
   type IBackgroundWorkCostStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentBackgroundWorkCost
   (
      This       : access IBackgroundWorkCostStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Background.BackgroundWorkCostValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskDeferral : aliased constant Windows.IID := (2479625581, 44839, 19923, (132, 110, 36, 238, 64, 202, 221, 37 ));
   
   type IBackgroundTaskDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IBackgroundTaskDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskInstance2 : aliased constant Windows.IID := (1333592438, 3190, 20404, (137, 109, 93, 225, 134, 65, 34, 246 ));
   
   type IBackgroundTaskInstance2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetThrottleCount
   (
      This       : access IBackgroundTaskInstance2_Interface
      ; counter : Windows.ApplicationModel.Background.BackgroundTaskThrottleCounter
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskInstance4 : aliased constant Windows.IID := (2133455420, 43524, 19208, (151, 176, 6, 216, 116, 205, 171, 245 ));
   
   type IBackgroundTaskInstance4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IBackgroundTaskInstance4_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTask : aliased constant Windows.IID := (2098451764, 64786, 17358, (140, 34, 234, 31, 241, 60, 6, 223 ));
   
   type IBackgroundTask_Interface is interface and Windows.IInspectable_Interface;
   
   function Run
   (
      This       : access IBackgroundTask_Interface
      ; taskInstance : Windows.ApplicationModel.Background.IBackgroundTaskInstance
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskRegistration : aliased constant Windows.IID := (275074242, 41582, 17343, (140, 18, 31, 180, 13, 191, 191, 160 ));
   
   type IBackgroundTaskRegistration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskId
   (
      This       : access IBackgroundTaskRegistration_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IBackgroundTaskRegistration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_Progress
   (
      This       : access IBackgroundTaskRegistration_Interface
      ; handler : Windows.ApplicationModel.Background.BackgroundTaskProgressEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Progress
   (
      This       : access IBackgroundTaskRegistration_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Completed
   (
      This       : access IBackgroundTaskRegistration_Interface
      ; handler : Windows.ApplicationModel.Background.BackgroundTaskCompletedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Completed
   (
      This       : access IBackgroundTaskRegistration_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Unregister
   (
      This       : access IBackgroundTaskRegistration_Interface
      ; cancelTask : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskRegistration2 : aliased constant Windows.IID := (1631110915, 48006, 16658, (175, 195, 127, 147, 155, 22, 110, 59 ));
   
   type IBackgroundTaskRegistration2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Trigger
   (
      This       : access IBackgroundTaskRegistration2_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTrigger : aliased constant Windows.IID := (2226364504, 24615, 19335, (151, 144, 189, 243, 247, 87, 219, 215 ));
   
   type IBackgroundTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IPhoneTrigger : aliased constant Windows.IID := (2379213211, 54469, 18929, (183, 211, 130, 232, 122, 14, 157, 222 ));
   
   type IPhoneTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OneShot
   (
      This       : access IPhoneTrigger_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TriggerType
   (
      This       : access IPhoneTrigger_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.Background.PhoneTriggerType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICommunicationBlockingAppSetAsActiveTrigger : aliased constant Windows.IID := (4220646026, 5797, 18541, (151, 76, 120, 53, 168, 71, 123, 226 ));
   
   type ICommunicationBlockingAppSetAsActiveTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISmartCardTrigger : aliased constant Windows.IID := (4114335148, 33994, 18802, (140, 233, 229, 143, 151, 179, 122, 80 ));
   
   type ISmartCardTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TriggerType
   (
      This       : access ISmartCardTrigger_Interface
      ; RetVal : access Windows.Devices.SmartCards.SmartCardTriggerType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationTrigger : aliased constant Windows.IID := (189171248, 38260, 18732, (158, 147, 26, 58, 230, 51, 95, 233 ));
   
   type IApplicationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAsync
   (
      This       : access IApplicationTrigger_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_ApplicationTriggerResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAsyncWithArguments
   (
      This       : access IApplicationTrigger_Interface
      ; arguments : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_ApplicationTriggerResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaProcessingTrigger : aliased constant Windows.IID := (2593504869, 35410, 19248, (144, 17, 207, 56, 4, 14, 168, 176 ));
   
   type IMediaProcessingTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAsync
   (
      This       : access IMediaProcessingTrigger_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_MediaProcessingTriggerResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAsyncWithArguments
   (
      This       : access IMediaProcessingTrigger_Interface
      ; arguments : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_MediaProcessingTriggerResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContentPrefetchTrigger : aliased constant Windows.IID := (1896228846, 1274, 17419, (128, 192, 23, 50, 2, 25, 158, 93 ));
   
   type IContentPrefetchTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WaitInterval
   (
      This       : access IContentPrefetchTrigger_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorAuthenticationTrigger : aliased constant Windows.IID := (4063752999, 20865, 20260, (150, 167, 112, 10, 78, 95, 172, 98 ));
   
   type ISecondaryAuthenticationFactorAuthenticationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISystemTrigger : aliased constant Windows.IID := (494978934, 14152, 17507, (141, 126, 39, 109, 193, 57, 172, 28 ));
   
   type ISystemTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OneShot
   (
      This       : access ISystemTrigger_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TriggerType
   (
      This       : access ISystemTrigger_Interface
      ; RetVal : access Windows.ApplicationModel.Background.SystemTriggerType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorNotificationTrigger : aliased constant Windows.IID := (2416483526, 25549, 18444, (149, 209, 110, 106, 239, 128, 30, 74 ));
   
   type INetworkOperatorNotificationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkAccountId
   (
      This       : access INetworkOperatorNotificationTrigger_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceManufacturerNotificationTrigger : aliased constant Windows.IID := (2166852277, 16811, 5850, (134, 194, 127, 123, 240, 145, 47, 91 ));
   
   type IDeviceManufacturerNotificationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TriggerQualifier
   (
      This       : access IDeviceManufacturerNotificationTrigger_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OneShot
   (
      This       : access IDeviceManufacturerNotificationTrigger_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICachedFileUpdaterTrigger : aliased constant Windows.IID := (3793530603, 13042, 19761, (181, 83, 185, 224, 27, 222, 55, 224 ));
   
   type ICachedFileUpdaterTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITimeTrigger : aliased constant Windows.IID := (1701729622, 2858, 17271, (186, 112, 59, 69, 169, 53, 84, 127 ));
   
   type ITimeTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FreshnessTime
   (
      This       : access ITimeTrigger_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_OneShot
   (
      This       : access ITimeTrigger_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMaintenanceTrigger : aliased constant Windows.IID := (1746422915, 64546, 19685, (132, 26, 114, 57, 169, 129, 0, 71 ));
   
   type IMaintenanceTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FreshnessTime
   (
      This       : access IMaintenanceTrigger_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_OneShot
   (
      This       : access IMaintenanceTrigger_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentStoreNotificationTrigger : aliased constant Windows.IID := (1691616268, 49665, 17069, (170, 42, 226, 27, 163, 66, 91, 109 ));
   
   type IAppointmentStoreNotificationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskRegistration3 : aliased constant Windows.IID := (4264788373, 37923, 19851, (131, 13, 177, 221, 44, 123, 173, 213 ));
   
   type IBackgroundTaskRegistration3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskGroup
   (
      This       : access IBackgroundTaskRegistration3_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskRegistrationStatics : aliased constant Windows.IID := (1280585577, 45056, 17082, (160, 147, 106, 86, 60, 101, 227, 248 ));
   
   type IBackgroundTaskRegistrationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllTasks
   (
      This       : access IBackgroundTaskRegistrationStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskRegistrationStatics2 : aliased constant Windows.IID := (390817566, 45581, 20393, (173, 154, 233, 58, 214, 199, 30, 1 ));
   
   type IBackgroundTaskRegistrationStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllTaskGroups
   (
      This       : access IBackgroundTaskRegistrationStatics2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetTaskGroup
   (
      This       : access IBackgroundTaskRegistrationStatics2_Interface
      ; groupId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskBuilder : aliased constant Windows.IID := (55661838, 15972, 17778, (169, 58, 132, 7, 90, 55, 201, 23 ));
   
   type IBackgroundTaskBuilder_Interface is interface and Windows.IInspectable_Interface;
   
   function put_TaskEntryPoint
   (
      This       : access IBackgroundTaskBuilder_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TaskEntryPoint
   (
      This       : access IBackgroundTaskBuilder_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetTrigger
   (
      This       : access IBackgroundTaskBuilder_Interface
      ; trigger : Windows.ApplicationModel.Background.IBackgroundTrigger
   )
   return Windows.HRESULT is abstract;
   
   function AddCondition
   (
      This       : access IBackgroundTaskBuilder_Interface
      ; condition : Windows.ApplicationModel.Background.IBackgroundCondition
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IBackgroundTaskBuilder_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IBackgroundTaskBuilder_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Register
   (
      This       : access IBackgroundTaskBuilder_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskRegistration
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundCondition : aliased constant Windows.IID := (2923995630, 35153, 16394, (131, 2, 156, 156, 154, 42, 58, 59 ));
   
   type IBackgroundCondition_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISystemCondition : aliased constant Windows.IID := (3244274806, 35269, 16907, (171, 211, 251, 48, 48, 71, 33, 40 ));
   
   type ISystemCondition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConditionType
   (
      This       : access ISystemCondition_Interface
      ; RetVal : access Windows.ApplicationModel.Background.SystemConditionType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskBuilder2 : aliased constant Windows.IID := (1793576881, 4175, 16493, (141, 182, 132, 74, 87, 15, 66, 187 ));
   
   type IBackgroundTaskBuilder2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_CancelOnConditionLoss
   (
      This       : access IBackgroundTaskBuilder2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CancelOnConditionLoss
   (
      This       : access IBackgroundTaskBuilder2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskBuilder3 : aliased constant Windows.IID := (684150602, 35753, 19465, (162, 79, 25, 104, 62, 44, 146, 76 ));
   
   type IBackgroundTaskBuilder3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsNetworkRequested
   (
      This       : access IBackgroundTaskBuilder3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsNetworkRequested
   (
      This       : access IBackgroundTaskBuilder3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskBuilder4 : aliased constant Windows.IID := (1196811554, 52130, 20021, (189, 22, 166, 218, 127, 28, 25, 170 ));
   
   type IBackgroundTaskBuilder4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskGroup
   (
      This       : access IBackgroundTaskBuilder4_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup
   )
   return Windows.HRESULT is abstract;
   
   function put_TaskGroup
   (
      This       : access IBackgroundTaskBuilder4_Interface
      ; value : Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskCompletedEventArgs : aliased constant Windows.IID := (1448945103, 61961, 18676, (153, 103, 43, 24, 79, 123, 251, 240 ));
   
   type IBackgroundTaskCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InstanceId
   (
      This       : access IBackgroundTaskCompletedEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function CheckResult
   (
      This       : access IBackgroundTaskCompletedEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskProgressEventArgs : aliased constant Windows.IID := (4212418732, 33586, 19722, (149, 50, 3, 234, 230, 132, 218, 49 ));
   
   type IBackgroundTaskProgressEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InstanceId
   (
      This       : access IBackgroundTaskProgressEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IBackgroundTaskProgressEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskRegistrationGroup : aliased constant Windows.IID := (716280218, 34587, 16743, (138, 118, 5, 92, 214, 123, 91, 35 ));
   
   type IBackgroundTaskRegistrationGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IBackgroundTaskRegistrationGroup_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IBackgroundTaskRegistrationGroup_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_BackgroundActivated
   (
      This       : access IBackgroundTaskRegistrationGroup_Interface
      ; handler : TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BackgroundActivated
   (
      This       : access IBackgroundTaskRegistrationGroup_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_AllTasks
   (
      This       : access IBackgroundTaskRegistrationGroup_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundTaskRegistrationGroupFactory : aliased constant Windows.IID := (2212047721, 17615, 17969, (151, 64, 3, 199, 216, 116, 27, 197 ));
   
   type IBackgroundTaskRegistrationGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IBackgroundTaskRegistrationGroupFactory_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithName
   (
      This       : access IBackgroundTaskRegistrationGroupFactory_Interface
      ; id : Windows.String
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageNotificationTrigger : aliased constant Windows.IID := (1362838463, 7488, 23645, (120, 245, 201, 35, 254, 227, 115, 158 ));
   
   type IChatMessageNotificationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageReceivedNotificationTrigger : aliased constant Windows.IID := (1050899982, 47861, 16503, (136, 233, 6, 12, 246, 240, 198, 213 ));
   
   type IChatMessageReceivedNotificationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRcsEndUserMessageAvailableTrigger : aliased constant Windows.IID := (2557283690, 45814, 18047, (169, 120, 164, 64, 145, 193, 26, 102 ));
   
   type IRcsEndUserMessageAvailableTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IContactStoreNotificationTrigger : aliased constant Windows.IID := (3358802331, 18181, 17777, (154, 22, 6, 185, 151, 191, 156, 150 ));
   
   type IContactStoreNotificationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IEmailStoreNotificationTrigger : aliased constant Windows.IID := (2557282010, 18411, 17000, (164, 242, 243, 247, 113, 136, 56, 138 ));
   
   type IEmailStoreNotificationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISmsMessageReceivedTriggerFactory : aliased constant Windows.IID := (3929725128, 27556, 19122, (141, 33, 188, 107, 9, 199, 117, 100 ));
   
   type ISmsMessageReceivedTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISmsMessageReceivedTriggerFactory_Interface
      ; filterRules : Windows.Devices.Sms.ISmsFilterRules
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStorageLibraryContentChangedTrigger : aliased constant Windows.IID := (372760743, 33436, 17852, (146, 155, 161, 231, 234, 120, 216, 155 ));
   
   type IStorageLibraryContentChangedTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IStorageLibraryContentChangedTriggerStatics : aliased constant Windows.IID := (2141133625, 24464, 19986, (145, 78, 167, 216, 224, 187, 251, 24 ));
   
   type IStorageLibraryContentChangedTriggerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IStorageLibraryContentChangedTriggerStatics_Interface
      ; storageLibrary : Windows.Storage.IStorageLibrary
      ; RetVal : access Windows.ApplicationModel.Background.IStorageLibraryContentChangedTrigger
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromLibraries
   (
      This       : access IStorageLibraryContentChangedTriggerStatics_Interface
      ; storageLibraries : Windows.Storage.IIterable_IStorageLibrary
      ; RetVal : access Windows.ApplicationModel.Background.IStorageLibraryContentChangedTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceUseTrigger : aliased constant Windows.IID := (229015569, 13135, 19799, (182, 236, 109, 202, 100, 180, 18, 228 ));
   
   type IDeviceUseTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAsyncSimple
   (
      This       : access IDeviceUseTrigger_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_DeviceTriggerResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAsyncWithArguments
   (
      This       : access IDeviceUseTrigger_Interface
      ; deviceId : Windows.String
      ; arguments : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_DeviceTriggerResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceServicingTrigger : aliased constant Windows.IID := (447879085, 28212, 18899, (158, 111, 23, 241, 182, 223, 168, 129 ));
   
   type IDeviceServicingTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAsyncSimple
   (
      This       : access IDeviceServicingTrigger_Interface
      ; deviceId : Windows.String
      ; expectedDuration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_DeviceTriggerResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAsyncWithArguments
   (
      This       : access IDeviceServicingTrigger_Interface
      ; deviceId : Windows.String
      ; expectedDuration : Windows.Foundation.TimeSpan
      ; arguments : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_DeviceTriggerResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRfcommConnectionTrigger : aliased constant Windows.IID := (3905211106, 2899, 17508, (147, 148, 253, 135, 86, 84, 222, 100 ));
   
   type IRfcommConnectionTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InboundConnection
   (
      This       : access IRfcommConnectionTrigger_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Background.IRfcommInboundConnectionInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_OutboundConnection
   (
      This       : access IRfcommConnectionTrigger_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Background.IRfcommOutboundConnectionInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowMultipleConnections
   (
      This       : access IRfcommConnectionTrigger_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowMultipleConnections
   (
      This       : access IRfcommConnectionTrigger_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionLevel
   (
      This       : access IRfcommConnectionTrigger_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function put_ProtectionLevel
   (
      This       : access IRfcommConnectionTrigger_Interface
      ; value : Windows.Networking.Sockets.SocketProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteHostName
   (
      This       : access IRfcommConnectionTrigger_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteHostName
   (
      This       : access IRfcommConnectionTrigger_Interface
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceConnectionChangeTrigger : aliased constant Windows.IID := (2424790628, 15581, 20219, (171, 28, 91, 59, 106, 96, 206, 52 ));
   
   type IDeviceConnectionChangeTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IDeviceConnectionChangeTrigger_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CanMaintainConnection
   (
      This       : access IDeviceConnectionChangeTrigger_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaintainConnection
   (
      This       : access IDeviceConnectionChangeTrigger_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_MaintainConnection
   (
      This       : access IDeviceConnectionChangeTrigger_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceConnectionChangeTriggerStatics : aliased constant Windows.IID := (3286901866, 20221, 17560, (170, 96, 164, 228, 227, 177, 122, 185 ));
   
   type IDeviceConnectionChangeTriggerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IDeviceConnectionChangeTriggerStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_IDeviceConnectionChangeTrigger -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristicNotificationTriggerFactory : aliased constant Windows.IID := (1471814037, 45379, 17781, (159, 107, 253, 89, 217, 58, 206, 26 ));
   
   type IGattCharacteristicNotificationTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IGattCharacteristicNotificationTriggerFactory_Interface
      ; characteristic : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
      ; RetVal : access Windows.ApplicationModel.Background.IGattCharacteristicNotificationTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristicNotificationTriggerFactory2 : aliased constant Windows.IID := (1503193375, 35411, 20127, (163, 44, 35, 205, 51, 102, 76, 238 ));
   
   type IGattCharacteristicNotificationTriggerFactory2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithEventTriggeringMode
   (
      This       : access IGattCharacteristicNotificationTriggerFactory2_Interface
      ; characteristic : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
      ; eventTriggeringMode : Windows.Devices.Bluetooth.Background.BluetoothEventTriggeringMode
      ; RetVal : access Windows.ApplicationModel.Background.IGattCharacteristicNotificationTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristicNotificationTrigger : aliased constant Windows.IID := (3797913544, 1686, 18255, (167, 50, 242, 146, 176, 206, 188, 93 ));
   
   type IGattCharacteristicNotificationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Characteristic
   (
      This       : access IGattCharacteristicNotificationTrigger_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristicNotificationTrigger2 : aliased constant Windows.IID := (2468520644, 44558, 17138, (178, 140, 245, 19, 114, 230, 146, 69 ));
   
   type IGattCharacteristicNotificationTrigger2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EventTriggeringMode
   (
      This       : access IGattCharacteristicNotificationTrigger2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Background.BluetoothEventTriggeringMode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattServiceProviderTriggerResult : aliased constant Windows.IID := (1011257777, 45464, 20100, (186, 212, 207, 74, 210, 153, 237, 58 ));
   
   type IGattServiceProviderTriggerResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Trigger
   (
      This       : access IGattServiceProviderTriggerResult_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IGattServiceProviderTrigger
   )
   return Windows.HRESULT is abstract;
   
   function get_Error
   (
      This       : access IGattServiceProviderTriggerResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattServiceProviderTriggerStatics : aliased constant Windows.IID := (3021185898, 58004, 17809, (165, 166, 100, 137, 26, 130, 129, 83 ));
   
   type IGattServiceProviderTriggerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAsync
   (
      This       : access IGattServiceProviderTriggerStatics_Interface
      ; triggerId : Windows.String
      ; serviceUuid : Windows.Guid
      ; RetVal : access Windows.ApplicationModel.Background.IAsyncOperation_IGattServiceProviderTriggerResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattServiceProviderTrigger : aliased constant Windows.IID := (3720782825, 5463, 19416, (133, 66, 70, 138, 160, 198, 150, 246 ));
   
   type IGattServiceProviderTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TriggerId
   (
      This       : access IGattServiceProviderTrigger_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Service
   (
      This       : access IGattServiceProviderTrigger_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalService
   )
   return Windows.HRESULT is abstract;
   
   function put_AdvertisingParameters
   (
      This       : access IGattServiceProviderTrigger_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters
   )
   return Windows.HRESULT is abstract;
   
   function get_AdvertisingParameters
   (
      This       : access IGattServiceProviderTrigger_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementWatcherTrigger : aliased constant Windows.IID := (447420441, 48353, 18667, (168, 39, 89, 251, 124, 238, 82, 166 ));
   
   type IBluetoothLEAdvertisementWatcherTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinSamplingInterval
   (
      This       : access IBluetoothLEAdvertisementWatcherTrigger_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSamplingInterval
   (
      This       : access IBluetoothLEAdvertisementWatcherTrigger_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MinOutOfRangeTimeout
   (
      This       : access IBluetoothLEAdvertisementWatcherTrigger_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxOutOfRangeTimeout
   (
      This       : access IBluetoothLEAdvertisementWatcherTrigger_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_SignalStrengthFilter
   (
      This       : access IBluetoothLEAdvertisementWatcherTrigger_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter
   )
   return Windows.HRESULT is abstract;
   
   function put_SignalStrengthFilter
   (
      This       : access IBluetoothLEAdvertisementWatcherTrigger_Interface
      ; value : Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter
   )
   return Windows.HRESULT is abstract;
   
   function get_AdvertisementFilter
   (
      This       : access IBluetoothLEAdvertisementWatcherTrigger_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementFilter
   )
   return Windows.HRESULT is abstract;
   
   function put_AdvertisementFilter
   (
      This       : access IBluetoothLEAdvertisementWatcherTrigger_Interface
      ; value : Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisementFilter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBluetoothLEAdvertisementPublisherTrigger : aliased constant Windows.IID := (2872976914, 9683, 18606, (135, 36, 216, 24, 119, 174, 97, 41 ));
   
   type IBluetoothLEAdvertisementPublisherTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Advertisement
   (
      This       : access IBluetoothLEAdvertisementPublisherTrigger_Interface
      ; RetVal : access Windows.Devices.Bluetooth.Advertisement.IBluetoothLEAdvertisement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceWatcherTrigger : aliased constant Windows.IID := (2757853149, 34163, 16992, (190, 252, 91, 236, 137, 203, 105, 61 ));
   
   type IDeviceWatcherTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ILocationTrigger : aliased constant Windows.IID := (1197894172, 26743, 18462, (128, 38, 255, 126, 20, 168, 17, 160 ));
   
   type ILocationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TriggerType
   (
      This       : access ILocationTrigger_Interface
      ; RetVal : access Windows.ApplicationModel.Background.LocationTriggerType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILocationTriggerFactory : aliased constant Windows.IID := (285653767, 65385, 19977, (170, 139, 19, 132, 234, 71, 94, 152 ));
   
   type ILocationTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ILocationTriggerFactory_Interface
      ; triggerType : Windows.ApplicationModel.Background.LocationTriggerType
      ; RetVal : access Windows.ApplicationModel.Background.ILocationTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGeovisitTrigger : aliased constant Windows.IID := (1209593258, 1249, 16679, (154, 76, 25, 53, 27, 138, 128, 164 ));
   
   type IGeovisitTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MonitoringScope
   (
      This       : access IGeovisitTrigger_Interface
      ; RetVal : access Windows.Devices.Geolocation.VisitMonitoringScope
   )
   return Windows.HRESULT is abstract;
   
   function put_MonitoringScope
   (
      This       : access IGeovisitTrigger_Interface
      ; value : Windows.Devices.Geolocation.VisitMonitoringScope
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivitySensorTrigger : aliased constant Windows.IID := (3504161602, 58235, 18467, (165, 254, 107, 49, 223, 239, 222, 176 ));
   
   type IActivitySensorTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SubscribedActivities
   (
      This       : access IActivitySensorTrigger_Interface
      ; RetVal : access Windows.Devices.Sensors.IVector_ActivityType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access IActivitySensorTrigger_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedActivities
   (
      This       : access IActivitySensorTrigger_Interface
      ; RetVal : access Windows.Devices.Sensors.IVectorView_ActivityType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access IActivitySensorTrigger_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivitySensorTriggerFactory : aliased constant Windows.IID := (2804322755, 14391, 17655, (131, 27, 1, 50, 204, 135, 43, 195 ));
   
   type IActivitySensorTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IActivitySensorTriggerFactory_Interface
      ; reportIntervalInMilliseconds : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Background.IActivitySensorTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISensorDataThresholdTrigger : aliased constant Windows.IID := (1539371890, 54411, 19327, (171, 236, 21, 249, 186, 204, 18, 226 ));
   
   type ISensorDataThresholdTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISensorDataThresholdTriggerFactory : aliased constant Windows.IID := (2451564149, 32240, 19875, (151, 179, 229, 68, 238, 133, 127, 230 ));
   
   type ISensorDataThresholdTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISensorDataThresholdTriggerFactory_Interface
      ; threshold : Windows.Devices.Sensors.ISensorDataThreshold
      ; RetVal : access Windows.ApplicationModel.Background.ISensorDataThresholdTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorHotspotAuthenticationTrigger : aliased constant Windows.IID := (3881224081, 12289, 19941, (131, 199, 222, 97, 216, 136, 49, 208 ));
   
   type INetworkOperatorHotspotAuthenticationTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISocketActivityTrigger : aliased constant Windows.IID := (2847668240, 40414, 20362, (131, 227, 176, 224, 231, 165, 13, 112 ));
   
   type ISocketActivityTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsWakeFromLowPowerSupported
   (
      This       : access ISocketActivityTrigger_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPushNotificationTriggerFactory : aliased constant Windows.IID := (1842933019, 17806, 20418, (188, 46, 213, 102, 79, 119, 237, 25 ));
   
   type IPushNotificationTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPushNotificationTriggerFactory_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationHistoryChangedTriggerFactory : aliased constant Windows.IID := (2177301165, 34711, 18309, (129, 180, 176, 204, 203, 115, 209, 217 ));
   
   type IToastNotificationHistoryChangedTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IToastNotificationHistoryChangedTriggerFactory_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationActionTriggerFactory : aliased constant Windows.IID := (2963143719, 25728, 17225, (129, 37, 151, 179, 239, 170, 10, 58 ));
   
   type IToastNotificationActionTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IToastNotificationActionTriggerFactory_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserNotificationChangedTriggerFactory : aliased constant Windows.IID := (3402908524, 27051, 19992, (164, 138, 94, 210, 172, 67, 89, 87 ));
   
   type IUserNotificationChangedTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IUserNotificationChangedTriggerFactory_Interface
      ; notificationKinds : Windows.UI.Notifications.NotificationKinds
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastTriggerProviderInfo : aliased constant Windows.IID := (4061738285, 40424, 17440, (156, 226, 94, 255, 143, 23, 55, 107 ));
   
   type IAppBroadcastTriggerProviderInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_DisplayNameResource
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayNameResource
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_LogoResource
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LogoResource
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_VideoKeyFrameInterval
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoKeyFrameInterval
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxVideoBitrate
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxVideoBitrate
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxVideoWidth
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxVideoWidth
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxVideoHeight
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxVideoHeight
   (
      This       : access IAppBroadcastTriggerProviderInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastTriggerFactory : aliased constant Windows.IID := (671850308, 8948, 17944, (160, 46, 231, 228, 17, 235, 114, 56 ));
   
   type IAppBroadcastTriggerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAppBroadcastTrigger
   (
      This       : access IAppBroadcastTriggerFactory_Interface
      ; providerKey : Windows.String
      ; RetVal : access Windows.ApplicationModel.Background.IAppBroadcastTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastTrigger : aliased constant Windows.IID := (1960113302, 36151, 17644, (148, 129, 42, 11, 152, 84, 235, 72 ));
   
   type IAppBroadcastTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ProviderInfo
   (
      This       : access IAppBroadcastTrigger_Interface
      ; value : Windows.ApplicationModel.Background.IAppBroadcastTriggerProviderInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderInfo
   (
      This       : access IAppBroadcastTrigger_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IAppBroadcastTriggerProviderInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_AlarmAccessStatus : aliased constant Windows.IID := (2774168701, 23030, 23734, (180, 57, 200, 170, 214, 112, 144, 92 ));
   
   type IAsyncOperation_AlarmAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_AlarmAccessStatus_Interface
      ; handler : Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_AlarmAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_AlarmAccessStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_AlarmAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_AlarmAccessStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Background.AlarmAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_BackgroundAccessStatus : aliased constant Windows.IID := (2068112769, 53161, 22371, (190, 215, 106, 101, 115, 159, 13, 191 ));
   
   type IAsyncOperation_BackgroundAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_BackgroundAccessStatus_Interface
      ; handler : Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_BackgroundAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_BackgroundAccessStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_BackgroundAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_BackgroundAccessStatus_Interface
      ; RetVal : access Windows.ApplicationModel.Background.BackgroundAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ApplicationTriggerResult : aliased constant Windows.IID := (1204541829, 3848, 23101, (146, 207, 178, 121, 96, 80, 110, 214 ));
   
   type IAsyncOperation_ApplicationTriggerResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ApplicationTriggerResult_Interface
      ; handler : Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_ApplicationTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ApplicationTriggerResult_Interface
      ; RetVal : access Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_ApplicationTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ApplicationTriggerResult_Interface
      ; RetVal : access Windows.ApplicationModel.Background.ApplicationTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_MediaProcessingTriggerResult : aliased constant Windows.IID := (630540332, 7359, 22161, (163, 13, 33, 100, 144, 156, 103, 18 ));
   
   type IAsyncOperation_MediaProcessingTriggerResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_MediaProcessingTriggerResult_Interface
      ; handler : Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_MediaProcessingTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_MediaProcessingTriggerResult_Interface
      ; RetVal : access Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_MediaProcessingTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_MediaProcessingTriggerResult_Interface
      ; RetVal : access Windows.ApplicationModel.Background.MediaProcessingTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_DeviceTriggerResult : aliased constant Windows.IID := (3037948998, 12078, 20765, (158, 142, 94, 244, 222, 203, 29, 167 ));
   
   type IAsyncOperation_DeviceTriggerResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_DeviceTriggerResult_Interface
      ; handler : Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_DeviceTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_DeviceTriggerResult_Interface
      ; RetVal : access Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_DeviceTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_DeviceTriggerResult_Interface
      ; RetVal : access Windows.ApplicationModel.Background.DeviceTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IDeviceConnectionChangeTrigger : aliased constant Windows.IID := (2634105421, 22099, 23032, (186, 107, 208, 192, 119, 52, 109, 45 ));
   
   type IAsyncOperation_IDeviceConnectionChangeTrigger_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDeviceConnectionChangeTrigger_Interface
      ; handler : Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDeviceConnectionChangeTrigger_Interface
      ; RetVal : access Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDeviceConnectionChangeTrigger_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IDeviceConnectionChangeTrigger
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattServiceProviderTriggerResult : aliased constant Windows.IID := (4093832351, 33970, 22467, (149, 67, 1, 251, 218, 5, 33, 155 ));
   
   type IAsyncOperation_IGattServiceProviderTriggerResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattServiceProviderTriggerResult_Interface
      ; handler : Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattServiceProviderTriggerResult_Interface
      ; RetVal : access Windows.ApplicationModel.Background.AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattServiceProviderTriggerResult_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IGattServiceProviderTriggerResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_BackgroundTaskCanceledEventHandler : aliased constant Windows.IID := (2797910720, 20984, 19543, (172, 63, 21, 109, 209, 104, 12, 79 ));
   
   type BackgroundTaskCanceledEventHandler_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Background.IBackgroundTaskInstance ; reason : Windows.ApplicationModel.Background.BackgroundTaskCancellationReason)) is new Windows.IMulticastDelegate_Interface(IID_BackgroundTaskCanceledEventHandler'access) with null record;
   function Invoke
   (
      This       : access BackgroundTaskCanceledEventHandler_Interface
      ; sender : Windows.ApplicationModel.Background.IBackgroundTaskInstance
      ; reason : Windows.ApplicationModel.Background.BackgroundTaskCancellationReason
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_BackgroundTaskProgressEventHandler : aliased constant Windows.IID := (1189111868, 35464, 19609, (128, 76, 118, 137, 127, 98, 119, 166 ));
   
   type BackgroundTaskProgressEventHandler_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Background.IBackgroundTaskRegistration ; args : Windows.ApplicationModel.Background.IBackgroundTaskProgressEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_BackgroundTaskProgressEventHandler'access) with null record;
   function Invoke
   (
      This       : access BackgroundTaskProgressEventHandler_Interface
      ; sender : Windows.ApplicationModel.Background.IBackgroundTaskRegistration
      ; args : Windows.ApplicationModel.Background.IBackgroundTaskProgressEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_BackgroundTaskCompletedEventHandler : aliased constant Windows.IID := (1530456361, 41094, 18087, (166, 120, 67, 145, 53, 130, 43, 207 ));
   
   type BackgroundTaskCompletedEventHandler_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Background.IBackgroundTaskRegistration ; args : Windows.ApplicationModel.Background.IBackgroundTaskCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_BackgroundTaskCompletedEventHandler'access) with null record;
   function Invoke
   (
      This       : access BackgroundTaskCompletedEventHandler_Interface
      ; sender : Windows.ApplicationModel.Background.IBackgroundTaskRegistration
      ; args : Windows.ApplicationModel.Background.IBackgroundTaskCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_AlarmAccessStatus : aliased constant Windows.IID := (2215673879, 43239, 21577, (183, 19, 223, 72, 80, 58, 149, 62 ));
   
   type AsyncOperationCompletedHandler_AlarmAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_AlarmAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_AlarmAccessStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_AlarmAccessStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_AlarmAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_BackgroundAccessStatus : aliased constant Windows.IID := (652027619, 16199, 22281, (178, 242, 214, 208, 173, 50, 136, 240 ));
   
   type AsyncOperationCompletedHandler_BackgroundAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_BackgroundAccessStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_BackgroundAccessStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ApplicationTriggerResult : aliased constant Windows.IID := (3490078454, 61085, 22008, (172, 43, 83, 169, 31, 249, 109, 46 ));
   
   type AsyncOperationCompletedHandler_ApplicationTriggerResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_ApplicationTriggerResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ApplicationTriggerResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ApplicationTriggerResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_ApplicationTriggerResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_MediaProcessingTriggerResult : aliased constant Windows.IID := (940885669, 10961, 22645, (190, 213, 80, 49, 205, 31, 80, 162 ));
   
   type AsyncOperationCompletedHandler_MediaProcessingTriggerResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_MediaProcessingTriggerResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_MediaProcessingTriggerResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_MediaProcessingTriggerResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_MediaProcessingTriggerResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated : aliased constant Windows.IID := (3573061480, 26767, 23020, (191, 36, 194, 175, 106, 49, 15, 164 ));
   
   type TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup ; args : Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBackgroundTaskRegistrationGroup_add_BackgroundActivated_Interface
      ; sender : Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup
      ; args : Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_DeviceTriggerResult : aliased constant Windows.IID := (3584726278, 5220, 22484, (133, 157, 126, 233, 178, 108, 177, 249 ));
   
   type AsyncOperationCompletedHandler_DeviceTriggerResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_DeviceTriggerResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_DeviceTriggerResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DeviceTriggerResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_DeviceTriggerResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger : aliased constant Windows.IID := (1070966142, 18404, 22817, (177, 72, 92, 181, 134, 22, 108, 168 ));
   
   type AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_IDeviceConnectionChangeTrigger ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDeviceConnectionChangeTrigger_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_IDeviceConnectionChangeTrigger
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult : aliased constant Windows.IID := (970461279, 42245, 24456, (145, 169, 176, 252, 109, 98, 134, 153 ));
   
   type AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_IGattServiceProviderTriggerResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattServiceProviderTriggerResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Background.IAsyncOperation_IGattServiceProviderTriggerResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PhoneTrigger is Windows.ApplicationModel.Background.IPhoneTrigger;
   function Create
   (
      type_x : Windows.ApplicationModel.Calls.Background.PhoneTriggerType
      ; oneShot : Windows.Boolean
   )
   return Windows.ApplicationModel.Background.IPhoneTrigger;
   
   
   subtype CommunicationBlockingAppSetAsActiveTrigger is Windows.ApplicationModel.Background.ICommunicationBlockingAppSetAsActiveTrigger;
   
   function CreateCommunicationBlockingAppSetAsActiveTrigger return Windows.ApplicationModel.Background.ICommunicationBlockingAppSetAsActiveTrigger;
   
   subtype SmartCardTrigger is Windows.ApplicationModel.Background.ISmartCardTrigger;
   function Create
   (
      triggerType : Windows.Devices.SmartCards.SmartCardTriggerType
   )
   return Windows.ApplicationModel.Background.ISmartCardTrigger;
   
   
   subtype ApplicationTrigger is Windows.ApplicationModel.Background.IApplicationTrigger;
   
   function CreateApplicationTrigger return Windows.ApplicationModel.Background.IApplicationTrigger;
   
   subtype ApplicationTriggerDetails is Windows.ApplicationModel.Background.IApplicationTriggerDetails;
   subtype MediaProcessingTrigger is Windows.ApplicationModel.Background.IMediaProcessingTrigger;
   
   function CreateMediaProcessingTrigger return Windows.ApplicationModel.Background.IMediaProcessingTrigger;
   
   subtype ContentPrefetchTrigger is Windows.ApplicationModel.Background.IContentPrefetchTrigger;
   
   function CreateContentPrefetchTrigger return Windows.ApplicationModel.Background.IContentPrefetchTrigger;
   
   subtype SecondaryAuthenticationFactorAuthenticationTrigger is Windows.ApplicationModel.Background.ISecondaryAuthenticationFactorAuthenticationTrigger;
   
   function CreateSecondaryAuthenticationFactorAuthenticationTrigger return Windows.ApplicationModel.Background.ISecondaryAuthenticationFactorAuthenticationTrigger;
   
   subtype SystemTrigger is Windows.ApplicationModel.Background.ISystemTrigger;
   function Create
   (
      triggerType : Windows.ApplicationModel.Background.SystemTriggerType
      ; oneShot : Windows.Boolean
   )
   return Windows.ApplicationModel.Background.ISystemTrigger;
   
   
   subtype SystemCondition is Windows.ApplicationModel.Background.ISystemCondition;
   function Create
   (
      conditionType : Windows.ApplicationModel.Background.SystemConditionType
   )
   return Windows.ApplicationModel.Background.ISystemCondition;
   
   
   subtype NetworkOperatorNotificationTrigger is Windows.ApplicationModel.Background.INetworkOperatorNotificationTrigger;
   function Create
   (
      networkAccountId : Windows.String
   )
   return Windows.ApplicationModel.Background.INetworkOperatorNotificationTrigger;
   
   
   subtype DeviceManufacturerNotificationTrigger is Windows.ApplicationModel.Background.IDeviceManufacturerNotificationTrigger;
   function Create
   (
      triggerQualifier : Windows.String
      ; oneShot : Windows.Boolean
   )
   return Windows.ApplicationModel.Background.IDeviceManufacturerNotificationTrigger;
   
   
   subtype CachedFileUpdaterTriggerDetails is Windows.ApplicationModel.Background.ICachedFileUpdaterTriggerDetails;
   subtype CachedFileUpdaterTrigger is Windows.ApplicationModel.Background.ICachedFileUpdaterTrigger;
   
   function CreateCachedFileUpdaterTrigger return Windows.ApplicationModel.Background.ICachedFileUpdaterTrigger;
   
   subtype TimeTrigger is Windows.ApplicationModel.Background.ITimeTrigger;
   function Create
   (
      freshnessTime : Windows.UInt32
      ; oneShot : Windows.Boolean
   )
   return Windows.ApplicationModel.Background.ITimeTrigger;
   
   
   subtype MaintenanceTrigger is Windows.ApplicationModel.Background.IMaintenanceTrigger;
   function Create
   (
      freshnessTime : Windows.UInt32
      ; oneShot : Windows.Boolean
   )
   return Windows.ApplicationModel.Background.IMaintenanceTrigger;
   
   
   subtype AppointmentStoreNotificationTrigger is Windows.ApplicationModel.Background.IAppointmentStoreNotificationTrigger;
   
   function CreateAppointmentStoreNotificationTrigger return Windows.ApplicationModel.Background.IAppointmentStoreNotificationTrigger;
   
   subtype BackgroundTaskRegistration is Windows.ApplicationModel.Background.IBackgroundTaskRegistration;
   subtype BackgroundTaskDeferral is Windows.ApplicationModel.Background.IBackgroundTaskDeferral;
   subtype BackgroundTaskProgressEventArgs is Windows.ApplicationModel.Background.IBackgroundTaskProgressEventArgs;
   subtype BackgroundTaskCompletedEventArgs is Windows.ApplicationModel.Background.IBackgroundTaskCompletedEventArgs;
   subtype BackgroundTaskRegistrationGroup is Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup;
   function Create
   (
      id : Windows.String
   )
   return Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup;
   
   function CreateWithName
   (
      id : Windows.String
      ; name : Windows.String
   )
   return Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup;
   
   
   subtype BackgroundTaskBuilder is Windows.ApplicationModel.Background.IBackgroundTaskBuilder;
   
   function CreateBackgroundTaskBuilder return Windows.ApplicationModel.Background.IBackgroundTaskBuilder;
   
   subtype ChatMessageNotificationTrigger is Windows.ApplicationModel.Background.IChatMessageNotificationTrigger;
   
   function CreateChatMessageNotificationTrigger return Windows.ApplicationModel.Background.IChatMessageNotificationTrigger;
   
   subtype ChatMessageReceivedNotificationTrigger is Windows.ApplicationModel.Background.IChatMessageReceivedNotificationTrigger;
   
   function CreateChatMessageReceivedNotificationTrigger return Windows.ApplicationModel.Background.IChatMessageReceivedNotificationTrigger;
   
   subtype RcsEndUserMessageAvailableTrigger is Windows.ApplicationModel.Background.IRcsEndUserMessageAvailableTrigger;
   
   function CreateRcsEndUserMessageAvailableTrigger return Windows.ApplicationModel.Background.IRcsEndUserMessageAvailableTrigger;
   
   subtype ContactStoreNotificationTrigger is Windows.ApplicationModel.Background.IContactStoreNotificationTrigger;
   
   function CreateContactStoreNotificationTrigger return Windows.ApplicationModel.Background.IContactStoreNotificationTrigger;
   
   subtype EmailStoreNotificationTrigger is Windows.ApplicationModel.Background.IEmailStoreNotificationTrigger;
   
   function CreateEmailStoreNotificationTrigger return Windows.ApplicationModel.Background.IEmailStoreNotificationTrigger;
   
   subtype MobileBroadbandRegistrationStateChangeTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   function CreateMobileBroadbandRegistrationStateChangeTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   subtype MobileBroadbandRadioStateChangeTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   function CreateMobileBroadbandRadioStateChangeTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   subtype MobileBroadbandPinLockStateChangeTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   function CreateMobileBroadbandPinLockStateChangeTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   subtype MobileBroadbandDeviceServiceNotificationTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   function CreateMobileBroadbandDeviceServiceNotificationTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   subtype SmsMessageReceivedTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   function Create
   (
      filterRules : Windows.Devices.Sms.ISmsFilterRules
   )
   return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   
   subtype StorageLibraryContentChangedTrigger is Windows.ApplicationModel.Background.IStorageLibraryContentChangedTrigger;
   subtype PaymentAppCanMakePaymentTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   function CreatePaymentAppCanMakePaymentTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   subtype DeviceUseTrigger is Windows.ApplicationModel.Background.IDeviceUseTrigger;
   
   function CreateDeviceUseTrigger return Windows.ApplicationModel.Background.IDeviceUseTrigger;
   
   subtype DeviceServicingTrigger is Windows.ApplicationModel.Background.IDeviceServicingTrigger;
   
   function CreateDeviceServicingTrigger return Windows.ApplicationModel.Background.IDeviceServicingTrigger;
   
   subtype RfcommConnectionTrigger is Windows.ApplicationModel.Background.IRfcommConnectionTrigger;
   
   function CreateRfcommConnectionTrigger return Windows.ApplicationModel.Background.IRfcommConnectionTrigger;
   
   subtype DeviceConnectionChangeTrigger is Windows.ApplicationModel.Background.IDeviceConnectionChangeTrigger;
   subtype GattCharacteristicNotificationTrigger is Windows.ApplicationModel.Background.IGattCharacteristicNotificationTrigger;
   function CreateWithEventTriggeringMode
   (
      characteristic : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
      ; eventTriggeringMode : Windows.Devices.Bluetooth.Background.BluetoothEventTriggeringMode
   )
   return Windows.ApplicationModel.Background.IGattCharacteristicNotificationTrigger;
   
   
   subtype GattServiceProviderTrigger is Windows.ApplicationModel.Background.IGattServiceProviderTrigger;
   subtype GattServiceProviderTriggerResult is Windows.ApplicationModel.Background.IGattServiceProviderTriggerResult;
   subtype BluetoothLEAdvertisementWatcherTrigger is Windows.ApplicationModel.Background.IBluetoothLEAdvertisementWatcherTrigger;
   
   function CreateBluetoothLEAdvertisementWatcherTrigger return Windows.ApplicationModel.Background.IBluetoothLEAdvertisementWatcherTrigger;
   
   subtype BluetoothLEAdvertisementPublisherTrigger is Windows.ApplicationModel.Background.IBluetoothLEAdvertisementPublisherTrigger;
   
   function CreateBluetoothLEAdvertisementPublisherTrigger return Windows.ApplicationModel.Background.IBluetoothLEAdvertisementPublisherTrigger;
   
   subtype DeviceWatcherTrigger is Windows.ApplicationModel.Background.IDeviceWatcherTrigger;
   subtype LocationTrigger is Windows.ApplicationModel.Background.ILocationTrigger;
   function Create
   (
      triggerType : Windows.ApplicationModel.Background.LocationTriggerType
   )
   return Windows.ApplicationModel.Background.ILocationTrigger;
   
   
   subtype GeovisitTrigger is Windows.ApplicationModel.Background.IGeovisitTrigger;
   
   function CreateGeovisitTrigger return Windows.ApplicationModel.Background.IGeovisitTrigger;
   
   subtype ActivitySensorTrigger is Windows.ApplicationModel.Background.IActivitySensorTrigger;
   function Create
   (
      reportIntervalInMilliseconds : Windows.UInt32
   )
   return Windows.ApplicationModel.Background.IActivitySensorTrigger;
   
   
   subtype SensorDataThresholdTrigger is Windows.ApplicationModel.Background.ISensorDataThresholdTrigger;
   function Create
   (
      threshold : Windows.Devices.Sensors.ISensorDataThreshold
   )
   return Windows.ApplicationModel.Background.ISensorDataThresholdTrigger;
   
   
   subtype NetworkOperatorHotspotAuthenticationTrigger is Windows.ApplicationModel.Background.INetworkOperatorHotspotAuthenticationTrigger;
   
   function CreateNetworkOperatorHotspotAuthenticationTrigger return Windows.ApplicationModel.Background.INetworkOperatorHotspotAuthenticationTrigger;
   
   subtype SocketActivityTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   function CreateSocketActivityTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   subtype PushNotificationTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   function CreatePushNotificationTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   subtype ToastNotificationHistoryChangedTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   function Create
   (
      applicationId : Windows.String
   )
   return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   
   subtype ToastNotificationActionTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   function CreateToastNotificationActionTrigger return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   subtype UserNotificationChangedTrigger is Windows.ApplicationModel.Background.IBackgroundTrigger;
   function Create
   (
      notificationKinds : Windows.UI.Notifications.NotificationKinds
   )
   return Windows.ApplicationModel.Background.IBackgroundTrigger;
   
   
   subtype AppBroadcastTriggerProviderInfo is Windows.ApplicationModel.Background.IAppBroadcastTriggerProviderInfo;
   subtype AppBroadcastTrigger is Windows.ApplicationModel.Background.IAppBroadcastTrigger;
   function CreateAppBroadcastTrigger
   (
      providerKey : Windows.String
   )
   return Windows.ApplicationModel.Background.IAppBroadcastTrigger;
   
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function RequestAccessAsync
   return Windows.ApplicationModel.Background.IAsyncOperation_AlarmAccessStatus;
   
   function GetAccessStatus
   return Windows.ApplicationModel.Background.AlarmAccessStatus;
   
   function RequestAccessAsync
   return Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus;
   
   function RequestAccessForApplicationAsync
   (
      applicationId : Windows.String
   )
   return Windows.ApplicationModel.Background.IAsyncOperation_BackgroundAccessStatus;
   
   procedure RemoveAccess
   ;
   
   procedure RemoveAccessForApplication
   (
      applicationId : Windows.String
   )
   ;
   
   function GetAccessStatus
   return Windows.ApplicationModel.Background.BackgroundAccessStatus;
   
   function GetAccessStatusForApplication
   (
      applicationId : Windows.String
   )
   return Windows.ApplicationModel.Background.BackgroundAccessStatus;
   
   function get_AllTasks
   return Windows.Address;
   
   function get_AllTaskGroups
   return Windows.Address;
   
   function GetTaskGroup
   (
      groupId : Windows.String
   )
   return Windows.ApplicationModel.Background.IBackgroundTaskRegistrationGroup;
   
   function get_CurrentBackgroundWorkCost
   return Windows.ApplicationModel.Background.BackgroundWorkCostValue;
   
   function Create
   (
      storageLibrary : Windows.Storage.IStorageLibrary
   )
   return Windows.ApplicationModel.Background.IStorageLibraryContentChangedTrigger;
   
   function CreateFromLibraries
   (
      storageLibraries : Windows.Storage.IIterable_IStorageLibrary
   )
   return Windows.ApplicationModel.Background.IStorageLibraryContentChangedTrigger;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.ApplicationModel.Background.IAsyncOperation_IDeviceConnectionChangeTrigger;
   
   function CreateAsync
   (
      triggerId : Windows.String
      ; serviceUuid : Windows.Guid
   )
   return Windows.ApplicationModel.Background.IAsyncOperation_IGattServiceProviderTriggerResult;
   
end;
