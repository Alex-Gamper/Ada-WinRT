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
limited with Windows.Devices.Printers.Extensions;
limited with Windows.ApplicationModel.Calls;
limited with Windows.UI.ViewManagement;
limited with Windows.ApplicationModel.Contacts.Provider;
limited with Windows.ApplicationModel.Contacts;
limited with Windows.ApplicationModel.Wallet;
limited with Windows.ApplicationModel.Appointments.AppointmentsProvider;
limited with Windows.System;
with Windows.Foundation;
limited with Windows.ApplicationModel.Background;
limited with Windows.ApplicationModel.UserDataAccounts.Provider;
with Windows.Foundation.Collections;
limited with Windows.UI.Notifications;
limited with Windows.ApplicationModel.Search;
limited with Windows.ApplicationModel.DataTransfer.ShareTarget;
limited with Windows.Storage;
limited with Windows.Storage.Search;
limited with Windows.Storage.Pickers.Provider;
limited with Windows.Storage.Provider;
limited with Windows.Security.Authentication.Web;
limited with Windows.Security.Authentication.Web.Provider;
limited with Windows.Devices.Enumeration;
limited with Windows.Media.SpeechRecognition;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Activation is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ApplicationExecutionState is (
      NotRunning,
      Running,
      Suspended,
      Terminated,
      ClosedByUser
   );
   for ApplicationExecutionState use (
      NotRunning => 0,
      Running => 1,
      Suspended => 2,
      Terminated => 3,
      ClosedByUser => 4
   );
   for ApplicationExecutionState'Size use 32;
   
   type ApplicationExecutionState_Ptr is access ApplicationExecutionState;
   
   type ActivationKind is (
      Launch,
      Search,
      ShareTarget,
      File,
      Protocol,
      FileOpenPicker,
      FileSavePicker,
      CachedFileUpdater,
      ContactPicker,
      Device,
      PrintTaskSettings,
      CameraSettings,
      RestrictedLaunch,
      AppointmentsProvider,
      Contact,
      LockScreenCall,
      VoiceCommand,
      LockScreen,
      PickerReturned,
      WalletAction,
      PickFileContinuation,
      PickSaveFileContinuation,
      PickFolderContinuation,
      WebAuthenticationBrokerContinuation,
      WebAccountProvider,
      ComponentUI,
      ProtocolForResults,
      ToastNotification,
      Print3DWorkflow,
      DialReceiver,
      DevicePairing,
      UserDataAccountsProvider,
      FilePickerExperience,
      LockScreenComponent,
      ContactPanel,
      PrintWorkflowForegroundTask,
      GameUIProvider,
      StartupTask,
      CommandLineLaunch
   );
   for ActivationKind use (
      Launch => 0,
      Search => 1,
      ShareTarget => 2,
      File => 3,
      Protocol => 4,
      FileOpenPicker => 5,
      FileSavePicker => 6,
      CachedFileUpdater => 7,
      ContactPicker => 8,
      Device => 9,
      PrintTaskSettings => 10,
      CameraSettings => 11,
      RestrictedLaunch => 12,
      AppointmentsProvider => 13,
      Contact => 14,
      LockScreenCall => 15,
      VoiceCommand => 16,
      LockScreen => 17,
      PickerReturned => 1000,
      WalletAction => 1001,
      PickFileContinuation => 1002,
      PickSaveFileContinuation => 1003,
      PickFolderContinuation => 1004,
      WebAuthenticationBrokerContinuation => 1005,
      WebAccountProvider => 1006,
      ComponentUI => 1007,
      ProtocolForResults => 1009,
      ToastNotification => 1010,
      Print3DWorkflow => 1011,
      DialReceiver => 1012,
      DevicePairing => 1013,
      UserDataAccountsProvider => 1014,
      FilePickerExperience => 1015,
      LockScreenComponent => 1016,
      ContactPanel => 1017,
      PrintWorkflowForegroundTask => 1018,
      GameUIProvider => 1019,
      StartupTask => 1020,
      CommandLineLaunch => 1021
   );
   for ActivationKind'Size use 32;
   
   type ActivationKind_Ptr is access ActivationKind;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ActivatedEventsContract is null record;
   pragma Convention (C_Pass_By_Copy , ActivatedEventsContract);
   
   type ActivatedEventsContract_Ptr is access ActivatedEventsContract;
   
   type ActivationCameraSettingsContract is null record;
   pragma Convention (C_Pass_By_Copy , ActivationCameraSettingsContract);
   
   type ActivationCameraSettingsContract_Ptr is access ActivationCameraSettingsContract;
   
   type ContactActivatedEventsContract is null record;
   pragma Convention (C_Pass_By_Copy , ContactActivatedEventsContract);
   
   type ContactActivatedEventsContract_Ptr is access ContactActivatedEventsContract;
   
   type WebUISearchActivatedEventsContract is null record;
   pragma Convention (C_Pass_By_Copy , WebUISearchActivatedEventsContract);
   
   type WebUISearchActivatedEventsContract_Ptr is access WebUISearchActivatedEventsContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ISplashScreen_add_Dismissed_Interface;
   type TypedEventHandler_ISplashScreen_add_Dismissed is access all TypedEventHandler_ISplashScreen_add_Dismissed_Interface'Class;
   type TypedEventHandler_ISplashScreen_add_Dismissed_Ptr is access all TypedEventHandler_ISplashScreen_add_Dismissed;
   type EventHandler_IBackgroundActivatedEventArgs_Interface;
   type EventHandler_IBackgroundActivatedEventArgs is access all EventHandler_IBackgroundActivatedEventArgs_Interface'Class;
   type EventHandler_IBackgroundActivatedEventArgs_Ptr is access all EventHandler_IBackgroundActivatedEventArgs;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IBackgroundActivatedEventArgs_Interface;
   type IBackgroundActivatedEventArgs is access all IBackgroundActivatedEventArgs_Interface'Class;
   type IBackgroundActivatedEventArgs_Ptr is access all IBackgroundActivatedEventArgs;
   type IContactPanelActivatedEventArgs_Interface;
   type IContactPanelActivatedEventArgs is access all IContactPanelActivatedEventArgs_Interface'Class;
   type IContactPanelActivatedEventArgs_Ptr is access all IContactPanelActivatedEventArgs;
   type ISplashScreen_Interface;
   type ISplashScreen is access all ISplashScreen_Interface'Class;
   type ISplashScreen_Ptr is access all ISplashScreen;
   type IActivatedEventArgs_Interface;
   type IActivatedEventArgs is access all IActivatedEventArgs_Interface'Class;
   type IActivatedEventArgs_Ptr is access all IActivatedEventArgs;
   type IPrintTaskSettingsActivatedEventArgs_Interface;
   type IPrintTaskSettingsActivatedEventArgs is access all IPrintTaskSettingsActivatedEventArgs_Interface'Class;
   type IPrintTaskSettingsActivatedEventArgs_Ptr is access all IPrintTaskSettingsActivatedEventArgs;
   type IPrint3DWorkflowActivatedEventArgs_Interface;
   type IPrint3DWorkflowActivatedEventArgs is access all IPrint3DWorkflowActivatedEventArgs_Interface'Class;
   type IPrint3DWorkflowActivatedEventArgs_Ptr is access all IPrint3DWorkflowActivatedEventArgs;
   type ICameraSettingsActivatedEventArgs_Interface;
   type ICameraSettingsActivatedEventArgs is access all ICameraSettingsActivatedEventArgs_Interface'Class;
   type ICameraSettingsActivatedEventArgs_Ptr is access all ICameraSettingsActivatedEventArgs;
   type IContactPickerActivatedEventArgs_Interface;
   type IContactPickerActivatedEventArgs is access all IContactPickerActivatedEventArgs_Interface'Class;
   type IContactPickerActivatedEventArgs_Ptr is access all IContactPickerActivatedEventArgs;
   type IContactActivatedEventArgs_Interface;
   type IContactActivatedEventArgs is access all IContactActivatedEventArgs_Interface'Class;
   type IContactActivatedEventArgs_Ptr is access all IContactActivatedEventArgs;
   type IContactCallActivatedEventArgs_Interface;
   type IContactCallActivatedEventArgs is access all IContactCallActivatedEventArgs_Interface'Class;
   type IContactCallActivatedEventArgs_Ptr is access all IContactCallActivatedEventArgs;
   type IContactMessageActivatedEventArgs_Interface;
   type IContactMessageActivatedEventArgs is access all IContactMessageActivatedEventArgs_Interface'Class;
   type IContactMessageActivatedEventArgs_Ptr is access all IContactMessageActivatedEventArgs;
   type IContactMapActivatedEventArgs_Interface;
   type IContactMapActivatedEventArgs is access all IContactMapActivatedEventArgs_Interface'Class;
   type IContactMapActivatedEventArgs_Ptr is access all IContactMapActivatedEventArgs;
   type IContactPostActivatedEventArgs_Interface;
   type IContactPostActivatedEventArgs is access all IContactPostActivatedEventArgs_Interface'Class;
   type IContactPostActivatedEventArgs_Ptr is access all IContactPostActivatedEventArgs;
   type IContactVideoCallActivatedEventArgs_Interface;
   type IContactVideoCallActivatedEventArgs is access all IContactVideoCallActivatedEventArgs_Interface'Class;
   type IContactVideoCallActivatedEventArgs_Ptr is access all IContactVideoCallActivatedEventArgs;
   type IContactsProviderActivatedEventArgs_Interface;
   type IContactsProviderActivatedEventArgs is access all IContactsProviderActivatedEventArgs_Interface'Class;
   type IContactsProviderActivatedEventArgs_Ptr is access all IContactsProviderActivatedEventArgs;
   type IWalletActionActivatedEventArgs_Interface;
   type IWalletActionActivatedEventArgs is access all IWalletActionActivatedEventArgs_Interface'Class;
   type IWalletActionActivatedEventArgs_Ptr is access all IWalletActionActivatedEventArgs;
   type IAppointmentsProviderActivatedEventArgs_Interface;
   type IAppointmentsProviderActivatedEventArgs is access all IAppointmentsProviderActivatedEventArgs_Interface'Class;
   type IAppointmentsProviderActivatedEventArgs_Ptr is access all IAppointmentsProviderActivatedEventArgs;
   type IAppointmentsProviderAddAppointmentActivatedEventArgs_Interface;
   type IAppointmentsProviderAddAppointmentActivatedEventArgs is access all IAppointmentsProviderAddAppointmentActivatedEventArgs_Interface'Class;
   type IAppointmentsProviderAddAppointmentActivatedEventArgs_Ptr is access all IAppointmentsProviderAddAppointmentActivatedEventArgs;
   type IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Interface;
   type IAppointmentsProviderReplaceAppointmentActivatedEventArgs is access all IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Interface'Class;
   type IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Ptr is access all IAppointmentsProviderReplaceAppointmentActivatedEventArgs;
   type IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Interface;
   type IAppointmentsProviderRemoveAppointmentActivatedEventArgs is access all IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Interface'Class;
   type IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Ptr is access all IAppointmentsProviderRemoveAppointmentActivatedEventArgs;
   type IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Interface;
   type IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs is access all IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Interface'Class;
   type IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Ptr is access all IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs;
   type IAppointmentsProviderShowTimeFrameActivatedEventArgs_Interface;
   type IAppointmentsProviderShowTimeFrameActivatedEventArgs is access all IAppointmentsProviderShowTimeFrameActivatedEventArgs_Interface'Class;
   type IAppointmentsProviderShowTimeFrameActivatedEventArgs_Ptr is access all IAppointmentsProviderShowTimeFrameActivatedEventArgs;
   type IUserDataAccountProviderActivatedEventArgs_Interface;
   type IUserDataAccountProviderActivatedEventArgs is access all IUserDataAccountProviderActivatedEventArgs_Interface'Class;
   type IUserDataAccountProviderActivatedEventArgs_Ptr is access all IUserDataAccountProviderActivatedEventArgs;
   type IActivatedEventArgsWithUser_Interface;
   type IActivatedEventArgsWithUser is access all IActivatedEventArgsWithUser_Interface'Class;
   type IActivatedEventArgsWithUser_Ptr is access all IActivatedEventArgsWithUser;
   type IApplicationViewActivatedEventArgs_Interface;
   type IApplicationViewActivatedEventArgs is access all IApplicationViewActivatedEventArgs_Interface'Class;
   type IApplicationViewActivatedEventArgs_Ptr is access all IApplicationViewActivatedEventArgs;
   type IViewSwitcherProvider_Interface;
   type IViewSwitcherProvider is access all IViewSwitcherProvider_Interface'Class;
   type IViewSwitcherProvider_Ptr is access all IViewSwitcherProvider;
   type IPrelaunchActivatedEventArgs_Interface;
   type IPrelaunchActivatedEventArgs is access all IPrelaunchActivatedEventArgs_Interface'Class;
   type IPrelaunchActivatedEventArgs_Ptr is access all IPrelaunchActivatedEventArgs;
   type ILaunchActivatedEventArgs_Interface;
   type ILaunchActivatedEventArgs is access all ILaunchActivatedEventArgs_Interface'Class;
   type ILaunchActivatedEventArgs_Ptr is access all ILaunchActivatedEventArgs;
   type ILockScreenCallActivatedEventArgs_Interface;
   type ILockScreenCallActivatedEventArgs is access all ILockScreenCallActivatedEventArgs_Interface'Class;
   type ILockScreenCallActivatedEventArgs_Ptr is access all ILockScreenCallActivatedEventArgs;
   type ILaunchActivatedEventArgs2_Interface;
   type ILaunchActivatedEventArgs2 is access all ILaunchActivatedEventArgs2_Interface'Class;
   type ILaunchActivatedEventArgs2_Ptr is access all ILaunchActivatedEventArgs2;
   type ISearchActivatedEventArgs_Interface;
   type ISearchActivatedEventArgs is access all ISearchActivatedEventArgs_Interface'Class;
   type ISearchActivatedEventArgs_Ptr is access all ISearchActivatedEventArgs;
   type ISearchActivatedEventArgsWithLinguisticDetails_Interface;
   type ISearchActivatedEventArgsWithLinguisticDetails is access all ISearchActivatedEventArgsWithLinguisticDetails_Interface'Class;
   type ISearchActivatedEventArgsWithLinguisticDetails_Ptr is access all ISearchActivatedEventArgsWithLinguisticDetails;
   type IShareTargetActivatedEventArgs_Interface;
   type IShareTargetActivatedEventArgs is access all IShareTargetActivatedEventArgs_Interface'Class;
   type IShareTargetActivatedEventArgs_Ptr is access all IShareTargetActivatedEventArgs;
   type IFileActivatedEventArgs_Interface;
   type IFileActivatedEventArgs is access all IFileActivatedEventArgs_Interface'Class;
   type IFileActivatedEventArgs_Ptr is access all IFileActivatedEventArgs;
   type IFileActivatedEventArgsWithNeighboringFiles_Interface;
   type IFileActivatedEventArgsWithNeighboringFiles is access all IFileActivatedEventArgsWithNeighboringFiles_Interface'Class;
   type IFileActivatedEventArgsWithNeighboringFiles_Ptr is access all IFileActivatedEventArgsWithNeighboringFiles;
   type IFileActivatedEventArgsWithCallerPackageFamilyName_Interface;
   type IFileActivatedEventArgsWithCallerPackageFamilyName is access all IFileActivatedEventArgsWithCallerPackageFamilyName_Interface'Class;
   type IFileActivatedEventArgsWithCallerPackageFamilyName_Ptr is access all IFileActivatedEventArgsWithCallerPackageFamilyName;
   type IProtocolActivatedEventArgs_Interface;
   type IProtocolActivatedEventArgs is access all IProtocolActivatedEventArgs_Interface'Class;
   type IProtocolActivatedEventArgs_Ptr is access all IProtocolActivatedEventArgs;
   type IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Interface;
   type IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData is access all IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Interface'Class;
   type IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Ptr is access all IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData;
   type IProtocolForResultsActivatedEventArgs_Interface;
   type IProtocolForResultsActivatedEventArgs is access all IProtocolForResultsActivatedEventArgs_Interface'Class;
   type IProtocolForResultsActivatedEventArgs_Ptr is access all IProtocolForResultsActivatedEventArgs;
   type IFileOpenPickerActivatedEventArgs_Interface;
   type IFileOpenPickerActivatedEventArgs is access all IFileOpenPickerActivatedEventArgs_Interface'Class;
   type IFileOpenPickerActivatedEventArgs_Ptr is access all IFileOpenPickerActivatedEventArgs;
   type IFileOpenPickerActivatedEventArgs2_Interface;
   type IFileOpenPickerActivatedEventArgs2 is access all IFileOpenPickerActivatedEventArgs2_Interface'Class;
   type IFileOpenPickerActivatedEventArgs2_Ptr is access all IFileOpenPickerActivatedEventArgs2;
   type IFileSavePickerActivatedEventArgs_Interface;
   type IFileSavePickerActivatedEventArgs is access all IFileSavePickerActivatedEventArgs_Interface'Class;
   type IFileSavePickerActivatedEventArgs_Ptr is access all IFileSavePickerActivatedEventArgs;
   type IFileSavePickerActivatedEventArgs2_Interface;
   type IFileSavePickerActivatedEventArgs2 is access all IFileSavePickerActivatedEventArgs2_Interface'Class;
   type IFileSavePickerActivatedEventArgs2_Ptr is access all IFileSavePickerActivatedEventArgs2;
   type ICachedFileUpdaterActivatedEventArgs_Interface;
   type ICachedFileUpdaterActivatedEventArgs is access all ICachedFileUpdaterActivatedEventArgs_Interface'Class;
   type ICachedFileUpdaterActivatedEventArgs_Ptr is access all ICachedFileUpdaterActivatedEventArgs;
   type IDeviceActivatedEventArgs_Interface;
   type IDeviceActivatedEventArgs is access all IDeviceActivatedEventArgs_Interface'Class;
   type IDeviceActivatedEventArgs_Ptr is access all IDeviceActivatedEventArgs;
   type IPickerReturnedActivatedEventArgs_Interface;
   type IPickerReturnedActivatedEventArgs is access all IPickerReturnedActivatedEventArgs_Interface'Class;
   type IPickerReturnedActivatedEventArgs_Ptr is access all IPickerReturnedActivatedEventArgs;
   type IRestrictedLaunchActivatedEventArgs_Interface;
   type IRestrictedLaunchActivatedEventArgs is access all IRestrictedLaunchActivatedEventArgs_Interface'Class;
   type IRestrictedLaunchActivatedEventArgs_Ptr is access all IRestrictedLaunchActivatedEventArgs;
   type ILockScreenActivatedEventArgs_Interface;
   type ILockScreenActivatedEventArgs is access all ILockScreenActivatedEventArgs_Interface'Class;
   type ILockScreenActivatedEventArgs_Ptr is access all ILockScreenActivatedEventArgs;
   type IContinuationActivatedEventArgs_Interface;
   type IContinuationActivatedEventArgs is access all IContinuationActivatedEventArgs_Interface'Class;
   type IContinuationActivatedEventArgs_Ptr is access all IContinuationActivatedEventArgs;
   type IFileOpenPickerContinuationEventArgs_Interface;
   type IFileOpenPickerContinuationEventArgs is access all IFileOpenPickerContinuationEventArgs_Interface'Class;
   type IFileOpenPickerContinuationEventArgs_Ptr is access all IFileOpenPickerContinuationEventArgs;
   type IFileSavePickerContinuationEventArgs_Interface;
   type IFileSavePickerContinuationEventArgs is access all IFileSavePickerContinuationEventArgs_Interface'Class;
   type IFileSavePickerContinuationEventArgs_Ptr is access all IFileSavePickerContinuationEventArgs;
   type IFolderPickerContinuationEventArgs_Interface;
   type IFolderPickerContinuationEventArgs is access all IFolderPickerContinuationEventArgs_Interface'Class;
   type IFolderPickerContinuationEventArgs_Ptr is access all IFolderPickerContinuationEventArgs;
   type IWebAuthenticationBrokerContinuationEventArgs_Interface;
   type IWebAuthenticationBrokerContinuationEventArgs is access all IWebAuthenticationBrokerContinuationEventArgs_Interface'Class;
   type IWebAuthenticationBrokerContinuationEventArgs_Ptr is access all IWebAuthenticationBrokerContinuationEventArgs;
   type IWebAccountProviderActivatedEventArgs_Interface;
   type IWebAccountProviderActivatedEventArgs is access all IWebAccountProviderActivatedEventArgs_Interface'Class;
   type IWebAccountProviderActivatedEventArgs_Ptr is access all IWebAccountProviderActivatedEventArgs;
   type IToastNotificationActivatedEventArgs_Interface;
   type IToastNotificationActivatedEventArgs is access all IToastNotificationActivatedEventArgs_Interface'Class;
   type IToastNotificationActivatedEventArgs_Ptr is access all IToastNotificationActivatedEventArgs;
   type IDialReceiverActivatedEventArgs_Interface;
   type IDialReceiverActivatedEventArgs is access all IDialReceiverActivatedEventArgs_Interface'Class;
   type IDialReceiverActivatedEventArgs_Ptr is access all IDialReceiverActivatedEventArgs;
   type ITileActivatedInfo_Interface;
   type ITileActivatedInfo is access all ITileActivatedInfo_Interface'Class;
   type ITileActivatedInfo_Ptr is access all ITileActivatedInfo;
   type ICommandLineActivationOperation_Interface;
   type ICommandLineActivationOperation is access all ICommandLineActivationOperation_Interface'Class;
   type ICommandLineActivationOperation_Ptr is access all ICommandLineActivationOperation;
   type ICommandLineActivatedEventArgs_Interface;
   type ICommandLineActivatedEventArgs is access all ICommandLineActivatedEventArgs_Interface'Class;
   type ICommandLineActivatedEventArgs_Ptr is access all ICommandLineActivatedEventArgs;
   type IStartupTaskActivatedEventArgs_Interface;
   type IStartupTaskActivatedEventArgs is access all IStartupTaskActivatedEventArgs_Interface'Class;
   type IStartupTaskActivatedEventArgs_Ptr is access all IStartupTaskActivatedEventArgs;
   type IDevicePairingActivatedEventArgs_Interface;
   type IDevicePairingActivatedEventArgs is access all IDevicePairingActivatedEventArgs_Interface'Class;
   type IDevicePairingActivatedEventArgs_Ptr is access all IDevicePairingActivatedEventArgs;
   type IVoiceCommandActivatedEventArgs_Interface;
   type IVoiceCommandActivatedEventArgs is access all IVoiceCommandActivatedEventArgs_Interface'Class;
   type IVoiceCommandActivatedEventArgs_Ptr is access all IVoiceCommandActivatedEventArgs;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundActivatedEventArgs : aliased constant Windows.IID := (2870263520, 59232, 17422, (169, 28, 68, 121, 109, 227, 169, 45 ));
   
   type IBackgroundActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskInstance
   (
      This       : access IBackgroundActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskInstance
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactPanelActivatedEventArgs : aliased constant Windows.IID := (1388012516, 54228, 19299, (128, 81, 74, 242, 8, 44, 171, 128 ));
   
   type IContactPanelActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactPanel
   (
      This       : access IContactPanelActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactPanel
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactPanelActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISplashScreen : aliased constant Windows.IID := (3394082652, 54486, 17392, (151, 192, 8, 51, 198, 57, 28, 36 ));
   
   type ISplashScreen_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ImageLocation
   (
      This       : access ISplashScreen_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function add_Dismissed
   (
      This       : access ISplashScreen_Interface
      ; handler : TypedEventHandler_ISplashScreen_add_Dismissed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Dismissed
   (
      This       : access ISplashScreen_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivatedEventArgs : aliased constant Windows.IID := (3479508755, 52488, 20440, (182, 151, 162, 129, 182, 84, 78, 46 ));
   
   type IActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ActivationKind
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviousExecutionState
   (
      This       : access IActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ApplicationExecutionState
   )
   return Windows.HRESULT is abstract;
   
   function get_SplashScreen
   (
      This       : access IActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ISplashScreen
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrintTaskSettingsActivatedEventArgs : aliased constant Windows.IID := (3996164297, 52822, 18533, (186, 142, 137, 84, 172, 39, 17, 7 ));
   
   type IPrintTaskSettingsActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Configuration
   (
      This       : access IPrintTaskSettingsActivatedEventArgs_Interface
      ; RetVal : access Windows.Devices.Printers.Extensions.IPrintTaskConfiguration
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrint3DWorkflowActivatedEventArgs : aliased constant Windows.IID := (1062725515, 62124, 17945, (131, 2, 239, 133, 94, 28, 155, 144 ));
   
   type IPrint3DWorkflowActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Workflow
   (
      This       : access IPrint3DWorkflowActivatedEventArgs_Interface
      ; RetVal : access Windows.Devices.Printers.Extensions.IPrint3DWorkflow
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICameraSettingsActivatedEventArgs : aliased constant Windows.IID := (4217873672, 11693, 18698, (145, 112, 220, 160, 54, 235, 17, 75 ));
   
   type ICameraSettingsActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoDeviceController
   (
      This       : access ICameraSettingsActivatedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoDeviceExtension
   (
      This       : access ICameraSettingsActivatedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactPickerActivatedEventArgs : aliased constant Windows.IID := (3461851879, 25673, 17831, (151, 31, 209, 19, 190, 122, 137, 54 ));
   
   type IContactPickerActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactPickerUI
   (
      This       : access IContactPickerActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.Provider.IContactPickerUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactActivatedEventArgs : aliased constant Windows.IID := (3592921540, 49189, 19521, (157, 239, 241, 234, 250, 208, 117, 231 ));
   
   type IContactActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Verb
   (
      This       : access IContactActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactCallActivatedEventArgs : aliased constant Windows.IID := (3269399751, 12523, 16838, (179, 188, 91, 22, 148, 249, 218, 179 ));
   
   type IContactCallActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceId
   (
      This       : access IContactCallActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceUserId
   (
      This       : access IContactCallActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactCallActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactMessageActivatedEventArgs : aliased constant Windows.IID := (3730410930, 3587, 17328, (191, 86, 188, 196, 11, 49, 98, 223 ));
   
   type IContactMessageActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceId
   (
      This       : access IContactMessageActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceUserId
   (
      This       : access IContactMessageActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactMessageActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactMapActivatedEventArgs : aliased constant Windows.IID := (3006003312, 61159, 19154, (170, 241, 168, 126, 255, 207, 0, 164 ));
   
   type IContactMapActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Address
   (
      This       : access IContactMapActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactMapActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactPostActivatedEventArgs : aliased constant Windows.IID := (3009035367, 61927, 18005, (173, 110, 72, 87, 88, 143, 85, 47 ));
   
   type IContactPostActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceId
   (
      This       : access IContactPostActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceUserId
   (
      This       : access IContactPostActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactPostActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactVideoCallActivatedEventArgs : aliased constant Windows.IID := (1627889080, 58343, 19279, (133, 141, 92, 99, 169, 110, 246, 132 ));
   
   type IContactVideoCallActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceId
   (
      This       : access IContactVideoCallActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceUserId
   (
      This       : access IContactVideoCallActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactVideoCallActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContactsProviderActivatedEventArgs : aliased constant Windows.IID := (1166073000, 22352, 18710, (170, 82, 192, 130, 149, 33, 235, 148 ));
   
   type IContactsProviderActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Verb
   (
      This       : access IContactsProviderActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletActionActivatedEventArgs : aliased constant Windows.IID := (4244374139, 6682, 19746, (146, 63, 174, 111, 69, 250, 82, 217 ));
   
   type IWalletActionActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ItemId
   (
      This       : access IWalletActionActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ActionKind
   (
      This       : access IWalletActionActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.WalletActionKind
   )
   return Windows.HRESULT is abstract;
   
   function get_ActionId
   (
      This       : access IWalletActionActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentsProviderActivatedEventArgs : aliased constant Windows.IID := (862241797, 37692, 20093, (160, 52, 80, 15, 184, 220, 217, 243 ));
   
   type IAppointmentsProviderActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Verb
   (
      This       : access IAppointmentsProviderActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentsProviderAddAppointmentActivatedEventArgs : aliased constant Windows.IID := (2726695783, 52965, 20045, (158, 215, 65, 195, 78, 193, 139, 2 ));
   
   type IAppointmentsProviderAddAppointmentActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AddAppointmentOperation
   (
      This       : access IAppointmentsProviderAddAppointmentActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentsProvider.IAddAppointmentOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentsProviderReplaceAppointmentActivatedEventArgs : aliased constant Windows.IID := (357677012, 43393, 16487, (138, 98, 5, 36, 228, 173, 225, 33 ));
   
   type IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ReplaceAppointmentOperation
   (
      This       : access IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentsProvider.IReplaceAppointmentOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentsProviderRemoveAppointmentActivatedEventArgs : aliased constant Windows.IID := (1964980920, 2958, 17692, (159, 21, 150, 110, 105, 155, 172, 37 ));
   
   type IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoveAppointmentOperation
   (
      This       : access IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentsProvider.IRemoveAppointmentOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs : aliased constant Windows.IID := (962130021, 38977, 19621, (153, 155, 136, 81, 152, 185, 239, 42 ));
   
   type IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InstanceStartDate
   (
      This       : access IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalId
   (
      This       : access IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RoamingId
   (
      This       : access IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppointmentsProviderShowTimeFrameActivatedEventArgs : aliased constant Windows.IID := (2611915686, 3595, 18858, (186, 188, 18, 177, 220, 119, 73, 134 ));
   
   type IAppointmentsProviderShowTimeFrameActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TimeToShow
   (
      This       : access IAppointmentsProviderShowTimeFrameActivatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IAppointmentsProviderShowTimeFrameActivatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDataAccountProviderActivatedEventArgs : aliased constant Windows.IID := (466220835, 36593, 19025, (166, 58, 254, 113, 30, 234, 182, 7 ));
   
   type IUserDataAccountProviderActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Operation
   (
      This       : access IUserDataAccountProviderActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountProviderOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivatedEventArgsWithUser : aliased constant Windows.IID := (485530526, 39266, 18742, (128, 255, 175, 200, 232, 174, 92, 140 ));
   
   type IActivatedEventArgsWithUser_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IActivatedEventArgsWithUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationViewActivatedEventArgs : aliased constant Windows.IID := (2467098443, 47145, 16636, (136, 244, 133, 19, 232, 166, 71, 56 ));
   
   type IApplicationViewActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentlyShownApplicationViewId
   (
      This       : access IApplicationViewActivatedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IViewSwitcherProvider : aliased constant Windows.IID := (871532710, 23596, 19751, (186, 199, 117, 54, 8, 143, 18, 25 ));
   
   type IViewSwitcherProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ViewSwitcher
   (
      This       : access IViewSwitcherProvider_Interface
      ; RetVal : access Windows.UI.ViewManagement.IActivationViewSwitcher
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPrelaunchActivatedEventArgs : aliased constant Windows.IID := (205812091, 6647, 18646, (176, 70, 207, 34, 130, 110, 170, 116 ));
   
   type IPrelaunchActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrelaunchActivated
   (
      This       : access IPrelaunchActivatedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILaunchActivatedEventArgs : aliased constant Windows.IID := (4224269862, 41290, 19279, (130, 176, 51, 190, 217, 32, 175, 82 ));
   
   type ILaunchActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Arguments
   (
      This       : access ILaunchActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TileId
   (
      This       : access ILaunchActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILockScreenCallActivatedEventArgs : aliased constant Windows.IID := (116621246, 46578, 17547, (177, 62, 227, 40, 172, 28, 81, 106 ));
   
   type ILockScreenCallActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CallUI
   (
      This       : access ILockScreenCallActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.ILockScreenCallUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILaunchActivatedEventArgs2 : aliased constant Windows.IID := (265518780, 40393, 18101, (154, 206, 189, 149, 212, 86, 83, 69 ));
   
   type ILaunchActivatedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TileActivatedInfo
   (
      This       : access ILaunchActivatedEventArgs2_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ITileActivatedInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchActivatedEventArgs : aliased constant Windows.IID := (2360568145, 22728, 17379, (148, 188, 65, 211, 63, 139, 99, 14 ));
   
   type ISearchActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QueryText
   (
      This       : access ISearchActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access ISearchActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchActivatedEventArgsWithLinguisticDetails : aliased constant Windows.IID := (3231658970, 2219, 18737, (155, 124, 69, 16, 37, 242, 31, 129 ));
   
   type ISearchActivatedEventArgsWithLinguisticDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LinguisticDetails
   (
      This       : access ISearchActivatedEventArgsWithLinguisticDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchPaneQueryLinguisticDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareTargetActivatedEventArgs : aliased constant Windows.IID := (1272641992, 52658, 19147, (191, 195, 102, 72, 86, 51, 120, 236 ));
   
   type IShareTargetActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ShareOperation
   (
      This       : access IShareTargetActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.ShareTarget.IShareOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileActivatedEventArgs : aliased constant Windows.IID := (3140156467, 37809, 17133, (139, 38, 35, 109, 217, 199, 132, 150 ));
   
   type IFileActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Files
   (
      This       : access IFileActivatedEventArgs_Interface
      ; RetVal : access Windows.Storage.IVectorView_IStorageItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Verb
   (
      This       : access IFileActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileActivatedEventArgsWithNeighboringFiles : aliased constant Windows.IID := (1127981476, 57826, 18685, (183, 252, 181, 214, 238, 230, 80, 51 ));
   
   type IFileActivatedEventArgsWithNeighboringFiles_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NeighboringFilesQuery
   (
      This       : access IFileActivatedEventArgsWithNeighboringFiles_Interface
      ; RetVal : access Windows.Storage.Search.IStorageFileQueryResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileActivatedEventArgsWithCallerPackageFamilyName : aliased constant Windows.IID := (761327723, 53855, 19749, (134, 83, 225, 197, 225, 16, 131, 9 ));
   
   type IFileActivatedEventArgsWithCallerPackageFamilyName_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CallerPackageFamilyName
   (
      This       : access IFileActivatedEventArgsWithCallerPackageFamilyName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProtocolActivatedEventArgs : aliased constant Windows.IID := (1620440285, 47040, 18091, (129, 254, 217, 15, 54, 208, 13, 36 ));
   
   type IProtocolActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IProtocolActivatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData : aliased constant Windows.IID := (3628731410, 23695, 17292, (131, 203, 194, 143, 204, 11, 47, 219 ));
   
   type IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CallerPackageFamilyName
   (
      This       : access IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProtocolForResultsActivatedEventArgs : aliased constant Windows.IID := (3880858306, 31463, 17687, (128, 172, 219, 232, 215, 204, 91, 156 ));
   
   type IProtocolForResultsActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProtocolForResultsOperation
   (
      This       : access IProtocolForResultsActivatedEventArgs_Interface
      ; RetVal : access Windows.System.IProtocolForResultsOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileOpenPickerActivatedEventArgs : aliased constant Windows.IID := (1921151106, 21797, 19442, (188, 9, 31, 80, 149, 212, 150, 77 ));
   
   type IFileOpenPickerActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FileOpenPickerUI
   (
      This       : access IFileOpenPickerActivatedEventArgs_Interface
      ; RetVal : access Windows.Storage.Pickers.Provider.IFileOpenPickerUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileOpenPickerActivatedEventArgs2 : aliased constant Windows.IID := (1584602982, 36127, 17915, (175, 29, 115, 32, 92, 143, 199, 161 ));
   
   type IFileOpenPickerActivatedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CallerPackageFamilyName
   (
      This       : access IFileOpenPickerActivatedEventArgs2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileSavePickerActivatedEventArgs : aliased constant Windows.IID := (2176949489, 29926, 17287, (130, 235, 187, 143, 214, 75, 67, 70 ));
   
   type IFileSavePickerActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FileSavePickerUI
   (
      This       : access IFileSavePickerActivatedEventArgs_Interface
      ; RetVal : access Windows.Storage.Pickers.Provider.IFileSavePickerUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileSavePickerActivatedEventArgs2 : aliased constant Windows.IID := (1802763795, 11506, 19784, (140, 188, 175, 103, 210, 63, 28, 231 ));
   
   type IFileSavePickerActivatedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CallerPackageFamilyName
   (
      This       : access IFileSavePickerActivatedEventArgs2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EnterpriseId
   (
      This       : access IFileSavePickerActivatedEventArgs2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICachedFileUpdaterActivatedEventArgs : aliased constant Windows.IID := (3496915399, 14341, 20171, (183, 87, 108, 241, 94, 38, 254, 243 ));
   
   type ICachedFileUpdaterActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CachedFileUpdaterUI
   (
      This       : access ICachedFileUpdaterActivatedEventArgs_Interface
      ; RetVal : access Windows.Storage.Provider.ICachedFileUpdaterUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceActivatedEventArgs : aliased constant Windows.IID := (3444619689, 52752, 17618, (130, 52, 195, 85, 160, 115, 239, 51 ));
   
   type IDeviceActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceInformationId
   (
      This       : access IDeviceActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Verb
   (
      This       : access IDeviceActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPickerReturnedActivatedEventArgs : aliased constant Windows.IID := (906883001, 43475, 18820, (164, 237, 158, 199, 52, 96, 73, 33 ));
   
   type IPickerReturnedActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PickerOperationId
   (
      This       : access IPickerReturnedActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRestrictedLaunchActivatedEventArgs : aliased constant Windows.IID := (3770133633, 49091, 17220, (165, 218, 25, 253, 90, 39, 186, 174 ));
   
   type IRestrictedLaunchActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SharedContext
   (
      This       : access IRestrictedLaunchActivatedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILockScreenActivatedEventArgs : aliased constant Windows.IID := (1017608550, 24840, 19009, (130, 32, 238, 125, 19, 60, 133, 50 ));
   
   type ILockScreenActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Info
   (
      This       : access ILockScreenActivatedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContinuationActivatedEventArgs : aliased constant Windows.IID := (3850438325, 5471, 19092, (167, 66, 199, 224, 143, 78, 24, 140 ));
   
   type IContinuationActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContinuationData
   (
      This       : access IContinuationActivatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileOpenPickerContinuationEventArgs : aliased constant Windows.IID := (4042932026, 54504, 19155, (156, 52, 35, 8, 243, 47, 206, 201 ));
   
   type IFileOpenPickerContinuationEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Files
   (
      This       : access IFileOpenPickerContinuationEventArgs_Interface
      ; RetVal : access Windows.Storage.IVectorView_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileSavePickerContinuationEventArgs : aliased constant Windows.IID := (746876897, 15277, 20275, (140, 139, 228, 111, 174, 130, 75, 75 ));
   
   type IFileSavePickerContinuationEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_File
   (
      This       : access IFileSavePickerContinuationEventArgs_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFolderPickerContinuationEventArgs : aliased constant Windows.IID := (1367876454, 40779, 18831, (190, 176, 66, 104, 79, 110, 28, 41 ));
   
   type IFolderPickerContinuationEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Folder
   (
      This       : access IFolderPickerContinuationEventArgs_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAuthenticationBrokerContinuationEventArgs : aliased constant Windows.IID := (1977459668, 30484, 17725, (183, 255, 185, 94, 58, 23, 9, 218 ));
   
   type IWebAuthenticationBrokerContinuationEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebAuthenticationResult
   (
      This       : access IWebAuthenticationBrokerContinuationEventArgs_Interface
      ; RetVal : access Windows.Security.Authentication.Web.IWebAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderActivatedEventArgs : aliased constant Windows.IID := (1924601716, 39146, 19663, (151, 82, 70, 217, 5, 16, 4, 241 ));
   
   type IWebAccountProviderActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Operation
   (
      This       : access IWebAccountProviderActivatedEventArgs_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IWebAccountProviderOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IToastNotificationActivatedEventArgs : aliased constant Windows.IID := (2460512130, 21136, 17181, (190, 133, 196, 170, 238, 184, 104, 95 ));
   
   type IToastNotificationActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Argument
   (
      This       : access IToastNotificationActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserInput
   (
      This       : access IToastNotificationActivatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialReceiverActivatedEventArgs : aliased constant Windows.IID := (4218912471, 34286, 17774, (164, 77, 133, 215, 48, 231, 10, 237 ));
   
   type IDialReceiverActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppName
   (
      This       : access IDialReceiverActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileActivatedInfo : aliased constant Windows.IID := (2162467761, 14720, 20247, (183, 56, 137, 25, 78, 11, 143, 101 ));
   
   type ITileActivatedInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RecentlyShownNotifications
   (
      This       : access ITileActivatedInfo_Interface
      ; RetVal : access Windows.UI.Notifications.IVectorView_IShownTileNotification -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICommandLineActivationOperation : aliased constant Windows.IID := (2571839553, 50590, 20329, (188, 253, 182, 30, 212, 230, 34, 235 ));
   
   type ICommandLineActivationOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Arguments
   (
      This       : access ICommandLineActivationOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentDirectoryPath
   (
      This       : access ICommandLineActivationOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ExitCode
   (
      This       : access ICommandLineActivationOperation_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ExitCode
   (
      This       : access ICommandLineActivationOperation_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ICommandLineActivationOperation_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICommandLineActivatedEventArgs : aliased constant Windows.IID := (1158039340, 106, 18667, (138, 251, 208, 122, 178, 94, 51, 102 ));
   
   type ICommandLineActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Operation
   (
      This       : access ICommandLineActivatedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ICommandLineActivationOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStartupTaskActivatedEventArgs : aliased constant Windows.IID := (61938264, 21110, 19857, (134, 33, 84, 97, 24, 100, 213, 250 ));
   
   type IStartupTaskActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskId
   (
      This       : access IStartupTaskActivatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDevicePairingActivatedEventArgs : aliased constant Windows.IID := (3953185252, 60614, 16712, (148, 237, 244, 179, 126, 192, 91, 62 ));
   
   type IDevicePairingActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceInformation
   (
      This       : access IDevicePairingActivatedEventArgs_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVoiceCommandActivatedEventArgs : aliased constant Windows.IID := (2878528765, 36163, 19942, (151, 117, 32, 112, 75, 88, 27, 0 ));
   
   type IVoiceCommandActivatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Result
   (
      This       : access IVoiceCommandActivatedEventArgs_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISplashScreen_add_Dismissed : aliased constant Windows.IID := (1998959269, 10365, 24274, (167, 137, 42, 106, 38, 115, 199, 254 ));
   
   type TypedEventHandler_ISplashScreen_add_Dismissed_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Activation.ISplashScreen ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISplashScreen_add_Dismissed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISplashScreen_add_Dismissed_Interface
      ; sender : Windows.ApplicationModel.Activation.ISplashScreen
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_IBackgroundActivatedEventArgs : aliased constant Windows.IID := (1235253042, 59320, 23643, (157, 231, 34, 227, 60, 185, 112, 4 ));
   
   type EventHandler_IBackgroundActivatedEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_IBackgroundActivatedEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_IBackgroundActivatedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PrintTaskSettingsActivatedEventArgs is Windows.ApplicationModel.Activation.IPrintTaskSettingsActivatedEventArgs;
   subtype Print3DWorkflowActivatedEventArgs is Windows.ApplicationModel.Activation.IPrint3DWorkflowActivatedEventArgs;
   subtype LockScreenCallActivatedEventArgs is Windows.ApplicationModel.Activation.ILockScreenCallActivatedEventArgs;
   subtype CameraSettingsActivatedEventArgs is Windows.ApplicationModel.Activation.ICameraSettingsActivatedEventArgs;
   subtype ContactPickerActivatedEventArgs is Windows.ApplicationModel.Activation.IContactPickerActivatedEventArgs;
   subtype ContactCallActivatedEventArgs is Windows.ApplicationModel.Activation.IContactCallActivatedEventArgs;
   subtype ContactMessageActivatedEventArgs is Windows.ApplicationModel.Activation.IContactMessageActivatedEventArgs;
   subtype ContactMapActivatedEventArgs is Windows.ApplicationModel.Activation.IContactMapActivatedEventArgs;
   subtype ContactPostActivatedEventArgs is Windows.ApplicationModel.Activation.IContactPostActivatedEventArgs;
   subtype ContactVideoCallActivatedEventArgs is Windows.ApplicationModel.Activation.IContactVideoCallActivatedEventArgs;
   subtype WalletActionActivatedEventArgs is Windows.ApplicationModel.Activation.IWalletActionActivatedEventArgs;
   subtype AppointmentsProviderAddAppointmentActivatedEventArgs is Windows.ApplicationModel.Activation.IAppointmentsProviderAddAppointmentActivatedEventArgs;
   subtype AppointmentsProviderReplaceAppointmentActivatedEventArgs is Windows.ApplicationModel.Activation.IAppointmentsProviderReplaceAppointmentActivatedEventArgs;
   subtype AppointmentsProviderRemoveAppointmentActivatedEventArgs is Windows.ApplicationModel.Activation.IAppointmentsProviderRemoveAppointmentActivatedEventArgs;
   subtype AppointmentsProviderShowAppointmentDetailsActivatedEventArgs is Windows.ApplicationModel.Activation.IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs;
   subtype AppointmentsProviderShowTimeFrameActivatedEventArgs is Windows.ApplicationModel.Activation.IAppointmentsProviderShowTimeFrameActivatedEventArgs;
   subtype BackgroundActivatedEventArgs is Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs;
   subtype ContactPanelActivatedEventArgs is Windows.ApplicationModel.Activation.IContactPanelActivatedEventArgs;
   subtype UserDataAccountProviderActivatedEventArgs is Windows.ApplicationModel.Activation.IUserDataAccountProviderActivatedEventArgs;
   subtype SplashScreen is Windows.ApplicationModel.Activation.ISplashScreen;
   subtype TileActivatedInfo is Windows.ApplicationModel.Activation.ITileActivatedInfo;
   subtype LaunchActivatedEventArgs is Windows.ApplicationModel.Activation.ILaunchActivatedEventArgs;
   subtype SearchActivatedEventArgs is Windows.ApplicationModel.Activation.ISearchActivatedEventArgs;
   subtype ShareTargetActivatedEventArgs is Windows.ApplicationModel.Activation.IShareTargetActivatedEventArgs;
   subtype FileActivatedEventArgs is Windows.ApplicationModel.Activation.IFileActivatedEventArgs;
   subtype ProtocolActivatedEventArgs is Windows.ApplicationModel.Activation.IProtocolActivatedEventArgs;
   subtype ProtocolForResultsActivatedEventArgs is Windows.ApplicationModel.Activation.IProtocolForResultsActivatedEventArgs;
   subtype FileOpenPickerActivatedEventArgs is Windows.ApplicationModel.Activation.IFileOpenPickerActivatedEventArgs;
   subtype FileSavePickerActivatedEventArgs is Windows.ApplicationModel.Activation.IFileSavePickerActivatedEventArgs;
   subtype CachedFileUpdaterActivatedEventArgs is Windows.ApplicationModel.Activation.ICachedFileUpdaterActivatedEventArgs;
   subtype DeviceActivatedEventArgs is Windows.ApplicationModel.Activation.IDeviceActivatedEventArgs;
   subtype PickerReturnedActivatedEventArgs is Windows.ApplicationModel.Activation.IPickerReturnedActivatedEventArgs;
   subtype RestrictedLaunchActivatedEventArgs is Windows.ApplicationModel.Activation.IRestrictedLaunchActivatedEventArgs;
   subtype LockScreenActivatedEventArgs is Windows.ApplicationModel.Activation.ILockScreenActivatedEventArgs;
   subtype FileOpenPickerContinuationEventArgs is Windows.ApplicationModel.Activation.IFileOpenPickerContinuationEventArgs;
   subtype FileSavePickerContinuationEventArgs is Windows.ApplicationModel.Activation.IFileSavePickerContinuationEventArgs;
   subtype FolderPickerContinuationEventArgs is Windows.ApplicationModel.Activation.IFolderPickerContinuationEventArgs;
   subtype WebAuthenticationBrokerContinuationEventArgs is Windows.ApplicationModel.Activation.IWebAuthenticationBrokerContinuationEventArgs;
   subtype WebAccountProviderActivatedEventArgs is Windows.ApplicationModel.Activation.IWebAccountProviderActivatedEventArgs;
   subtype ToastNotificationActivatedEventArgs is Windows.ApplicationModel.Activation.IToastNotificationActivatedEventArgs;
   subtype DialReceiverActivatedEventArgs is Windows.ApplicationModel.Activation.IDialReceiverActivatedEventArgs;
   subtype LockScreenComponentActivatedEventArgs is Windows.ApplicationModel.Activation.IActivatedEventArgs;
   subtype CommandLineActivationOperation is Windows.ApplicationModel.Activation.ICommandLineActivationOperation;
   subtype CommandLineActivatedEventArgs is Windows.ApplicationModel.Activation.ICommandLineActivatedEventArgs;
   subtype StartupTaskActivatedEventArgs is Windows.ApplicationModel.Activation.IStartupTaskActivatedEventArgs;
   subtype DevicePairingActivatedEventArgs is Windows.ApplicationModel.Activation.IDevicePairingActivatedEventArgs;
   subtype VoiceCommandActivatedEventArgs is Windows.ApplicationModel.Activation.IVoiceCommandActivatedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
