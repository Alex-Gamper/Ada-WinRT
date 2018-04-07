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
limited with Windows.Graphics.Imaging;
limited with Windows.UI;
limited with Windows.Media.MediaProperties;
limited with Windows.Media.Protection;
limited with Windows.Storage.FileProperties;
with Windows; use Windows;
limited with Windows.ApplicationModel.AppService;
limited with Windows.Media.Devices.Core;
limited with Windows.Media.Capture;
limited with Windows.Media.FaceAnalysis;
limited with Windows.Media.Devices;
limited with Windows.Media.Streaming.Adaptive;
limited with Windows.Storage;
limited with Windows.Media.Capture.Frames;
limited with Windows.Media.Playback;
limited with Windows.Media.Effects;
--------------------------------------------------------------------------------
package Windows.Media.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type TimedTextScrollMode is (
      Popon,
      Rollup
   );
   for TimedTextScrollMode use (
      Popon => 0,
      Rollup => 1
   );
   for TimedTextScrollMode'Size use 32;
   
   type TimedTextScrollMode_Ptr is access TimedTextScrollMode;
   
   type TimedTextUnit is (
      Pixels,
      Percentage
   );
   for TimedTextUnit use (
      Pixels => 0,
      Percentage => 1
   );
   for TimedTextUnit'Size use 32;
   
   type TimedTextUnit_Ptr is access TimedTextUnit;
   
   type TimedTextWritingMode is (
      LeftRightTopBottom,
      RightLeftTopBottom,
      TopBottomRightLeft,
      TopBottomLeftRight,
      LeftRight,
      RightLeft,
      TopBottom
   );
   for TimedTextWritingMode use (
      LeftRightTopBottom => 0,
      RightLeftTopBottom => 1,
      TopBottomRightLeft => 2,
      TopBottomLeftRight => 3,
      LeftRight => 4,
      RightLeft => 5,
      TopBottom => 6
   );
   for TimedTextWritingMode'Size use 32;
   
   type TimedTextWritingMode_Ptr is access TimedTextWritingMode;
   
   type TimedTextDisplayAlignment is (
      Before,
      After,
      Center
   );
   for TimedTextDisplayAlignment use (
      Before => 0,
      After => 1,
      Center => 2
   );
   for TimedTextDisplayAlignment'Size use 32;
   
   type TimedTextDisplayAlignment_Ptr is access TimedTextDisplayAlignment;
   
   type TimedTextLineAlignment is (
      Start,
      End_x,
      Center
   );
   for TimedTextLineAlignment use (
      Start => 0,
      End_x => 1,
      Center => 2
   );
   for TimedTextLineAlignment'Size use 32;
   
   type TimedTextLineAlignment_Ptr is access TimedTextLineAlignment;
   
   type TimedTextWrapping is (
      NoWrap,
      Wrap
   );
   for TimedTextWrapping use (
      NoWrap => 0,
      Wrap => 1
   );
   for TimedTextWrapping'Size use 32;
   
   type TimedTextWrapping_Ptr is access TimedTextWrapping;
   
   type TimedTextWeight is (
      Normal,
      Bold
   );
   for TimedTextWeight use (
      Normal => 400,
      Bold => 700
   );
   for TimedTextWeight'Size use 32;
   
   type TimedTextWeight_Ptr is access TimedTextWeight;
   
   type TimedTextFlowDirection is (
      LeftToRight,
      RightToLeft
   );
   for TimedTextFlowDirection use (
      LeftToRight => 0,
      RightToLeft => 1
   );
   for TimedTextFlowDirection'Size use 32;
   
   type TimedTextFlowDirection_Ptr is access TimedTextFlowDirection;
   
   type TimedTextFontStyle is (
      Normal,
      Oblique,
      Italic
   );
   for TimedTextFontStyle use (
      Normal => 0,
      Oblique => 1,
      Italic => 2
   );
   for TimedTextFontStyle'Size use 32;
   
   type TimedTextFontStyle_Ptr is access TimedTextFontStyle;
   
   type CodecKind is (
      Audio,
      Video
   );
   for CodecKind use (
      Audio => 0,
      Video => 1
   );
   for CodecKind'Size use 32;
   
   type CodecKind_Ptr is access CodecKind;
   
   type CodecCategory is (
      Encoder,
      Decoder
   );
   for CodecCategory use (
      Encoder => 0,
      Decoder => 1
   );
   for CodecCategory'Size use 32;
   
   type CodecCategory_Ptr is access CodecCategory;
   
   type MediaStreamSourceClosedReason is (
      Done,
      UnknownError,
      AppReportedError,
      UnsupportedProtectionSystem,
      ProtectionSystemFailure,
      UnsupportedEncodingFormat,
      MissingSampleRequestedEventHandler
   );
   for MediaStreamSourceClosedReason use (
      Done => 0,
      UnknownError => 1,
      AppReportedError => 2,
      UnsupportedProtectionSystem => 3,
      ProtectionSystemFailure => 4,
      UnsupportedEncodingFormat => 5,
      MissingSampleRequestedEventHandler => 6
   );
   for MediaStreamSourceClosedReason'Size use 32;
   
   type MediaStreamSourceClosedReason_Ptr is access MediaStreamSourceClosedReason;
   
   type MediaStreamSourceErrorStatus is (
      Other,
      OutOfMemory,
      FailedToOpenFile,
      FailedToConnectToServer,
      ConnectionToServerLost,
      UnspecifiedNetworkError,
      DecodeError,
      UnsupportedMediaFormat
   );
   for MediaStreamSourceErrorStatus use (
      Other => 0,
      OutOfMemory => 1,
      FailedToOpenFile => 2,
      FailedToConnectToServer => 3,
      ConnectionToServerLost => 4,
      UnspecifiedNetworkError => 5,
      DecodeError => 6,
      UnsupportedMediaFormat => 7
   );
   for MediaStreamSourceErrorStatus'Size use 32;
   
   type MediaStreamSourceErrorStatus_Ptr is access MediaStreamSourceErrorStatus;
   
   type MseReadyState is (
      Closed,
      Open,
      Ended
   );
   for MseReadyState use (
      Closed => 0,
      Open => 1,
      Ended => 2
   );
   for MseReadyState'Size use 32;
   
   type MseReadyState_Ptr is access MseReadyState;
   
   type MseEndOfStreamStatus is (
      Success,
      NetworkError,
      DecodeError,
      UnknownError
   );
   for MseEndOfStreamStatus use (
      Success => 0,
      NetworkError => 1,
      DecodeError => 2,
      UnknownError => 3
   );
   for MseEndOfStreamStatus'Size use 32;
   
   type MseEndOfStreamStatus_Ptr is access MseEndOfStreamStatus;
   
   type MseAppendMode is (
      Segments,
      Sequence
   );
   for MseAppendMode use (
      Segments => 0,
      Sequence => 1
   );
   for MseAppendMode'Size use 32;
   
   type MseAppendMode_Ptr is access MseAppendMode;
   
   type SceneAnalysisRecommendation is (
      Standard_x,
      Hdr,
      LowLight
   );
   for SceneAnalysisRecommendation use (
      Standard_x => 0,
      Hdr => 1,
      LowLight => 2
   );
   for SceneAnalysisRecommendation'Size use 32;
   
   type SceneAnalysisRecommendation_Ptr is access SceneAnalysisRecommendation;
   
   type FaceDetectionMode is (
      HighPerformance,
      Balanced,
      HighQuality
   );
   for FaceDetectionMode use (
      HighPerformance => 0,
      Balanced => 1,
      HighQuality => 2
   );
   for FaceDetectionMode'Size use 32;
   
   type FaceDetectionMode_Ptr is access FaceDetectionMode;
   
   type VideoStabilizationEffectEnabledChangedReason is (
      Programmatic,
      PixelRateTooHigh,
      RunningSlowly
   );
   for VideoStabilizationEffectEnabledChangedReason use (
      Programmatic => 0,
      PixelRateTooHigh => 1,
      RunningSlowly => 2
   );
   for VideoStabilizationEffectEnabledChangedReason'Size use 32;
   
   type VideoStabilizationEffectEnabledChangedReason_Ptr is access VideoStabilizationEffectEnabledChangedReason;
   
   type MediaTrackKind is (
      Audio,
      Video,
      TimedMetadata
   );
   for MediaTrackKind use (
      Audio => 0,
      Video => 1,
      TimedMetadata => 2
   );
   for MediaTrackKind'Size use 32;
   
   type MediaTrackKind_Ptr is access MediaTrackKind;
   
   type TimedMetadataKind is (
      Caption,
      Chapter,
      Custom,
      Data,
      Description,
      Subtitle,
      ImageSubtitle,
      Speech
   );
   for TimedMetadataKind use (
      Caption => 0,
      Chapter => 1,
      Custom => 2,
      Data => 3,
      Description => 4,
      Subtitle => 5,
      ImageSubtitle => 6,
      Speech => 7
   );
   for TimedMetadataKind'Size use 32;
   
   type TimedMetadataKind_Ptr is access TimedMetadataKind;
   
   type TimedMetadataTrackErrorCode is (
      None,
      DataFormatError,
      NetworkError,
      InternalError
   );
   for TimedMetadataTrackErrorCode use (
      None => 0,
      DataFormatError => 1,
      NetworkError => 2,
      InternalError => 3
   );
   for TimedMetadataTrackErrorCode'Size use 32;
   
   type TimedMetadataTrackErrorCode_Ptr is access TimedMetadataTrackErrorCode;
   
   type MediaDecoderStatus is (
      FullySupported,
      UnsupportedSubtype,
      UnsupportedEncoderProperties,
      Degraded
   );
   for MediaDecoderStatus use (
      FullySupported => 0,
      UnsupportedSubtype => 1,
      UnsupportedEncoderProperties => 2,
      Degraded => 3
   );
   for MediaDecoderStatus'Size use 32;
   
   type MediaDecoderStatus_Ptr is access MediaDecoderStatus;
   
   type AudioDecoderDegradation is (
      None,
      DownmixTo2Channels,
      DownmixTo6Channels,
      DownmixTo8Channels
   );
   for AudioDecoderDegradation use (
      None => 0,
      DownmixTo2Channels => 1,
      DownmixTo6Channels => 2,
      DownmixTo8Channels => 3
   );
   for AudioDecoderDegradation'Size use 32;
   
   type AudioDecoderDegradation_Ptr is access AudioDecoderDegradation;
   
   type AudioDecoderDegradationReason is (
      None,
      LicensingRequirement,
      SpatialAudioNotSupported
   );
   for AudioDecoderDegradationReason use (
      None => 0,
      LicensingRequirement => 1,
      SpatialAudioNotSupported => 2
   );
   for AudioDecoderDegradationReason'Size use 32;
   
   type AudioDecoderDegradationReason_Ptr is access AudioDecoderDegradationReason;
   
   type MediaSourceStatus is (
      FullySupported,
      Unknown
   );
   for MediaSourceStatus use (
      FullySupported => 0,
      Unknown => 1
   );
   for MediaSourceStatus'Size use 32;
   
   type MediaSourceStatus_Ptr is access MediaSourceStatus;
   
   type MediaSourceState is (
      Initial,
      Opening,
      Opened,
      Failed,
      Closed
   );
   for MediaSourceState use (
      Initial => 0,
      Opening => 1,
      Opened => 2,
      Failed => 3,
      Closed => 4
   );
   for MediaSourceState'Size use 32;
   
   type MediaSourceState_Ptr is access MediaSourceState;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type TimedTextPadding is record
      Before : Windows.Double;
      After : Windows.Double;
      Start : Windows.Double;
      End_x : Windows.Double;
      Unit : Windows.Media.Core.TimedTextUnit;
   end record;
   pragma Convention (C_Pass_By_Copy , TimedTextPadding);
   
   type TimedTextPadding_Ptr is access TimedTextPadding;
   
   type TimedTextSize is record
      Height : Windows.Double;
      Width : Windows.Double;
      Unit : Windows.Media.Core.TimedTextUnit;
   end record;
   pragma Convention (C_Pass_By_Copy , TimedTextSize);
   
   type TimedTextSize_Ptr is access TimedTextSize;
   
   type TimedTextDouble is record
      Value : Windows.Double;
      Unit : Windows.Media.Core.TimedTextUnit;
   end record;
   pragma Convention (C_Pass_By_Copy , TimedTextDouble);
   
   type TimedTextDouble_Ptr is access TimedTextDouble;
   
   type TimedTextPoint is record
      X : Windows.Double;
      Y : Windows.Double;
      Unit : Windows.Media.Core.TimedTextUnit;
   end record;
   pragma Convention (C_Pass_By_Copy , TimedTextPoint);
   
   type TimedTextPoint_Ptr is access TimedTextPoint;
   
   type MseTimeRange is record
      Start : Windows.Foundation.TimeSpan;
      End_x : Windows.Foundation.TimeSpan;
   end record;
   pragma Convention (C_Pass_By_Copy , MseTimeRange);
   
   type MseTimeRange_Ptr is access MseTimeRange;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IMediaStreamSource_add_Closed_Interface;
   type TypedEventHandler_IMediaStreamSource_add_Closed is access all TypedEventHandler_IMediaStreamSource_add_Closed_Interface'Class;
   type TypedEventHandler_IMediaStreamSource_add_Closed_Ptr is access all TypedEventHandler_IMediaStreamSource_add_Closed;
   type TypedEventHandler_IMediaStreamSource_add_Starting_Interface;
   type TypedEventHandler_IMediaStreamSource_add_Starting is access all TypedEventHandler_IMediaStreamSource_add_Starting_Interface'Class;
   type TypedEventHandler_IMediaStreamSource_add_Starting_Ptr is access all TypedEventHandler_IMediaStreamSource_add_Starting;
   type TypedEventHandler_IMediaStreamSource_add_Paused_Interface;
   type TypedEventHandler_IMediaStreamSource_add_Paused is access all TypedEventHandler_IMediaStreamSource_add_Paused_Interface'Class;
   type TypedEventHandler_IMediaStreamSource_add_Paused_Ptr is access all TypedEventHandler_IMediaStreamSource_add_Paused;
   type TypedEventHandler_IMediaStreamSource_add_SampleRequested_Interface;
   type TypedEventHandler_IMediaStreamSource_add_SampleRequested is access all TypedEventHandler_IMediaStreamSource_add_SampleRequested_Interface'Class;
   type TypedEventHandler_IMediaStreamSource_add_SampleRequested_Ptr is access all TypedEventHandler_IMediaStreamSource_add_SampleRequested;
   type TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested_Interface;
   type TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested is access all TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested_Interface'Class;
   type TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested_Ptr is access all TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested;
   type TypedEventHandler_IMediaStreamSource2_add_SampleRendered_Interface;
   type TypedEventHandler_IMediaStreamSource2_add_SampleRendered is access all TypedEventHandler_IMediaStreamSource2_add_SampleRendered_Interface'Class;
   type TypedEventHandler_IMediaStreamSource2_add_SampleRendered_Ptr is access all TypedEventHandler_IMediaStreamSource2_add_SampleRendered;
   type TypedEventHandler_IMediaStreamSample_add_Processed_Interface;
   type TypedEventHandler_IMediaStreamSample_add_Processed is access all TypedEventHandler_IMediaStreamSample_add_Processed_Interface'Class;
   type TypedEventHandler_IMediaStreamSample_add_Processed_Ptr is access all TypedEventHandler_IMediaStreamSample_add_Processed;
   type AsyncOperationCompletedHandler_IMediaStreamSample_Interface;
   type AsyncOperationCompletedHandler_IMediaStreamSample is access all AsyncOperationCompletedHandler_IMediaStreamSample_Interface'Class;
   type AsyncOperationCompletedHandler_IMediaStreamSample_Ptr is access all AsyncOperationCompletedHandler_IMediaStreamSample;
   type TypedEventHandler_IMseStreamSource_add_Opened_Interface;
   type TypedEventHandler_IMseStreamSource_add_Opened is access all TypedEventHandler_IMseStreamSource_add_Opened_Interface'Class;
   type TypedEventHandler_IMseStreamSource_add_Opened_Ptr is access all TypedEventHandler_IMseStreamSource_add_Opened;
   type TypedEventHandler_IMseStreamSource_add_Ended_Interface;
   type TypedEventHandler_IMseStreamSource_add_Ended is access all TypedEventHandler_IMseStreamSource_add_Ended_Interface'Class;
   type TypedEventHandler_IMseStreamSource_add_Ended_Ptr is access all TypedEventHandler_IMseStreamSource_add_Ended;
   type TypedEventHandler_IMseStreamSource_add_Closed_Interface;
   type TypedEventHandler_IMseStreamSource_add_Closed is access all TypedEventHandler_IMseStreamSource_add_Closed_Interface'Class;
   type TypedEventHandler_IMseStreamSource_add_Closed_Ptr is access all TypedEventHandler_IMseStreamSource_add_Closed;
   type TypedEventHandler_IMseSourceBuffer_add_UpdateStarting_Interface;
   type TypedEventHandler_IMseSourceBuffer_add_UpdateStarting is access all TypedEventHandler_IMseSourceBuffer_add_UpdateStarting_Interface'Class;
   type TypedEventHandler_IMseSourceBuffer_add_UpdateStarting_Ptr is access all TypedEventHandler_IMseSourceBuffer_add_UpdateStarting;
   type TypedEventHandler_IMseSourceBuffer_add_Updated_Interface;
   type TypedEventHandler_IMseSourceBuffer_add_Updated is access all TypedEventHandler_IMseSourceBuffer_add_Updated_Interface'Class;
   type TypedEventHandler_IMseSourceBuffer_add_Updated_Ptr is access all TypedEventHandler_IMseSourceBuffer_add_Updated;
   type TypedEventHandler_IMseSourceBuffer_add_UpdateEnded_Interface;
   type TypedEventHandler_IMseSourceBuffer_add_UpdateEnded is access all TypedEventHandler_IMseSourceBuffer_add_UpdateEnded_Interface'Class;
   type TypedEventHandler_IMseSourceBuffer_add_UpdateEnded_Ptr is access all TypedEventHandler_IMseSourceBuffer_add_UpdateEnded;
   type TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred_Interface;
   type TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred is access all TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred_Interface'Class;
   type TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred_Ptr is access all TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred;
   type TypedEventHandler_IMseSourceBuffer_add_Aborted_Interface;
   type TypedEventHandler_IMseSourceBuffer_add_Aborted is access all TypedEventHandler_IMseSourceBuffer_add_Aborted_Interface'Class;
   type TypedEventHandler_IMseSourceBuffer_add_Aborted_Ptr is access all TypedEventHandler_IMseSourceBuffer_add_Aborted;
   type TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded_Interface;
   type TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded is access all TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded_Interface'Class;
   type TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded_Ptr is access all TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded;
   type TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved_Interface;
   type TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved is access all TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved_Interface'Class;
   type TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved_Ptr is access all TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved;
   type TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested_Interface;
   type TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested is access all TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested_Interface'Class;
   type TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested_Ptr is access all TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested;
   type TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed_Interface;
   type TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed is access all TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed_Interface'Class;
   type TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed_Ptr is access all TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed;
   type TypedEventHandler_IFaceDetectionEffect_add_FaceDetected_Interface;
   type TypedEventHandler_IFaceDetectionEffect_add_FaceDetected is access all TypedEventHandler_IFaceDetectionEffect_add_FaceDetected_Interface'Class;
   type TypedEventHandler_IFaceDetectionEffect_add_FaceDetected_Ptr is access all TypedEventHandler_IFaceDetectionEffect_add_FaceDetected;
   type TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged_Interface;
   type TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged is access all TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged_Interface'Class;
   type TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged_Ptr is access all TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged;
   type TypedEventHandler_IMediaBinder_add_Binding_Interface;
   type TypedEventHandler_IMediaBinder_add_Binding is access all TypedEventHandler_IMediaBinder_add_Binding_Interface'Class;
   type TypedEventHandler_IMediaBinder_add_Binding_Ptr is access all TypedEventHandler_IMediaBinder_add_Binding;
   type TypedEventHandler_IMediaBindingEventArgs_add_Canceled_Interface;
   type TypedEventHandler_IMediaBindingEventArgs_add_Canceled is access all TypedEventHandler_IMediaBindingEventArgs_add_Canceled_Interface'Class;
   type TypedEventHandler_IMediaBindingEventArgs_add_Canceled_Ptr is access all TypedEventHandler_IMediaBindingEventArgs_add_Canceled;
   type TypedEventHandler_IMediaSource2_add_OpenOperationCompleted_Interface;
   type TypedEventHandler_IMediaSource2_add_OpenOperationCompleted is access all TypedEventHandler_IMediaSource2_add_OpenOperationCompleted_Interface'Class;
   type TypedEventHandler_IMediaSource2_add_OpenOperationCompleted_Ptr is access all TypedEventHandler_IMediaSource2_add_OpenOperationCompleted;
   type VectorChangedEventHandler_ITimedTextSource_Interface;
   type VectorChangedEventHandler_ITimedTextSource is access all VectorChangedEventHandler_ITimedTextSource_Interface'Class;
   type VectorChangedEventHandler_ITimedTextSource_Ptr is access all VectorChangedEventHandler_ITimedTextSource;
   type VectorChangedEventHandler_ITimedMetadataTrack_Interface;
   type VectorChangedEventHandler_ITimedMetadataTrack is access all VectorChangedEventHandler_ITimedMetadataTrack_Interface'Class;
   type VectorChangedEventHandler_ITimedMetadataTrack_Ptr is access all VectorChangedEventHandler_ITimedMetadataTrack;
   type TypedEventHandler_IMediaSource3_add_StateChanged_Interface;
   type TypedEventHandler_IMediaSource3_add_StateChanged is access all TypedEventHandler_IMediaSource3_add_StateChanged_Interface'Class;
   type TypedEventHandler_IMediaSource3_add_StateChanged_Ptr is access all TypedEventHandler_IMediaSource3_add_StateChanged;
   type TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged_Interface;
   type TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged is access all TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged_Interface'Class;
   type TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged_Ptr is access all TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged;
   type TypedEventHandler_ITimedMetadataTrack_add_CueEntered_Interface;
   type TypedEventHandler_ITimedMetadataTrack_add_CueEntered is access all TypedEventHandler_ITimedMetadataTrack_add_CueEntered_Interface'Class;
   type TypedEventHandler_ITimedMetadataTrack_add_CueEntered_Ptr is access all TypedEventHandler_ITimedMetadataTrack_add_CueEntered;
   type TypedEventHandler_ITimedMetadataTrack_add_CueExited_Interface;
   type TypedEventHandler_ITimedMetadataTrack_add_CueExited is access all TypedEventHandler_ITimedMetadataTrack_add_CueExited_Interface'Class;
   type TypedEventHandler_ITimedMetadataTrack_add_CueExited_Ptr is access all TypedEventHandler_ITimedMetadataTrack_add_CueExited;
   type TypedEventHandler_ITimedMetadataTrack_add_TrackFailed_Interface;
   type TypedEventHandler_ITimedMetadataTrack_add_TrackFailed is access all TypedEventHandler_ITimedMetadataTrack_add_TrackFailed_Interface'Class;
   type TypedEventHandler_ITimedMetadataTrack_add_TrackFailed_Ptr is access all TypedEventHandler_ITimedMetadataTrack_add_TrackFailed;
   type TypedEventHandler_ITimedTextSource_add_Resolved_Interface;
   type TypedEventHandler_ITimedTextSource_add_Resolved is access all TypedEventHandler_ITimedTextSource_add_Resolved_Interface'Class;
   type TypedEventHandler_ITimedTextSource_add_Resolved_Ptr is access all TypedEventHandler_ITimedTextSource_add_Resolved;
   type TypedEventHandler_IVideoTrack_add_OpenFailed_Interface;
   type TypedEventHandler_IVideoTrack_add_OpenFailed is access all TypedEventHandler_IVideoTrack_add_OpenFailed_Interface'Class;
   type TypedEventHandler_IVideoTrack_add_OpenFailed_Ptr is access all TypedEventHandler_IVideoTrack_add_OpenFailed;
   type TypedEventHandler_IAudioTrack_add_OpenFailed_Interface;
   type TypedEventHandler_IAudioTrack_add_OpenFailed is access all TypedEventHandler_IAudioTrack_add_OpenFailed_Interface'Class;
   type TypedEventHandler_IAudioTrack_add_OpenFailed_Ptr is access all TypedEventHandler_IAudioTrack_add_OpenFailed;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMediaCue_Interface;
   type IMediaCue is access all IMediaCue_Interface'Class;
   type IMediaCue_Ptr is access all IMediaCue;
   type IDataCue_Interface;
   type IDataCue is access all IDataCue_Interface'Class;
   type IDataCue_Ptr is access all IDataCue;
   type IDataCue2_Interface;
   type IDataCue2 is access all IDataCue2_Interface'Class;
   type IDataCue2_Ptr is access all IDataCue2;
   type IChapterCue_Interface;
   type IChapterCue is access all IChapterCue_Interface'Class;
   type IChapterCue_Ptr is access all IChapterCue;
   type IImageCue_Interface;
   type IImageCue is access all IImageCue_Interface'Class;
   type IImageCue_Ptr is access all IImageCue;
   type ISpeechCue_Interface;
   type ISpeechCue is access all ISpeechCue_Interface'Class;
   type ISpeechCue_Ptr is access all ISpeechCue;
   type ITimedTextCue_Interface;
   type ITimedTextCue is access all ITimedTextCue_Interface'Class;
   type ITimedTextCue_Ptr is access all ITimedTextCue;
   type ITimedTextRegion_Interface;
   type ITimedTextRegion is access all ITimedTextRegion_Interface'Class;
   type ITimedTextRegion_Ptr is access all ITimedTextRegion;
   type ITimedTextStyle_Interface;
   type ITimedTextStyle is access all ITimedTextStyle_Interface'Class;
   type ITimedTextStyle_Ptr is access all ITimedTextStyle;
   type ITimedTextStyle2_Interface;
   type ITimedTextStyle2 is access all ITimedTextStyle2_Interface'Class;
   type ITimedTextStyle2_Ptr is access all ITimedTextStyle2;
   type ITimedTextSubformat_Interface;
   type ITimedTextSubformat is access all ITimedTextSubformat_Interface'Class;
   type ITimedTextSubformat_Ptr is access all ITimedTextSubformat;
   type ITimedTextLine_Interface;
   type ITimedTextLine is access all ITimedTextLine_Interface'Class;
   type ITimedTextLine_Ptr is access all ITimedTextLine;
   type ICodecInfo_Interface;
   type ICodecInfo is access all ICodecInfo_Interface'Class;
   type ICodecInfo_Ptr is access all ICodecInfo;
   type ICodecQuery_Interface;
   type ICodecQuery is access all ICodecQuery_Interface'Class;
   type ICodecQuery_Ptr is access all ICodecQuery;
   type ICodecSubtypesStatics_Interface;
   type ICodecSubtypesStatics is access all ICodecSubtypesStatics_Interface'Class;
   type ICodecSubtypesStatics_Ptr is access all ICodecSubtypesStatics;
   type ILowLightFusionStatics_Interface;
   type ILowLightFusionStatics is access all ILowLightFusionStatics_Interface'Class;
   type ILowLightFusionStatics_Ptr is access all ILowLightFusionStatics;
   type ILowLightFusionResult_Interface;
   type ILowLightFusionResult is access all ILowLightFusionResult_Interface'Class;
   type ILowLightFusionResult_Ptr is access all ILowLightFusionResult;
   type IMediaStreamDescriptor_Interface;
   type IMediaStreamDescriptor is access all IMediaStreamDescriptor_Interface'Class;
   type IMediaStreamDescriptor_Ptr is access all IMediaStreamDescriptor;
   type IMediaStreamDescriptor2_Interface;
   type IMediaStreamDescriptor2 is access all IMediaStreamDescriptor2_Interface'Class;
   type IMediaStreamDescriptor2_Ptr is access all IMediaStreamDescriptor2;
   type IAudioStreamDescriptor_Interface;
   type IAudioStreamDescriptor is access all IAudioStreamDescriptor_Interface'Class;
   type IAudioStreamDescriptor_Ptr is access all IAudioStreamDescriptor;
   type IAudioStreamDescriptor2_Interface;
   type IAudioStreamDescriptor2 is access all IAudioStreamDescriptor2_Interface'Class;
   type IAudioStreamDescriptor2_Ptr is access all IAudioStreamDescriptor2;
   type IAudioStreamDescriptorFactory_Interface;
   type IAudioStreamDescriptorFactory is access all IAudioStreamDescriptorFactory_Interface'Class;
   type IAudioStreamDescriptorFactory_Ptr is access all IAudioStreamDescriptorFactory;
   type IVideoStreamDescriptor_Interface;
   type IVideoStreamDescriptor is access all IVideoStreamDescriptor_Interface'Class;
   type IVideoStreamDescriptor_Ptr is access all IVideoStreamDescriptor;
   type IVideoStreamDescriptorFactory_Interface;
   type IVideoStreamDescriptorFactory is access all IVideoStreamDescriptorFactory_Interface'Class;
   type IVideoStreamDescriptorFactory_Ptr is access all IVideoStreamDescriptorFactory;
   type IMediaSource_Interface;
   type IMediaSource is access all IMediaSource_Interface'Class;
   type IMediaSource_Ptr is access all IMediaSource;
   type IMediaStreamSource_Interface;
   type IMediaStreamSource is access all IMediaStreamSource_Interface'Class;
   type IMediaStreamSource_Ptr is access all IMediaStreamSource;
   type IMediaStreamSource2_Interface;
   type IMediaStreamSource2 is access all IMediaStreamSource2_Interface'Class;
   type IMediaStreamSource2_Ptr is access all IMediaStreamSource2;
   type IMediaStreamSource3_Interface;
   type IMediaStreamSource3 is access all IMediaStreamSource3_Interface'Class;
   type IMediaStreamSource3_Ptr is access all IMediaStreamSource3;
   type IMediaStreamSource4_Interface;
   type IMediaStreamSource4 is access all IMediaStreamSource4_Interface'Class;
   type IMediaStreamSource4_Ptr is access all IMediaStreamSource4;
   type IMediaStreamSourceFactory_Interface;
   type IMediaStreamSourceFactory is access all IMediaStreamSourceFactory_Interface'Class;
   type IMediaStreamSourceFactory_Ptr is access all IMediaStreamSourceFactory;
   type IMap_Guid_Object_Interface;
   type IMap_Guid_Object is access all IMap_Guid_Object_Interface'Class;
   type IMap_Guid_Object_Ptr is access all IMap_Guid_Object;
   type IMediaStreamSample_Interface;
   type IMediaStreamSample is access all IMediaStreamSample_Interface'Class;
   type IMediaStreamSample_Ptr is access all IMediaStreamSample;
   type IMediaStreamSampleStatics_Interface;
   type IMediaStreamSampleStatics is access all IMediaStreamSampleStatics_Interface'Class;
   type IMediaStreamSampleStatics_Ptr is access all IMediaStreamSampleStatics;
   type IMediaStreamSampleProtectionProperties_Interface;
   type IMediaStreamSampleProtectionProperties is access all IMediaStreamSampleProtectionProperties_Interface'Class;
   type IMediaStreamSampleProtectionProperties_Ptr is access all IMediaStreamSampleProtectionProperties;
   type IMediaStreamSourceClosedRequest_Interface;
   type IMediaStreamSourceClosedRequest is access all IMediaStreamSourceClosedRequest_Interface'Class;
   type IMediaStreamSourceClosedRequest_Ptr is access all IMediaStreamSourceClosedRequest;
   type IMediaStreamSourceClosedEventArgs_Interface;
   type IMediaStreamSourceClosedEventArgs is access all IMediaStreamSourceClosedEventArgs_Interface'Class;
   type IMediaStreamSourceClosedEventArgs_Ptr is access all IMediaStreamSourceClosedEventArgs;
   type IMediaStreamSourceStartingRequestDeferral_Interface;
   type IMediaStreamSourceStartingRequestDeferral is access all IMediaStreamSourceStartingRequestDeferral_Interface'Class;
   type IMediaStreamSourceStartingRequestDeferral_Ptr is access all IMediaStreamSourceStartingRequestDeferral;
   type IMediaStreamSourceStartingRequest_Interface;
   type IMediaStreamSourceStartingRequest is access all IMediaStreamSourceStartingRequest_Interface'Class;
   type IMediaStreamSourceStartingRequest_Ptr is access all IMediaStreamSourceStartingRequest;
   type IMediaStreamSourceStartingEventArgs_Interface;
   type IMediaStreamSourceStartingEventArgs is access all IMediaStreamSourceStartingEventArgs_Interface'Class;
   type IMediaStreamSourceStartingEventArgs_Ptr is access all IMediaStreamSourceStartingEventArgs;
   type IMediaStreamSourceSampleRequestDeferral_Interface;
   type IMediaStreamSourceSampleRequestDeferral is access all IMediaStreamSourceSampleRequestDeferral_Interface'Class;
   type IMediaStreamSourceSampleRequestDeferral_Ptr is access all IMediaStreamSourceSampleRequestDeferral;
   type IMediaStreamSourceSampleRequest_Interface;
   type IMediaStreamSourceSampleRequest is access all IMediaStreamSourceSampleRequest_Interface'Class;
   type IMediaStreamSourceSampleRequest_Ptr is access all IMediaStreamSourceSampleRequest;
   type IMediaStreamSourceSampleRequestedEventArgs_Interface;
   type IMediaStreamSourceSampleRequestedEventArgs is access all IMediaStreamSourceSampleRequestedEventArgs_Interface'Class;
   type IMediaStreamSourceSampleRequestedEventArgs_Ptr is access all IMediaStreamSourceSampleRequestedEventArgs;
   type IMediaStreamSourceSwitchStreamsRequestDeferral_Interface;
   type IMediaStreamSourceSwitchStreamsRequestDeferral is access all IMediaStreamSourceSwitchStreamsRequestDeferral_Interface'Class;
   type IMediaStreamSourceSwitchStreamsRequestDeferral_Ptr is access all IMediaStreamSourceSwitchStreamsRequestDeferral;
   type IMediaStreamSourceSwitchStreamsRequest_Interface;
   type IMediaStreamSourceSwitchStreamsRequest is access all IMediaStreamSourceSwitchStreamsRequest_Interface'Class;
   type IMediaStreamSourceSwitchStreamsRequest_Ptr is access all IMediaStreamSourceSwitchStreamsRequest;
   type IMediaStreamSourceSwitchStreamsRequestedEventArgs_Interface;
   type IMediaStreamSourceSwitchStreamsRequestedEventArgs is access all IMediaStreamSourceSwitchStreamsRequestedEventArgs_Interface'Class;
   type IMediaStreamSourceSwitchStreamsRequestedEventArgs_Ptr is access all IMediaStreamSourceSwitchStreamsRequestedEventArgs;
   type IMediaStreamSourceSampleRenderedEventArgs_Interface;
   type IMediaStreamSourceSampleRenderedEventArgs is access all IMediaStreamSourceSampleRenderedEventArgs_Interface'Class;
   type IMediaStreamSourceSampleRenderedEventArgs_Ptr is access all IMediaStreamSourceSampleRenderedEventArgs;
   type IMseStreamSourceStatics_Interface;
   type IMseStreamSourceStatics is access all IMseStreamSourceStatics_Interface'Class;
   type IMseStreamSourceStatics_Ptr is access all IMseStreamSourceStatics;
   type IMseStreamSource_Interface;
   type IMseStreamSource is access all IMseStreamSource_Interface'Class;
   type IMseStreamSource_Ptr is access all IMseStreamSource;
   type IMseSourceBuffer_Interface;
   type IMseSourceBuffer is access all IMseSourceBuffer_Interface'Class;
   type IMseSourceBuffer_Ptr is access all IMseSourceBuffer;
   type IMseSourceBufferList_Interface;
   type IMseSourceBufferList is access all IMseSourceBufferList_Interface'Class;
   type IMseSourceBufferList_Ptr is access all IMseSourceBufferList;
   type IMseStreamSource2_Interface;
   type IMseStreamSource2 is access all IMseStreamSource2_Interface'Class;
   type IMseStreamSource2_Ptr is access all IMseStreamSource2;
   type IMediaSourceAppServiceConnectionFactory_Interface;
   type IMediaSourceAppServiceConnectionFactory is access all IMediaSourceAppServiceConnectionFactory_Interface'Class;
   type IMediaSourceAppServiceConnectionFactory_Ptr is access all IMediaSourceAppServiceConnectionFactory;
   type IMediaSourceAppServiceConnection_Interface;
   type IMediaSourceAppServiceConnection is access all IMediaSourceAppServiceConnection_Interface'Class;
   type IMediaSourceAppServiceConnection_Ptr is access all IMediaSourceAppServiceConnection;
   type IInitializeMediaStreamSourceRequestedEventArgs_Interface;
   type IInitializeMediaStreamSourceRequestedEventArgs is access all IInitializeMediaStreamSourceRequestedEventArgs_Interface'Class;
   type IInitializeMediaStreamSourceRequestedEventArgs_Ptr is access all IInitializeMediaStreamSourceRequestedEventArgs;
   type IHighDynamicRangeControl_Interface;
   type IHighDynamicRangeControl is access all IHighDynamicRangeControl_Interface'Class;
   type IHighDynamicRangeControl_Ptr is access all IHighDynamicRangeControl;
   type ISceneAnalysisEffect_Interface;
   type ISceneAnalysisEffect is access all ISceneAnalysisEffect_Interface'Class;
   type ISceneAnalysisEffect_Ptr is access all ISceneAnalysisEffect;
   type IHighDynamicRangeOutput_Interface;
   type IHighDynamicRangeOutput is access all IHighDynamicRangeOutput_Interface'Class;
   type IHighDynamicRangeOutput_Ptr is access all IHighDynamicRangeOutput;
   type ISceneAnalysisEffectFrame_Interface;
   type ISceneAnalysisEffectFrame is access all ISceneAnalysisEffectFrame_Interface'Class;
   type ISceneAnalysisEffectFrame_Ptr is access all ISceneAnalysisEffectFrame;
   type ISceneAnalysisEffectFrame2_Interface;
   type ISceneAnalysisEffectFrame2 is access all ISceneAnalysisEffectFrame2_Interface'Class;
   type ISceneAnalysisEffectFrame2_Ptr is access all ISceneAnalysisEffectFrame2;
   type ISceneAnalyzedEventArgs_Interface;
   type ISceneAnalyzedEventArgs is access all ISceneAnalyzedEventArgs_Interface'Class;
   type ISceneAnalyzedEventArgs_Ptr is access all ISceneAnalyzedEventArgs;
   type IFaceDetectionEffectFrame_Interface;
   type IFaceDetectionEffectFrame is access all IFaceDetectionEffectFrame_Interface'Class;
   type IFaceDetectionEffectFrame_Ptr is access all IFaceDetectionEffectFrame;
   type IFaceDetectedEventArgs_Interface;
   type IFaceDetectedEventArgs is access all IFaceDetectedEventArgs_Interface'Class;
   type IFaceDetectedEventArgs_Ptr is access all IFaceDetectedEventArgs;
   type IFaceDetectionEffect_Interface;
   type IFaceDetectionEffect is access all IFaceDetectionEffect_Interface'Class;
   type IFaceDetectionEffect_Ptr is access all IFaceDetectionEffect;
   type IFaceDetectionEffectDefinition_Interface;
   type IFaceDetectionEffectDefinition is access all IFaceDetectionEffectDefinition_Interface'Class;
   type IFaceDetectionEffectDefinition_Ptr is access all IFaceDetectionEffectDefinition;
   type IVideoStabilizationEffectEnabledChangedEventArgs_Interface;
   type IVideoStabilizationEffectEnabledChangedEventArgs is access all IVideoStabilizationEffectEnabledChangedEventArgs_Interface'Class;
   type IVideoStabilizationEffectEnabledChangedEventArgs_Ptr is access all IVideoStabilizationEffectEnabledChangedEventArgs;
   type IVideoStabilizationEffect_Interface;
   type IVideoStabilizationEffect is access all IVideoStabilizationEffect_Interface'Class;
   type IVideoStabilizationEffect_Ptr is access all IVideoStabilizationEffect;
   type IMediaSourceError_Interface;
   type IMediaSourceError is access all IMediaSourceError_Interface'Class;
   type IMediaSourceError_Ptr is access all IMediaSourceError;
   type IMediaSourceOpenOperationCompletedEventArgs_Interface;
   type IMediaSourceOpenOperationCompletedEventArgs is access all IMediaSourceOpenOperationCompletedEventArgs_Interface'Class;
   type IMediaSourceOpenOperationCompletedEventArgs_Ptr is access all IMediaSourceOpenOperationCompletedEventArgs;
   type IMediaSourceStateChangedEventArgs_Interface;
   type IMediaSourceStateChangedEventArgs is access all IMediaSourceStateChangedEventArgs_Interface'Class;
   type IMediaSourceStateChangedEventArgs_Ptr is access all IMediaSourceStateChangedEventArgs;
   type IMediaSourceStatics_Interface;
   type IMediaSourceStatics is access all IMediaSourceStatics_Interface'Class;
   type IMediaSourceStatics_Ptr is access all IMediaSourceStatics;
   type IMediaSourceStatics2_Interface;
   type IMediaSourceStatics2 is access all IMediaSourceStatics2_Interface'Class;
   type IMediaSourceStatics2_Ptr is access all IMediaSourceStatics2;
   type IMediaSourceStatics3_Interface;
   type IMediaSourceStatics3 is access all IMediaSourceStatics3_Interface'Class;
   type IMediaSourceStatics3_Ptr is access all IMediaSourceStatics3;
   type IMediaBinder_Interface;
   type IMediaBinder is access all IMediaBinder_Interface'Class;
   type IMediaBinder_Ptr is access all IMediaBinder;
   type IMediaBindingEventArgs_Interface;
   type IMediaBindingEventArgs is access all IMediaBindingEventArgs_Interface'Class;
   type IMediaBindingEventArgs_Ptr is access all IMediaBindingEventArgs;
   type IMediaBindingEventArgs2_Interface;
   type IMediaBindingEventArgs2 is access all IMediaBindingEventArgs2_Interface'Class;
   type IMediaBindingEventArgs2_Ptr is access all IMediaBindingEventArgs2;
   type IMediaSource2_Interface;
   type IMediaSource2 is access all IMediaSource2_Interface'Class;
   type IMediaSource2_Ptr is access all IMediaSource2;
   type IMediaSource3_Interface;
   type IMediaSource3 is access all IMediaSource3_Interface'Class;
   type IMediaSource3_Ptr is access all IMediaSource3;
   type IMediaSource4_Interface;
   type IMediaSource4 is access all IMediaSource4_Interface'Class;
   type IMediaSource4_Ptr is access all IMediaSource4;
   type ISingleSelectMediaTrackList_Interface;
   type ISingleSelectMediaTrackList is access all ISingleSelectMediaTrackList_Interface'Class;
   type ISingleSelectMediaTrackList_Ptr is access all ISingleSelectMediaTrackList;
   type IMediaTrack_Interface;
   type IMediaTrack is access all IMediaTrack_Interface'Class;
   type IMediaTrack_Ptr is access all IMediaTrack;
   type ITimedMetadataTrackError_Interface;
   type ITimedMetadataTrackError is access all ITimedMetadataTrackError_Interface'Class;
   type ITimedMetadataTrackError_Ptr is access all ITimedMetadataTrackError;
   type IMediaCueEventArgs_Interface;
   type IMediaCueEventArgs is access all IMediaCueEventArgs_Interface'Class;
   type IMediaCueEventArgs_Ptr is access all IMediaCueEventArgs;
   type ITimedMetadataTrackFailedEventArgs_Interface;
   type ITimedMetadataTrackFailedEventArgs is access all ITimedMetadataTrackFailedEventArgs_Interface'Class;
   type ITimedMetadataTrackFailedEventArgs_Ptr is access all ITimedMetadataTrackFailedEventArgs;
   type ITimedMetadataTrackFactory_Interface;
   type ITimedMetadataTrackFactory is access all ITimedMetadataTrackFactory_Interface'Class;
   type ITimedMetadataTrackFactory_Ptr is access all ITimedMetadataTrackFactory;
   type ITimedMetadataTrackProvider_Interface;
   type ITimedMetadataTrackProvider is access all ITimedMetadataTrackProvider_Interface'Class;
   type ITimedMetadataTrackProvider_Ptr is access all ITimedMetadataTrackProvider;
   type ITimedMetadataTrack_Interface;
   type ITimedMetadataTrack is access all ITimedMetadataTrack_Interface'Class;
   type ITimedMetadataTrack_Ptr is access all ITimedMetadataTrack;
   type ITimedTextSourceResolveResultEventArgs_Interface;
   type ITimedTextSourceResolveResultEventArgs is access all ITimedTextSourceResolveResultEventArgs_Interface'Class;
   type ITimedTextSourceResolveResultEventArgs_Ptr is access all ITimedTextSourceResolveResultEventArgs;
   type ITimedTextSource_Interface;
   type ITimedTextSource is access all ITimedTextSource_Interface'Class;
   type ITimedTextSource_Ptr is access all ITimedTextSource;
   type ITimedTextSourceStatics_Interface;
   type ITimedTextSourceStatics is access all ITimedTextSourceStatics_Interface'Class;
   type ITimedTextSourceStatics_Ptr is access all ITimedTextSourceStatics;
   type ITimedTextSourceStatics2_Interface;
   type ITimedTextSourceStatics2 is access all ITimedTextSourceStatics2_Interface'Class;
   type ITimedTextSourceStatics2_Ptr is access all ITimedTextSourceStatics2;
   type IVideoTrackSupportInfo_Interface;
   type IVideoTrackSupportInfo is access all IVideoTrackSupportInfo_Interface'Class;
   type IVideoTrackSupportInfo_Ptr is access all IVideoTrackSupportInfo;
   type IAudioTrackSupportInfo_Interface;
   type IAudioTrackSupportInfo is access all IAudioTrackSupportInfo_Interface'Class;
   type IAudioTrackSupportInfo_Ptr is access all IAudioTrackSupportInfo;
   type IVideoTrackOpenFailedEventArgs_Interface;
   type IVideoTrackOpenFailedEventArgs is access all IVideoTrackOpenFailedEventArgs_Interface'Class;
   type IVideoTrackOpenFailedEventArgs_Ptr is access all IVideoTrackOpenFailedEventArgs;
   type IAudioTrackOpenFailedEventArgs_Interface;
   type IAudioTrackOpenFailedEventArgs is access all IAudioTrackOpenFailedEventArgs_Interface'Class;
   type IAudioTrackOpenFailedEventArgs_Ptr is access all IAudioTrackOpenFailedEventArgs;
   type IVideoTrack_Interface;
   type IVideoTrack is access all IVideoTrack_Interface'Class;
   type IVideoTrack_Ptr is access all IVideoTrack;
   type IAudioTrack_Interface;
   type IAudioTrack is access all IAudioTrack_Interface'Class;
   type IAudioTrack_Ptr is access all IAudioTrack;
   type ITimedMetadataTrack2_Interface;
   type ITimedMetadataTrack2 is access all ITimedMetadataTrack2_Interface'Class;
   type ITimedMetadataTrack2_Ptr is access all ITimedMetadataTrack2;
   type IVideoEffectDefinition_Imported_Interface;
   type IVideoEffectDefinition_Imported is access all IVideoEffectDefinition_Imported_Interface'Class;
   type IVideoEffectDefinition_Imported_Ptr is access all IVideoEffectDefinition_Imported;
   type IMediaPlaybackSource_Imported_Interface;
   type IMediaPlaybackSource_Imported is access all IMediaPlaybackSource_Imported_Interface'Class;
   type IMediaPlaybackSource_Imported_Ptr is access all IMediaPlaybackSource_Imported;
   type IIterator_ITimedTextLine_Interface;
   type IIterator_ITimedTextLine is access all IIterator_ITimedTextLine_Interface'Class;
   type IIterator_ITimedTextLine_Ptr is access all IIterator_ITimedTextLine;
   type IIterable_ITimedTextLine_Interface;
   type IIterable_ITimedTextLine is access all IIterable_ITimedTextLine_Interface'Class;
   type IIterable_ITimedTextLine_Ptr is access all IIterable_ITimedTextLine;
   type IVectorView_ITimedTextLine_Interface;
   type IVectorView_ITimedTextLine is access all IVectorView_ITimedTextLine_Interface'Class;
   type IVectorView_ITimedTextLine_Ptr is access all IVectorView_ITimedTextLine;
   type IVector_ITimedTextLine_Interface;
   type IVector_ITimedTextLine is access all IVector_ITimedTextLine_Interface'Class;
   type IVector_ITimedTextLine_Ptr is access all IVector_ITimedTextLine;
   type IIterator_ITimedTextSubformat_Interface;
   type IIterator_ITimedTextSubformat is access all IIterator_ITimedTextSubformat_Interface'Class;
   type IIterator_ITimedTextSubformat_Ptr is access all IIterator_ITimedTextSubformat;
   type IIterable_ITimedTextSubformat_Interface;
   type IIterable_ITimedTextSubformat is access all IIterable_ITimedTextSubformat_Interface'Class;
   type IIterable_ITimedTextSubformat_Ptr is access all IIterable_ITimedTextSubformat;
   type IVectorView_ITimedTextSubformat_Interface;
   type IVectorView_ITimedTextSubformat is access all IVectorView_ITimedTextSubformat_Interface'Class;
   type IVectorView_ITimedTextSubformat_Ptr is access all IVectorView_ITimedTextSubformat;
   type IVector_ITimedTextSubformat_Interface;
   type IVector_ITimedTextSubformat is access all IVector_ITimedTextSubformat_Interface'Class;
   type IVector_ITimedTextSubformat_Ptr is access all IVector_ITimedTextSubformat;
   type IIterator_IAudioStreamDescriptor_Interface;
   type IIterator_IAudioStreamDescriptor is access all IIterator_IAudioStreamDescriptor_Interface'Class;
   type IIterator_IAudioStreamDescriptor_Ptr is access all IIterator_IAudioStreamDescriptor;
   type IIterable_IAudioStreamDescriptor_Interface;
   type IIterable_IAudioStreamDescriptor is access all IIterable_IAudioStreamDescriptor_Interface'Class;
   type IIterable_IAudioStreamDescriptor_Ptr is access all IIterable_IAudioStreamDescriptor;
   type IVectorView_IAudioStreamDescriptor_Interface;
   type IVectorView_IAudioStreamDescriptor is access all IVectorView_IAudioStreamDescriptor_Interface'Class;
   type IVectorView_IAudioStreamDescriptor_Ptr is access all IVectorView_IAudioStreamDescriptor;
   type IVector_IAudioStreamDescriptor_Interface;
   type IVector_IAudioStreamDescriptor is access all IVector_IAudioStreamDescriptor_Interface'Class;
   type IVector_IAudioStreamDescriptor_Ptr is access all IVector_IAudioStreamDescriptor;
   type IIterator_IVideoStreamDescriptor_Interface;
   type IIterator_IVideoStreamDescriptor is access all IIterator_IVideoStreamDescriptor_Interface'Class;
   type IIterator_IVideoStreamDescriptor_Ptr is access all IIterator_IVideoStreamDescriptor;
   type IIterable_IVideoStreamDescriptor_Interface;
   type IIterable_IVideoStreamDescriptor is access all IIterable_IVideoStreamDescriptor_Interface'Class;
   type IIterable_IVideoStreamDescriptor_Ptr is access all IIterable_IVideoStreamDescriptor;
   type IVectorView_IVideoStreamDescriptor_Interface;
   type IVectorView_IVideoStreamDescriptor is access all IVectorView_IVideoStreamDescriptor_Interface'Class;
   type IVectorView_IVideoStreamDescriptor_Ptr is access all IVectorView_IVideoStreamDescriptor;
   type IVector_IVideoStreamDescriptor_Interface;
   type IVector_IVideoStreamDescriptor is access all IVector_IVideoStreamDescriptor_Interface'Class;
   type IVector_IVideoStreamDescriptor_Ptr is access all IVector_IVideoStreamDescriptor;
   type IAsyncOperation_IMediaStreamSample_Interface;
   type IAsyncOperation_IMediaStreamSample is access all IAsyncOperation_IMediaStreamSample_Interface'Class;
   type IAsyncOperation_IMediaStreamSample_Ptr is access all IAsyncOperation_IMediaStreamSample;
   type IIterator_MseTimeRange_Interface;
   type IIterator_MseTimeRange is access all IIterator_MseTimeRange_Interface'Class;
   type IIterator_MseTimeRange_Ptr is access all IIterator_MseTimeRange;
   type IIterable_MseTimeRange_Interface;
   type IIterable_MseTimeRange is access all IIterable_MseTimeRange_Interface'Class;
   type IIterable_MseTimeRange_Ptr is access all IIterable_MseTimeRange;
   type IVectorView_MseTimeRange_Interface;
   type IVectorView_MseTimeRange is access all IVectorView_MseTimeRange_Interface'Class;
   type IVectorView_MseTimeRange_Ptr is access all IVectorView_MseTimeRange;
   type IIterator_IMseSourceBuffer_Interface;
   type IIterator_IMseSourceBuffer is access all IIterator_IMseSourceBuffer_Interface'Class;
   type IIterator_IMseSourceBuffer_Ptr is access all IIterator_IMseSourceBuffer;
   type IIterable_IMseSourceBuffer_Interface;
   type IIterable_IMseSourceBuffer is access all IIterable_IMseSourceBuffer_Interface'Class;
   type IIterable_IMseSourceBuffer_Ptr is access all IIterable_IMseSourceBuffer;
   type IVectorView_IMseSourceBuffer_Interface;
   type IVectorView_IMseSourceBuffer is access all IVectorView_IMseSourceBuffer_Interface'Class;
   type IVectorView_IMseSourceBuffer_Ptr is access all IVectorView_IMseSourceBuffer;
   type IReference_MseTimeRange_Interface;
   type IReference_MseTimeRange is access all IReference_MseTimeRange_Interface'Class;
   type IReference_MseTimeRange_Ptr is access all IReference_MseTimeRange;
   type IIterator_ITimedTextSource_Interface;
   type IIterator_ITimedTextSource is access all IIterator_ITimedTextSource_Interface'Class;
   type IIterator_ITimedTextSource_Ptr is access all IIterator_ITimedTextSource;
   type IIterable_ITimedTextSource_Interface;
   type IIterable_ITimedTextSource is access all IIterable_ITimedTextSource_Interface'Class;
   type IIterable_ITimedTextSource_Ptr is access all IIterable_ITimedTextSource;
   type IVectorView_ITimedTextSource_Interface;
   type IVectorView_ITimedTextSource is access all IVectorView_ITimedTextSource_Interface'Class;
   type IVectorView_ITimedTextSource_Ptr is access all IVectorView_ITimedTextSource;
   type IVector_ITimedTextSource_Interface;
   type IVector_ITimedTextSource is access all IVector_ITimedTextSource_Interface'Class;
   type IVector_ITimedTextSource_Ptr is access all IVector_ITimedTextSource;
   type IObservableVector_ITimedTextSource_Interface;
   type IObservableVector_ITimedTextSource is access all IObservableVector_ITimedTextSource_Interface'Class;
   type IObservableVector_ITimedTextSource_Ptr is access all IObservableVector_ITimedTextSource;
   type IIterator_ITimedMetadataTrack_Interface;
   type IIterator_ITimedMetadataTrack is access all IIterator_ITimedMetadataTrack_Interface'Class;
   type IIterator_ITimedMetadataTrack_Ptr is access all IIterator_ITimedMetadataTrack;
   type IIterable_ITimedMetadataTrack_Interface;
   type IIterable_ITimedMetadataTrack is access all IIterable_ITimedMetadataTrack_Interface'Class;
   type IIterable_ITimedMetadataTrack_Ptr is access all IIterable_ITimedMetadataTrack;
   type IVectorView_ITimedMetadataTrack_Interface;
   type IVectorView_ITimedMetadataTrack is access all IVectorView_ITimedMetadataTrack_Interface'Class;
   type IVectorView_ITimedMetadataTrack_Ptr is access all IVectorView_ITimedMetadataTrack;
   type IVector_ITimedMetadataTrack_Interface;
   type IVector_ITimedMetadataTrack is access all IVector_ITimedMetadataTrack_Interface'Class;
   type IVector_ITimedMetadataTrack_Ptr is access all IVector_ITimedMetadataTrack;
   type IObservableVector_ITimedMetadataTrack_Interface;
   type IObservableVector_ITimedMetadataTrack is access all IObservableVector_ITimedMetadataTrack_Interface'Class;
   type IObservableVector_ITimedMetadataTrack_Ptr is access all IObservableVector_ITimedMetadataTrack;
   type IIterator_IMediaCue_Interface;
   type IIterator_IMediaCue is access all IIterator_IMediaCue_Interface'Class;
   type IIterator_IMediaCue_Ptr is access all IIterator_IMediaCue;
   type IIterable_IMediaCue_Interface;
   type IIterable_IMediaCue is access all IIterable_IMediaCue_Interface'Class;
   type IIterable_IMediaCue_Ptr is access all IIterable_IMediaCue;
   type IVectorView_IMediaCue_Interface;
   type IVectorView_IMediaCue is access all IVectorView_IMediaCue_Interface'Class;
   type IVectorView_IMediaCue_Ptr is access all IVectorView_IMediaCue;
   
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
   type IMediaCue_Interface is interface and Windows.IInspectable_Interface;
   
   function put_StartTime
   (
      This       : access IMediaCue_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTime
   (
      This       : access IMediaCue_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access IMediaCue_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IMediaCue_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IMediaCue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IMediaCue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaCue : aliased constant Windows.IID := (3352387165, 23004, 17183, (160, 238, 39, 116, 67, 35, 179, 109 ));
   
   ------------------------------------------------------------------------
   type IDataCue_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Data
   (
      This       : access IDataCue_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IDataCue_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_IDataCue : aliased constant Windows.IID := (2088724333, 8124, 20013, (154, 135, 238, 56, 189, 29, 198, 55 ));
   
   ------------------------------------------------------------------------
   type IDataCue2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Properties
   (
      This       : access IDataCue2_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   IID_IDataCue2 : aliased constant Windows.IID := (3159759637, 38386, 18920, (150, 241, 141, 213, 218, 198, 141, 147 ));
   
   ------------------------------------------------------------------------
   type IChapterCue_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Title
   (
      This       : access IChapterCue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IChapterCue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IChapterCue : aliased constant Windows.IID := (1923710977, 54154, 19466, (143, 166, 117, 205, 218, 244, 102, 76 ));
   
   ------------------------------------------------------------------------
   type IImageCue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IImageCue_Interface
      ; RetVal : access Windows.Media.Core.TimedTextPoint
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access IImageCue_Interface
      ; value : Windows.Media.Core.TimedTextPoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Extent
   (
      This       : access IImageCue_Interface
      ; RetVal : access Windows.Media.Core.TimedTextSize
   )
   return Windows.HRESULT is abstract;
   
   function put_Extent
   (
      This       : access IImageCue_Interface
      ; value : Windows.Media.Core.TimedTextSize
   )
   return Windows.HRESULT is abstract;
   
   function put_SoftwareBitmap
   (
      This       : access IImageCue_Interface
      ; value : Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function get_SoftwareBitmap
   (
      This       : access IImageCue_Interface
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageCue : aliased constant Windows.IID := (1384284802, 13947, 17419, (145, 22, 60, 132, 87, 13, 210, 112 ));
   
   ------------------------------------------------------------------------
   type ISpeechCue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access ISpeechCue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access ISpeechCue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StartPositionInInput
   (
      This       : access ISpeechCue_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_StartPositionInInput
   (
      This       : access ISpeechCue_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_EndPositionInInput
   (
      This       : access ISpeechCue_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_EndPositionInInput
   (
      This       : access ISpeechCue_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechCue : aliased constant Windows.IID := (2934068444, 5925, 19373, (128, 67, 169, 132, 153, 176, 23, 162 ));
   
   ------------------------------------------------------------------------
   type ITimedTextCue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CueRegion
   (
      This       : access ITimedTextCue_Interface
      ; RetVal : access Windows.Media.Core.ITimedTextRegion
   )
   return Windows.HRESULT is abstract;
   
   function put_CueRegion
   (
      This       : access ITimedTextCue_Interface
      ; value : Windows.Media.Core.ITimedTextRegion
   )
   return Windows.HRESULT is abstract;
   
   function get_CueStyle
   (
      This       : access ITimedTextCue_Interface
      ; RetVal : access Windows.Media.Core.ITimedTextStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_CueStyle
   (
      This       : access ITimedTextCue_Interface
      ; value : Windows.Media.Core.ITimedTextStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_Lines
   (
      This       : access ITimedTextCue_Interface
      ; RetVal : access Windows.Media.Core.IVector_ITimedTextLine -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedTextCue : aliased constant Windows.IID := (1372036689, 15238, 18765, (179, 89, 187, 46, 167, 172, 169, 169 ));
   
   ------------------------------------------------------------------------
   type ITimedTextRegion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.Media.Core.TimedTextPoint
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.Media.Core.TimedTextPoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Extent
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.Media.Core.TimedTextSize
   )
   return Windows.HRESULT is abstract;
   
   function put_Extent
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.Media.Core.TimedTextSize
   )
   return Windows.HRESULT is abstract;
   
   function get_Background
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Background
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_WritingMode
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.Media.Core.TimedTextWritingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_WritingMode
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.Media.Core.TimedTextWritingMode
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayAlignment
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.Media.Core.TimedTextDisplayAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayAlignment
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.Media.Core.TimedTextDisplayAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_LineHeight
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.Media.Core.TimedTextDouble
   )
   return Windows.HRESULT is abstract;
   
   function put_LineHeight
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.Media.Core.TimedTextDouble
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOverflowClipped
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsOverflowClipped
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Padding
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.Media.Core.TimedTextPadding
   )
   return Windows.HRESULT is abstract;
   
   function put_Padding
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.Media.Core.TimedTextPadding
   )
   return Windows.HRESULT is abstract;
   
   function get_TextWrapping
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.Media.Core.TimedTextWrapping
   )
   return Windows.HRESULT is abstract;
   
   function put_TextWrapping
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.Media.Core.TimedTextWrapping
   )
   return Windows.HRESULT is abstract;
   
   function get_ZIndex
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ZIndex
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ScrollMode
   (
      This       : access ITimedTextRegion_Interface
      ; RetVal : access Windows.Media.Core.TimedTextScrollMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ScrollMode
   (
      This       : access ITimedTextRegion_Interface
      ; value : Windows.Media.Core.TimedTextScrollMode
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedTextRegion : aliased constant Windows.IID := (516982815, 35334, 16930, (159, 89, 178, 27, 244, 1, 36, 180 ));
   
   ------------------------------------------------------------------------
   type ITimedTextStyle_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FontFamily
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_FontFamily
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FontSize
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.Media.Core.TimedTextDouble
   )
   return Windows.HRESULT is abstract;
   
   function put_FontSize
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.Media.Core.TimedTextDouble
   )
   return Windows.HRESULT is abstract;
   
   function get_FontWeight
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.Media.Core.TimedTextWeight
   )
   return Windows.HRESULT is abstract;
   
   function put_FontWeight
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.Media.Core.TimedTextWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_Foreground
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Foreground
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Background
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Background
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBackgroundAlwaysShown
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsBackgroundAlwaysShown
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FlowDirection
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.Media.Core.TimedTextFlowDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_FlowDirection
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.Media.Core.TimedTextFlowDirection
   )
   return Windows.HRESULT is abstract;
   
   function get_LineAlignment
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.Media.Core.TimedTextLineAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_LineAlignment
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.Media.Core.TimedTextLineAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_OutlineColor
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_OutlineColor
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_OutlineThickness
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.Media.Core.TimedTextDouble
   )
   return Windows.HRESULT is abstract;
   
   function put_OutlineThickness
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.Media.Core.TimedTextDouble
   )
   return Windows.HRESULT is abstract;
   
   function get_OutlineRadius
   (
      This       : access ITimedTextStyle_Interface
      ; RetVal : access Windows.Media.Core.TimedTextDouble
   )
   return Windows.HRESULT is abstract;
   
   function put_OutlineRadius
   (
      This       : access ITimedTextStyle_Interface
      ; value : Windows.Media.Core.TimedTextDouble
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedTextStyle : aliased constant Windows.IID := (464664653, 43045, 16578, (167, 245, 40, 30, 174, 223, 59, 85 ));
   
   ------------------------------------------------------------------------
   type ITimedTextStyle2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FontStyle
   (
      This       : access ITimedTextStyle2_Interface
      ; RetVal : access Windows.Media.Core.TimedTextFontStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_FontStyle
   (
      This       : access ITimedTextStyle2_Interface
      ; value : Windows.Media.Core.TimedTextFontStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_IsUnderlineEnabled
   (
      This       : access ITimedTextStyle2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsUnderlineEnabled
   (
      This       : access ITimedTextStyle2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLineThroughEnabled
   (
      This       : access ITimedTextStyle2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsLineThroughEnabled
   (
      This       : access ITimedTextStyle2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOverlineEnabled
   (
      This       : access ITimedTextStyle2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsOverlineEnabled
   (
      This       : access ITimedTextStyle2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedTextStyle2 : aliased constant Windows.IID := (1700743469, 24849, 18311, (137, 204, 104, 111, 236, 229, 126, 20 ));
   
   ------------------------------------------------------------------------
   type ITimedTextSubformat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartIndex
   (
      This       : access ITimedTextSubformat_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_StartIndex
   (
      This       : access ITimedTextSubformat_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Length
   (
      This       : access ITimedTextSubformat_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Length
   (
      This       : access ITimedTextSubformat_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SubformatStyle
   (
      This       : access ITimedTextSubformat_Interface
      ; RetVal : access Windows.Media.Core.ITimedTextStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_SubformatStyle
   (
      This       : access ITimedTextSubformat_Interface
      ; value : Windows.Media.Core.ITimedTextStyle
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedTextSubformat : aliased constant Windows.IID := (3608367151, 12897, 18210, (160, 194, 185, 55, 178, 57, 15, 20 ));
   
   ------------------------------------------------------------------------
   type ITimedTextLine_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access ITimedTextLine_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access ITimedTextLine_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subformats
   (
      This       : access ITimedTextLine_Interface
      ; RetVal : access Windows.Media.Core.IVector_ITimedTextSubformat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedTextLine : aliased constant Windows.IID := (2542632162, 29448, 19558, (190, 80, 101, 119, 114, 137, 245, 223 ));
   
   ------------------------------------------------------------------------
   type ICodecInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access ICodecInfo_Interface
      ; RetVal : access Windows.Media.Core.CodecKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Category
   (
      This       : access ICodecInfo_Interface
      ; RetVal : access Windows.Media.Core.CodecCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_Subtypes
   (
      This       : access ICodecInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access ICodecInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTrusted
   (
      This       : access ICodecInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ICodecInfo : aliased constant Windows.IID := (1374199685, 60055, 18844, (134, 172, 76, 229, 231, 63, 58, 66 ));
   
   ------------------------------------------------------------------------
   type ICodecQuery_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAllAsync
   (
      This       : access ICodecQuery_Interface
      ; kind : Windows.Media.Core.CodecKind
      ; category : Windows.Media.Core.CodecCategory
      ; subType_x : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ICodecQuery : aliased constant Windows.IID := (573216058, 44897, 19972, (128, 138, 164, 99, 78, 47, 58, 196 ));
   
   ------------------------------------------------------------------------
   type ICodecSubtypesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoFormatDV25
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatDV50
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatDvc
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatDvh1
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatDvhD
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatDvsd
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatDvsl
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatH263
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatH264
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatH265
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatH264ES
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatHevc
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatHevcES
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatM4S2
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatMjpg
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatMP43
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatMP4S
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatMP4V
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatMpeg2
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatVP80
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatVP90
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatMpg1
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatMss1
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatMss2
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatWmv1
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatWmv2
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatWmv3
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormatWvc1
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormat420O
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatAac
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatAdts
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatAlac
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatAmrNB
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatAmrWB
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatAmrWP
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatDolbyAC3
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatDolbyAC3Spdif
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatDolbyDDPlus
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatDrm
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatDts
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatFlac
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatFloat
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatMP3
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatMPeg
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatMsp1
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatOpus
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatPcm
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatWmaSpdif
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatWMAudioLossless
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatWMAudioV8
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioFormatWMAudioV9
   (
      This       : access ICodecSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ICodecSubtypesStatics : aliased constant Windows.IID := (2792015090, 34955, 16932, (140, 246, 42, 141, 78, 176, 35, 130 ));
   
   ------------------------------------------------------------------------
   type ILowLightFusionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportedBitmapPixelFormats
   (
      This       : access ILowLightFusionStatics_Interface
      ; RetVal : access Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSupportedFrameCount
   (
      This       : access ILowLightFusionStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function FuseAsync
   (
      This       : access ILowLightFusionStatics_Interface
      ; frameSet : Windows.Graphics.Imaging.IIterable_ISoftwareBitmap
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ILowLightFusionStatics : aliased constant Windows.IID := (1392836973, 49822, 16610, (135, 169, 158, 31, 210, 241, 146, 245 ));
   
   ------------------------------------------------------------------------
   type ILowLightFusionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Frame
   (
      This       : access ILowLightFusionResult_Interface
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   IID_ILowLightFusionResult : aliased constant Windows.IID := (2028846645, 10144, 17120, (156, 211, 115, 141, 32, 137, 222, 156 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSelected
   (
      This       : access IMediaStreamDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IMediaStreamDescriptor_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IMediaStreamDescriptor_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Language
   (
      This       : access IMediaStreamDescriptor_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access IMediaStreamDescriptor_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamDescriptor : aliased constant Windows.IID := (2163306094, 37623, 17694, (151, 210, 175, 216, 7, 66, 218, 112 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamDescriptor2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Label
   (
      This       : access IMediaStreamDescriptor2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Label
   (
      This       : access IMediaStreamDescriptor2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamDescriptor2 : aliased constant Windows.IID := (1349714191, 59570, 16497, (176, 11, 235, 243, 55, 167, 107, 88 ));
   
   ------------------------------------------------------------------------
   type IAudioStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EncodingProperties
   (
      This       : access IAudioStreamDescriptor_Interface
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   IID_IAudioStreamDescriptor : aliased constant Windows.IID := (506893028, 16423, 18503, (167, 11, 223, 29, 154, 42, 123, 4 ));
   
   ------------------------------------------------------------------------
   type IAudioStreamDescriptor2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_LeadingEncoderPadding
   (
      This       : access IAudioStreamDescriptor2_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_LeadingEncoderPadding
   (
      This       : access IAudioStreamDescriptor2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_TrailingEncoderPadding
   (
      This       : access IAudioStreamDescriptor2_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TrailingEncoderPadding
   (
      This       : access IAudioStreamDescriptor2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAudioStreamDescriptor2 : aliased constant Windows.IID := (778629622, 42056, 18811, (136, 64, 133, 8, 38, 101, 172, 249 ));
   
   ------------------------------------------------------------------------
   type IAudioStreamDescriptorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAudioStreamDescriptorFactory_Interface
      ; encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
      ; RetVal : access Windows.Media.Core.IAudioStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IAudioStreamDescriptorFactory : aliased constant Windows.IID := (1250348702, 19633, 17280, (142, 12, 131, 80, 75, 127, 91, 243 ));
   
   ------------------------------------------------------------------------
   type IVideoStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EncodingProperties
   (
      This       : access IVideoStreamDescriptor_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoStreamDescriptor : aliased constant Windows.IID := (317590869, 39979, 17472, (128, 87, 44, 122, 144, 240, 203, 236 ));
   
   ------------------------------------------------------------------------
   type IVideoStreamDescriptorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IVideoStreamDescriptorFactory_Interface
      ; encodingProperties : Windows.Media.MediaProperties.IVideoEncodingProperties
      ; RetVal : access Windows.Media.Core.IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoStreamDescriptorFactory : aliased constant Windows.IID := (1229911761, 47989, 17362, (158, 94, 123, 121, 163, 175, 206, 212 ));
   
   ------------------------------------------------------------------------
   type IMediaSource_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IMediaSource : aliased constant Windows.IID := (3888100761, 41117, 19489, (188, 223, 32, 175, 79, 134, 179, 217 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Closed
   (
      This       : access IMediaStreamSource_Interface
      ; handler : TypedEventHandler_IMediaStreamSource_add_Closed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access IMediaStreamSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Starting
   (
      This       : access IMediaStreamSource_Interface
      ; handler : TypedEventHandler_IMediaStreamSource_add_Starting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Starting
   (
      This       : access IMediaStreamSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Paused
   (
      This       : access IMediaStreamSource_Interface
      ; handler : TypedEventHandler_IMediaStreamSource_add_Paused
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Paused
   (
      This       : access IMediaStreamSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SampleRequested
   (
      This       : access IMediaStreamSource_Interface
      ; handler : TypedEventHandler_IMediaStreamSource_add_SampleRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SampleRequested
   (
      This       : access IMediaStreamSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SwitchStreamsRequested
   (
      This       : access IMediaStreamSource_Interface
      ; handler : TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SwitchStreamsRequested
   (
      This       : access IMediaStreamSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function NotifyError
   (
      This       : access IMediaStreamSource_Interface
      ; errorStatus : Windows.Media.Core.MediaStreamSourceErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function AddStreamDescriptor
   (
      This       : access IMediaStreamSource_Interface
      ; descriptor : Windows.Media.Core.IMediaStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function put_MediaProtectionManager
   (
      This       : access IMediaStreamSource_Interface
      ; value : Windows.Media.Protection.IMediaProtectionManager
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaProtectionManager
   (
      This       : access IMediaStreamSource_Interface
      ; RetVal : access Windows.Media.Protection.IMediaProtectionManager
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access IMediaStreamSource_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IMediaStreamSource_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_CanSeek
   (
      This       : access IMediaStreamSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanSeek
   (
      This       : access IMediaStreamSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_BufferTime
   (
      This       : access IMediaStreamSource_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_BufferTime
   (
      This       : access IMediaStreamSource_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function SetBufferedRange
   (
      This       : access IMediaStreamSource_Interface
      ; startOffset : Windows.Foundation.TimeSpan
      ; endOffset : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MusicProperties
   (
      This       : access IMediaStreamSource_Interface
      ; RetVal : access Windows.Storage.FileProperties.IMusicProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoProperties
   (
      This       : access IMediaStreamSource_Interface
      ; RetVal : access Windows.Storage.FileProperties.IVideoProperties
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access IMediaStreamSource_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IMediaStreamSource_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function AddProtectionKey
   (
      This       : access IMediaStreamSource_Interface
      ; streamDescriptor : Windows.Media.Core.IMediaStreamDescriptor
      ; keyIdentifier : Windows.UInt8_Ptr
      ; licenseData : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSource : aliased constant Windows.IID := (923981123, 17899, 16696, (170, 98, 192, 30, 38, 243, 132, 63 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SampleRendered
   (
      This       : access IMediaStreamSource2_Interface
      ; handler : TypedEventHandler_IMediaStreamSource2_add_SampleRendered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SampleRendered
   (
      This       : access IMediaStreamSource2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSource2 : aliased constant Windows.IID := (3965046957, 11882, 20340, (173, 187, 181, 98, 209, 83, 56, 73 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSource3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_MaxSupportedPlaybackRate
   (
      This       : access IMediaStreamSource3_Interface
      ; value : Windows.Foundation.IReference_Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSupportedPlaybackRate
   (
      This       : access IMediaStreamSource3_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSource3 : aliased constant Windows.IID := (1781147462, 15837, 19935, (161, 33, 148, 4, 94, 207, 148, 64 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSource4_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsLive
   (
      This       : access IMediaStreamSource4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLive
   (
      This       : access IMediaStreamSource4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSource4 : aliased constant Windows.IID := (487390379, 33549, 16764, (163, 169, 36, 84, 253, 100, 21, 199 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromDescriptor
   (
      This       : access IMediaStreamSourceFactory_Interface
      ; descriptor : Windows.Media.Core.IMediaStreamDescriptor
      ; RetVal : access Windows.Media.Core.IMediaStreamSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromDescriptors
   (
      This       : access IMediaStreamSourceFactory_Interface
      ; descriptor : Windows.Media.Core.IMediaStreamDescriptor
      ; descriptor2 : Windows.Media.Core.IMediaStreamDescriptor
      ; RetVal : access Windows.Media.Core.IMediaStreamSource
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceFactory : aliased constant Windows.IID := (4017610969, 53592, 19322, (134, 63, 32, 51, 66, 251, 253, 65 ));
   
   ------------------------------------------------------------------------
   type IMap_Guid_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_Guid_Object_Interface
      ; key : Windows.Guid
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_Guid_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_Guid_Object_Interface
      ; key : Windows.Guid
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_Guid_Object_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_Guid_Object_Interface
      ; key : Windows.Guid
      ; value : Windows.Guid
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_Guid_Object_Interface
      ; key : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_Guid_Object_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMap_Guid_Object : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSample_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Processed
   (
      This       : access IMediaStreamSample_Interface
      ; handler : TypedEventHandler_IMediaStreamSample_add_Processed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Processed
   (
      This       : access IMediaStreamSample_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Buffer
   (
      This       : access IMediaStreamSample_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access IMediaStreamSample_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedProperties
   (
      This       : access IMediaStreamSample_Interface
      ; RetVal : access Windows.Media.Core.IMap_Guid_Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Protection
   (
      This       : access IMediaStreamSample_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSampleProtectionProperties
   )
   return Windows.HRESULT is abstract;
   
   function put_DecodeTimestamp
   (
      This       : access IMediaStreamSample_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_DecodeTimestamp
   (
      This       : access IMediaStreamSample_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access IMediaStreamSample_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IMediaStreamSample_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyFrame
   (
      This       : access IMediaStreamSample_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyFrame
   (
      This       : access IMediaStreamSample_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Discontinuous
   (
      This       : access IMediaStreamSample_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Discontinuous
   (
      This       : access IMediaStreamSample_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSample : aliased constant Windows.IID := (1552791079, 19328, 17249, (152, 55, 108, 183, 72, 26, 217, 214 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSampleStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromBuffer
   (
      This       : access IMediaStreamSampleStatics_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; timestamp : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Media.Core.IMediaStreamSample
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStreamAsync
   (
      This       : access IMediaStreamSampleStatics_Interface
      ; stream : Windows.Storage.Streams.IInputStream
      ; count : Windows.UInt32
      ; timestamp : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Media.Core.IAsyncOperation_IMediaStreamSample -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSampleStatics : aliased constant Windows.IID := (3755942287, 42703, 17785, (190, 65, 115, 221, 148, 26, 217, 114 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSampleProtectionProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function SetKeyIdentifier
   (
      This       : access IMediaStreamSampleProtectionProperties_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetKeyIdentifier
   (
      This       : access IMediaStreamSampleProtectionProperties_Interface
      ; value : access Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function SetInitializationVector
   (
      This       : access IMediaStreamSampleProtectionProperties_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetInitializationVector
   (
      This       : access IMediaStreamSampleProtectionProperties_Interface
      ; value : access Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function SetSubSampleMapping
   (
      This       : access IMediaStreamSampleProtectionProperties_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetSubSampleMapping
   (
      This       : access IMediaStreamSampleProtectionProperties_Interface
      ; value : access Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSampleProtectionProperties : aliased constant Windows.IID := (1320714898, 60639, 18750, (132, 29, 221, 74, 221, 124, 172, 162 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceClosedRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IMediaStreamSourceClosedRequest_Interface
      ; RetVal : access Windows.Media.Core.MediaStreamSourceClosedReason
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceClosedRequest : aliased constant Windows.IID := (2424045801, 6307, 18769, (136, 122, 44, 30, 235, 213, 198, 158 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceClosedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IMediaStreamSourceClosedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSourceClosedRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceClosedEventArgs : aliased constant Windows.IID := (3448536754, 18454, 20004, (136, 240, 73, 30, 247, 56, 100, 6 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceStartingRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IMediaStreamSourceStartingRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceStartingRequestDeferral : aliased constant Windows.IID := (1058231973, 25408, 19908, (153, 16, 6, 142, 217, 245, 152, 248 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceStartingRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartPosition
   (
      This       : access IMediaStreamSourceStartingRequest_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaStreamSourceStartingRequest_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSourceStartingRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   function SetActualStartPosition
   (
      This       : access IMediaStreamSourceStartingRequest_Interface
      ; position : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceStartingRequest : aliased constant Windows.IID := (714118116, 13764, 19227, (167, 145, 13, 153, 219, 86, 221, 29 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceStartingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IMediaStreamSourceStartingEventArgs_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSourceStartingRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceStartingEventArgs : aliased constant Windows.IID := (4094978290, 49780, 18752, (165, 187, 40, 165, 114, 69, 47, 167 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceSampleRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IMediaStreamSourceSampleRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceSampleRequestDeferral : aliased constant Windows.IID := (2023083010, 63874, 17352, (157, 22, 198, 45, 153, 147, 25, 190 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceSampleRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StreamDescriptor
   (
      This       : access IMediaStreamSourceSampleRequest_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaStreamSourceSampleRequest_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSourceSampleRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   function put_Sample
   (
      This       : access IMediaStreamSourceSampleRequest_Interface
      ; value : Windows.Media.Core.IMediaStreamSample
   )
   return Windows.HRESULT is abstract;
   
   function get_Sample
   (
      This       : access IMediaStreamSourceSampleRequest_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSample
   )
   return Windows.HRESULT is abstract;
   
   function ReportSampleProgress
   (
      This       : access IMediaStreamSourceSampleRequest_Interface
      ; progress : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceSampleRequest : aliased constant Windows.IID := (1303593385, 13569, 19867, (131, 249, 143, 35, 92, 130, 37, 50 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceSampleRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IMediaStreamSourceSampleRequestedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSourceSampleRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceSampleRequestedEventArgs : aliased constant Windows.IID := (284801950, 29125, 18735, (132, 127, 13, 161, 243, 94, 129, 248 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceSwitchStreamsRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IMediaStreamSourceSwitchStreamsRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceSwitchStreamsRequestDeferral : aliased constant Windows.IID := (3202603061, 42245, 20378, (185, 67, 43, 140, 177, 180, 187, 217 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceSwitchStreamsRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldStreamDescriptor
   (
      This       : access IMediaStreamSourceSwitchStreamsRequest_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_NewStreamDescriptor
   (
      This       : access IMediaStreamSourceSwitchStreamsRequest_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaStreamSourceSwitchStreamsRequest_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceSwitchStreamsRequest : aliased constant Windows.IID := (1102610574, 14505, 20163, (155, 160, 182, 155, 133, 80, 30, 144 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceSwitchStreamsRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IMediaStreamSourceSwitchStreamsRequestedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceSwitchStreamsRequestedEventArgs : aliased constant Windows.IID := (1109404530, 28321, 18039, (152, 30, 53, 10, 13, 164, 18, 170 ));
   
   ------------------------------------------------------------------------
   type IMediaStreamSourceSampleRenderedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SampleLag
   (
      This       : access IMediaStreamSourceSampleRenderedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaStreamSourceSampleRenderedEventArgs : aliased constant Windows.IID := (2640935685, 54514, 19578, (157, 254, 141, 108, 208, 179, 238, 132 ));
   
   ------------------------------------------------------------------------
   type IMseStreamSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsContentTypeSupported
   (
      This       : access IMseStreamSourceStatics_Interface
      ; contentType : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IMseStreamSourceStatics : aliased constant Windows.IID := (1180460957, 54640, 17358, (186, 33, 11, 255, 95, 63, 189, 10 ));
   
   ------------------------------------------------------------------------
   type IMseStreamSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Opened
   (
      This       : access IMseStreamSource_Interface
      ; handler : TypedEventHandler_IMseStreamSource_add_Opened
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Opened
   (
      This       : access IMseStreamSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Ended
   (
      This       : access IMseStreamSource_Interface
      ; handler : TypedEventHandler_IMseStreamSource_add_Ended
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Ended
   (
      This       : access IMseStreamSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Closed
   (
      This       : access IMseStreamSource_Interface
      ; handler : TypedEventHandler_IMseStreamSource_add_Closed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access IMseStreamSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceBuffers
   (
      This       : access IMseStreamSource_Interface
      ; RetVal : access Windows.Media.Core.IMseSourceBufferList
   )
   return Windows.HRESULT is abstract;
   
   function get_ActiveSourceBuffers
   (
      This       : access IMseStreamSource_Interface
      ; RetVal : access Windows.Media.Core.IMseSourceBufferList
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadyState
   (
      This       : access IMseStreamSource_Interface
      ; RetVal : access Windows.Media.Core.MseReadyState
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IMseStreamSource_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access IMseStreamSource_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function AddSourceBuffer
   (
      This       : access IMseStreamSource_Interface
      ; mimeType : Windows.String
      ; RetVal : access Windows.Media.Core.IMseSourceBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveSourceBuffer
   (
      This       : access IMseStreamSource_Interface
      ; buffer : Windows.Media.Core.IMseSourceBuffer
   )
   return Windows.HRESULT is abstract;
   
   function EndOfStream
   (
      This       : access IMseStreamSource_Interface
      ; status : Windows.Media.Core.MseEndOfStreamStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IMseStreamSource : aliased constant Windows.IID := (2964593037, 756, 18723, (136, 221, 129, 188, 63, 54, 15, 250 ));
   
   ------------------------------------------------------------------------
   type IMseSourceBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function add_UpdateStarting
   (
      This       : access IMseSourceBuffer_Interface
      ; handler : TypedEventHandler_IMseSourceBuffer_add_UpdateStarting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UpdateStarting
   (
      This       : access IMseSourceBuffer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Updated
   (
      This       : access IMseSourceBuffer_Interface
      ; handler : TypedEventHandler_IMseSourceBuffer_add_Updated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Updated
   (
      This       : access IMseSourceBuffer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UpdateEnded
   (
      This       : access IMseSourceBuffer_Interface
      ; handler : TypedEventHandler_IMseSourceBuffer_add_UpdateEnded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UpdateEnded
   (
      This       : access IMseSourceBuffer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ErrorOccurred
   (
      This       : access IMseSourceBuffer_Interface
      ; handler : TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ErrorOccurred
   (
      This       : access IMseSourceBuffer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Aborted
   (
      This       : access IMseSourceBuffer_Interface
      ; handler : TypedEventHandler_IMseSourceBuffer_add_Aborted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Aborted
   (
      This       : access IMseSourceBuffer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Mode
   (
      This       : access IMseSourceBuffer_Interface
      ; RetVal : access Windows.Media.Core.MseAppendMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IMseSourceBuffer_Interface
      ; value : Windows.Media.Core.MseAppendMode
   )
   return Windows.HRESULT is abstract;
   
   function get_IsUpdating
   (
      This       : access IMseSourceBuffer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Buffered
   (
      This       : access IMseSourceBuffer_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_MseTimeRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TimestampOffset
   (
      This       : access IMseSourceBuffer_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_TimestampOffset
   (
      This       : access IMseSourceBuffer_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_AppendWindowStart
   (
      This       : access IMseSourceBuffer_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_AppendWindowStart
   (
      This       : access IMseSourceBuffer_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_AppendWindowEnd
   (
      This       : access IMseSourceBuffer_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_AppendWindowEnd
   (
      This       : access IMseSourceBuffer_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function AppendBuffer
   (
      This       : access IMseSourceBuffer_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function AppendStream
   (
      This       : access IMseSourceBuffer_Interface
      ; stream : Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function AppendStreamMaxSize
   (
      This       : access IMseSourceBuffer_Interface
      ; stream : Windows.Storage.Streams.IInputStream
      ; maxSize : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function Abort_x
   (
      This       : access IMseSourceBuffer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMseSourceBuffer_Interface
      ; start : Windows.Foundation.TimeSpan
      ; end_x : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_IMseSourceBuffer : aliased constant Windows.IID := (203072483, 57229, 16505, (163, 254, 104, 73, 24, 75, 78, 47 ));
   
   ------------------------------------------------------------------------
   type IMseSourceBufferList_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SourceBufferAdded
   (
      This       : access IMseSourceBufferList_Interface
      ; handler : TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceBufferAdded
   (
      This       : access IMseSourceBufferList_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceBufferRemoved
   (
      This       : access IMseSourceBufferList_Interface
      ; handler : TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceBufferRemoved
   (
      This       : access IMseSourceBufferList_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Buffers
   (
      This       : access IMseSourceBufferList_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_IMseSourceBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IMseSourceBufferList : aliased constant Windows.IID := (2516248807, 43239, 20159, (137, 39, 20, 94, 148, 11, 165, 17 ));
   
   ------------------------------------------------------------------------
   type IMseStreamSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LiveSeekableRange
   (
      This       : access IMseStreamSource2_Interface
      ; RetVal : access Windows.Media.Core.IReference_MseTimeRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_LiveSeekableRange
   (
      This       : access IMseStreamSource2_Interface
      ; value : Windows.Media.Core.IReference_MseTimeRange
   )
   return Windows.HRESULT is abstract;
   
   IID_IMseStreamSource2 : aliased constant Windows.IID := (1727364407, 63975, 16778, (156, 222, 160, 32, 233, 86, 85, 43 ));
   
   ------------------------------------------------------------------------
   type IMediaSourceAppServiceConnectionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IMediaSourceAppServiceConnectionFactory_Interface
      ; appServiceConnection : Windows.ApplicationModel.AppService.IAppServiceConnection
      ; RetVal : access Windows.Media.Core.IMediaSourceAppServiceConnection
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSourceAppServiceConnectionFactory : aliased constant Windows.IID := (1706627819, 32953, 17657, (156, 30, 225, 32, 246, 217, 40, 56 ));
   
   ------------------------------------------------------------------------
   type IMediaSourceAppServiceConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function add_InitializeMediaStreamSourceRequested
   (
      This       : access IMediaSourceAppServiceConnection_Interface
      ; handler : TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_InitializeMediaStreamSourceRequested
   (
      This       : access IMediaSourceAppServiceConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IMediaSourceAppServiceConnection_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSourceAppServiceConnection : aliased constant Windows.IID := (1642195607, 6422, 18448, (183, 244, 182, 66, 190, 130, 149, 150 ));
   
   ------------------------------------------------------------------------
   type IInitializeMediaStreamSourceRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access IInitializeMediaStreamSourceRequestedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSource
   )
   return Windows.HRESULT is abstract;
   
   function get_RandomAccessStream
   (
      This       : access IInitializeMediaStreamSourceRequestedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IInitializeMediaStreamSourceRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IInitializeMediaStreamSourceRequestedEventArgs : aliased constant Windows.IID := (633095649, 39688, 19502, (168, 85, 69, 66, 241, 167, 93, 235 ));
   
   ------------------------------------------------------------------------
   type IHighDynamicRangeControl_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Enabled
   (
      This       : access IHighDynamicRangeControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Enabled
   (
      This       : access IHighDynamicRangeControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IHighDynamicRangeControl : aliased constant Windows.IID := (1441900462, 55639, 19913, (157, 28, 133, 83, 168, 42, 125, 153 ));
   
   ------------------------------------------------------------------------
   type ISceneAnalysisEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HighDynamicRangeAnalyzer
   (
      This       : access ISceneAnalysisEffect_Interface
      ; RetVal : access Windows.Media.Core.IHighDynamicRangeControl
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredAnalysisInterval
   (
      This       : access ISceneAnalysisEffect_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredAnalysisInterval
   (
      This       : access ISceneAnalysisEffect_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function add_SceneAnalyzed
   (
      This       : access ISceneAnalysisEffect_Interface
      ; handler : TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SceneAnalyzed
   (
      This       : access ISceneAnalysisEffect_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ISceneAnalysisEffect : aliased constant Windows.IID := (3226182425, 51777, 18451, (191, 253, 123, 8, 176, 237, 37, 87 ));
   
   ------------------------------------------------------------------------
   type IHighDynamicRangeOutput_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Certainty
   (
      This       : access IHighDynamicRangeOutput_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameControllers
   (
      This       : access IHighDynamicRangeOutput_Interface
      ; RetVal : access Windows.Media.Devices.Core.IVectorView_IFrameController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IHighDynamicRangeOutput : aliased constant Windows.IID := (257392747, 9531, 16665, (187, 64, 58, 144, 229, 19, 132, 247 ));
   
   ------------------------------------------------------------------------
   type ISceneAnalysisEffectFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameControlValues
   (
      This       : access ISceneAnalysisEffectFrame_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedFrameControlValues
   )
   return Windows.HRESULT is abstract;
   
   function get_HighDynamicRange
   (
      This       : access ISceneAnalysisEffectFrame_Interface
      ; RetVal : access Windows.Media.Core.IHighDynamicRangeOutput
   )
   return Windows.HRESULT is abstract;
   
   IID_ISceneAnalysisEffectFrame : aliased constant Windows.IID := (3635482188, 32729, 17121, (133, 235, 101, 114, 194, 151, 201, 135 ));
   
   ------------------------------------------------------------------------
   type ISceneAnalysisEffectFrame2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AnalysisRecommendation
   (
      This       : access ISceneAnalysisEffectFrame2_Interface
      ; RetVal : access Windows.Media.Core.SceneAnalysisRecommendation
   )
   return Windows.HRESULT is abstract;
   
   IID_ISceneAnalysisEffectFrame2 : aliased constant Windows.IID := (760097214, 1567, 18350, (153, 21, 2, 82, 75, 95, 154, 95 ));
   
   ------------------------------------------------------------------------
   type ISceneAnalyzedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResultFrame
   (
      This       : access ISceneAnalyzedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.ISceneAnalysisEffectFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_ISceneAnalyzedEventArgs : aliased constant Windows.IID := (342594952, 10321, 17892, (173, 85, 68, 207, 141, 248, 219, 77 ));
   
   ------------------------------------------------------------------------
   type IFaceDetectionEffectFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DetectedFaces
   (
      This       : access IFaceDetectionEffectFrame_Interface
      ; RetVal : access Windows.Media.FaceAnalysis.IVectorView_IDetectedFace -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IFaceDetectionEffectFrame : aliased constant Windows.IID := (2326825363, 24008, 17531, (162, 71, 82, 112, 189, 128, 46, 206 ));
   
   ------------------------------------------------------------------------
   type IFaceDetectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResultFrame
   (
      This       : access IFaceDetectedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.IFaceDetectionEffectFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IFaceDetectedEventArgs : aliased constant Windows.IID := (428966950, 50779, 18106, (133, 248, 19, 136, 5, 118, 201, 10 ));
   
   ------------------------------------------------------------------------
   type IFaceDetectionEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Enabled
   (
      This       : access IFaceDetectionEffect_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Enabled
   (
      This       : access IFaceDetectionEffect_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredDetectionInterval
   (
      This       : access IFaceDetectionEffect_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredDetectionInterval
   (
      This       : access IFaceDetectionEffect_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function add_FaceDetected
   (
      This       : access IFaceDetectionEffect_Interface
      ; handler : TypedEventHandler_IFaceDetectionEffect_add_FaceDetected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FaceDetected
   (
      This       : access IFaceDetectionEffect_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IFaceDetectionEffect : aliased constant Windows.IID := (2920672210, 1346, 17065, (188, 144, 242, 131, 162, 159, 70, 193 ));
   
   ------------------------------------------------------------------------
   type IFaceDetectionEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function put_DetectionMode
   (
      This       : access IFaceDetectionEffectDefinition_Interface
      ; value : Windows.Media.Core.FaceDetectionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_DetectionMode
   (
      This       : access IFaceDetectionEffectDefinition_Interface
      ; RetVal : access Windows.Media.Core.FaceDetectionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_SynchronousDetectionEnabled
   (
      This       : access IFaceDetectionEffectDefinition_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SynchronousDetectionEnabled
   (
      This       : access IFaceDetectionEffectDefinition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IFaceDetectionEffectDefinition : aliased constant Windows.IID := (1138532481, 47176, 20275, (183, 2, 31, 210, 98, 79, 176, 22 ));
   
   ------------------------------------------------------------------------
   type IVideoStabilizationEffectEnabledChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IVideoStabilizationEffectEnabledChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.VideoStabilizationEffectEnabledChangedReason
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoStabilizationEffectEnabledChangedEventArgs : aliased constant Windows.IID := (410976040, 26555, 18195, (185, 0, 65, 104, 218, 22, 69, 41 ));
   
   ------------------------------------------------------------------------
   type IVideoStabilizationEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Enabled
   (
      This       : access IVideoStabilizationEffect_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Enabled
   (
      This       : access IVideoStabilizationEffect_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_EnabledChanged
   (
      This       : access IVideoStabilizationEffect_Interface
      ; handler : TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnabledChanged
   (
      This       : access IVideoStabilizationEffect_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetRecommendedStreamConfiguration
   (
      This       : access IVideoStabilizationEffect_Interface
      ; controller : Windows.Media.Devices.IVideoDeviceController
      ; desiredProperties : Windows.Media.MediaProperties.IVideoEncodingProperties
      ; RetVal : access Windows.Media.Capture.IVideoStreamConfiguration
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoStabilizationEffect : aliased constant Windows.IID := (134784592, 38552, 20055, (135, 123, 189, 124, 178, 238, 15, 138 ));
   
   ------------------------------------------------------------------------
   type IMediaSourceError_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedError
   (
      This       : access IMediaSourceError_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSourceError : aliased constant Windows.IID := (1544194405, 14277, 20125, (141, 33, 28, 222, 233, 12, 236, 198 ));
   
   ------------------------------------------------------------------------
   type IMediaSourceOpenOperationCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IMediaSourceOpenOperationCompletedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.IMediaSourceError
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSourceOpenOperationCompletedEventArgs : aliased constant Windows.IID := (4234685675, 57985, 18300, (168, 224, 26, 205, 101, 65, 20, 200 ));
   
   ------------------------------------------------------------------------
   type IMediaSourceStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldState
   (
      This       : access IMediaSourceStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.MediaSourceState
   )
   return Windows.HRESULT is abstract;
   
   function get_NewState
   (
      This       : access IMediaSourceStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.MediaSourceState
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSourceStateChangedEventArgs : aliased constant Windows.IID := (170962818, 36977, 19372, (188, 57, 202, 42, 147, 183, 23, 169 ));
   
   ------------------------------------------------------------------------
   type IMediaSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromAdaptiveMediaSource
   (
      This       : access IMediaSourceStatics_Interface
      ; mediaSource : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromMediaStreamSource
   (
      This       : access IMediaSourceStatics_Interface
      ; mediaSource : Windows.Media.Core.IMediaStreamSource
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromMseStreamSource
   (
      This       : access IMediaSourceStatics_Interface
      ; mediaSource : Windows.Media.Core.IMseStreamSource
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromIMediaSource
   (
      This       : access IMediaSourceStatics_Interface
      ; mediaSource : Windows.Media.Core.IMediaSource
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStorageFile
   (
      This       : access IMediaSourceStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStream
   (
      This       : access IMediaSourceStatics_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; contentType : Windows.String
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStreamReference
   (
      This       : access IMediaSourceStatics_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStreamReference
      ; contentType : Windows.String
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromUri
   (
      This       : access IMediaSourceStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSourceStatics : aliased constant Windows.IID := (4152192932, 18002, 16654, (177, 216, 233, 165, 226, 69, 164, 92 ));
   
   ------------------------------------------------------------------------
   type IMediaSourceStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromMediaBinder
   (
      This       : access IMediaSourceStatics2_Interface
      ; binder : Windows.Media.Core.IMediaBinder
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSourceStatics2 : aliased constant Windows.IID := (4007748004, 32531, 18582, (184, 203, 223, 13, 229, 188, 185, 241 ));
   
   ------------------------------------------------------------------------
   type IMediaSourceStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromMediaFrameSource
   (
      This       : access IMediaSourceStatics3_Interface
      ; frameSource : Windows.Media.Capture.Frames.IMediaFrameSource
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSourceStatics3 : aliased constant Windows.IID := (1161441494, 11242, 16674, (159, 115, 234, 206, 4, 82, 110, 53 ));
   
   ------------------------------------------------------------------------
   type IMediaBinder_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Binding
   (
      This       : access IMediaBinder_Interface
      ; handler : TypedEventHandler_IMediaBinder_add_Binding
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Binding
   (
      This       : access IMediaBinder_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Token
   (
      This       : access IMediaBinder_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Token
   (
      This       : access IMediaBinder_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access IMediaBinder_Interface
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBinder : aliased constant Windows.IID := (729694378, 56839, 16975, (131, 241, 241, 222, 70, 196, 250, 46 ));
   
   ------------------------------------------------------------------------
   type IMediaBindingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Canceled
   (
      This       : access IMediaBindingEventArgs_Interface
      ; handler : TypedEventHandler_IMediaBindingEventArgs_add_Canceled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Canceled
   (
      This       : access IMediaBindingEventArgs_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaBinder
   (
      This       : access IMediaBindingEventArgs_Interface
      ; RetVal : access Windows.Media.Core.IMediaBinder
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaBindingEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   function SetUri
   (
      This       : access IMediaBindingEventArgs_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function SetStream
   (
      This       : access IMediaBindingEventArgs_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; contentType : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetStreamReference
   (
      This       : access IMediaBindingEventArgs_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStreamReference
      ; contentType : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBindingEventArgs : aliased constant Windows.IID := (3055333978, 7021, 17968, (168, 109, 47, 8, 55, 247, 18, 229 ));
   
   ------------------------------------------------------------------------
   type IMediaBindingEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function SetAdaptiveMediaSource
   (
      This       : access IMediaBindingEventArgs2_Interface
      ; mediaSource : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
   )
   return Windows.HRESULT is abstract;
   
   function SetStorageFile
   (
      This       : access IMediaBindingEventArgs2_Interface
      ; file : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBindingEventArgs2 : aliased constant Windows.IID := (73714923, 47962, 18479, (184, 186, 240, 40, 76, 105, 101, 103 ));
   
   ------------------------------------------------------------------------
   type IMediaSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_OpenOperationCompleted
   (
      This       : access IMediaSource2_Interface
      ; handler : TypedEventHandler_IMediaSource2_add_OpenOperationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OpenOperationCompleted
   (
      This       : access IMediaSource2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomProperties
   (
      This       : access IMediaSource2_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IMediaSource2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOpen
   (
      This       : access IMediaSource2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExternalTimedTextSources
   (
      This       : access IMediaSource2_Interface
      ; RetVal : access Windows.Media.Core.IObservableVector_ITimedTextSource -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ExternalTimedMetadataTracks
   (
      This       : access IMediaSource2_Interface
      ; RetVal : access Windows.Media.Core.IObservableVector_ITimedMetadataTrack -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSource2 : aliased constant Windows.IID := (783683656, 25951, 19511, (184, 19, 180, 228, 93, 250, 10, 190 ));
   
   ------------------------------------------------------------------------
   type IMediaSource3_Interface is interface and Windows.IInspectable_Interface;
   
   function add_StateChanged
   (
      This       : access IMediaSource3_Interface
      ; handler : TypedEventHandler_IMediaSource3_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access IMediaSource3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IMediaSource3_Interface
      ; RetVal : access Windows.Media.Core.MediaSourceState
   )
   return Windows.HRESULT is abstract;
   
   function Reset
   (
      This       : access IMediaSource3_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSource3 : aliased constant Windows.IID := (3047099803, 19310, 16877, (187, 180, 124, 117, 9, 169, 148, 173 ));
   
   ------------------------------------------------------------------------
   type IMediaSource4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AdaptiveMediaSource
   (
      This       : access IMediaSource4_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaStreamSource
   (
      This       : access IMediaSource4_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSource
   )
   return Windows.HRESULT is abstract;
   
   function get_MseStreamSource
   (
      This       : access IMediaSource4_Interface
      ; RetVal : access Windows.Media.Core.IMseStreamSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IMediaSource4_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function OpenAsync
   (
      This       : access IMediaSource4_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaSource4 : aliased constant Windows.IID := (3182406999, 36607, 19555, (133, 166, 132, 222, 10, 227, 228, 242 ));
   
   ------------------------------------------------------------------------
   type ISingleSelectMediaTrackList_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SelectedIndexChanged
   (
      This       : access ISingleSelectMediaTrackList_Interface
      ; handler : TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SelectedIndexChanged
   (
      This       : access ISingleSelectMediaTrackList_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedIndex
   (
      This       : access ISingleSelectMediaTrackList_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedIndex
   (
      This       : access ISingleSelectMediaTrackList_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_ISingleSelectMediaTrackList : aliased constant Windows.IID := (1998614303, 49999, 18767, (128, 119, 43, 173, 159, 244, 236, 241 ));
   
   ------------------------------------------------------------------------
   type IMediaTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IMediaTrack_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access IMediaTrack_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TrackKind
   (
      This       : access IMediaTrack_Interface
      ; RetVal : access Windows.Media.Core.MediaTrackKind
   )
   return Windows.HRESULT is abstract;
   
   function put_Label
   (
      This       : access IMediaTrack_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Label
   (
      This       : access IMediaTrack_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaTrack : aliased constant Windows.IID := (65141500, 51505, 18714, (180, 107, 193, 14, 232, 194, 86, 183 ));
   
   ------------------------------------------------------------------------
   type ITimedMetadataTrackError_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ErrorCode
   (
      This       : access ITimedMetadataTrackError_Interface
      ; RetVal : access Windows.Media.Core.TimedMetadataTrackErrorCode
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access ITimedMetadataTrackError_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedMetadataTrackError : aliased constant Windows.IID := (3010885909, 16660, 18457, (185, 217, 221, 118, 8, 158, 114, 248 ));
   
   ------------------------------------------------------------------------
   type IMediaCueEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Cue
   (
      This       : access IMediaCueEventArgs_Interface
      ; RetVal : access Windows.Media.Core.IMediaCue
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaCueEventArgs : aliased constant Windows.IID := (3509536759, 24484, 20072, (159, 229, 50, 22, 13, 206, 229, 126 ));
   
   ------------------------------------------------------------------------
   type ITimedMetadataTrackFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access ITimedMetadataTrackFailedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.ITimedMetadataTrackError
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedMetadataTrackFailedEventArgs : aliased constant Windows.IID := (2776615377, 26505, 19789, (176, 127, 132, 180, 243, 26, 203, 112 ));
   
   ------------------------------------------------------------------------
   type ITimedMetadataTrackFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ITimedMetadataTrackFactory_Interface
      ; id : Windows.String
      ; language : Windows.String
      ; kind : Windows.Media.Core.TimedMetadataKind
      ; RetVal : access Windows.Media.Core.ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedMetadataTrackFactory : aliased constant Windows.IID := (2379576849, 38835, 19999, (133, 44, 15, 72, 44, 129, 173, 38 ));
   
   ------------------------------------------------------------------------
   type ITimedMetadataTrackProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TimedMetadataTracks
   (
      This       : access ITimedMetadataTrackProvider_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_ITimedMetadataTrack -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedMetadataTrackProvider : aliased constant Windows.IID := (998187044, 63310, 19166, (147, 197, 33, 157, 160, 91, 104, 86 ));
   
   ------------------------------------------------------------------------
   type ITimedMetadataTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function add_CueEntered
   (
      This       : access ITimedMetadataTrack_Interface
      ; handler : TypedEventHandler_ITimedMetadataTrack_add_CueEntered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CueEntered
   (
      This       : access ITimedMetadataTrack_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CueExited
   (
      This       : access ITimedMetadataTrack_Interface
      ; handler : TypedEventHandler_ITimedMetadataTrack_add_CueExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CueExited
   (
      This       : access ITimedMetadataTrack_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TrackFailed
   (
      This       : access ITimedMetadataTrack_Interface
      ; handler : TypedEventHandler_ITimedMetadataTrack_add_TrackFailed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TrackFailed
   (
      This       : access ITimedMetadataTrack_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Cues
   (
      This       : access ITimedMetadataTrack_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_IMediaCue -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ActiveCues
   (
      This       : access ITimedMetadataTrack_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_IMediaCue -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TimedMetadataKind
   (
      This       : access ITimedMetadataTrack_Interface
      ; RetVal : access Windows.Media.Core.TimedMetadataKind
   )
   return Windows.HRESULT is abstract;
   
   function get_DispatchType
   (
      This       : access ITimedMetadataTrack_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddCue
   (
      This       : access ITimedMetadataTrack_Interface
      ; cue : Windows.Media.Core.IMediaCue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveCue
   (
      This       : access ITimedMetadataTrack_Interface
      ; cue : Windows.Media.Core.IMediaCue
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedMetadataTrack : aliased constant Windows.IID := (2657807774, 63098, 18857, (179, 48, 207, 3, 176, 233, 207, 7 ));
   
   ------------------------------------------------------------------------
   type ITimedTextSourceResolveResultEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access ITimedTextSourceResolveResultEventArgs_Interface
      ; RetVal : access Windows.Media.Core.ITimedMetadataTrackError
   )
   return Windows.HRESULT is abstract;
   
   function get_Tracks
   (
      This       : access ITimedTextSourceResolveResultEventArgs_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_ITimedMetadataTrack -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedTextSourceResolveResultEventArgs : aliased constant Windows.IID := (1217428636, 56536, 19507, (154, 211, 108, 220, 231, 177, 197, 102 ));
   
   ------------------------------------------------------------------------
   type ITimedTextSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Resolved
   (
      This       : access ITimedTextSource_Interface
      ; handler : TypedEventHandler_ITimedTextSource_add_Resolved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Resolved
   (
      This       : access ITimedTextSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedTextSource : aliased constant Windows.IID := (3303906214, 4127, 16461, (169, 73, 130, 243, 63, 205, 147, 183 ));
   
   ------------------------------------------------------------------------
   type ITimedTextSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromStream
   (
      This       : access ITimedTextSourceStatics_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromUri
   (
      This       : access ITimedTextSourceStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStreamWithLanguage
   (
      This       : access ITimedTextSourceStatics_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; defaultLanguage : Windows.String
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromUriWithLanguage
   (
      This       : access ITimedTextSourceStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; defaultLanguage : Windows.String
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedTextSourceStatics : aliased constant Windows.IID := (2117146707, 39610, 19140, (187, 152, 47, 177, 118, 195, 191, 221 ));
   
   ------------------------------------------------------------------------
   type ITimedTextSourceStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromStreamWithIndex
   (
      This       : access ITimedTextSourceStatics2_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; indexStream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromUriWithIndex
   (
      This       : access ITimedTextSourceStatics2_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; indexUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStreamWithIndexAndLanguage
   (
      This       : access ITimedTextSourceStatics2_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; indexStream : Windows.Storage.Streams.IRandomAccessStream
      ; defaultLanguage : Windows.String
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromUriWithIndexAndLanguage
   (
      This       : access ITimedTextSourceStatics2_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; indexUri : Windows.Foundation.IUriRuntimeClass
      ; defaultLanguage : Windows.String
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedTextSourceStatics2 : aliased constant Windows.IID := (3060495874, 37438, 17402, (150, 51, 88, 112, 117, 129, 45, 181 ));
   
   ------------------------------------------------------------------------
   type IVideoTrackSupportInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DecoderStatus
   (
      This       : access IVideoTrackSupportInfo_Interface
      ; RetVal : access Windows.Media.Core.MediaDecoderStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaSourceStatus
   (
      This       : access IVideoTrackSupportInfo_Interface
      ; RetVal : access Windows.Media.Core.MediaSourceStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoTrackSupportInfo : aliased constant Windows.IID := (1270166688, 64607, 17677, (143, 240, 119, 141, 89, 4, 134, 222 ));
   
   ------------------------------------------------------------------------
   type IAudioTrackSupportInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DecoderStatus
   (
      This       : access IAudioTrackSupportInfo_Interface
      ; RetVal : access Windows.Media.Core.MediaDecoderStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Degradation
   (
      This       : access IAudioTrackSupportInfo_Interface
      ; RetVal : access Windows.Media.Core.AudioDecoderDegradation
   )
   return Windows.HRESULT is abstract;
   
   function get_DegradationReason
   (
      This       : access IAudioTrackSupportInfo_Interface
      ; RetVal : access Windows.Media.Core.AudioDecoderDegradationReason
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaSourceStatus
   (
      This       : access IAudioTrackSupportInfo_Interface
      ; RetVal : access Windows.Media.Core.MediaSourceStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAudioTrackSupportInfo : aliased constant Windows.IID := (395046903, 52281, 17574, (185, 81, 74, 86, 83, 240, 115, 250 ));
   
   ------------------------------------------------------------------------
   type IVideoTrackOpenFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedError
   (
      This       : access IVideoTrackOpenFailedEventArgs_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoTrackOpenFailedEventArgs : aliased constant Windows.IID := (1987699249, 1273, 19586, (164, 238, 134, 2, 200, 187, 71, 84 ));
   
   ------------------------------------------------------------------------
   type IAudioTrackOpenFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedError
   (
      This       : access IAudioTrackOpenFailedEventArgs_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAudioTrackOpenFailedEventArgs : aliased constant Windows.IID := (4007508409, 47996, 16658, (191, 118, 147, 132, 103, 111, 130, 75 ));
   
   ------------------------------------------------------------------------
   type IVideoTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function add_OpenFailed
   (
      This       : access IVideoTrack_Interface
      ; handler : TypedEventHandler_IVideoTrack_add_OpenFailed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OpenFailed
   (
      This       : access IVideoTrack_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetEncodingProperties
   (
      This       : access IVideoTrack_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackItem
   (
      This       : access IVideoTrack_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IVideoTrack_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportInfo
   (
      This       : access IVideoTrack_Interface
      ; RetVal : access Windows.Media.Core.IVideoTrackSupportInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoTrack : aliased constant Windows.IID := (2582886387, 58008, 17302, (187, 106, 165, 27, 230, 162, 162, 10 ));
   
   ------------------------------------------------------------------------
   type IAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function add_OpenFailed
   (
      This       : access IAudioTrack_Interface
      ; handler : TypedEventHandler_IAudioTrack_add_OpenFailed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OpenFailed
   (
      This       : access IAudioTrack_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetEncodingProperties
   (
      This       : access IAudioTrack_Interface
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackItem
   (
      This       : access IAudioTrack_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IAudioTrack_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportInfo
   (
      This       : access IAudioTrack_Interface
      ; RetVal : access Windows.Media.Core.IAudioTrackSupportInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IAudioTrack : aliased constant Windows.IID := (4063981175, 16119, 16606, (185, 67, 6, 139, 19, 33, 112, 29 ));
   
   ------------------------------------------------------------------------
   type ITimedMetadataTrack2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PlaybackItem
   (
      This       : access ITimedMetadataTrack2_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access ITimedMetadataTrack2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedMetadataTrack2 : aliased constant Windows.IID := (565491272, 40861, 16570, (168, 243, 26, 146, 117, 58, 239, 11 ));
   
   ------------------------------------------------------------------------
   type IVideoEffectDefinition_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivatableClassId
   (
      This       : access IVideoEffectDefinition_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IVideoEffectDefinition_Imported_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IMediaPlaybackSource_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   type IIterator_ITimedTextLine_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ITimedTextLine_Interface
      ; RetVal : access Windows.Media.Core.ITimedTextLine
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ITimedTextLine_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ITimedTextLine_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ITimedTextLine_Interface
      ; items : Windows.Media.Core.ITimedTextLine_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ITimedTextLine : aliased constant Windows.IID := (2227502252, 34520, 23668, (161, 56, 217, 191, 55, 183, 73, 236 ));
   
   ------------------------------------------------------------------------
   type IIterable_ITimedTextLine_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ITimedTextLine_Interface
      ; RetVal : access Windows.Media.Core.IIterator_ITimedTextLine
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ITimedTextLine : aliased constant Windows.IID := (2932281517, 15320, 23129, (174, 119, 231, 252, 70, 251, 16, 91 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ITimedTextLine_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ITimedTextLine_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.ITimedTextLine
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ITimedTextLine_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ITimedTextLine_Interface
      ; value : Windows.Media.Core.ITimedTextLine
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ITimedTextLine_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.ITimedTextLine_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ITimedTextLine : aliased constant Windows.IID := (2503128524, 29692, 24122, (133, 49, 121, 76, 48, 215, 161, 174 ));
   
   ------------------------------------------------------------------------
   type IVector_ITimedTextLine_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ITimedTextLine_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.ITimedTextLine
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ITimedTextLine_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ITimedTextLine_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_ITimedTextLine
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ITimedTextLine_Interface
      ; value : Windows.Media.Core.ITimedTextLine
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ITimedTextLine_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.ITimedTextLine
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ITimedTextLine_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.ITimedTextLine
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ITimedTextLine_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ITimedTextLine_Interface
      ; value : Windows.Media.Core.ITimedTextLine
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ITimedTextLine_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ITimedTextLine_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ITimedTextLine_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.ITimedTextLine_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ITimedTextLine_Interface
      ; items : Windows.Media.Core.ITimedTextLine_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ITimedTextLine : aliased constant Windows.IID := (676267073, 59757, 22701, (145, 136, 123, 244, 101, 20, 223, 204 ));
   
   ------------------------------------------------------------------------
   type IIterator_ITimedTextSubformat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ITimedTextSubformat_Interface
      ; RetVal : access Windows.Media.Core.ITimedTextSubformat
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ITimedTextSubformat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ITimedTextSubformat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ITimedTextSubformat_Interface
      ; items : Windows.Media.Core.ITimedTextSubformat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ITimedTextSubformat : aliased constant Windows.IID := (1695571536, 34396, 22813, (155, 244, 150, 35, 125, 226, 83, 63 ));
   
   ------------------------------------------------------------------------
   type IIterable_ITimedTextSubformat_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ITimedTextSubformat_Interface
      ; RetVal : access Windows.Media.Core.IIterator_ITimedTextSubformat
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ITimedTextSubformat : aliased constant Windows.IID := (3471027779, 51516, 22263, (140, 85, 144, 36, 222, 215, 44, 118 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ITimedTextSubformat_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ITimedTextSubformat_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.ITimedTextSubformat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ITimedTextSubformat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ITimedTextSubformat_Interface
      ; value : Windows.Media.Core.ITimedTextSubformat
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ITimedTextSubformat_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.ITimedTextSubformat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ITimedTextSubformat : aliased constant Windows.IID := (1092226598, 17122, 24165, (185, 196, 152, 12, 76, 63, 49, 247 ));
   
   ------------------------------------------------------------------------
   type IVector_ITimedTextSubformat_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ITimedTextSubformat_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.ITimedTextSubformat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ITimedTextSubformat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ITimedTextSubformat_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_ITimedTextSubformat
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ITimedTextSubformat_Interface
      ; value : Windows.Media.Core.ITimedTextSubformat
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ITimedTextSubformat_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.ITimedTextSubformat
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ITimedTextSubformat_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.ITimedTextSubformat
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ITimedTextSubformat_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ITimedTextSubformat_Interface
      ; value : Windows.Media.Core.ITimedTextSubformat
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ITimedTextSubformat_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ITimedTextSubformat_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ITimedTextSubformat_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.ITimedTextSubformat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ITimedTextSubformat_Interface
      ; items : Windows.Media.Core.ITimedTextSubformat_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ITimedTextSubformat : aliased constant Windows.IID := (2273768338, 62313, 22506, (161, 110, 117, 135, 2, 70, 168, 201 ));
   
   ------------------------------------------------------------------------
   type IIterator_IAudioStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAudioStreamDescriptor_Interface
      ; RetVal : access Windows.Media.Core.IAudioStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAudioStreamDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAudioStreamDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAudioStreamDescriptor_Interface
      ; items : Windows.Media.Core.IAudioStreamDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IAudioStreamDescriptor : aliased constant Windows.IID := (2786726349, 45870, 20875, (166, 167, 84, 114, 203, 224, 14, 131 ));
   
   ------------------------------------------------------------------------
   type IIterable_IAudioStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAudioStreamDescriptor_Interface
      ; RetVal : access Windows.Media.Core.IIterator_IAudioStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IAudioStreamDescriptor : aliased constant Windows.IID := (2749548914, 41329, 23444, (131, 137, 233, 131, 235, 195, 243, 185 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IAudioStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAudioStreamDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.IAudioStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAudioStreamDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAudioStreamDescriptor_Interface
      ; value : Windows.Media.Core.IAudioStreamDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAudioStreamDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.IAudioStreamDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IAudioStreamDescriptor : aliased constant Windows.IID := (873418733, 4744, 23433, (190, 124, 195, 85, 254, 28, 228, 217 ));
   
   ------------------------------------------------------------------------
   type IVector_IAudioStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.IAudioStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_IAudioStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
      ; value : Windows.Media.Core.IAudioStreamDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.IAudioStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.IAudioStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
      ; value : Windows.Media.Core.IAudioStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.IAudioStreamDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IAudioStreamDescriptor_Interface
      ; items : Windows.Media.Core.IAudioStreamDescriptor_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IAudioStreamDescriptor : aliased constant Windows.IID := (1169146153, 39052, 24350, (156, 23, 110, 52, 185, 23, 205, 27 ));
   
   ------------------------------------------------------------------------
   type IIterator_IVideoStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVideoStreamDescriptor_Interface
      ; RetVal : access Windows.Media.Core.IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVideoStreamDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVideoStreamDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVideoStreamDescriptor_Interface
      ; items : Windows.Media.Core.IVideoStreamDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IVideoStreamDescriptor : aliased constant Windows.IID := (3662785340, 15460, 21596, (163, 244, 249, 176, 85, 170, 247, 217 ));
   
   ------------------------------------------------------------------------
   type IIterable_IVideoStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVideoStreamDescriptor_Interface
      ; RetVal : access Windows.Media.Core.IIterator_IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IVideoStreamDescriptor : aliased constant Windows.IID := (986443836, 2681, 22563, (170, 169, 216, 139, 195, 248, 245, 148 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IVideoStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVideoStreamDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVideoStreamDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVideoStreamDescriptor_Interface
      ; value : Windows.Media.Core.IVideoStreamDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVideoStreamDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.IVideoStreamDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IVideoStreamDescriptor : aliased constant Windows.IID := (3915761839, 53777, 21232, (131, 139, 70, 55, 70, 157, 167, 175 ));
   
   ------------------------------------------------------------------------
   type IVector_IVideoStreamDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
      ; value : Windows.Media.Core.IVideoStreamDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
      ; value : Windows.Media.Core.IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.IVideoStreamDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVideoStreamDescriptor_Interface
      ; items : Windows.Media.Core.IVideoStreamDescriptor_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IVideoStreamDescriptor : aliased constant Windows.IID := (531653811, 25452, 22920, (156, 151, 2, 169, 183, 97, 80, 246 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IMediaStreamSample_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMediaStreamSample_Interface
      ; handler : Windows.Media.Core.AsyncOperationCompletedHandler_IMediaStreamSample
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMediaStreamSample_Interface
      ; RetVal : access Windows.Media.Core.AsyncOperationCompletedHandler_IMediaStreamSample
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMediaStreamSample_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSample
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IMediaStreamSample : aliased constant Windows.IID := (1021075078, 19162, 24311, (150, 122, 225, 55, 164, 98, 25, 7 ));
   
   ------------------------------------------------------------------------
   type IIterator_MseTimeRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_MseTimeRange_Interface
      ; RetVal : access Windows.Media.Core.MseTimeRange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_MseTimeRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_MseTimeRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_MseTimeRange_Interface
      ; items : Windows.Media.Core.MseTimeRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_MseTimeRange : aliased constant Windows.IID := (2460182610, 64435, 23368, (180, 236, 1, 221, 160, 151, 42, 92 ));
   
   ------------------------------------------------------------------------
   type IIterable_MseTimeRange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_MseTimeRange_Interface
      ; RetVal : access Windows.Media.Core.IIterator_MseTimeRange
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_MseTimeRange : aliased constant Windows.IID := (3977014792, 57903, 23234, (186, 20, 224, 255, 29, 243, 70, 127 ));
   
   ------------------------------------------------------------------------
   type IVectorView_MseTimeRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_MseTimeRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.MseTimeRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_MseTimeRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_MseTimeRange_Interface
      ; value : Windows.Media.Core.MseTimeRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_MseTimeRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.MseTimeRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_MseTimeRange : aliased constant Windows.IID := (2281643473, 32451, 23493, (181, 88, 4, 37, 216, 6, 191, 75 ));
   
   ------------------------------------------------------------------------
   type IIterator_IMseSourceBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMseSourceBuffer_Interface
      ; RetVal : access Windows.Media.Core.IMseSourceBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMseSourceBuffer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMseSourceBuffer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMseSourceBuffer_Interface
      ; items : Windows.Media.Core.IMseSourceBuffer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IMseSourceBuffer : aliased constant Windows.IID := (1392993665, 425, 20921, (152, 204, 82, 101, 80, 76, 211, 82 ));
   
   ------------------------------------------------------------------------
   type IIterable_IMseSourceBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMseSourceBuffer_Interface
      ; RetVal : access Windows.Media.Core.IIterator_IMseSourceBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IMseSourceBuffer : aliased constant Windows.IID := (1554045574, 25351, 21898, (134, 95, 58, 30, 249, 254, 86, 179 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IMseSourceBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMseSourceBuffer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.IMseSourceBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMseSourceBuffer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMseSourceBuffer_Interface
      ; value : Windows.Media.Core.IMseSourceBuffer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMseSourceBuffer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.IMseSourceBuffer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IMseSourceBuffer : aliased constant Windows.IID := (2234614371, 4960, 23672, (176, 173, 82, 214, 180, 91, 25, 243 ));
   
   ------------------------------------------------------------------------
   type IReference_MseTimeRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_MseTimeRange_Interface
      ; RetVal : access Windows.Media.Core.MseTimeRange
   )
   return Windows.HRESULT is abstract;
   
   IID_IReference_MseTimeRange : aliased constant Windows.IID := (805294337, 5880, 22893, (168, 142, 101, 155, 111, 88, 70, 65 ));
   
   ------------------------------------------------------------------------
   type IIterator_ITimedTextSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ITimedTextSource_Interface
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ITimedTextSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ITimedTextSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ITimedTextSource_Interface
      ; items : Windows.Media.Core.ITimedTextSource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ITimedTextSource : aliased constant Windows.IID := (3185498048, 23667, 22517, (155, 8, 101, 41, 51, 88, 109, 213 ));
   
   ------------------------------------------------------------------------
   type IIterable_ITimedTextSource_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ITimedTextSource_Interface
      ; RetVal : access Windows.Media.Core.IIterator_ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ITimedTextSource : aliased constant Windows.IID := (1338339970, 3807, 23941, (157, 137, 221, 194, 165, 105, 44, 19 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ITimedTextSource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ITimedTextSource_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ITimedTextSource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ITimedTextSource_Interface
      ; value : Windows.Media.Core.ITimedTextSource
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ITimedTextSource_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.ITimedTextSource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ITimedTextSource : aliased constant Windows.IID := (3989660494, 47076, 24568, (184, 194, 132, 147, 132, 155, 44, 13 ));
   
   ------------------------------------------------------------------------
   type IVector_ITimedTextSource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ITimedTextSource_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ITimedTextSource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ITimedTextSource_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ITimedTextSource_Interface
      ; value : Windows.Media.Core.ITimedTextSource
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ITimedTextSource_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ITimedTextSource_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ITimedTextSource_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ITimedTextSource_Interface
      ; value : Windows.Media.Core.ITimedTextSource
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ITimedTextSource_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ITimedTextSource_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ITimedTextSource_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.ITimedTextSource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ITimedTextSource_Interface
      ; items : Windows.Media.Core.ITimedTextSource_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ITimedTextSource : aliased constant Windows.IID := (3500614520, 21554, 20671, (147, 195, 197, 243, 95, 201, 53, 23 ));
   
   ------------------------------------------------------------------------
   type IObservableVector_ITimedTextSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VectorChanged
   (
      This       : access IObservableVector_ITimedTextSource_Interface
      ; vhnd : Windows.Media.Core.VectorChangedEventHandler_ITimedTextSource
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VectorChanged
   (
      This       : access IObservableVector_ITimedTextSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IObservableVector_ITimedTextSource : aliased constant Windows.IID := (2514929746, 28316, 20649, (137, 53, 5, 67, 32, 36, 41, 69 ));
   
   ------------------------------------------------------------------------
   type IIterator_ITimedMetadataTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ITimedMetadataTrack_Interface
      ; RetVal : access Windows.Media.Core.ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ITimedMetadataTrack_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ITimedMetadataTrack_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ITimedMetadataTrack_Interface
      ; items : Windows.Media.Core.ITimedMetadataTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ITimedMetadataTrack : aliased constant Windows.IID := (2241025253, 1915, 23891, (178, 151, 26, 7, 185, 127, 9, 195 ));
   
   ------------------------------------------------------------------------
   type IIterable_ITimedMetadataTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ITimedMetadataTrack_Interface
      ; RetVal : access Windows.Media.Core.IIterator_ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ITimedMetadataTrack : aliased constant Windows.IID := (352994388, 955, 24017, (129, 83, 106, 96, 14, 133, 31, 113 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ITimedMetadataTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ITimedMetadataTrack_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ITimedMetadataTrack_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ITimedMetadataTrack_Interface
      ; value : Windows.Media.Core.ITimedMetadataTrack
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ITimedMetadataTrack_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.ITimedMetadataTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ITimedMetadataTrack : aliased constant Windows.IID := (51621498, 10243, 23877, (181, 161, 160, 252, 92, 213, 94, 124 ));
   
   ------------------------------------------------------------------------
   type IVector_ITimedMetadataTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ITimedMetadataTrack_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ITimedMetadataTrack_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ITimedMetadataTrack_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ITimedMetadataTrack_Interface
      ; value : Windows.Media.Core.ITimedMetadataTrack
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ITimedMetadataTrack_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ITimedMetadataTrack_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Core.ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ITimedMetadataTrack_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ITimedMetadataTrack_Interface
      ; value : Windows.Media.Core.ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ITimedMetadataTrack_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ITimedMetadataTrack_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ITimedMetadataTrack_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.ITimedMetadataTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ITimedMetadataTrack_Interface
      ; items : Windows.Media.Core.ITimedMetadataTrack_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ITimedMetadataTrack : aliased constant Windows.IID := (3295518260, 59921, 23474, (151, 68, 22, 23, 65, 126, 240, 22 ));
   
   ------------------------------------------------------------------------
   type IObservableVector_ITimedMetadataTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VectorChanged
   (
      This       : access IObservableVector_ITimedMetadataTrack_Interface
      ; vhnd : Windows.Media.Core.VectorChangedEventHandler_ITimedMetadataTrack
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VectorChanged
   (
      This       : access IObservableVector_ITimedMetadataTrack_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IObservableVector_ITimedMetadataTrack : aliased constant Windows.IID := (2565598120, 26201, 23282, (190, 79, 50, 253, 238, 222, 59, 119 ));
   
   ------------------------------------------------------------------------
   type IIterator_IMediaCue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaCue_Interface
      ; RetVal : access Windows.Media.Core.IMediaCue
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaCue_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaCue_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaCue_Interface
      ; items : Windows.Media.Core.IMediaCue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IMediaCue : aliased constant Windows.IID := (442060232, 42571, 21997, (155, 52, 123, 39, 78, 29, 92, 112 ));
   
   ------------------------------------------------------------------------
   type IIterable_IMediaCue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaCue_Interface
      ; RetVal : access Windows.Media.Core.IIterator_IMediaCue
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IMediaCue : aliased constant Windows.IID := (1937383576, 16831, 23967, (161, 210, 47, 23, 28, 87, 139, 60 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IMediaCue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaCue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.IMediaCue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaCue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaCue_Interface
      ; value : Windows.Media.Core.IMediaCue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaCue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.IMediaCue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IMediaCue : aliased constant Windows.IID := (2573476257, 25180, 23954, (173, 104, 139, 57, 17, 210, 148, 176 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaStreamSource_add_Closed_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaStreamSource ; args : Windows.Media.Core.IMediaStreamSourceClosedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaStreamSource_add_Closed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaStreamSource_add_Closed_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Media.Core.IMediaStreamSourceClosedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaStreamSource_add_Closed : aliased constant Windows.IID := (596427345, 53432, 23092, (129, 212, 13, 209, 249, 54, 162, 13 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaStreamSource_add_Starting_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaStreamSource ; args : Windows.Media.Core.IMediaStreamSourceStartingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaStreamSource_add_Starting_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaStreamSource_add_Starting_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Media.Core.IMediaStreamSourceStartingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaStreamSource_add_Starting : aliased constant Windows.IID := (2839369798, 50784, 22638, (182, 181, 165, 47, 184, 31, 146, 64 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaStreamSource_add_Paused_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaStreamSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaStreamSource_add_Paused_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaStreamSource_add_Paused_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaStreamSource_add_Paused : aliased constant Windows.IID := (1876352727, 16923, 24309, (139, 245, 237, 234, 69, 64, 22, 101 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaStreamSource_add_SampleRequested_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaStreamSource ; args : Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaStreamSource_add_SampleRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaStreamSource_add_SampleRequested_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaStreamSource_add_SampleRequested : aliased constant Windows.IID := (1327119075, 47287, 22153, (144, 29, 176, 182, 35, 245, 161, 114 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaStreamSource ; args : Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested : aliased constant Windows.IID := (1160457802, 21777, 23356, (138, 142, 238, 101, 149, 118, 164, 193 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaStreamSource2_add_SampleRendered_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaStreamSource ; args : Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaStreamSource2_add_SampleRendered_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaStreamSource2_add_SampleRendered_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaStreamSource2_add_SampleRendered : aliased constant Windows.IID := (2642488432, 40717, 23253, (130, 116, 247, 96, 201, 202, 12, 56 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaStreamSample_add_Processed_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaStreamSample ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaStreamSample_add_Processed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaStreamSample_add_Processed_Interface
      ; sender : Windows.Media.Core.IMediaStreamSample
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaStreamSample_add_Processed : aliased constant Windows.IID := (3571212017, 49611, 23602, (128, 61, 242, 249, 167, 173, 153, 22 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IMediaStreamSample_Interface(Callback : access procedure (asyncInfo : Windows.Media.Core.IAsyncOperation_IMediaStreamSample ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IMediaStreamSample_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaStreamSample_Interface
      ; asyncInfo : Windows.Media.Core.IAsyncOperation_IMediaStreamSample
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IMediaStreamSample : aliased constant Windows.IID := (3749358793, 43116, 23677, (191, 152, 204, 55, 28, 151, 198, 123 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMseStreamSource_add_Opened_Interface(Callback : access procedure (sender : Windows.Media.Core.IMseStreamSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMseStreamSource_add_Opened_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMseStreamSource_add_Opened_Interface
      ; sender : Windows.Media.Core.IMseStreamSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMseStreamSource_add_Opened : aliased constant Windows.IID := (1917580527, 56954, 23997, (129, 94, 82, 42, 135, 188, 51, 68 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMseStreamSource_add_Ended_Interface(Callback : access procedure (sender : Windows.Media.Core.IMseStreamSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMseStreamSource_add_Ended_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMseStreamSource_add_Ended_Interface
      ; sender : Windows.Media.Core.IMseStreamSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMseStreamSource_add_Ended : aliased constant Windows.IID := (1917580527, 56954, 23997, (129, 94, 82, 42, 135, 188, 51, 68 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMseStreamSource_add_Closed_Interface(Callback : access procedure (sender : Windows.Media.Core.IMseStreamSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMseStreamSource_add_Closed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMseStreamSource_add_Closed_Interface
      ; sender : Windows.Media.Core.IMseStreamSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMseStreamSource_add_Closed : aliased constant Windows.IID := (1917580527, 56954, 23997, (129, 94, 82, 42, 135, 188, 51, 68 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMseSourceBuffer_add_UpdateStarting_Interface(Callback : access procedure (sender : Windows.Media.Core.IMseSourceBuffer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMseSourceBuffer_add_UpdateStarting_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMseSourceBuffer_add_UpdateStarting_Interface
      ; sender : Windows.Media.Core.IMseSourceBuffer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMseSourceBuffer_add_UpdateStarting : aliased constant Windows.IID := (411030487, 48029, 21530, (148, 253, 67, 195, 29, 216, 74, 103 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMseSourceBuffer_add_Updated_Interface(Callback : access procedure (sender : Windows.Media.Core.IMseSourceBuffer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMseSourceBuffer_add_Updated_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMseSourceBuffer_add_Updated_Interface
      ; sender : Windows.Media.Core.IMseSourceBuffer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMseSourceBuffer_add_Updated : aliased constant Windows.IID := (411030487, 48029, 21530, (148, 253, 67, 195, 29, 216, 74, 103 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMseSourceBuffer_add_UpdateEnded_Interface(Callback : access procedure (sender : Windows.Media.Core.IMseSourceBuffer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMseSourceBuffer_add_UpdateEnded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMseSourceBuffer_add_UpdateEnded_Interface
      ; sender : Windows.Media.Core.IMseSourceBuffer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMseSourceBuffer_add_UpdateEnded : aliased constant Windows.IID := (411030487, 48029, 21530, (148, 253, 67, 195, 29, 216, 74, 103 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred_Interface(Callback : access procedure (sender : Windows.Media.Core.IMseSourceBuffer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred_Interface
      ; sender : Windows.Media.Core.IMseSourceBuffer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred : aliased constant Windows.IID := (411030487, 48029, 21530, (148, 253, 67, 195, 29, 216, 74, 103 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMseSourceBuffer_add_Aborted_Interface(Callback : access procedure (sender : Windows.Media.Core.IMseSourceBuffer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMseSourceBuffer_add_Aborted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMseSourceBuffer_add_Aborted_Interface
      ; sender : Windows.Media.Core.IMseSourceBuffer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMseSourceBuffer_add_Aborted : aliased constant Windows.IID := (411030487, 48029, 21530, (148, 253, 67, 195, 29, 216, 74, 103 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded_Interface(Callback : access procedure (sender : Windows.Media.Core.IMseSourceBufferList ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded_Interface
      ; sender : Windows.Media.Core.IMseSourceBufferList
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded : aliased constant Windows.IID := (267392661, 64434, 24213, (142, 199, 218, 23, 216, 233, 159, 22 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved_Interface(Callback : access procedure (sender : Windows.Media.Core.IMseSourceBufferList ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved_Interface
      ; sender : Windows.Media.Core.IMseSourceBufferList
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved : aliased constant Windows.IID := (267392661, 64434, 24213, (142, 199, 218, 23, 216, 233, 159, 22 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaSourceAppServiceConnection ; args : Windows.Media.Core.IInitializeMediaStreamSourceRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested_Interface
      ; sender : Windows.Media.Core.IMediaSourceAppServiceConnection
      ; args : Windows.Media.Core.IInitializeMediaStreamSourceRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested : aliased constant Windows.IID := (4143036565, 40033, 24106, (136, 131, 159, 248, 204, 139, 61, 118 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed_Interface(Callback : access procedure (sender : Windows.Media.Core.ISceneAnalysisEffect ; args : Windows.Media.Core.ISceneAnalyzedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed_Interface
      ; sender : Windows.Media.Core.ISceneAnalysisEffect
      ; args : Windows.Media.Core.ISceneAnalyzedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed : aliased constant Windows.IID := (1214451596, 56286, 22174, (160, 200, 117, 136, 209, 210, 189, 3 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IFaceDetectionEffect_add_FaceDetected_Interface(Callback : access procedure (sender : Windows.Media.Core.IFaceDetectionEffect ; args : Windows.Media.Core.IFaceDetectedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IFaceDetectionEffect_add_FaceDetected_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IFaceDetectionEffect_add_FaceDetected_Interface
      ; sender : Windows.Media.Core.IFaceDetectionEffect
      ; args : Windows.Media.Core.IFaceDetectedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IFaceDetectionEffect_add_FaceDetected : aliased constant Windows.IID := (32561062, 63933, 23489, (170, 169, 223, 243, 150, 247, 47, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged_Interface(Callback : access procedure (sender : Windows.Media.Core.IVideoStabilizationEffect ; args : Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged_Interface
      ; sender : Windows.Media.Core.IVideoStabilizationEffect
      ; args : Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged : aliased constant Windows.IID := (2306183906, 49100, 24342, (136, 52, 44, 156, 79, 32, 85, 155 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaBinder_add_Binding_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaBinder ; args : Windows.Media.Core.IMediaBindingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaBinder_add_Binding_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBinder_add_Binding_Interface
      ; sender : Windows.Media.Core.IMediaBinder
      ; args : Windows.Media.Core.IMediaBindingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaBinder_add_Binding : aliased constant Windows.IID := (1527985945, 61080, 22962, (180, 50, 28, 154, 90, 86, 171, 5 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaBindingEventArgs_add_Canceled_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaBindingEventArgs ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaBindingEventArgs_add_Canceled_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBindingEventArgs_add_Canceled_Interface
      ; sender : Windows.Media.Core.IMediaBindingEventArgs
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaBindingEventArgs_add_Canceled : aliased constant Windows.IID := (1060835554, 45801, 21958, (171, 179, 74, 37, 128, 114, 235, 185 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaSource2_add_OpenOperationCompleted_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaSource2 ; args : Windows.Media.Core.IMediaSourceOpenOperationCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaSource2_add_OpenOperationCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaSource2_add_OpenOperationCompleted_Interface
      ; sender : Windows.Media.Core.IMediaSource2
      ; args : Windows.Media.Core.IMediaSourceOpenOperationCompletedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaSource2_add_OpenOperationCompleted : aliased constant Windows.IID := (1113412579, 64422, 24227, (183, 19, 219, 77, 112, 120, 116, 54 ));
   
   ------------------------------------------------------------------------
   type VectorChangedEventHandler_ITimedTextSource_Interface(Callback : access procedure (sender : Windows.Media.Core.IObservableVector_ITimedTextSource ; event : Windows.Foundation.Collections.IVectorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access VectorChangedEventHandler_ITimedTextSource_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access VectorChangedEventHandler_ITimedTextSource_Interface
      ; sender : Windows.Media.Core.IObservableVector_ITimedTextSource
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_VectorChangedEventHandler_ITimedTextSource : aliased constant Windows.IID := (3777913441, 45464, 22240, (152, 34, 186, 45, 59, 182, 248, 254 ));
   
   ------------------------------------------------------------------------
   type VectorChangedEventHandler_ITimedMetadataTrack_Interface(Callback : access procedure (sender : Windows.Media.Core.IObservableVector_ITimedMetadataTrack ; event : Windows.Foundation.Collections.IVectorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access VectorChangedEventHandler_ITimedMetadataTrack_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access VectorChangedEventHandler_ITimedMetadataTrack_Interface
      ; sender : Windows.Media.Core.IObservableVector_ITimedMetadataTrack
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_VectorChangedEventHandler_ITimedMetadataTrack : aliased constant Windows.IID := (3172845596, 9156, 23371, (172, 56, 197, 211, 76, 223, 52, 228 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaSource3_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaSource2 ; args : Windows.Media.Core.IMediaSourceStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaSource3_add_StateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaSource3_add_StateChanged_Interface
      ; sender : Windows.Media.Core.IMediaSource2
      ; args : Windows.Media.Core.IMediaSourceStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaSource3_add_StateChanged : aliased constant Windows.IID := (578081702, 7072, 21040, (187, 134, 222, 144, 5, 139, 100, 3 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged_Interface(Callback : access procedure (sender : Windows.Media.Core.ISingleSelectMediaTrackList ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged_Interface
      ; sender : Windows.Media.Core.ISingleSelectMediaTrackList
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged : aliased constant Windows.IID := (569077305, 29322, 22185, (141, 206, 6, 43, 164, 200, 27, 245 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ITimedMetadataTrack_add_CueEntered_Interface(Callback : access procedure (sender : Windows.Media.Core.ITimedMetadataTrack ; args : Windows.Media.Core.IMediaCueEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ITimedMetadataTrack_add_CueEntered_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ITimedMetadataTrack_add_CueEntered_Interface
      ; sender : Windows.Media.Core.ITimedMetadataTrack
      ; args : Windows.Media.Core.IMediaCueEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ITimedMetadataTrack_add_CueEntered : aliased constant Windows.IID := (1252824081, 50005, 23701, (140, 120, 90, 15, 92, 161, 165, 77 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ITimedMetadataTrack_add_CueExited_Interface(Callback : access procedure (sender : Windows.Media.Core.ITimedMetadataTrack ; args : Windows.Media.Core.IMediaCueEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ITimedMetadataTrack_add_CueExited_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ITimedMetadataTrack_add_CueExited_Interface
      ; sender : Windows.Media.Core.ITimedMetadataTrack
      ; args : Windows.Media.Core.IMediaCueEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ITimedMetadataTrack_add_CueExited : aliased constant Windows.IID := (1252824081, 50005, 23701, (140, 120, 90, 15, 92, 161, 165, 77 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ITimedMetadataTrack_add_TrackFailed_Interface(Callback : access procedure (sender : Windows.Media.Core.ITimedMetadataTrack ; args : Windows.Media.Core.ITimedMetadataTrackFailedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ITimedMetadataTrack_add_TrackFailed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ITimedMetadataTrack_add_TrackFailed_Interface
      ; sender : Windows.Media.Core.ITimedMetadataTrack
      ; args : Windows.Media.Core.ITimedMetadataTrackFailedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ITimedMetadataTrack_add_TrackFailed : aliased constant Windows.IID := (2378641762, 9563, 21294, (176, 199, 154, 109, 112, 180, 187, 158 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ITimedTextSource_add_Resolved_Interface(Callback : access procedure (sender : Windows.Media.Core.ITimedTextSource ; args : Windows.Media.Core.ITimedTextSourceResolveResultEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ITimedTextSource_add_Resolved_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ITimedTextSource_add_Resolved_Interface
      ; sender : Windows.Media.Core.ITimedTextSource
      ; args : Windows.Media.Core.ITimedTextSourceResolveResultEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ITimedTextSource_add_Resolved : aliased constant Windows.IID := (35673642, 24036, 23250, (172, 32, 108, 210, 111, 17, 23, 69 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IVideoTrack_add_OpenFailed_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaTrack ; args : Windows.Media.Core.IVideoTrackOpenFailedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IVideoTrack_add_OpenFailed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVideoTrack_add_OpenFailed_Interface
      ; sender : Windows.Media.Core.IMediaTrack
      ; args : Windows.Media.Core.IVideoTrackOpenFailedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IVideoTrack_add_OpenFailed : aliased constant Windows.IID := (2984557891, 21531, 21491, (173, 108, 221, 170, 196, 129, 48, 35 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAudioTrack_add_OpenFailed_Interface(Callback : access procedure (sender : Windows.Media.Core.IMediaTrack ; args : Windows.Media.Core.IAudioTrackOpenFailedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAudioTrack_add_OpenFailed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAudioTrack_add_OpenFailed_Interface
      ; sender : Windows.Media.Core.IMediaTrack
      ; args : Windows.Media.Core.IAudioTrackOpenFailedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAudioTrack_add_OpenFailed : aliased constant Windows.IID := (3048727892, 9334, 22119, (156, 154, 28, 122, 125, 9, 172, 226 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype TimedTextRegion is Windows.Media.Core.ITimedTextRegion;
   
   function CreateTimedTextRegion return Windows.Media.Core.ITimedTextRegion;
   
   subtype TimedTextStyle is Windows.Media.Core.ITimedTextStyle;
   
   function CreateTimedTextStyle return Windows.Media.Core.ITimedTextStyle;
   
   subtype TimedTextLine is Windows.Media.Core.ITimedTextLine;
   
   function CreateTimedTextLine return Windows.Media.Core.ITimedTextLine;
   
   subtype TimedTextSubformat is Windows.Media.Core.ITimedTextSubformat;
   
   function CreateTimedTextSubformat return Windows.Media.Core.ITimedTextSubformat;
   
   subtype TimedTextCue is Windows.Media.Core.ITimedTextCue;
   
   function CreateTimedTextCue return Windows.Media.Core.ITimedTextCue;
   
   subtype DataCue is Windows.Media.Core.IDataCue;
   
   function CreateDataCue return Windows.Media.Core.IDataCue;
   
   subtype ChapterCue is Windows.Media.Core.IChapterCue;
   
   function CreateChapterCue return Windows.Media.Core.IChapterCue;
   
   subtype ImageCue is Windows.Media.Core.IImageCue;
   
   function CreateImageCue return Windows.Media.Core.IImageCue;
   
   subtype SpeechCue is Windows.Media.Core.ISpeechCue;
   
   function CreateSpeechCue return Windows.Media.Core.ISpeechCue;
   
   subtype CodecInfo is Windows.Media.Core.ICodecInfo;
   subtype CodecQuery is Windows.Media.Core.ICodecQuery;
   
   function CreateCodecQuery return Windows.Media.Core.ICodecQuery;
   
   subtype LowLightFusionResult is Windows.Media.Core.ILowLightFusionResult;
   subtype AudioStreamDescriptor is Windows.Media.Core.IAudioStreamDescriptor;
   
   function Create
   (
      encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.Media.Core.IAudioStreamDescriptor;
   
   subtype VideoStreamDescriptor is Windows.Media.Core.IVideoStreamDescriptor;
   
   function Create
   (
      encodingProperties : Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.Media.Core.IVideoStreamDescriptor;
   
   subtype MediaStreamSource is Windows.Media.Core.IMediaStreamSource;
   
   function CreateFromDescriptor
   (
      descriptor : Windows.Media.Core.IMediaStreamDescriptor
   )
   return Windows.Media.Core.IMediaStreamSource;
   
   function CreateFromDescriptors
   (
      descriptor : Windows.Media.Core.IMediaStreamDescriptor
      ; descriptor2 : Windows.Media.Core.IMediaStreamDescriptor
   )
   return Windows.Media.Core.IMediaStreamSource;
   
   subtype MediaStreamSourceClosedEventArgs is Windows.Media.Core.IMediaStreamSourceClosedEventArgs;
   subtype MediaStreamSourceStartingEventArgs is Windows.Media.Core.IMediaStreamSourceStartingEventArgs;
   subtype MediaStreamSourceSampleRequestedEventArgs is Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs;
   subtype MediaStreamSourceSwitchStreamsRequestedEventArgs is Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs;
   subtype MediaStreamSourceSampleRenderedEventArgs is Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs;
   subtype MediaStreamSamplePropertySet is Windows.Media.Core.IMap_Guid_Object;
   subtype MediaStreamSample is Windows.Media.Core.IMediaStreamSample;
   subtype MediaStreamSampleProtectionProperties is Windows.Media.Core.IMediaStreamSampleProtectionProperties;
   subtype MediaStreamSourceClosedRequest is Windows.Media.Core.IMediaStreamSourceClosedRequest;
   subtype MediaStreamSourceStartingRequestDeferral is Windows.Media.Core.IMediaStreamSourceStartingRequestDeferral;
   subtype MediaStreamSourceStartingRequest is Windows.Media.Core.IMediaStreamSourceStartingRequest;
   subtype MediaStreamSourceSampleRequestDeferral is Windows.Media.Core.IMediaStreamSourceSampleRequestDeferral;
   subtype MediaStreamSourceSampleRequest is Windows.Media.Core.IMediaStreamSourceSampleRequest;
   subtype MediaStreamSourceSwitchStreamsRequestDeferral is Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestDeferral;
   subtype MediaStreamSourceSwitchStreamsRequest is Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequest;
   subtype MseStreamSource is Windows.Media.Core.IMseStreamSource;
   
   function CreateMseStreamSource return Windows.Media.Core.IMseStreamSource;
   
   subtype MseSourceBufferList is Windows.Media.Core.IMseSourceBufferList;
   subtype MseSourceBuffer is Windows.Media.Core.IMseSourceBuffer;
   subtype MediaSourceAppServiceConnection is Windows.Media.Core.IMediaSourceAppServiceConnection;
   
   function Create
   (
      appServiceConnection : Windows.ApplicationModel.AppService.IAppServiceConnection
   )
   return Windows.Media.Core.IMediaSourceAppServiceConnection;
   
   subtype InitializeMediaStreamSourceRequestedEventArgs is Windows.Media.Core.IInitializeMediaStreamSourceRequestedEventArgs;
   subtype HighDynamicRangeControl is Windows.Media.Core.IHighDynamicRangeControl;
   subtype SceneAnalysisEffect is Windows.Media.Core.ISceneAnalysisEffect;
   subtype SceneAnalyzedEventArgs is Windows.Media.Core.ISceneAnalyzedEventArgs;
   subtype HighDynamicRangeOutput is Windows.Media.Core.IHighDynamicRangeOutput;
   subtype SceneAnalysisEffectFrame is Windows.Media.Core.ISceneAnalysisEffectFrame;
   subtype SceneAnalysisEffectDefinition is Windows.Media.Effects.IVideoEffectDefinition;
   
   function CreateSceneAnalysisEffectDefinition return Windows.Media.Effects.IVideoEffectDefinition;
   
   subtype FaceDetectionEffectFrame is Windows.Media.Core.IFaceDetectionEffectFrame;
   subtype FaceDetectedEventArgs is Windows.Media.Core.IFaceDetectedEventArgs;
   subtype FaceDetectionEffect is Windows.Media.Core.IFaceDetectionEffect;
   subtype FaceDetectionEffectDefinition is Windows.Media.Effects.IVideoEffectDefinition;
   
   function CreateFaceDetectionEffectDefinition return Windows.Media.Effects.IVideoEffectDefinition;
   
   subtype VideoStabilizationEffectEnabledChangedEventArgs is Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs;
   subtype VideoStabilizationEffect is Windows.Media.Core.IVideoStabilizationEffect;
   subtype VideoStabilizationEffectDefinition is Windows.Media.Effects.IVideoEffectDefinition;
   
   function CreateVideoStabilizationEffectDefinition return Windows.Media.Effects.IVideoEffectDefinition;
   
   subtype MediaSourceError is Windows.Media.Core.IMediaSourceError;
   subtype MediaSource is Windows.Media.Core.IMediaSource2;
   subtype MediaBinder is Windows.Media.Core.IMediaBinder;
   
   function CreateMediaBinder return Windows.Media.Core.IMediaBinder;
   
   subtype MediaBindingEventArgs is Windows.Media.Core.IMediaBindingEventArgs;
   subtype MediaSourceOpenOperationCompletedEventArgs is Windows.Media.Core.IMediaSourceOpenOperationCompletedEventArgs;
   subtype TimedTextSource is Windows.Media.Core.ITimedTextSource;
   subtype TimedMetadataTrack is Windows.Media.Core.ITimedMetadataTrack;
   
   function Create
   (
      id : Windows.String
      ; language : Windows.String
      ; kind : Windows.Media.Core.TimedMetadataKind
   )
   return Windows.Media.Core.ITimedMetadataTrack;
   
   subtype MediaSourceStateChangedEventArgs is Windows.Media.Core.IMediaSourceStateChangedEventArgs;
   subtype TimedMetadataTrackError is Windows.Media.Core.ITimedMetadataTrackError;
   subtype MediaCueEventArgs is Windows.Media.Core.IMediaCueEventArgs;
   subtype TimedMetadataTrackFailedEventArgs is Windows.Media.Core.ITimedMetadataTrackFailedEventArgs;
   subtype TimedTextSourceResolveResultEventArgs is Windows.Media.Core.ITimedTextSourceResolveResultEventArgs;
   subtype VideoTrack is Windows.Media.Core.IMediaTrack;
   subtype VideoTrackOpenFailedEventArgs is Windows.Media.Core.IVideoTrackOpenFailedEventArgs;
   subtype VideoTrackSupportInfo is Windows.Media.Core.IVideoTrackSupportInfo;
   subtype AudioTrack is Windows.Media.Core.IMediaTrack;
   subtype AudioTrackOpenFailedEventArgs is Windows.Media.Core.IAudioTrackOpenFailedEventArgs;
   subtype AudioTrackSupportInfo is Windows.Media.Core.IAudioTrackSupportInfo;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_VideoFormatDV25
   return Windows.String;
   
   function get_VideoFormatDV50
   return Windows.String;
   
   function get_VideoFormatDvc
   return Windows.String;
   
   function get_VideoFormatDvh1
   return Windows.String;
   
   function get_VideoFormatDvhD
   return Windows.String;
   
   function get_VideoFormatDvsd
   return Windows.String;
   
   function get_VideoFormatDvsl
   return Windows.String;
   
   function get_VideoFormatH263
   return Windows.String;
   
   function get_VideoFormatH264
   return Windows.String;
   
   function get_VideoFormatH265
   return Windows.String;
   
   function get_VideoFormatH264ES
   return Windows.String;
   
   function get_VideoFormatHevc
   return Windows.String;
   
   function get_VideoFormatHevcES
   return Windows.String;
   
   function get_VideoFormatM4S2
   return Windows.String;
   
   function get_VideoFormatMjpg
   return Windows.String;
   
   function get_VideoFormatMP43
   return Windows.String;
   
   function get_VideoFormatMP4S
   return Windows.String;
   
   function get_VideoFormatMP4V
   return Windows.String;
   
   function get_VideoFormatMpeg2
   return Windows.String;
   
   function get_VideoFormatVP80
   return Windows.String;
   
   function get_VideoFormatVP90
   return Windows.String;
   
   function get_VideoFormatMpg1
   return Windows.String;
   
   function get_VideoFormatMss1
   return Windows.String;
   
   function get_VideoFormatMss2
   return Windows.String;
   
   function get_VideoFormatWmv1
   return Windows.String;
   
   function get_VideoFormatWmv2
   return Windows.String;
   
   function get_VideoFormatWmv3
   return Windows.String;
   
   function get_VideoFormatWvc1
   return Windows.String;
   
   function get_VideoFormat420O
   return Windows.String;
   
   function get_AudioFormatAac
   return Windows.String;
   
   function get_AudioFormatAdts
   return Windows.String;
   
   function get_AudioFormatAlac
   return Windows.String;
   
   function get_AudioFormatAmrNB
   return Windows.String;
   
   function get_AudioFormatAmrWB
   return Windows.String;
   
   function get_AudioFormatAmrWP
   return Windows.String;
   
   function get_AudioFormatDolbyAC3
   return Windows.String;
   
   function get_AudioFormatDolbyAC3Spdif
   return Windows.String;
   
   function get_AudioFormatDolbyDDPlus
   return Windows.String;
   
   function get_AudioFormatDrm
   return Windows.String;
   
   function get_AudioFormatDts
   return Windows.String;
   
   function get_AudioFormatFlac
   return Windows.String;
   
   function get_AudioFormatFloat
   return Windows.String;
   
   function get_AudioFormatMP3
   return Windows.String;
   
   function get_AudioFormatMPeg
   return Windows.String;
   
   function get_AudioFormatMsp1
   return Windows.String;
   
   function get_AudioFormatOpus
   return Windows.String;
   
   function get_AudioFormatPcm
   return Windows.String;
   
   function get_AudioFormatWmaSpdif
   return Windows.String;
   
   function get_AudioFormatWMAudioLossless
   return Windows.String;
   
   function get_AudioFormatWMAudioV8
   return Windows.String;
   
   function get_AudioFormatWMAudioV9
   return Windows.String;
   
   function get_SupportedBitmapPixelFormats
   return Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat;
   
   function get_MaxSupportedFrameCount
   return Windows.Int32;
   
   function FuseAsync
   (
      frameSet : Windows.Graphics.Imaging.IIterable_ISoftwareBitmap
   )
   return Windows.Address;
   
   function CreateFromBuffer
   (
      buffer : Windows.Storage.Streams.IBuffer
      ; timestamp : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Core.IMediaStreamSample;
   
   function CreateFromStreamAsync
   (
      stream : Windows.Storage.Streams.IInputStream
      ; count : Windows.UInt32
      ; timestamp : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Core.IAsyncOperation_IMediaStreamSample;
   
   function IsContentTypeSupported
   (
      contentType : Windows.String
   )
   return Windows.Boolean;
   
   function CreateFromAdaptiveMediaSource
   (
      mediaSource : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
   )
   return Windows.Media.Core.IMediaSource2;
   
   function CreateFromMediaStreamSource
   (
      mediaSource : Windows.Media.Core.IMediaStreamSource
   )
   return Windows.Media.Core.IMediaSource2;
   
   function CreateFromMseStreamSource
   (
      mediaSource : Windows.Media.Core.IMseStreamSource
   )
   return Windows.Media.Core.IMediaSource2;
   
   function CreateFromIMediaSource
   (
      mediaSource : Windows.Media.Core.IMediaSource
   )
   return Windows.Media.Core.IMediaSource2;
   
   function CreateFromStorageFile
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.Core.IMediaSource2;
   
   function CreateFromStream
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; contentType : Windows.String
   )
   return Windows.Media.Core.IMediaSource2;
   
   function CreateFromStreamReference
   (
      stream : Windows.Storage.Streams.IRandomAccessStreamReference
      ; contentType : Windows.String
   )
   return Windows.Media.Core.IMediaSource2;
   
   function CreateFromUri
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Media.Core.IMediaSource2;
   
   function CreateFromMediaBinder
   (
      binder : Windows.Media.Core.IMediaBinder
   )
   return Windows.Media.Core.IMediaSource2;
   
   function CreateFromMediaFrameSource
   (
      frameSource : Windows.Media.Capture.Frames.IMediaFrameSource
   )
   return Windows.Media.Core.IMediaSource2;
   
   function CreateFromStreamWithIndex
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; indexStream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Media.Core.ITimedTextSource;
   
   function CreateFromUriWithIndex
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; indexUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Media.Core.ITimedTextSource;
   
   function CreateFromStreamWithIndexAndLanguage
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; indexStream : Windows.Storage.Streams.IRandomAccessStream
      ; defaultLanguage : Windows.String
   )
   return Windows.Media.Core.ITimedTextSource;
   
   function CreateFromUriWithIndexAndLanguage
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; indexUri : Windows.Foundation.IUriRuntimeClass
      ; defaultLanguage : Windows.String
   )
   return Windows.Media.Core.ITimedTextSource;
   
   function CreateFromStream
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Media.Core.ITimedTextSource;
   
   function CreateFromUri
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Media.Core.ITimedTextSource;
   
   function CreateFromStreamWithLanguage
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; defaultLanguage : Windows.String
   )
   return Windows.Media.Core.ITimedTextSource;
   
   function CreateFromUriWithLanguage
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; defaultLanguage : Windows.String
   )
   return Windows.Media.Core.ITimedTextSource;

end;
