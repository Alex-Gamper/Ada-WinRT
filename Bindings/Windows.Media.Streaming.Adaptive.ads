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
limited with Windows.Web.Http;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
limited with Windows.Media.Core;
--------------------------------------------------------------------------------
package Windows.Media.Streaming.Adaptive is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AdaptiveMediaSourceCreationStatus is (
      Success,
      ManifestDownloadFailure,
      ManifestParseFailure,
      UnsupportedManifestContentType,
      UnsupportedManifestVersion,
      UnsupportedManifestProfile,
      UnknownFailure
   );
   for AdaptiveMediaSourceCreationStatus use (
      Success => 0,
      ManifestDownloadFailure => 1,
      ManifestParseFailure => 2,
      UnsupportedManifestContentType => 3,
      UnsupportedManifestVersion => 4,
      UnsupportedManifestProfile => 5,
      UnknownFailure => 6
   );
   for AdaptiveMediaSourceCreationStatus'Size use 32;
   
   type AdaptiveMediaSourceCreationStatus_Ptr is access AdaptiveMediaSourceCreationStatus;
   
   type AdaptiveMediaSourceDownloadBitrateChangedReason is (
      SufficientInboundBitsPerSecond,
      InsufficientInboundBitsPerSecond,
      LowBufferLevel,
      PositionChanged,
      TrackSelectionChanged,
      DesiredBitratesChanged,
      ErrorInPreviousBitrate
   );
   for AdaptiveMediaSourceDownloadBitrateChangedReason use (
      SufficientInboundBitsPerSecond => 0,
      InsufficientInboundBitsPerSecond => 1,
      LowBufferLevel => 2,
      PositionChanged => 3,
      TrackSelectionChanged => 4,
      DesiredBitratesChanged => 5,
      ErrorInPreviousBitrate => 6
   );
   for AdaptiveMediaSourceDownloadBitrateChangedReason'Size use 32;
   
   type AdaptiveMediaSourceDownloadBitrateChangedReason_Ptr is access AdaptiveMediaSourceDownloadBitrateChangedReason;
   
   type AdaptiveMediaSourceResourceType is (
      Manifest,
      InitializationSegment,
      MediaSegment,
      Key,
      InitializationVector
   );
   for AdaptiveMediaSourceResourceType use (
      Manifest => 0,
      InitializationSegment => 1,
      MediaSegment => 2,
      Key => 3,
      InitializationVector => 4
   );
   for AdaptiveMediaSourceResourceType'Size use 32;
   
   type AdaptiveMediaSourceResourceType_Ptr is access AdaptiveMediaSourceResourceType;
   
   type AdaptiveMediaSourceDiagnosticType is (
      ManifestUnchangedUponReload,
      ManifestMismatchUponReload,
      ManifestSignaledEndOfLiveEventUponReload,
      MediaSegmentSkipped,
      ResourceNotFound,
      ResourceTimedOut,
      ResourceParsingError,
      BitrateDisabled,
      FatalMediaSourceError
   );
   for AdaptiveMediaSourceDiagnosticType use (
      ManifestUnchangedUponReload => 0,
      ManifestMismatchUponReload => 1,
      ManifestSignaledEndOfLiveEventUponReload => 2,
      MediaSegmentSkipped => 3,
      ResourceNotFound => 4,
      ResourceTimedOut => 5,
      ResourceParsingError => 6,
      BitrateDisabled => 7,
      FatalMediaSourceError => 8
   );
   for AdaptiveMediaSourceDiagnosticType'Size use 32;
   
   type AdaptiveMediaSourceDiagnosticType_Ptr is access AdaptiveMediaSourceDiagnosticType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult_Interface;
   type AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult is access all AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult_Ptr is access all AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged_Interface;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged is access all TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged_Interface'Class;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged_Ptr is access all TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged;
   type TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged_Interface;
   type TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged is access all TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged_Interface'Class;
   type TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged_Ptr is access all TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested_Interface;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested is access all TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested_Interface'Class;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested_Ptr is access all TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted_Interface;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted is access all TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted_Interface'Class;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted_Ptr is access all TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed_Interface;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed is access all TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed_Interface'Class;
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed_Ptr is access all TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed;
   type TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable_Interface;
   type TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable is access all TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable_Interface'Class;
   type TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable_Ptr is access all TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAdaptiveMediaSourceCreationResult_Interface;
   type IAdaptiveMediaSourceCreationResult is access all IAdaptiveMediaSourceCreationResult_Interface'Class;
   type IAdaptiveMediaSourceCreationResult_Ptr is access all IAdaptiveMediaSourceCreationResult;
   type IAdaptiveMediaSourceCreationResult2_Interface;
   type IAdaptiveMediaSourceCreationResult2 is access all IAdaptiveMediaSourceCreationResult2_Interface'Class;
   type IAdaptiveMediaSourceCreationResult2_Ptr is access all IAdaptiveMediaSourceCreationResult2;
   type IAdaptiveMediaSourceStatics_Interface;
   type IAdaptiveMediaSourceStatics is access all IAdaptiveMediaSourceStatics_Interface'Class;
   type IAdaptiveMediaSourceStatics_Ptr is access all IAdaptiveMediaSourceStatics;
   type IAdaptiveMediaSource_Interface;
   type IAdaptiveMediaSource is access all IAdaptiveMediaSource_Interface'Class;
   type IAdaptiveMediaSource_Ptr is access all IAdaptiveMediaSource;
   type IAdaptiveMediaSource2_Interface;
   type IAdaptiveMediaSource2 is access all IAdaptiveMediaSource2_Interface'Class;
   type IAdaptiveMediaSource2_Ptr is access all IAdaptiveMediaSource2;
   type IAdaptiveMediaSource3_Interface;
   type IAdaptiveMediaSource3 is access all IAdaptiveMediaSource3_Interface'Class;
   type IAdaptiveMediaSource3_Ptr is access all IAdaptiveMediaSource3;
   type IAdaptiveMediaSourceAdvancedSettings_Interface;
   type IAdaptiveMediaSourceAdvancedSettings is access all IAdaptiveMediaSourceAdvancedSettings_Interface'Class;
   type IAdaptiveMediaSourceAdvancedSettings_Ptr is access all IAdaptiveMediaSourceAdvancedSettings;
   type IAdaptiveMediaSourceCorrelatedTimes_Interface;
   type IAdaptiveMediaSourceCorrelatedTimes is access all IAdaptiveMediaSourceCorrelatedTimes_Interface'Class;
   type IAdaptiveMediaSourceCorrelatedTimes_Ptr is access all IAdaptiveMediaSourceCorrelatedTimes;
   type IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_Interface;
   type IAdaptiveMediaSourceDownloadBitrateChangedEventArgs is access all IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_Interface'Class;
   type IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_Ptr is access all IAdaptiveMediaSourceDownloadBitrateChangedEventArgs;
   type IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2_Interface;
   type IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2 is access all IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2_Interface'Class;
   type IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2_Ptr is access all IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2;
   type IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_Interface;
   type IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs is access all IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_Interface'Class;
   type IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_Ptr is access all IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs;
   type IAdaptiveMediaSourceDownloadRequestedEventArgs_Interface;
   type IAdaptiveMediaSourceDownloadRequestedEventArgs is access all IAdaptiveMediaSourceDownloadRequestedEventArgs_Interface'Class;
   type IAdaptiveMediaSourceDownloadRequestedEventArgs_Ptr is access all IAdaptiveMediaSourceDownloadRequestedEventArgs;
   type IAdaptiveMediaSourceDownloadRequestedEventArgs2_Interface;
   type IAdaptiveMediaSourceDownloadRequestedEventArgs2 is access all IAdaptiveMediaSourceDownloadRequestedEventArgs2_Interface'Class;
   type IAdaptiveMediaSourceDownloadRequestedEventArgs2_Ptr is access all IAdaptiveMediaSourceDownloadRequestedEventArgs2;
   type IAdaptiveMediaSourceDownloadResult_Interface;
   type IAdaptiveMediaSourceDownloadResult is access all IAdaptiveMediaSourceDownloadResult_Interface'Class;
   type IAdaptiveMediaSourceDownloadResult_Ptr is access all IAdaptiveMediaSourceDownloadResult;
   type IAdaptiveMediaSourceDownloadResult2_Interface;
   type IAdaptiveMediaSourceDownloadResult2 is access all IAdaptiveMediaSourceDownloadResult2_Interface'Class;
   type IAdaptiveMediaSourceDownloadResult2_Ptr is access all IAdaptiveMediaSourceDownloadResult2;
   type IAdaptiveMediaSourceDownloadRequestedDeferral_Interface;
   type IAdaptiveMediaSourceDownloadRequestedDeferral is access all IAdaptiveMediaSourceDownloadRequestedDeferral_Interface'Class;
   type IAdaptiveMediaSourceDownloadRequestedDeferral_Ptr is access all IAdaptiveMediaSourceDownloadRequestedDeferral;
   type IAdaptiveMediaSourceDownloadCompletedEventArgs_Interface;
   type IAdaptiveMediaSourceDownloadCompletedEventArgs is access all IAdaptiveMediaSourceDownloadCompletedEventArgs_Interface'Class;
   type IAdaptiveMediaSourceDownloadCompletedEventArgs_Ptr is access all IAdaptiveMediaSourceDownloadCompletedEventArgs;
   type IAdaptiveMediaSourceDownloadStatistics_Interface;
   type IAdaptiveMediaSourceDownloadStatistics is access all IAdaptiveMediaSourceDownloadStatistics_Interface'Class;
   type IAdaptiveMediaSourceDownloadStatistics_Ptr is access all IAdaptiveMediaSourceDownloadStatistics;
   type IAdaptiveMediaSourceDownloadCompletedEventArgs2_Interface;
   type IAdaptiveMediaSourceDownloadCompletedEventArgs2 is access all IAdaptiveMediaSourceDownloadCompletedEventArgs2_Interface'Class;
   type IAdaptiveMediaSourceDownloadCompletedEventArgs2_Ptr is access all IAdaptiveMediaSourceDownloadCompletedEventArgs2;
   type IAdaptiveMediaSourceDownloadFailedEventArgs_Interface;
   type IAdaptiveMediaSourceDownloadFailedEventArgs is access all IAdaptiveMediaSourceDownloadFailedEventArgs_Interface'Class;
   type IAdaptiveMediaSourceDownloadFailedEventArgs_Ptr is access all IAdaptiveMediaSourceDownloadFailedEventArgs;
   type IAdaptiveMediaSourceDownloadFailedEventArgs2_Interface;
   type IAdaptiveMediaSourceDownloadFailedEventArgs2 is access all IAdaptiveMediaSourceDownloadFailedEventArgs2_Interface'Class;
   type IAdaptiveMediaSourceDownloadFailedEventArgs2_Ptr is access all IAdaptiveMediaSourceDownloadFailedEventArgs2;
   type IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface;
   type IAdaptiveMediaSourceDiagnosticAvailableEventArgs is access all IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface'Class;
   type IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Ptr is access all IAdaptiveMediaSourceDiagnosticAvailableEventArgs;
   type IAdaptiveMediaSourceDiagnosticAvailableEventArgs2_Interface;
   type IAdaptiveMediaSourceDiagnosticAvailableEventArgs2 is access all IAdaptiveMediaSourceDiagnosticAvailableEventArgs2_Interface'Class;
   type IAdaptiveMediaSourceDiagnosticAvailableEventArgs2_Ptr is access all IAdaptiveMediaSourceDiagnosticAvailableEventArgs2;
   type IAdaptiveMediaSourceDiagnostics_Interface;
   type IAdaptiveMediaSourceDiagnostics is access all IAdaptiveMediaSourceDiagnostics_Interface'Class;
   type IAdaptiveMediaSourceDiagnostics_Ptr is access all IAdaptiveMediaSourceDiagnostics;
   type IMediaSource_Imported_Interface;
   type IMediaSource_Imported is access all IMediaSource_Imported_Interface'Class;
   type IMediaSource_Imported_Ptr is access all IMediaSource_Imported;
   type IAsyncOperation_IAdaptiveMediaSourceCreationResult_Interface;
   type IAsyncOperation_IAdaptiveMediaSourceCreationResult is access all IAsyncOperation_IAdaptiveMediaSourceCreationResult_Interface'Class;
   type IAsyncOperation_IAdaptiveMediaSourceCreationResult_Ptr is access all IAsyncOperation_IAdaptiveMediaSourceCreationResult;
   type IReference_AdaptiveMediaSourceResourceType_Interface;
   type IReference_AdaptiveMediaSourceResourceType is access all IReference_AdaptiveMediaSourceResourceType_Interface'Class;
   type IReference_AdaptiveMediaSourceResourceType_Ptr is access all IReference_AdaptiveMediaSourceResourceType;
   
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
   type IAdaptiveMediaSourceCreationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IAdaptiveMediaSourceCreationResult_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceCreationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaSource
   (
      This       : access IAdaptiveMediaSourceCreationResult_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
   )
   return Windows.HRESULT is abstract;
   
   function get_HttpResponseMessage
   (
      This       : access IAdaptiveMediaSourceCreationResult_Interface
      ; RetVal : access Windows.Web.Http.IHttpResponseMessage
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceCreationResult : aliased constant Windows.IID := (1183233714, 32783, 20017, (144, 147, 118, 212, 120, 32, 19, 231 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceCreationResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedError
   (
      This       : access IAdaptiveMediaSourceCreationResult2_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceCreationResult2 : aliased constant Windows.IID := (473056191, 7236, 16459, (162, 1, 223, 69, 172, 120, 152, 232 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsContentTypeSupported
   (
      This       : access IAdaptiveMediaSourceStatics_Interface
      ; contentType : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromUriAsync
   (
      This       : access IAdaptiveMediaSourceStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromUriWithDownloaderAsync
   (
      This       : access IAdaptiveMediaSourceStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; httpClient : Windows.Web.Http.IHttpClient
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStreamAsync
   (
      This       : access IAdaptiveMediaSourceStatics_Interface
      ; stream : Windows.Storage.Streams.IInputStream
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; contentType : Windows.String
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStreamWithDownloaderAsync
   (
      This       : access IAdaptiveMediaSourceStatics_Interface
      ; stream : Windows.Storage.Streams.IInputStream
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; contentType : Windows.String
      ; httpClient : Windows.Web.Http.IHttpClient
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceStatics : aliased constant Windows.IID := (1353104733, 26351, 19667, (149, 121, 158, 102, 5, 7, 220, 63 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsLive
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredLiveOffset
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredLiveOffset
   (
      This       : access IAdaptiveMediaSource_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialBitrate
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialBitrate
   (
      This       : access IAdaptiveMediaSource_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentDownloadBitrate
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentPlaybackBitrate
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AvailableBitrates
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredMinBitrate
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredMinBitrate
   (
      This       : access IAdaptiveMediaSource_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredMaxBitrate
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredMaxBitrate
   (
      This       : access IAdaptiveMediaSource_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioOnlyPlayback
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_InboundBitsPerSecond
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_InboundBitsPerSecondWindow
   (
      This       : access IAdaptiveMediaSource_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_InboundBitsPerSecondWindow
   (
      This       : access IAdaptiveMediaSource_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function add_DownloadBitrateChanged
   (
      This       : access IAdaptiveMediaSource_Interface
      ; handler : TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DownloadBitrateChanged
   (
      This       : access IAdaptiveMediaSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PlaybackBitrateChanged
   (
      This       : access IAdaptiveMediaSource_Interface
      ; handler : TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlaybackBitrateChanged
   (
      This       : access IAdaptiveMediaSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DownloadRequested
   (
      This       : access IAdaptiveMediaSource_Interface
      ; handler : TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DownloadRequested
   (
      This       : access IAdaptiveMediaSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DownloadCompleted
   (
      This       : access IAdaptiveMediaSource_Interface
      ; handler : TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DownloadCompleted
   (
      This       : access IAdaptiveMediaSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DownloadFailed
   (
      This       : access IAdaptiveMediaSource_Interface
      ; handler : TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DownloadFailed
   (
      This       : access IAdaptiveMediaSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSource : aliased constant Windows.IID := (1282618095, 54175, 17302, (180, 217, 4, 57, 87, 167, 201, 100 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AdvancedSettings
   (
      This       : access IAdaptiveMediaSource2_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceAdvancedSettings
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSource2 : aliased constant Windows.IID := (394855234, 26464, 19385, (165, 138, 247, 170, 152, 176, 140, 14 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSource3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinLiveOffset
   (
      This       : access IAdaptiveMediaSource3_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSeekableWindowSize
   (
      This       : access IAdaptiveMediaSource3_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredSeekableWindowSize
   (
      This       : access IAdaptiveMediaSource3_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredSeekableWindowSize
   (
      This       : access IAdaptiveMediaSource3_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Diagnostics
   (
      This       : access IAdaptiveMediaSource3_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics
   )
   return Windows.HRESULT is abstract;
   
   function GetCorrelatedTimes
   (
      This       : access IAdaptiveMediaSource3_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCorrelatedTimes
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSource3 : aliased constant Windows.IID := (3127911421, 49972, 17947, (163, 110, 201, 159, 84, 247, 23, 74 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceAdvancedSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllSegmentsIndependent
   (
      This       : access IAdaptiveMediaSourceAdvancedSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllSegmentsIndependent
   (
      This       : access IAdaptiveMediaSourceAdvancedSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredBitrateHeadroomRatio
   (
      This       : access IAdaptiveMediaSourceAdvancedSettings_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredBitrateHeadroomRatio
   (
      This       : access IAdaptiveMediaSourceAdvancedSettings_Interface
      ; value : Windows.Foundation.IReference_Double
   )
   return Windows.HRESULT is abstract;
   
   function get_BitrateDowngradeTriggerRatio
   (
      This       : access IAdaptiveMediaSourceAdvancedSettings_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_BitrateDowngradeTriggerRatio
   (
      This       : access IAdaptiveMediaSourceAdvancedSettings_Interface
      ; value : Windows.Foundation.IReference_Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceAdvancedSettings : aliased constant Windows.IID := (1440421504, 6891, 18396, (170, 8, 154, 17, 97, 11, 164, 90 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceCorrelatedTimes_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IAdaptiveMediaSourceCorrelatedTimes_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PresentationTimeStamp
   (
      This       : access IAdaptiveMediaSourceCorrelatedTimes_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ProgramDateTime
   (
      This       : access IAdaptiveMediaSourceCorrelatedTimes_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceCorrelatedTimes : aliased constant Windows.IID := (84969351, 57394, 18657, (171, 141, 0, 43, 11, 48, 81, 223 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldValue
   (
      This       : access IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NewValue
   (
      This       : access IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs : aliased constant Windows.IID := (1728842308, 57422, 20223, (129, 106, 23, 57, 159, 120, 244, 186 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadBitrateChangedReason
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2 : aliased constant Windows.IID := (4092720196, 38574, 19936, (181, 64, 43, 50, 70, 230, 150, 140 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldValue
   (
      This       : access IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NewValue
   (
      This       : access IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioOnly
   (
      This       : access IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs : aliased constant Windows.IID := (597860205, 32218, 19025, (135, 169, 111, 168, 197, 178, 146, 190 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResourceType
   (
      This       : access IAdaptiveMediaSourceDownloadRequestedEventArgs_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceUri
   (
      This       : access IAdaptiveMediaSourceDownloadRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceByteRangeOffset
   (
      This       : access IAdaptiveMediaSourceDownloadRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceByteRangeLength
   (
      This       : access IAdaptiveMediaSourceDownloadRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Result
   (
      This       : access IAdaptiveMediaSourceDownloadRequestedEventArgs_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAdaptiveMediaSourceDownloadRequestedEventArgs_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadRequestedEventArgs : aliased constant Windows.IID := (3359629309, 17577, 18338, (191, 150, 3, 57, 139, 75, 250, 175 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadRequestedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestId
   (
      This       : access IAdaptiveMediaSourceDownloadRequestedEventArgs2_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IAdaptiveMediaSourceDownloadRequestedEventArgs2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadRequestedEventArgs2 : aliased constant Windows.IID := (3011349502, 43588, 19842, (130, 91, 97, 29, 227, 188, 254, 203 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResourceUri
   (
      This       : access IAdaptiveMediaSourceDownloadResult_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_ResourceUri
   (
      This       : access IAdaptiveMediaSourceDownloadResult_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_InputStream
   (
      This       : access IAdaptiveMediaSourceDownloadResult_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function put_InputStream
   (
      This       : access IAdaptiveMediaSourceDownloadResult_Interface
      ; value : Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Buffer
   (
      This       : access IAdaptiveMediaSourceDownloadResult_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_Buffer
   (
      This       : access IAdaptiveMediaSourceDownloadResult_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentType
   (
      This       : access IAdaptiveMediaSourceDownloadResult_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentType
   (
      This       : access IAdaptiveMediaSourceDownloadResult_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedStatus
   (
      This       : access IAdaptiveMediaSourceDownloadResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ExtendedStatus
   (
      This       : access IAdaptiveMediaSourceDownloadResult_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadResult : aliased constant Windows.IID := (4105165939, 48366, 19050, (159, 10, 254, 196, 30, 35, 57, 176 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResourceByteRangeOffset
   (
      This       : access IAdaptiveMediaSourceDownloadResult2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ResourceByteRangeOffset
   (
      This       : access IAdaptiveMediaSourceDownloadResult2_Interface
      ; value : Windows.Foundation.IReference_UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceByteRangeLength
   (
      This       : access IAdaptiveMediaSourceDownloadResult2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ResourceByteRangeLength
   (
      This       : access IAdaptiveMediaSourceDownloadResult2_Interface
      ; value : Windows.Foundation.IReference_UInt64
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadResult2 : aliased constant Windows.IID := (357903543, 31616, 19140, (134, 96, 164, 185, 127, 124, 112, 240 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadRequestedDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IAdaptiveMediaSourceDownloadRequestedDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadRequestedDeferral : aliased constant Windows.IID := (96898916, 64032, 19901, (152, 33, 75, 244, 201, 191, 119, 171 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResourceType
   (
      This       : access IAdaptiveMediaSourceDownloadCompletedEventArgs_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceUri
   (
      This       : access IAdaptiveMediaSourceDownloadCompletedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceByteRangeOffset
   (
      This       : access IAdaptiveMediaSourceDownloadCompletedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceByteRangeLength
   (
      This       : access IAdaptiveMediaSourceDownloadCompletedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HttpResponseMessage
   (
      This       : access IAdaptiveMediaSourceDownloadCompletedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpResponseMessage
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadCompletedEventArgs : aliased constant Windows.IID := (421793219, 23351, 18970, (137, 112, 214, 33, 203, 108, 168, 59 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadStatistics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentBytesReceivedCount
   (
      This       : access IAdaptiveMediaSourceDownloadStatistics_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeToHeadersReceived
   (
      This       : access IAdaptiveMediaSourceDownloadStatistics_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeToFirstByteReceived
   (
      This       : access IAdaptiveMediaSourceDownloadStatistics_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeToLastByteReceived
   (
      This       : access IAdaptiveMediaSourceDownloadStatistics_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadStatistics : aliased constant Windows.IID := (2735132411, 59754, 19967, (169, 184, 26, 224, 140, 1, 174, 152 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadCompletedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestId
   (
      This       : access IAdaptiveMediaSourceDownloadCompletedEventArgs2_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Statistics
   (
      This       : access IAdaptiveMediaSourceDownloadCompletedEventArgs2_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadStatistics
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IAdaptiveMediaSourceDownloadCompletedEventArgs2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadCompletedEventArgs2 : aliased constant Windows.IID := (1883718852, 38474, 16612, (175, 149, 145, 119, 221, 109, 250, 0 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResourceType
   (
      This       : access IAdaptiveMediaSourceDownloadFailedEventArgs_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceUri
   (
      This       : access IAdaptiveMediaSourceDownloadFailedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceByteRangeOffset
   (
      This       : access IAdaptiveMediaSourceDownloadFailedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceByteRangeLength
   (
      This       : access IAdaptiveMediaSourceDownloadFailedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HttpResponseMessage
   (
      This       : access IAdaptiveMediaSourceDownloadFailedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpResponseMessage
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadFailedEventArgs : aliased constant Windows.IID := (930320456, 62635, 16548, (177, 53, 198, 223, 216, 189, 127, 241 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDownloadFailedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestId
   (
      This       : access IAdaptiveMediaSourceDownloadFailedEventArgs2_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IAdaptiveMediaSourceDownloadFailedEventArgs2_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Statistics
   (
      This       : access IAdaptiveMediaSourceDownloadFailedEventArgs2_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadStatistics
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IAdaptiveMediaSourceDownloadFailedEventArgs2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDownloadFailedEventArgs2 : aliased constant Windows.IID := (1888589160, 38524, 18822, (144, 197, 198, 252, 75, 49, 226, 216 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DiagnosticType
   (
      This       : access IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDiagnosticType
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestId
   (
      This       : access IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SegmentId
   (
      This       : access IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceType
   (
      This       : access IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IReference_AdaptiveMediaSourceResourceType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceUri
   (
      This       : access IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceByteRangeOffset
   (
      This       : access IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceByteRangeLength
   (
      This       : access IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Bitrate
   (
      This       : access IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDiagnosticAvailableEventArgs : aliased constant Windows.IID := (989220614, 28060, 18762, (183, 169, 179, 165, 222, 230, 173, 104 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDiagnosticAvailableEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedError
   (
      This       : access IAdaptiveMediaSourceDiagnosticAvailableEventArgs2_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDiagnosticAvailableEventArgs2 : aliased constant Windows.IID := (2356009047, 5797, 19871, (129, 14, 0, 189, 144, 27, 62, 249 ));
   
   ------------------------------------------------------------------------
   type IAdaptiveMediaSourceDiagnostics_Interface is interface and Windows.IInspectable_Interface;
   
   function add_DiagnosticAvailable
   (
      This       : access IAdaptiveMediaSourceDiagnostics_Interface
      ; handler : TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DiagnosticAvailable
   (
      This       : access IAdaptiveMediaSourceDiagnostics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdaptiveMediaSourceDiagnostics : aliased constant Windows.IID := (2602888808, 38446, 17548, (174, 191, 178, 155, 86, 9, 142, 35 ));
   
   ------------------------------------------------------------------------
   type IMediaSource_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IAdaptiveMediaSourceCreationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAdaptiveMediaSourceCreationResult_Interface
      ; handler : Windows.Media.Streaming.Adaptive.AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAdaptiveMediaSourceCreationResult_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAdaptiveMediaSourceCreationResult_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IAdaptiveMediaSourceCreationResult : aliased constant Windows.IID := (3188444189, 54790, 22994, (178, 249, 255, 32, 69, 67, 218, 18 ));
   
   ------------------------------------------------------------------------
   type IReference_AdaptiveMediaSourceResourceType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_AdaptiveMediaSourceResourceType_Interface
      ; RetVal : access Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType
   )
   return Windows.HRESULT is abstract;
   
   IID_IReference_AdaptiveMediaSourceResourceType : aliased constant Windows.IID := (1959314346, 56835, 23536, (170, 232, 170, 139, 105, 32, 102, 179 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult_Interface
      ; asyncInfo : Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult : aliased constant Windows.IID := (3177761792, 29260, 23158, (164, 55, 20, 100, 235, 221, 164, 172 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged_Interface(Callback : access procedure (sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged : aliased constant Windows.IID := (2904984751, 32160, 23252, (133, 133, 206, 235, 144, 61, 189, 80 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged_Interface(Callback : access procedure (sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged : aliased constant Windows.IID := (3746516617, 24947, 21403, (148, 216, 105, 183, 203, 117, 120, 167 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested_Interface(Callback : access procedure (sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested : aliased constant Windows.IID := (3552041969, 64910, 22686, (156, 127, 186, 103, 57, 126, 80, 205 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted_Interface(Callback : access procedure (sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted : aliased constant Windows.IID := (3472324061, 9650, 21896, (141, 81, 218, 205, 234, 102, 10, 125 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed_Interface(Callback : access procedure (sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed : aliased constant Windows.IID := (1860553796, 18861, 20792, (171, 71, 245, 192, 117, 162, 188, 52 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable_Interface(Callback : access procedure (sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable : aliased constant Windows.IID := (4249675445, 31803, 22772, (158, 252, 29, 158, 230, 160, 157, 33 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AdaptiveMediaSource is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource;
   subtype AdaptiveMediaSourceCreationResult is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult;
   subtype AdaptiveMediaSourceDownloadBitrateChangedEventArgs is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs;
   subtype AdaptiveMediaSourcePlaybackBitrateChangedEventArgs is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs;
   subtype AdaptiveMediaSourceDownloadRequestedEventArgs is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs;
   subtype AdaptiveMediaSourceDownloadCompletedEventArgs is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs;
   subtype AdaptiveMediaSourceDownloadFailedEventArgs is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs;
   subtype AdaptiveMediaSourceAdvancedSettings is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceAdvancedSettings;
   subtype AdaptiveMediaSourceDiagnostics is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics;
   subtype AdaptiveMediaSourceCorrelatedTimes is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCorrelatedTimes;
   subtype AdaptiveMediaSourceDownloadResult is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult;
   subtype AdaptiveMediaSourceDownloadRequestedDeferral is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedDeferral;
   subtype AdaptiveMediaSourceDownloadStatistics is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadStatistics;
   subtype AdaptiveMediaSourceDiagnosticAvailableEventArgs is Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function IsContentTypeSupported
   (
      contentType : Windows.String
   )
   return Windows.Boolean;
   
   function CreateFromUriAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult;
   
   function CreateFromUriWithDownloaderAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; httpClient : Windows.Web.Http.IHttpClient
   )
   return Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult;
   
   function CreateFromStreamAsync
   (
      stream : Windows.Storage.Streams.IInputStream
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; contentType : Windows.String
   )
   return Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult;
   
   function CreateFromStreamWithDownloaderAsync
   (
      stream : Windows.Storage.Streams.IInputStream
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; contentType : Windows.String
      ; httpClient : Windows.Web.Http.IHttpClient
   )
   return Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult;

end;
