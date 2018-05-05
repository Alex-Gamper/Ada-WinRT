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
with Windows.Graphics.Imaging;
with Windows.Graphics.DirectX.Direct3D11;
with Windows.Graphics.DirectX;
with Windows.Storage.Streams;
with Windows.Storage;
with Windows.ApplicationModel.AppService;
with Windows.Media.PlayTo;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaExtension_Interface
      ; asyncInfo : Windows.Media.IAsyncOperation_IMediaExtension
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
      This       : access AsyncOperationCompletedHandler_IVideoFrame_Interface
      ; asyncInfo : Windows.Media.IAsyncOperation_IVideoFrame
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
      This       : access TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.ISystemMediaTransportControlsButtonPressedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.ISystemMediaTransportControls(sender), Windows.Media.ISystemMediaTransportControlsButtonPressedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.ISystemMediaTransportControlsPropertyChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.ISystemMediaTransportControls(sender), Windows.Media.ISystemMediaTransportControlsPropertyChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.IPlaybackPositionChangeRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.ISystemMediaTransportControls(sender), Windows.Media.IPlaybackPositionChangeRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.IPlaybackRateChangeRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.ISystemMediaTransportControls(sender), Windows.Media.IPlaybackRateChangeRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.IShuffleEnabledChangeRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.ISystemMediaTransportControls(sender), Windows.Media.IShuffleEnabledChangeRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.IAutoRepeatModeChangeRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.ISystemMediaTransportControls(sender), Windows.Media.IAutoRepeatModeChangeRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaTimelineController_add_PositionChanged_Interface
      ; sender : Windows.Media.IMediaTimelineController
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.IMediaTimelineController(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaTimelineController_add_StateChanged_Interface
      ; sender : Windows.Media.IMediaTimelineController
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.IMediaTimelineController(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaTimelineController2_add_Failed_Interface
      ; sender : Windows.Media.IMediaTimelineController
      ; args : Windows.Media.IMediaTimelineControllerFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.IMediaTimelineController(sender), Windows.Media.IMediaTimelineControllerFailedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaTimelineController2_add_Ended_Interface
      ; sender : Windows.Media.IMediaTimelineController
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.IMediaTimelineController(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
   )
   return Windows.Media.IVideoFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.VideoFrame");
      m_Factory     : Windows.Media.IVideoFrameFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.IVideoFrame := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoFrameFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(format, width, height, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAlpha
   (
      format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Media.IVideoFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.VideoFrame");
      m_Factory     : Windows.Media.IVideoFrameFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.IVideoFrame := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoFrameFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAlpha(format, width, height, alpha, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      capacity : Windows.UInt32
   )
   return Windows.Media.IAudioFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.AudioFrame");
      m_Factory     : Windows.Media.IAudioFrameFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.IAudioFrame := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioFrameFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(capacity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSystemMediaTransportControlsTimelineProperties return Windows.Media.ISystemMediaTransportControlsTimelineProperties is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SystemMediaTransportControlsTimelineProperties");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.ISystemMediaTransportControlsTimelineProperties) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.IID_ISystemMediaTransportControlsTimelineProperties'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateMediaTimelineController return Windows.Media.IMediaTimelineController is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaTimelineController");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.IMediaTimelineController) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.IID_IMediaTimelineController'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateMediaExtensionManager return Windows.Media.IMediaExtensionManager is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaExtensionManager");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.IMediaExtensionManager) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.IID_IMediaExtensionManager'Access, RetVal'access);
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
   
   function CreateAsDirect3D11SurfaceBacked
   (
      format : Windows.Graphics.DirectX.DirectXPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
   )
   return Windows.Media.IVideoFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.VideoFrame");
      m_Factory     : IVideoFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.IVideoFrame;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsDirect3D11SurfaceBacked(format, width, height, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAsDirect3D11SurfaceBackedWithDevice
   (
      format : Windows.Graphics.DirectX.DirectXPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; device : Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
   )
   return Windows.Media.IVideoFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.VideoFrame");
      m_Factory     : IVideoFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.IVideoFrame;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsDirect3D11SurfaceBackedWithDevice(format, width, height, device, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithSoftwareBitmap
   (
      bitmap : Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.Media.IVideoFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.VideoFrame");
      m_Factory     : IVideoFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.IVideoFrame;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithSoftwareBitmap(bitmap, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithDirect3D11Surface
   (
      surface : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.Media.IVideoFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.VideoFrame");
      m_Factory     : IVideoFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.IVideoFrame;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithDirect3D11Surface(surface, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Bookmark
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaMarkerTypes");
      m_Factory     : IMediaMarkerTypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaMarkerTypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Bookmark(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.Media.ISystemMediaTransportControls is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SystemMediaTransportControls");
      m_Factory     : ISystemMediaTransportControlsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ISystemMediaTransportControls;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemMediaTransportControlsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoStabilization
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.VideoEffects");
      m_Factory     : IVideoEffectsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoEffectsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoStabilization(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_SoundLevelChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_SoundLevelChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_SoundLevelChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_SoundLevelChanged(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_PlayPressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_PlayPressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_PlayPressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_PlayPressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_PausePressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_PausePressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_PausePressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_PausePressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_StopPressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_StopPressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_StopPressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_StopPressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_PlayPauseTogglePressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_PlayPauseTogglePressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_PlayPauseTogglePressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_PlayPauseTogglePressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_RecordPressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_RecordPressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_RecordPressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_RecordPressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_NextTrackPressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_NextTrackPressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_NextTrackPressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_NextTrackPressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_PreviousTrackPressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_PreviousTrackPressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_PreviousTrackPressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_PreviousTrackPressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_FastForwardPressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_FastForwardPressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_FastForwardPressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_FastForwardPressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_RewindPressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_RewindPressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_RewindPressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_RewindPressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_ChannelUpPressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ChannelUpPressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ChannelUpPressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ChannelUpPressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_ChannelDownPressed
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ChannelDownPressed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ChannelDownPressed
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ChannelDownPressed(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_SoundLevel
   return Windows.Media.SoundLevel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SoundLevel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SoundLevel(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_TrackName
   (
      value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_TrackName(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_TrackName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TrackName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_ArtistName
   (
      value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_ArtistName(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_ArtistName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ArtistName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_IsPlaying
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_IsPlaying(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsPlaying
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsPlaying(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_AlbumArt
   (
      value : Windows.Foundation.IUriRuntimeClass
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_AlbumArt(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AlbumArt
   return Windows.Foundation.IUriRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaControl");
      m_Factory     : IMediaControl := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IUriRuntimeClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaControl'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AlbumArt(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
