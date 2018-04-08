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
limited with Windows.UI;
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.UI.Popups;
limited with Windows.Storage.Streams;
limited with Windows.ApplicationModel.Background;
with Windows; use Windows;
--------------------------------------------------------------------------------
package Windows.Devices.Enumeration is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DevicePickerDisplayStatusOptions is (
      None,
      ShowProgress,
      ShowDisconnectButton,
      ShowRetryButton
   );
   for DevicePickerDisplayStatusOptions use (
      None => 0,
      ShowProgress => 1,
      ShowDisconnectButton => 2,
      ShowRetryButton => 4
   );
   for DevicePickerDisplayStatusOptions'Size use 32;
   
   type DevicePickerDisplayStatusOptions_Ptr is access DevicePickerDisplayStatusOptions;
   
   type DeviceClass is (
      All_x,
      AudioCapture,
      AudioRender,
      PortableStorageDevice,
      VideoCapture,
      ImageScanner,
      Location
   );
   for DeviceClass use (
      All_x => 0,
      AudioCapture => 1,
      AudioRender => 2,
      PortableStorageDevice => 3,
      VideoCapture => 4,
      ImageScanner => 5,
      Location => 6
   );
   for DeviceClass'Size use 32;
   
   type DeviceClass_Ptr is access DeviceClass;
   
   type DeviceWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopping,
      Stopped,
      Aborted
   );
   for DeviceWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopping => 3,
      Stopped => 4,
      Aborted => 5
   );
   for DeviceWatcherStatus'Size use 32;
   
   type DeviceWatcherStatus_Ptr is access DeviceWatcherStatus;
   
   type Panel is (
      Unknown,
      Front,
      Back,
      Top,
      Bottom,
      Left,
      Right
   );
   for Panel use (
      Unknown => 0,
      Front => 1,
      Back => 2,
      Top => 3,
      Bottom => 4,
      Left => 5,
      Right => 6
   );
   for Panel'Size use 32;
   
   type Panel_Ptr is access Panel;
   
   type DeviceInformationKind is (
      Unknown,
      DeviceInterface,
      DeviceContainer,
      Device,
      DeviceInterfaceClass,
      AssociationEndpoint,
      AssociationEndpointContainer,
      AssociationEndpointService
   );
   for DeviceInformationKind use (
      Unknown => 0,
      DeviceInterface => 1,
      DeviceContainer => 2,
      Device => 3,
      DeviceInterfaceClass => 4,
      AssociationEndpoint => 5,
      AssociationEndpointContainer => 6,
      AssociationEndpointService => 7
   );
   for DeviceInformationKind'Size use 32;
   
   type DeviceInformationKind_Ptr is access DeviceInformationKind;
   
   type DeviceWatcherEventKind is (
      Add,
      Update,
      Remove
   );
   for DeviceWatcherEventKind use (
      Add => 0,
      Update => 1,
      Remove => 2
   );
   for DeviceWatcherEventKind'Size use 32;
   
   type DeviceWatcherEventKind_Ptr is access DeviceWatcherEventKind;
   
   type DevicePairingKinds is (
      None,
      ConfirmOnly,
      DisplayPin,
      ProvidePin,
      ConfirmPinMatch
   );
   for DevicePairingKinds use (
      None => 0,
      ConfirmOnly => 1,
      DisplayPin => 2,
      ProvidePin => 4,
      ConfirmPinMatch => 8
   );
   for DevicePairingKinds'Size use 32;
   
   type DevicePairingKinds_Ptr is access DevicePairingKinds;
   
   type DevicePairingResultStatus is (
      Paired,
      NotReadyToPair,
      NotPaired,
      AlreadyPaired,
      ConnectionRejected,
      TooManyConnections,
      HardwareFailure,
      AuthenticationTimeout,
      AuthenticationNotAllowed,
      AuthenticationFailure,
      NoSupportedProfiles,
      ProtectionLevelCouldNotBeMet,
      AccessDenied,
      InvalidCeremonyData,
      PairingCanceled,
      OperationAlreadyInProgress,
      RequiredHandlerNotRegistered,
      RejectedByHandler,
      RemoteDeviceHasAssociation,
      Failed
   );
   for DevicePairingResultStatus use (
      Paired => 0,
      NotReadyToPair => 1,
      NotPaired => 2,
      AlreadyPaired => 3,
      ConnectionRejected => 4,
      TooManyConnections => 5,
      HardwareFailure => 6,
      AuthenticationTimeout => 7,
      AuthenticationNotAllowed => 8,
      AuthenticationFailure => 9,
      NoSupportedProfiles => 10,
      ProtectionLevelCouldNotBeMet => 11,
      AccessDenied => 12,
      InvalidCeremonyData => 13,
      PairingCanceled => 14,
      OperationAlreadyInProgress => 15,
      RequiredHandlerNotRegistered => 16,
      RejectedByHandler => 17,
      RemoteDeviceHasAssociation => 18,
      Failed => 19
   );
   for DevicePairingResultStatus'Size use 32;
   
   type DevicePairingResultStatus_Ptr is access DevicePairingResultStatus;
   
   type DeviceUnpairingResultStatus is (
      Unpaired,
      AlreadyUnpaired,
      OperationAlreadyInProgress,
      AccessDenied,
      Failed
   );
   for DeviceUnpairingResultStatus use (
      Unpaired => 0,
      AlreadyUnpaired => 1,
      OperationAlreadyInProgress => 2,
      AccessDenied => 3,
      Failed => 4
   );
   for DeviceUnpairingResultStatus'Size use 32;
   
   type DeviceUnpairingResultStatus_Ptr is access DeviceUnpairingResultStatus;
   
   type DevicePairingProtectionLevel is (
      Default,
      None,
      Encryption,
      EncryptionAndAuthentication
   );
   for DevicePairingProtectionLevel use (
      Default => 0,
      None => 1,
      Encryption => 2,
      EncryptionAndAuthentication => 3
   );
   for DevicePairingProtectionLevel'Size use 32;
   
   type DevicePairingProtectionLevel_Ptr is access DevicePairingProtectionLevel;
   
   type DeviceAccessStatus is (
      Unspecified,
      Allowed,
      DeniedByUser,
      DeniedBySystem
   );
   for DeviceAccessStatus use (
      Unspecified => 0,
      Allowed => 1,
      DeniedByUser => 2,
      DeniedBySystem => 3
   );
   for DeviceAccessStatus'Size use 32;
   
   type DeviceAccessStatus_Ptr is access DeviceAccessStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_DeviceAccessStatus_Interface;
   type AsyncOperationCompletedHandler_DeviceAccessStatus is access all AsyncOperationCompletedHandler_DeviceAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_DeviceAccessStatus_Ptr is access all AsyncOperationCompletedHandler_DeviceAccessStatus;
   type TypedEventHandler_IDevicePicker_add_DeviceSelected_Interface;
   type TypedEventHandler_IDevicePicker_add_DeviceSelected is access all TypedEventHandler_IDevicePicker_add_DeviceSelected_Interface'Class;
   type TypedEventHandler_IDevicePicker_add_DeviceSelected_Ptr is access all TypedEventHandler_IDevicePicker_add_DeviceSelected;
   type TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked_Interface;
   type TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked is access all TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked_Interface'Class;
   type TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked_Ptr is access all TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked;
   type TypedEventHandler_IDevicePicker_add_DevicePickerDismissed_Interface;
   type TypedEventHandler_IDevicePicker_add_DevicePickerDismissed is access all TypedEventHandler_IDevicePicker_add_DevicePickerDismissed_Interface'Class;
   type TypedEventHandler_IDevicePicker_add_DevicePickerDismissed_Ptr is access all TypedEventHandler_IDevicePicker_add_DevicePickerDismissed;
   type AsyncOperationCompletedHandler_IDeviceInformation_Interface;
   type AsyncOperationCompletedHandler_IDeviceInformation is access all AsyncOperationCompletedHandler_IDeviceInformation_Interface'Class;
   type AsyncOperationCompletedHandler_IDeviceInformation_Ptr is access all AsyncOperationCompletedHandler_IDeviceInformation;
   type TypedEventHandler_IDeviceWatcher_add_Added_Interface;
   type TypedEventHandler_IDeviceWatcher_add_Added is access all TypedEventHandler_IDeviceWatcher_add_Added_Interface'Class;
   type TypedEventHandler_IDeviceWatcher_add_Added_Ptr is access all TypedEventHandler_IDeviceWatcher_add_Added;
   type TypedEventHandler_IDeviceWatcher_add_Updated_Interface;
   type TypedEventHandler_IDeviceWatcher_add_Updated is access all TypedEventHandler_IDeviceWatcher_add_Updated_Interface'Class;
   type TypedEventHandler_IDeviceWatcher_add_Updated_Ptr is access all TypedEventHandler_IDeviceWatcher_add_Updated;
   type TypedEventHandler_IDeviceWatcher_add_Removed_Interface;
   type TypedEventHandler_IDeviceWatcher_add_Removed is access all TypedEventHandler_IDeviceWatcher_add_Removed_Interface'Class;
   type TypedEventHandler_IDeviceWatcher_add_Removed_Ptr is access all TypedEventHandler_IDeviceWatcher_add_Removed;
   type TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted is access all TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IDeviceWatcher_add_Stopped_Interface;
   type TypedEventHandler_IDeviceWatcher_add_Stopped is access all TypedEventHandler_IDeviceWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IDeviceWatcher_add_Stopped_Ptr is access all TypedEventHandler_IDeviceWatcher_add_Stopped;
   type AsyncOperationCompletedHandler_IVectorView_DeviceInformation_Interface;
   type AsyncOperationCompletedHandler_IVectorView_DeviceInformation is access all AsyncOperationCompletedHandler_IVectorView_DeviceInformation_Interface'Class;
   type AsyncOperationCompletedHandler_IVectorView_DeviceInformation_Ptr is access all AsyncOperationCompletedHandler_IVectorView_DeviceInformation;
   type AsyncOperationCompletedHandler_IDevicePairingResult_Interface;
   type AsyncOperationCompletedHandler_IDevicePairingResult is access all AsyncOperationCompletedHandler_IDevicePairingResult_Interface'Class;
   type AsyncOperationCompletedHandler_IDevicePairingResult_Ptr is access all AsyncOperationCompletedHandler_IDevicePairingResult;
   type TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested_Interface;
   type TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested is access all TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested_Interface'Class;
   type TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested_Ptr is access all TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested;
   type AsyncOperationCompletedHandler_IDeviceUnpairingResult_Interface;
   type AsyncOperationCompletedHandler_IDeviceUnpairingResult is access all AsyncOperationCompletedHandler_IDeviceUnpairingResult_Interface'Class;
   type AsyncOperationCompletedHandler_IDeviceUnpairingResult_Ptr is access all AsyncOperationCompletedHandler_IDeviceUnpairingResult;
   type TypedEventHandler_IDeviceAccessInformation_add_AccessChanged_Interface;
   type TypedEventHandler_IDeviceAccessInformation_add_AccessChanged is access all TypedEventHandler_IDeviceAccessInformation_add_AccessChanged_Interface'Class;
   type TypedEventHandler_IDeviceAccessInformation_add_AccessChanged_Ptr is access all TypedEventHandler_IDeviceAccessInformation_add_AccessChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDeviceConnectionChangeTriggerDetails_Interface;
   type IDeviceConnectionChangeTriggerDetails is access all IDeviceConnectionChangeTriggerDetails_Interface'Class;
   type IDeviceConnectionChangeTriggerDetails_Ptr is access all IDeviceConnectionChangeTriggerDetails;
   type IDevicePickerAppearance_Interface;
   type IDevicePickerAppearance is access all IDevicePickerAppearance_Interface'Class;
   type IDevicePickerAppearance_Ptr is access all IDevicePickerAppearance;
   type IDeviceSelectedEventArgs_Interface;
   type IDeviceSelectedEventArgs is access all IDeviceSelectedEventArgs_Interface'Class;
   type IDeviceSelectedEventArgs_Ptr is access all IDeviceSelectedEventArgs;
   type IDeviceDisconnectButtonClickedEventArgs_Interface;
   type IDeviceDisconnectButtonClickedEventArgs is access all IDeviceDisconnectButtonClickedEventArgs_Interface'Class;
   type IDeviceDisconnectButtonClickedEventArgs_Ptr is access all IDeviceDisconnectButtonClickedEventArgs;
   type IDevicePickerFilter_Interface;
   type IDevicePickerFilter is access all IDevicePickerFilter_Interface'Class;
   type IDevicePickerFilter_Ptr is access all IDevicePickerFilter;
   type IDevicePicker_Interface;
   type IDevicePicker is access all IDevicePicker_Interface'Class;
   type IDevicePicker_Ptr is access all IDevicePicker;
   type IEnclosureLocation_Interface;
   type IEnclosureLocation is access all IEnclosureLocation_Interface'Class;
   type IEnclosureLocation_Ptr is access all IEnclosureLocation;
   type IEnclosureLocation2_Interface;
   type IEnclosureLocation2 is access all IEnclosureLocation2_Interface'Class;
   type IEnclosureLocation2_Ptr is access all IEnclosureLocation2;
   type IDeviceInformationUpdate_Interface;
   type IDeviceInformationUpdate is access all IDeviceInformationUpdate_Interface'Class;
   type IDeviceInformationUpdate_Ptr is access all IDeviceInformationUpdate;
   type IDeviceInformationUpdate2_Interface;
   type IDeviceInformationUpdate2 is access all IDeviceInformationUpdate2_Interface'Class;
   type IDeviceInformationUpdate2_Ptr is access all IDeviceInformationUpdate2;
   type IVectorView_DeviceInformation_Interface;
   type IVectorView_DeviceInformation is access all IVectorView_DeviceInformation_Interface'Class;
   type IVectorView_DeviceInformation_Ptr is access all IVectorView_DeviceInformation;
   type IIterable_DeviceInformation_Interface;
   type IIterable_DeviceInformation is access all IIterable_DeviceInformation_Interface'Class;
   type IIterable_DeviceInformation_Ptr is access all IIterable_DeviceInformation;
   type IDeviceWatcher_Interface;
   type IDeviceWatcher is access all IDeviceWatcher_Interface'Class;
   type IDeviceWatcher_Ptr is access all IDeviceWatcher;
   type IDeviceWatcher2_Interface;
   type IDeviceWatcher2 is access all IDeviceWatcher2_Interface'Class;
   type IDeviceWatcher2_Ptr is access all IDeviceWatcher2;
   type IDeviceInformationStatics_Interface;
   type IDeviceInformationStatics is access all IDeviceInformationStatics_Interface'Class;
   type IDeviceInformationStatics_Ptr is access all IDeviceInformationStatics;
   type IDeviceInformationStatics2_Interface;
   type IDeviceInformationStatics2 is access all IDeviceInformationStatics2_Interface'Class;
   type IDeviceInformationStatics2_Ptr is access all IDeviceInformationStatics2;
   type IDeviceInformation_Interface;
   type IDeviceInformation is access all IDeviceInformation_Interface'Class;
   type IDeviceInformation_Ptr is access all IDeviceInformation;
   type IDevicePairingResult_Interface;
   type IDevicePairingResult is access all IDevicePairingResult_Interface'Class;
   type IDevicePairingResult_Ptr is access all IDevicePairingResult;
   type IDeviceUnpairingResult_Interface;
   type IDeviceUnpairingResult is access all IDeviceUnpairingResult_Interface'Class;
   type IDeviceUnpairingResult_Ptr is access all IDeviceUnpairingResult;
   type IDevicePairingSettings_Interface;
   type IDevicePairingSettings is access all IDevicePairingSettings_Interface'Class;
   type IDevicePairingSettings_Ptr is access all IDevicePairingSettings;
   type IDevicePairingRequestedEventArgs_Interface;
   type IDevicePairingRequestedEventArgs is access all IDevicePairingRequestedEventArgs_Interface'Class;
   type IDevicePairingRequestedEventArgs_Ptr is access all IDevicePairingRequestedEventArgs;
   type IDeviceInformationCustomPairing_Interface;
   type IDeviceInformationCustomPairing is access all IDeviceInformationCustomPairing_Interface'Class;
   type IDeviceInformationCustomPairing_Ptr is access all IDeviceInformationCustomPairing;
   type IDeviceInformationPairing_Interface;
   type IDeviceInformationPairing is access all IDeviceInformationPairing_Interface'Class;
   type IDeviceInformationPairing_Ptr is access all IDeviceInformationPairing;
   type IDeviceInformationPairing2_Interface;
   type IDeviceInformationPairing2 is access all IDeviceInformationPairing2_Interface'Class;
   type IDeviceInformationPairing2_Ptr is access all IDeviceInformationPairing2;
   type IDeviceInformationPairingStatics_Interface;
   type IDeviceInformationPairingStatics is access all IDeviceInformationPairingStatics_Interface'Class;
   type IDeviceInformationPairingStatics_Ptr is access all IDeviceInformationPairingStatics;
   type IDeviceInformation2_Interface;
   type IDeviceInformation2 is access all IDeviceInformation2_Interface'Class;
   type IDeviceInformation2_Ptr is access all IDeviceInformation2;
   type IDeviceAccessChangedEventArgs_Interface;
   type IDeviceAccessChangedEventArgs is access all IDeviceAccessChangedEventArgs_Interface'Class;
   type IDeviceAccessChangedEventArgs_Ptr is access all IDeviceAccessChangedEventArgs;
   type IDeviceAccessChangedEventArgs2_Interface;
   type IDeviceAccessChangedEventArgs2 is access all IDeviceAccessChangedEventArgs2_Interface'Class;
   type IDeviceAccessChangedEventArgs2_Ptr is access all IDeviceAccessChangedEventArgs2;
   type IDeviceAccessInformation_Interface;
   type IDeviceAccessInformation is access all IDeviceAccessInformation_Interface'Class;
   type IDeviceAccessInformation_Ptr is access all IDeviceAccessInformation;
   type IDeviceAccessInformationStatics_Interface;
   type IDeviceAccessInformationStatics is access all IDeviceAccessInformationStatics_Interface'Class;
   type IDeviceAccessInformationStatics_Ptr is access all IDeviceAccessInformationStatics;
   type IDeviceWatcherEvent_Interface;
   type IDeviceWatcherEvent is access all IDeviceWatcherEvent_Interface'Class;
   type IDeviceWatcherEvent_Ptr is access all IDeviceWatcherEvent;
   type IDeviceWatcherTriggerDetails_Interface;
   type IDeviceWatcherTriggerDetails is access all IDeviceWatcherTriggerDetails_Interface'Class;
   type IDeviceWatcherTriggerDetails_Ptr is access all IDeviceWatcherTriggerDetails;
   type IRandomAccessStreamWithContentType_Imported_Interface;
   type IRandomAccessStreamWithContentType_Imported is access all IRandomAccessStreamWithContentType_Imported_Interface'Class;
   type IRandomAccessStreamWithContentType_Imported_Ptr is access all IRandomAccessStreamWithContentType_Imported;
   type IContentTypeProvider_Imported_Interface;
   type IContentTypeProvider_Imported is access all IContentTypeProvider_Imported_Interface'Class;
   type IContentTypeProvider_Imported_Ptr is access all IContentTypeProvider_Imported;
   type IRandomAccessStream_Imported_Interface;
   type IRandomAccessStream_Imported is access all IRandomAccessStream_Imported_Interface'Class;
   type IRandomAccessStream_Imported_Ptr is access all IRandomAccessStream_Imported;
   type IOutputStream_Imported_Interface;
   type IOutputStream_Imported is access all IOutputStream_Imported_Interface'Class;
   type IOutputStream_Imported_Ptr is access all IOutputStream_Imported;
   type IInputStream_Imported_Interface;
   type IInputStream_Imported is access all IInputStream_Imported_Interface'Class;
   type IInputStream_Imported_Ptr is access all IInputStream_Imported;
   type IAsyncOperation_DeviceAccessStatus_Interface;
   type IAsyncOperation_DeviceAccessStatus is access all IAsyncOperation_DeviceAccessStatus_Interface'Class;
   type IAsyncOperation_DeviceAccessStatus_Ptr is access all IAsyncOperation_DeviceAccessStatus;
   type IIterator_DeviceClass_Interface;
   type IIterator_DeviceClass is access all IIterator_DeviceClass_Interface'Class;
   type IIterator_DeviceClass_Ptr is access all IIterator_DeviceClass;
   type IIterable_DeviceClass_Interface;
   type IIterable_DeviceClass is access all IIterable_DeviceClass_Interface'Class;
   type IIterable_DeviceClass_Ptr is access all IIterable_DeviceClass;
   type IVectorView_DeviceClass_Interface;
   type IVectorView_DeviceClass is access all IVectorView_DeviceClass_Interface'Class;
   type IVectorView_DeviceClass_Ptr is access all IVectorView_DeviceClass;
   type IVector_DeviceClass_Interface;
   type IVector_DeviceClass is access all IVector_DeviceClass_Interface'Class;
   type IVector_DeviceClass_Ptr is access all IVector_DeviceClass;
   type IAsyncOperation_IDeviceInformation_Interface;
   type IAsyncOperation_IDeviceInformation is access all IAsyncOperation_IDeviceInformation_Interface'Class;
   type IAsyncOperation_IDeviceInformation_Ptr is access all IAsyncOperation_IDeviceInformation;
   type IIterator_DeviceWatcherEventKind_Interface;
   type IIterator_DeviceWatcherEventKind is access all IIterator_DeviceWatcherEventKind_Interface'Class;
   type IIterator_DeviceWatcherEventKind_Ptr is access all IIterator_DeviceWatcherEventKind;
   type IIterable_DeviceWatcherEventKind_Interface;
   type IIterable_DeviceWatcherEventKind is access all IIterable_DeviceWatcherEventKind_Interface'Class;
   type IIterable_DeviceWatcherEventKind_Ptr is access all IIterable_DeviceWatcherEventKind;
   type IAsyncOperation_IVectorView_DeviceInformation_Interface;
   type IAsyncOperation_IVectorView_DeviceInformation is access all IAsyncOperation_IVectorView_DeviceInformation_Interface'Class;
   type IAsyncOperation_IVectorView_DeviceInformation_Ptr is access all IAsyncOperation_IVectorView_DeviceInformation;
   type IAsyncOperation_IDevicePairingResult_Interface;
   type IAsyncOperation_IDevicePairingResult is access all IAsyncOperation_IDevicePairingResult_Interface'Class;
   type IAsyncOperation_IDevicePairingResult_Ptr is access all IAsyncOperation_IDevicePairingResult;
   type IAsyncOperation_IDeviceUnpairingResult_Interface;
   type IAsyncOperation_IDeviceUnpairingResult is access all IAsyncOperation_IDeviceUnpairingResult_Interface'Class;
   type IAsyncOperation_IDeviceUnpairingResult_Ptr is access all IAsyncOperation_IDeviceUnpairingResult;
   type IIterator_IDeviceWatcherEvent_Interface;
   type IIterator_IDeviceWatcherEvent is access all IIterator_IDeviceWatcherEvent_Interface'Class;
   type IIterator_IDeviceWatcherEvent_Ptr is access all IIterator_IDeviceWatcherEvent;
   type IIterable_IDeviceWatcherEvent_Interface;
   type IIterable_IDeviceWatcherEvent is access all IIterable_IDeviceWatcherEvent_Interface'Class;
   type IIterable_IDeviceWatcherEvent_Ptr is access all IIterable_IDeviceWatcherEvent;
   type IVectorView_IDeviceWatcherEvent_Interface;
   type IVectorView_IDeviceWatcherEvent is access all IVectorView_IDeviceWatcherEvent_Interface'Class;
   type IVectorView_IDeviceWatcherEvent_Ptr is access all IVectorView_IDeviceWatcherEvent;
   
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
   
   IID_IDeviceConnectionChangeTriggerDetails : aliased constant Windows.IID := (3092745228, 48065, 18507, (191, 250, 123, 49, 220, 194, 0, 178 ));
   
   type IDeviceConnectionChangeTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IDeviceConnectionChangeTriggerDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDevicePickerAppearance : aliased constant Windows.IID := (3868857030, 58919, 20184, (155, 108, 70, 10, 244, 69, 229, 109 ));
   
   type IDevicePickerAppearance_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IDevicePickerAppearance_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IDevicePickerAppearance_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ForegroundColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_ForegroundColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_AccentColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_AccentColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedForegroundColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedForegroundColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedBackgroundColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedBackgroundColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedAccentColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedAccentColor
   (
      This       : access IDevicePickerAppearance_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceSelectedEventArgs : aliased constant Windows.IID := (647944926, 7471, 18752, (132, 2, 65, 86, 184, 29, 60, 119 ));
   
   type IDeviceSelectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectedDevice
   (
      This       : access IDeviceSelectedEventArgs_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceDisconnectButtonClickedEventArgs : aliased constant Windows.IID := (2386867565, 63746, 18944, (181, 54, 243, 121, 146, 230, 162, 167 ));
   
   type IDeviceDisconnectButtonClickedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Device
   (
      This       : access IDeviceDisconnectButtonClickedEventArgs_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDevicePickerFilter : aliased constant Windows.IID := (2447086242, 22475, 18673, (155, 89, 165, 155, 122, 31, 2, 162 ));
   
   type IDevicePickerFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportedDeviceClasses
   (
      This       : access IDevicePickerFilter_Interface
      ; RetVal : access Windows.Devices.Enumeration.IVector_DeviceClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedDeviceSelectors
   (
      This       : access IDevicePickerFilter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDevicePicker : aliased constant Windows.IID := (2224650914, 842, 17472, (136, 19, 125, 11, 212, 121, 191, 90 ));
   
   type IDevicePicker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Filter
   (
      This       : access IDevicePicker_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDevicePickerFilter
   )
   return Windows.HRESULT is abstract;
   
   function get_Appearance
   (
      This       : access IDevicePicker_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDevicePickerAppearance
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestedProperties
   (
      This       : access IDevicePicker_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_DeviceSelected
   (
      This       : access IDevicePicker_Interface
      ; handler : TypedEventHandler_IDevicePicker_add_DeviceSelected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DeviceSelected
   (
      This       : access IDevicePicker_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DisconnectButtonClicked
   (
      This       : access IDevicePicker_Interface
      ; handler : TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DisconnectButtonClicked
   (
      This       : access IDevicePicker_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DevicePickerDismissed
   (
      This       : access IDevicePicker_Interface
      ; handler : TypedEventHandler_IDevicePicker_add_DevicePickerDismissed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DevicePickerDismissed
   (
      This       : access IDevicePicker_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Show
   (
      This       : access IDevicePicker_Interface
      ; selection : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function ShowWithPlacement
   (
      This       : access IDevicePicker_Interface
      ; selection : Windows.Foundation.Rect
      ; placement : Windows.UI.Popups.Placement
   )
   return Windows.HRESULT is abstract;
   
   function PickSingleDeviceAsync
   (
      This       : access IDevicePicker_Interface
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickSingleDeviceAsyncWithPlacement
   (
      This       : access IDevicePicker_Interface
      ; selection : Windows.Foundation.Rect
      ; placement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Hide
   (
      This       : access IDevicePicker_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetDisplayStatus
   (
      This       : access IDevicePicker_Interface
      ; device : Windows.Devices.Enumeration.IDeviceInformation
      ; status : Windows.String
      ; options : Windows.Devices.Enumeration.DevicePickerDisplayStatusOptions
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IEnclosureLocation : aliased constant Windows.IID := (1110706727, 22544, 17820, (170, 187, 198, 94, 31, 129, 62, 207 ));
   
   type IEnclosureLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InDock
   (
      This       : access IEnclosureLocation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InLid
   (
      This       : access IEnclosureLocation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Panel
   (
      This       : access IEnclosureLocation_Interface
      ; RetVal : access Windows.Devices.Enumeration.Panel
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IEnclosureLocation2 : aliased constant Windows.IID := (679844187, 57469, 18525, (138, 158, 189, 242, 154, 239, 79, 102 ));
   
   type IEnclosureLocation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RotationAngleInDegreesClockwise
   (
      This       : access IEnclosureLocation2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceInformationUpdate : aliased constant Windows.IID := (2402374405, 55666, 17591, (163, 126, 158, 130, 44, 120, 33, 59 ));
   
   type IDeviceInformationUpdate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IDeviceInformationUpdate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IDeviceInformationUpdate_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceInformationUpdate2 : aliased constant Windows.IID := (1570575500, 43123, 18526, (186, 166, 170, 98, 7, 136, 227, 204 ));
   
   type IDeviceInformationUpdate2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IDeviceInformationUpdate2_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_DeviceInformation : aliased constant Windows.IID := (3782240399, 13461, 23542, (170, 181, 156, 172, 23, 224, 241, 15 ));
   
   type IVectorView_DeviceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_DeviceInformation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_DeviceInformation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_DeviceInformation_Interface
      ; value : Windows.Devices.Enumeration.IDeviceInformation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_DeviceInformation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Enumeration.IDeviceInformation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_DeviceInformation : aliased constant Windows.IID := (3718220381, 60568, 24395, (163, 234, 156, 139, 90, 213, 60, 75 ));
   
   type IIterable_DeviceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_DeviceInformation_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceWatcher : aliased constant Windows.IID := (3387603325, 36715, 20374, (169, 244, 171, 200, 20, 226, 34, 113 ));
   
   type IDeviceWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Added
   (
      This       : access IDeviceWatcher_Interface
      ; handler : TypedEventHandler_IDeviceWatcher_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access IDeviceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Updated
   (
      This       : access IDeviceWatcher_Interface
      ; handler : TypedEventHandler_IDeviceWatcher_add_Updated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Updated
   (
      This       : access IDeviceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access IDeviceWatcher_Interface
      ; handler : TypedEventHandler_IDeviceWatcher_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access IDeviceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IDeviceWatcher_Interface
      ; handler : TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IDeviceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IDeviceWatcher_Interface
      ; handler : TypedEventHandler_IDeviceWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IDeviceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IDeviceWatcher_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IDeviceWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IDeviceWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceWatcher2 : aliased constant Windows.IID := (4278732142, 60692, 18921, (154, 105, 129, 23, 197, 74, 233, 113 ));
   
   type IDeviceWatcher2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetBackgroundTrigger
   (
      This       : access IDeviceWatcher2_Interface
      ; requestedEventKinds : Windows.Devices.Enumeration.IIterable_DeviceWatcherEventKind
      ; RetVal : access Windows.ApplicationModel.Background.IDeviceWatcherTrigger
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceInformationStatics : aliased constant Windows.IID := (3246329870, 14918, 19064, (128, 19, 118, 157, 201, 185, 115, 144 ));
   
   type IDeviceInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromIdAsync
   (
      This       : access IDeviceInformationStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromIdAsyncAdditionalProperties
   (
      This       : access IDeviceInformationStatics_Interface
      ; deviceId : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsync
   (
      This       : access IDeviceInformationStatics_Interface
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsyncDeviceClass
   (
      This       : access IDeviceInformationStatics_Interface
      ; deviceClass : Windows.Devices.Enumeration.DeviceClass
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsyncAqsFilter
   (
      This       : access IDeviceInformationStatics_Interface
      ; aqsFilter : Windows.String
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsyncAqsFilterAndAdditionalProperties
   (
      This       : access IDeviceInformationStatics_Interface
      ; aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcher
   (
      This       : access IDeviceInformationStatics_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceWatcher
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcherDeviceClass
   (
      This       : access IDeviceInformationStatics_Interface
      ; deviceClass : Windows.Devices.Enumeration.DeviceClass
      ; RetVal : access Windows.Devices.Enumeration.IDeviceWatcher
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcherAqsFilter
   (
      This       : access IDeviceInformationStatics_Interface
      ; aqsFilter : Windows.String
      ; RetVal : access Windows.Devices.Enumeration.IDeviceWatcher
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcherAqsFilterAndAdditionalProperties
   (
      This       : access IDeviceInformationStatics_Interface
      ; aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Devices.Enumeration.IDeviceWatcher
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceInformationStatics2 : aliased constant Windows.IID := (1228623668, 43087, 17917, (145, 103, 21, 209, 203, 27, 209, 249 ));
   
   type IDeviceInformationStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAqsFilterFromDeviceClass
   (
      This       : access IDeviceInformationStatics2_Interface
      ; deviceClass : Windows.Devices.Enumeration.DeviceClass
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromIdAsyncWithKindAndAdditionalProperties
   (
      This       : access IDeviceInformationStatics2_Interface
      ; deviceId : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsyncWithKindAqsFilterAndAdditionalProperties
   (
      This       : access IDeviceInformationStatics2_Interface
      ; aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcherWithKindAqsFilterAndAdditionalProperties
   (
      This       : access IDeviceInformationStatics2_Interface
      ; aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
      ; RetVal : access Windows.Devices.Enumeration.IDeviceWatcher
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceInformation : aliased constant Windows.IID := (2879454101, 17304, 18589, (142, 68, 230, 19, 9, 39, 1, 31 ));
   
   type IDeviceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IDeviceInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDefault
   (
      This       : access IDeviceInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_EnclosureLocation
   (
      This       : access IDeviceInformation_Interface
      ; RetVal : access Windows.Devices.Enumeration.IEnclosureLocation
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IDeviceInformation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Update
   (
      This       : access IDeviceInformation_Interface
      ; updateInfo : Windows.Devices.Enumeration.IDeviceInformationUpdate
   )
   return Windows.HRESULT is abstract;
   
   function GetThumbnailAsync
   (
      This       : access IDeviceInformation_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetGlyphThumbnailAsync
   (
      This       : access IDeviceInformation_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDevicePairingResult : aliased constant Windows.IID := (120259263, 56725, 16421, (155, 55, 222, 81, 173, 186, 55, 183 ));
   
   type IDevicePairingResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IDevicePairingResult_Interface
      ; RetVal : access Windows.Devices.Enumeration.DevicePairingResultStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionLevelUsed
   (
      This       : access IDevicePairingResult_Interface
      ; RetVal : access Windows.Devices.Enumeration.DevicePairingProtectionLevel
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceUnpairingResult : aliased constant Windows.IID := (1727285971, 31193, 17483, (146, 207, 169, 46, 247, 37, 113, 199 ));
   
   type IDeviceUnpairingResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IDeviceUnpairingResult_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceUnpairingResultStatus
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDevicePairingSettings : aliased constant Windows.IID := (1210888828, 33723, 16910, (190, 81, 102, 2, 178, 34, 222, 84 ));
   
   type IDevicePairingSettings_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IDevicePairingRequestedEventArgs : aliased constant Windows.IID := (4145544278, 56939, 18559, (131, 118, 1, 128, 172, 166, 153, 99 ));
   
   type IDevicePairingRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceInformation
   (
      This       : access IDevicePairingRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_PairingKind
   (
      This       : access IDevicePairingRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.Enumeration.DevicePairingKinds
   )
   return Windows.HRESULT is abstract;
   
   function get_Pin
   (
      This       : access IDevicePairingRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Accept_x
   (
      This       : access IDevicePairingRequestedEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   
   function AcceptWithPin
   (
      This       : access IDevicePairingRequestedEventArgs_Interface
      ; pin : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IDevicePairingRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceInformationCustomPairing : aliased constant Windows.IID := (2232650754, 20198, 18708, (131, 112, 16, 122, 57, 20, 76, 14 ));
   
   type IDeviceInformationCustomPairing_Interface is interface and Windows.IInspectable_Interface;
   
   function PairAsync
   (
      This       : access IDeviceInformationCustomPairing_Interface
      ; pairingKindsSupported : Windows.Devices.Enumeration.DevicePairingKinds
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDevicePairingResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PairWithProtectionLevelAsync
   (
      This       : access IDeviceInformationCustomPairing_Interface
      ; pairingKindsSupported : Windows.Devices.Enumeration.DevicePairingKinds
      ; minProtectionLevel : Windows.Devices.Enumeration.DevicePairingProtectionLevel
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDevicePairingResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PairWithProtectionLevelAndSettingsAsync
   (
      This       : access IDeviceInformationCustomPairing_Interface
      ; pairingKindsSupported : Windows.Devices.Enumeration.DevicePairingKinds
      ; minProtectionLevel : Windows.Devices.Enumeration.DevicePairingProtectionLevel
      ; devicePairingSettings : Windows.Devices.Enumeration.IDevicePairingSettings
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDevicePairingResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_PairingRequested
   (
      This       : access IDeviceInformationCustomPairing_Interface
      ; handler : TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PairingRequested
   (
      This       : access IDeviceInformationCustomPairing_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceInformationPairing : aliased constant Windows.IID := (742877685, 63108, 16597, (132, 105, 232, 219, 170, 183, 4, 133 ));
   
   type IDeviceInformationPairing_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPaired
   (
      This       : access IDeviceInformationPairing_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanPair
   (
      This       : access IDeviceInformationPairing_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function PairAsync
   (
      This       : access IDeviceInformationPairing_Interface
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDevicePairingResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PairWithProtectionLevelAsync
   (
      This       : access IDeviceInformationPairing_Interface
      ; minProtectionLevel : Windows.Devices.Enumeration.DevicePairingProtectionLevel
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDevicePairingResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceInformationPairing2 : aliased constant Windows.IID := (4135981821, 2798, 17192, (133, 204, 28, 116, 43, 177, 121, 13 ));
   
   type IDeviceInformationPairing2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProtectionLevel
   (
      This       : access IDeviceInformationPairing2_Interface
      ; RetVal : access Windows.Devices.Enumeration.DevicePairingProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_Custom
   (
      This       : access IDeviceInformationPairing2_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformationCustomPairing
   )
   return Windows.HRESULT is abstract;
   
   function PairWithProtectionLevelAndSettingsAsync
   (
      This       : access IDeviceInformationPairing2_Interface
      ; minProtectionLevel : Windows.Devices.Enumeration.DevicePairingProtectionLevel
      ; devicePairingSettings : Windows.Devices.Enumeration.IDevicePairingSettings
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDevicePairingResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnpairAsync
   (
      This       : access IDeviceInformationPairing2_Interface
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_IDeviceUnpairingResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceInformationPairingStatics : aliased constant Windows.IID := (3910517768, 14036, 18849, (191, 19, 81, 65, 115, 121, 155, 107 ));
   
   type IDeviceInformationPairingStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryRegisterForAllInboundPairingRequests
   (
      This       : access IDeviceInformationPairingStatics_Interface
      ; pairingKindsSupported : Windows.Devices.Enumeration.DevicePairingKinds
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceInformation2 : aliased constant Windows.IID := (4048987704, 31127, 18649, (161, 12, 38, 157, 70, 83, 63, 72 ));
   
   type IDeviceInformation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IDeviceInformation2_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Pairing
   (
      This       : access IDeviceInformation2_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformationPairing
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceAccessChangedEventArgs : aliased constant Windows.IID := (3738831820, 20381, 20312, (157, 186, 169, 188, 128, 4, 8, 213 ));
   
   type IDeviceAccessChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IDeviceAccessChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceAccessStatus
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceAccessChangedEventArgs2 : aliased constant Windows.IID := (2186424930, 37707, 19248, (161, 120, 173, 195, 159, 47, 43, 227 ));
   
   type IDeviceAccessChangedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IDeviceAccessChangedEventArgs2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceAccessInformation : aliased constant Windows.IID := (195730035, 28133, 18709, (141, 221, 154, 5, 84, 166, 245, 69 ));
   
   type IDeviceAccessInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AccessChanged
   (
      This       : access IDeviceAccessInformation_Interface
      ; handler : TypedEventHandler_IDeviceAccessInformation_add_AccessChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccessChanged
   (
      This       : access IDeviceAccessInformation_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentStatus
   (
      This       : access IDeviceAccessInformation_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceAccessStatus
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceAccessInformationStatics : aliased constant Windows.IID := (1464587219, 24368, 17869, (138, 148, 114, 79, 229, 151, 48, 132 ));
   
   type IDeviceAccessInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromId
   (
      This       : access IDeviceAccessInformationStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Enumeration.IDeviceAccessInformation
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromDeviceClassId
   (
      This       : access IDeviceAccessInformationStatics_Interface
      ; deviceClassId : Windows.Guid
      ; RetVal : access Windows.Devices.Enumeration.IDeviceAccessInformation
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromDeviceClass
   (
      This       : access IDeviceAccessInformationStatics_Interface
      ; deviceClass : Windows.Devices.Enumeration.DeviceClass
      ; RetVal : access Windows.Devices.Enumeration.IDeviceAccessInformation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceWatcherEvent : aliased constant Windows.IID := (1957338123, 7613, 18429, (182, 53, 60, 197, 86, 208, 255, 139 ));
   
   type IDeviceWatcherEvent_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IDeviceWatcherEvent_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceWatcherEventKind
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceInformation
   (
      This       : access IDeviceWatcherEvent_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceInformationUpdate
   (
      This       : access IDeviceWatcherEvent_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformationUpdate
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDeviceWatcherTriggerDetails : aliased constant Windows.IID := (947945753, 19639, 20055, (165, 109, 119, 109, 7, 203, 254, 249 ));
   
   type IDeviceWatcherTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceWatcherEvents
   (
      This       : access IDeviceWatcherTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Enumeration.IVectorView_IDeviceWatcherEvent -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IRandomAccessStreamWithContentType_Imported_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   type IContentTypeProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentType
   (
      This       : access IContentTypeProvider_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IRandomAccessStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Size
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_Size
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function GetInputStreamAt
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function GetOutputStreamAt
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function Seek
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function CloneStream
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRead
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanWrite
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IOutputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function WriteAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FlushAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IInputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadAsync
   (
      This       : access IInputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; count : Windows.UInt32
      ; options : Windows.Storage.Streams.InputStreamOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_DeviceAccessStatus : aliased constant Windows.IID := (3221996274, 43000, 24383, (128, 209, 40, 8, 239, 107, 202, 16 ));
   
   type IAsyncOperation_DeviceAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_DeviceAccessStatus_Interface
      ; handler : Windows.Devices.Enumeration.AsyncOperationCompletedHandler_DeviceAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_DeviceAccessStatus_Interface
      ; RetVal : access Windows.Devices.Enumeration.AsyncOperationCompletedHandler_DeviceAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_DeviceAccessStatus_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceAccessStatus
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_DeviceClass : aliased constant Windows.IID := (3279975043, 5142, 22844, (149, 92, 11, 74, 40, 111, 247, 187 ));
   
   type IIterator_DeviceClass_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_DeviceClass_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_DeviceClass_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_DeviceClass_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_DeviceClass_Interface
      ; items : Windows.Devices.Enumeration.DeviceClass_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_DeviceClass : aliased constant Windows.IID := (1205124613, 22769, 21038, (129, 198, 151, 94, 180, 19, 27, 185 ));
   
   type IIterable_DeviceClass_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_DeviceClass_Interface
      ; RetVal : access Windows.Devices.Enumeration.IIterator_DeviceClass
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_DeviceClass : aliased constant Windows.IID := (27789975, 48519, 23690, (151, 253, 212, 73, 201, 139, 218, 198 ));
   
   type IVectorView_DeviceClass_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_DeviceClass_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_DeviceClass_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_DeviceClass_Interface
      ; value : Windows.Devices.Enumeration.DeviceClass
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_DeviceClass_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Enumeration.DeviceClass_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVector_DeviceClass : aliased constant Windows.IID := (3999673655, 45291, 22313, (152, 50, 21, 111, 210, 136, 157, 72 ));
   
   type IVector_DeviceClass_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_DeviceClass_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_DeviceClass_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_DeviceClass_Interface
      ; RetVal : access Windows.Devices.Enumeration.IVectorView_DeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_DeviceClass_Interface
      ; value : Windows.Devices.Enumeration.DeviceClass
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_DeviceClass_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_DeviceClass_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_DeviceClass_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_DeviceClass_Interface
      ; value : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_DeviceClass_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_DeviceClass_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_DeviceClass_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Enumeration.DeviceClass_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_DeviceClass_Interface
      ; items : Windows.Devices.Enumeration.DeviceClass_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IDeviceInformation : aliased constant Windows.IID := (133865555, 60207, 23738, (178, 91, 217, 213, 123, 230, 113, 95 ));
   
   type IAsyncOperation_IDeviceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDeviceInformation_Interface
      ; handler : Windows.Devices.Enumeration.AsyncOperationCompletedHandler_IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDeviceInformation_Interface
      ; RetVal : access Windows.Devices.Enumeration.AsyncOperationCompletedHandler_IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDeviceInformation_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_DeviceWatcherEventKind : aliased constant Windows.IID := (3411847643, 52438, 20739, (169, 61, 201, 37, 201, 8, 131, 141 ));
   
   type IIterator_DeviceWatcherEventKind_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_DeviceWatcherEventKind_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceWatcherEventKind
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_DeviceWatcherEventKind_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_DeviceWatcherEventKind_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_DeviceWatcherEventKind_Interface
      ; items : Windows.Devices.Enumeration.DeviceWatcherEventKind_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_DeviceWatcherEventKind : aliased constant Windows.IID := (4030948779, 54259, 24453, (167, 218, 220, 25, 207, 247, 61, 134 ));
   
   type IIterable_DeviceWatcherEventKind_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_DeviceWatcherEventKind_Interface
      ; RetVal : access Windows.Devices.Enumeration.IIterator_DeviceWatcherEventKind
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IVectorView_DeviceInformation : aliased constant Windows.IID := (1159201364, 2094, 21108, (178, 231, 172, 5, 23, 244, 77, 7 ));
   
   type IAsyncOperation_IVectorView_DeviceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IVectorView_DeviceInformation_Interface
      ; handler : Windows.Devices.Enumeration.AsyncOperationCompletedHandler_IVectorView_DeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IVectorView_DeviceInformation_Interface
      ; RetVal : access Windows.Devices.Enumeration.AsyncOperationCompletedHandler_IVectorView_DeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IVectorView_DeviceInformation_Interface
      ; RetVal : access Windows.Devices.Enumeration.IVectorView_DeviceInformation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IDevicePairingResult : aliased constant Windows.IID := (268622708, 35144, 22814, (129, 93, 228, 11, 102, 117, 153, 163 ));
   
   type IAsyncOperation_IDevicePairingResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDevicePairingResult_Interface
      ; handler : Windows.Devices.Enumeration.AsyncOperationCompletedHandler_IDevicePairingResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDevicePairingResult_Interface
      ; RetVal : access Windows.Devices.Enumeration.AsyncOperationCompletedHandler_IDevicePairingResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDevicePairingResult_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDevicePairingResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IDeviceUnpairingResult : aliased constant Windows.IID := (733273917, 48510, 24544, (144, 32, 86, 220, 13, 48, 185, 53 ));
   
   type IAsyncOperation_IDeviceUnpairingResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDeviceUnpairingResult_Interface
      ; handler : Windows.Devices.Enumeration.AsyncOperationCompletedHandler_IDeviceUnpairingResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDeviceUnpairingResult_Interface
      ; RetVal : access Windows.Devices.Enumeration.AsyncOperationCompletedHandler_IDeviceUnpairingResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDeviceUnpairingResult_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceUnpairingResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IDeviceWatcherEvent : aliased constant Windows.IID := (1962399436, 39968, 23481, (186, 206, 178, 255, 163, 134, 135, 249 ));
   
   type IIterator_IDeviceWatcherEvent_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IDeviceWatcherEvent_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceWatcherEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IDeviceWatcherEvent_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IDeviceWatcherEvent_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IDeviceWatcherEvent_Interface
      ; items : Windows.Devices.Enumeration.IDeviceWatcherEvent_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IDeviceWatcherEvent : aliased constant Windows.IID := (3029323857, 60154, 21055, (166, 110, 157, 65, 81, 197, 213, 34 ));
   
   type IIterable_IDeviceWatcherEvent_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IDeviceWatcherEvent_Interface
      ; RetVal : access Windows.Devices.Enumeration.IIterator_IDeviceWatcherEvent
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IDeviceWatcherEvent : aliased constant Windows.IID := (2409188663, 36779, 20934, (161, 224, 201, 63, 104, 162, 14, 240 ));
   
   type IVectorView_IDeviceWatcherEvent_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IDeviceWatcherEvent_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Enumeration.IDeviceWatcherEvent
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IDeviceWatcherEvent_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IDeviceWatcherEvent_Interface
      ; value : Windows.Devices.Enumeration.IDeviceWatcherEvent
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IDeviceWatcherEvent_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Enumeration.IDeviceWatcherEvent_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_DeviceAccessStatus : aliased constant Windows.IID := (3994373507, 32859, 21480, (132, 105, 144, 113, 80, 54, 208, 19 ));
   
   type AsyncOperationCompletedHandler_DeviceAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_DeviceAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_DeviceAccessStatus'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DeviceAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_DeviceAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDevicePicker_add_DeviceSelected : aliased constant Windows.IID := (1206160520, 7254, 23384, (150, 162, 142, 129, 61, 37, 7, 122 ));
   
   type TypedEventHandler_IDevicePicker_add_DeviceSelected_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.IDevicePicker ; args : Windows.Devices.Enumeration.IDeviceSelectedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDevicePicker_add_DeviceSelected'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePicker_add_DeviceSelected_Interface
      ; sender : Windows.Devices.Enumeration.IDevicePicker
      ; args : Windows.Devices.Enumeration.IDeviceSelectedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked : aliased constant Windows.IID := (903676697, 22307, 20588, (136, 150, 26, 40, 184, 43, 231, 152 ));
   
   type TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.IDevicePicker ; args : Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked_Interface
      ; sender : Windows.Devices.Enumeration.IDevicePicker
      ; args : Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDevicePicker_add_DevicePickerDismissed : aliased constant Windows.IID := (1657198988, 22510, 23480, (164, 28, 149, 141, 32, 195, 243, 232 ));
   
   type TypedEventHandler_IDevicePicker_add_DevicePickerDismissed_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.IDevicePicker ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDevicePicker_add_DevicePickerDismissed'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePicker_add_DevicePickerDismissed_Interface
      ; sender : Windows.Devices.Enumeration.IDevicePicker
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IDeviceInformation : aliased constant Windows.IID := (3142073842, 31670, 22819, (162, 141, 131, 66, 236, 48, 4, 107 ));
   
   type AsyncOperationCompletedHandler_IDeviceInformation_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IDeviceInformation'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDeviceInformation_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDeviceWatcher_add_Added : aliased constant Windows.IID := (63283323, 39180, 23817, (176, 184, 87, 52, 234, 163, 130, 34 ));
   
   type TypedEventHandler_IDeviceWatcher_add_Added_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.IDeviceWatcher ; args : Windows.Devices.Enumeration.IDeviceInformation)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDeviceWatcher_add_Added'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Added_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDeviceWatcher_add_Updated : aliased constant Windows.IID := (2423198292, 31149, 21756, (147, 196, 205, 185, 155, 67, 120, 153 ));
   
   type TypedEventHandler_IDeviceWatcher_add_Updated_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.IDeviceWatcher ; args : Windows.Devices.Enumeration.IDeviceInformationUpdate)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDeviceWatcher_add_Updated'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Updated_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Devices.Enumeration.IDeviceInformationUpdate
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDeviceWatcher_add_Removed : aliased constant Windows.IID := (2423198292, 31149, 21756, (147, 196, 205, 185, 155, 67, 120, 153 ));
   
   type TypedEventHandler_IDeviceWatcher_add_Removed_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.IDeviceWatcher ; args : Windows.Devices.Enumeration.IDeviceInformationUpdate)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDeviceWatcher_add_Removed'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Removed_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Devices.Enumeration.IDeviceInformationUpdate
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (2452906767, 8180, 21750, (158, 63, 172, 32, 54, 155, 119, 37 ));
   
   type TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.IDeviceWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDeviceWatcher_add_Stopped : aliased constant Windows.IID := (2452906767, 8180, 21750, (158, 63, 172, 32, 54, 155, 119, 37 ));
   
   type TypedEventHandler_IDeviceWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.IDeviceWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDeviceWatcher_add_Stopped'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IVectorView_DeviceInformation : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type AsyncOperationCompletedHandler_IVectorView_DeviceInformation_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IVectorView_DeviceInformation'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVectorView_DeviceInformation_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IDevicePairingResult : aliased constant Windows.IID := (2128618623, 24407, 23730, (180, 14, 24, 181, 162, 17, 214, 195 ));
   
   type AsyncOperationCompletedHandler_IDevicePairingResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDevicePairingResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IDevicePairingResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDevicePairingResult_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDevicePairingResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested : aliased constant Windows.IID := (4200932127, 16760, 24033, (178, 204, 3, 226, 45, 119, 2, 180 ));
   
   type TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.IDeviceInformationCustomPairing ; args : Windows.Devices.Enumeration.IDevicePairingRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceInformationCustomPairing
      ; args : Windows.Devices.Enumeration.IDevicePairingRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IDeviceUnpairingResult : aliased constant Windows.IID := (2612948665, 56109, 20832, (162, 12, 240, 194, 101, 242, 13, 142 ));
   
   type AsyncOperationCompletedHandler_IDeviceUnpairingResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDeviceUnpairingResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IDeviceUnpairingResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDeviceUnpairingResult_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDeviceUnpairingResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDeviceAccessInformation_add_AccessChanged : aliased constant Windows.IID := (1282527272, 46995, 23502, (174, 89, 250, 119, 244, 90, 64, 216 ));
   
   type TypedEventHandler_IDeviceAccessInformation_add_AccessChanged_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.IDeviceAccessInformation ; args : Windows.Devices.Enumeration.IDeviceAccessChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDeviceAccessInformation_add_AccessChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceAccessInformation_add_AccessChanged_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceAccessInformation
      ; args : Windows.Devices.Enumeration.IDeviceAccessChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DeviceConnectionChangeTriggerDetails is Windows.Devices.Enumeration.IDeviceConnectionChangeTriggerDetails;
   subtype DevicePickerAppearance is Windows.Devices.Enumeration.IDevicePickerAppearance;
   subtype DeviceSelectedEventArgs is Windows.Devices.Enumeration.IDeviceSelectedEventArgs;
   subtype DeviceDisconnectButtonClickedEventArgs is Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs;
   subtype DevicePickerFilter is Windows.Devices.Enumeration.IDevicePickerFilter;
   subtype DevicePicker is Windows.Devices.Enumeration.IDevicePicker;
   
   function CreateDevicePicker return Windows.Devices.Enumeration.IDevicePicker;
   
   subtype DeviceThumbnail is Windows.Storage.Streams.IRandomAccessStreamWithContentType;
   subtype EnclosureLocation is Windows.Devices.Enumeration.IEnclosureLocation;
   subtype DeviceInformationUpdate is Windows.Devices.Enumeration.IDeviceInformationUpdate;
   subtype DeviceInformationCollection is Windows.Devices.Enumeration.IVectorView_DeviceInformation;
   subtype DeviceWatcher is Windows.Devices.Enumeration.IDeviceWatcher;
   subtype DeviceInformation is Windows.Devices.Enumeration.IDeviceInformation;
   subtype DevicePairingResult is Windows.Devices.Enumeration.IDevicePairingResult;
   subtype DeviceUnpairingResult is Windows.Devices.Enumeration.IDeviceUnpairingResult;
   subtype DevicePairingRequestedEventArgs is Windows.Devices.Enumeration.IDevicePairingRequestedEventArgs;
   subtype DeviceInformationCustomPairing is Windows.Devices.Enumeration.IDeviceInformationCustomPairing;
   subtype DeviceInformationPairing is Windows.Devices.Enumeration.IDeviceInformationPairing;
   subtype DeviceAccessChangedEventArgs is Windows.Devices.Enumeration.IDeviceAccessChangedEventArgs;
   subtype DeviceAccessInformation is Windows.Devices.Enumeration.IDeviceAccessInformation;
   subtype DeviceWatcherEvent is Windows.Devices.Enumeration.IDeviceWatcherEvent;
   subtype DeviceWatcherTriggerDetails is Windows.Devices.Enumeration.IDeviceWatcherTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateFromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation;
   
   function CreateFromIdAsyncAdditionalProperties
   (
      deviceId : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation;
   
   function FindAllAsync
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   
   function FindAllAsyncDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   
   function FindAllAsyncAqsFilter
   (
      aqsFilter : Windows.String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   
   function FindAllAsyncAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   
   function CreateWatcher
   return Windows.Devices.Enumeration.IDeviceWatcher;
   
   function CreateWatcherDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.Devices.Enumeration.IDeviceWatcher;
   
   function CreateWatcherAqsFilter
   (
      aqsFilter : Windows.String
   )
   return Windows.Devices.Enumeration.IDeviceWatcher;
   
   function CreateWatcherAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IDeviceWatcher;
   
   function GetAqsFilterFromDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.String;
   
   function CreateFromIdAsyncWithKindAndAdditionalProperties
   (
      deviceId : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation;
   
   function FindAllAsyncWithKindAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   
   function CreateWatcherWithKindAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.Devices.Enumeration.IDeviceWatcher;
   
   function TryRegisterForAllInboundPairingRequests
   (
      pairingKindsSupported : Windows.Devices.Enumeration.DevicePairingKinds
   )
   return Windows.Boolean;
   
   function CreateFromId
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Enumeration.IDeviceAccessInformation;
   
   function CreateFromDeviceClassId
   (
      deviceClassId : Windows.Guid
   )
   return Windows.Devices.Enumeration.IDeviceAccessInformation;
   
   function CreateFromDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.Devices.Enumeration.IDeviceAccessInformation;

end;
