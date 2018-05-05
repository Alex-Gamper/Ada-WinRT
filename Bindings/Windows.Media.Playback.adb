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
with Windows.Media.Protection;
with Windows.Storage;
with Windows.Storage.Streams;
with Windows.Media.Core;
with Windows.Media;
with Windows.Devices.Enumeration;
with Windows.Media.Casting;
with Windows.UI.Composition;
with Windows.Graphics.DirectX.Direct3D11;
with Windows.Media.Audio;
with Windows.Media.MediaProperties;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Playback is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_MediaOpened_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_MediaEnded_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_MediaFailed_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Media.Playback.IMediaPlayerFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), Windows.Media.Playback.IMediaPlayerFailedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_CurrentStateChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_PlaybackMediaMarkerReached_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_MediaPlayerRateChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Media.Playback.IMediaPlayerRateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), Windows.Media.Playback.IMediaPlayerRateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_VolumeChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_SeekCompleted_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_BufferingStarted_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer_add_BufferingEnded_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer3_add_IsMutedChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer3_add_SourceChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer5_add_VideoFrameAvailable_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlayer6_add_SubtitleFrameChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlayer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlayer(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_PlaybackStateChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_PlaybackRateChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_SeekCompleted_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_BufferingStarted_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_BufferingEnded_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_BufferingProgressChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_DownloadProgressChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_NaturalDurationChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_PositionChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession_add_NaturalVideoSizeChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession2_add_BufferedRangesChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession2_add_PlayedRangesChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession2_add_SeekableRangesChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackSession2_add_SupportedPlaybackRatesChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBreakManager_add_BreaksSeekedOver_Interface
      ; sender : Windows.Media.Playback.IMediaBreakManager
      ; args : Windows.Media.Playback.IMediaBreakSeekedOverEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaBreakManager(sender), Windows.Media.Playback.IMediaBreakSeekedOverEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBreakManager_add_BreakStarted_Interface
      ; sender : Windows.Media.Playback.IMediaBreakManager
      ; args : Windows.Media.Playback.IMediaBreakStartedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaBreakManager(sender), Windows.Media.Playback.IMediaBreakStartedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBreakManager_add_BreakEnded_Interface
      ; sender : Windows.Media.Playback.IMediaBreakManager
      ; args : Windows.Media.Playback.IMediaBreakEndedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaBreakManager(sender), Windows.Media.Playback.IMediaBreakEndedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBreakManager_add_BreakSkipped_Interface
      ; sender : Windows.Media.Playback.IMediaBreakManager
      ; args : Windows.Media.Playback.IMediaBreakSkippedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaBreakManager(sender), Windows.Media.Playback.IMediaBreakSkippedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access EventHandler_IMediaPlayerDataReceivedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Media.Playback.IMediaPlayerDataReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManagerCommandBehavior_add_IsEnabledChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManagerCommandBehavior(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_PlayReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPlayReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManager(sender), Windows.Media.Playback.IMediaPlaybackCommandManagerPlayReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_PauseReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPauseReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManager(sender), Windows.Media.Playback.IMediaPlaybackCommandManagerPauseReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_NextReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerNextReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManager(sender), Windows.Media.Playback.IMediaPlaybackCommandManagerNextReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_PreviousReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPreviousReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManager(sender), Windows.Media.Playback.IMediaPlaybackCommandManagerPreviousReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_FastForwardReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerFastForwardReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManager(sender), Windows.Media.Playback.IMediaPlaybackCommandManagerFastForwardReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_RewindReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerRewindReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManager(sender), Windows.Media.Playback.IMediaPlaybackCommandManagerRewindReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_ShuffleReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerShuffleReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManager(sender), Windows.Media.Playback.IMediaPlaybackCommandManagerShuffleReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_AutoRepeatModeReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManager(sender), Windows.Media.Playback.IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_PositionReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerPositionReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManager(sender), Windows.Media.Playback.IMediaPlaybackCommandManagerPositionReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackCommandManager_add_RateReceived_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackCommandManager
      ; args : Windows.Media.Playback.IMediaPlaybackCommandManagerRateReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackCommandManager(sender), Windows.Media.Playback.IMediaPlaybackCommandManagerRateReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackItem_add_AudioTracksChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackItem
      ; args : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackItem(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackItem_add_VideoTracksChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackItem
      ; args : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackItem(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackItem_add_TimedMetadataTracksChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackItem
      ; args : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackItem(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaBreakSchedule_add_ScheduleChanged_Interface
      ; sender : Windows.Media.Playback.IMediaBreakSchedule
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaBreakSchedule(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackList_add_ItemFailed_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackList
      ; args : Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackList(sender), Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackList_add_CurrentItemChanged_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackList
      ; args : Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackList(sender), Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackList_add_ItemOpened_Interface
      ; sender : Windows.Media.Playback.IMediaPlaybackList
      ; args : Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IMediaPlaybackList(sender), Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access VectorChangedEventHandler_IMediaPlaybackItem_Interface
      ; sender : Windows.Media.Playback.IObservableVector_IMediaPlaybackItem
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, event);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaPlaybackTimedMetadataTrackList_add_PresentationModeChanged_Interface
      ; sender : Windows.Media.Playback.IVectorView_TimedMetadataTrack
      ; args : Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Playback.IVectorView_TimedMetadataTrack(sender), Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateFromTime
   (
      value : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Playback.IPlaybackMediaMarker is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.PlaybackMediaMarker");
      m_Factory     : Windows.Media.Playback.IPlaybackMediaMarkerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Playback.IPlaybackMediaMarker := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlaybackMediaMarkerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromTime(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      value : Windows.Foundation.TimeSpan
      ; mediaMarketType : Windows.String
      ; text : Windows.String
   )
   return Windows.Media.Playback.IPlaybackMediaMarker is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.PlaybackMediaMarker");
      m_Factory     : Windows.Media.Playback.IPlaybackMediaMarkerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Playback.IPlaybackMediaMarker := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlaybackMediaMarkerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(value, mediaMarketType, text, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMediaPlayer return Windows.Media.Playback.IMediaPlayer is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.MediaPlayer");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Playback.IMediaPlayer) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Playback.IID_IMediaPlayer'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      source : Windows.Media.Core.IMediaSource2
   )
   return Windows.Media.Playback.IMediaPlaybackItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.MediaPlaybackItem");
      m_Factory     : Windows.Media.Playback.IMediaPlaybackItemFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Playback.IMediaPlaybackItem := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaPlaybackItemFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(source, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      insertionMethod : Windows.Media.Playback.MediaBreakInsertionMethod
   )
   return Windows.Media.Playback.IMediaBreak is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.MediaBreak");
      m_Factory     : Windows.Media.Playback.IMediaBreakFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Playback.IMediaBreak := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaBreakFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(insertionMethod, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithPresentationPosition
   (
      insertionMethod : Windows.Media.Playback.MediaBreakInsertionMethod
      ; presentationPosition : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Playback.IMediaBreak is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.MediaBreak");
      m_Factory     : Windows.Media.Playback.IMediaBreakFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Playback.IMediaBreak := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaBreakFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithPresentationPosition(insertionMethod, presentationPosition, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMediaPlaybackList return Windows.Media.Playback.IMediaPlaybackList is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.MediaPlaybackList");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Playback.IMediaPlaybackList) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Playback.IID_IMediaPlaybackList'Access, RetVal'access);
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
   
   function get_Current
   return Windows.Media.Playback.IMediaPlayer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.BackgroundMediaPlayer");
      m_Factory     : IBackgroundMediaPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Playback.IMediaPlayer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundMediaPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_MessageReceivedFromBackground
   (
      value : Windows.Media.Playback.EventHandler_IMediaPlayerDataReceivedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.BackgroundMediaPlayer");
      m_Factory     : IBackgroundMediaPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundMediaPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_MessageReceivedFromBackground(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_MessageReceivedFromBackground
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.BackgroundMediaPlayer");
      m_Factory     : IBackgroundMediaPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundMediaPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_MessageReceivedFromBackground(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_MessageReceivedFromForeground
   (
      value : Windows.Media.Playback.EventHandler_IMediaPlayerDataReceivedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.BackgroundMediaPlayer");
      m_Factory     : IBackgroundMediaPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundMediaPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_MessageReceivedFromForeground(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_MessageReceivedFromForeground
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.BackgroundMediaPlayer");
      m_Factory     : IBackgroundMediaPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundMediaPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_MessageReceivedFromForeground(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SendMessageToBackground
   (
      value : Windows.Foundation.Collections.IPropertySet
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.BackgroundMediaPlayer");
      m_Factory     : IBackgroundMediaPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundMediaPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SendMessageToBackground(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SendMessageToForeground
   (
      value : Windows.Foundation.Collections.IPropertySet
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.BackgroundMediaPlayer");
      m_Factory     : IBackgroundMediaPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundMediaPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SendMessageToForeground(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function IsMediaPlaying
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.BackgroundMediaPlayer");
      m_Factory     : IBackgroundMediaPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundMediaPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsMediaPlaying(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure Shutdown
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.BackgroundMediaPlayer");
      m_Factory     : IBackgroundMediaPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundMediaPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Shutdown;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function FindFromMediaSource
   (
      source : Windows.Media.Core.IMediaSource2
   )
   return Windows.Media.Playback.IMediaPlaybackItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Playback.MediaPlaybackItem");
      m_Factory     : IMediaPlaybackItemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Playback.IMediaPlaybackItem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaPlaybackItemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindFromMediaSource(source, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
