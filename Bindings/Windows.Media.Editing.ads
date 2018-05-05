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
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Media.MediaProperties;
limited with Windows.Media.Effects;
limited with Windows.Storage;
limited with Windows.Graphics.Imaging;
limited with Windows.Media.Transcoding;
limited with Windows.Media.Core;
limited with Windows.UI;
limited with Windows.Graphics.DirectX.Direct3D11;
--------------------------------------------------------------------------------
package Windows.Media.Editing is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type VideoFramePrecision is (
      NearestFrame,
      NearestKeyFrame
   );
   for VideoFramePrecision use (
      NearestFrame => 0,
      NearestKeyFrame => 1
   );
   for VideoFramePrecision'Size use 32;
   
   type VideoFramePrecision_Ptr is access VideoFramePrecision;
   
   type MediaTrimmingPreference is (
      Fast,
      Precise
   );
   for MediaTrimmingPreference use (
      Fast => 0,
      Precise => 1
   );
   for MediaTrimmingPreference'Size use 32;
   
   type MediaTrimmingPreference_Ptr is access MediaTrimmingPreference;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMediaClip_Interface;
   type AsyncOperationCompletedHandler_IMediaClip is access all AsyncOperationCompletedHandler_IMediaClip_Interface'Class;
   type AsyncOperationCompletedHandler_IMediaClip_Ptr is access all AsyncOperationCompletedHandler_IMediaClip;
   type AsyncOperationCompletedHandler_IMediaComposition_Interface;
   type AsyncOperationCompletedHandler_IMediaComposition is access all AsyncOperationCompletedHandler_IMediaComposition_Interface'Class;
   type AsyncOperationCompletedHandler_IMediaComposition_Ptr is access all AsyncOperationCompletedHandler_IMediaComposition;
   type AsyncOperationCompletedHandler_IBackgroundAudioTrack_Interface;
   type AsyncOperationCompletedHandler_IBackgroundAudioTrack is access all AsyncOperationCompletedHandler_IBackgroundAudioTrack_Interface'Class;
   type AsyncOperationCompletedHandler_IBackgroundAudioTrack_Ptr is access all AsyncOperationCompletedHandler_IBackgroundAudioTrack;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMediaClip_Interface;
   type IMediaClip is access all IMediaClip_Interface'Class;
   type IMediaClip_Ptr is access all IMediaClip;
   type IMediaComposition_Interface;
   type IMediaComposition is access all IMediaComposition_Interface'Class;
   type IMediaComposition_Ptr is access all IMediaComposition;
   type IMediaClipStatics_Interface;
   type IMediaClipStatics is access all IMediaClipStatics_Interface'Class;
   type IMediaClipStatics_Ptr is access all IMediaClipStatics;
   type IMediaClipStatics2_Interface;
   type IMediaClipStatics2 is access all IMediaClipStatics2_Interface'Class;
   type IMediaClipStatics2_Ptr is access all IMediaClipStatics2;
   type IMediaCompositionStatics_Interface;
   type IMediaCompositionStatics is access all IMediaCompositionStatics_Interface'Class;
   type IMediaCompositionStatics_Ptr is access all IMediaCompositionStatics;
   type IEmbeddedAudioTrack_Interface;
   type IEmbeddedAudioTrack is access all IEmbeddedAudioTrack_Interface'Class;
   type IEmbeddedAudioTrack_Ptr is access all IEmbeddedAudioTrack;
   type IBackgroundAudioTrack_Interface;
   type IBackgroundAudioTrack is access all IBackgroundAudioTrack_Interface'Class;
   type IBackgroundAudioTrack_Ptr is access all IBackgroundAudioTrack;
   type IBackgroundAudioTrackStatics_Interface;
   type IBackgroundAudioTrackStatics is access all IBackgroundAudioTrackStatics_Interface'Class;
   type IBackgroundAudioTrackStatics_Ptr is access all IBackgroundAudioTrackStatics;
   type IMediaComposition2_Interface;
   type IMediaComposition2 is access all IMediaComposition2_Interface'Class;
   type IMediaComposition2_Ptr is access all IMediaComposition2;
   type IMediaOverlay_Interface;
   type IMediaOverlay is access all IMediaOverlay_Interface'Class;
   type IMediaOverlay_Ptr is access all IMediaOverlay;
   type IMediaOverlayFactory_Interface;
   type IMediaOverlayFactory is access all IMediaOverlayFactory_Interface'Class;
   type IMediaOverlayFactory_Ptr is access all IMediaOverlayFactory;
   type IMediaOverlayLayerFactory_Interface;
   type IMediaOverlayLayerFactory is access all IMediaOverlayLayerFactory_Interface'Class;
   type IMediaOverlayLayerFactory_Ptr is access all IMediaOverlayLayerFactory;
   type IMediaOverlayLayer_Interface;
   type IMediaOverlayLayer is access all IMediaOverlayLayer_Interface'Class;
   type IMediaOverlayLayer_Ptr is access all IMediaOverlayLayer;
   type IIterator_IEmbeddedAudioTrack_Interface;
   type IIterator_IEmbeddedAudioTrack is access all IIterator_IEmbeddedAudioTrack_Interface'Class;
   type IIterator_IEmbeddedAudioTrack_Ptr is access all IIterator_IEmbeddedAudioTrack;
   type IIterable_IEmbeddedAudioTrack_Interface;
   type IIterable_IEmbeddedAudioTrack is access all IIterable_IEmbeddedAudioTrack_Interface'Class;
   type IIterable_IEmbeddedAudioTrack_Ptr is access all IIterable_IEmbeddedAudioTrack;
   type IVectorView_IEmbeddedAudioTrack_Interface;
   type IVectorView_IEmbeddedAudioTrack is access all IVectorView_IEmbeddedAudioTrack_Interface'Class;
   type IVectorView_IEmbeddedAudioTrack_Ptr is access all IVectorView_IEmbeddedAudioTrack;
   type IIterator_IMediaClip_Interface;
   type IIterator_IMediaClip is access all IIterator_IMediaClip_Interface'Class;
   type IIterator_IMediaClip_Ptr is access all IIterator_IMediaClip;
   type IIterable_IMediaClip_Interface;
   type IIterable_IMediaClip is access all IIterable_IMediaClip_Interface'Class;
   type IIterable_IMediaClip_Ptr is access all IIterable_IMediaClip;
   type IVectorView_IMediaClip_Interface;
   type IVectorView_IMediaClip is access all IVectorView_IMediaClip_Interface'Class;
   type IVectorView_IMediaClip_Ptr is access all IVectorView_IMediaClip;
   type IVector_IMediaClip_Interface;
   type IVector_IMediaClip is access all IVector_IMediaClip_Interface'Class;
   type IVector_IMediaClip_Ptr is access all IVector_IMediaClip;
   type IIterator_IBackgroundAudioTrack_Interface;
   type IIterator_IBackgroundAudioTrack is access all IIterator_IBackgroundAudioTrack_Interface'Class;
   type IIterator_IBackgroundAudioTrack_Ptr is access all IIterator_IBackgroundAudioTrack;
   type IIterable_IBackgroundAudioTrack_Interface;
   type IIterable_IBackgroundAudioTrack is access all IIterable_IBackgroundAudioTrack_Interface'Class;
   type IIterable_IBackgroundAudioTrack_Ptr is access all IIterable_IBackgroundAudioTrack;
   type IVectorView_IBackgroundAudioTrack_Interface;
   type IVectorView_IBackgroundAudioTrack is access all IVectorView_IBackgroundAudioTrack_Interface'Class;
   type IVectorView_IBackgroundAudioTrack_Ptr is access all IVectorView_IBackgroundAudioTrack;
   type IVector_IBackgroundAudioTrack_Interface;
   type IVector_IBackgroundAudioTrack is access all IVector_IBackgroundAudioTrack_Interface'Class;
   type IVector_IBackgroundAudioTrack_Ptr is access all IVector_IBackgroundAudioTrack;
   type IAsyncOperation_IMediaClip_Interface;
   type IAsyncOperation_IMediaClip is access all IAsyncOperation_IMediaClip_Interface'Class;
   type IAsyncOperation_IMediaClip_Ptr is access all IAsyncOperation_IMediaClip;
   type IAsyncOperation_IMediaComposition_Interface;
   type IAsyncOperation_IMediaComposition is access all IAsyncOperation_IMediaComposition_Interface'Class;
   type IAsyncOperation_IMediaComposition_Ptr is access all IAsyncOperation_IMediaComposition;
   type IAsyncOperation_IBackgroundAudioTrack_Interface;
   type IAsyncOperation_IBackgroundAudioTrack is access all IAsyncOperation_IBackgroundAudioTrack_Interface'Class;
   type IAsyncOperation_IBackgroundAudioTrack_Ptr is access all IAsyncOperation_IBackgroundAudioTrack;
   type IIterator_IMediaOverlayLayer_Interface;
   type IIterator_IMediaOverlayLayer is access all IIterator_IMediaOverlayLayer_Interface'Class;
   type IIterator_IMediaOverlayLayer_Ptr is access all IIterator_IMediaOverlayLayer;
   type IIterable_IMediaOverlayLayer_Interface;
   type IIterable_IMediaOverlayLayer is access all IIterable_IMediaOverlayLayer_Interface'Class;
   type IIterable_IMediaOverlayLayer_Ptr is access all IIterable_IMediaOverlayLayer;
   type IVectorView_IMediaOverlayLayer_Interface;
   type IVectorView_IMediaOverlayLayer is access all IVectorView_IMediaOverlayLayer_Interface'Class;
   type IVectorView_IMediaOverlayLayer_Ptr is access all IVectorView_IMediaOverlayLayer;
   type IVector_IMediaOverlayLayer_Interface;
   type IVector_IMediaOverlayLayer is access all IVector_IMediaOverlayLayer_Interface'Class;
   type IVector_IMediaOverlayLayer_Ptr is access all IVector_IMediaOverlayLayer;
   type IIterator_IMediaOverlay_Interface;
   type IIterator_IMediaOverlay is access all IIterator_IMediaOverlay_Interface'Class;
   type IIterator_IMediaOverlay_Ptr is access all IIterator_IMediaOverlay;
   type IIterable_IMediaOverlay_Interface;
   type IIterable_IMediaOverlay is access all IIterable_IMediaOverlay_Interface'Class;
   type IIterable_IMediaOverlay_Ptr is access all IIterable_IMediaOverlay;
   type IVectorView_IMediaOverlay_Interface;
   type IVectorView_IMediaOverlay is access all IVectorView_IMediaOverlay_Interface'Class;
   type IVectorView_IMediaOverlay_Ptr is access all IVectorView_IMediaOverlay;
   type IVector_IMediaOverlay_Interface;
   type IVector_IMediaOverlay is access all IVector_IMediaOverlay_Interface'Class;
   type IVector_IMediaOverlay_Ptr is access all IVector_IMediaOverlay;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMediaClip : aliased constant Windows.IID := (1408389990, 24506, 16036, (134, 147, 36, 118, 24, 17, 20, 10 ));
   
   type IMediaClip_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TrimTimeFromStart
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_TrimTimeFromStart
   (
      This       : access IMediaClip_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_TrimTimeFromEnd
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_TrimTimeFromEnd
   (
      This       : access IMediaClip_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginalDuration
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_TrimmedDuration
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_UserData
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Clone
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTimeInComposition
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_EndTimeInComposition
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_EmbeddedAudioTracks
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Media.Editing.IVectorView_IEmbeddedAudioTrack -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedEmbeddedAudioTrackIndex
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedEmbeddedAudioTrackIndex
   (
      This       : access IMediaClip_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Volume
   (
      This       : access IMediaClip_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Volume
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function GetVideoEncodingProperties
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioEffectDefinitions
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Media.Effects.IVector_IAudioEffectDefinition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoEffectDefinitions
   (
      This       : access IMediaClip_Interface
      ; RetVal : access Windows.Media.Effects.IVector_IVideoEffectDefinition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaComposition : aliased constant Windows.IID := (772204037, 56433, 16854, (184, 55, 45, 43, 193, 74, 41, 71 ));
   
   type IMediaComposition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Duration
   (
      This       : access IMediaComposition_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Clips
   (
      This       : access IMediaComposition_Interface
      ; RetVal : access Windows.Media.Editing.IVector_IMediaClip -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundAudioTracks
   (
      This       : access IMediaComposition_Interface
      ; RetVal : access Windows.Media.Editing.IVector_IBackgroundAudioTrack -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_UserData
   (
      This       : access IMediaComposition_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Clone
   (
      This       : access IMediaComposition_Interface
      ; RetVal : access Windows.Media.Editing.IMediaComposition
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IMediaComposition_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetThumbnailAsync
   (
      This       : access IMediaComposition_Interface
      ; timeFromStart : Windows.Foundation.TimeSpan
      ; scaledWidth : Windows.Int32
      ; scaledHeight : Windows.Int32
      ; framePrecision : Windows.Media.Editing.VideoFramePrecision
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetThumbnailsAsync
   (
      This       : access IMediaComposition_Interface
      ; timesFromStart : Windows.Foundation.Collections.IIterable_TimeSpan
      ; scaledWidth : Windows.Int32
      ; scaledHeight : Windows.Int32
      ; framePrecision : Windows.Media.Editing.VideoFramePrecision
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RenderToFileAsync
   (
      This       : access IMediaComposition_Interface
      ; destination : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RenderToFileWithTrimmingPreferenceAsync
   (
      This       : access IMediaComposition_Interface
      ; destination : Windows.Storage.IStorageFile
      ; trimmingPreference : Windows.Media.Editing.MediaTrimmingPreference
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RenderToFileWithProfileAsync
   (
      This       : access IMediaComposition_Interface
      ; destination : Windows.Storage.IStorageFile
      ; trimmingPreference : Windows.Media.Editing.MediaTrimmingPreference
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateDefaultEncodingProfile
   (
      This       : access IMediaComposition_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function GenerateMediaStreamSource
   (
      This       : access IMediaComposition_Interface
      ; RetVal : access Windows.Media.Core.IMediaStreamSource
   )
   return Windows.HRESULT is abstract;
   
   function GenerateMediaStreamSourceWithProfile
   (
      This       : access IMediaComposition_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; RetVal : access Windows.Media.Core.IMediaStreamSource
   )
   return Windows.HRESULT is abstract;
   
   function GeneratePreviewMediaStreamSource
   (
      This       : access IMediaComposition_Interface
      ; scaledWidth : Windows.Int32
      ; scaledHeight : Windows.Int32
      ; RetVal : access Windows.Media.Core.IMediaStreamSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaClipStatics : aliased constant Windows.IID := (4198509416, 37519, 17348, (188, 110, 120, 58, 26, 53, 150, 86 ));
   
   type IMediaClipStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromColor
   (
      This       : access IMediaClipStatics_Interface
      ; color : Windows.UI.Color
      ; originalDuration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromFileAsync
   (
      This       : access IMediaClipStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.Editing.IAsyncOperation_IMediaClip -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromImageFileAsync
   (
      This       : access IMediaClipStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; originalDuration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Media.Editing.IAsyncOperation_IMediaClip -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaClipStatics2 : aliased constant Windows.IID := (1528682419, 34126, 19867, (135, 125, 71, 116, 165, 86, 205, 18 ));
   
   type IMediaClipStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromSurface
   (
      This       : access IMediaClipStatics2_Interface
      ; surface : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; originalDuration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaCompositionStatics : aliased constant Windows.IID := (2275446532, 58154, 17870, (143, 102, 163, 13, 240, 118, 98, 36 ));
   
   type IMediaCompositionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadAsync
   (
      This       : access IMediaCompositionStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.Editing.IAsyncOperation_IMediaComposition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEmbeddedAudioTrack : aliased constant Windows.IID := (1441684090, 11568, 16314, (161, 144, 79, 26, 100, 84, 248, 143 ));
   
   type IEmbeddedAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAudioEncodingProperties
   (
      This       : access IEmbeddedAudioTrack_Interface
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundAudioTrack : aliased constant Windows.IID := (1267839933, 40481, 16998, (169, 194, 103, 221, 1, 26, 35, 87 ));
   
   type IBackgroundAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TrimTimeFromStart
   (
      This       : access IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_TrimTimeFromStart
   (
      This       : access IBackgroundAudioTrack_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_TrimTimeFromEnd
   (
      This       : access IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_TrimTimeFromEnd
   (
      This       : access IBackgroundAudioTrack_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginalDuration
   (
      This       : access IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_TrimmedDuration
   (
      This       : access IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_UserData
   (
      This       : access IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Delay
   (
      This       : access IBackgroundAudioTrack_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Delay
   (
      This       : access IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Volume
   (
      This       : access IBackgroundAudioTrack_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Volume
   (
      This       : access IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function Clone
   (
      This       : access IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Media.Editing.IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function GetAudioEncodingProperties
   (
      This       : access IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioEffectDefinitions
   (
      This       : access IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Media.Effects.IVector_IAudioEffectDefinition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBackgroundAudioTrackStatics : aliased constant Windows.IID := (3652305111, 53272, 17064, (165, 89, 203, 77, 158, 151, 230, 100 ));
   
   type IBackgroundAudioTrackStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromEmbeddedAudioTrack
   (
      This       : access IBackgroundAudioTrackStatics_Interface
      ; embeddedAudioTrack : Windows.Media.Editing.IEmbeddedAudioTrack
      ; RetVal : access Windows.Media.Editing.IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromFileAsync
   (
      This       : access IBackgroundAudioTrackStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.Editing.IAsyncOperation_IBackgroundAudioTrack -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaComposition2 : aliased constant Windows.IID := (2778616690, 9062, 18732, (190, 200, 230, 223, 186, 109, 2, 129 ));
   
   type IMediaComposition2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OverlayLayers
   (
      This       : access IMediaComposition2_Interface
      ; RetVal : access Windows.Media.Editing.IVector_IMediaOverlayLayer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaOverlay : aliased constant Windows.IID := (2835525213, 30825, 18480, (138, 177, 148, 220, 1, 192, 95, 164 ));
   
   type IMediaOverlay_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IMediaOverlay_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access IMediaOverlay_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_Delay
   (
      This       : access IMediaOverlay_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Delay
   (
      This       : access IMediaOverlay_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Opacity
   (
      This       : access IMediaOverlay_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Opacity
   (
      This       : access IMediaOverlay_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function Clone
   (
      This       : access IMediaOverlay_Interface
      ; RetVal : access Windows.Media.Editing.IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   function get_Clip
   (
      This       : access IMediaOverlay_Interface
      ; RetVal : access Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioEnabled
   (
      This       : access IMediaOverlay_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioEnabled
   (
      This       : access IMediaOverlay_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaOverlayFactory : aliased constant Windows.IID := (3045360266, 24968, 20367, (162, 224, 170, 85, 45, 89, 142, 24 ));
   
   type IMediaOverlayFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IMediaOverlayFactory_Interface
      ; clip : Windows.Media.Editing.IMediaClip
      ; RetVal : access Windows.Media.Editing.IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithPositionAndOpacity
   (
      This       : access IMediaOverlayFactory_Interface
      ; clip : Windows.Media.Editing.IMediaClip
      ; position : Windows.Foundation.Rect
      ; opacity : Windows.Double
      ; RetVal : access Windows.Media.Editing.IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaOverlayLayerFactory : aliased constant Windows.IID := (2491200627, 41886, 17250, (171, 191, 159, 139, 80, 112, 160, 98 ));
   
   type IMediaOverlayLayerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithCompositorDefinition
   (
      This       : access IMediaOverlayLayerFactory_Interface
      ; compositorDefinition : Windows.Media.Effects.IVideoCompositorDefinition
      ; RetVal : access Windows.Media.Editing.IMediaOverlayLayer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaOverlayLayer : aliased constant Windows.IID := (2799286871, 61146, 18118, (187, 229, 227, 152, 200, 65, 104, 172 ));
   
   type IMediaOverlayLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function Clone
   (
      This       : access IMediaOverlayLayer_Interface
      ; RetVal : access Windows.Media.Editing.IMediaOverlayLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_Overlays
   (
      This       : access IMediaOverlayLayer_Interface
      ; RetVal : access Windows.Media.Editing.IVector_IMediaOverlay -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomCompositorDefinition
   (
      This       : access IMediaOverlayLayer_Interface
      ; RetVal : access Windows.Media.Effects.IVideoCompositorDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IEmbeddedAudioTrack : aliased constant Windows.IID := (3388637009, 46380, 22414, (153, 249, 1, 44, 213, 100, 18, 71 ));
   
   type IIterator_IEmbeddedAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IEmbeddedAudioTrack_Interface
      ; RetVal : access Windows.Media.Editing.IEmbeddedAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IEmbeddedAudioTrack_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IEmbeddedAudioTrack_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IEmbeddedAudioTrack_Interface
      ; items : Windows.Media.Editing.IEmbeddedAudioTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IEmbeddedAudioTrack : aliased constant Windows.IID := (855293648, 57830, 22414, (134, 229, 180, 230, 171, 235, 34, 214 ));
   
   type IIterable_IEmbeddedAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IEmbeddedAudioTrack_Interface
      ; RetVal : access Windows.Media.Editing.IIterator_IEmbeddedAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IEmbeddedAudioTrack : aliased constant Windows.IID := (1675123669, 17253, 24150, (158, 64, 231, 205, 48, 81, 174, 191 ));
   
   type IVectorView_IEmbeddedAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IEmbeddedAudioTrack_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Editing.IEmbeddedAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IEmbeddedAudioTrack_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IEmbeddedAudioTrack_Interface
      ; value : Windows.Media.Editing.IEmbeddedAudioTrack
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IEmbeddedAudioTrack_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Editing.IEmbeddedAudioTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMediaClip : aliased constant Windows.IID := (771563698, 1752, 22397, (171, 6, 119, 30, 4, 20, 252, 0 ));
   
   type IIterator_IMediaClip_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaClip_Interface
      ; RetVal : access Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaClip_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaClip_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaClip_Interface
      ; items : Windows.Media.Editing.IMediaClip_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMediaClip : aliased constant Windows.IID := (4281244508, 9936, 22365, (163, 235, 125, 147, 139, 209, 111, 23 ));
   
   type IIterable_IMediaClip_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaClip_Interface
      ; RetVal : access Windows.Media.Editing.IIterator_IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMediaClip : aliased constant Windows.IID := (3938392230, 62520, 21424, (190, 60, 175, 33, 230, 123, 200, 199 ));
   
   type IVectorView_IMediaClip_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaClip_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaClip_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaClip_Interface
      ; value : Windows.Media.Editing.IMediaClip
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaClip_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Editing.IMediaClip_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IMediaClip : aliased constant Windows.IID := (3892668558, 13576, 22515, (191, 149, 97, 127, 45, 122, 111, 26 ));
   
   type IVector_IMediaClip_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IMediaClip_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IMediaClip_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IMediaClip_Interface
      ; RetVal : access Windows.Media.Editing.IVectorView_IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IMediaClip_Interface
      ; value : Windows.Media.Editing.IMediaClip
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IMediaClip_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IMediaClip_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IMediaClip_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IMediaClip_Interface
      ; value : Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IMediaClip_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IMediaClip_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IMediaClip_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Editing.IMediaClip_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IMediaClip_Interface
      ; items : Windows.Media.Editing.IMediaClip_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IBackgroundAudioTrack : aliased constant Windows.IID := (414250642, 34357, 22394, (158, 250, 203, 144, 71, 112, 214, 229 ));
   
   type IIterator_IBackgroundAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Media.Editing.IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IBackgroundAudioTrack_Interface
      ; items : Windows.Media.Editing.IBackgroundAudioTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IBackgroundAudioTrack : aliased constant Windows.IID := (1069570978, 12534, 21017, (144, 71, 17, 151, 255, 174, 141, 186 ));
   
   type IIterable_IBackgroundAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Media.Editing.IIterator_IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IBackgroundAudioTrack : aliased constant Windows.IID := (2145726002, 34428, 21155, (179, 183, 212, 221, 77, 87, 55, 148 ));
   
   type IVectorView_IBackgroundAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IBackgroundAudioTrack_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Editing.IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IBackgroundAudioTrack_Interface
      ; value : Windows.Media.Editing.IBackgroundAudioTrack
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IBackgroundAudioTrack_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Editing.IBackgroundAudioTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IBackgroundAudioTrack : aliased constant Windows.IID := (1456873797, 27000, 24250, (131, 201, 252, 74, 214, 212, 67, 191 ));
   
   type IVector_IBackgroundAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Editing.IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Media.Editing.IVectorView_IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
      ; value : Windows.Media.Editing.IBackgroundAudioTrack
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Editing.IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Editing.IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
      ; value : Windows.Media.Editing.IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Editing.IBackgroundAudioTrack_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IBackgroundAudioTrack_Interface
      ; items : Windows.Media.Editing.IBackgroundAudioTrack_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMediaClip : aliased constant Windows.IID := (3051788765, 46833, 20928, (183, 82, 224, 47, 160, 6, 141, 121 ));
   
   type IAsyncOperation_IMediaClip_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMediaClip_Interface
      ; handler : Windows.Media.Editing.AsyncOperationCompletedHandler_IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMediaClip_Interface
      ; RetVal : access Windows.Media.Editing.AsyncOperationCompletedHandler_IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMediaClip_Interface
      ; RetVal : access Windows.Media.Editing.IMediaClip
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMediaComposition : aliased constant Windows.IID := (3782273176, 53535, 20564, (171, 19, 16, 128, 164, 128, 118, 54 ));
   
   type IAsyncOperation_IMediaComposition_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMediaComposition_Interface
      ; handler : Windows.Media.Editing.AsyncOperationCompletedHandler_IMediaComposition
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMediaComposition_Interface
      ; RetVal : access Windows.Media.Editing.AsyncOperationCompletedHandler_IMediaComposition
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMediaComposition_Interface
      ; RetVal : access Windows.Media.Editing.IMediaComposition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IBackgroundAudioTrack : aliased constant Windows.IID := (1228785816, 24694, 22005, (171, 132, 204, 249, 115, 172, 3, 151 ));
   
   type IAsyncOperation_IBackgroundAudioTrack_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBackgroundAudioTrack_Interface
      ; handler : Windows.Media.Editing.AsyncOperationCompletedHandler_IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Media.Editing.AsyncOperationCompletedHandler_IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBackgroundAudioTrack_Interface
      ; RetVal : access Windows.Media.Editing.IBackgroundAudioTrack
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMediaOverlayLayer : aliased constant Windows.IID := (3393199832, 25554, 21082, (128, 187, 228, 148, 144, 12, 76, 230 ));
   
   type IIterator_IMediaOverlayLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaOverlayLayer_Interface
      ; RetVal : access Windows.Media.Editing.IMediaOverlayLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaOverlayLayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaOverlayLayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaOverlayLayer_Interface
      ; items : Windows.Media.Editing.IMediaOverlayLayer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMediaOverlayLayer : aliased constant Windows.IID := (2099450576, 62370, 20625, (138, 94, 65, 131, 46, 99, 44, 8 ));
   
   type IIterable_IMediaOverlayLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaOverlayLayer_Interface
      ; RetVal : access Windows.Media.Editing.IIterator_IMediaOverlayLayer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMediaOverlayLayer : aliased constant Windows.IID := (2345418740, 24889, 21185, (150, 105, 83, 218, 80, 51, 24, 94 ));
   
   type IVectorView_IMediaOverlayLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaOverlayLayer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Editing.IMediaOverlayLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaOverlayLayer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaOverlayLayer_Interface
      ; value : Windows.Media.Editing.IMediaOverlayLayer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaOverlayLayer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Editing.IMediaOverlayLayer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IMediaOverlayLayer : aliased constant Windows.IID := (1701112620, 8720, 24060, (168, 76, 38, 108, 67, 73, 194, 198 ));
   
   type IVector_IMediaOverlayLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IMediaOverlayLayer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Editing.IMediaOverlayLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IMediaOverlayLayer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IMediaOverlayLayer_Interface
      ; RetVal : access Windows.Media.Editing.IVectorView_IMediaOverlayLayer
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IMediaOverlayLayer_Interface
      ; value : Windows.Media.Editing.IMediaOverlayLayer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IMediaOverlayLayer_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Editing.IMediaOverlayLayer
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IMediaOverlayLayer_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Editing.IMediaOverlayLayer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IMediaOverlayLayer_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IMediaOverlayLayer_Interface
      ; value : Windows.Media.Editing.IMediaOverlayLayer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IMediaOverlayLayer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IMediaOverlayLayer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IMediaOverlayLayer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Editing.IMediaOverlayLayer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IMediaOverlayLayer_Interface
      ; items : Windows.Media.Editing.IMediaOverlayLayer_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMediaOverlay : aliased constant Windows.IID := (891252516, 19090, 22230, (161, 135, 250, 234, 231, 72, 224, 199 ));
   
   type IIterator_IMediaOverlay_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaOverlay_Interface
      ; RetVal : access Windows.Media.Editing.IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaOverlay_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaOverlay_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaOverlay_Interface
      ; items : Windows.Media.Editing.IMediaOverlay_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMediaOverlay : aliased constant Windows.IID := (4023231047, 41467, 20956, (167, 118, 227, 224, 102, 149, 251, 54 ));
   
   type IIterable_IMediaOverlay_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaOverlay_Interface
      ; RetVal : access Windows.Media.Editing.IIterator_IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMediaOverlay : aliased constant Windows.IID := (1807387222, 12056, 23144, (131, 205, 154, 169, 215, 248, 247, 87 ));
   
   type IVectorView_IMediaOverlay_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaOverlay_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Editing.IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaOverlay_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaOverlay_Interface
      ; value : Windows.Media.Editing.IMediaOverlay
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaOverlay_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Editing.IMediaOverlay_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IMediaOverlay : aliased constant Windows.IID := (1536245448, 60754, 23340, (167, 16, 82, 198, 231, 171, 60, 178 ));
   
   type IVector_IMediaOverlay_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IMediaOverlay_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Editing.IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IMediaOverlay_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IMediaOverlay_Interface
      ; RetVal : access Windows.Media.Editing.IVectorView_IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IMediaOverlay_Interface
      ; value : Windows.Media.Editing.IMediaOverlay
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IMediaOverlay_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Editing.IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IMediaOverlay_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Editing.IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IMediaOverlay_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IMediaOverlay_Interface
      ; value : Windows.Media.Editing.IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IMediaOverlay_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IMediaOverlay_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IMediaOverlay_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Editing.IMediaOverlay_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IMediaOverlay_Interface
      ; items : Windows.Media.Editing.IMediaOverlay_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMediaClip : aliased constant Windows.IID := (1624105916, 4511, 20648, (156, 203, 158, 165, 126, 169, 107, 253 ));
   
   type AsyncOperationCompletedHandler_IMediaClip_Interface(Callback : access procedure (asyncInfo : Windows.Media.Editing.IAsyncOperation_IMediaClip ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMediaClip'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaClip_Interface
      ; asyncInfo : Windows.Media.Editing.IAsyncOperation_IMediaClip
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMediaComposition : aliased constant Windows.IID := (3989984248, 20157, 22245, (149, 146, 60, 9, 55, 94, 189, 196 ));
   
   type AsyncOperationCompletedHandler_IMediaComposition_Interface(Callback : access procedure (asyncInfo : Windows.Media.Editing.IAsyncOperation_IMediaComposition ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMediaComposition'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaComposition_Interface
      ; asyncInfo : Windows.Media.Editing.IAsyncOperation_IMediaComposition
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IBackgroundAudioTrack : aliased constant Windows.IID := (3095595975, 6283, 23589, (163, 187, 149, 144, 82, 188, 183, 64 ));
   
   type AsyncOperationCompletedHandler_IBackgroundAudioTrack_Interface(Callback : access procedure (asyncInfo : Windows.Media.Editing.IAsyncOperation_IBackgroundAudioTrack ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IBackgroundAudioTrack'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBackgroundAudioTrack_Interface
      ; asyncInfo : Windows.Media.Editing.IAsyncOperation_IBackgroundAudioTrack
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MediaOverlay is Windows.Media.Editing.IMediaOverlay;
   function Create
   (
      clip : Windows.Media.Editing.IMediaClip
   )
   return Windows.Media.Editing.IMediaOverlay;
   
   function CreateWithPositionAndOpacity
   (
      clip : Windows.Media.Editing.IMediaClip
      ; position : Windows.Foundation.Rect
      ; opacity : Windows.Double
   )
   return Windows.Media.Editing.IMediaOverlay;
   
   subtype MediaClip is Windows.Media.Editing.IMediaClip;
   subtype EmbeddedAudioTrack is Windows.Media.Editing.IEmbeddedAudioTrack;
   subtype BackgroundAudioTrack is Windows.Media.Editing.IBackgroundAudioTrack;
   subtype MediaComposition is Windows.Media.Editing.IMediaComposition;
   function CreateMediaComposition return Windows.Media.Editing.IMediaComposition;
   
   subtype MediaOverlayLayer is Windows.Media.Editing.IMediaOverlayLayer;
   function CreateMediaOverlayLayer return Windows.Media.Editing.IMediaOverlayLayer;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateFromColor
   (
      color : Windows.UI.Color
      ; originalDuration : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Editing.IMediaClip;
   
   function CreateFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.Editing.IAsyncOperation_IMediaClip;
   
   function CreateFromImageFileAsync
   (
      file : Windows.Storage.IStorageFile
      ; originalDuration : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Editing.IAsyncOperation_IMediaClip;
   
   function CreateFromSurface
   (
      surface : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; originalDuration : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Editing.IMediaClip;
   
   function CreateFromEmbeddedAudioTrack
   (
      embeddedAudioTrack : Windows.Media.Editing.IEmbeddedAudioTrack
   )
   return Windows.Media.Editing.IBackgroundAudioTrack;
   
   function CreateFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.Editing.IAsyncOperation_IBackgroundAudioTrack;
   
   function LoadAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.Editing.IAsyncOperation_IMediaComposition;
   
end;
