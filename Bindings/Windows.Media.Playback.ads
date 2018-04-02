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
with Windows.Foundation.Collections;
limited with Windows.Media.Protection;
limited with Windows.Storage;
limited with Windows.Storage.Streams;
limited with Windows.Media.Core;
limited with Windows.Devices.Enumeration;
limited with Windows.Media.Casting;
limited with Windows.UI.Composition;
limited with Windows.Graphics.DirectX.Direct3D11;
limited with Windows.Media.MediaProperties;
with Windows.Foundation.Numerics;
--------------------------------------------------------------------------------
package Windows.Media.Playback is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MediaPlayerState is (
      Closed,
      Opening,
      Buffering,
      Playing,
      Paused,
      Stopped
   );
   for MediaPlayerState use (
      Closed => 0,
      Opening => 1,
      Buffering => 2,
      Playing => 3,
      Paused => 4,
      Stopped => 5
   );
   for MediaPlayerState'Size use 32;
   
   type MediaPlayerState_Ptr is access MediaPlayerState;
   
   type MediaPlaybackState is (
      None,
      Opening,
      Buffering,
      Playing,
      Paused
   );
   for MediaPlaybackState use (
      None => 0,
      Opening => 1,
      Buffering => 2,
      Playing => 3,
      Paused => 4
   );
   for MediaPlaybackState'Size use 32;
   
   type MediaPlaybackState_Ptr is access MediaPlaybackState;
   
   type MediaPlayerError is (
      Unknown,
      Aborted,
      NetworkError,
      DecodingError,
      SourceNotSupported
   );
   for MediaPlayerError use (
      Unknown => 0,
      Aborted => 1,
      NetworkError => 2,
      DecodingError => 3,
      SourceNotSupported => 4
   );
   for MediaPlayerError'Size use 32;
   
   type MediaPlayerError_Ptr is access MediaPlayerError;
   
   type MediaPlayerAudioCategory is (
      Other,
      Communications,
      Alerts,
      SoundEffects,
      GameEffects,
      GameMedia,
      GameChat,
      Speech,
      Movie,
      Media
   );
   for MediaPlayerAudioCategory use (
      Other => 0,
      Communications => 3,
      Alerts => 4,
      SoundEffects => 5,
      GameEffects => 6,
      GameMedia => 7,
      GameChat => 8,
      Speech => 9,
      Movie => 10,
      Media => 11
   );
   for MediaPlayerAudioCategory'Size use 32;
   
   type MediaPlayerAudioCategory_Ptr is access MediaPlayerAudioCategory;
   
   type MediaPlayerAudioDeviceType is (
      Console,
      Multimedia,
      Communications
   );
   for MediaPlayerAudioDeviceType use (
      Console => 0,
      Multimedia => 1,
      Communications => 2
   );
   for MediaPlayerAudioDeviceType'Size use 32;
   
   type MediaPlayerAudioDeviceType_Ptr is access MediaPlayerAudioDeviceType;
   
   type StereoscopicVideoRenderMode is (
      Mono,
      Stereo
   );
   for StereoscopicVideoRenderMode use (
      Mono => 0,
      Stereo => 1
   );
   for StereoscopicVideoRenderMode'Size use 32;
   
   type StereoscopicVideoRenderMode_Ptr is access StereoscopicVideoRenderMode;
   
   type SphericalVideoProjectionMode is (
      Spherical,
      Flat
   );
   for SphericalVideoProjectionMode use (
      Spherical => 0,
      Flat => 1
   );
   for SphericalVideoProjectionMode'Size use 32;
   
   type SphericalVideoProjectionMode_Ptr is access SphericalVideoProjectionMode;
   
   type MediaCommandEnablingRule is (
      Auto,
      Always,
      Never
   );
   for MediaCommandEnablingRule use (
      Auto => 0,
      Always => 1,
      Never => 2
   );
   for MediaCommandEnablingRule'Size use 32;
   
   type MediaCommandEnablingRule_Ptr is access MediaCommandEnablingRule;
   
   type MediaPlaybackItemErrorCode is (
      None,
      Aborted,
      NetworkError,
      DecodeError,
      SourceNotSupportedError,
      EncryptionError
   );
   for MediaPlaybackItemErrorCode use (
      None => 0,
      Aborted => 1,
      NetworkError => 2,
      DecodeError => 3,
      SourceNotSupportedError => 4,
      EncryptionError => 5
   );
   for MediaPlaybackItemErrorCode'Size use 32;
   
   type MediaPlaybackItemErrorCode_Ptr is access MediaPlaybackItemErrorCode;
   
   type FailedMediaStreamKind is (
      Unknown,
      Audio,
      Video
   );
   for FailedMediaStreamKind use (
      Unknown => 0,
      Audio => 1,
      Video => 2
   );
   for FailedMediaStreamKind'Size use 32;
   
   type FailedMediaStreamKind_Ptr is access FailedMediaStreamKind;
   
   type TimedMetadataTrackPresentationMode is (
      Disabled,
      Hidden,
      ApplicationPresented,
      PlatformPresented
   );
   for TimedMetadataTrackPresentationMode use (
      Disabled => 0,
      Hidden => 1,
      ApplicationPresented => 2,
      PlatformPresented => 3
   );
   for TimedMetadataTrackPresentationMode'Size use 32;
   
   type TimedMetadataTrackPresentationMode_Ptr is access TimedMetadataTrackPresentationMode;
   
   type MediaBreakInsertionMethod is (
      Interrupt,
      Replace
   );
   for MediaBreakInsertionMethod use (
      Interrupt => 0,
      Replace => 1
   );
   for MediaBreakInsertionMethod'Size use 32;
   
   type MediaBreakInsertionMethod_Ptr is access MediaBreakInsertionMethod;
   
   type MediaPlaybackItemChangedReason is (
      InitialItem,
      EndOfStream,
      Error,
      AppRequested
   );
   for MediaPlaybackItemChangedReason use (
      InitialItem => 0,
      EndOfStream => 1,
      Error => 2,
      AppRequested => 3
   );
   for MediaPlaybackItemChangedReason'Size use 32;
   
   type MediaPlaybackItemChangedReason_Ptr is access MediaPlaybackItemChangedReason;
   
   type AutoLoadedDisplayPropertyKind is (
      None,
      MusicOrVideo,
      Music,
      Video
   );
   for AutoLoadedDisplayPropertyKind use (
      None => 0,
      MusicOrVideo => 1,
      Music => 2,
      Video => 3
   );
   for AutoLoadedDisplayPropertyKind'Size use 32;
   
   type AutoLoadedDisplayPropertyKind_Ptr is access AutoLoadedDisplayPropertyKind;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IMediaPlayer_add_MediaOpened_Interface;
   type TypedEventHandler_IMediaPlayer_add_MediaOpened is access all TypedEventHandler_IMediaPlayer_add_MediaOpened_Interface'Class;
   type TypedEventHandler_IMediaPlayer_add_MediaOpened_Ptr is access all TypedEventHandler_IMediaPlayer_add_MediaOpened;
   type TypedEventHandler_IMediaPlayer_add_MediaEnded_Interface;
   type TypedEventHandler_IMediaPlayer_add_MediaEnded is access all TypedEventHandler_IMediaPlayer_add_MediaEnded_Interface'Class;
   type TypedEventHandler_IMediaPlayer_add_MediaEnded_Ptr is access all TypedEventHandler_IMediaPlayer_add_MediaEnded;
   type TypedEventHandler_IMediaPlayer_add_MediaFailed_Interface;
   type TypedEventHandler_IMediaPlayer_add_MediaFailed is access all TypedEventHandler_IMediaPlayer_add_MediaFailed_Interface'Class;
   type TypedEventHandler_IMediaPlayer_add_MediaFailed_Ptr is access all TypedEventHandler_IMediaPlayer_add_MediaFailed;
   type TypedEventHandler_IMediaPlayer_add_CurrentStateChanged_Interface;
   type TypedEventHandler_IMediaPlayer_add_CurrentStateChanged is access all TypedEventHandler_IMediaPlayer_add_CurrentStateChanged_Interface'Class;
   type TypedEventHandler_IMediaPlayer_add_CurrentStateChanged_Ptr is access all TypedEventHandler_IMediaPlayer_add_CurrentStateChanged;
   type TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached_Interface;
   type TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached is access all TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached_Interface'Class;
   type TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached_Ptr is access all TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached;
   type TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged_Interface;
   type TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged is access all TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged_Interface'Class;
   type TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged_Ptr is access all TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged;
   type TypedEventHandler_IMediaPlayer_add_VolumeChanged_Interface;
   type TypedEventHandler_IMediaPlayer_add_VolumeChanged is access all TypedEventHandler_IMediaPlayer_add_VolumeChanged_Interface'Class;
   type TypedEventHandler_IMediaPlayer_add_VolumeChanged_Ptr is access all TypedEventHandler_IMediaPlayer_add_VolumeChanged;
   type TypedEventHandler_IMediaPlayer_add_SeekCompleted_Interface;
   type TypedEventHandler_IMediaPlayer_add_SeekCompleted is access all TypedEventHandler_IMediaPlayer_add_SeekCompleted_Interface'Class;
   type TypedEventHandler_IMediaPlayer_add_SeekCompleted_Ptr is access all TypedEventHandler_IMediaPlayer_add_SeekCompleted;
   type TypedEventHandler_IMediaPlayer_add_BufferingStarted_Interface;
   type TypedEventHandler_IMediaPlayer_add_BufferingStarted is access all TypedEventHandler_IMediaPlayer_add_BufferingStarted_Interface'Class;
   type TypedEventHandler_IMediaPlayer_add_BufferingStarted_Ptr is access all TypedEventHandler_IMediaPlayer_add_BufferingStarted;
   type TypedEventHandler_IMediaPlayer_add_BufferingEnded_Interface;
   type TypedEventHandler_IMediaPlayer_add_BufferingEnded is access all TypedEventHandler_IMediaPlayer_add_BufferingEnded_Interface'Class;
   type TypedEventHandler_IMediaPlayer_add_BufferingEnded_Ptr is access all TypedEventHandler_IMediaPlayer_add_BufferingEnded;
   type TypedEventHandler_IMediaPlayer3_add_IsMutedChanged_Interface;
   type TypedEventHandler_IMediaPlayer3_add_IsMutedChanged is access all TypedEventHandler_IMediaPlayer3_add_IsMutedChanged_Interface'Class;
   type TypedEventHandler_IMediaPlayer3_add_IsMutedChanged_Ptr is access all TypedEventHandler_IMediaPlayer3_add_IsMutedChanged;
   type TypedEventHandler_IMediaPlayer3_add_SourceChanged_Interface;
   type TypedEventHandler_IMediaPlayer3_add_SourceChanged is access all TypedEventHandler_IMediaPlayer3_add_SourceChanged_Interface'Class;
   type TypedEventHandler_IMediaPlayer3_add_SourceChanged_Ptr is access all TypedEventHandler_IMediaPlayer3_add_SourceChanged;
   type TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable_Interface;
   type TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable is access all TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable_Interface'Class;
   type TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable_Ptr is access all TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable;
   type TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged_Interface;
   type TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged is access all TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged_Interface'Class;
   type TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged_Ptr is access all TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged;
   type TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged is access all TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged;
   type TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged is access all TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged;
   type TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted_Interface;
   type TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted is access all TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted_Ptr is access all TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted;
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted_Interface;
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted is access all TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted_Ptr is access all TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted;
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded_Interface;
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded is access all TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded_Ptr is access all TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded;
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged is access all TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged;
   type TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged is access all TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged;
   type TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged is access all TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged;
   type TypedEventHandler_IMediaPlaybackSession_add_PositionChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession_add_PositionChanged is access all TypedEventHandler_IMediaPlaybackSession_add_PositionChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession_add_PositionChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession_add_PositionChanged;
   type TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged is access all TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged;
   type TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged is access all TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged;
   type TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged is access all TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged;
   type TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged is access all TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged;
   type TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged_Interface;
   type TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged is access all TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged_Ptr is access all TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged;
   type TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver_Interface;
   type TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver is access all TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver_Interface'Class;
   type TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver_Ptr is access all TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver;
   type TypedEventHandler_IMediaBreakManager_add_BreakStarted_Interface;
   type TypedEventHandler_IMediaBreakManager_add_BreakStarted is access all TypedEventHandler_IMediaBreakManager_add_BreakStarted_Interface'Class;
   type TypedEventHandler_IMediaBreakManager_add_BreakStarted_Ptr is access all TypedEventHandler_IMediaBreakManager_add_BreakStarted;
   type TypedEventHandler_IMediaBreakManager_add_BreakEnded_Interface;
   type TypedEventHandler_IMediaBreakManager_add_BreakEnded is access all TypedEventHandler_IMediaBreakManager_add_BreakEnded_Interface'Class;
   type TypedEventHandler_IMediaBreakManager_add_BreakEnded_Ptr is access all TypedEventHandler_IMediaBreakManager_add_BreakEnded;
   type TypedEventHandler_IMediaBreakManager_add_BreakSkipped_Interface;
   type TypedEventHandler_IMediaBreakManager_add_BreakSkipped is access all TypedEventHandler_IMediaBreakManager_add_BreakSkipped_Interface'Class;
   type TypedEventHandler_IMediaBreakManager_add_BreakSkipped_Ptr is access all TypedEventHandler_IMediaBreakManager_add_BreakSkipped;
   type EventHandler_IMediaPlayerDataReceivedEventArgs_Interface;
   type EventHandler_IMediaPlayerDataReceivedEventArgs is access all EventHandler_IMediaPlayerDataReceivedEventArgs_Interface'Class;
   type EventHandler_IMediaPlayerDataReceivedEventArgs_Ptr is access all EventHandler_IMediaPlayerDataReceivedEventArgs;
   type TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged is access all TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived is access all TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived is access all TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived is access all TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived is access all TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived is access all TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived is access all TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived is access all TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived is access all TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived is access all TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived_Interface;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived is access all TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived_Interface'Class;
   type TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived_Ptr is access all TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived;
   type TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged_Interface;
   type TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged is access all TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged_Ptr is access all TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged;
   type TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged_Interface;
   type TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged is access all TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged_Ptr is access all TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged;
   type TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged_Interface;
   type TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged is access all TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged_Ptr is access all TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged;
   type TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged_Interface;
   type TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged is access all TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged_Interface'Class;
   type TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged_Ptr is access all TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged;
   type TypedEventHandler_IMediaPlaybackList_add_ItemFailed_Interface;
   type TypedEventHandler_IMediaPlaybackList_add_ItemFailed is access all TypedEventHandler_IMediaPlaybackList_add_ItemFailed_Interface'Class;
   type TypedEventHandler_IMediaPlaybackList_add_ItemFailed_Ptr is access all TypedEventHandler_IMediaPlaybackList_add_ItemFailed;
   type TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged_Interface;
   type TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged is access all TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged_Ptr is access all TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged;
   type TypedEventHandler_IMediaPlaybackList_add_ItemOpened_Interface;
   type TypedEventHandler_IMediaPlaybackList_add_ItemOpened is access all TypedEventHandler_IMediaPlaybackList_add_ItemOpened_Interface'Class;
   type TypedEventHandler_IMediaPlaybackList_add_ItemOpened_Ptr is access all TypedEventHandler_IMediaPlaybackList_add_ItemOpened;
   type VectorChangedEventHandler_IMediaPlaybackItem_Interface;
   type VectorChangedEventHandler_IMediaPlaybackItem is access all VectorChangedEventHandler_IMediaPlaybackItem_Interface'Class;
   type VectorChangedEventHandler_IMediaPlaybackItem_Ptr is access all VectorChangedEventHandler_IMediaPlaybackItem;
   type TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged_Interface;
   type TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged is access all TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged_Interface'Class;
   type TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged_Ptr is access all TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPlaybackMediaMarker_Interface;
   type IPlaybackMediaMarker is access all IPlaybackMediaMarker_Interface'Class;
   type IPlaybackMediaMarker_Ptr is access all IPlaybackMediaMarker;
   type IPlaybackMediaMarkerFactory_Interface;
   type IPlaybackMediaMarkerFactory is access all IPlaybackMediaMarkerFactory_Interface'Class;
   type IPlaybackMediaMarkerFactory_Ptr is access all IPlaybackMediaMarkerFactory;
   type IPlaybackMediaMarkerSequence_Interface;
   type IPlaybackMediaMarkerSequence is access all IPlaybackMediaMarkerSequence_Interface'Class;
   type IPlaybackMediaMarkerSequence_Ptr is access all IPlaybackMediaMarkerSequence;
   type IIterable_PlaybackMediaMarker_Interface;
   type IIterable_PlaybackMediaMarker is access all IIterable_PlaybackMediaMarker_Interface'Class;
   type IIterable_PlaybackMediaMarker_Ptr is access all IIterable_PlaybackMediaMarker;
   type IMediaPlayerFailedEventArgs_Interface;
   type IMediaPlayerFailedEventArgs is access all IMediaPlayerFailedEventArgs_Interface'Class;
   type IMediaPlayerFailedEventArgs_Ptr is access all IMediaPlayerFailedEventArgs;
   type IMediaPlayerRateChangedEventArgs_Interface;
   type IMediaPlayerRateChangedEventArgs is access all IMediaPlayerRateChangedEventArgs_Interface'Class;
   type IMediaPlayerRateChangedEventArgs_Ptr is access all IMediaPlayerRateChangedEventArgs;
   type IPlaybackMediaMarkerReachedEventArgs_Interface;
   type IPlaybackMediaMarkerReachedEventArgs is access all IPlaybackMediaMarkerReachedEventArgs_Interface'Class;
   type IPlaybackMediaMarkerReachedEventArgs_Ptr is access all IPlaybackMediaMarkerReachedEventArgs;
   type IMediaPlayerDataReceivedEventArgs_Interface;
   type IMediaPlayerDataReceivedEventArgs is access all IMediaPlayerDataReceivedEventArgs_Interface'Class;
   type IMediaPlayerDataReceivedEventArgs_Ptr is access all IMediaPlayerDataReceivedEventArgs;
   type IMediaPlayer_Interface;
   type IMediaPlayer is access all IMediaPlayer_Interface'Class;
   type IMediaPlayer_Ptr is access all IMediaPlayer;
   type IMediaPlayer2_Interface;
   type IMediaPlayer2 is access all IMediaPlayer2_Interface'Class;
   type IMediaPlayer2_Ptr is access all IMediaPlayer2;
   type IMediaPlayer3_Interface;
   type IMediaPlayer3 is access all IMediaPlayer3_Interface'Class;
   type IMediaPlayer3_Ptr is access all IMediaPlayer3;
   type IMediaPlayer4_Interface;
   type IMediaPlayer4 is access all IMediaPlayer4_Interface'Class;
   type IMediaPlayer4_Ptr is access all IMediaPlayer4;
   type IMediaPlayer5_Interface;
   type IMediaPlayer5 is access all IMediaPlayer5_Interface'Class;
   type IMediaPlayer5_Ptr is access all IMediaPlayer5;
   type IMediaPlayer6_Interface;
   type IMediaPlayer6 is access all IMediaPlayer6_Interface'Class;
   type IMediaPlayer6_Ptr is access all IMediaPlayer6;
   type IMediaPlaybackSession_Interface;
   type IMediaPlaybackSession is access all IMediaPlaybackSession_Interface'Class;
   type IMediaPlaybackSession_Ptr is access all IMediaPlaybackSession;
   type IMediaPlaybackSphericalVideoProjection_Interface;
   type IMediaPlaybackSphericalVideoProjection is access all IMediaPlaybackSphericalVideoProjection_Interface'Class;
   type IMediaPlaybackSphericalVideoProjection_Ptr is access all IMediaPlaybackSphericalVideoProjection;
   type IMediaPlaybackSession2_Interface;
   type IMediaPlaybackSession2 is access all IMediaPlaybackSession2_Interface'Class;
   type IMediaPlaybackSession2_Ptr is access all IMediaPlaybackSession2;
   type IMediaPlaybackSessionBufferingStartedEventArgs_Interface;
   type IMediaPlaybackSessionBufferingStartedEventArgs is access all IMediaPlaybackSessionBufferingStartedEventArgs_Interface'Class;
   type IMediaPlaybackSessionBufferingStartedEventArgs_Ptr is access all IMediaPlaybackSessionBufferingStartedEventArgs;
   type IMediaPlayerSource_Interface;
   type IMediaPlayerSource is access all IMediaPlayerSource_Interface'Class;
   type IMediaPlayerSource_Ptr is access all IMediaPlayerSource;
   type IMediaPlayerSource2_Interface;
   type IMediaPlayerSource2 is access all IMediaPlayerSource2_Interface'Class;
   type IMediaPlayerSource2_Ptr is access all IMediaPlayerSource2;
   type IMediaPlayerEffects_Interface;
   type IMediaPlayerEffects is access all IMediaPlayerEffects_Interface'Class;
   type IMediaPlayerEffects_Ptr is access all IMediaPlayerEffects;
   type IMediaPlayerEffects2_Interface;
   type IMediaPlayerEffects2 is access all IMediaPlayerEffects2_Interface'Class;
   type IMediaPlayerEffects2_Ptr is access all IMediaPlayerEffects2;
   type IMediaBreakStartedEventArgs_Interface;
   type IMediaBreakStartedEventArgs is access all IMediaBreakStartedEventArgs_Interface'Class;
   type IMediaBreakStartedEventArgs_Ptr is access all IMediaBreakStartedEventArgs;
   type IMediaBreakEndedEventArgs_Interface;
   type IMediaBreakEndedEventArgs is access all IMediaBreakEndedEventArgs_Interface'Class;
   type IMediaBreakEndedEventArgs_Ptr is access all IMediaBreakEndedEventArgs;
   type IMediaBreakSkippedEventArgs_Interface;
   type IMediaBreakSkippedEventArgs is access all IMediaBreakSkippedEventArgs_Interface'Class;
   type IMediaBreakSkippedEventArgs_Ptr is access all IMediaBreakSkippedEventArgs;
   type IMediaBreakSeekedOverEventArgs_Interface;
   type IMediaBreakSeekedOverEventArgs is access all IMediaBreakSeekedOverEventArgs_Interface'Class;
   type IMediaBreakSeekedOverEventArgs_Ptr is access all IMediaBreakSeekedOverEventArgs;
   type IMediaBreakManager_Interface;
   type IMediaBreakManager is access all IMediaBreakManager_Interface'Class;
   type IMediaBreakManager_Ptr is access all IMediaBreakManager;
   type IMediaPlayerSurface_Interface;
   type IMediaPlayerSurface is access all IMediaPlayerSurface_Interface'Class;
   type IMediaPlayerSurface_Ptr is access all IMediaPlayerSurface;
   type IBackgroundMediaPlayerStatics_Interface;
   type IBackgroundMediaPlayerStatics is access all IBackgroundMediaPlayerStatics_Interface'Class;
   type IBackgroundMediaPlayerStatics_Ptr is access all IBackgroundMediaPlayerStatics;
   type IMediaPlaybackCommandManagerPlayReceivedEventArgs_Interface;
   type IMediaPlaybackCommandManagerPlayReceivedEventArgs is access all IMediaPlaybackCommandManagerPlayReceivedEventArgs_Interface'Class;
   type IMediaPlaybackCommandManagerPlayReceivedEventArgs_Ptr is access all IMediaPlaybackCommandManagerPlayReceivedEventArgs;
   type IMediaPlaybackCommandManagerPauseReceivedEventArgs_Interface;
   type IMediaPlaybackCommandManagerPauseReceivedEventArgs is access all IMediaPlaybackCommandManagerPauseReceivedEventArgs_Interface'Class;
   type IMediaPlaybackCommandManagerPauseReceivedEventArgs_Ptr is access all IMediaPlaybackCommandManagerPauseReceivedEventArgs;
   type IMediaPlaybackCommandManagerNextReceivedEventArgs_Interface;
   type IMediaPlaybackCommandManagerNextReceivedEventArgs is access all IMediaPlaybackCommandManagerNextReceivedEventArgs_Interface'Class;
   type IMediaPlaybackCommandManagerNextReceivedEventArgs_Ptr is access all IMediaPlaybackCommandManagerNextReceivedEventArgs;
   type IMediaPlaybackCommandManagerPreviousReceivedEventArgs_Interface;
   type IMediaPlaybackCommandManagerPreviousReceivedEventArgs is access all IMediaPlaybackCommandManagerPreviousReceivedEventArgs_Interface'Class;
   type IMediaPlaybackCommandManagerPreviousReceivedEventArgs_Ptr is access all IMediaPlaybackCommandManagerPreviousReceivedEventArgs;
   type IMediaPlaybackCommandManagerFastForwardReceivedEventArgs_Interface;
   type IMediaPlaybackCommandManagerFastForwardReceivedEventArgs is access all IMediaPlaybackCommandManagerFastForwardReceivedEventArgs_Interface'Class;
   type IMediaPlaybackCommandManagerFastForwardReceivedEventArgs_Ptr is access all IMediaPlaybackCommandManagerFastForwardReceivedEventArgs;
   type IMediaPlaybackCommandManagerRewindReceivedEventArgs_Interface;
   type IMediaPlaybackCommandManagerRewindReceivedEventArgs is access all IMediaPlaybackCommandManagerRewindReceivedEventArgs_Interface'Class;
   type IMediaPlaybackCommandManagerRewindReceivedEventArgs_Ptr is access all IMediaPlaybackCommandManagerRewindReceivedEventArgs;
   type IMediaPlaybackCommandManagerShuffleReceivedEventArgs_Interface;
   type IMediaPlaybackCommandManagerShuffleReceivedEventArgs is access all IMediaPlaybackCommandManagerShuffleReceivedEventArgs_Interface'Class;
   type IMediaPlaybackCommandManagerShuffleReceivedEventArgs_Ptr is access all IMediaPlaybackCommandManagerShuffleReceivedEventArgs;
   type IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs_Interface;
   type IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs is access all IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs_Interface'Class;
   type IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs_Ptr is access all IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs;
   type IMediaPlaybackCommandManagerPositionReceivedEventArgs_Interface;
   type IMediaPlaybackCommandManagerPositionReceivedEventArgs is access all IMediaPlaybackCommandManagerPositionReceivedEventArgs_Interface'Class;
   type IMediaPlaybackCommandManagerPositionReceivedEventArgs_Ptr is access all IMediaPlaybackCommandManagerPositionReceivedEventArgs;
   type IMediaPlaybackCommandManagerRateReceivedEventArgs_Interface;
   type IMediaPlaybackCommandManagerRateReceivedEventArgs is access all IMediaPlaybackCommandManagerRateReceivedEventArgs_Interface'Class;
   type IMediaPlaybackCommandManagerRateReceivedEventArgs_Ptr is access all IMediaPlaybackCommandManagerRateReceivedEventArgs;
   type IMediaPlaybackCommandManagerCommandBehavior_Interface;
   type IMediaPlaybackCommandManagerCommandBehavior is access all IMediaPlaybackCommandManagerCommandBehavior_Interface'Class;
   type IMediaPlaybackCommandManagerCommandBehavior_Ptr is access all IMediaPlaybackCommandManagerCommandBehavior;
   type IMediaPlaybackCommandManager_Interface;
   type IMediaPlaybackCommandManager is access all IMediaPlaybackCommandManager_Interface'Class;
   type IMediaPlaybackCommandManager_Ptr is access all IMediaPlaybackCommandManager;
   type IMediaPlaybackSource_Interface;
   type IMediaPlaybackSource is access all IMediaPlaybackSource_Interface'Class;
   type IMediaPlaybackSource_Ptr is access all IMediaPlaybackSource;
   type IMediaPlaybackItemFactory_Interface;
   type IMediaPlaybackItemFactory is access all IMediaPlaybackItemFactory_Interface'Class;
   type IMediaPlaybackItemFactory_Ptr is access all IMediaPlaybackItemFactory;
   type IMediaPlaybackItemFactory2_Interface;
   type IMediaPlaybackItemFactory2 is access all IMediaPlaybackItemFactory2_Interface'Class;
   type IMediaPlaybackItemFactory2_Ptr is access all IMediaPlaybackItemFactory2;
   type IMediaPlaybackItemStatics_Interface;
   type IMediaPlaybackItemStatics is access all IMediaPlaybackItemStatics_Interface'Class;
   type IMediaPlaybackItemStatics_Ptr is access all IMediaPlaybackItemStatics;
   type IMediaPlaybackItem_Interface;
   type IMediaPlaybackItem is access all IMediaPlaybackItem_Interface'Class;
   type IMediaPlaybackItem_Ptr is access all IMediaPlaybackItem;
   type IVectorView_AudioTrack_Interface;
   type IVectorView_AudioTrack is access all IVectorView_AudioTrack_Interface'Class;
   type IVectorView_AudioTrack_Ptr is access all IVectorView_AudioTrack;
   type IIterable_AudioTrack_Interface;
   type IIterable_AudioTrack is access all IIterable_AudioTrack_Interface'Class;
   type IIterable_AudioTrack_Ptr is access all IIterable_AudioTrack;
   type IVectorView_VideoTrack_Interface;
   type IVectorView_VideoTrack is access all IVectorView_VideoTrack_Interface'Class;
   type IVectorView_VideoTrack_Ptr is access all IVectorView_VideoTrack;
   type IIterable_VideoTrack_Interface;
   type IIterable_VideoTrack is access all IIterable_VideoTrack_Interface'Class;
   type IIterable_VideoTrack_Ptr is access all IIterable_VideoTrack;
   type IVectorView_TimedMetadataTrack_Interface;
   type IVectorView_TimedMetadataTrack is access all IVectorView_TimedMetadataTrack_Interface'Class;
   type IVectorView_TimedMetadataTrack_Ptr is access all IVectorView_TimedMetadataTrack;
   type IIterable_TimedMetadataTrack_Interface;
   type IIterable_TimedMetadataTrack is access all IIterable_TimedMetadataTrack_Interface'Class;
   type IIterable_TimedMetadataTrack_Ptr is access all IIterable_TimedMetadataTrack;
   type IMediaItemDisplayProperties_Interface;
   type IMediaItemDisplayProperties is access all IMediaItemDisplayProperties_Interface'Class;
   type IMediaItemDisplayProperties_Ptr is access all IMediaItemDisplayProperties;
   type IMediaPlaybackItem2_Interface;
   type IMediaPlaybackItem2 is access all IMediaPlaybackItem2_Interface'Class;
   type IMediaPlaybackItem2_Ptr is access all IMediaPlaybackItem2;
   type IMediaPlaybackItem3_Interface;
   type IMediaPlaybackItem3 is access all IMediaPlaybackItem3_Interface'Class;
   type IMediaPlaybackItem3_Ptr is access all IMediaPlaybackItem3;
   type IMediaBreakFactory_Interface;
   type IMediaBreakFactory is access all IMediaBreakFactory_Interface'Class;
   type IMediaBreakFactory_Ptr is access all IMediaBreakFactory;
   type IMediaBreak_Interface;
   type IMediaBreak is access all IMediaBreak_Interface'Class;
   type IMediaBreak_Ptr is access all IMediaBreak;
   type IMediaBreakSchedule_Interface;
   type IMediaBreakSchedule is access all IMediaBreakSchedule_Interface'Class;
   type IMediaBreakSchedule_Ptr is access all IMediaBreakSchedule;
   type IMediaPlaybackItemError_Interface;
   type IMediaPlaybackItemError is access all IMediaPlaybackItemError_Interface'Class;
   type IMediaPlaybackItemError_Ptr is access all IMediaPlaybackItemError;
   type IMediaEnginePlaybackSource_Interface;
   type IMediaEnginePlaybackSource is access all IMediaEnginePlaybackSource_Interface'Class;
   type IMediaEnginePlaybackSource_Ptr is access all IMediaEnginePlaybackSource;
   type IMediaPlaybackItemOpenedEventArgs_Interface;
   type IMediaPlaybackItemOpenedEventArgs is access all IMediaPlaybackItemOpenedEventArgs_Interface'Class;
   type IMediaPlaybackItemOpenedEventArgs_Ptr is access all IMediaPlaybackItemOpenedEventArgs;
   type IMediaPlaybackItemFailedEventArgs_Interface;
   type IMediaPlaybackItemFailedEventArgs is access all IMediaPlaybackItemFailedEventArgs_Interface'Class;
   type IMediaPlaybackItemFailedEventArgs_Ptr is access all IMediaPlaybackItemFailedEventArgs;
   type ICurrentMediaPlaybackItemChangedEventArgs_Interface;
   type ICurrentMediaPlaybackItemChangedEventArgs is access all ICurrentMediaPlaybackItemChangedEventArgs_Interface'Class;
   type ICurrentMediaPlaybackItemChangedEventArgs_Ptr is access all ICurrentMediaPlaybackItemChangedEventArgs;
   type ICurrentMediaPlaybackItemChangedEventArgs2_Interface;
   type ICurrentMediaPlaybackItemChangedEventArgs2 is access all ICurrentMediaPlaybackItemChangedEventArgs2_Interface'Class;
   type ICurrentMediaPlaybackItemChangedEventArgs2_Ptr is access all ICurrentMediaPlaybackItemChangedEventArgs2;
   type IMediaPlaybackList_Interface;
   type IMediaPlaybackList is access all IMediaPlaybackList_Interface'Class;
   type IMediaPlaybackList_Ptr is access all IMediaPlaybackList;
   type IMediaPlaybackList2_Interface;
   type IMediaPlaybackList2 is access all IMediaPlaybackList2_Interface'Class;
   type IMediaPlaybackList2_Ptr is access all IMediaPlaybackList2;
   type IMediaPlaybackList3_Interface;
   type IMediaPlaybackList3 is access all IMediaPlaybackList3_Interface'Class;
   type IMediaPlaybackList3_Ptr is access all IMediaPlaybackList3;
   type IMediaPlaybackTimedMetadataTrackList_Interface;
   type IMediaPlaybackTimedMetadataTrackList is access all IMediaPlaybackTimedMetadataTrackList_Interface'Class;
   type IMediaPlaybackTimedMetadataTrackList_Ptr is access all IMediaPlaybackTimedMetadataTrackList;
   type ITimedMetadataPresentationModeChangedEventArgs_Interface;
   type ITimedMetadataPresentationModeChangedEventArgs is access all ITimedMetadataPresentationModeChangedEventArgs_Interface'Class;
   type ITimedMetadataPresentationModeChangedEventArgs_Ptr is access all ITimedMetadataPresentationModeChangedEventArgs;
   type ISingleSelectMediaTrackList_Imported_Interface;
   type ISingleSelectMediaTrackList_Imported is access all ISingleSelectMediaTrackList_Imported_Interface'Class;
   type ISingleSelectMediaTrackList_Imported_Ptr is access all ISingleSelectMediaTrackList_Imported;
   type IIterator_IMediaBreak_Interface;
   type IIterator_IMediaBreak is access all IIterator_IMediaBreak_Interface'Class;
   type IIterator_IMediaBreak_Ptr is access all IIterator_IMediaBreak;
   type IIterable_IMediaBreak_Interface;
   type IIterable_IMediaBreak is access all IIterable_IMediaBreak_Interface'Class;
   type IIterable_IMediaBreak_Ptr is access all IIterable_IMediaBreak;
   type IVectorView_IMediaBreak_Interface;
   type IVectorView_IMediaBreak is access all IVectorView_IMediaBreak_Interface'Class;
   type IVectorView_IMediaBreak_Ptr is access all IVectorView_IMediaBreak;
   type IIterator_IMediaPlaybackItem_Interface;
   type IIterator_IMediaPlaybackItem is access all IIterator_IMediaPlaybackItem_Interface'Class;
   type IIterator_IMediaPlaybackItem_Ptr is access all IIterator_IMediaPlaybackItem;
   type IIterable_IMediaPlaybackItem_Interface;
   type IIterable_IMediaPlaybackItem is access all IIterable_IMediaPlaybackItem_Interface'Class;
   type IIterable_IMediaPlaybackItem_Ptr is access all IIterable_IMediaPlaybackItem;
   type IVectorView_IMediaPlaybackItem_Interface;
   type IVectorView_IMediaPlaybackItem is access all IVectorView_IMediaPlaybackItem_Interface'Class;
   type IVectorView_IMediaPlaybackItem_Ptr is access all IVectorView_IMediaPlaybackItem;
   type IVector_IMediaPlaybackItem_Interface;
   type IVector_IMediaPlaybackItem is access all IVector_IMediaPlaybackItem_Interface'Class;
   type IVector_IMediaPlaybackItem_Ptr is access all IVector_IMediaPlaybackItem;
   type IObservableVector_IMediaPlaybackItem_Interface;
   type IObservableVector_IMediaPlaybackItem is access all IObservableVector_IMediaPlaybackItem_Interface'Class;
   type IObservableVector_IMediaPlaybackItem_Ptr is access all IObservableVector_IMediaPlaybackItem;
   
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
   type IPlaybackMediaMarker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Time
   (
      This       : access IPlaybackMediaMarker_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaMarkerType
   (
      This       : access IPlaybackMediaMarker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IPlaybackMediaMarker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlaybackMediaMarker : aliased constant Windows.IID := (3302109020, 15388, 17476, (182, 185, 119, 139, 4, 34, 212, 26 ));
   
   ------------------------------------------------------------------------
   type IPlaybackMediaMarkerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromTime
   (
      This       : access IPlaybackMediaMarkerFactory_Interface
      ; value : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Media.Playback.IPlaybackMediaMarker
   )
   return Windows.HRESULT is abstract;
   
   function Create
   (
      This       : access IPlaybackMediaMarkerFactory_Interface
      ; value : Windows.Foundation.TimeSpan
      ; mediaMarketType : Windows.String
      ; text : Windows.String
      ; RetVal : access Windows.Media.Playback.IPlaybackMediaMarker
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlaybackMediaMarkerFactory : aliased constant Windows.IID := (2354252408, 57518, 19994, (168, 200, 226, 63, 152, 42, 147, 123 ));
   
   ------------------------------------------------------------------------
   type IPlaybackMediaMarkerSequence_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Size
   (
      This       : access IPlaybackMediaMarkerSequence_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IPlaybackMediaMarkerSequence_Interface
      ; value : Windows.Media.Playback.IPlaybackMediaMarker
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IPlaybackMediaMarkerSequence_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlaybackMediaMarkerSequence : aliased constant Windows.IID := (4068543726, 25483, 18127, (136, 23, 29, 17, 31, 233, 216, 196 ));
   
   ------------------------------------------------------------------------
   type IIterable_PlaybackMediaMarker_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_PlaybackMediaMarker_Interface
      ; RetVal : access Windows.Media.Playback.IPlaybackMediaMarker
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_PlaybackMediaMarker : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayerFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IMediaPlayerFailedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.MediaPlayerError
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedErrorCode
   (
      This       : access IMediaPlayerFailedEventArgs_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorMessage
   (
      This       : access IMediaPlayerFailedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayerFailedEventArgs : aliased constant Windows.IID := (658827705, 42979, 20246, (186, 196, 121, 20, 235, 192, 131, 1 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayerRateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NewRate
   (
      This       : access IMediaPlayerRateChangedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayerRateChangedEventArgs : aliased constant Windows.IID := (1080036696, 15201, 19378, (152, 159, 252, 101, 96, 139, 108, 171 ));
   
   ------------------------------------------------------------------------
   type IPlaybackMediaMarkerReachedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PlaybackMediaMarker
   (
      This       : access IPlaybackMediaMarkerReachedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.IPlaybackMediaMarker
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlaybackMediaMarkerReachedEventArgs : aliased constant Windows.IID := (1468846521, 37090, 20064, (171, 196, 135, 64, 176, 31, 97, 150 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayerDataReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access IMediaPlayerDataReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayerDataReceivedEventArgs : aliased constant Windows.IID := (3344602117, 51201, 16682, (131, 91, 131, 252, 14, 98, 42, 142 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AutoPlay
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoPlay
   (
      This       : access IMediaPlayer_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalDuration
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access IMediaPlayer_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_BufferingProgress
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentState
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Media.Playback.MediaPlayerState
   )
   return Windows.HRESULT is abstract;
   
   function get_CanSeek
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanPause
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLoopingEnabled
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsLoopingEnabled
   (
      This       : access IMediaPlayer_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsProtected
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMuted
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsMuted
   (
      This       : access IMediaPlayer_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackRate
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_PlaybackRate
   (
      This       : access IMediaPlayer_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Volume
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Volume
   (
      This       : access IMediaPlayer_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackMediaMarkers
   (
      This       : access IMediaPlayer_Interface
      ; RetVal : access Windows.Media.Playback.IPlaybackMediaMarkerSequence
   )
   return Windows.HRESULT is abstract;
   
   function add_MediaOpened
   (
      This       : access IMediaPlayer_Interface
      ; value : TypedEventHandler_IMediaPlayer_add_MediaOpened
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MediaOpened
   (
      This       : access IMediaPlayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MediaEnded
   (
      This       : access IMediaPlayer_Interface
      ; value : TypedEventHandler_IMediaPlayer_add_MediaEnded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MediaEnded
   (
      This       : access IMediaPlayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MediaFailed
   (
      This       : access IMediaPlayer_Interface
      ; value : TypedEventHandler_IMediaPlayer_add_MediaFailed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MediaFailed
   (
      This       : access IMediaPlayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CurrentStateChanged
   (
      This       : access IMediaPlayer_Interface
      ; value : TypedEventHandler_IMediaPlayer_add_CurrentStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CurrentStateChanged
   (
      This       : access IMediaPlayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PlaybackMediaMarkerReached
   (
      This       : access IMediaPlayer_Interface
      ; value : TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlaybackMediaMarkerReached
   (
      This       : access IMediaPlayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MediaPlayerRateChanged
   (
      This       : access IMediaPlayer_Interface
      ; value : TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MediaPlayerRateChanged
   (
      This       : access IMediaPlayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VolumeChanged
   (
      This       : access IMediaPlayer_Interface
      ; value : TypedEventHandler_IMediaPlayer_add_VolumeChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VolumeChanged
   (
      This       : access IMediaPlayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SeekCompleted
   (
      This       : access IMediaPlayer_Interface
      ; value : TypedEventHandler_IMediaPlayer_add_SeekCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SeekCompleted
   (
      This       : access IMediaPlayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BufferingStarted
   (
      This       : access IMediaPlayer_Interface
      ; value : TypedEventHandler_IMediaPlayer_add_BufferingStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BufferingStarted
   (
      This       : access IMediaPlayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BufferingEnded
   (
      This       : access IMediaPlayer_Interface
      ; value : TypedEventHandler_IMediaPlayer_add_BufferingEnded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BufferingEnded
   (
      This       : access IMediaPlayer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Play
   (
      This       : access IMediaPlayer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Pause
   (
      This       : access IMediaPlayer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetUriSource
   (
      This       : access IMediaPlayer_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayer : aliased constant Windows.IID := (941261771, 28671, 18843, (141, 100, 40, 133, 223, 193, 36, 158 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayer2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SystemMediaTransportControls
   (
      This       : access IMediaPlayer2_Interface
      ; RetVal : access Windows.Media.ISystemMediaTransportControls
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioCategory
   (
      This       : access IMediaPlayer2_Interface
      ; RetVal : access Windows.Media.Playback.MediaPlayerAudioCategory
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioCategory
   (
      This       : access IMediaPlayer2_Interface
      ; value : Windows.Media.Playback.MediaPlayerAudioCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioDeviceType
   (
      This       : access IMediaPlayer2_Interface
      ; RetVal : access Windows.Media.Playback.MediaPlayerAudioDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioDeviceType
   (
      This       : access IMediaPlayer2_Interface
      ; value : Windows.Media.Playback.MediaPlayerAudioDeviceType
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayer2 : aliased constant Windows.IID := (1015288344, 8483, 20421, (144, 130, 47, 136, 63, 119, 189, 245 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayer3_Interface is interface and Windows.IInspectable_Interface;
   
   function add_IsMutedChanged
   (
      This       : access IMediaPlayer3_Interface
      ; value : TypedEventHandler_IMediaPlayer3_add_IsMutedChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsMutedChanged
   (
      This       : access IMediaPlayer3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceChanged
   (
      This       : access IMediaPlayer3_Interface
      ; value : TypedEventHandler_IMediaPlayer3_add_SourceChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceChanged
   (
      This       : access IMediaPlayer3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioBalance
   (
      This       : access IMediaPlayer3_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioBalance
   (
      This       : access IMediaPlayer3_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RealTimePlayback
   (
      This       : access IMediaPlayer3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RealTimePlayback
   (
      This       : access IMediaPlayer3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StereoscopicVideoRenderMode
   (
      This       : access IMediaPlayer3_Interface
      ; RetVal : access Windows.Media.Playback.StereoscopicVideoRenderMode
   )
   return Windows.HRESULT is abstract;
   
   function put_StereoscopicVideoRenderMode
   (
      This       : access IMediaPlayer3_Interface
      ; value : Windows.Media.Playback.StereoscopicVideoRenderMode
   )
   return Windows.HRESULT is abstract;
   
   function get_BreakManager
   (
      This       : access IMediaPlayer3_Interface
      ; RetVal : access Windows.Media.Playback.IMediaBreakManager
   )
   return Windows.HRESULT is abstract;
   
   function get_CommandManager
   (
      This       : access IMediaPlayer3_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManager
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioDevice
   (
      This       : access IMediaPlayer3_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioDevice
   (
      This       : access IMediaPlayer3_Interface
      ; value : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_TimelineController
   (
      This       : access IMediaPlayer3_Interface
      ; RetVal : access Windows.Media.IMediaTimelineController
   )
   return Windows.HRESULT is abstract;
   
   function put_TimelineController
   (
      This       : access IMediaPlayer3_Interface
      ; value : Windows.Media.IMediaTimelineController
   )
   return Windows.HRESULT is abstract;
   
   function get_TimelineControllerPositionOffset
   (
      This       : access IMediaPlayer3_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_TimelineControllerPositionOffset
   (
      This       : access IMediaPlayer3_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackSession
   (
      This       : access IMediaPlayer3_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackSession
   )
   return Windows.HRESULT is abstract;
   
   function StepForwardOneFrame
   (
      This       : access IMediaPlayer3_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StepBackwardOneFrame
   (
      This       : access IMediaPlayer3_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetAsCastingSource
   (
      This       : access IMediaPlayer3_Interface
      ; RetVal : access Windows.Media.Casting.ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayer3 : aliased constant Windows.IID := (3993395418, 795, 20459, (189, 155, 146, 224, 160, 168, 210, 153 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayer4_Interface is interface and Windows.IInspectable_Interface;
   
   function SetSurfaceSize
   (
      This       : access IMediaPlayer4_Interface
      ; size : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function GetSurface
   (
      This       : access IMediaPlayer4_Interface
      ; compositor : Windows.UI.Composition.ICompositor
      ; RetVal : access Windows.Media.Playback.IMediaPlayerSurface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayer4 : aliased constant Windows.IID := (2147704240, 29768, 18288, (175, 207, 42, 87, 69, 9, 20, 197 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayer5_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VideoFrameAvailable
   (
      This       : access IMediaPlayer5_Interface
      ; value : TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VideoFrameAvailable
   (
      This       : access IMediaPlayer5_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVideoFrameServerEnabled
   (
      This       : access IMediaPlayer5_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsVideoFrameServerEnabled
   (
      This       : access IMediaPlayer5_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CopyFrameToVideoSurface
   (
      This       : access IMediaPlayer5_Interface
      ; destination : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   function CopyFrameToVideoSurfaceWithTargetRectangle
   (
      This       : access IMediaPlayer5_Interface
      ; destination : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; targetRectangle : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function CopyFrameToStereoscopicVideoSurfaces
   (
      This       : access IMediaPlayer5_Interface
      ; destinationLeftEye : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; destinationRightEye : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayer5 : aliased constant Windows.IID := (3487905789, 63594, 17478, (191, 77, 200, 231, 146, 183, 180, 179 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayer6_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SubtitleFrameChanged
   (
      This       : access IMediaPlayer6_Interface
      ; handler : TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SubtitleFrameChanged
   (
      This       : access IMediaPlayer6_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function RenderSubtitlesToSurface
   (
      This       : access IMediaPlayer6_Interface
      ; destination : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function RenderSubtitlesToSurfaceWithTargetRectangle
   (
      This       : access IMediaPlayer6_Interface
      ; destination : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; targetRectangle : Windows.Foundation.Rect
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayer6 : aliased constant Windows.IID := (3771375750, 44645, 16716, (176, 16, 139, 197, 95, 0, 230, 146 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackSession_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PlaybackStateChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlaybackStateChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PlaybackRateChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlaybackRateChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SeekCompleted
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SeekCompleted
   (
      This       : access IMediaPlaybackSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BufferingStarted
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BufferingStarted
   (
      This       : access IMediaPlaybackSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BufferingEnded
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BufferingEnded
   (
      This       : access IMediaPlaybackSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BufferingProgressChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BufferingProgressChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DownloadProgressChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DownloadProgressChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NaturalDurationChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NaturalDurationChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PositionChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession_add_PositionChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PositionChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NaturalVideoSizeChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NaturalVideoSizeChanged
   (
      This       : access IMediaPlaybackSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaPlayer
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlayer
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalDuration
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackState
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Media.Playback.MediaPlaybackState
   )
   return Windows.HRESULT is abstract;
   
   function get_CanSeek
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanPause
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsProtected
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackRate
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_PlaybackRate
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_BufferingProgress
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DownloadProgress
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalVideoHeight
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalVideoWidth
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizedSourceRect
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_NormalizedSourceRect
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_StereoscopicVideoPackingMode
   (
      This       : access IMediaPlaybackSession_Interface
      ; RetVal : access Windows.Media.MediaProperties.StereoscopicVideoPackingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_StereoscopicVideoPackingMode
   (
      This       : access IMediaPlaybackSession_Interface
      ; value : Windows.Media.MediaProperties.StereoscopicVideoPackingMode
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackSession : aliased constant Windows.IID := (3274401853, 1031, 16826, (137, 70, 139, 52, 90, 90, 84, 53 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackSphericalVideoProjection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabled
   (
      This       : access IMediaPlaybackSphericalVideoProjection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access IMediaPlaybackSphericalVideoProjection_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameFormat
   (
      This       : access IMediaPlaybackSphericalVideoProjection_Interface
      ; RetVal : access Windows.Media.MediaProperties.SphericalVideoFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_FrameFormat
   (
      This       : access IMediaPlaybackSphericalVideoProjection_Interface
      ; value : Windows.Media.MediaProperties.SphericalVideoFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalFieldOfViewInDegrees
   (
      This       : access IMediaPlaybackSphericalVideoProjection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_HorizontalFieldOfViewInDegrees
   (
      This       : access IMediaPlaybackSphericalVideoProjection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewOrientation
   (
      This       : access IMediaPlaybackSphericalVideoProjection_Interface
      ; RetVal : access Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function put_ViewOrientation
   (
      This       : access IMediaPlaybackSphericalVideoProjection_Interface
      ; value : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function get_ProjectionMode
   (
      This       : access IMediaPlaybackSphericalVideoProjection_Interface
      ; RetVal : access Windows.Media.Playback.SphericalVideoProjectionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ProjectionMode
   (
      This       : access IMediaPlaybackSphericalVideoProjection_Interface
      ; value : Windows.Media.Playback.SphericalVideoProjectionMode
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackSphericalVideoProjection : aliased constant Windows.IID := (3557143420, 28430, 18017, (184, 238, 212, 135, 186, 151, 82, 213 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackSession2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_BufferedRangesChanged
   (
      This       : access IMediaPlaybackSession2_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BufferedRangesChanged
   (
      This       : access IMediaPlaybackSession2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PlayedRangesChanged
   (
      This       : access IMediaPlaybackSession2_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlayedRangesChanged
   (
      This       : access IMediaPlaybackSession2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SeekableRangesChanged
   (
      This       : access IMediaPlaybackSession2_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SeekableRangesChanged
   (
      This       : access IMediaPlaybackSession2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SupportedPlaybackRatesChanged
   (
      This       : access IMediaPlaybackSession2_Interface
      ; value : TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SupportedPlaybackRatesChanged
   (
      This       : access IMediaPlaybackSession2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_SphericalVideoProjection
   (
      This       : access IMediaPlaybackSession2_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackSphericalVideoProjection
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMirroring
   (
      This       : access IMediaPlaybackSession2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsMirroring
   (
      This       : access IMediaPlaybackSession2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetBufferedRanges
   (
      This       : access IMediaPlaybackSession2_Interface
      ; RetVal : access Windows.Media.IVectorView_MediaTimeRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPlayedRanges
   (
      This       : access IMediaPlaybackSession2_Interface
      ; RetVal : access Windows.Media.IVectorView_MediaTimeRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSeekableRanges
   (
      This       : access IMediaPlaybackSession2_Interface
      ; RetVal : access Windows.Media.IVectorView_MediaTimeRange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsSupportedPlaybackRateRange
   (
      This       : access IMediaPlaybackSession2_Interface
      ; rate1 : Windows.Double
      ; rate2 : Windows.Double
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackSession2 : aliased constant Windows.IID := (4172971129, 8136, 16535, (173, 112, 192, 250, 24, 204, 0, 80 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackSessionBufferingStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPlaybackInterruption
   (
      This       : access IMediaPlaybackSessionBufferingStartedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackSessionBufferingStartedEventArgs : aliased constant Windows.IID := (3446321133, 29922, 17333, (177, 21, 118, 35, 108, 51, 121, 26 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayerSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProtectionManager
   (
      This       : access IMediaPlayerSource_Interface
      ; RetVal : access Windows.Media.Protection.IMediaProtectionManager
   )
   return Windows.HRESULT is abstract;
   
   function put_ProtectionManager
   (
      This       : access IMediaPlayerSource_Interface
      ; value : Windows.Media.Protection.IMediaProtectionManager
   )
   return Windows.HRESULT is abstract;
   
   function SetFileSource
   (
      This       : access IMediaPlayerSource_Interface
      ; file : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function SetStreamSource
   (
      This       : access IMediaPlayerSource_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function SetMediaSource
   (
      This       : access IMediaPlayerSource_Interface
      ; source : Windows.Media.Core.IMediaSource
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayerSource : aliased constant Windows.IID := (3176106135, 5155, 19518, (130, 197, 15, 177, 175, 148, 247, 21 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayerSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access IMediaPlayerSource2_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackSource
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access IMediaPlayerSource2_Interface
      ; value : Windows.Media.Playback.IMediaPlaybackSource
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayerSource2 : aliased constant Windows.IID := (2185534367, 29474, 19467, (176, 59, 62, 105, 164, 130, 96, 197 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayerEffects_Interface is interface and Windows.IInspectable_Interface;
   
   function AddAudioEffect
   (
      This       : access IMediaPlayerEffects_Interface
      ; activatableClassId : Windows.String
      ; effectOptional : Windows.Boolean
      ; configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAllEffects
   (
      This       : access IMediaPlayerEffects_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayerEffects : aliased constant Windows.IID := (2241978074, 51894, 19648, (139, 227, 96, 53, 244, 222, 37, 145 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayerEffects2_Interface is interface and Windows.IInspectable_Interface;
   
   function AddVideoEffect
   (
      This       : access IMediaPlayerEffects2_Interface
      ; activatableClassId : Windows.String
      ; effectOptional : Windows.Boolean
      ; effectConfiguration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayerEffects2 : aliased constant Windows.IID := (4198603385, 7102, 18117, (174, 31, 142, 230, 159, 179, 194, 199 ));
   
   ------------------------------------------------------------------------
   type IMediaBreakStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MediaBreak
   (
      This       : access IMediaBreakStartedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBreakStartedEventArgs : aliased constant Windows.IID := (2826894961, 57300, 17738, (149, 110, 10, 74, 100, 131, 149, 248 ));
   
   ------------------------------------------------------------------------
   type IMediaBreakEndedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MediaBreak
   (
      This       : access IMediaBreakEndedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBreakEndedEventArgs : aliased constant Windows.IID := (850997878, 7261, 20462, (135, 50, 35, 109, 195, 168, 133, 128 ));
   
   ------------------------------------------------------------------------
   type IMediaBreakSkippedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MediaBreak
   (
      This       : access IMediaBreakSkippedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBreakSkippedEventArgs : aliased constant Windows.IID := (1860783109, 12116, 19006, (163, 171, 36, 195, 178, 112, 180, 163 ));
   
   ------------------------------------------------------------------------
   type IMediaBreakSeekedOverEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SeekedOverBreaks
   (
      This       : access IMediaBreakSeekedOverEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.IVectorView_IMediaBreak -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_OldPosition
   (
      This       : access IMediaBreakSeekedOverEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_NewPosition
   (
      This       : access IMediaBreakSeekedOverEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBreakSeekedOverEventArgs : aliased constant Windows.IID := (3853150022, 1542, 17554, (185, 211, 195, 200, 253, 224, 164, 234 ));
   
   ------------------------------------------------------------------------
   type IMediaBreakManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_BreaksSeekedOver
   (
      This       : access IMediaBreakManager_Interface
      ; handler : TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BreaksSeekedOver
   (
      This       : access IMediaBreakManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BreakStarted
   (
      This       : access IMediaBreakManager_Interface
      ; handler : TypedEventHandler_IMediaBreakManager_add_BreakStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BreakStarted
   (
      This       : access IMediaBreakManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BreakEnded
   (
      This       : access IMediaBreakManager_Interface
      ; handler : TypedEventHandler_IMediaBreakManager_add_BreakEnded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BreakEnded
   (
      This       : access IMediaBreakManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BreakSkipped
   (
      This       : access IMediaBreakManager_Interface
      ; handler : TypedEventHandler_IMediaBreakManager_add_BreakSkipped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BreakSkipped
   (
      This       : access IMediaBreakManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentBreak
   (
      This       : access IMediaBreakManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackSession
   (
      This       : access IMediaBreakManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackSession
   )
   return Windows.HRESULT is abstract;
   
   function PlayBreak
   (
      This       : access IMediaBreakManager_Interface
      ; value : Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function SkipCurrentBreak
   (
      This       : access IMediaBreakManager_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBreakManager : aliased constant Windows.IID := (2824134065, 65204, 19867, (157, 151, 15, 219, 229, 142, 94, 57 ));
   
   ------------------------------------------------------------------------
   type IMediaPlayerSurface_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CompositionSurface
   (
      This       : access IMediaPlayerSurface_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionSurface
   )
   return Windows.HRESULT is abstract;
   
   function get_Compositor
   (
      This       : access IMediaPlayerSurface_Interface
      ; RetVal : access Windows.UI.Composition.ICompositor
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaPlayer
   (
      This       : access IMediaPlayerSurface_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlayer
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlayerSurface : aliased constant Windows.IID := (248927164, 46902, 18883, (131, 11, 118, 74, 56, 69, 49, 58 ));
   
   ------------------------------------------------------------------------
   type IBackgroundMediaPlayerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IBackgroundMediaPlayerStatics_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlayer
   )
   return Windows.HRESULT is abstract;
   
   function add_MessageReceivedFromBackground
   (
      This       : access IBackgroundMediaPlayerStatics_Interface
      ; value : Windows.Media.Playback.EventHandler_IMediaPlayerDataReceivedEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MessageReceivedFromBackground
   (
      This       : access IBackgroundMediaPlayerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MessageReceivedFromForeground
   (
      This       : access IBackgroundMediaPlayerStatics_Interface
      ; value : Windows.Media.Playback.EventHandler_IMediaPlayerDataReceivedEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MessageReceivedFromForeground
   (
      This       : access IBackgroundMediaPlayerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function SendMessageToBackground
   (
      This       : access IBackgroundMediaPlayerStatics_Interface
      ; value : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function SendMessageToForeground
   (
      This       : access IBackgroundMediaPlayerStatics_Interface
      ; value : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function IsMediaPlaying
   (
      This       : access IBackgroundMediaPlayerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Shutdown
   (
      This       : access IBackgroundMediaPlayerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IBackgroundMediaPlayerStatics : aliased constant Windows.IID := (2238569409, 22007, 18207, (160, 242, 104, 172, 76, 144, 69, 146 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerPlayReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IMediaPlaybackCommandManagerPlayReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IMediaPlaybackCommandManagerPlayReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaPlaybackCommandManagerPlayReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerPlayReceivedEventArgs : aliased constant Windows.IID := (2599419982, 22411, 19542, (160, 6, 22, 21, 157, 136, 138, 72 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerPauseReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IMediaPlaybackCommandManagerPauseReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IMediaPlaybackCommandManagerPauseReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaPlaybackCommandManagerPauseReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerPauseReceivedEventArgs : aliased constant Windows.IID := (1559022876, 49756, 16929, (177, 108, 195, 201, 140, 224, 18, 214 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerNextReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IMediaPlaybackCommandManagerNextReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IMediaPlaybackCommandManagerNextReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaPlaybackCommandManagerNextReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerNextReceivedEventArgs : aliased constant Windows.IID := (3780133939, 41648, 17876, (185, 222, 95, 66, 172, 20, 168, 57 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerPreviousReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IMediaPlaybackCommandManagerPreviousReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IMediaPlaybackCommandManagerPreviousReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaPlaybackCommandManagerPreviousReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerPreviousReceivedEventArgs : aliased constant Windows.IID := (1381904513, 17970, 20342, (153, 177, 215, 113, 98, 63, 98, 135 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerFastForwardReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IMediaPlaybackCommandManagerFastForwardReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IMediaPlaybackCommandManagerFastForwardReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaPlaybackCommandManagerFastForwardReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerFastForwardReceivedEventArgs : aliased constant Windows.IID := (821060825, 46225, 19722, (188, 33, 48, 152, 189, 19, 50, 233 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerRewindReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IMediaPlaybackCommandManagerRewindReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IMediaPlaybackCommandManagerRewindReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaPlaybackCommandManagerRewindReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerRewindReceivedEventArgs : aliased constant Windows.IID := (2668124487, 41920, 16989, (170, 239, 151, 186, 120, 152, 177, 65 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerShuffleReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IMediaPlaybackCommandManagerShuffleReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IMediaPlaybackCommandManagerShuffleReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsShuffleRequested
   (
      This       : access IMediaPlaybackCommandManagerShuffleReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaPlaybackCommandManagerShuffleReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerShuffleReceivedEventArgs : aliased constant Windows.IID := (1352686831, 25582, 19094, (183, 181, 254, 224, 139, 159, 249, 12 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoRepeatMode
   (
      This       : access IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs_Interface
      ; RetVal : access Windows.Media.MediaPlaybackAutoRepeatMode
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs : aliased constant Windows.IID := (1030704931, 21040, 17425, (160, 233, 186, 217, 76, 42, 4, 92 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerPositionReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IMediaPlaybackCommandManagerPositionReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IMediaPlaybackCommandManagerPositionReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IMediaPlaybackCommandManagerPositionReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaPlaybackCommandManagerPositionReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerPositionReceivedEventArgs : aliased constant Windows.IID := (1435608916, 54823, 19421, (169, 13, 134, 160, 21, 178, 73, 2 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerRateReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IMediaPlaybackCommandManagerRateReceivedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IMediaPlaybackCommandManagerRateReceivedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackRate
   (
      This       : access IMediaPlaybackCommandManagerRateReceivedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IMediaPlaybackCommandManagerRateReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerRateReceivedEventArgs : aliased constant Windows.IID := (418003257, 18966, 16745, (139, 5, 62, 185, 245, 255, 120, 235 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManagerCommandBehavior_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CommandManager
   (
      This       : access IMediaPlaybackCommandManagerCommandBehavior_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManager
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IMediaPlaybackCommandManagerCommandBehavior_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_EnablingRule
   (
      This       : access IMediaPlaybackCommandManagerCommandBehavior_Interface
      ; RetVal : access Windows.Media.Playback.MediaCommandEnablingRule
   )
   return Windows.HRESULT is abstract;
   
   function put_EnablingRule
   (
      This       : access IMediaPlaybackCommandManagerCommandBehavior_Interface
      ; value : Windows.Media.Playback.MediaCommandEnablingRule
   )
   return Windows.HRESULT is abstract;
   
   function add_IsEnabledChanged
   (
      This       : access IMediaPlaybackCommandManagerCommandBehavior_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsEnabledChanged
   (
      This       : access IMediaPlaybackCommandManagerCommandBehavior_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManagerCommandBehavior : aliased constant Windows.IID := (2020351608, 52856, 18960, (175, 214, 132, 63, 203, 185, 12, 46 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackCommandManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabled
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaPlayer
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlayer
   )
   return Windows.HRESULT is abstract;
   
   function get_PlayBehavior
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_PauseBehavior
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_NextBehavior
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviousBehavior
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_FastForwardBehavior
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_RewindBehavior
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_ShuffleBehavior
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoRepeatModeBehavior
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionBehavior
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_RateBehavior
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
   )
   return Windows.HRESULT is abstract;
   
   function add_PlayReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlayReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PauseReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PauseReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NextReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NextReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PreviousReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PreviousReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_FastForwardReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FastForwardReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RewindReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RewindReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ShuffleReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ShuffleReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AutoRepeatModeReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AutoRepeatModeReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PositionReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PositionReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RateReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; handler : TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RateReceived
   (
      This       : access IMediaPlaybackCommandManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackCommandManager : aliased constant Windows.IID := (1523508646, 23734, 19034, (133, 33, 204, 134, 177, 193, 237, 55 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackSource_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IMediaPlaybackSource : aliased constant Windows.IID := (4020093628, 37655, 18070, (176, 81, 43, 173, 100, 49, 119, 181 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackItemFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IMediaPlaybackItemFactory_Interface
      ; source : Windows.Media.Core.IMediaSource2
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackItemFactory : aliased constant Windows.IID := (1899232481, 5993, 20473, (167, 193, 56, 210, 196, 212, 35, 96 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackItemFactory2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithStartTime
   (
      This       : access IMediaPlaybackItemFactory2_Interface
      ; source : Windows.Media.Core.IMediaSource2
      ; startTime : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithStartTimeAndDurationLimit
   (
      This       : access IMediaPlaybackItemFactory2_Interface
      ; source : Windows.Media.Core.IMediaSource2
      ; startTime : Windows.Foundation.TimeSpan
      ; durationLimit : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackItemFactory2 : aliased constant Windows.IID := (3615285050, 47431, 18802, (179, 93, 173, 251, 147, 26, 113, 230 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackItemStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindFromMediaSource
   (
      This       : access IMediaPlaybackItemStatics_Interface
      ; source : Windows.Media.Core.IMediaSource2
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackItemStatics : aliased constant Windows.IID := (1260120052, 17221, 16444, (138, 103, 245, 222, 145, 223, 76, 134 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackItem_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AudioTracksChanged
   (
      This       : access IMediaPlaybackItem_Interface
      ; handler : TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AudioTracksChanged
   (
      This       : access IMediaPlaybackItem_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VideoTracksChanged
   (
      This       : access IMediaPlaybackItem_Interface
      ; handler : TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VideoTracksChanged
   (
      This       : access IMediaPlaybackItem_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TimedMetadataTracksChanged
   (
      This       : access IMediaPlaybackItem_Interface
      ; handler : TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TimedMetadataTracksChanged
   (
      This       : access IMediaPlaybackItem_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access IMediaPlaybackItem_Interface
      ; RetVal : access Windows.Media.Core.IMediaSource2
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioTracks
   (
      This       : access IMediaPlaybackItem_Interface
      ; RetVal : access Windows.Media.Playback.IVectorView_AudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoTracks
   (
      This       : access IMediaPlaybackItem_Interface
      ; RetVal : access Windows.Media.Playback.IVectorView_VideoTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_TimedMetadataTracks
   (
      This       : access IMediaPlaybackItem_Interface
      ; RetVal : access Windows.Media.Playback.IVectorView_TimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackItem : aliased constant Windows.IID := (74487762, 58543, 18603, (178, 131, 105, 41, 230, 116, 236, 226 ));
   
   ------------------------------------------------------------------------
   type IVectorView_AudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_AudioTrack_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.IMediaTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_AudioTrack_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_AudioTrack_Interface
      ; value : Windows.Media.Core.IMediaTrack
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_AudioTrack_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.IMediaTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_AudioTrack : aliased constant Windows.IID := (3877632586, 5287, 20584, (137, 28, 110, 113, 122, 248, 191, 141 ));
   
   ------------------------------------------------------------------------
   type IIterable_AudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_AudioTrack_Interface
      ; RetVal : access Windows.Media.Core.IMediaTrack
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_AudioTrack : aliased constant Windows.IID := (3015594152, 38998, 22102, (171, 109, 205, 88, 249, 222, 10, 79 ));
   
   ------------------------------------------------------------------------
   type IVectorView_VideoTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_VideoTrack_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.IMediaTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_VideoTrack_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_VideoTrack_Interface
      ; value : Windows.Media.Core.IMediaTrack
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_VideoTrack_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.IMediaTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_VideoTrack : aliased constant Windows.IID := (537682468, 2883, 21755, (153, 95, 253, 134, 136, 191, 36, 222 ));
   
   ------------------------------------------------------------------------
   type IIterable_VideoTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_VideoTrack_Interface
      ; RetVal : access Windows.Media.Core.IMediaTrack
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_VideoTrack : aliased constant Windows.IID := (2218865730, 41699, 24079, (147, 109, 188, 64, 176, 251, 45, 205 ));
   
   ------------------------------------------------------------------------
   type IVectorView_TimedMetadataTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_TimedMetadataTrack_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Core.ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_TimedMetadataTrack_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_TimedMetadataTrack_Interface
      ; value : Windows.Media.Core.ITimedMetadataTrack
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_TimedMetadataTrack_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Core.ITimedMetadataTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_TimedMetadataTrack : aliased constant Windows.IID := (51621498, 10243, 23877, (181, 161, 160, 252, 92, 213, 94, 124 ));
   
   ------------------------------------------------------------------------
   type IIterable_TimedMetadataTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_TimedMetadataTrack_Interface
      ; RetVal : access Windows.Media.Core.ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_TimedMetadataTrack : aliased constant Windows.IID := (352994388, 955, 24017, (129, 83, 106, 96, 14, 133, 31, 113 ));
   
   ------------------------------------------------------------------------
   type IMediaItemDisplayProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IMediaItemDisplayProperties_Interface
      ; RetVal : access Windows.Media.MediaPlaybackType
   )
   return Windows.HRESULT is abstract;
   
   function put_Type
   (
      This       : access IMediaItemDisplayProperties_Interface
      ; value : Windows.Media.MediaPlaybackType
   )
   return Windows.HRESULT is abstract;
   
   function get_MusicProperties
   (
      This       : access IMediaItemDisplayProperties_Interface
      ; RetVal : access Windows.Media.IMusicDisplayProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoProperties
   (
      This       : access IMediaItemDisplayProperties_Interface
      ; RetVal : access Windows.Media.IVideoDisplayProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IMediaItemDisplayProperties_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access IMediaItemDisplayProperties_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function ClearAll
   (
      This       : access IMediaItemDisplayProperties_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaItemDisplayProperties : aliased constant Windows.IID := (507255624, 28823, 17284, (162, 23, 193, 41, 29, 250, 140, 22 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackItem2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BreakSchedule
   (
      This       : access IMediaPlaybackItem2_Interface
      ; RetVal : access Windows.Media.Playback.IMediaBreakSchedule
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTime
   (
      This       : access IMediaPlaybackItem2_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_DurationLimit
   (
      This       : access IMediaPlaybackItem2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CanSkip
   (
      This       : access IMediaPlaybackItem2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanSkip
   (
      This       : access IMediaPlaybackItem2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDisplayProperties
   (
      This       : access IMediaPlaybackItem2_Interface
      ; RetVal : access Windows.Media.Playback.IMediaItemDisplayProperties
   )
   return Windows.HRESULT is abstract;
   
   function ApplyDisplayProperties
   (
      This       : access IMediaPlaybackItem2_Interface
      ; value : Windows.Media.Playback.IMediaItemDisplayProperties
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackItem2 : aliased constant Windows.IID := (3629764977, 55279, 19329, (172, 31, 244, 4, 147, 203, 176, 145 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackItem3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsDisabledInPlaybackList
   (
      This       : access IMediaPlaybackItem3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDisabledInPlaybackList
   (
      This       : access IMediaPlaybackItem3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalDownloadProgress
   (
      This       : access IMediaPlaybackItem3_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoLoadedDisplayProperties
   (
      This       : access IMediaPlaybackItem3_Interface
      ; RetVal : access Windows.Media.Playback.AutoLoadedDisplayPropertyKind
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoLoadedDisplayProperties
   (
      This       : access IMediaPlaybackItem3_Interface
      ; value : Windows.Media.Playback.AutoLoadedDisplayPropertyKind
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackItem3 : aliased constant Windows.IID := (221413920, 47114, 19721, (159, 248, 248, 112, 148, 161, 200, 49 ));
   
   ------------------------------------------------------------------------
   type IMediaBreakFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IMediaBreakFactory_Interface
      ; insertionMethod : Windows.Media.Playback.MediaBreakInsertionMethod
      ; RetVal : access Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithPresentationPosition
   (
      This       : access IMediaBreakFactory_Interface
      ; insertionMethod : Windows.Media.Playback.MediaBreakInsertionMethod
      ; presentationPosition : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBreakFactory : aliased constant Windows.IID := (1159127042, 6368, 16505, (139, 95, 211, 52, 149, 193, 93, 46 ));
   
   ------------------------------------------------------------------------
   type IMediaBreak_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PlaybackList
   (
      This       : access IMediaBreak_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackList
   )
   return Windows.HRESULT is abstract;
   
   function get_PresentationPosition
   (
      This       : access IMediaBreak_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InsertionMethod
   (
      This       : access IMediaBreak_Interface
      ; RetVal : access Windows.Media.Playback.MediaBreakInsertionMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomProperties
   (
      This       : access IMediaBreak_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_CanStart
   (
      This       : access IMediaBreak_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanStart
   (
      This       : access IMediaBreak_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBreak : aliased constant Windows.IID := (1900798576, 3567, 20156, (164, 137, 107, 52, 147, 14, 21, 88 ));
   
   ------------------------------------------------------------------------
   type IMediaBreakSchedule_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ScheduleChanged
   (
      This       : access IMediaBreakSchedule_Interface
      ; handler : TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ScheduleChanged
   (
      This       : access IMediaBreakSchedule_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function InsertMidrollBreak
   (
      This       : access IMediaBreakSchedule_Interface
      ; mediaBreak : Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function RemoveMidrollBreak
   (
      This       : access IMediaBreakSchedule_Interface
      ; mediaBreak : Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function get_MidrollBreaks
   (
      This       : access IMediaBreakSchedule_Interface
      ; RetVal : access Windows.Media.Playback.IVectorView_IMediaBreak -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_PrerollBreak
   (
      This       : access IMediaBreakSchedule_Interface
      ; value : Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function get_PrerollBreak
   (
      This       : access IMediaBreakSchedule_Interface
      ; RetVal : access Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function put_PostrollBreak
   (
      This       : access IMediaBreakSchedule_Interface
      ; value : Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function get_PostrollBreak
   (
      This       : access IMediaBreakSchedule_Interface
      ; RetVal : access Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackItem
   (
      This       : access IMediaBreakSchedule_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaBreakSchedule : aliased constant Windows.IID := (2711246867, 39094, 16856, (131, 218, 249, 113, 210, 43, 123, 186 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackItemError_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ErrorCode
   (
      This       : access IMediaPlaybackItemError_Interface
      ; RetVal : access Windows.Media.Playback.MediaPlaybackItemErrorCode
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IMediaPlaybackItemError_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackItemError : aliased constant Windows.IID := (1778118443, 56534, 19961, (164, 80, 219, 244, 198, 241, 194, 194 ));
   
   ------------------------------------------------------------------------
   type IMediaEnginePlaybackSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentItem
   (
      This       : access IMediaEnginePlaybackSource_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function SetPlaybackSource
   (
      This       : access IMediaEnginePlaybackSource_Interface
      ; source : Windows.Media.Playback.IMediaPlaybackSource
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaEnginePlaybackSource : aliased constant Windows.IID := (1545407399, 14422, 18617, (141, 198, 36, 75, 241, 7, 191, 140 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackItemOpenedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Item
   (
      This       : access IMediaPlaybackItemOpenedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackItemOpenedEventArgs : aliased constant Windows.IID := (3420044674, 12343, 20414, (174, 143, 57, 252, 57, 237, 244, 239 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackItemFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Item
   (
      This       : access IMediaPlaybackItemFailedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Error
   (
      This       : access IMediaPlaybackItemFailedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItemError
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackItemFailedEventArgs : aliased constant Windows.IID := (1996690250, 59815, 18371, (134, 44, 198, 86, 211, 6, 131, 212 ));
   
   ------------------------------------------------------------------------
   type ICurrentMediaPlaybackItemChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NewItem
   (
      This       : access ICurrentMediaPlaybackItemChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function get_OldItem
   (
      This       : access ICurrentMediaPlaybackItemChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   IID_ICurrentMediaPlaybackItemChangedEventArgs : aliased constant Windows.IID := (390310034, 23619, 18965, (150, 122, 87, 45, 45, 15, 38, 198 ));
   
   ------------------------------------------------------------------------
   type ICurrentMediaPlaybackItemChangedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access ICurrentMediaPlaybackItemChangedEventArgs2_Interface
      ; RetVal : access Windows.Media.Playback.MediaPlaybackItemChangedReason
   )
   return Windows.HRESULT is abstract;
   
   IID_ICurrentMediaPlaybackItemChangedEventArgs2 : aliased constant Windows.IID := (494970142, 39278, 16553, (190, 72, 230, 110, 201, 11, 43, 125 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackList_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ItemFailed
   (
      This       : access IMediaPlaybackList_Interface
      ; handler : TypedEventHandler_IMediaPlaybackList_add_ItemFailed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ItemFailed
   (
      This       : access IMediaPlaybackList_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CurrentItemChanged
   (
      This       : access IMediaPlaybackList_Interface
      ; handler : TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CurrentItemChanged
   (
      This       : access IMediaPlaybackList_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ItemOpened
   (
      This       : access IMediaPlaybackList_Interface
      ; handler : TypedEventHandler_IMediaPlaybackList_add_ItemOpened
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ItemOpened
   (
      This       : access IMediaPlaybackList_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Items
   (
      This       : access IMediaPlaybackList_Interface
      ; RetVal : access Windows.Media.Playback.IObservableVector_IMediaPlaybackItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoRepeatEnabled
   (
      This       : access IMediaPlaybackList_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoRepeatEnabled
   (
      This       : access IMediaPlaybackList_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShuffleEnabled
   (
      This       : access IMediaPlaybackList_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShuffleEnabled
   (
      This       : access IMediaPlaybackList_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentItem
   (
      This       : access IMediaPlaybackList_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentItemIndex
   (
      This       : access IMediaPlaybackList_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IMediaPlaybackList_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function MovePrevious
   (
      This       : access IMediaPlaybackList_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function MoveTo
   (
      This       : access IMediaPlaybackList_Interface
      ; itemIndex : Windows.UInt32
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackList : aliased constant Windows.IID := (2138566300, 56386, 20006, (169, 141, 120, 80, 223, 142, 201, 37 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackList2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxPrefetchTime
   (
      This       : access IMediaPlaybackList2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxPrefetchTime
   (
      This       : access IMediaPlaybackList2_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_StartingItem
   (
      This       : access IMediaPlaybackList2_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function put_StartingItem
   (
      This       : access IMediaPlaybackList2_Interface
      ; value : Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function get_ShuffledItems
   (
      This       : access IMediaPlaybackList2_Interface
      ; RetVal : access Windows.Media.Playback.IVectorView_IMediaPlaybackItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetShuffledItems
   (
      This       : access IMediaPlaybackList2_Interface
      ; value : Windows.Media.Playback.IIterable_IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackList2 : aliased constant Windows.IID := (235517048, 24586, 17012, (161, 75, 11, 103, 35, 208, 244, 139 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackList3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxPlayedItemsToKeepOpen
   (
      This       : access IMediaPlaybackList3_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxPlayedItemsToKeepOpen
   (
      This       : access IMediaPlaybackList3_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackList3 : aliased constant Windows.IID := (3710172073, 48199, 17507, (170, 144, 193, 139, 126, 95, 253, 225 ));
   
   ------------------------------------------------------------------------
   type IMediaPlaybackTimedMetadataTrackList_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PresentationModeChanged
   (
      This       : access IMediaPlaybackTimedMetadataTrackList_Interface
      ; handler : TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PresentationModeChanged
   (
      This       : access IMediaPlaybackTimedMetadataTrackList_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetPresentationMode
   (
      This       : access IMediaPlaybackTimedMetadataTrackList_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Playback.TimedMetadataTrackPresentationMode
   )
   return Windows.HRESULT is abstract;
   
   function SetPresentationMode
   (
      This       : access IMediaPlaybackTimedMetadataTrackList_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Playback.TimedMetadataTrackPresentationMode
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaPlaybackTimedMetadataTrackList : aliased constant Windows.IID := (1924403993, 48123, 18083, (147, 114, 156, 156, 116, 75, 148, 56 ));
   
   ------------------------------------------------------------------------
   type ITimedMetadataPresentationModeChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Track
   (
      This       : access ITimedMetadataPresentationModeChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Core.ITimedMetadataTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_OldPresentationMode
   (
      This       : access ITimedMetadataPresentationModeChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.TimedMetadataTrackPresentationMode
   )
   return Windows.HRESULT is abstract;
   
   function get_NewPresentationMode
   (
      This       : access ITimedMetadataPresentationModeChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Playback.TimedMetadataTrackPresentationMode
   )
   return Windows.HRESULT is abstract;
   
   IID_ITimedMetadataPresentationModeChangedEventArgs : aliased constant Windows.IID := (3512950937, 26079, 17838, (140, 239, 220, 11, 83, 253, 194, 187 ));
   
   ------------------------------------------------------------------------
   type ISingleSelectMediaTrackList_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SelectedIndexChanged
   (
      This       : access ISingleSelectMediaTrackList_Imported_Interface
      ; handler : Windows.Address
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SelectedIndexChanged
   (
      This       : access ISingleSelectMediaTrackList_Imported_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedIndex
   (
      This       : access ISingleSelectMediaTrackList_Imported_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedIndex
   (
      This       : access ISingleSelectMediaTrackList_Imported_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IIterator_IMediaBreak_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaBreak_Interface
      ; RetVal : access Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaBreak_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaBreak_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaBreak_Interface
      ; items : Windows.Media.Playback.IMediaBreak_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IMediaBreak : aliased constant Windows.IID := (2667415366, 63804, 21071, (159, 149, 75, 89, 138, 207, 141, 37 ));
   
   ------------------------------------------------------------------------
   type IIterable_IMediaBreak_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaBreak_Interface
      ; RetVal : access Windows.Media.Playback.IIterator_IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IMediaBreak : aliased constant Windows.IID := (82837740, 50983, 24000, (159, 124, 36, 92, 117, 201, 47, 47 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IMediaBreak_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaBreak_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Playback.IMediaBreak
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaBreak_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaBreak_Interface
      ; value : Windows.Media.Playback.IMediaBreak
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaBreak_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Playback.IMediaBreak_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IMediaBreak : aliased constant Windows.IID := (3264672761, 4712, 22946, (183, 195, 47, 88, 142, 212, 160, 23 ));
   
   ------------------------------------------------------------------------
   type IIterator_IMediaPlaybackItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaPlaybackItem_Interface
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaPlaybackItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaPlaybackItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaPlaybackItem_Interface
      ; items : Windows.Media.Playback.IMediaPlaybackItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IMediaPlaybackItem : aliased constant Windows.IID := (2869379161, 35848, 21479, (150, 84, 2, 210, 89, 143, 255, 85 ));
   
   ------------------------------------------------------------------------
   type IIterable_IMediaPlaybackItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaPlaybackItem_Interface
      ; RetVal : access Windows.Media.Playback.IIterator_IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IMediaPlaybackItem : aliased constant Windows.IID := (2341123236, 595, 22249, (162, 50, 148, 227, 53, 174, 250, 143 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IMediaPlaybackItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaPlaybackItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaPlaybackItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaPlaybackItem_Interface
      ; value : Windows.Media.Playback.IMediaPlaybackItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaPlaybackItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Playback.IMediaPlaybackItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IMediaPlaybackItem : aliased constant Windows.IID := (3064252926, 51005, 24250, (181, 171, 111, 141, 234, 202, 48, 185 ));
   
   ------------------------------------------------------------------------
   type IVector_IMediaPlaybackItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IMediaPlaybackItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IMediaPlaybackItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IMediaPlaybackItem_Interface
      ; RetVal : access Windows.Media.Playback.IVectorView_IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IMediaPlaybackItem_Interface
      ; value : Windows.Media.Playback.IMediaPlaybackItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IMediaPlaybackItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IMediaPlaybackItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IMediaPlaybackItem_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IMediaPlaybackItem_Interface
      ; value : Windows.Media.Playback.IMediaPlaybackItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IMediaPlaybackItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IMediaPlaybackItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IMediaPlaybackItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Playback.IMediaPlaybackItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IMediaPlaybackItem_Interface
      ; items : Windows.Media.Playback.IMediaPlaybackItem_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IMediaPlaybackItem : aliased constant Windows.IID := (3780136774, 50342, 23081, (143, 201, 169, 52, 209, 45, 114, 66 ));
   
   ------------------------------------------------------------------------
   type IObservableVector_IMediaPlaybackItem_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VectorChanged
   (
      This       : access IObservableVector_IMediaPlaybackItem_Interface
      ; vhnd : Windows.Media.Playback.VectorChangedEventHandler_IMediaPlaybackItem
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VectorChanged
   (
      This       : access IObservableVector_IMediaPlaybackItem_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IObservableVector_IMediaPlaybackItem : aliased constant Windows.IID := (4206839875, 14827, 23613, (161, 43, 252, 161, 137, 180, 110, 142 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer_add_MediaOpened_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer_add_MediaOpened_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_MediaOpened_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer_add_MediaOpened : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer_add_MediaEnded_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer_add_MediaEnded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_MediaEnded_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer_add_MediaEnded : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer_add_MediaFailed_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Media.Playback.IMediaPlayerFailedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer_add_MediaFailed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_MediaFailed_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Media.Playback.IMediaPlayerFailedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer_add_MediaFailed : aliased constant Windows.IID := (908871079, 14858, 24103, (153, 206, 207, 246, 209, 183, 112, 225 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer_add_CurrentStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer_add_CurrentStateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_CurrentStateChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer_add_CurrentStateChanged : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached : aliased constant Windows.IID := (1738863676, 49748, 22512, (163, 157, 164, 117, 163, 66, 210, 29 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Media.Playback.IMediaPlayerRateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Media.Playback.IMediaPlayerRateChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged : aliased constant Windows.IID := (3125924634, 22152, 23885, (175, 66, 18, 32, 112, 177, 238, 250 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer_add_VolumeChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer_add_VolumeChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_VolumeChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer_add_VolumeChanged : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer_add_SeekCompleted_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer_add_SeekCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_SeekCompleted_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer_add_SeekCompleted : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer_add_BufferingStarted_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer_add_BufferingStarted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_BufferingStarted_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer_add_BufferingStarted : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer_add_BufferingEnded_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer_add_BufferingEnded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_BufferingEnded_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer_add_BufferingEnded : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer3_add_IsMutedChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer3_add_IsMutedChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer3_add_IsMutedChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer3_add_IsMutedChanged : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer3_add_SourceChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer3_add_SourceChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer3_add_SourceChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer3_add_SourceChanged : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlayer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged : aliased constant Windows.IID := (4054230302, 53368, 23616, (186, 63, 52, 136, 112, 186, 92, 135 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession_add_PositionChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession_add_PositionChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_PositionChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession_add_PositionChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged : aliased constant Windows.IID := (2087777165, 10913, 21794, (166, 214, 52, 181, 43, 152, 138, 231 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaBreakManager ; args : Windows.Media.Playback.IMediaBreakSeekedOverEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver_Interface
      ; sender : Windows.Media.Playback.IMediaBreakManager
      ; args : Windows.Media.Playback.IMediaBreakSeekedOverEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver : aliased constant Windows.IID := (2794802224, 39388, 24452, (180, 130, 125, 6, 146, 192, 39, 123 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaBreakManager_add_BreakStarted_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaBreakManager ; args : Windows.Media.Playback.IMediaBreakStartedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaBreakManager_add_BreakStarted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBreakManager_add_BreakStarted_Interface
      ; sender : Windows.Media.Playback.IMediaBreakManager
      ; args : Windows.Media.Playback.IMediaBreakStartedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaBreakManager_add_BreakStarted : aliased constant Windows.IID := (1274203297, 52637, 23944, (158, 71, 24, 129, 32, 27, 183, 45 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaBreakManager_add_BreakEnded_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaBreakManager ; args : Windows.Media.Playback.IMediaBreakEndedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaBreakManager_add_BreakEnded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBreakManager_add_BreakEnded_Interface
      ; sender : Windows.Media.Playback.IMediaBreakManager
      ; args : Windows.Media.Playback.IMediaBreakEndedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaBreakManager_add_BreakEnded : aliased constant Windows.IID := (78622633, 55354, 23755, (140, 171, 130, 201, 217, 42, 25, 171 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaBreakManager_add_BreakSkipped_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaBreakManager ; args : Windows.Media.Playback.IMediaBreakSkippedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaBreakManager_add_BreakSkipped_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBreakManager_add_BreakSkipped_Interface
      ; sender : Windows.Media.Playback.IMediaBreakManager
      ; args : Windows.Media.Playback.IMediaBreakSkippedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaBreakManager_add_BreakSkipped : aliased constant Windows.IID := (3308321373, 6742, 22570, (162, 84, 27, 26, 225, 123, 141, 45 ));
   
   ------------------------------------------------------------------------
   type EventHandler_IMediaPlayerDataReceivedEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Media.Playback.IMediaPlayerDataReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_IMediaPlayerDataReceivedEventArgs_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_IMediaPlayerDataReceivedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Media.Playback.IMediaPlayerDataReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_EventHandler_IMediaPlayerDataReceivedEventArgs : aliased constant Windows.IID := (126863384, 6645, 23434, (172, 130, 37, 25, 59, 234, 86, 238 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged : aliased constant Windows.IID := (645240634, 60205, 22177, (130, 160, 52, 11, 15, 240, 65, 230 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManager ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPlayReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPlayReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived : aliased constant Windows.IID := (1993711484, 60915, 24030, (149, 41, 111, 128, 107, 219, 31, 203 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManager ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPauseReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPauseReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived : aliased constant Windows.IID := (2045455059, 1921, 24420, (176, 205, 49, 225, 20, 93, 16, 159 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManager ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerNextReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerNextReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived : aliased constant Windows.IID := (3460411200, 37798, 21183, (156, 173, 77, 95, 255, 209, 14, 224 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManager ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPreviousReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPreviousReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived : aliased constant Windows.IID := (628256180, 35091, 22887, (144, 235, 16, 240, 159, 48, 221, 51 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManager ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerFastForwardReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerFastForwardReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived : aliased constant Windows.IID := (3620564195, 20847, 23348, (190, 175, 62, 233, 11, 98, 40, 114 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManager ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerRewindReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerRewindReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived : aliased constant Windows.IID := (1010294822, 36107, 23923, (166, 80, 159, 24, 171, 188, 53, 61 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManager ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerShuffleReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerShuffleReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived : aliased constant Windows.IID := (1821847441, 63014, 22425, (186, 134, 94, 148, 31, 2, 2, 200 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManager ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived : aliased constant Windows.IID := (2185774520, 50655, 22027, (167, 34, 193, 91, 37, 212, 70, 58 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManager ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPositionReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPositionReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived : aliased constant Windows.IID := (3630412228, 29762, 21444, (148, 210, 32, 216, 151, 61, 245, 133 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackCommandManager ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerRateReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerRateReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived : aliased constant Windows.IID := (1066045089, 65434, 22035, (152, 70, 51, 121, 159, 107, 140, 138 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackItem ; args : Windows.Foundation.Collections.IVectorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackItem
      ; args : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged : aliased constant Windows.IID := (768940312, 17701, 23525, (166, 193, 64, 155, 199, 40, 99, 166 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackItem ; args : Windows.Foundation.Collections.IVectorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackItem
      ; args : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged : aliased constant Windows.IID := (768940312, 17701, 23525, (166, 193, 64, 155, 199, 40, 99, 166 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackItem ; args : Windows.Foundation.Collections.IVectorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackItem
      ; args : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged : aliased constant Windows.IID := (768940312, 17701, 23525, (166, 193, 64, 155, 199, 40, 99, 166 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaBreakSchedule ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged_Interface
      ; sender : Windows.Media.Playback.IMediaBreakSchedule
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged : aliased constant Windows.IID := (1012378815, 51719, 22634, (138, 219, 128, 71, 220, 145, 101, 166 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackList_add_ItemFailed_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackList ; args : Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackList_add_ItemFailed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackList_add_ItemFailed_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackList
      ; args : Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackList_add_ItemFailed : aliased constant Windows.IID := (590454397, 13489, 22455, (151, 229, 132, 73, 72, 186, 71, 25 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackList ; args : Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackList
      ; args : Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged : aliased constant Windows.IID := (1078747037, 9485, 24460, (150, 39, 107, 65, 5, 195, 45, 9 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackList_add_ItemOpened_Interface(Callback : access procedure (sender : Windows.Media.Playback.IMediaPlaybackList ; args : Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackList_add_ItemOpened_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackList_add_ItemOpened_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackList
      ; args : Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackList_add_ItemOpened : aliased constant Windows.IID := (1731378159, 13073, 24451, (156, 157, 130, 165, 207, 60, 216, 42 ));
   
   ------------------------------------------------------------------------
   type VectorChangedEventHandler_IMediaPlaybackItem_Interface(Callback : access procedure (sender : Windows.Media.Playback.IObservableVector_IMediaPlaybackItem ; event : Windows.Foundation.Collections.IVectorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access VectorChangedEventHandler_IMediaPlaybackItem_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access VectorChangedEventHandler_IMediaPlaybackItem_Interface
      ; sender : Windows.Media.Playback.IObservableVector_IMediaPlaybackItem
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_VectorChangedEventHandler_IMediaPlaybackItem : aliased constant Windows.IID := (2300304862, 27635, 23839, (128, 171, 90, 52, 42, 22, 160, 187 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged_Interface(Callback : access procedure (sender : Windows.Media.Playback.IVectorView_TimedMetadataTrack ; args : Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged_Interface
      ; sender : Windows.Media.Playback.IVectorView_TimedMetadataTrack
      ; args : Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged : aliased constant Windows.IID := (1075920005, 48931, 24440, (185, 196, 224, 63, 59, 226, 180, 28 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PlaybackMediaMarker is Windows.Media.Playback.IPlaybackMediaMarker;
   
   function CreateFromTime
   (
      value : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Playback.IPlaybackMediaMarker;
   
   function Create
   (
      value : Windows.Foundation.TimeSpan
      ; mediaMarketType : Windows.String
      ; text : Windows.String
   )
   return Windows.Media.Playback.IPlaybackMediaMarker;
   
   subtype PlaybackMediaMarkerSequence is Windows.Media.Playback.IPlaybackMediaMarkerSequence;
   subtype MediaPlayerFailedEventArgs is Windows.Media.Playback.IMediaPlayerFailedEventArgs;
   subtype MediaPlayerRateChangedEventArgs is Windows.Media.Playback.IMediaPlayerRateChangedEventArgs;
   subtype PlaybackMediaMarkerReachedEventArgs is Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs;
   subtype MediaPlayerDataReceivedEventArgs is Windows.Media.Playback.IMediaPlayerDataReceivedEventArgs;
   subtype MediaPlayer is Windows.Media.Playback.IMediaPlayer;
   
   function CreateMediaPlayer return Windows.Media.Playback.IMediaPlayer;
   
   subtype MediaBreakManager is Windows.Media.Playback.IMediaBreakManager;
   subtype MediaPlaybackCommandManager is Windows.Media.Playback.IMediaPlaybackCommandManager;
   subtype MediaPlaybackSession is Windows.Media.Playback.IMediaPlaybackSession;
   subtype MediaPlayerSurface is Windows.Media.Playback.IMediaPlayerSurface;
   subtype MediaPlaybackSphericalVideoProjection is Windows.Media.Playback.IMediaPlaybackSphericalVideoProjection;
   subtype MediaPlaybackSessionBufferingStartedEventArgs is Windows.Media.Playback.IMediaPlaybackSessionBufferingStartedEventArgs;
   subtype MediaBreakSeekedOverEventArgs is Windows.Media.Playback.IMediaBreakSeekedOverEventArgs;
   subtype MediaBreakStartedEventArgs is Windows.Media.Playback.IMediaBreakStartedEventArgs;
   subtype MediaBreakEndedEventArgs is Windows.Media.Playback.IMediaBreakEndedEventArgs;
   subtype MediaBreakSkippedEventArgs is Windows.Media.Playback.IMediaBreakSkippedEventArgs;
   subtype MediaPlaybackCommandManagerPlayReceivedEventArgs is Windows.Media.Playback.IMediaPlaybackCommandManagerPlayReceivedEventArgs;
   subtype MediaPlaybackCommandManagerPauseReceivedEventArgs is Windows.Media.Playback.IMediaPlaybackCommandManagerPauseReceivedEventArgs;
   subtype MediaPlaybackCommandManagerNextReceivedEventArgs is Windows.Media.Playback.IMediaPlaybackCommandManagerNextReceivedEventArgs;
   subtype MediaPlaybackCommandManagerPreviousReceivedEventArgs is Windows.Media.Playback.IMediaPlaybackCommandManagerPreviousReceivedEventArgs;
   subtype MediaPlaybackCommandManagerFastForwardReceivedEventArgs is Windows.Media.Playback.IMediaPlaybackCommandManagerFastForwardReceivedEventArgs;
   subtype MediaPlaybackCommandManagerRewindReceivedEventArgs is Windows.Media.Playback.IMediaPlaybackCommandManagerRewindReceivedEventArgs;
   subtype MediaPlaybackCommandManagerShuffleReceivedEventArgs is Windows.Media.Playback.IMediaPlaybackCommandManagerShuffleReceivedEventArgs;
   subtype MediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs is Windows.Media.Playback.IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs;
   subtype MediaPlaybackCommandManagerPositionReceivedEventArgs is Windows.Media.Playback.IMediaPlaybackCommandManagerPositionReceivedEventArgs;
   subtype MediaPlaybackCommandManagerRateReceivedEventArgs is Windows.Media.Playback.IMediaPlaybackCommandManagerRateReceivedEventArgs;
   subtype MediaPlaybackCommandManagerCommandBehavior is Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior;
   subtype MediaPlaybackItem is Windows.Media.Playback.IMediaPlaybackItem;
   
   function CreateWithStartTime
   (
      source : Windows.Media.Core.IMediaSource2
      ; startTime : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Playback.IMediaPlaybackItem;
   
   function CreateWithStartTimeAndDurationLimit
   (
      source : Windows.Media.Core.IMediaSource2
      ; startTime : Windows.Foundation.TimeSpan
      ; durationLimit : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Playback.IMediaPlaybackItem;
   
   subtype MediaPlaybackAudioTrackList is Windows.Media.Playback.IVectorView_AudioTrack;
   subtype MediaPlaybackVideoTrackList is Windows.Media.Playback.IVectorView_VideoTrack;
   subtype MediaPlaybackTimedMetadataTrackList is Windows.Media.Playback.IVectorView_TimedMetadataTrack;
   subtype MediaBreakSchedule is Windows.Media.Playback.IMediaBreakSchedule;
   subtype MediaItemDisplayProperties is Windows.Media.Playback.IMediaItemDisplayProperties;
   subtype MediaBreak is Windows.Media.Playback.IMediaBreak;
   
   function Create
   (
      insertionMethod : Windows.Media.Playback.MediaBreakInsertionMethod
   )
   return Windows.Media.Playback.IMediaBreak;
   
   function CreateWithPresentationPosition
   (
      insertionMethod : Windows.Media.Playback.MediaBreakInsertionMethod
      ; presentationPosition : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Playback.IMediaBreak;
   
   subtype MediaPlaybackList is Windows.Media.Playback.IMediaPlaybackList;
   
   function CreateMediaPlaybackList return Windows.Media.Playback.IMediaPlaybackList;
   
   subtype MediaPlaybackItemError is Windows.Media.Playback.IMediaPlaybackItemError;
   subtype MediaPlaybackItemFailedEventArgs is Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs;
   subtype CurrentMediaPlaybackItemChangedEventArgs is Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs;
   subtype MediaPlaybackItemOpenedEventArgs is Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs;
   subtype TimedMetadataPresentationModeChangedEventArgs is Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FindFromMediaSource
   (
      source : Windows.Media.Core.IMediaSource2
   )
   return Windows.Media.Playback.IMediaPlaybackItem;

end;
