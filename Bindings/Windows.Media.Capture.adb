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
with Windows.Storage;
with Windows.Media.MediaProperties;
with Windows.Storage.Streams;
with Windows.Media;
with Windows.Media.Devices;
with Windows.Media.Capture.Core;
with Windows.Media.Effects;
with Windows.Media.Capture.Frames;
with Windows.Graphics.Imaging;
with Windows.Media.Core;
with Windows.Security.Authentication.Web;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Capture is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access MediaCaptureFailedEventHandler_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; errorEventArgs : Windows.Media.Capture.IMediaCaptureFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IMediaCapture(sender), Windows.Media.Capture.IMediaCaptureFailedEventArgs(errorEventArgs));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access RecordLimitationExceededEventHandler_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IMediaCapture(sender));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCapture_add_CapturingChanged_Interface
      ; sender : Windows.Media.Capture.IAppCapture
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppCapture(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILowLagMediaRecording_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_ILowLagMediaRecording
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
      This       : access AsyncOperationCompletedHandler_ILowLagPhotoCapture_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_ILowLagPhotoCapture
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
      This       : access AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_ILowLagPhotoSequenceCapture
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
      This       : access TypedEventHandler_IMediaCapture3_add_FocusChanged_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; args : Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IMediaCapture(sender), Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; args : Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IMediaCapture(sender), Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IMediaCapture(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IMediaCapture(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAdvancedPhotoCapture_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_IAdvancedPhotoCapture
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
      This       : access AsyncOperationCompletedHandler_IMediaCapturePauseResult_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_IMediaCapturePauseResult
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
      This       : access AsyncOperationCompletedHandler_IMediaCaptureStopResult_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_IMediaCaptureStopResult
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
      This       : access TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; args : Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IMediaCapture(sender), Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICapturedPhoto_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_ICapturedPhoto
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
      This       : access AsyncOperationCompletedHandler_IAdvancedCapturedPhoto_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_IAdvancedCapturedPhoto
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
      This       : access TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured_Interface
      ; sender : Windows.Media.Capture.IAdvancedPhotoCapture
      ; args : Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAdvancedPhotoCapture(sender), Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured_Interface
      ; sender : Windows.Media.Capture.IAdvancedPhotoCapture
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAdvancedPhotoCapture(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured_Interface
      ; sender : Windows.Media.Capture.ILowLagPhotoSequenceCapture
      ; args : Windows.Media.Capture.IPhotoCapturedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.ILowLagPhotoSequenceCapture(sender), Windows.Media.Capture.IPhotoCapturedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo
      ; args : Windows.Media.Capture.IAppBroadcastSignInStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo(sender), Windows.Media.Capture.IAppBroadcastSignInStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo
      ; args : Windows.Media.Capture.IAppBroadcastStreamStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo(sender), Windows.Media.Capture.IAppBroadcastStreamStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundService
      ; args : Windows.Media.Capture.IAppBroadcastHeartbeatRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastBackgroundService(sender), Windows.Media.Capture.IAppBroadcastHeartbeatRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundService
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastBackgroundService(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundService
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastBackgroundService(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundService
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastBackgroundService(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastStreamReader
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastStreamReader(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastStreamReader
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastStreamReader(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Media.Capture.IAppBroadcastViewerCountChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastState(sender), Windows.Media.Capture.IAppBroadcastViewerCountChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Media.Capture.IAppBroadcastMicrophoneCaptureStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastState(sender), Windows.Media.Capture.IAppBroadcastMicrophoneCaptureStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Media.Capture.IAppBroadcastCameraCaptureStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastState(sender), Windows.Media.Capture.IAppBroadcastCameraCaptureStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Media.Capture.IAppBroadcastPlugInStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastState(sender), Windows.Media.Capture.IAppBroadcastPlugInStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_StreamStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Media.Capture.IAppBroadcastStreamStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastState(sender), Windows.Media.Capture.IAppBroadcastStreamStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastState(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastPreview
      ; args : Windows.Media.Capture.IAppBroadcastPreviewStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastPreview(sender), Windows.Media.Capture.IAppBroadcastPreviewStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastPreviewStreamReader
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppBroadcastPreviewStreamReader(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppCaptureState
      ; args : Windows.Media.Capture.IAppCaptureMicrophoneCaptureStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppCaptureState(sender), Windows.Media.Capture.IAppCaptureMicrophoneCaptureStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed_Interface
      ; sender : Windows.Media.Capture.IAppCaptureState
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppCaptureState(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged_Interface
      ; sender : Windows.Media.Capture.IAppCaptureRecordOperation
      ; args : Windows.Media.Capture.IAppCaptureRecordingStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppCaptureRecordOperation(sender), Windows.Media.Capture.IAppCaptureRecordingStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated_Interface
      ; sender : Windows.Media.Capture.IAppCaptureRecordOperation
      ; args : Windows.Media.Capture.IAppCaptureDurationGeneratedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppCaptureRecordOperation(sender), Windows.Media.Capture.IAppCaptureDurationGeneratedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated_Interface
      ; sender : Windows.Media.Capture.IAppCaptureRecordOperation
      ; args : Windows.Media.Capture.IAppCaptureFileGeneratedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppCaptureRecordOperation(sender), Windows.Media.Capture.IAppCaptureFileGeneratedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged_Interface
      ; sender : Windows.Media.Capture.IAppCaptureMetadataWriter
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IAppCaptureMetadataWriter(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated_Interface
      ; sender : Windows.Media.Capture.IGameBarServicesManager
      ; args : Windows.Media.Capture.IGameBarServicesManagerGameBarServicesCreatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IGameBarServicesManager(sender), Windows.Media.Capture.IGameBarServicesManagerGameBarServicesCreatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGameBarServices_add_CommandReceived_Interface
      ; sender : Windows.Media.Capture.IGameBarServices
      ; args : Windows.Media.Capture.IGameBarServicesCommandEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IGameBarServices(sender), Windows.Media.Capture.IGameBarServicesCommandEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged_Interface
      ; sender : Windows.Media.Capture.IScreenCapture
      ; args : Windows.Media.Capture.ISourceSuspensionChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.IScreenCapture(sender), Windows.Media.Capture.ISourceSuspensionChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateCameraCaptureUI return Windows.Media.Capture.ICameraCaptureUI is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.CameraCaptureUI");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Capture.ICameraCaptureUI) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Capture.IID_ICameraCaptureUI'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateMediaCapture return Windows.Media.Capture.IMediaCapture is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.MediaCapture");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Capture.IMediaCapture) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Capture.IID_IMediaCapture'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateMediaCaptureInitializationSettings return Windows.Media.Capture.IMediaCaptureInitializationSettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.MediaCaptureInitializationSettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Capture.IMediaCaptureInitializationSettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Capture.IID_IMediaCaptureInitializationSettings'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateAppCaptureMetadataWriter return Windows.Media.Capture.IAppCaptureMetadataWriter is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppCaptureMetadataWriter");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Capture.IAppCaptureMetadataWriter) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Capture.IID_IAppCaptureMetadataWriter'Access, RetVal'access);
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
   
   function GetForCurrentView
   return Windows.Media.Capture.IAppCapture is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppCapture");
      m_Factory     : IAppCaptureStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IAppCapture;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppCaptureStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetAllowedAsync
   (
      allowed : Windows.Boolean
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppCapture");
      m_Factory     : IAppCaptureStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppCaptureStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAllowedAsync(allowed, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsVideoProfileSupported
   (
      videoDeviceId : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.MediaCapture");
      m_Factory     : IMediaCaptureStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaCaptureStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsVideoProfileSupported(videoDeviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllVideoProfiles
   (
      videoDeviceId : Windows.String
   )
   return Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.MediaCapture");
      m_Factory     : IMediaCaptureStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaCaptureStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllVideoProfiles(videoDeviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindConcurrentProfiles
   (
      videoDeviceId : Windows.String
   )
   return Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.MediaCapture");
      m_Factory     : IMediaCaptureStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaCaptureStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindConcurrentProfiles(videoDeviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindKnownVideoProfiles
   (
      videoDeviceId : Windows.String
      ; name : Windows.Media.Capture.KnownVideoProfile
   )
   return Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.MediaCapture");
      m_Factory     : IMediaCaptureStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaCaptureStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindKnownVideoProfiles(videoDeviceId, name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetGlobalSettings
   return Windows.Media.Capture.IAppBroadcastGlobalSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppBroadcastManager");
      m_Factory     : IAppBroadcastManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IAppBroadcastGlobalSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetGlobalSettings(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ApplyGlobalSettings
   (
      value : Windows.Media.Capture.IAppBroadcastGlobalSettings
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppBroadcastManager");
      m_Factory     : IAppBroadcastManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ApplyGlobalSettings(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetProviderSettings
   return Windows.Media.Capture.IAppBroadcastProviderSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppBroadcastManager");
      m_Factory     : IAppBroadcastManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IAppBroadcastProviderSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetProviderSettings(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ApplyProviderSettings
   (
      value : Windows.Media.Capture.IAppBroadcastProviderSettings
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppBroadcastManager");
      m_Factory     : IAppBroadcastManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ApplyProviderSettings(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetDefault
   return Windows.Media.Capture.IAppBroadcastPlugInManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppBroadcastPlugInManager");
      m_Factory     : IAppBroadcastPlugInManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IAppBroadcastPlugInManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastPlugInManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Media.Capture.IAppBroadcastPlugInManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppBroadcastPlugInManager");
      m_Factory     : IAppBroadcastPlugInManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IAppBroadcastPlugInManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastPlugInManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentSettings
   return Windows.Media.Capture.IAppCaptureSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppCaptureManager");
      m_Factory     : IAppCaptureManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IAppCaptureSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppCaptureManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentSettings(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ApplySettings
   (
      appCaptureSettings : Windows.Media.Capture.IAppCaptureSettings
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.AppCaptureManager");
      m_Factory     : IAppCaptureManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppCaptureManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ApplySettings(appCaptureSettings);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure Show
   (
      mediaCapture : Windows.Media.Capture.IMediaCapture
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.CameraOptionsUI");
      m_Factory     : ICameraOptionsUIStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICameraOptionsUIStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Show(mediaCapture);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetDefault
   return Windows.Media.Capture.IGameBarServicesManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.GameBarServicesManager");
      m_Factory     : IGameBarServicesManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IGameBarServicesManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameBarServicesManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.Media.Capture.IScreenCapture is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.ScreenCapture");
      m_Factory     : IScreenCaptureStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.IScreenCapture;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScreenCaptureStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
