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
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
limited with Windows.Media.MediaProperties;
limited with Windows.Media.Capture;
limited with Windows.Media.Devices.Core;
--------------------------------------------------------------------------------
package Windows.Media.Devices is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AudioDeviceRole is (
      Default,
      Communications
   );
   for AudioDeviceRole use (
      Default => 0,
      Communications => 1
   );
   for AudioDeviceRole'Size use 32;
   
   type AudioDeviceRole_Ptr is access AudioDeviceRole;
   
   type SendCommandStatus is (
      Success,
      DeviceNotAvailable
   );
   for SendCommandStatus use (
      Success => 0,
      DeviceNotAvailable => 1
   );
   for SendCommandStatus'Size use 32;
   
   type SendCommandStatus_Ptr is access SendCommandStatus;
   
   type IsoSpeedPreset is (
      Auto,
      Iso50,
      Iso80,
      Iso100,
      Iso200,
      Iso400,
      Iso800,
      Iso1600,
      Iso3200,
      Iso6400,
      Iso12800,
      Iso25600
   );
   for IsoSpeedPreset use (
      Auto => 0,
      Iso50 => 1,
      Iso80 => 2,
      Iso100 => 3,
      Iso200 => 4,
      Iso400 => 5,
      Iso800 => 6,
      Iso1600 => 7,
      Iso3200 => 8,
      Iso6400 => 9,
      Iso12800 => 10,
      Iso25600 => 11
   );
   for IsoSpeedPreset'Size use 32;
   
   type IsoSpeedPreset_Ptr is access IsoSpeedPreset;
   
   type CaptureSceneMode is (
      Auto,
      Manual,
      Macro,
      Portrait,
      Sport,
      Snow,
      Night,
      Beach,
      Sunset,
      Candlelight,
      Landscape,
      NightPortrait,
      Backlit
   );
   for CaptureSceneMode use (
      Auto => 0,
      Manual => 1,
      Macro => 2,
      Portrait => 3,
      Sport => 4,
      Snow => 5,
      Night => 6,
      Beach => 7,
      Sunset => 8,
      Candlelight => 9,
      Landscape => 10,
      NightPortrait => 11,
      Backlit => 12
   );
   for CaptureSceneMode'Size use 32;
   
   type CaptureSceneMode_Ptr is access CaptureSceneMode;
   
   type MediaCaptureFocusState is (
      Uninitialized,
      Lost,
      Searching,
      Focused,
      Failed
   );
   for MediaCaptureFocusState use (
      Uninitialized => 0,
      Lost => 1,
      Searching => 2,
      Focused => 3,
      Failed => 4
   );
   for MediaCaptureFocusState'Size use 32;
   
   type MediaCaptureFocusState_Ptr is access MediaCaptureFocusState;
   
   type CameraStreamState is (
      NotStreaming,
      Streaming,
      BlockedForPrivacy,
      Shutdown
   );
   for CameraStreamState use (
      NotStreaming => 0,
      Streaming => 1,
      BlockedForPrivacy => 2,
      Shutdown => 3
   );
   for CameraStreamState'Size use 32;
   
   type CameraStreamState_Ptr is access CameraStreamState;
   
   type MediaCapturePauseBehavior is (
      RetainHardwareResources,
      ReleaseHardwareResources
   );
   for MediaCapturePauseBehavior use (
      RetainHardwareResources => 0,
      ReleaseHardwareResources => 1
   );
   for MediaCapturePauseBehavior'Size use 32;
   
   type MediaCapturePauseBehavior_Ptr is access MediaCapturePauseBehavior;
   
   type AdvancedPhotoMode is (
      Auto,
      Standard_x,
      Hdr,
      LowLight
   );
   for AdvancedPhotoMode use (
      Auto => 0,
      Standard_x => 1,
      Hdr => 2,
      LowLight => 3
   );
   for AdvancedPhotoMode'Size use 32;
   
   type AdvancedPhotoMode_Ptr is access AdvancedPhotoMode;
   
   type ColorTemperaturePreset is (
      Auto,
      Manual,
      Cloudy,
      Daylight,
      Flash,
      Fluorescent,
      Tungsten,
      Candlelight
   );
   for ColorTemperaturePreset use (
      Auto => 0,
      Manual => 1,
      Cloudy => 2,
      Daylight => 3,
      Flash => 4,
      Fluorescent => 5,
      Tungsten => 6,
      Candlelight => 7
   );
   for ColorTemperaturePreset'Size use 32;
   
   type ColorTemperaturePreset_Ptr is access ColorTemperaturePreset;
   
   type ZoomTransitionMode is (
      Auto,
      Direct,
      Smooth
   );
   for ZoomTransitionMode use (
      Auto => 0,
      Direct => 1,
      Smooth => 2
   );
   for ZoomTransitionMode'Size use 32;
   
   type ZoomTransitionMode_Ptr is access ZoomTransitionMode;
   
   type FocusPreset is (
      Auto,
      Manual,
      AutoMacro,
      AutoNormal,
      AutoInfinity,
      AutoHyperfocal
   );
   for FocusPreset use (
      Auto => 0,
      Manual => 1,
      AutoMacro => 2,
      AutoNormal => 3,
      AutoInfinity => 4,
      AutoHyperfocal => 5
   );
   for FocusPreset'Size use 32;
   
   type FocusPreset_Ptr is access FocusPreset;
   
   type FocusMode is (
      Auto,
      Single,
      Continuous,
      Manual
   );
   for FocusMode use (
      Auto => 0,
      Single => 1,
      Continuous => 2,
      Manual => 3
   );
   for FocusMode'Size use 32;
   
   type FocusMode_Ptr is access FocusMode;
   
   type ManualFocusDistance is (
      Infinity,
      Hyperfocal,
      Nearest
   );
   for ManualFocusDistance use (
      Infinity => 0,
      Hyperfocal => 1,
      Nearest => 2
   );
   for ManualFocusDistance'Size use 32;
   
   type ManualFocusDistance_Ptr is access ManualFocusDistance;
   
   type AutoFocusRange is (
      FullRange,
      Macro,
      Normal
   );
   for AutoFocusRange use (
      FullRange => 0,
      Macro => 1,
      Normal => 2
   );
   for AutoFocusRange'Size use 32;
   
   type AutoFocusRange_Ptr is access AutoFocusRange;
   
   type RegionOfInterestType is (
      Unknown,
      Face
   );
   for RegionOfInterestType use (
      Unknown => 0,
      Face => 1
   );
   for RegionOfInterestType'Size use 32;
   
   type RegionOfInterestType_Ptr is access RegionOfInterestType;
   
   type HdrVideoMode is (
      Off,
      On,
      Auto
   );
   for HdrVideoMode use (
      Off => 0,
      On => 1,
      Auto => 2
   );
   for HdrVideoMode'Size use 32;
   
   type HdrVideoMode_Ptr is access HdrVideoMode;
   
   type OpticalImageStabilizationMode is (
      Off,
      On,
      Auto
   );
   for OpticalImageStabilizationMode use (
      Off => 0,
      On => 1,
      Auto => 2
   );
   for OpticalImageStabilizationMode'Size use 32;
   
   type OpticalImageStabilizationMode_Ptr is access OpticalImageStabilizationMode;
   
   type CaptureUse is (
      None,
      Photo,
      Video
   );
   for CaptureUse use (
      None => 0,
      Photo => 1,
      Video => 2
   );
   for CaptureUse'Size use 32;
   
   type CaptureUse_Ptr is access CaptureUse;
   
   type MediaCaptureOptimization is (
      Default,
      Quality,
      Latency,
      Power,
      LatencyThenQuality,
      LatencyThenPower,
      PowerAndQuality
   );
   for MediaCaptureOptimization use (
      Default => 0,
      Quality => 1,
      Latency => 2,
      Power => 3,
      LatencyThenQuality => 4,
      LatencyThenPower => 5,
      PowerAndQuality => 6
   );
   for MediaCaptureOptimization'Size use 32;
   
   type MediaCaptureOptimization_Ptr is access MediaCaptureOptimization;
   
   type VideoDeviceControllerSetDevicePropertyStatus is (
      Success,
      UnknownFailure,
      NotSupported,
      InvalidValue,
      DeviceNotAvailable,
      NotInControl
   );
   for VideoDeviceControllerSetDevicePropertyStatus use (
      Success => 0,
      UnknownFailure => 1,
      NotSupported => 2,
      InvalidValue => 3,
      DeviceNotAvailable => 4,
      NotInControl => 5
   );
   for VideoDeviceControllerSetDevicePropertyStatus'Size use 32;
   
   type VideoDeviceControllerSetDevicePropertyStatus_Ptr is access VideoDeviceControllerSetDevicePropertyStatus;
   
   type VideoDeviceControllerGetDevicePropertyStatus is (
      Success,
      UnknownFailure,
      BufferTooSmall,
      NotSupported,
      DeviceNotAvailable,
      MaxPropertyValueSizeTooSmall,
      MaxPropertyValueSizeRequired
   );
   for VideoDeviceControllerGetDevicePropertyStatus use (
      Success => 0,
      UnknownFailure => 1,
      BufferTooSmall => 2,
      NotSupported => 3,
      DeviceNotAvailable => 4,
      MaxPropertyValueSizeTooSmall => 5,
      MaxPropertyValueSizeRequired => 6
   );
   for VideoDeviceControllerGetDevicePropertyStatus'Size use 32;
   
   type VideoDeviceControllerGetDevicePropertyStatus_Ptr is access VideoDeviceControllerGetDevicePropertyStatus;
   
   type TelephonyKey is (
      D0,
      D1,
      D2,
      D3,
      D4,
      D5,
      D6,
      D7,
      D8,
      D9,
      Star,
      Pound,
      A,
      B,
      C,
      D
   );
   for TelephonyKey use (
      D0 => 0,
      D1 => 1,
      D2 => 2,
      D3 => 3,
      D4 => 4,
      D5 => 5,
      D6 => 6,
      D7 => 7,
      D8 => 8,
      D9 => 9,
      Star => 10,
      Pound => 11,
      A => 12,
      B => 13,
      C => 14,
      D => 15
   );
   for TelephonyKey'Size use 32;
   
   type TelephonyKey_Ptr is access TelephonyKey;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type CallControlContract is null record;
   pragma Convention (C_Pass_By_Copy , CallControlContract);
   
   type CallControlContract_Ptr is access CallControlContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type CallControlEventHandler_Interface;
   type CallControlEventHandler is access all CallControlEventHandler_Interface'Class;
   type CallControlEventHandler_Ptr is access all CallControlEventHandler;
   type DialRequestedEventHandler_Interface;
   type DialRequestedEventHandler is access all DialRequestedEventHandler_Interface'Class;
   type DialRequestedEventHandler_Ptr is access all DialRequestedEventHandler;
   type RedialRequestedEventHandler_Interface;
   type RedialRequestedEventHandler is access all RedialRequestedEventHandler_Interface'Class;
   type RedialRequestedEventHandler_Ptr is access all RedialRequestedEventHandler;
   type KeypadPressedEventHandler_Interface;
   type KeypadPressedEventHandler is access all KeypadPressedEventHandler_Interface'Class;
   type KeypadPressedEventHandler_Ptr is access all KeypadPressedEventHandler;
   type TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged_Interface;
   type TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged is access all TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged_Interface'Class;
   type TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged_Ptr is access all TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged;
   type TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged_Interface;
   type TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged is access all TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged_Interface'Class;
   type TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged_Ptr is access all TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged;
   type AsyncOperationCompletedHandler_IModuleCommandResult_Interface;
   type AsyncOperationCompletedHandler_IModuleCommandResult is access all AsyncOperationCompletedHandler_IModuleCommandResult_Interface'Class;
   type AsyncOperationCompletedHandler_IModuleCommandResult_Ptr is access all AsyncOperationCompletedHandler_IModuleCommandResult;
   type TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived_Interface;
   type TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived is access all TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived_Interface'Class;
   type TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived_Ptr is access all TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDefaultAudioDeviceChangedEventArgs_Interface;
   type IDefaultAudioDeviceChangedEventArgs is access all IDefaultAudioDeviceChangedEventArgs_Interface'Class;
   type IDefaultAudioDeviceChangedEventArgs_Ptr is access all IDefaultAudioDeviceChangedEventArgs;
   type IMediaDeviceStatics_Interface;
   type IMediaDeviceStatics is access all IMediaDeviceStatics_Interface'Class;
   type IMediaDeviceStatics_Ptr is access all IMediaDeviceStatics;
   type IModuleCommandResult_Interface;
   type IModuleCommandResult is access all IModuleCommandResult_Interface'Class;
   type IModuleCommandResult_Ptr is access all IModuleCommandResult;
   type IAudioDeviceModule_Interface;
   type IAudioDeviceModule is access all IAudioDeviceModule_Interface'Class;
   type IAudioDeviceModule_Ptr is access all IAudioDeviceModule;
   type IAudioDeviceModulesManager_Interface;
   type IAudioDeviceModulesManager is access all IAudioDeviceModulesManager_Interface'Class;
   type IAudioDeviceModulesManager_Ptr is access all IAudioDeviceModulesManager;
   type IAudioDeviceModulesManagerFactory_Interface;
   type IAudioDeviceModulesManagerFactory is access all IAudioDeviceModulesManagerFactory_Interface'Class;
   type IAudioDeviceModulesManagerFactory_Ptr is access all IAudioDeviceModulesManagerFactory;
   type IAudioDeviceModuleNotificationEventArgs_Interface;
   type IAudioDeviceModuleNotificationEventArgs is access all IAudioDeviceModuleNotificationEventArgs_Interface'Class;
   type IAudioDeviceModuleNotificationEventArgs_Ptr is access all IAudioDeviceModuleNotificationEventArgs;
   type ISceneModeControl_Interface;
   type ISceneModeControl is access all ISceneModeControl_Interface'Class;
   type ISceneModeControl_Ptr is access all ISceneModeControl;
   type ITorchControl_Interface;
   type ITorchControl is access all ITorchControl_Interface'Class;
   type ITorchControl_Ptr is access all ITorchControl;
   type IFlashControl_Interface;
   type IFlashControl is access all IFlashControl_Interface'Class;
   type IFlashControl_Ptr is access all IFlashControl;
   type IFlashControl2_Interface;
   type IFlashControl2 is access all IFlashControl2_Interface'Class;
   type IFlashControl2_Ptr is access all IFlashControl2;
   type IExposureCompensationControl_Interface;
   type IExposureCompensationControl is access all IExposureCompensationControl_Interface'Class;
   type IExposureCompensationControl_Ptr is access all IExposureCompensationControl;
   type IIsoSpeedControl_Interface;
   type IIsoSpeedControl is access all IIsoSpeedControl_Interface'Class;
   type IIsoSpeedControl_Ptr is access all IIsoSpeedControl;
   type IIsoSpeedControl2_Interface;
   type IIsoSpeedControl2 is access all IIsoSpeedControl2_Interface'Class;
   type IIsoSpeedControl2_Ptr is access all IIsoSpeedControl2;
   type IWhiteBalanceControl_Interface;
   type IWhiteBalanceControl is access all IWhiteBalanceControl_Interface'Class;
   type IWhiteBalanceControl_Ptr is access all IWhiteBalanceControl;
   type IExposureControl_Interface;
   type IExposureControl is access all IExposureControl_Interface'Class;
   type IExposureControl_Ptr is access all IExposureControl;
   type IZoomSettings_Interface;
   type IZoomSettings is access all IZoomSettings_Interface'Class;
   type IZoomSettings_Ptr is access all IZoomSettings;
   type IZoomControl_Interface;
   type IZoomControl is access all IZoomControl_Interface'Class;
   type IZoomControl_Ptr is access all IZoomControl;
   type IZoomControl2_Interface;
   type IZoomControl2 is access all IZoomControl2_Interface'Class;
   type IZoomControl2_Ptr is access all IZoomControl2;
   type IFocusSettings_Interface;
   type IFocusSettings is access all IFocusSettings_Interface'Class;
   type IFocusSettings_Ptr is access all IFocusSettings;
   type IFocusControl_Interface;
   type IFocusControl is access all IFocusControl_Interface'Class;
   type IFocusControl_Ptr is access all IFocusControl;
   type IFocusControl2_Interface;
   type IFocusControl2 is access all IFocusControl2_Interface'Class;
   type IFocusControl2_Ptr is access all IFocusControl2;
   type IRegionOfInterest_Interface;
   type IRegionOfInterest is access all IRegionOfInterest_Interface'Class;
   type IRegionOfInterest_Ptr is access all IRegionOfInterest;
   type IRegionOfInterest2_Interface;
   type IRegionOfInterest2 is access all IRegionOfInterest2_Interface'Class;
   type IRegionOfInterest2_Ptr is access all IRegionOfInterest2;
   type IRegionsOfInterestControl_Interface;
   type IRegionsOfInterestControl is access all IRegionsOfInterestControl_Interface'Class;
   type IRegionsOfInterestControl_Ptr is access all IRegionsOfInterestControl;
   type IExposurePriorityVideoControl_Interface;
   type IExposurePriorityVideoControl is access all IExposurePriorityVideoControl_Interface'Class;
   type IExposurePriorityVideoControl_Ptr is access all IExposurePriorityVideoControl;
   type IHdrVideoControl_Interface;
   type IHdrVideoControl is access all IHdrVideoControl_Interface'Class;
   type IHdrVideoControl_Ptr is access all IHdrVideoControl;
   type IAdvancedPhotoCaptureSettings_Interface;
   type IAdvancedPhotoCaptureSettings is access all IAdvancedPhotoCaptureSettings_Interface'Class;
   type IAdvancedPhotoCaptureSettings_Ptr is access all IAdvancedPhotoCaptureSettings;
   type IAdvancedPhotoControl_Interface;
   type IAdvancedPhotoControl is access all IAdvancedPhotoControl_Interface'Class;
   type IAdvancedPhotoControl_Ptr is access all IAdvancedPhotoControl;
   type IOpticalImageStabilizationControl_Interface;
   type IOpticalImageStabilizationControl is access all IOpticalImageStabilizationControl_Interface'Class;
   type IOpticalImageStabilizationControl_Ptr is access all IOpticalImageStabilizationControl;
   type IMediaDeviceController_Interface;
   type IMediaDeviceController is access all IMediaDeviceController_Interface'Class;
   type IMediaDeviceController_Ptr is access all IMediaDeviceController;
   type IAudioDeviceController_Interface;
   type IAudioDeviceController is access all IAudioDeviceController_Interface'Class;
   type IAudioDeviceController_Ptr is access all IAudioDeviceController;
   type IVideoDeviceController_Interface;
   type IVideoDeviceController is access all IVideoDeviceController_Interface'Class;
   type IVideoDeviceController_Ptr is access all IVideoDeviceController;
   type IAdvancedVideoCaptureDeviceController2_Interface;
   type IAdvancedVideoCaptureDeviceController2 is access all IAdvancedVideoCaptureDeviceController2_Interface'Class;
   type IAdvancedVideoCaptureDeviceController2_Ptr is access all IAdvancedVideoCaptureDeviceController2;
   type IAdvancedVideoCaptureDeviceController3_Interface;
   type IAdvancedVideoCaptureDeviceController3 is access all IAdvancedVideoCaptureDeviceController3_Interface'Class;
   type IAdvancedVideoCaptureDeviceController3_Ptr is access all IAdvancedVideoCaptureDeviceController3;
   type IAdvancedVideoCaptureDeviceController4_Interface;
   type IAdvancedVideoCaptureDeviceController4 is access all IAdvancedVideoCaptureDeviceController4_Interface'Class;
   type IAdvancedVideoCaptureDeviceController4_Ptr is access all IAdvancedVideoCaptureDeviceController4;
   type IVideoDeviceControllerGetDevicePropertyResult_Interface;
   type IVideoDeviceControllerGetDevicePropertyResult is access all IVideoDeviceControllerGetDevicePropertyResult_Interface'Class;
   type IVideoDeviceControllerGetDevicePropertyResult_Ptr is access all IVideoDeviceControllerGetDevicePropertyResult;
   type IAdvancedVideoCaptureDeviceController5_Interface;
   type IAdvancedVideoCaptureDeviceController5 is access all IAdvancedVideoCaptureDeviceController5_Interface'Class;
   type IAdvancedVideoCaptureDeviceController5_Ptr is access all IAdvancedVideoCaptureDeviceController5;
   type IMediaDeviceControl_Interface;
   type IMediaDeviceControl is access all IMediaDeviceControl_Interface'Class;
   type IMediaDeviceControl_Ptr is access all IMediaDeviceControl;
   type IMediaDeviceControlCapabilities_Interface;
   type IMediaDeviceControlCapabilities is access all IMediaDeviceControlCapabilities_Interface'Class;
   type IMediaDeviceControlCapabilities_Ptr is access all IMediaDeviceControlCapabilities;
   type IAdvancedVideoCaptureDeviceController_Interface;
   type IAdvancedVideoCaptureDeviceController is access all IAdvancedVideoCaptureDeviceController_Interface'Class;
   type IAdvancedVideoCaptureDeviceController_Ptr is access all IAdvancedVideoCaptureDeviceController;
   type ILowLagPhotoSequenceControl_Interface;
   type ILowLagPhotoSequenceControl is access all ILowLagPhotoSequenceControl_Interface'Class;
   type ILowLagPhotoSequenceControl_Ptr is access all ILowLagPhotoSequenceControl;
   type ILowLagPhotoControl_Interface;
   type ILowLagPhotoControl is access all ILowLagPhotoControl_Interface'Class;
   type ILowLagPhotoControl_Ptr is access all ILowLagPhotoControl;
   type IPhotoConfirmationControl_Interface;
   type IPhotoConfirmationControl is access all IPhotoConfirmationControl_Interface'Class;
   type IPhotoConfirmationControl_Ptr is access all IPhotoConfirmationControl;
   type IDialRequestedEventArgs_Interface;
   type IDialRequestedEventArgs is access all IDialRequestedEventArgs_Interface'Class;
   type IDialRequestedEventArgs_Ptr is access all IDialRequestedEventArgs;
   type IRedialRequestedEventArgs_Interface;
   type IRedialRequestedEventArgs is access all IRedialRequestedEventArgs_Interface'Class;
   type IRedialRequestedEventArgs_Ptr is access all IRedialRequestedEventArgs;
   type IKeypadPressedEventArgs_Interface;
   type IKeypadPressedEventArgs is access all IKeypadPressedEventArgs_Interface'Class;
   type IKeypadPressedEventArgs_Ptr is access all IKeypadPressedEventArgs;
   type ICallControl_Interface;
   type ICallControl is access all ICallControl_Interface'Class;
   type ICallControl_Ptr is access all ICallControl;
   type ICallControlStatics_Interface;
   type ICallControlStatics is access all ICallControlStatics_Interface'Class;
   type ICallControlStatics_Ptr is access all ICallControlStatics;
   type IReference_CaptureSceneMode_Interface;
   type IReference_CaptureSceneMode is access all IReference_CaptureSceneMode_Interface'Class;
   type IReference_CaptureSceneMode_Ptr is access all IReference_CaptureSceneMode;
   type IReference_MediaCaptureFocusState_Interface;
   type IReference_MediaCaptureFocusState is access all IReference_MediaCaptureFocusState_Interface'Class;
   type IReference_MediaCaptureFocusState_Ptr is access all IReference_MediaCaptureFocusState;
   type IAsyncOperation_IModuleCommandResult_Interface;
   type IAsyncOperation_IModuleCommandResult is access all IAsyncOperation_IModuleCommandResult_Interface'Class;
   type IAsyncOperation_IModuleCommandResult_Ptr is access all IAsyncOperation_IModuleCommandResult;
   type IIterator_IAudioDeviceModule_Interface;
   type IIterator_IAudioDeviceModule is access all IIterator_IAudioDeviceModule_Interface'Class;
   type IIterator_IAudioDeviceModule_Ptr is access all IIterator_IAudioDeviceModule;
   type IIterable_IAudioDeviceModule_Interface;
   type IIterable_IAudioDeviceModule is access all IIterable_IAudioDeviceModule_Interface'Class;
   type IIterable_IAudioDeviceModule_Ptr is access all IIterable_IAudioDeviceModule;
   type IVectorView_IAudioDeviceModule_Interface;
   type IVectorView_IAudioDeviceModule is access all IVectorView_IAudioDeviceModule_Interface'Class;
   type IVectorView_IAudioDeviceModule_Ptr is access all IVectorView_IAudioDeviceModule;
   type IIterator_CaptureSceneMode_Interface;
   type IIterator_CaptureSceneMode is access all IIterator_CaptureSceneMode_Interface'Class;
   type IIterator_CaptureSceneMode_Ptr is access all IIterator_CaptureSceneMode;
   type IIterable_CaptureSceneMode_Interface;
   type IIterable_CaptureSceneMode is access all IIterable_CaptureSceneMode_Interface'Class;
   type IIterable_CaptureSceneMode_Ptr is access all IIterable_CaptureSceneMode;
   type IVectorView_CaptureSceneMode_Interface;
   type IVectorView_CaptureSceneMode is access all IVectorView_CaptureSceneMode_Interface'Class;
   type IVectorView_CaptureSceneMode_Ptr is access all IVectorView_CaptureSceneMode;
   type IIterator_IsoSpeedPreset_Interface;
   type IIterator_IsoSpeedPreset is access all IIterator_IsoSpeedPreset_Interface'Class;
   type IIterator_IsoSpeedPreset_Ptr is access all IIterator_IsoSpeedPreset;
   type IIterable_IsoSpeedPreset_Interface;
   type IIterable_IsoSpeedPreset is access all IIterable_IsoSpeedPreset_Interface'Class;
   type IIterable_IsoSpeedPreset_Ptr is access all IIterable_IsoSpeedPreset;
   type IVectorView_IsoSpeedPreset_Interface;
   type IVectorView_IsoSpeedPreset is access all IVectorView_IsoSpeedPreset_Interface'Class;
   type IVectorView_IsoSpeedPreset_Ptr is access all IVectorView_IsoSpeedPreset;
   type IIterator_ZoomTransitionMode_Interface;
   type IIterator_ZoomTransitionMode is access all IIterator_ZoomTransitionMode_Interface'Class;
   type IIterator_ZoomTransitionMode_Ptr is access all IIterator_ZoomTransitionMode;
   type IIterable_ZoomTransitionMode_Interface;
   type IIterable_ZoomTransitionMode is access all IIterable_ZoomTransitionMode_Interface'Class;
   type IIterable_ZoomTransitionMode_Ptr is access all IIterable_ZoomTransitionMode;
   type IVectorView_ZoomTransitionMode_Interface;
   type IVectorView_ZoomTransitionMode is access all IVectorView_ZoomTransitionMode_Interface'Class;
   type IVectorView_ZoomTransitionMode_Ptr is access all IVectorView_ZoomTransitionMode;
   type IReference_ManualFocusDistance_Interface;
   type IReference_ManualFocusDistance is access all IReference_ManualFocusDistance_Interface'Class;
   type IReference_ManualFocusDistance_Ptr is access all IReference_ManualFocusDistance;
   type IIterator_FocusPreset_Interface;
   type IIterator_FocusPreset is access all IIterator_FocusPreset_Interface'Class;
   type IIterator_FocusPreset_Ptr is access all IIterator_FocusPreset;
   type IIterable_FocusPreset_Interface;
   type IIterable_FocusPreset is access all IIterable_FocusPreset_Interface'Class;
   type IIterable_FocusPreset_Ptr is access all IIterable_FocusPreset;
   type IVectorView_FocusPreset_Interface;
   type IVectorView_FocusPreset is access all IVectorView_FocusPreset_Interface'Class;
   type IVectorView_FocusPreset_Ptr is access all IVectorView_FocusPreset;
   type IIterator_FocusMode_Interface;
   type IIterator_FocusMode is access all IIterator_FocusMode_Interface'Class;
   type IIterator_FocusMode_Ptr is access all IIterator_FocusMode;
   type IIterable_FocusMode_Interface;
   type IIterable_FocusMode is access all IIterable_FocusMode_Interface'Class;
   type IIterable_FocusMode_Ptr is access all IIterable_FocusMode;
   type IVectorView_FocusMode_Interface;
   type IVectorView_FocusMode is access all IVectorView_FocusMode_Interface'Class;
   type IVectorView_FocusMode_Ptr is access all IVectorView_FocusMode;
   type IIterator_ManualFocusDistance_Interface;
   type IIterator_ManualFocusDistance is access all IIterator_ManualFocusDistance_Interface'Class;
   type IIterator_ManualFocusDistance_Ptr is access all IIterator_ManualFocusDistance;
   type IIterable_ManualFocusDistance_Interface;
   type IIterable_ManualFocusDistance is access all IIterable_ManualFocusDistance_Interface'Class;
   type IIterable_ManualFocusDistance_Ptr is access all IIterable_ManualFocusDistance;
   type IVectorView_ManualFocusDistance_Interface;
   type IVectorView_ManualFocusDistance is access all IVectorView_ManualFocusDistance_Interface'Class;
   type IVectorView_ManualFocusDistance_Ptr is access all IVectorView_ManualFocusDistance;
   type IIterator_AutoFocusRange_Interface;
   type IIterator_AutoFocusRange is access all IIterator_AutoFocusRange_Interface'Class;
   type IIterator_AutoFocusRange_Ptr is access all IIterator_AutoFocusRange;
   type IIterable_AutoFocusRange_Interface;
   type IIterable_AutoFocusRange is access all IIterable_AutoFocusRange_Interface'Class;
   type IIterable_AutoFocusRange_Ptr is access all IIterable_AutoFocusRange;
   type IVectorView_AutoFocusRange_Interface;
   type IVectorView_AutoFocusRange is access all IVectorView_AutoFocusRange_Interface'Class;
   type IVectorView_AutoFocusRange_Ptr is access all IVectorView_AutoFocusRange;
   type IIterator_IRegionOfInterest_Interface;
   type IIterator_IRegionOfInterest is access all IIterator_IRegionOfInterest_Interface'Class;
   type IIterator_IRegionOfInterest_Ptr is access all IIterator_IRegionOfInterest;
   type IIterable_IRegionOfInterest_Interface;
   type IIterable_IRegionOfInterest is access all IIterable_IRegionOfInterest_Interface'Class;
   type IIterable_IRegionOfInterest_Ptr is access all IIterable_IRegionOfInterest;
   type IIterator_HdrVideoMode_Interface;
   type IIterator_HdrVideoMode is access all IIterator_HdrVideoMode_Interface'Class;
   type IIterator_HdrVideoMode_Ptr is access all IIterator_HdrVideoMode;
   type IIterable_HdrVideoMode_Interface;
   type IIterable_HdrVideoMode is access all IIterable_HdrVideoMode_Interface'Class;
   type IIterable_HdrVideoMode_Ptr is access all IIterable_HdrVideoMode;
   type IVectorView_HdrVideoMode_Interface;
   type IVectorView_HdrVideoMode is access all IVectorView_HdrVideoMode_Interface'Class;
   type IVectorView_HdrVideoMode_Ptr is access all IVectorView_HdrVideoMode;
   type IIterator_AdvancedPhotoMode_Interface;
   type IIterator_AdvancedPhotoMode is access all IIterator_AdvancedPhotoMode_Interface'Class;
   type IIterator_AdvancedPhotoMode_Ptr is access all IIterator_AdvancedPhotoMode;
   type IIterable_AdvancedPhotoMode_Interface;
   type IIterable_AdvancedPhotoMode is access all IIterable_AdvancedPhotoMode_Interface'Class;
   type IIterable_AdvancedPhotoMode_Ptr is access all IIterable_AdvancedPhotoMode;
   type IVectorView_AdvancedPhotoMode_Interface;
   type IVectorView_AdvancedPhotoMode is access all IVectorView_AdvancedPhotoMode_Interface'Class;
   type IVectorView_AdvancedPhotoMode_Ptr is access all IVectorView_AdvancedPhotoMode;
   type IIterator_OpticalImageStabilizationMode_Interface;
   type IIterator_OpticalImageStabilizationMode is access all IIterator_OpticalImageStabilizationMode_Interface'Class;
   type IIterator_OpticalImageStabilizationMode_Ptr is access all IIterator_OpticalImageStabilizationMode;
   type IIterable_OpticalImageStabilizationMode_Interface;
   type IIterable_OpticalImageStabilizationMode is access all IIterable_OpticalImageStabilizationMode_Interface'Class;
   type IIterable_OpticalImageStabilizationMode_Ptr is access all IIterable_OpticalImageStabilizationMode;
   type IVectorView_OpticalImageStabilizationMode_Interface;
   type IVectorView_OpticalImageStabilizationMode is access all IVectorView_OpticalImageStabilizationMode_Interface'Class;
   type IVectorView_OpticalImageStabilizationMode_Ptr is access all IVectorView_OpticalImageStabilizationMode;
   
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
   
   IID_IDefaultAudioDeviceChangedEventArgs : aliased constant Windows.IID := (286230575, 7173, 18007, (161, 142, 71, 201, 182, 159, 7, 171 ));
   
   type IDefaultAudioDeviceChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IDefaultAudioDeviceChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Role
   (
      This       : access IDefaultAudioDeviceChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Devices.AudioDeviceRole
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaDeviceStatics : aliased constant Windows.IID := (2855115328, 37023, 19386, (191, 139, 12, 13, 41, 111, 20, 240 ));
   
   type IMediaDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAudioCaptureSelector
   (
      This       : access IMediaDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetAudioRenderSelector
   (
      This       : access IMediaDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetVideoCaptureSelector
   (
      This       : access IMediaDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultAudioCaptureId
   (
      This       : access IMediaDeviceStatics_Interface
      ; role : Windows.Media.Devices.AudioDeviceRole
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultAudioRenderId
   (
      This       : access IMediaDeviceStatics_Interface
      ; role : Windows.Media.Devices.AudioDeviceRole
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_DefaultAudioCaptureDeviceChanged
   (
      This       : access IMediaDeviceStatics_Interface
      ; handler : TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DefaultAudioCaptureDeviceChanged
   (
      This       : access IMediaDeviceStatics_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DefaultAudioRenderDeviceChanged
   (
      This       : access IMediaDeviceStatics_Interface
      ; handler : TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DefaultAudioRenderDeviceChanged
   (
      This       : access IMediaDeviceStatics_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IModuleCommandResult : aliased constant Windows.IID := (1376591540, 4980, 19581, (177, 228, 57, 220, 223, 62, 174, 78 ));
   
   type IModuleCommandResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IModuleCommandResult_Interface
      ; RetVal : access Windows.Media.Devices.SendCommandStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Result
   (
      This       : access IModuleCommandResult_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAudioDeviceModule : aliased constant Windows.IID := (2261756982, 18369, 19251, (152, 82, 135, 115, 236, 75, 225, 35 ));
   
   type IAudioDeviceModule_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ClassId
   (
      This       : access IAudioDeviceModule_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IAudioDeviceModule_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InstanceId
   (
      This       : access IAudioDeviceModule_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MajorVersion
   (
      This       : access IAudioDeviceModule_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MinorVersion
   (
      This       : access IAudioDeviceModule_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SendCommandAsync
   (
      This       : access IAudioDeviceModule_Interface
      ; Command : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Media.Devices.IAsyncOperation_IModuleCommandResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAudioDeviceModulesManager : aliased constant Windows.IID := (1789135949, 38410, 19740, (179, 24, 0, 34, 96, 69, 71, 237 ));
   
   type IAudioDeviceModulesManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ModuleNotificationReceived
   (
      This       : access IAudioDeviceModulesManager_Interface
      ; handler : TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ModuleNotificationReceived
   (
      This       : access IAudioDeviceModulesManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function FindAllById
   (
      This       : access IAudioDeviceModulesManager_Interface
      ; moduleId : Windows.String
      ; RetVal : access Windows.Media.Devices.IVectorView_IAudioDeviceModule -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAll
   (
      This       : access IAudioDeviceModulesManager_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_IAudioDeviceModule -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAudioDeviceModulesManagerFactory : aliased constant Windows.IID := (2377135728, 58957, 18291, (150, 192, 188, 126, 191, 14, 6, 63 ));
   
   type IAudioDeviceModulesManagerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAudioDeviceModulesManagerFactory_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Media.Devices.IAudioDeviceModulesManager
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAudioDeviceModuleNotificationEventArgs : aliased constant Windows.IID := (3823357103, 8780, 18622, (149, 107, 154, 19, 19, 78, 150, 232 ));
   
   type IAudioDeviceModuleNotificationEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Module
   (
      This       : access IAudioDeviceModuleNotificationEventArgs_Interface
      ; RetVal : access Windows.Media.Devices.IAudioDeviceModule
   )
   return Windows.HRESULT is abstract;
   
   function get_NotificationData
   (
      This       : access IAudioDeviceModuleNotificationEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISceneModeControl : aliased constant Windows.IID := (3566099191, 36185, 18516, (140, 98, 18, 199, 11, 168, 155, 124 ));
   
   type ISceneModeControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportedModes
   (
      This       : access ISceneModeControl_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_CaptureSceneMode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access ISceneModeControl_Interface
      ; RetVal : access Windows.Media.Devices.CaptureSceneMode
   )
   return Windows.HRESULT is abstract;
   
   function SetValueAsync
   (
      This       : access ISceneModeControl_Interface
      ; sceneMode : Windows.Media.Devices.CaptureSceneMode
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ITorchControl : aliased constant Windows.IID := (2785359461, 33360, 16748, (145, 154, 114, 66, 150, 175, 163, 6 ));
   
   type ITorchControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access ITorchControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerSupported
   (
      This       : access ITorchControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Enabled
   (
      This       : access ITorchControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Enabled
   (
      This       : access ITorchControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerPercent
   (
      This       : access ITorchControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_PowerPercent
   (
      This       : access ITorchControl_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IFlashControl : aliased constant Windows.IID := (3740540350, 32104, 17891, (140, 15, 190, 123, 179, 40, 55, 208 ));
   
   type IFlashControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IFlashControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerSupported
   (
      This       : access IFlashControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RedEyeReductionSupported
   (
      This       : access IFlashControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Enabled
   (
      This       : access IFlashControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Enabled
   (
      This       : access IFlashControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Auto
   (
      This       : access IFlashControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Auto
   (
      This       : access IFlashControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RedEyeReduction
   (
      This       : access IFlashControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RedEyeReduction
   (
      This       : access IFlashControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerPercent
   (
      This       : access IFlashControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_PowerPercent
   (
      This       : access IFlashControl_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IFlashControl2 : aliased constant Windows.IID := (2099891358, 30177, 19191, (189, 125, 78, 56, 225, 192, 108, 214 ));
   
   type IFlashControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AssistantLightSupported
   (
      This       : access IFlashControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AssistantLightEnabled
   (
      This       : access IFlashControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AssistantLightEnabled
   (
      This       : access IFlashControl2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IExposureCompensationControl : aliased constant Windows.IID := (2177427508, 56556, 16401, (166, 16, 31, 56, 71, 230, 74, 202 ));
   
   type IExposureCompensationControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IExposureCompensationControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Min
   (
      This       : access IExposureCompensationControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IExposureCompensationControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IExposureCompensationControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IExposureCompensationControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function SetValueAsync
   (
      This       : access IExposureCompensationControl_Interface
      ; value : Windows.Single
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIsoSpeedControl : aliased constant Windows.IID := (666288930, 9645, 20251, (170, 171, 82, 74, 179, 118, 202, 51 ));
   
   type IIsoSpeedControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IIsoSpeedControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedPresets
   (
      This       : access IIsoSpeedControl_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_IsoSpeedPreset -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Preset
   (
      This       : access IIsoSpeedControl_Interface
      ; RetVal : access Windows.Media.Devices.IsoSpeedPreset
   )
   return Windows.HRESULT is abstract;
   
   function SetPresetAsync
   (
      This       : access IIsoSpeedControl_Interface
      ; preset : Windows.Media.Devices.IsoSpeedPreset
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIsoSpeedControl2 : aliased constant Windows.IID := (1863678194, 28023, 20362, (140, 47, 97, 48, 182, 57, 80, 83 ));
   
   type IIsoSpeedControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Min
   (
      This       : access IIsoSpeedControl2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IIsoSpeedControl2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IIsoSpeedControl2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IIsoSpeedControl2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetValueAsync
   (
      This       : access IIsoSpeedControl2_Interface
      ; isoSpeed : Windows.UInt32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Auto
   (
      This       : access IIsoSpeedControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAutoAsync
   (
      This       : access IIsoSpeedControl2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IWhiteBalanceControl : aliased constant Windows.IID := (2015298686, 29026, 18888, (168, 249, 148, 129, 197, 101, 54, 62 ));
   
   type IWhiteBalanceControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IWhiteBalanceControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Preset
   (
      This       : access IWhiteBalanceControl_Interface
      ; RetVal : access Windows.Media.Devices.ColorTemperaturePreset
   )
   return Windows.HRESULT is abstract;
   
   function SetPresetAsync
   (
      This       : access IWhiteBalanceControl_Interface
      ; preset : Windows.Media.Devices.ColorTemperaturePreset
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Min
   (
      This       : access IWhiteBalanceControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IWhiteBalanceControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IWhiteBalanceControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IWhiteBalanceControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetValueAsync
   (
      This       : access IWhiteBalanceControl_Interface
      ; temperature : Windows.UInt32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IExposureControl : aliased constant Windows.IID := (166251490, 44438, 20264, (160, 224, 150, 237, 126, 27, 95, 210 ));
   
   type IExposureControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IExposureControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Auto
   (
      This       : access IExposureControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAutoAsync
   (
      This       : access IExposureControl_Interface
      ; value : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Min
   (
      This       : access IExposureControl_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IExposureControl_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IExposureControl_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IExposureControl_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function SetValueAsync
   (
      This       : access IExposureControl_Interface
      ; shutterDuration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IZoomSettings : aliased constant Windows.IID := (1792437028, 5300, 19453, (177, 143, 136, 254, 36, 70, 59, 82 ));
   
   type IZoomSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mode
   (
      This       : access IZoomSettings_Interface
      ; RetVal : access Windows.Media.Devices.ZoomTransitionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IZoomSettings_Interface
      ; value : Windows.Media.Devices.ZoomTransitionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IZoomSettings_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IZoomSettings_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IZoomControl : aliased constant Windows.IID := (975047442, 13018, 19479, (191, 215, 141, 12, 115, 200, 245, 165 ));
   
   type IZoomControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IZoomControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Min
   (
      This       : access IZoomControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IZoomControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IZoomControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IZoomControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IZoomControl_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IZoomControl2 : aliased constant Windows.IID := (1770274224, 11929, 17985, (133, 41, 24, 79, 49, 157, 22, 113 ));
   
   type IZoomControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportedModes
   (
      This       : access IZoomControl2_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_ZoomTransitionMode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Mode
   (
      This       : access IZoomControl2_Interface
      ; RetVal : access Windows.Media.Devices.ZoomTransitionMode
   )
   return Windows.HRESULT is abstract;
   
   function Configure
   (
      This       : access IZoomControl2_Interface
      ; settings : Windows.Media.Devices.IZoomSettings
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IFocusSettings : aliased constant Windows.IID := (2039844715, 12899, 17013, (133, 214, 174, 174, 137, 28, 150, 238 ));
   
   type IFocusSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mode
   (
      This       : access IFocusSettings_Interface
      ; RetVal : access Windows.Media.Devices.FocusMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IFocusSettings_Interface
      ; value : Windows.Media.Devices.FocusMode
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoFocusRange
   (
      This       : access IFocusSettings_Interface
      ; RetVal : access Windows.Media.Devices.AutoFocusRange
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoFocusRange
   (
      This       : access IFocusSettings_Interface
      ; value : Windows.Media.Devices.AutoFocusRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IFocusSettings_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IFocusSettings_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Distance
   (
      This       : access IFocusSettings_Interface
      ; RetVal : access Windows.Media.Devices.IReference_ManualFocusDistance -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Distance
   (
      This       : access IFocusSettings_Interface
      ; value : Windows.Media.Devices.IReference_ManualFocusDistance
   )
   return Windows.HRESULT is abstract;
   
   function get_WaitForFocus
   (
      This       : access IFocusSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_WaitForFocus
   (
      This       : access IFocusSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DisableDriverFallback
   (
      This       : access IFocusSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DisableDriverFallback
   (
      This       : access IFocusSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IFocusControl : aliased constant Windows.IID := (3235416566, 21032, 17491, (177, 83, 133, 96, 101, 146, 178, 56 ));
   
   type IFocusControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IFocusControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedPresets
   (
      This       : access IFocusControl_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_FocusPreset -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Preset
   (
      This       : access IFocusControl_Interface
      ; RetVal : access Windows.Media.Devices.FocusPreset
   )
   return Windows.HRESULT is abstract;
   
   function SetPresetAsync
   (
      This       : access IFocusControl_Interface
      ; preset : Windows.Media.Devices.FocusPreset
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetPresetWithCompletionOptionAsync
   (
      This       : access IFocusControl_Interface
      ; preset : Windows.Media.Devices.FocusPreset
      ; completeBeforeFocus : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Min
   (
      This       : access IFocusControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IFocusControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IFocusControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IFocusControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetValueAsync
   (
      This       : access IFocusControl_Interface
      ; focus : Windows.UInt32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function FocusAsync
   (
      This       : access IFocusControl_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IFocusControl2 : aliased constant Windows.IID := (1065156424, 50484, 20126, (148, 195, 82, 239, 42, 253, 93, 7 ));
   
   type IFocusControl2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FocusChangedSupported
   (
      This       : access IFocusControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_WaitForFocusSupported
   (
      This       : access IFocusControl2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedFocusModes
   (
      This       : access IFocusControl2_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_FocusMode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedFocusDistances
   (
      This       : access IFocusControl2_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_ManualFocusDistance -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedFocusRanges
   (
      This       : access IFocusControl2_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_AutoFocusRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Mode
   (
      This       : access IFocusControl2_Interface
      ; RetVal : access Windows.Media.Devices.FocusMode
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusState
   (
      This       : access IFocusControl2_Interface
      ; RetVal : access Windows.Media.Devices.MediaCaptureFocusState
   )
   return Windows.HRESULT is abstract;
   
   function UnlockAsync
   (
      This       : access IFocusControl2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function LockAsync
   (
      This       : access IFocusControl2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function Configure
   (
      This       : access IFocusControl2_Interface
      ; settings : Windows.Media.Devices.IFocusSettings
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRegionOfInterest : aliased constant Windows.IID := (3857500212, 52838, 19973, (167, 143, 207, 57, 26, 94, 194, 209 ));
   
   type IRegionOfInterest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AutoFocusEnabled
   (
      This       : access IRegionOfInterest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoFocusEnabled
   (
      This       : access IRegionOfInterest_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoWhiteBalanceEnabled
   (
      This       : access IRegionOfInterest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoWhiteBalanceEnabled
   (
      This       : access IRegionOfInterest_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoExposureEnabled
   (
      This       : access IRegionOfInterest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoExposureEnabled
   (
      This       : access IRegionOfInterest_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Bounds
   (
      This       : access IRegionOfInterest_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_Bounds
   (
      This       : access IRegionOfInterest_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRegionOfInterest2 : aliased constant Windows.IID := (436087441, 29610, 19793, (138, 157, 86, 204, 247, 219, 127, 84 ));
   
   type IRegionOfInterest2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IRegionOfInterest2_Interface
      ; RetVal : access Windows.Media.Devices.RegionOfInterestType
   )
   return Windows.HRESULT is abstract;
   
   function put_Type
   (
      This       : access IRegionOfInterest2_Interface
      ; value : Windows.Media.Devices.RegionOfInterestType
   )
   return Windows.HRESULT is abstract;
   
   function get_BoundsNormalized
   (
      This       : access IRegionOfInterest2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_BoundsNormalized
   (
      This       : access IRegionOfInterest2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Weight
   (
      This       : access IRegionOfInterest2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Weight
   (
      This       : access IRegionOfInterest2_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRegionsOfInterestControl : aliased constant Windows.IID := (3273913639, 43787, 17752, (139, 91, 223, 86, 147, 219, 3, 120 ));
   
   type IRegionsOfInterestControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxRegions
   (
      This       : access IRegionsOfInterestControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetRegionsAsync
   (
      This       : access IRegionsOfInterestControl_Interface
      ; regions : Windows.Media.Devices.IIterable_IRegionOfInterest
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetRegionsWithLockAsync
   (
      This       : access IRegionsOfInterestControl_Interface
      ; regions : Windows.Media.Devices.IIterable_IRegionOfInterest
      ; lockValues : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ClearRegionsAsync
   (
      This       : access IRegionsOfInterestControl_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoFocusSupported
   (
      This       : access IRegionsOfInterestControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoWhiteBalanceSupported
   (
      This       : access IRegionsOfInterestControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoExposureSupported
   (
      This       : access IRegionsOfInterestControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IExposurePriorityVideoControl : aliased constant Windows.IID := (749879459, 20840, 17009, (158, 165, 71, 98, 26, 152, 163, 82 ));
   
   type IExposurePriorityVideoControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IExposurePriorityVideoControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Enabled
   (
      This       : access IExposurePriorityVideoControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Enabled
   (
      This       : access IExposurePriorityVideoControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IHdrVideoControl : aliased constant Windows.IID := (1440277200, 12480, 17343, (155, 154, 151, 153, 215, 12, 237, 148 ));
   
   type IHdrVideoControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IHdrVideoControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedModes
   (
      This       : access IHdrVideoControl_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_HdrVideoMode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Mode
   (
      This       : access IHdrVideoControl_Interface
      ; RetVal : access Windows.Media.Devices.HdrVideoMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IHdrVideoControl_Interface
      ; value : Windows.Media.Devices.HdrVideoMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAdvancedPhotoCaptureSettings : aliased constant Windows.IID := (150177338, 24, 17499, (147, 210, 100, 109, 28, 94, 208, 92 ));
   
   type IAdvancedPhotoCaptureSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mode
   (
      This       : access IAdvancedPhotoCaptureSettings_Interface
      ; RetVal : access Windows.Media.Devices.AdvancedPhotoMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IAdvancedPhotoCaptureSettings_Interface
      ; value : Windows.Media.Devices.AdvancedPhotoMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAdvancedPhotoControl : aliased constant Windows.IID := (3316733062, 36865, 18050, (147, 9, 104, 234, 224, 8, 14, 236 ));
   
   type IAdvancedPhotoControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IAdvancedPhotoControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedModes
   (
      This       : access IAdvancedPhotoControl_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_AdvancedPhotoMode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Mode
   (
      This       : access IAdvancedPhotoControl_Interface
      ; RetVal : access Windows.Media.Devices.AdvancedPhotoMode
   )
   return Windows.HRESULT is abstract;
   
   function Configure
   (
      This       : access IAdvancedPhotoControl_Interface
      ; settings : Windows.Media.Devices.IAdvancedPhotoCaptureSettings
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IOpticalImageStabilizationControl : aliased constant Windows.IID := (3215825949, 188, 16955, (142, 178, 160, 23, 140, 169, 66, 71 ));
   
   type IOpticalImageStabilizationControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IOpticalImageStabilizationControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedModes
   (
      This       : access IOpticalImageStabilizationControl_Interface
      ; RetVal : access Windows.Media.Devices.IVectorView_OpticalImageStabilizationMode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Mode
   (
      This       : access IOpticalImageStabilizationControl_Interface
      ; RetVal : access Windows.Media.Devices.OpticalImageStabilizationMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IOpticalImageStabilizationControl_Interface
      ; value : Windows.Media.Devices.OpticalImageStabilizationMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaDeviceController : aliased constant Windows.IID := (4143510990, 8346, 18683, (134, 252, 212, 69, 120, 243, 23, 230 ));
   
   type IMediaDeviceController_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAvailableMediaStreamProperties
   (
      This       : access IMediaDeviceController_Interface
      ; mediaStreamType : Windows.Media.Capture.MediaStreamType
      ; RetVal : access Windows.Media.MediaProperties.IVectorView_IMediaEncodingProperties -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMediaStreamProperties
   (
      This       : access IMediaDeviceController_Interface
      ; mediaStreamType : Windows.Media.Capture.MediaStreamType
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function SetMediaStreamPropertiesAsync
   (
      This       : access IMediaDeviceController_Interface
      ; mediaStreamType : Windows.Media.Capture.MediaStreamType
      ; mediaEncodingProperties : Windows.Media.MediaProperties.IMediaEncodingProperties
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAudioDeviceController : aliased constant Windows.IID := (3990135688, 31175, 20348, (144, 232, 239, 147, 75, 33, 88, 10 ));
   
   type IAudioDeviceController_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Muted
   (
      This       : access IAudioDeviceController_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Muted
   (
      This       : access IAudioDeviceController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_VolumePercent
   (
      This       : access IAudioDeviceController_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_VolumePercent
   (
      This       : access IAudioDeviceController_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVideoDeviceController : aliased constant Windows.IID := (2572506485, 11822, 16568, (182, 199, 248, 45, 16, 1, 50, 16 ));
   
   type IVideoDeviceController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Brightness
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Contrast
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Hue
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_WhiteBalance
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_BacklightCompensation
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Pan
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Tilt
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Zoom
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Roll
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Exposure
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Focus
   (
      This       : access IVideoDeviceController_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControl
   )
   return Windows.HRESULT is abstract;
   
   function TrySetPowerlineFrequency
   (
      This       : access IVideoDeviceController_Interface
      ; value : Windows.Media.Capture.PowerlineFrequency
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetPowerlineFrequency
   (
      This       : access IVideoDeviceController_Interface
      ; value : access Windows.Media.Capture.PowerlineFrequency
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAdvancedVideoCaptureDeviceController2 : aliased constant Windows.IID := (2344177551, 61722, 17371, (180, 2, 17, 147, 11, 128, 174, 86 ));
   
   type IAdvancedVideoCaptureDeviceController2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LowLagPhotoSequence
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.ILowLagPhotoSequenceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_LowLagPhoto
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.ILowLagPhotoControl
   )
   return Windows.HRESULT is abstract;
   
   function get_SceneModeControl
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.ISceneModeControl
   )
   return Windows.HRESULT is abstract;
   
   function get_TorchControl
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.ITorchControl
   )
   return Windows.HRESULT is abstract;
   
   function get_FlashControl
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.IFlashControl
   )
   return Windows.HRESULT is abstract;
   
   function get_WhiteBalanceControl
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.IWhiteBalanceControl
   )
   return Windows.HRESULT is abstract;
   
   function get_ExposureControl
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.IExposureControl
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusControl
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.IFocusControl
   )
   return Windows.HRESULT is abstract;
   
   function get_ExposureCompensationControl
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.IExposureCompensationControl
   )
   return Windows.HRESULT is abstract;
   
   function get_IsoSpeedControl
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.IIsoSpeedControl
   )
   return Windows.HRESULT is abstract;
   
   function get_RegionsOfInterestControl
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.IRegionsOfInterestControl
   )
   return Windows.HRESULT is abstract;
   
   function get_PrimaryUse
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; RetVal : access Windows.Media.Devices.CaptureUse
   )
   return Windows.HRESULT is abstract;
   
   function put_PrimaryUse
   (
      This       : access IAdvancedVideoCaptureDeviceController2_Interface
      ; value : Windows.Media.Devices.CaptureUse
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAdvancedVideoCaptureDeviceController3 : aliased constant Windows.IID := (2844495668, 60941, 18188, (185, 240, 66, 41, 196, 187, 208, 137 ));
   
   type IAdvancedVideoCaptureDeviceController3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VariablePhotoSequenceController
   (
      This       : access IAdvancedVideoCaptureDeviceController3_Interface
      ; RetVal : access Windows.Media.Devices.Core.IVariablePhotoSequenceController
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotoConfirmationControl
   (
      This       : access IAdvancedVideoCaptureDeviceController3_Interface
      ; RetVal : access Windows.Media.Devices.IPhotoConfirmationControl
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomControl
   (
      This       : access IAdvancedVideoCaptureDeviceController3_Interface
      ; RetVal : access Windows.Media.Devices.IZoomControl
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAdvancedVideoCaptureDeviceController4 : aliased constant Windows.IID := (3936337839, 54129, 16835, (154, 23, 130, 74, 135, 235, 223, 210 ));
   
   type IAdvancedVideoCaptureDeviceController4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExposurePriorityVideoControl
   (
      This       : access IAdvancedVideoCaptureDeviceController4_Interface
      ; RetVal : access Windows.Media.Devices.IExposurePriorityVideoControl
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredOptimization
   (
      This       : access IAdvancedVideoCaptureDeviceController4_Interface
      ; RetVal : access Windows.Media.Devices.MediaCaptureOptimization
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredOptimization
   (
      This       : access IAdvancedVideoCaptureDeviceController4_Interface
      ; value : Windows.Media.Devices.MediaCaptureOptimization
   )
   return Windows.HRESULT is abstract;
   
   function get_HdrVideoControl
   (
      This       : access IAdvancedVideoCaptureDeviceController4_Interface
      ; RetVal : access Windows.Media.Devices.IHdrVideoControl
   )
   return Windows.HRESULT is abstract;
   
   function get_OpticalImageStabilizationControl
   (
      This       : access IAdvancedVideoCaptureDeviceController4_Interface
      ; RetVal : access Windows.Media.Devices.IOpticalImageStabilizationControl
   )
   return Windows.HRESULT is abstract;
   
   function get_AdvancedPhotoControl
   (
      This       : access IAdvancedVideoCaptureDeviceController4_Interface
      ; RetVal : access Windows.Media.Devices.IAdvancedPhotoControl
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVideoDeviceControllerGetDevicePropertyResult : aliased constant Windows.IID := (3319301013, 28373, 18320, (139, 93, 14, 241, 57, 53, 208, 248 ));
   
   type IVideoDeviceControllerGetDevicePropertyResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IVideoDeviceControllerGetDevicePropertyResult_Interface
      ; RetVal : access Windows.Media.Devices.VideoDeviceControllerGetDevicePropertyStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IVideoDeviceControllerGetDevicePropertyResult_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAdvancedVideoCaptureDeviceController5 : aliased constant Windows.IID := (860957463, 47563, 18979, (184, 117, 249, 234, 171, 83, 84, 146 ));
   
   type IAdvancedVideoCaptureDeviceController5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IAdvancedVideoCaptureDeviceController5_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDevicePropertyById
   (
      This       : access IAdvancedVideoCaptureDeviceController5_Interface
      ; propertyId : Windows.String
      ; maxPropertyValueSize : Windows.Foundation.IReference_UInt32
      ; RetVal : access Windows.Media.Devices.IVideoDeviceControllerGetDevicePropertyResult
   )
   return Windows.HRESULT is abstract;
   
   function SetDevicePropertyById
   (
      This       : access IAdvancedVideoCaptureDeviceController5_Interface
      ; propertyId : Windows.String
      ; propertyValue : Windows.Object
      ; RetVal : access Windows.Media.Devices.VideoDeviceControllerSetDevicePropertyStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetDevicePropertyByExtendedId
   (
      This       : access IAdvancedVideoCaptureDeviceController5_Interface
      ; extendedPropertyId : Windows.UInt8_Ptr
      ; maxPropertyValueSize : Windows.Foundation.IReference_UInt32
      ; RetVal : access Windows.Media.Devices.IVideoDeviceControllerGetDevicePropertyResult
   )
   return Windows.HRESULT is abstract;
   
   function SetDevicePropertyByExtendedId
   (
      This       : access IAdvancedVideoCaptureDeviceController5_Interface
      ; extendedPropertyId : Windows.UInt8_Ptr
      ; propertyValue : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Devices.VideoDeviceControllerSetDevicePropertyStatus
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaDeviceControl : aliased constant Windows.IID := (4020821929, 28533, 18531, (186, 11, 88, 63, 48, 54, 180, 222 ));
   
   type IMediaDeviceControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Capabilities
   (
      This       : access IMediaDeviceControl_Interface
      ; RetVal : access Windows.Media.Devices.IMediaDeviceControlCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function TryGetValue
   (
      This       : access IMediaDeviceControl_Interface
      ; value : access Windows.Double
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TrySetValue
   (
      This       : access IMediaDeviceControl_Interface
      ; value : Windows.Double
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetAuto
   (
      This       : access IMediaDeviceControl_Interface
      ; value : access Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TrySetAuto
   (
      This       : access IMediaDeviceControl_Interface
      ; value : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaDeviceControlCapabilities : aliased constant Windows.IID := (587225110, 60293, 17378, (185, 43, 130, 64, 213, 238, 112, 236 ));
   
   type IMediaDeviceControlCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IMediaDeviceControlCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Min
   (
      This       : access IMediaDeviceControlCapabilities_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IMediaDeviceControlCapabilities_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IMediaDeviceControlCapabilities_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Default
   (
      This       : access IMediaDeviceControlCapabilities_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoModeSupported
   (
      This       : access IMediaDeviceControlCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAdvancedVideoCaptureDeviceController : aliased constant Windows.IID := (3731879123, 11158, 17795, (128, 171, 181, 176, 29, 198, 168, 215 ));
   
   type IAdvancedVideoCaptureDeviceController_Interface is interface and Windows.IInspectable_Interface;
   
   function SetDeviceProperty
   (
      This       : access IAdvancedVideoCaptureDeviceController_Interface
      ; propertyId : Windows.String
      ; propertyValue : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceProperty
   (
      This       : access IAdvancedVideoCaptureDeviceController_Interface
      ; propertyId : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ILowLagPhotoSequenceControl : aliased constant Windows.IID := (1037013149, 27926, 16540, (186, 254, 185, 165, 148, 198, 253, 230 ));
   
   type ILowLagPhotoSequenceControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPastPhotos
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPhotosPerSecond
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_PastPhotoLimit
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_PastPhotoLimit
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotosPerSecondLimit
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_PhotosPerSecondLimit
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function GetHighestConcurrentFrameRate
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; captureProperties : Windows.Media.MediaProperties.IMediaEncodingProperties
      ; RetVal : access Windows.Media.MediaProperties.IMediaRatio
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentFrameRate
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaRatio
   )
   return Windows.HRESULT is abstract;
   
   function get_ThumbnailEnabled
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ThumbnailEnabled
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ThumbnailFormat
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; RetVal : access Windows.Media.MediaProperties.MediaThumbnailFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_ThumbnailFormat
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; value : Windows.Media.MediaProperties.MediaThumbnailFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredThumbnailSize
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredThumbnailSize
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareAcceleratedThumbnailSupported
   (
      This       : access ILowLagPhotoSequenceControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ILowLagPhotoControl : aliased constant Windows.IID := (1834765776, 64223, 16733, (174, 230, 59, 170, 82, 147, 0, 201 ));
   
   type ILowLagPhotoControl_Interface is interface and Windows.IInspectable_Interface;
   
   function GetHighestConcurrentFrameRate
   (
      This       : access ILowLagPhotoControl_Interface
      ; captureProperties : Windows.Media.MediaProperties.IMediaEncodingProperties
      ; RetVal : access Windows.Media.MediaProperties.IMediaRatio
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentFrameRate
   (
      This       : access ILowLagPhotoControl_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaRatio
   )
   return Windows.HRESULT is abstract;
   
   function get_ThumbnailEnabled
   (
      This       : access ILowLagPhotoControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ThumbnailEnabled
   (
      This       : access ILowLagPhotoControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ThumbnailFormat
   (
      This       : access ILowLagPhotoControl_Interface
      ; RetVal : access Windows.Media.MediaProperties.MediaThumbnailFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_ThumbnailFormat
   (
      This       : access ILowLagPhotoControl_Interface
      ; value : Windows.Media.MediaProperties.MediaThumbnailFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredThumbnailSize
   (
      This       : access ILowLagPhotoControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredThumbnailSize
   (
      This       : access ILowLagPhotoControl_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareAcceleratedThumbnailSupported
   (
      This       : access ILowLagPhotoControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IPhotoConfirmationControl : aliased constant Windows.IID := (3371430755, 65374, 17794, (169, 168, 5, 80, 248, 90, 74, 118 ));
   
   type IPhotoConfirmationControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IPhotoConfirmationControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Enabled
   (
      This       : access IPhotoConfirmationControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Enabled
   (
      This       : access IPhotoConfirmationControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelFormat
   (
      This       : access IPhotoConfirmationControl_Interface
      ; RetVal : access Windows.Media.MediaProperties.MediaPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_PixelFormat
   (
      This       : access IPhotoConfirmationControl_Interface
      ; format : Windows.Media.MediaProperties.MediaPixelFormat
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDialRequestedEventArgs : aliased constant Windows.IID := (58430110, 38204, 17030, (136, 102, 79, 15, 55, 108, 133, 90 ));
   
   type IDialRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function Handled
   (
      This       : access IDialRequestedEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IDialRequestedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IRedialRequestedEventArgs : aliased constant Windows.IID := (2125812233, 30379, 19505, (180, 14, 75, 88, 55, 157, 88, 12 ));
   
   type IRedialRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function Handled
   (
      This       : access IRedialRequestedEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IKeypadPressedEventArgs : aliased constant Windows.IID := (3550755072, 46330, 18893, (148, 66, 137, 175, 101, 104, 246, 1 ));
   
   type IKeypadPressedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TelephonyKey
   (
      This       : access IKeypadPressedEventArgs_Interface
      ; RetVal : access Windows.Media.Devices.TelephonyKey
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICallControl : aliased constant Windows.IID := (2770391254, 44685, 17883, (128, 17, 202, 73, 211, 179, 229, 120 ));
   
   type ICallControl_Interface is interface and Windows.IInspectable_Interface;
   
   function IndicateNewIncomingCall
   (
      This       : access ICallControl_Interface
      ; enableRinger : Windows.Boolean
      ; callerId : Windows.String
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function IndicateNewOutgoingCall
   (
      This       : access ICallControl_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function IndicateActiveCall
   (
      This       : access ICallControl_Interface
      ; callToken : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function EndCall
   (
      This       : access ICallControl_Interface
      ; callToken : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_HasRinger
   (
      This       : access ICallControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_AnswerRequested
   (
      This       : access ICallControl_Interface
      ; handler : Windows.Media.Devices.CallControlEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AnswerRequested
   (
      This       : access ICallControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_HangUpRequested
   (
      This       : access ICallControl_Interface
      ; handler : Windows.Media.Devices.CallControlEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HangUpRequested
   (
      This       : access ICallControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DialRequested
   (
      This       : access ICallControl_Interface
      ; handler : Windows.Media.Devices.DialRequestedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DialRequested
   (
      This       : access ICallControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RedialRequested
   (
      This       : access ICallControl_Interface
      ; handler : Windows.Media.Devices.RedialRequestedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RedialRequested
   (
      This       : access ICallControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_KeypadPressed
   (
      This       : access ICallControl_Interface
      ; handler : Windows.Media.Devices.KeypadPressedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_KeypadPressed
   (
      This       : access ICallControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AudioTransferRequested
   (
      This       : access ICallControl_Interface
      ; handler : Windows.Media.Devices.CallControlEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AudioTransferRequested
   (
      This       : access ICallControl_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICallControlStatics : aliased constant Windows.IID := (60054229, 34219, 16609, (175, 25, 86, 201, 67, 3, 176, 25 ));
   
   type ICallControlStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access ICallControlStatics_Interface
      ; RetVal : access Windows.Media.Devices.ICallControl
   )
   return Windows.HRESULT is abstract;
   
   function FromId
   (
      This       : access ICallControlStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Media.Devices.ICallControl
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IReference_CaptureSceneMode : aliased constant Windows.IID := (3792017066, 3006, 20995, (190, 107, 107, 113, 255, 91, 8, 67 ));
   
   type IReference_CaptureSceneMode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_CaptureSceneMode_Interface
      ; RetVal : access Windows.Media.Devices.CaptureSceneMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IReference_MediaCaptureFocusState : aliased constant Windows.IID := (1484915077, 23968, 24490, (134, 218, 155, 217, 240, 57, 116, 250 ));
   
   type IReference_MediaCaptureFocusState_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_MediaCaptureFocusState_Interface
      ; RetVal : access Windows.Media.Devices.MediaCaptureFocusState
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IModuleCommandResult : aliased constant Windows.IID := (773799282, 42381, 23306, (180, 45, 54, 96, 192, 76, 254, 235 ));
   
   type IAsyncOperation_IModuleCommandResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IModuleCommandResult_Interface
      ; handler : Windows.Media.Devices.AsyncOperationCompletedHandler_IModuleCommandResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IModuleCommandResult_Interface
      ; RetVal : access Windows.Media.Devices.AsyncOperationCompletedHandler_IModuleCommandResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IModuleCommandResult_Interface
      ; RetVal : access Windows.Media.Devices.IModuleCommandResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IAudioDeviceModule : aliased constant Windows.IID := (3033251767, 38993, 22217, (131, 157, 161, 10, 139, 27, 178, 52 ));
   
   type IIterator_IAudioDeviceModule_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAudioDeviceModule_Interface
      ; RetVal : access Windows.Media.Devices.IAudioDeviceModule
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAudioDeviceModule_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAudioDeviceModule_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAudioDeviceModule_Interface
      ; items : Windows.Media.Devices.IAudioDeviceModule_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IAudioDeviceModule : aliased constant Windows.IID := (2129351107, 55054, 21642, (133, 194, 60, 247, 27, 74, 18, 76 ));
   
   type IIterable_IAudioDeviceModule_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAudioDeviceModule_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_IAudioDeviceModule
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAudioDeviceModule : aliased constant Windows.IID := (3119863319, 18668, 23255, (149, 202, 51, 57, 82, 132, 242, 139 ));
   
   type IVectorView_IAudioDeviceModule_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAudioDeviceModule_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.IAudioDeviceModule
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAudioDeviceModule_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAudioDeviceModule_Interface
      ; value : Windows.Media.Devices.IAudioDeviceModule
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAudioDeviceModule_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.IAudioDeviceModule_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_CaptureSceneMode : aliased constant Windows.IID := (2868538746, 12159, 24023, (170, 10, 38, 87, 49, 162, 179, 179 ));
   
   type IIterator_CaptureSceneMode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_CaptureSceneMode_Interface
      ; RetVal : access Windows.Media.Devices.CaptureSceneMode
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_CaptureSceneMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_CaptureSceneMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_CaptureSceneMode_Interface
      ; items : Windows.Media.Devices.CaptureSceneMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_CaptureSceneMode : aliased constant Windows.IID := (382888856, 11452, 21232, (171, 100, 23, 35, 113, 68, 24, 233 ));
   
   type IIterable_CaptureSceneMode_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_CaptureSceneMode_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_CaptureSceneMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_CaptureSceneMode : aliased constant Windows.IID := (2609995113, 59160, 23368, (187, 148, 84, 189, 243, 115, 126, 165 ));
   
   type IVectorView_CaptureSceneMode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_CaptureSceneMode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.CaptureSceneMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_CaptureSceneMode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_CaptureSceneMode_Interface
      ; value : Windows.Media.Devices.CaptureSceneMode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_CaptureSceneMode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.CaptureSceneMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IsoSpeedPreset : aliased constant Windows.IID := (456372086, 38923, 21320, (145, 106, 121, 63, 97, 181, 85, 160 ));
   
   type IIterator_IsoSpeedPreset_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IsoSpeedPreset_Interface
      ; RetVal : access Windows.Media.Devices.IsoSpeedPreset
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IsoSpeedPreset_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IsoSpeedPreset_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IsoSpeedPreset_Interface
      ; items : Windows.Media.Devices.IsoSpeedPreset_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IsoSpeedPreset : aliased constant Windows.IID := (2491652798, 38674, 21594, (169, 77, 165, 103, 163, 232, 223, 183 ));
   
   type IIterable_IsoSpeedPreset_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IsoSpeedPreset_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_IsoSpeedPreset
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IsoSpeedPreset : aliased constant Windows.IID := (4016873443, 1785, 24319, (152, 168, 145, 125, 150, 68, 201, 70 ));
   
   type IVectorView_IsoSpeedPreset_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IsoSpeedPreset_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.IsoSpeedPreset
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IsoSpeedPreset_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IsoSpeedPreset_Interface
      ; value : Windows.Media.Devices.IsoSpeedPreset
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IsoSpeedPreset_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.IsoSpeedPreset_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_ZoomTransitionMode : aliased constant Windows.IID := (2162902666, 64964, 23689, (153, 184, 141, 71, 98, 100, 226, 17 ));
   
   type IIterator_ZoomTransitionMode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ZoomTransitionMode_Interface
      ; RetVal : access Windows.Media.Devices.ZoomTransitionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ZoomTransitionMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ZoomTransitionMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ZoomTransitionMode_Interface
      ; items : Windows.Media.Devices.ZoomTransitionMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_ZoomTransitionMode : aliased constant Windows.IID := (3680856341, 36780, 24498, (152, 224, 14, 151, 66, 22, 86, 197 ));
   
   type IIterable_ZoomTransitionMode_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ZoomTransitionMode_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_ZoomTransitionMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_ZoomTransitionMode : aliased constant Windows.IID := (1297441109, 53281, 23110, (154, 28, 244, 1, 214, 27, 133, 41 ));
   
   type IVectorView_ZoomTransitionMode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ZoomTransitionMode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.ZoomTransitionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ZoomTransitionMode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ZoomTransitionMode_Interface
      ; value : Windows.Media.Devices.ZoomTransitionMode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ZoomTransitionMode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.ZoomTransitionMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IReference_ManualFocusDistance : aliased constant Windows.IID := (2953186186, 4357, 23252, (150, 61, 246, 207, 25, 5, 211, 73 ));
   
   type IReference_ManualFocusDistance_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_ManualFocusDistance_Interface
      ; RetVal : access Windows.Media.Devices.ManualFocusDistance
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_FocusPreset : aliased constant Windows.IID := (3555444969, 61637, 20928, (187, 134, 189, 234, 10, 105, 70, 251 ));
   
   type IIterator_FocusPreset_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_FocusPreset_Interface
      ; RetVal : access Windows.Media.Devices.FocusPreset
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_FocusPreset_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_FocusPreset_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_FocusPreset_Interface
      ; items : Windows.Media.Devices.FocusPreset_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_FocusPreset : aliased constant Windows.IID := (649752859, 14898, 21014, (188, 52, 97, 236, 175, 190, 189, 193 ));
   
   type IIterable_FocusPreset_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_FocusPreset_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_FocusPreset
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_FocusPreset : aliased constant Windows.IID := (3634664931, 55252, 24223, (169, 194, 107, 37, 6, 85, 162, 224 ));
   
   type IVectorView_FocusPreset_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_FocusPreset_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.FocusPreset
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_FocusPreset_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_FocusPreset_Interface
      ; value : Windows.Media.Devices.FocusPreset
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_FocusPreset_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.FocusPreset_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_FocusMode : aliased constant Windows.IID := (4188290260, 45824, 21535, (175, 121, 61, 227, 64, 14, 22, 175 ));
   
   type IIterator_FocusMode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_FocusMode_Interface
      ; RetVal : access Windows.Media.Devices.FocusMode
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_FocusMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_FocusMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_FocusMode_Interface
      ; items : Windows.Media.Devices.FocusMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_FocusMode : aliased constant Windows.IID := (1444659743, 19170, 22538, (162, 22, 10, 212, 143, 55, 58, 76 ));
   
   type IIterable_FocusMode_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_FocusMode_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_FocusMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_FocusMode : aliased constant Windows.IID := (3363280732, 62403, 23357, (147, 228, 87, 135, 190, 155, 127, 88 ));
   
   type IVectorView_FocusMode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_FocusMode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.FocusMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_FocusMode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_FocusMode_Interface
      ; value : Windows.Media.Devices.FocusMode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_FocusMode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.FocusMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_ManualFocusDistance : aliased constant Windows.IID := (2955494625, 63049, 20766, (128, 221, 46, 43, 32, 55, 157, 235 ));
   
   type IIterator_ManualFocusDistance_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ManualFocusDistance_Interface
      ; RetVal : access Windows.Media.Devices.ManualFocusDistance
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ManualFocusDistance_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ManualFocusDistance_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ManualFocusDistance_Interface
      ; items : Windows.Media.Devices.ManualFocusDistance_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_ManualFocusDistance : aliased constant Windows.IID := (3482107569, 10828, 21037, (150, 47, 132, 195, 26, 89, 141, 104 ));
   
   type IIterable_ManualFocusDistance_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ManualFocusDistance_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_ManualFocusDistance
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_ManualFocusDistance : aliased constant Windows.IID := (2247583291, 21607, 22326, (141, 52, 52, 57, 90, 166, 209, 35 ));
   
   type IVectorView_ManualFocusDistance_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ManualFocusDistance_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.ManualFocusDistance
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ManualFocusDistance_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ManualFocusDistance_Interface
      ; value : Windows.Media.Devices.ManualFocusDistance
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ManualFocusDistance_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.ManualFocusDistance_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_AutoFocusRange : aliased constant Windows.IID := (122198725, 15473, 22982, (183, 220, 127, 33, 52, 28, 47, 113 ));
   
   type IIterator_AutoFocusRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_AutoFocusRange_Interface
      ; RetVal : access Windows.Media.Devices.AutoFocusRange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_AutoFocusRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_AutoFocusRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_AutoFocusRange_Interface
      ; items : Windows.Media.Devices.AutoFocusRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_AutoFocusRange : aliased constant Windows.IID := (1964401862, 63702, 20643, (171, 128, 19, 124, 109, 144, 140, 85 ));
   
   type IIterable_AutoFocusRange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_AutoFocusRange_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_AutoFocusRange
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_AutoFocusRange : aliased constant Windows.IID := (1576421413, 51681, 21087, (154, 235, 60, 15, 95, 128, 95, 38 ));
   
   type IVectorView_AutoFocusRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_AutoFocusRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.AutoFocusRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_AutoFocusRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_AutoFocusRange_Interface
      ; value : Windows.Media.Devices.AutoFocusRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_AutoFocusRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.AutoFocusRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IRegionOfInterest : aliased constant Windows.IID := (2394426958, 38545, 22863, (139, 61, 245, 46, 204, 15, 120, 55 ));
   
   type IIterator_IRegionOfInterest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRegionOfInterest_Interface
      ; RetVal : access Windows.Media.Devices.IRegionOfInterest
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRegionOfInterest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRegionOfInterest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRegionOfInterest_Interface
      ; items : Windows.Media.Devices.IRegionOfInterest_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IRegionOfInterest : aliased constant Windows.IID := (3610330311, 40309, 24059, (128, 64, 98, 98, 2, 220, 244, 84 ));
   
   type IIterable_IRegionOfInterest_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRegionOfInterest_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_IRegionOfInterest
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_HdrVideoMode : aliased constant Windows.IID := (1035345171, 3888, 23853, (153, 203, 48, 199, 185, 0, 152, 120 ));
   
   type IIterator_HdrVideoMode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_HdrVideoMode_Interface
      ; RetVal : access Windows.Media.Devices.HdrVideoMode
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_HdrVideoMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_HdrVideoMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_HdrVideoMode_Interface
      ; items : Windows.Media.Devices.HdrVideoMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_HdrVideoMode : aliased constant Windows.IID := (496400807, 11526, 21140, (172, 103, 249, 205, 53, 97, 220, 184 ));
   
   type IIterable_HdrVideoMode_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HdrVideoMode_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_HdrVideoMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_HdrVideoMode : aliased constant Windows.IID := (2903133117, 30256, 21412, (170, 155, 53, 168, 199, 212, 149, 140 ));
   
   type IVectorView_HdrVideoMode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_HdrVideoMode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.HdrVideoMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_HdrVideoMode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_HdrVideoMode_Interface
      ; value : Windows.Media.Devices.HdrVideoMode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_HdrVideoMode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.HdrVideoMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_AdvancedPhotoMode : aliased constant Windows.IID := (3872439453, 57803, 24272, (142, 222, 125, 3, 123, 204, 46, 7 ));
   
   type IIterator_AdvancedPhotoMode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_AdvancedPhotoMode_Interface
      ; RetVal : access Windows.Media.Devices.AdvancedPhotoMode
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_AdvancedPhotoMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_AdvancedPhotoMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_AdvancedPhotoMode_Interface
      ; items : Windows.Media.Devices.AdvancedPhotoMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_AdvancedPhotoMode : aliased constant Windows.IID := (2097743748, 28841, 22284, (190, 130, 13, 8, 144, 49, 137, 117 ));
   
   type IIterable_AdvancedPhotoMode_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_AdvancedPhotoMode_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_AdvancedPhotoMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_AdvancedPhotoMode : aliased constant Windows.IID := (3495445430, 968, 21054, (182, 251, 31, 203, 3, 33, 138, 84 ));
   
   type IVectorView_AdvancedPhotoMode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_AdvancedPhotoMode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.AdvancedPhotoMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_AdvancedPhotoMode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_AdvancedPhotoMode_Interface
      ; value : Windows.Media.Devices.AdvancedPhotoMode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_AdvancedPhotoMode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.AdvancedPhotoMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_OpticalImageStabilizationMode : aliased constant Windows.IID := (1242979654, 53017, 23043, (187, 84, 99, 252, 43, 78, 211, 155 ));
   
   type IIterator_OpticalImageStabilizationMode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_OpticalImageStabilizationMode_Interface
      ; RetVal : access Windows.Media.Devices.OpticalImageStabilizationMode
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_OpticalImageStabilizationMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_OpticalImageStabilizationMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_OpticalImageStabilizationMode_Interface
      ; items : Windows.Media.Devices.OpticalImageStabilizationMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_OpticalImageStabilizationMode : aliased constant Windows.IID := (842889012, 38082, 21581, (165, 96, 86, 86, 15, 230, 136, 25 ));
   
   type IIterable_OpticalImageStabilizationMode_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_OpticalImageStabilizationMode_Interface
      ; RetVal : access Windows.Media.Devices.IIterator_OpticalImageStabilizationMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_OpticalImageStabilizationMode : aliased constant Windows.IID := (2351323352, 44202, 23168, (178, 89, 27, 160, 105, 124, 97, 56 ));
   
   type IVectorView_OpticalImageStabilizationMode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_OpticalImageStabilizationMode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.OpticalImageStabilizationMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_OpticalImageStabilizationMode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_OpticalImageStabilizationMode_Interface
      ; value : Windows.Media.Devices.OpticalImageStabilizationMode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_OpticalImageStabilizationMode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.OpticalImageStabilizationMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_CallControlEventHandler : aliased constant Windows.IID := (1500476831, 20703, 17492, (188, 99, 77, 61, 1, 182, 25, 88 ));
   
   type CallControlEventHandler_Interface(Callback : access procedure (sender : Windows.Media.Devices.ICallControl)) is new Windows.IMulticastDelegate_Interface(IID_CallControlEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access CallControlEventHandler_Interface
      ; sender : Windows.Media.Devices.ICallControl
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_DialRequestedEventHandler : aliased constant Windows.IID := (1522270171, 49695, 19396, (137, 27, 37, 126, 40, 193, 177, 164 ));
   
   type DialRequestedEventHandler_Interface(Callback : access procedure (sender : Windows.Media.Devices.ICallControl ; e : Windows.Media.Devices.IDialRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_DialRequestedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access DialRequestedEventHandler_Interface
      ; sender : Windows.Media.Devices.ICallControl
      ; e : Windows.Media.Devices.IDialRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_RedialRequestedEventHandler : aliased constant Windows.IID := (3136444369, 20157, 19332, (159, 71, 110, 196, 61, 117, 216, 177 ));
   
   type RedialRequestedEventHandler_Interface(Callback : access procedure (sender : Windows.Media.Devices.ICallControl ; e : Windows.Media.Devices.IRedialRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_RedialRequestedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access RedialRequestedEventHandler_Interface
      ; sender : Windows.Media.Devices.ICallControl
      ; e : Windows.Media.Devices.IRedialRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_KeypadPressedEventHandler : aliased constant Windows.IID := (3862406228, 50471, 16940, (137, 38, 201, 175, 131, 181, 89, 160 ));
   
   type KeypadPressedEventHandler_Interface(Callback : access procedure (sender : Windows.Media.Devices.ICallControl ; e : Windows.Media.Devices.IKeypadPressedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_KeypadPressedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access KeypadPressedEventHandler_Interface
      ; sender : Windows.Media.Devices.ICallControl
      ; e : Windows.Media.Devices.IKeypadPressedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged : aliased constant Windows.IID := (2547020583, 11384, 22460, (152, 230, 162, 76, 208, 36, 207, 91 ));
   
   type TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Media.Devices.IDefaultAudioDeviceChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged_Interface
      ; sender : Windows.Object
      ; args : Windows.Media.Devices.IDefaultAudioDeviceChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged : aliased constant Windows.IID := (4252183242, 56060, 23421, (191, 114, 181, 96, 183, 141, 38, 12 ));
   
   type TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Media.Devices.IDefaultAudioDeviceChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged_Interface
      ; sender : Windows.Object
      ; args : Windows.Media.Devices.IDefaultAudioDeviceChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IModuleCommandResult : aliased constant Windows.IID := (3413664772, 62184, 24075, (191, 18, 57, 227, 20, 131, 207, 174 ));
   
   type AsyncOperationCompletedHandler_IModuleCommandResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Devices.IAsyncOperation_IModuleCommandResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IModuleCommandResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IModuleCommandResult_Interface
      ; asyncInfo : Windows.Media.Devices.IAsyncOperation_IModuleCommandResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived : aliased constant Windows.IID := (3002511869, 28818, 22308, (178, 206, 145, 177, 23, 110, 128, 225 ));
   
   type TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived_Interface(Callback : access procedure (sender : Windows.Media.Devices.IAudioDeviceModulesManager ; args : Windows.Media.Devices.IAudioDeviceModuleNotificationEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived_Interface
      ; sender : Windows.Media.Devices.IAudioDeviceModulesManager
      ; args : Windows.Media.Devices.IAudioDeviceModuleNotificationEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DefaultAudioCaptureDeviceChangedEventArgs is Windows.Media.Devices.IDefaultAudioDeviceChangedEventArgs;
   subtype DefaultAudioRenderDeviceChangedEventArgs is Windows.Media.Devices.IDefaultAudioDeviceChangedEventArgs;
   subtype ModuleCommandResult is Windows.Media.Devices.IModuleCommandResult;
   subtype AudioDeviceModulesManager is Windows.Media.Devices.IAudioDeviceModulesManager;
   
   function Create
   (
      deviceId : Windows.String
   )
   return Windows.Media.Devices.IAudioDeviceModulesManager;
   
   subtype AudioDeviceModuleNotificationEventArgs is Windows.Media.Devices.IAudioDeviceModuleNotificationEventArgs;
   subtype AudioDeviceModule is Windows.Media.Devices.IAudioDeviceModule;
   subtype SceneModeControl is Windows.Media.Devices.ISceneModeControl;
   subtype TorchControl is Windows.Media.Devices.ITorchControl;
   subtype FlashControl is Windows.Media.Devices.IFlashControl;
   subtype ExposureCompensationControl is Windows.Media.Devices.IExposureCompensationControl;
   subtype IsoSpeedControl is Windows.Media.Devices.IIsoSpeedControl;
   subtype WhiteBalanceControl is Windows.Media.Devices.IWhiteBalanceControl;
   subtype ExposureControl is Windows.Media.Devices.IExposureControl;
   subtype ZoomSettings is Windows.Media.Devices.IZoomSettings;
   
   function CreateZoomSettings return Windows.Media.Devices.IZoomSettings;
   
   subtype ZoomControl is Windows.Media.Devices.IZoomControl;
   subtype FocusSettings is Windows.Media.Devices.IFocusSettings;
   
   function CreateFocusSettings return Windows.Media.Devices.IFocusSettings;
   
   subtype FocusControl is Windows.Media.Devices.IFocusControl;
   subtype RegionOfInterest is Windows.Media.Devices.IRegionOfInterest;
   
   function CreateRegionOfInterest return Windows.Media.Devices.IRegionOfInterest;
   
   subtype RegionsOfInterestControl is Windows.Media.Devices.IRegionsOfInterestControl;
   subtype ExposurePriorityVideoControl is Windows.Media.Devices.IExposurePriorityVideoControl;
   subtype HdrVideoControl is Windows.Media.Devices.IHdrVideoControl;
   subtype AdvancedPhotoCaptureSettings is Windows.Media.Devices.IAdvancedPhotoCaptureSettings;
   
   function CreateAdvancedPhotoCaptureSettings return Windows.Media.Devices.IAdvancedPhotoCaptureSettings;
   
   subtype AdvancedPhotoControl is Windows.Media.Devices.IAdvancedPhotoControl;
   subtype OpticalImageStabilizationControl is Windows.Media.Devices.IOpticalImageStabilizationControl;
   subtype MediaDeviceControl is Windows.Media.Devices.IMediaDeviceControl;
   subtype LowLagPhotoSequenceControl is Windows.Media.Devices.ILowLagPhotoSequenceControl;
   subtype LowLagPhotoControl is Windows.Media.Devices.ILowLagPhotoControl;
   subtype PhotoConfirmationControl is Windows.Media.Devices.IPhotoConfirmationControl;
   subtype VideoDeviceControllerGetDevicePropertyResult is Windows.Media.Devices.IVideoDeviceControllerGetDevicePropertyResult;
   subtype MediaDeviceControlCapabilities is Windows.Media.Devices.IMediaDeviceControlCapabilities;
   subtype VideoDeviceController is Windows.Media.Devices.IVideoDeviceController;
   subtype AudioDeviceController is Windows.Media.Devices.IAudioDeviceController;
   subtype DialRequestedEventArgs is Windows.Media.Devices.IDialRequestedEventArgs;
   subtype RedialRequestedEventArgs is Windows.Media.Devices.IRedialRequestedEventArgs;
   subtype KeypadPressedEventArgs is Windows.Media.Devices.IKeypadPressedEventArgs;
   subtype CallControl is Windows.Media.Devices.ICallControl;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetAudioCaptureSelector
   return Windows.String;
   
   function GetAudioRenderSelector
   return Windows.String;
   
   function GetVideoCaptureSelector
   return Windows.String;
   
   function GetDefaultAudioCaptureId
   (
      role : Windows.Media.Devices.AudioDeviceRole
   )
   return Windows.String;
   
   function GetDefaultAudioRenderId
   (
      role : Windows.Media.Devices.AudioDeviceRole
   )
   return Windows.String;
   
   function add_DefaultAudioCaptureDeviceChanged
   (
      handler : TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_DefaultAudioCaptureDeviceChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_DefaultAudioRenderDeviceChanged
   (
      handler : TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_DefaultAudioRenderDeviceChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function GetDefault
   return Windows.Media.Devices.ICallControl;
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Media.Devices.ICallControl;

end;
