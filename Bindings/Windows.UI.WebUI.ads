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
limited with Windows.ApplicationModel.Activation;
limited with Windows.ApplicationModel.Calls;
limited with Windows.ApplicationModel.Contacts.Provider;
limited with Windows.ApplicationModel.Contacts;
limited with Windows.ApplicationModel.Search;
limited with Windows.ApplicationModel.Wallet;
limited with Windows.ApplicationModel.Appointments.AppointmentsProvider;
limited with Windows.System;
with Windows.Foundation;
limited with Windows.ApplicationModel.UserDataAccounts.Provider;
limited with Windows.Devices.Enumeration;
limited with Windows.Media.SpeechRecognition;
limited with Windows.ApplicationModel.DataTransfer.ShareTarget;
with Windows.Foundation.Collections;
limited with Windows.Storage;
limited with Windows.Storage.Search;
limited with Windows.Storage.Pickers.Provider;
limited with Windows.Storage.Provider;
limited with Windows.Security.Authentication.Web;
limited with Windows.Security.Authentication.Web.Provider;
limited with Windows.ApplicationModel;
with Windows; use Windows;
limited with Windows.ApplicationModel.Background;
limited with Windows.ApplicationModel.Core;
limited with Windows.Graphics.Printing;
--------------------------------------------------------------------------------
package Windows.UI.WebUI is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PrintContent is (
      AllPages,
      CurrentPage,
      CustomPageRange,
      CurrentSelection
   );
   for PrintContent use (
      AllPages => 0,
      CurrentPage => 1,
      CustomPageRange => 2,
      CurrentSelection => 3
   );
   for PrintContent'Size use 32;
   
   type PrintContent_Ptr is access PrintContent;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type ActivatedEventHandler_Interface;
   type ActivatedEventHandler is access all ActivatedEventHandler_Interface'Class;
   type ActivatedEventHandler_Ptr is access all ActivatedEventHandler;
   type ResumingEventHandler_Interface;
   type ResumingEventHandler is access all ResumingEventHandler_Interface'Class;
   type ResumingEventHandler_Ptr is access all ResumingEventHandler;
   type SuspendingEventHandler_Interface;
   type SuspendingEventHandler is access all SuspendingEventHandler_Interface'Class;
   type SuspendingEventHandler_Ptr is access all SuspendingEventHandler;
   type LeavingBackgroundEventHandler_Interface;
   type LeavingBackgroundEventHandler is access all LeavingBackgroundEventHandler_Interface'Class;
   type LeavingBackgroundEventHandler_Ptr is access all LeavingBackgroundEventHandler;
   type EnteredBackgroundEventHandler_Interface;
   type EnteredBackgroundEventHandler is access all EnteredBackgroundEventHandler_Interface'Class;
   type EnteredBackgroundEventHandler_Ptr is access all EnteredBackgroundEventHandler;
   type NavigatedEventHandler_Interface;
   type NavigatedEventHandler is access all NavigatedEventHandler_Interface'Class;
   type NavigatedEventHandler_Ptr is access all NavigatedEventHandler;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IActivatedDeferral_Interface;
   type IActivatedDeferral is access all IActivatedDeferral_Interface'Class;
   type IActivatedDeferral_Ptr is access all IActivatedDeferral;
   type IActivatedOperation_Interface;
   type IActivatedOperation is access all IActivatedOperation_Interface'Class;
   type IActivatedOperation_Ptr is access all IActivatedOperation;
   type IActivatedEventArgsDeferral_Interface;
   type IActivatedEventArgsDeferral is access all IActivatedEventArgsDeferral_Interface'Class;
   type IActivatedEventArgsDeferral_Ptr is access all IActivatedEventArgsDeferral;
   type IWebUINavigatedEventArgs_Interface;
   type IWebUINavigatedEventArgs is access all IWebUINavigatedEventArgs_Interface'Class;
   type IWebUINavigatedEventArgs_Ptr is access all IWebUINavigatedEventArgs;
   type IWebUIBackgroundTaskInstance_Interface;
   type IWebUIBackgroundTaskInstance is access all IWebUIBackgroundTaskInstance_Interface'Class;
   type IWebUIBackgroundTaskInstance_Ptr is access all IWebUIBackgroundTaskInstance;
   type IWebUIBackgroundTaskInstanceStatics_Interface;
   type IWebUIBackgroundTaskInstanceStatics is access all IWebUIBackgroundTaskInstanceStatics_Interface'Class;
   type IWebUIBackgroundTaskInstanceStatics_Ptr is access all IWebUIBackgroundTaskInstanceStatics;
   type IWebUINavigatedDeferral_Interface;
   type IWebUINavigatedDeferral is access all IWebUINavigatedDeferral_Interface'Class;
   type IWebUINavigatedDeferral_Ptr is access all IWebUINavigatedDeferral;
   type IWebUINavigatedOperation_Interface;
   type IWebUINavigatedOperation is access all IWebUINavigatedOperation_Interface'Class;
   type IWebUINavigatedOperation_Ptr is access all IWebUINavigatedOperation;
   type IWebUIActivationStatics_Interface;
   type IWebUIActivationStatics is access all IWebUIActivationStatics_Interface'Class;
   type IWebUIActivationStatics_Ptr is access all IWebUIActivationStatics;
   type IWebUIActivationStatics2_Interface;
   type IWebUIActivationStatics2 is access all IWebUIActivationStatics2_Interface'Class;
   type IWebUIActivationStatics2_Ptr is access all IWebUIActivationStatics2;
   type IWebUIActivationStatics3_Interface;
   type IWebUIActivationStatics3 is access all IWebUIActivationStatics3_Interface'Class;
   type IWebUIActivationStatics3_Ptr is access all IWebUIActivationStatics3;
   type IHtmlPrintDocumentSource_Interface;
   type IHtmlPrintDocumentSource is access all IHtmlPrintDocumentSource_Interface'Class;
   type IHtmlPrintDocumentSource_Ptr is access all IHtmlPrintDocumentSource;
   type IPrintTaskSettingsActivatedEventArgs_Imported_Interface;
   type IPrintTaskSettingsActivatedEventArgs_Imported is access all IPrintTaskSettingsActivatedEventArgs_Imported_Interface'Class;
   type IPrintTaskSettingsActivatedEventArgs_Imported_Ptr is access all IPrintTaskSettingsActivatedEventArgs_Imported;
   type IActivatedEventArgs_Imported_Interface;
   type IActivatedEventArgs_Imported is access all IActivatedEventArgs_Imported_Interface'Class;
   type IActivatedEventArgs_Imported_Ptr is access all IActivatedEventArgs_Imported;
   type IPrint3DWorkflowActivatedEventArgs_Imported_Interface;
   type IPrint3DWorkflowActivatedEventArgs_Imported is access all IPrint3DWorkflowActivatedEventArgs_Imported_Interface'Class;
   type IPrint3DWorkflowActivatedEventArgs_Imported_Ptr is access all IPrint3DWorkflowActivatedEventArgs_Imported;
   type ILockScreenCallActivatedEventArgs_Imported_Interface;
   type ILockScreenCallActivatedEventArgs_Imported is access all ILockScreenCallActivatedEventArgs_Imported_Interface'Class;
   type ILockScreenCallActivatedEventArgs_Imported_Ptr is access all ILockScreenCallActivatedEventArgs_Imported;
   type ILaunchActivatedEventArgs_Imported_Interface;
   type ILaunchActivatedEventArgs_Imported is access all ILaunchActivatedEventArgs_Imported_Interface'Class;
   type ILaunchActivatedEventArgs_Imported_Ptr is access all ILaunchActivatedEventArgs_Imported;
   type IApplicationViewActivatedEventArgs_Imported_Interface;
   type IApplicationViewActivatedEventArgs_Imported is access all IApplicationViewActivatedEventArgs_Imported_Interface'Class;
   type IApplicationViewActivatedEventArgs_Imported_Ptr is access all IApplicationViewActivatedEventArgs_Imported;
   type ICameraSettingsActivatedEventArgs_Imported_Interface;
   type ICameraSettingsActivatedEventArgs_Imported is access all ICameraSettingsActivatedEventArgs_Imported_Interface'Class;
   type ICameraSettingsActivatedEventArgs_Imported_Ptr is access all ICameraSettingsActivatedEventArgs_Imported;
   type IContactPickerActivatedEventArgs_Imported_Interface;
   type IContactPickerActivatedEventArgs_Imported is access all IContactPickerActivatedEventArgs_Imported_Interface'Class;
   type IContactPickerActivatedEventArgs_Imported_Ptr is access all IContactPickerActivatedEventArgs_Imported;
   type IContactCallActivatedEventArgs_Imported_Interface;
   type IContactCallActivatedEventArgs_Imported is access all IContactCallActivatedEventArgs_Imported_Interface'Class;
   type IContactCallActivatedEventArgs_Imported_Ptr is access all IContactCallActivatedEventArgs_Imported;
   type IContactActivatedEventArgs_Imported_Interface;
   type IContactActivatedEventArgs_Imported is access all IContactActivatedEventArgs_Imported_Interface'Class;
   type IContactActivatedEventArgs_Imported_Ptr is access all IContactActivatedEventArgs_Imported;
   type IContactMessageActivatedEventArgs_Imported_Interface;
   type IContactMessageActivatedEventArgs_Imported is access all IContactMessageActivatedEventArgs_Imported_Interface'Class;
   type IContactMessageActivatedEventArgs_Imported_Ptr is access all IContactMessageActivatedEventArgs_Imported;
   type IContactMapActivatedEventArgs_Imported_Interface;
   type IContactMapActivatedEventArgs_Imported is access all IContactMapActivatedEventArgs_Imported_Interface'Class;
   type IContactMapActivatedEventArgs_Imported_Ptr is access all IContactMapActivatedEventArgs_Imported;
   type IContactPostActivatedEventArgs_Imported_Interface;
   type IContactPostActivatedEventArgs_Imported is access all IContactPostActivatedEventArgs_Imported_Interface'Class;
   type IContactPostActivatedEventArgs_Imported_Ptr is access all IContactPostActivatedEventArgs_Imported;
   type IContactVideoCallActivatedEventArgs_Imported_Interface;
   type IContactVideoCallActivatedEventArgs_Imported is access all IContactVideoCallActivatedEventArgs_Imported_Interface'Class;
   type IContactVideoCallActivatedEventArgs_Imported_Ptr is access all IContactVideoCallActivatedEventArgs_Imported;
   type ISearchActivatedEventArgs_Imported_Interface;
   type ISearchActivatedEventArgs_Imported is access all ISearchActivatedEventArgs_Imported_Interface'Class;
   type ISearchActivatedEventArgs_Imported_Ptr is access all ISearchActivatedEventArgs_Imported;
   type ISearchActivatedEventArgsWithLinguisticDetails_Imported_Interface;
   type ISearchActivatedEventArgsWithLinguisticDetails_Imported is access all ISearchActivatedEventArgsWithLinguisticDetails_Imported_Interface'Class;
   type ISearchActivatedEventArgsWithLinguisticDetails_Imported_Ptr is access all ISearchActivatedEventArgsWithLinguisticDetails_Imported;
   type IWalletActionActivatedEventArgs_Imported_Interface;
   type IWalletActionActivatedEventArgs_Imported is access all IWalletActionActivatedEventArgs_Imported_Interface'Class;
   type IWalletActionActivatedEventArgs_Imported_Ptr is access all IWalletActionActivatedEventArgs_Imported;
   type IAppointmentsProviderAddAppointmentActivatedEventArgs_Imported_Interface;
   type IAppointmentsProviderAddAppointmentActivatedEventArgs_Imported is access all IAppointmentsProviderAddAppointmentActivatedEventArgs_Imported_Interface'Class;
   type IAppointmentsProviderAddAppointmentActivatedEventArgs_Imported_Ptr is access all IAppointmentsProviderAddAppointmentActivatedEventArgs_Imported;
   type IAppointmentsProviderActivatedEventArgs_Imported_Interface;
   type IAppointmentsProviderActivatedEventArgs_Imported is access all IAppointmentsProviderActivatedEventArgs_Imported_Interface'Class;
   type IAppointmentsProviderActivatedEventArgs_Imported_Ptr is access all IAppointmentsProviderActivatedEventArgs_Imported;
   type IActivatedEventArgsWithUser_Imported_Interface;
   type IActivatedEventArgsWithUser_Imported is access all IActivatedEventArgsWithUser_Imported_Interface'Class;
   type IActivatedEventArgsWithUser_Imported_Ptr is access all IActivatedEventArgsWithUser_Imported;
   type IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Imported_Interface;
   type IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Imported is access all IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Imported_Interface'Class;
   type IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Imported_Ptr is access all IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Imported;
   type IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Imported_Interface;
   type IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Imported is access all IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Imported_Interface'Class;
   type IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Imported_Ptr is access all IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Imported;
   type IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Imported_Interface;
   type IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Imported is access all IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Imported_Interface'Class;
   type IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Imported_Ptr is access all IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Imported;
   type IAppointmentsProviderShowTimeFrameActivatedEventArgs_Imported_Interface;
   type IAppointmentsProviderShowTimeFrameActivatedEventArgs_Imported is access all IAppointmentsProviderShowTimeFrameActivatedEventArgs_Imported_Interface'Class;
   type IAppointmentsProviderShowTimeFrameActivatedEventArgs_Imported_Ptr is access all IAppointmentsProviderShowTimeFrameActivatedEventArgs_Imported;
   type IContactPanelActivatedEventArgs_Imported_Interface;
   type IContactPanelActivatedEventArgs_Imported is access all IContactPanelActivatedEventArgs_Imported_Interface'Class;
   type IContactPanelActivatedEventArgs_Imported_Ptr is access all IContactPanelActivatedEventArgs_Imported;
   type IUserDataAccountProviderActivatedEventArgs_Imported_Interface;
   type IUserDataAccountProviderActivatedEventArgs_Imported is access all IUserDataAccountProviderActivatedEventArgs_Imported_Interface'Class;
   type IUserDataAccountProviderActivatedEventArgs_Imported_Ptr is access all IUserDataAccountProviderActivatedEventArgs_Imported;
   type IDevicePairingActivatedEventArgs_Imported_Interface;
   type IDevicePairingActivatedEventArgs_Imported is access all IDevicePairingActivatedEventArgs_Imported_Interface'Class;
   type IDevicePairingActivatedEventArgs_Imported_Ptr is access all IDevicePairingActivatedEventArgs_Imported;
   type IVoiceCommandActivatedEventArgs_Imported_Interface;
   type IVoiceCommandActivatedEventArgs_Imported is access all IVoiceCommandActivatedEventArgs_Imported_Interface'Class;
   type IVoiceCommandActivatedEventArgs_Imported_Ptr is access all IVoiceCommandActivatedEventArgs_Imported;
   type IPrelaunchActivatedEventArgs_Imported_Interface;
   type IPrelaunchActivatedEventArgs_Imported is access all IPrelaunchActivatedEventArgs_Imported_Interface'Class;
   type IPrelaunchActivatedEventArgs_Imported_Ptr is access all IPrelaunchActivatedEventArgs_Imported;
   type IShareTargetActivatedEventArgs_Imported_Interface;
   type IShareTargetActivatedEventArgs_Imported is access all IShareTargetActivatedEventArgs_Imported_Interface'Class;
   type IShareTargetActivatedEventArgs_Imported_Ptr is access all IShareTargetActivatedEventArgs_Imported;
   type IFileActivatedEventArgs_Imported_Interface;
   type IFileActivatedEventArgs_Imported is access all IFileActivatedEventArgs_Imported_Interface'Class;
   type IFileActivatedEventArgs_Imported_Ptr is access all IFileActivatedEventArgs_Imported;
   type IFileActivatedEventArgsWithNeighboringFiles_Imported_Interface;
   type IFileActivatedEventArgsWithNeighboringFiles_Imported is access all IFileActivatedEventArgsWithNeighboringFiles_Imported_Interface'Class;
   type IFileActivatedEventArgsWithNeighboringFiles_Imported_Ptr is access all IFileActivatedEventArgsWithNeighboringFiles_Imported;
   type IProtocolActivatedEventArgs_Imported_Interface;
   type IProtocolActivatedEventArgs_Imported is access all IProtocolActivatedEventArgs_Imported_Interface'Class;
   type IProtocolActivatedEventArgs_Imported_Ptr is access all IProtocolActivatedEventArgs_Imported;
   type IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Imported_Interface;
   type IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Imported is access all IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Imported_Interface'Class;
   type IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Imported_Ptr is access all IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Imported;
   type IProtocolForResultsActivatedEventArgs_Imported_Interface;
   type IProtocolForResultsActivatedEventArgs_Imported is access all IProtocolForResultsActivatedEventArgs_Imported_Interface'Class;
   type IProtocolForResultsActivatedEventArgs_Imported_Ptr is access all IProtocolForResultsActivatedEventArgs_Imported;
   type IFileOpenPickerActivatedEventArgs_Imported_Interface;
   type IFileOpenPickerActivatedEventArgs_Imported is access all IFileOpenPickerActivatedEventArgs_Imported_Interface'Class;
   type IFileOpenPickerActivatedEventArgs_Imported_Ptr is access all IFileOpenPickerActivatedEventArgs_Imported;
   type IFileOpenPickerActivatedEventArgs2_Imported_Interface;
   type IFileOpenPickerActivatedEventArgs2_Imported is access all IFileOpenPickerActivatedEventArgs2_Imported_Interface'Class;
   type IFileOpenPickerActivatedEventArgs2_Imported_Ptr is access all IFileOpenPickerActivatedEventArgs2_Imported;
   type IFileSavePickerActivatedEventArgs_Imported_Interface;
   type IFileSavePickerActivatedEventArgs_Imported is access all IFileSavePickerActivatedEventArgs_Imported_Interface'Class;
   type IFileSavePickerActivatedEventArgs_Imported_Ptr is access all IFileSavePickerActivatedEventArgs_Imported;
   type IFileSavePickerActivatedEventArgs2_Imported_Interface;
   type IFileSavePickerActivatedEventArgs2_Imported is access all IFileSavePickerActivatedEventArgs2_Imported_Interface'Class;
   type IFileSavePickerActivatedEventArgs2_Imported_Ptr is access all IFileSavePickerActivatedEventArgs2_Imported;
   type ICachedFileUpdaterActivatedEventArgs_Imported_Interface;
   type ICachedFileUpdaterActivatedEventArgs_Imported is access all ICachedFileUpdaterActivatedEventArgs_Imported_Interface'Class;
   type ICachedFileUpdaterActivatedEventArgs_Imported_Ptr is access all ICachedFileUpdaterActivatedEventArgs_Imported;
   type IDeviceActivatedEventArgs_Imported_Interface;
   type IDeviceActivatedEventArgs_Imported is access all IDeviceActivatedEventArgs_Imported_Interface'Class;
   type IDeviceActivatedEventArgs_Imported_Ptr is access all IDeviceActivatedEventArgs_Imported;
   type ILockScreenActivatedEventArgs_Imported_Interface;
   type ILockScreenActivatedEventArgs_Imported is access all ILockScreenActivatedEventArgs_Imported_Interface'Class;
   type ILockScreenActivatedEventArgs_Imported_Ptr is access all ILockScreenActivatedEventArgs_Imported;
   type IRestrictedLaunchActivatedEventArgs_Imported_Interface;
   type IRestrictedLaunchActivatedEventArgs_Imported is access all IRestrictedLaunchActivatedEventArgs_Imported_Interface'Class;
   type IRestrictedLaunchActivatedEventArgs_Imported_Ptr is access all IRestrictedLaunchActivatedEventArgs_Imported;
   type IFileOpenPickerContinuationEventArgs_Imported_Interface;
   type IFileOpenPickerContinuationEventArgs_Imported is access all IFileOpenPickerContinuationEventArgs_Imported_Interface'Class;
   type IFileOpenPickerContinuationEventArgs_Imported_Ptr is access all IFileOpenPickerContinuationEventArgs_Imported;
   type IContinuationActivatedEventArgs_Imported_Interface;
   type IContinuationActivatedEventArgs_Imported is access all IContinuationActivatedEventArgs_Imported_Interface'Class;
   type IContinuationActivatedEventArgs_Imported_Ptr is access all IContinuationActivatedEventArgs_Imported;
   type IFileSavePickerContinuationEventArgs_Imported_Interface;
   type IFileSavePickerContinuationEventArgs_Imported is access all IFileSavePickerContinuationEventArgs_Imported_Interface'Class;
   type IFileSavePickerContinuationEventArgs_Imported_Ptr is access all IFileSavePickerContinuationEventArgs_Imported;
   type IFolderPickerContinuationEventArgs_Imported_Interface;
   type IFolderPickerContinuationEventArgs_Imported is access all IFolderPickerContinuationEventArgs_Imported_Interface'Class;
   type IFolderPickerContinuationEventArgs_Imported_Ptr is access all IFolderPickerContinuationEventArgs_Imported;
   type IWebAuthenticationBrokerContinuationEventArgs_Imported_Interface;
   type IWebAuthenticationBrokerContinuationEventArgs_Imported is access all IWebAuthenticationBrokerContinuationEventArgs_Imported_Interface'Class;
   type IWebAuthenticationBrokerContinuationEventArgs_Imported_Ptr is access all IWebAuthenticationBrokerContinuationEventArgs_Imported;
   type IWebAccountProviderActivatedEventArgs_Imported_Interface;
   type IWebAccountProviderActivatedEventArgs_Imported is access all IWebAccountProviderActivatedEventArgs_Imported_Interface'Class;
   type IWebAccountProviderActivatedEventArgs_Imported_Ptr is access all IWebAccountProviderActivatedEventArgs_Imported;
   type IDialReceiverActivatedEventArgs_Imported_Interface;
   type IDialReceiverActivatedEventArgs_Imported is access all IDialReceiverActivatedEventArgs_Imported_Interface'Class;
   type IDialReceiverActivatedEventArgs_Imported_Ptr is access all IDialReceiverActivatedEventArgs_Imported;
   type IToastNotificationActivatedEventArgs_Imported_Interface;
   type IToastNotificationActivatedEventArgs_Imported is access all IToastNotificationActivatedEventArgs_Imported_Interface'Class;
   type IToastNotificationActivatedEventArgs_Imported_Ptr is access all IToastNotificationActivatedEventArgs_Imported;
   type ICommandLineActivatedEventArgs_Imported_Interface;
   type ICommandLineActivatedEventArgs_Imported is access all ICommandLineActivatedEventArgs_Imported_Interface'Class;
   type ICommandLineActivatedEventArgs_Imported_Ptr is access all ICommandLineActivatedEventArgs_Imported;
   type IStartupTaskActivatedEventArgs_Imported_Interface;
   type IStartupTaskActivatedEventArgs_Imported is access all IStartupTaskActivatedEventArgs_Imported_Interface'Class;
   type IStartupTaskActivatedEventArgs_Imported_Ptr is access all IStartupTaskActivatedEventArgs_Imported;
   type ISuspendingDeferral_Imported_Interface;
   type ISuspendingDeferral_Imported is access all ISuspendingDeferral_Imported_Interface'Class;
   type ISuspendingDeferral_Imported_Ptr is access all ISuspendingDeferral_Imported;
   type ISuspendingOperation_Imported_Interface;
   type ISuspendingOperation_Imported is access all ISuspendingOperation_Imported_Interface'Class;
   type ISuspendingOperation_Imported_Ptr is access all ISuspendingOperation_Imported;
   type ISuspendingEventArgs_Imported_Interface;
   type ISuspendingEventArgs_Imported is access all ISuspendingEventArgs_Imported_Interface'Class;
   type ISuspendingEventArgs_Imported_Ptr is access all ISuspendingEventArgs_Imported;
   type ILeavingBackgroundEventArgs_Imported_Interface;
   type ILeavingBackgroundEventArgs_Imported is access all ILeavingBackgroundEventArgs_Imported_Interface'Class;
   type ILeavingBackgroundEventArgs_Imported_Ptr is access all ILeavingBackgroundEventArgs_Imported;
   type IEnteredBackgroundEventArgs_Imported_Interface;
   type IEnteredBackgroundEventArgs_Imported is access all IEnteredBackgroundEventArgs_Imported_Interface'Class;
   type IEnteredBackgroundEventArgs_Imported_Ptr is access all IEnteredBackgroundEventArgs_Imported;
   type IBackgroundTaskInstance_Imported_Interface;
   type IBackgroundTaskInstance_Imported is access all IBackgroundTaskInstance_Imported_Interface'Class;
   type IBackgroundTaskInstance_Imported_Ptr is access all IBackgroundTaskInstance_Imported;
   type IPrintDocumentSource_Imported_Interface;
   type IPrintDocumentSource_Imported is access all IPrintDocumentSource_Imported_Interface'Class;
   type IPrintDocumentSource_Imported_Ptr is access all IPrintDocumentSource_Imported;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IActivatedDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IActivatedDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IActivatedDeferral : aliased constant Windows.IID := (3283949944, 42033, 18904, (167, 106, 57, 90, 78, 3, 220, 243 ));
   
   ------------------------------------------------------------------------
   type IActivatedOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IActivatedOperation_Interface
      ; RetVal : access Windows.UI.WebUI.IActivatedDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IActivatedOperation : aliased constant Windows.IID := (3063985340, 50890, 17149, (152, 24, 113, 144, 78, 69, 254, 215 ));
   
   ------------------------------------------------------------------------
   type IActivatedEventArgsDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivatedOperation
   (
      This       : access IActivatedEventArgsDeferral_Interface
      ; RetVal : access Windows.UI.WebUI.IActivatedOperation
   )
   return Windows.HRESULT is abstract;
   
   IID_IActivatedEventArgsDeferral : aliased constant Windows.IID := (3396165492, 25538, 17574, (185, 123, 217, 160, 60, 32, 188, 155 ));
   
   ------------------------------------------------------------------------
   type IWebUINavigatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NavigatedOperation
   (
      This       : access IWebUINavigatedEventArgs_Interface
      ; RetVal : access Windows.UI.WebUI.IWebUINavigatedOperation
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebUINavigatedEventArgs : aliased constant Windows.IID := (2807579064, 9369, 16432, (166, 157, 21, 210, 217, 207, 229, 36 ));
   
   ------------------------------------------------------------------------
   type IWebUIBackgroundTaskInstance_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Succeeded
   (
      This       : access IWebUIBackgroundTaskInstance_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Succeeded
   (
      This       : access IWebUIBackgroundTaskInstance_Interface
      ; succeeded : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebUIBackgroundTaskInstance : aliased constant Windows.IID := (603008037, 58103, 18241, (188, 156, 57, 69, 149, 222, 36, 220 ));
   
   ------------------------------------------------------------------------
   type IWebUIBackgroundTaskInstanceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IWebUIBackgroundTaskInstanceStatics_Interface
      ; RetVal : access Windows.UI.WebUI.IWebUIBackgroundTaskInstance
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebUIBackgroundTaskInstanceStatics : aliased constant Windows.IID := (2625262225, 6574, 19619, (185, 75, 254, 78, 199, 68, 167, 64 ));
   
   ------------------------------------------------------------------------
   type IWebUINavigatedDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IWebUINavigatedDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebUINavigatedDeferral : aliased constant Windows.IID := (3624149069, 33567, 18146, (180, 50, 58, 252, 226, 17, 249, 98 ));
   
   ------------------------------------------------------------------------
   type IWebUINavigatedOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IWebUINavigatedOperation_Interface
      ; RetVal : access Windows.UI.WebUI.IWebUINavigatedDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebUINavigatedOperation : aliased constant Windows.IID := (2056675080, 33154, 19081, (171, 103, 132, 146, 232, 117, 13, 75 ));
   
   ------------------------------------------------------------------------
   type IWebUIActivationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Activated
   (
      This       : access IWebUIActivationStatics_Interface
      ; handler : Windows.UI.WebUI.ActivatedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Activated
   (
      This       : access IWebUIActivationStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Suspending
   (
      This       : access IWebUIActivationStatics_Interface
      ; handler : Windows.UI.WebUI.SuspendingEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Suspending
   (
      This       : access IWebUIActivationStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Resuming
   (
      This       : access IWebUIActivationStatics_Interface
      ; handler : Windows.UI.WebUI.ResumingEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Resuming
   (
      This       : access IWebUIActivationStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Navigated
   (
      This       : access IWebUIActivationStatics_Interface
      ; handler : Windows.UI.WebUI.NavigatedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Navigated
   (
      This       : access IWebUIActivationStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebUIActivationStatics : aliased constant Windows.IID := (890996413, 17331, 18475, (133, 219, 53, 216, 123, 81, 122, 217 ));
   
   ------------------------------------------------------------------------
   type IWebUIActivationStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_LeavingBackground
   (
      This       : access IWebUIActivationStatics2_Interface
      ; handler : Windows.UI.WebUI.LeavingBackgroundEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LeavingBackground
   (
      This       : access IWebUIActivationStatics2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnteredBackground
   (
      This       : access IWebUIActivationStatics2_Interface
      ; handler : Windows.UI.WebUI.EnteredBackgroundEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnteredBackground
   (
      This       : access IWebUIActivationStatics2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function EnablePrelaunch
   (
      This       : access IWebUIActivationStatics2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebUIActivationStatics2 : aliased constant Windows.IID := (3370682006, 19832, 19108, (143, 6, 42, 158, 173, 198, 196, 10 ));
   
   ------------------------------------------------------------------------
   type IWebUIActivationStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestRestartAsync
   (
      This       : access IWebUIActivationStatics3_Interface
      ; launchArguments : Windows.String
      ; RetVal : access Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestRestartForUserAsync
   (
      This       : access IWebUIActivationStatics3_Interface
      ; user : Windows.System.IUser
      ; launchArguments : Windows.String
      ; RetVal : access Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IWebUIActivationStatics3 : aliased constant Windows.IID := (2443949702, 6901, 17477, (180, 159, 148, 89, 244, 15, 200, 222 ));
   
   ------------------------------------------------------------------------
   type IHtmlPrintDocumentSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; RetVal : access Windows.UI.WebUI.PrintContent
   )
   return Windows.HRESULT is abstract;
   
   function put_Content
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; value : Windows.UI.WebUI.PrintContent
   )
   return Windows.HRESULT is abstract;
   
   function get_LeftMargin
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_LeftMargin
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_TopMargin
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_TopMargin
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RightMargin
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RightMargin
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_BottomMargin
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_BottomMargin
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_EnableHeaderFooter
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EnableHeaderFooter
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShrinkToFit
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShrinkToFit
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PercentScale
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_PercentScale
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; scalePercent : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_PageRange
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TrySetPageRange
   (
      This       : access IHtmlPrintDocumentSource_Interface
      ; strPageRange : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IHtmlPrintDocumentSource : aliased constant Windows.IID := (3467003546, 3589, 18042, (171, 201, 54, 236, 29, 76, 220, 182 ));
   
   ------------------------------------------------------------------------
   type IPrintTaskSettingsActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Configuration
   (
      This       : access IPrintTaskSettingsActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Devices.Printers.Extensions.IPrintTaskConfiguration
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ActivationKind
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviousExecutionState
   (
      This       : access IActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ApplicationExecutionState
   )
   return Windows.HRESULT is abstract;
   
   function get_SplashScreen
   (
      This       : access IActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ISplashScreen
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IPrint3DWorkflowActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Workflow
   (
      This       : access IPrint3DWorkflowActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Devices.Printers.Extensions.IPrint3DWorkflow
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ILockScreenCallActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CallUI
   (
      This       : access ILockScreenCallActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Calls.ILockScreenCallUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ILaunchActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Arguments
   (
      This       : access ILaunchActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TileId
   (
      This       : access ILaunchActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IApplicationViewActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentlyShownApplicationViewId
   (
      This       : access IApplicationViewActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ICameraSettingsActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoDeviceController
   (
      This       : access ICameraSettingsActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoDeviceExtension
   (
      This       : access ICameraSettingsActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IContactPickerActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactPickerUI
   (
      This       : access IContactPickerActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.Provider.IContactPickerUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IContactCallActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceId
   (
      This       : access IContactCallActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceUserId
   (
      This       : access IContactCallActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactCallActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IContactActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Verb
   (
      This       : access IContactActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IContactMessageActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceId
   (
      This       : access IContactMessageActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceUserId
   (
      This       : access IContactMessageActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactMessageActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IContactMapActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Address
   (
      This       : access IContactMapActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactMapActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IContactPostActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceId
   (
      This       : access IContactPostActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceUserId
   (
      This       : access IContactPostActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactPostActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IContactVideoCallActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceId
   (
      This       : access IContactVideoCallActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceUserId
   (
      This       : access IContactVideoCallActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactVideoCallActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ISearchActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QueryText
   (
      This       : access ISearchActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access ISearchActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ISearchActivatedEventArgsWithLinguisticDetails_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LinguisticDetails
   (
      This       : access ISearchActivatedEventArgsWithLinguisticDetails_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchPaneQueryLinguisticDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IWalletActionActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ItemId
   (
      This       : access IWalletActionActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ActionKind
   (
      This       : access IWalletActionActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.WalletActionKind
   )
   return Windows.HRESULT is abstract;
   
   function get_ActionId
   (
      This       : access IWalletActionActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IAppointmentsProviderAddAppointmentActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AddAppointmentOperation
   (
      This       : access IAppointmentsProviderAddAppointmentActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentsProvider.IAddAppointmentOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IAppointmentsProviderActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Verb
   (
      This       : access IAppointmentsProviderActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IActivatedEventArgsWithUser_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IActivatedEventArgsWithUser_Imported_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ReplaceAppointmentOperation
   (
      This       : access IAppointmentsProviderReplaceAppointmentActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentsProvider.IReplaceAppointmentOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoveAppointmentOperation
   (
      This       : access IAppointmentsProviderRemoveAppointmentActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Appointments.AppointmentsProvider.IRemoveAppointmentOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InstanceStartDate
   (
      This       : access IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalId
   (
      This       : access IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RoamingId
   (
      This       : access IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IAppointmentsProviderShowTimeFrameActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TimeToShow
   (
      This       : access IAppointmentsProviderShowTimeFrameActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IAppointmentsProviderShowTimeFrameActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IContactPanelActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactPanel
   (
      This       : access IContactPanelActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContactPanel
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IContactPanelActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IContact
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IUserDataAccountProviderActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Operation
   (
      This       : access IUserDataAccountProviderActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.Provider.IUserDataAccountProviderOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IDevicePairingActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceInformation
   (
      This       : access IDevicePairingActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IVoiceCommandActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Result
   (
      This       : access IVoiceCommandActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IPrelaunchActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrelaunchActivated
   (
      This       : access IPrelaunchActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IShareTargetActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ShareOperation
   (
      This       : access IShareTargetActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.ShareTarget.IShareOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IFileActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Files
   (
      This       : access IFileActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Storage.IVectorView_IStorageItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Verb
   (
      This       : access IFileActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IFileActivatedEventArgsWithNeighboringFiles_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NeighboringFilesQuery
   (
      This       : access IFileActivatedEventArgsWithNeighboringFiles_Imported_Interface
      ; RetVal : access Windows.Storage.Search.IStorageFileQueryResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IProtocolActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IProtocolActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CallerPackageFamilyName
   (
      This       : access IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData_Imported_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IProtocolForResultsActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProtocolForResultsOperation
   (
      This       : access IProtocolForResultsActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.System.IProtocolForResultsOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IFileOpenPickerActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FileOpenPickerUI
   (
      This       : access IFileOpenPickerActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Storage.Pickers.Provider.IFileOpenPickerUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IFileOpenPickerActivatedEventArgs2_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CallerPackageFamilyName
   (
      This       : access IFileOpenPickerActivatedEventArgs2_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IFileSavePickerActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FileSavePickerUI
   (
      This       : access IFileSavePickerActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Storage.Pickers.Provider.IFileSavePickerUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IFileSavePickerActivatedEventArgs2_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CallerPackageFamilyName
   (
      This       : access IFileSavePickerActivatedEventArgs2_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EnterpriseId
   (
      This       : access IFileSavePickerActivatedEventArgs2_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ICachedFileUpdaterActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CachedFileUpdaterUI
   (
      This       : access ICachedFileUpdaterActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Storage.Provider.ICachedFileUpdaterUI
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IDeviceActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceInformationId
   (
      This       : access IDeviceActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Verb
   (
      This       : access IDeviceActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ILockScreenActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Info
   (
      This       : access ILockScreenActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IRestrictedLaunchActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SharedContext
   (
      This       : access IRestrictedLaunchActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IFileOpenPickerContinuationEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Files
   (
      This       : access IFileOpenPickerContinuationEventArgs_Imported_Interface
      ; RetVal : access Windows.Storage.IVectorView_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IContinuationActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContinuationData
   (
      This       : access IContinuationActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IFileSavePickerContinuationEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_File
   (
      This       : access IFileSavePickerContinuationEventArgs_Imported_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IFolderPickerContinuationEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Folder
   (
      This       : access IFolderPickerContinuationEventArgs_Imported_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IWebAuthenticationBrokerContinuationEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebAuthenticationResult
   (
      This       : access IWebAuthenticationBrokerContinuationEventArgs_Imported_Interface
      ; RetVal : access Windows.Security.Authentication.Web.IWebAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IWebAccountProviderActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Operation
   (
      This       : access IWebAccountProviderActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IWebAccountProviderOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IDialReceiverActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppName
   (
      This       : access IDialReceiverActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IToastNotificationActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Argument
   (
      This       : access IToastNotificationActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserInput
   (
      This       : access IToastNotificationActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ICommandLineActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Operation
   (
      This       : access ICommandLineActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Activation.ICommandLineActivationOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IStartupTaskActivatedEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskId
   (
      This       : access IStartupTaskActivatedEventArgs_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ISuspendingDeferral_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access ISuspendingDeferral_Imported_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ISuspendingOperation_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access ISuspendingOperation_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.ISuspendingDeferral
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access ISuspendingOperation_Imported_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ISuspendingEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SuspendingOperation
   (
      This       : access ISuspendingEventArgs_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.ISuspendingOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type ILeavingBackgroundEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access ILeavingBackgroundEventArgs_Imported_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IEnteredBackgroundEventArgs_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IEnteredBackgroundEventArgs_Imported_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IBackgroundTaskInstance_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InstanceId
   (
      This       : access IBackgroundTaskInstance_Imported_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Task
   (
      This       : access IBackgroundTaskInstance_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskRegistration
   )
   return Windows.HRESULT is abstract;
   
   function get_Progress
   (
      This       : access IBackgroundTaskInstance_Imported_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Progress
   (
      This       : access IBackgroundTaskInstance_Imported_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TriggerDetails
   (
      This       : access IBackgroundTaskInstance_Imported_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function add_Canceled
   (
      This       : access IBackgroundTaskInstance_Imported_Interface
      ; cancelHandler : Windows.ApplicationModel.Background.BackgroundTaskCanceledEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Canceled
   (
      This       : access IBackgroundTaskInstance_Imported_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_SuspendedCount
   (
      This       : access IBackgroundTaskInstance_Imported_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IBackgroundTaskInstance_Imported_Interface
      ; RetVal : access Windows.ApplicationModel.Background.IBackgroundTaskDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IPrintDocumentSource_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type ActivatedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; eventArgs : Windows.ApplicationModel.Activation.IActivatedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access ActivatedEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access ActivatedEventHandler_Interface
      ; sender : Windows.Object
      ; eventArgs : Windows.ApplicationModel.Activation.IActivatedEventArgs
   )
   return Windows.HRESULT;
   
   IID_ActivatedEventHandler : aliased constant Windows.IID := (1358030640, 50641, 19307, (154, 219, 138, 17, 117, 107, 226, 156 ));
   
   ------------------------------------------------------------------------
   type ResumingEventHandler_Interface(Callback : access procedure (sender : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access ResumingEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access ResumingEventHandler_Interface
      ; sender : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_ResumingEventHandler : aliased constant Windows.IID := (643406761, 41517, 18438, (167, 40, 172, 173, 193, 208, 117, 250 ));
   
   ------------------------------------------------------------------------
   type SuspendingEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.ApplicationModel.ISuspendingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access SuspendingEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access SuspendingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.ISuspendingEventArgs
   )
   return Windows.HRESULT;
   
   IID_SuspendingEventHandler : aliased constant Windows.IID := (1352417948, 30946, 18563, (171, 200, 137, 96, 220, 222, 27, 92 ));
   
   ------------------------------------------------------------------------
   type LeavingBackgroundEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.ApplicationModel.ILeavingBackgroundEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access LeavingBackgroundEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access LeavingBackgroundEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.ILeavingBackgroundEventArgs
   )
   return Windows.HRESULT;
   
   IID_LeavingBackgroundEventHandler : aliased constant Windows.IID := (11848921, 31388, 19307, (154, 196, 19, 71, 79, 38, 139, 196 ));
   
   ------------------------------------------------------------------------
   type EnteredBackgroundEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.ApplicationModel.IEnteredBackgroundEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EnteredBackgroundEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EnteredBackgroundEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.IEnteredBackgroundEventArgs
   )
   return Windows.HRESULT;
   
   IID_EnteredBackgroundEventHandler : aliased constant Windows.IID := (722051443, 46734, 19951, (136, 193, 141, 232, 78, 90, 171, 47 ));
   
   ------------------------------------------------------------------------
   type NavigatedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.WebUI.IWebUINavigatedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access NavigatedEventHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access NavigatedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.WebUI.IWebUINavigatedEventArgs
   )
   return Windows.HRESULT;
   
   IID_NavigatedEventHandler : aliased constant Windows.IID := (2062839782, 16586, 20041, (167, 214, 219, 219, 51, 12, 209, 163 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WebUIPrintTaskSettingsActivatedEventArgs is Windows.ApplicationModel.Activation.IPrintTaskSettingsActivatedEventArgs;
   subtype WebUIPrint3DWorkflowActivatedEventArgs is Windows.ApplicationModel.Activation.IPrint3DWorkflowActivatedEventArgs;
   subtype WebUILockScreenCallActivatedEventArgs is Windows.ApplicationModel.Activation.ILockScreenCallActivatedEventArgs;
   subtype WebUICameraSettingsActivatedEventArgs is Windows.ApplicationModel.Activation.ICameraSettingsActivatedEventArgs;
   subtype WebUIContactPickerActivatedEventArgs is Windows.ApplicationModel.Activation.IContactPickerActivatedEventArgs;
   subtype WebUIContactCallActivatedEventArgs is Windows.ApplicationModel.Activation.IContactCallActivatedEventArgs;
   subtype WebUIContactMessageActivatedEventArgs is Windows.ApplicationModel.Activation.IContactMessageActivatedEventArgs;
   subtype WebUIContactMapActivatedEventArgs is Windows.ApplicationModel.Activation.IContactMapActivatedEventArgs;
   subtype WebUIContactPostActivatedEventArgs is Windows.ApplicationModel.Activation.IContactPostActivatedEventArgs;
   subtype WebUIContactVideoCallActivatedEventArgs is Windows.ApplicationModel.Activation.IContactVideoCallActivatedEventArgs;
   subtype WebUISearchActivatedEventArgs is Windows.ApplicationModel.Activation.ISearchActivatedEventArgs;
   subtype WebUIWalletActionActivatedEventArgs is Windows.ApplicationModel.Activation.IWalletActionActivatedEventArgs;
   subtype WebUIAppointmentsProviderAddAppointmentActivatedEventArgs is Windows.ApplicationModel.Activation.IAppointmentsProviderAddAppointmentActivatedEventArgs;
   subtype WebUIAppointmentsProviderReplaceAppointmentActivatedEventArgs is Windows.ApplicationModel.Activation.IAppointmentsProviderReplaceAppointmentActivatedEventArgs;
   subtype WebUIAppointmentsProviderRemoveAppointmentActivatedEventArgs is Windows.ApplicationModel.Activation.IAppointmentsProviderRemoveAppointmentActivatedEventArgs;
   subtype WebUIAppointmentsProviderShowAppointmentDetailsActivatedEventArgs is Windows.ApplicationModel.Activation.IAppointmentsProviderShowAppointmentDetailsActivatedEventArgs;
   subtype WebUIAppointmentsProviderShowTimeFrameActivatedEventArgs is Windows.ApplicationModel.Activation.IAppointmentsProviderShowTimeFrameActivatedEventArgs;
   subtype WebUIContactPanelActivatedEventArgs is Windows.ApplicationModel.Activation.IContactPanelActivatedEventArgs;
   subtype WebUIUserDataAccountProviderActivatedEventArgs is Windows.ApplicationModel.Activation.IUserDataAccountProviderActivatedEventArgs;
   subtype WebUIDevicePairingActivatedEventArgs is Windows.ApplicationModel.Activation.IDevicePairingActivatedEventArgs;
   subtype WebUIVoiceCommandActivatedEventArgs is Windows.ApplicationModel.Activation.IVoiceCommandActivatedEventArgs;
   subtype ActivatedDeferral is Windows.UI.WebUI.IActivatedDeferral;
   subtype ActivatedOperation is Windows.UI.WebUI.IActivatedOperation;
   subtype WebUILaunchActivatedEventArgs is Windows.ApplicationModel.Activation.ILaunchActivatedEventArgs;
   subtype WebUIShareTargetActivatedEventArgs is Windows.ApplicationModel.Activation.IShareTargetActivatedEventArgs;
   subtype WebUIFileActivatedEventArgs is Windows.ApplicationModel.Activation.IFileActivatedEventArgs;
   subtype WebUIProtocolActivatedEventArgs is Windows.ApplicationModel.Activation.IProtocolActivatedEventArgs;
   subtype WebUIProtocolForResultsActivatedEventArgs is Windows.ApplicationModel.Activation.IProtocolForResultsActivatedEventArgs;
   subtype WebUIFileOpenPickerActivatedEventArgs is Windows.ApplicationModel.Activation.IFileOpenPickerActivatedEventArgs;
   subtype WebUIFileSavePickerActivatedEventArgs is Windows.ApplicationModel.Activation.IFileSavePickerActivatedEventArgs;
   subtype WebUICachedFileUpdaterActivatedEventArgs is Windows.ApplicationModel.Activation.ICachedFileUpdaterActivatedEventArgs;
   subtype WebUIDeviceActivatedEventArgs is Windows.ApplicationModel.Activation.IDeviceActivatedEventArgs;
   subtype WebUILockScreenActivatedEventArgs is Windows.ApplicationModel.Activation.ILockScreenActivatedEventArgs;
   subtype WebUIRestrictedLaunchActivatedEventArgs is Windows.ApplicationModel.Activation.IRestrictedLaunchActivatedEventArgs;
   subtype WebUIFileOpenPickerContinuationEventArgs is Windows.ApplicationModel.Activation.IFileOpenPickerContinuationEventArgs;
   subtype WebUIFileSavePickerContinuationEventArgs is Windows.ApplicationModel.Activation.IFileSavePickerContinuationEventArgs;
   subtype WebUIFolderPickerContinuationEventArgs is Windows.ApplicationModel.Activation.IFolderPickerContinuationEventArgs;
   subtype WebUIWebAuthenticationBrokerContinuationEventArgs is Windows.ApplicationModel.Activation.IWebAuthenticationBrokerContinuationEventArgs;
   subtype WebUIWebAccountProviderActivatedEventArgs is Windows.ApplicationModel.Activation.IWebAccountProviderActivatedEventArgs;
   subtype WebUIDialReceiverActivatedEventArgs is Windows.ApplicationModel.Activation.IDialReceiverActivatedEventArgs;
   subtype WebUIToastNotificationActivatedEventArgs is Windows.ApplicationModel.Activation.IToastNotificationActivatedEventArgs;
   subtype WebUILockScreenComponentActivatedEventArgs is Windows.ApplicationModel.Activation.IActivatedEventArgs;
   subtype WebUIPrintWorkflowForegroundTaskActivatedEventArgs is Windows.ApplicationModel.Activation.IActivatedEventArgs;
   subtype WebUICommandLineActivatedEventArgs is Windows.ApplicationModel.Activation.ICommandLineActivatedEventArgs;
   subtype WebUIStartupTaskActivatedEventArgs is Windows.ApplicationModel.Activation.IStartupTaskActivatedEventArgs;
   subtype WebUINavigatedOperation is Windows.UI.WebUI.IWebUINavigatedOperation;
   subtype SuspendingDeferral is Windows.ApplicationModel.ISuspendingDeferral;
   subtype SuspendingOperation is Windows.ApplicationModel.ISuspendingOperation;
   subtype SuspendingEventArgs is Windows.ApplicationModel.ISuspendingEventArgs;
   subtype LeavingBackgroundEventArgs is Windows.ApplicationModel.ILeavingBackgroundEventArgs;
   subtype EnteredBackgroundEventArgs is Windows.ApplicationModel.IEnteredBackgroundEventArgs;
   subtype WebUIBackgroundTaskInstanceRuntimeClass is Windows.UI.WebUI.IWebUIBackgroundTaskInstance;
   subtype WebUINavigatedDeferral is Windows.UI.WebUI.IWebUINavigatedDeferral;
   subtype WebUINavigatedEventArgs is Windows.UI.WebUI.IWebUINavigatedEventArgs;
   subtype HtmlPrintDocumentSource is Windows.UI.WebUI.IHtmlPrintDocumentSource;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_Current
   return Windows.UI.WebUI.IWebUIBackgroundTaskInstance;
   
   function RequestRestartAsync
   (
      launchArguments : Windows.String
   )
   return Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason;
   
   function RequestRestartForUserAsync
   (
      user : Windows.System.IUser
      ; launchArguments : Windows.String
   )
   return Windows.ApplicationModel.Core.IAsyncOperation_AppRestartFailureReason;
   
   function add_LeavingBackground
   (
      handler : Windows.UI.WebUI.LeavingBackgroundEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_LeavingBackground
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_EnteredBackground
   (
      handler : Windows.UI.WebUI.EnteredBackgroundEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_EnteredBackground
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   procedure EnablePrelaunch
   (
      value : Windows.Boolean
   )
   ;
   
   function add_Activated
   (
      handler : Windows.UI.WebUI.ActivatedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_Activated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_Suspending
   (
      handler : Windows.UI.WebUI.SuspendingEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_Suspending
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_Resuming
   (
      handler : Windows.UI.WebUI.ResumingEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_Resuming
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_Navigated
   (
      handler : Windows.UI.WebUI.NavigatedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_Navigated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;

end;
