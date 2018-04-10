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
limited with Windows.Storage.Streams;
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Media.PlayTo is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PlayToConnectionState is (
      Disconnected,
      Connected,
      Rendering
   );
   for PlayToConnectionState use (
      Disconnected => 0,
      Connected => 1,
      Rendering => 2
   );
   for PlayToConnectionState'Size use 32;
   
   type PlayToConnectionState_Ptr is access PlayToConnectionState;
   
   type PlayToConnectionError is (
      None,
      DeviceNotResponding,
      DeviceError,
      DeviceLocked,
      ProtectedPlaybackFailed
   );
   for PlayToConnectionError use (
      None => 0,
      DeviceNotResponding => 1,
      DeviceError => 2,
      DeviceLocked => 3,
      ProtectedPlaybackFailed => 4
   );
   for PlayToConnectionError'Size use 32;
   
   type PlayToConnectionError_Ptr is access PlayToConnectionError;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IPlayToReceiver_add_PlayRequested_Interface;
   type TypedEventHandler_IPlayToReceiver_add_PlayRequested is access all TypedEventHandler_IPlayToReceiver_add_PlayRequested_Interface'Class;
   type TypedEventHandler_IPlayToReceiver_add_PlayRequested_Ptr is access all TypedEventHandler_IPlayToReceiver_add_PlayRequested;
   type TypedEventHandler_IPlayToReceiver_add_PauseRequested_Interface;
   type TypedEventHandler_IPlayToReceiver_add_PauseRequested is access all TypedEventHandler_IPlayToReceiver_add_PauseRequested_Interface'Class;
   type TypedEventHandler_IPlayToReceiver_add_PauseRequested_Ptr is access all TypedEventHandler_IPlayToReceiver_add_PauseRequested;
   type TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested_Interface;
   type TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested is access all TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested_Interface'Class;
   type TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested_Ptr is access all TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested;
   type TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested_Interface;
   type TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested is access all TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested_Interface'Class;
   type TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested_Ptr is access all TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested;
   type TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested_Interface;
   type TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested is access all TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested_Interface'Class;
   type TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested_Ptr is access all TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested;
   type TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested_Interface;
   type TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested is access all TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested_Interface'Class;
   type TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested_Ptr is access all TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested;
   type TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested_Interface;
   type TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested is access all TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested_Interface'Class;
   type TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested_Ptr is access all TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested;
   type TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested_Interface;
   type TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested is access all TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested_Interface'Class;
   type TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested_Ptr is access all TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested;
   type TypedEventHandler_IPlayToReceiver_add_StopRequested_Interface;
   type TypedEventHandler_IPlayToReceiver_add_StopRequested is access all TypedEventHandler_IPlayToReceiver_add_StopRequested_Interface'Class;
   type TypedEventHandler_IPlayToReceiver_add_StopRequested_Ptr is access all TypedEventHandler_IPlayToReceiver_add_StopRequested;
   type TypedEventHandler_IPlayToConnection_add_StateChanged_Interface;
   type TypedEventHandler_IPlayToConnection_add_StateChanged is access all TypedEventHandler_IPlayToConnection_add_StateChanged_Interface'Class;
   type TypedEventHandler_IPlayToConnection_add_StateChanged_Ptr is access all TypedEventHandler_IPlayToConnection_add_StateChanged;
   type TypedEventHandler_IPlayToConnection_add_Transferred_Interface;
   type TypedEventHandler_IPlayToConnection_add_Transferred is access all TypedEventHandler_IPlayToConnection_add_Transferred_Interface'Class;
   type TypedEventHandler_IPlayToConnection_add_Transferred_Ptr is access all TypedEventHandler_IPlayToConnection_add_Transferred;
   type TypedEventHandler_IPlayToConnection_add_Error_Interface;
   type TypedEventHandler_IPlayToConnection_add_Error is access all TypedEventHandler_IPlayToConnection_add_Error_Interface'Class;
   type TypedEventHandler_IPlayToConnection_add_Error_Ptr is access all TypedEventHandler_IPlayToConnection_add_Error;
   type TypedEventHandler_IPlayToManager_add_SourceRequested_Interface;
   type TypedEventHandler_IPlayToManager_add_SourceRequested is access all TypedEventHandler_IPlayToManager_add_SourceRequested_Interface'Class;
   type TypedEventHandler_IPlayToManager_add_SourceRequested_Ptr is access all TypedEventHandler_IPlayToManager_add_SourceRequested;
   type TypedEventHandler_IPlayToManager_add_SourceSelected_Interface;
   type TypedEventHandler_IPlayToManager_add_SourceSelected is access all TypedEventHandler_IPlayToManager_add_SourceSelected_Interface'Class;
   type TypedEventHandler_IPlayToManager_add_SourceSelected_Ptr is access all TypedEventHandler_IPlayToManager_add_SourceSelected;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISourceChangeRequestedEventArgs_Interface;
   type ISourceChangeRequestedEventArgs is access all ISourceChangeRequestedEventArgs_Interface'Class;
   type ISourceChangeRequestedEventArgs_Ptr is access all ISourceChangeRequestedEventArgs;
   type IPlaybackRateChangeRequestedEventArgs_Interface;
   type IPlaybackRateChangeRequestedEventArgs is access all IPlaybackRateChangeRequestedEventArgs_Interface'Class;
   type IPlaybackRateChangeRequestedEventArgs_Ptr is access all IPlaybackRateChangeRequestedEventArgs;
   type ICurrentTimeChangeRequestedEventArgs_Interface;
   type ICurrentTimeChangeRequestedEventArgs is access all ICurrentTimeChangeRequestedEventArgs_Interface'Class;
   type ICurrentTimeChangeRequestedEventArgs_Ptr is access all ICurrentTimeChangeRequestedEventArgs;
   type IMuteChangeRequestedEventArgs_Interface;
   type IMuteChangeRequestedEventArgs is access all IMuteChangeRequestedEventArgs_Interface'Class;
   type IMuteChangeRequestedEventArgs_Ptr is access all IMuteChangeRequestedEventArgs;
   type IVolumeChangeRequestedEventArgs_Interface;
   type IVolumeChangeRequestedEventArgs is access all IVolumeChangeRequestedEventArgs_Interface'Class;
   type IVolumeChangeRequestedEventArgs_Ptr is access all IVolumeChangeRequestedEventArgs;
   type IPlayToReceiver_Interface;
   type IPlayToReceiver is access all IPlayToReceiver_Interface'Class;
   type IPlayToReceiver_Ptr is access all IPlayToReceiver;
   type IPlayToSource_Interface;
   type IPlayToSource is access all IPlayToSource_Interface'Class;
   type IPlayToSource_Ptr is access all IPlayToSource;
   type IPlayToSourceWithPreferredSourceUri_Interface;
   type IPlayToSourceWithPreferredSourceUri is access all IPlayToSourceWithPreferredSourceUri_Interface'Class;
   type IPlayToSourceWithPreferredSourceUri_Ptr is access all IPlayToSourceWithPreferredSourceUri;
   type IPlayToConnectionStateChangedEventArgs_Interface;
   type IPlayToConnectionStateChangedEventArgs is access all IPlayToConnectionStateChangedEventArgs_Interface'Class;
   type IPlayToConnectionStateChangedEventArgs_Ptr is access all IPlayToConnectionStateChangedEventArgs;
   type IPlayToConnectionTransferredEventArgs_Interface;
   type IPlayToConnectionTransferredEventArgs is access all IPlayToConnectionTransferredEventArgs_Interface'Class;
   type IPlayToConnectionTransferredEventArgs_Ptr is access all IPlayToConnectionTransferredEventArgs;
   type IPlayToConnectionErrorEventArgs_Interface;
   type IPlayToConnectionErrorEventArgs is access all IPlayToConnectionErrorEventArgs_Interface'Class;
   type IPlayToConnectionErrorEventArgs_Ptr is access all IPlayToConnectionErrorEventArgs;
   type IPlayToConnection_Interface;
   type IPlayToConnection is access all IPlayToConnection_Interface'Class;
   type IPlayToConnection_Ptr is access all IPlayToConnection;
   type IPlayToSourceSelectedEventArgs_Interface;
   type IPlayToSourceSelectedEventArgs is access all IPlayToSourceSelectedEventArgs_Interface'Class;
   type IPlayToSourceSelectedEventArgs_Ptr is access all IPlayToSourceSelectedEventArgs;
   type IPlayToSourceDeferral_Interface;
   type IPlayToSourceDeferral is access all IPlayToSourceDeferral_Interface'Class;
   type IPlayToSourceDeferral_Ptr is access all IPlayToSourceDeferral;
   type IPlayToSourceRequest_Interface;
   type IPlayToSourceRequest is access all IPlayToSourceRequest_Interface'Class;
   type IPlayToSourceRequest_Ptr is access all IPlayToSourceRequest;
   type IPlayToSourceRequestedEventArgs_Interface;
   type IPlayToSourceRequestedEventArgs is access all IPlayToSourceRequestedEventArgs_Interface'Class;
   type IPlayToSourceRequestedEventArgs_Ptr is access all IPlayToSourceRequestedEventArgs;
   type IPlayToManager_Interface;
   type IPlayToManager is access all IPlayToManager_Interface'Class;
   type IPlayToManager_Ptr is access all IPlayToManager;
   type IPlayToManagerStatics_Interface;
   type IPlayToManagerStatics is access all IPlayToManagerStatics_Interface'Class;
   type IPlayToManagerStatics_Ptr is access all IPlayToManagerStatics;
   
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
   
   IID_ISourceChangeRequestedEventArgs : aliased constant Windows.IID := (4215224982, 31398, 19083, (134, 231, 84, 246, 198, 211, 79, 100 ));
   
   type ISourceChangeRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Stream
   (
      This       : access ISourceChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access ISourceChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Author
   (
      This       : access ISourceChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Album
   (
      This       : access ISourceChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Genre
   (
      This       : access ISourceChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access ISourceChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Date
   (
      This       : access ISourceChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access ISourceChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Rating
   (
      This       : access ISourceChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access ISourceChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlaybackRateChangeRequestedEventArgs : aliased constant Windows.IID := (257319342, 11400, 19658, (133, 64, 213, 134, 9, 93, 19, 165 ));
   
   type IPlaybackRateChangeRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Rate
   (
      This       : access IPlaybackRateChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICurrentTimeChangeRequestedEventArgs : aliased constant Windows.IID := (2574324516, 60871, 19445, (145, 246, 60, 134, 39, 219, 89, 229 ));
   
   type ICurrentTimeChangeRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Time
   (
      This       : access ICurrentTimeChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMuteChangeRequestedEventArgs : aliased constant Windows.IID := (3837064694, 44831, 20254, (180, 55, 125, 163, 36, 0, 225, 212 ));
   
   type IMuteChangeRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mute
   (
      This       : access IMuteChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVolumeChangeRequestedEventArgs : aliased constant Windows.IID := (1862430044, 53109, 19499, (145, 62, 109, 124, 108, 50, 145, 121 ));
   
   type IVolumeChangeRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Volume
   (
      This       : access IVolumeChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToReceiver : aliased constant Windows.IID := (2887110471, 41314, 19110, (175, 27, 58, 163, 95, 59, 144, 105 ));
   
   type IPlayToReceiver_Interface is interface and Windows.IInspectable_Interface;
   
   function add_PlayRequested
   (
      This       : access IPlayToReceiver_Interface
      ; handler : TypedEventHandler_IPlayToReceiver_add_PlayRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlayRequested
   (
      This       : access IPlayToReceiver_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PauseRequested
   (
      This       : access IPlayToReceiver_Interface
      ; handler : TypedEventHandler_IPlayToReceiver_add_PauseRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PauseRequested
   (
      This       : access IPlayToReceiver_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceChangeRequested
   (
      This       : access IPlayToReceiver_Interface
      ; handler : TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceChangeRequested
   (
      This       : access IPlayToReceiver_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PlaybackRateChangeRequested
   (
      This       : access IPlayToReceiver_Interface
      ; handler : TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlaybackRateChangeRequested
   (
      This       : access IPlayToReceiver_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CurrentTimeChangeRequested
   (
      This       : access IPlayToReceiver_Interface
      ; handler : TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CurrentTimeChangeRequested
   (
      This       : access IPlayToReceiver_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MuteChangeRequested
   (
      This       : access IPlayToReceiver_Interface
      ; handler : TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MuteChangeRequested
   (
      This       : access IPlayToReceiver_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VolumeChangeRequested
   (
      This       : access IPlayToReceiver_Interface
      ; handler : TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VolumeChangeRequested
   (
      This       : access IPlayToReceiver_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TimeUpdateRequested
   (
      This       : access IPlayToReceiver_Interface
      ; handler : TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TimeUpdateRequested
   (
      This       : access IPlayToReceiver_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StopRequested
   (
      This       : access IPlayToReceiver_Interface
      ; handler : TypedEventHandler_IPlayToReceiver_add_StopRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StopRequested
   (
      This       : access IPlayToReceiver_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function NotifyVolumeChange
   (
      This       : access IPlayToReceiver_Interface
      ; volume : Windows.Double
      ; mute : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function NotifyRateChange
   (
      This       : access IPlayToReceiver_Interface
      ; rate : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function NotifyLoadedMetadata
   (
      This       : access IPlayToReceiver_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyTimeUpdate
   (
      This       : access IPlayToReceiver_Interface
      ; currentTime : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function NotifyDurationChange
   (
      This       : access IPlayToReceiver_Interface
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function NotifySeeking
   (
      This       : access IPlayToReceiver_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifySeeked
   (
      This       : access IPlayToReceiver_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyPaused
   (
      This       : access IPlayToReceiver_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyPlaying
   (
      This       : access IPlayToReceiver_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyEnded
   (
      This       : access IPlayToReceiver_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyError
   (
      This       : access IPlayToReceiver_Interface
   )
   return Windows.HRESULT is abstract;
   
   function NotifyStopped
   (
      This       : access IPlayToReceiver_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_FriendlyName
   (
      This       : access IPlayToReceiver_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_FriendlyName
   (
      This       : access IPlayToReceiver_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SupportsImage
   (
      This       : access IPlayToReceiver_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsImage
   (
      This       : access IPlayToReceiver_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SupportsAudio
   (
      This       : access IPlayToReceiver_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsAudio
   (
      This       : access IPlayToReceiver_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SupportsVideo
   (
      This       : access IPlayToReceiver_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsVideo
   (
      This       : access IPlayToReceiver_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPlayToReceiver_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function StartAsync
   (
      This       : access IPlayToReceiver_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StopAsync
   (
      This       : access IPlayToReceiver_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToSource : aliased constant Windows.IID := (2131986952, 64439, 19209, (131, 86, 170, 95, 78, 51, 92, 49 ));
   
   type IPlayToSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Connection
   (
      This       : access IPlayToSource_Interface
      ; RetVal : access Windows.Media.PlayTo.IPlayToConnection
   )
   return Windows.HRESULT is abstract;
   
   function get_Next
   (
      This       : access IPlayToSource_Interface
      ; RetVal : access Windows.Media.PlayTo.IPlayToSource
   )
   return Windows.HRESULT is abstract;
   
   function put_Next
   (
      This       : access IPlayToSource_Interface
      ; value : Windows.Media.PlayTo.IPlayToSource
   )
   return Windows.HRESULT is abstract;
   
   function PlayNext
   (
      This       : access IPlayToSource_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToSourceWithPreferredSourceUri : aliased constant Windows.IID := (2863813611, 13057, 19908, (175, 186, 178, 242, 237, 150, 53, 160 ));
   
   type IPlayToSourceWithPreferredSourceUri_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreferredSourceUri
   (
      This       : access IPlayToSourceWithPreferredSourceUri_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferredSourceUri
   (
      This       : access IPlayToSourceWithPreferredSourceUri_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToConnectionStateChangedEventArgs : aliased constant Windows.IID := (1757721871, 3104, 18816, (134, 2, 88, 198, 34, 56, 212, 35 ));
   
   type IPlayToConnectionStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreviousState
   (
      This       : access IPlayToConnectionStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.PlayTo.PlayToConnectionState
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentState
   (
      This       : access IPlayToConnectionStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.PlayTo.PlayToConnectionState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToConnectionTransferredEventArgs : aliased constant Windows.IID := (4209187130, 1667, 18393, (141, 240, 24, 203, 180, 137, 132, 216 ));
   
   type IPlayToConnectionTransferredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreviousSource
   (
      This       : access IPlayToConnectionTransferredEventArgs_Interface
      ; RetVal : access Windows.Media.PlayTo.IPlayToSource
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentSource
   (
      This       : access IPlayToConnectionTransferredEventArgs_Interface
      ; RetVal : access Windows.Media.PlayTo.IPlayToSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToConnectionErrorEventArgs : aliased constant Windows.IID := (3210653094, 35046, 17503, (157, 64, 217, 185, 248, 147, 152, 150 ));
   
   type IPlayToConnectionErrorEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Code
   (
      This       : access IPlayToConnectionErrorEventArgs_Interface
      ; RetVal : access Windows.Media.PlayTo.PlayToConnectionError
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IPlayToConnectionErrorEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToConnection : aliased constant Windows.IID := (288341960, 62005, 20446, (141, 65, 155, 242, 124, 158, 154, 64 ));
   
   type IPlayToConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access IPlayToConnection_Interface
      ; RetVal : access Windows.Media.PlayTo.PlayToConnectionState
   )
   return Windows.HRESULT is abstract;
   
   function add_StateChanged
   (
      This       : access IPlayToConnection_Interface
      ; handler : TypedEventHandler_IPlayToConnection_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access IPlayToConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Transferred
   (
      This       : access IPlayToConnection_Interface
      ; handler : TypedEventHandler_IPlayToConnection_add_Transferred
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Transferred
   (
      This       : access IPlayToConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Error
   (
      This       : access IPlayToConnection_Interface
      ; handler : TypedEventHandler_IPlayToConnection_add_Error
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Error
   (
      This       : access IPlayToConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToSourceSelectedEventArgs : aliased constant Windows.IID := (211649809, 20994, 19915, (140, 103, 171, 218, 18, 187, 60, 18 ));
   
   type IPlayToSourceSelectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FriendlyName
   (
      This       : access IPlayToSourceSelectedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Icon
   (
      This       : access IPlayToSourceSelectedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsImage
   (
      This       : access IPlayToSourceSelectedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsAudio
   (
      This       : access IPlayToSourceSelectedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsVideo
   (
      This       : access IPlayToSourceSelectedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToSourceDeferral : aliased constant Windows.IID := (1090554141, 10126, 20265, (133, 155, 169, 229, 1, 5, 62, 125 ));
   
   type IPlayToSourceDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IPlayToSourceDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToSourceRequest : aliased constant Windows.IID := (4166534757, 25844, 17568, (172, 13, 70, 141, 43, 143, 218, 131 ));
   
   type IPlayToSourceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Deadline
   (
      This       : access IPlayToSourceRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function DisplayErrorString
   (
      This       : access IPlayToSourceRequest_Interface
      ; errorString : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IPlayToSourceRequest_Interface
      ; RetVal : access Windows.Media.PlayTo.IPlayToSourceDeferral
   )
   return Windows.HRESULT is abstract;
   
   function SetSource
   (
      This       : access IPlayToSourceRequest_Interface
      ; value : Windows.Media.PlayTo.IPlayToSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToSourceRequestedEventArgs : aliased constant Windows.IID := (3318596400, 10719, 20166, (157, 169, 159, 189, 252, 252, 27, 62 ));
   
   type IPlayToSourceRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceRequest
   (
      This       : access IPlayToSourceRequestedEventArgs_Interface
      ; RetVal : access Windows.Media.PlayTo.IPlayToSourceRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToManager : aliased constant Windows.IID := (4117373038, 7031, 17135, (143, 13, 185, 73, 248, 217, 178, 96 ));
   
   type IPlayToManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SourceRequested
   (
      This       : access IPlayToManager_Interface
      ; handler : TypedEventHandler_IPlayToManager_add_SourceRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceRequested
   (
      This       : access IPlayToManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceSelected
   (
      This       : access IPlayToManager_Interface
      ; handler : TypedEventHandler_IPlayToManager_add_SourceSelected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceSelected
   (
      This       : access IPlayToManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultSourceSelection
   (
      This       : access IPlayToManager_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultSourceSelection
   (
      This       : access IPlayToManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlayToManagerStatics : aliased constant Windows.IID := (1692838023, 14722, 20283, (186, 32, 97, 85, 228, 53, 50, 91 ));
   
   type IPlayToManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IPlayToManagerStatics_Interface
      ; RetVal : access Windows.Media.PlayTo.IPlayToManager
   )
   return Windows.HRESULT is abstract;
   
   function ShowPlayToUI
   (
      This       : access IPlayToManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToReceiver_add_PlayRequested : aliased constant Windows.IID := (2055846338, 30932, 22630, (136, 241, 76, 220, 10, 14, 117, 184 ));
   
   type TypedEventHandler_IPlayToReceiver_add_PlayRequested_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToReceiver ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToReceiver_add_PlayRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_PlayRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToReceiver_add_PauseRequested : aliased constant Windows.IID := (2055846338, 30932, 22630, (136, 241, 76, 220, 10, 14, 117, 184 ));
   
   type TypedEventHandler_IPlayToReceiver_add_PauseRequested_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToReceiver ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToReceiver_add_PauseRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_PauseRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested : aliased constant Windows.IID := (342282356, 47028, 22548, (178, 215, 132, 124, 90, 231, 216, 125 ));
   
   type TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToReceiver ; args : Windows.Media.PlayTo.ISourceChangeRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Media.PlayTo.ISourceChangeRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested : aliased constant Windows.IID := (3881386902, 22723, 21270, (188, 79, 29, 19, 234, 219, 239, 253 ));
   
   type TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToReceiver ; args : Windows.Media.PlayTo.IPlaybackRateChangeRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Media.PlayTo.IPlaybackRateChangeRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested : aliased constant Windows.IID := (1118560159, 5286, 23583, (131, 155, 134, 2, 149, 5, 177, 208 ));
   
   type TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToReceiver ; args : Windows.Media.PlayTo.ICurrentTimeChangeRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Media.PlayTo.ICurrentTimeChangeRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested : aliased constant Windows.IID := (108318597, 46845, 22822, (155, 114, 53, 254, 81, 122, 63, 68 ));
   
   type TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToReceiver ; args : Windows.Media.PlayTo.IMuteChangeRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Media.PlayTo.IMuteChangeRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested : aliased constant Windows.IID := (2621406340, 39757, 23772, (129, 68, 28, 47, 97, 123, 110, 222 ));
   
   type TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToReceiver ; args : Windows.Media.PlayTo.IVolumeChangeRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Media.PlayTo.IVolumeChangeRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested : aliased constant Windows.IID := (2055846338, 30932, 22630, (136, 241, 76, 220, 10, 14, 117, 184 ));
   
   type TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToReceiver ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToReceiver_add_StopRequested : aliased constant Windows.IID := (2055846338, 30932, 22630, (136, 241, 76, 220, 10, 14, 117, 184 ));
   
   type TypedEventHandler_IPlayToReceiver_add_StopRequested_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToReceiver ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToReceiver_add_StopRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_StopRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToConnection_add_StateChanged : aliased constant Windows.IID := (3740761116, 37731, 23367, (185, 248, 162, 54, 197, 13, 55, 46 ));
   
   type TypedEventHandler_IPlayToConnection_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToConnection ; args : Windows.Media.PlayTo.IPlayToConnectionStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToConnection_add_StateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToConnection_add_StateChanged_Interface
      ; sender : Windows.Media.PlayTo.IPlayToConnection
      ; args : Windows.Media.PlayTo.IPlayToConnectionStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToConnection_add_Transferred : aliased constant Windows.IID := (1920526322, 864, 21873, (140, 62, 234, 3, 39, 103, 196, 115 ));
   
   type TypedEventHandler_IPlayToConnection_add_Transferred_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToConnection ; args : Windows.Media.PlayTo.IPlayToConnectionTransferredEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToConnection_add_Transferred'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToConnection_add_Transferred_Interface
      ; sender : Windows.Media.PlayTo.IPlayToConnection
      ; args : Windows.Media.PlayTo.IPlayToConnectionTransferredEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToConnection_add_Error : aliased constant Windows.IID := (2405015357, 13909, 22931, (161, 25, 116, 30, 196, 238, 110, 66 ));
   
   type TypedEventHandler_IPlayToConnection_add_Error_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToConnection ; args : Windows.Media.PlayTo.IPlayToConnectionErrorEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToConnection_add_Error'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToConnection_add_Error_Interface
      ; sender : Windows.Media.PlayTo.IPlayToConnection
      ; args : Windows.Media.PlayTo.IPlayToConnectionErrorEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToManager_add_SourceRequested : aliased constant Windows.IID := (1791620004, 14774, 20952, (142, 8, 241, 55, 144, 142, 146, 47 ));
   
   type TypedEventHandler_IPlayToManager_add_SourceRequested_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToManager ; args : Windows.Media.PlayTo.IPlayToSourceRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToManager_add_SourceRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToManager_add_SourceRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToManager
      ; args : Windows.Media.PlayTo.IPlayToSourceRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPlayToManager_add_SourceSelected : aliased constant Windows.IID := (3213312794, 29777, 21157, (165, 226, 191, 175, 64, 142, 12, 136 ));
   
   type TypedEventHandler_IPlayToManager_add_SourceSelected_Interface(Callback : access procedure (sender : Windows.Media.PlayTo.IPlayToManager ; args : Windows.Media.PlayTo.IPlayToSourceSelectedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPlayToManager_add_SourceSelected'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToManager_add_SourceSelected_Interface
      ; sender : Windows.Media.PlayTo.IPlayToManager
      ; args : Windows.Media.PlayTo.IPlayToSourceSelectedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SourceChangeRequestedEventArgs is Windows.Media.PlayTo.ISourceChangeRequestedEventArgs;
   subtype PlaybackRateChangeRequestedEventArgs is Windows.Media.PlayTo.IPlaybackRateChangeRequestedEventArgs;
   subtype CurrentTimeChangeRequestedEventArgs is Windows.Media.PlayTo.ICurrentTimeChangeRequestedEventArgs;
   subtype MuteChangeRequestedEventArgs is Windows.Media.PlayTo.IMuteChangeRequestedEventArgs;
   subtype VolumeChangeRequestedEventArgs is Windows.Media.PlayTo.IVolumeChangeRequestedEventArgs;
   subtype PlayToReceiver is Windows.Media.PlayTo.IPlayToReceiver;
   
   function CreatePlayToReceiver return Windows.Media.PlayTo.IPlayToReceiver;
   
   subtype PlayToConnection is Windows.Media.PlayTo.IPlayToConnection;
   subtype PlayToSource is Windows.Media.PlayTo.IPlayToSource;
   subtype PlayToConnectionStateChangedEventArgs is Windows.Media.PlayTo.IPlayToConnectionStateChangedEventArgs;
   subtype PlayToConnectionTransferredEventArgs is Windows.Media.PlayTo.IPlayToConnectionTransferredEventArgs;
   subtype PlayToConnectionErrorEventArgs is Windows.Media.PlayTo.IPlayToConnectionErrorEventArgs;
   subtype PlayToSourceSelectedEventArgs is Windows.Media.PlayTo.IPlayToSourceSelectedEventArgs;
   subtype PlayToSourceDeferral is Windows.Media.PlayTo.IPlayToSourceDeferral;
   subtype PlayToSourceRequest is Windows.Media.PlayTo.IPlayToSourceRequest;
   subtype PlayToSourceRequestedEventArgs is Windows.Media.PlayTo.IPlayToSourceRequestedEventArgs;
   subtype PlayToManager is Windows.Media.PlayTo.IPlayToManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
