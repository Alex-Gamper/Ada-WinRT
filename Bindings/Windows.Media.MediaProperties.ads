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
with Windows; use Windows;
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Storage;
limited with Windows.Storage.Streams;
limited with Windows.Media.Core;
--------------------------------------------------------------------------------
package Windows.Media.MediaProperties is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type StereoscopicVideoPackingMode is (
      None,
      SideBySide,
      TopBottom
   );
   for StereoscopicVideoPackingMode use (
      None => 0,
      SideBySide => 1,
      TopBottom => 2
   );
   for StereoscopicVideoPackingMode'Size use 32;
   
   type StereoscopicVideoPackingMode_Ptr is access StereoscopicVideoPackingMode;
   
   type SphericalVideoFrameFormat is (
      None,
      Unsupported,
      Equirectangular
   );
   for SphericalVideoFrameFormat use (
      None => 0,
      Unsupported => 1,
      Equirectangular => 2
   );
   for SphericalVideoFrameFormat'Size use 32;
   
   type SphericalVideoFrameFormat_Ptr is access SphericalVideoFrameFormat;
   
   type MediaPixelFormat is (
      Nv12,
      Bgra8
   );
   for MediaPixelFormat use (
      Nv12 => 0,
      Bgra8 => 1
   );
   for MediaPixelFormat'Size use 32;
   
   type MediaPixelFormat_Ptr is access MediaPixelFormat;
   
   type MediaThumbnailFormat is (
      Bmp,
      Bgra8
   );
   for MediaThumbnailFormat use (
      Bmp => 0,
      Bgra8 => 1
   );
   for MediaThumbnailFormat'Size use 32;
   
   type MediaThumbnailFormat_Ptr is access MediaThumbnailFormat;
   
   type AudioEncodingQuality is (
      Auto,
      High,
      Medium,
      Low
   );
   for AudioEncodingQuality use (
      Auto => 0,
      High => 1,
      Medium => 2,
      Low => 3
   );
   for AudioEncodingQuality'Size use 32;
   
   type AudioEncodingQuality_Ptr is access AudioEncodingQuality;
   
   type VideoEncodingQuality is (
      Auto,
      HD1080p,
      HD720p,
      Wvga,
      Ntsc,
      Pal,
      Vga,
      Qvga,
      Uhd2160p,
      Uhd4320p
   );
   for VideoEncodingQuality use (
      Auto => 0,
      HD1080p => 1,
      HD720p => 2,
      Wvga => 3,
      Ntsc => 4,
      Pal => 5,
      Vga => 6,
      Qvga => 7,
      Uhd2160p => 8,
      Uhd4320p => 9
   );
   for VideoEncodingQuality'Size use 32;
   
   type VideoEncodingQuality_Ptr is access VideoEncodingQuality;
   
   type MediaRotation is (
      None,
      Clockwise90Degrees,
      Clockwise180Degrees,
      Clockwise270Degrees
   );
   for MediaRotation use (
      None => 0,
      Clockwise90Degrees => 1,
      Clockwise180Degrees => 2,
      Clockwise270Degrees => 3
   );
   for MediaRotation'Size use 32;
   
   type MediaRotation_Ptr is access MediaRotation;
   
   type MediaMirroringOptions is (
      None,
      Horizontal,
      Vertical
   );
   for MediaMirroringOptions use (
      None => 0,
      Horizontal => 1,
      Vertical => 2
   );
   for MediaMirroringOptions'Size use 32;
   
   type MediaMirroringOptions_Ptr is access MediaMirroringOptions;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMediaEncodingProfile_Interface;
   type AsyncOperationCompletedHandler_IMediaEncodingProfile is access all AsyncOperationCompletedHandler_IMediaEncodingProfile_Interface'Class;
   type AsyncOperationCompletedHandler_IMediaEncodingProfile_Ptr is access all AsyncOperationCompletedHandler_IMediaEncodingProfile;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMediaRatio_Interface;
   type IMediaRatio is access all IMediaRatio_Interface'Class;
   type IMediaRatio_Ptr is access all IMediaRatio;
   type IMap_Guid_Object_Interface;
   type IMap_Guid_Object is access all IMap_Guid_Object_Interface'Class;
   type IMap_Guid_Object_Ptr is access all IMap_Guid_Object;
   type IMediaEncodingProperties_Interface;
   type IMediaEncodingProperties is access all IMediaEncodingProperties_Interface'Class;
   type IMediaEncodingProperties_Ptr is access all IMediaEncodingProperties;
   type IAudioEncodingProperties_Interface;
   type IAudioEncodingProperties is access all IAudioEncodingProperties_Interface'Class;
   type IAudioEncodingProperties_Ptr is access all IAudioEncodingProperties;
   type IAudioEncodingPropertiesWithFormatUserData_Interface;
   type IAudioEncodingPropertiesWithFormatUserData is access all IAudioEncodingPropertiesWithFormatUserData_Interface'Class;
   type IAudioEncodingPropertiesWithFormatUserData_Ptr is access all IAudioEncodingPropertiesWithFormatUserData;
   type IAudioEncodingProperties2_Interface;
   type IAudioEncodingProperties2 is access all IAudioEncodingProperties2_Interface'Class;
   type IAudioEncodingProperties2_Ptr is access all IAudioEncodingProperties2;
   type IAudioEncodingPropertiesStatics_Interface;
   type IAudioEncodingPropertiesStatics is access all IAudioEncodingPropertiesStatics_Interface'Class;
   type IAudioEncodingPropertiesStatics_Ptr is access all IAudioEncodingPropertiesStatics;
   type IAudioEncodingPropertiesStatics2_Interface;
   type IAudioEncodingPropertiesStatics2 is access all IAudioEncodingPropertiesStatics2_Interface'Class;
   type IAudioEncodingPropertiesStatics2_Ptr is access all IAudioEncodingPropertiesStatics2;
   type IVideoEncodingProperties_Interface;
   type IVideoEncodingProperties is access all IVideoEncodingProperties_Interface'Class;
   type IVideoEncodingProperties_Ptr is access all IVideoEncodingProperties;
   type IMediaEncodingSubtypesStatics_Interface;
   type IMediaEncodingSubtypesStatics is access all IMediaEncodingSubtypesStatics_Interface'Class;
   type IMediaEncodingSubtypesStatics_Ptr is access all IMediaEncodingSubtypesStatics;
   type IMediaEncodingSubtypesStatics2_Interface;
   type IMediaEncodingSubtypesStatics2 is access all IMediaEncodingSubtypesStatics2_Interface'Class;
   type IMediaEncodingSubtypesStatics2_Ptr is access all IMediaEncodingSubtypesStatics2;
   type IMediaEncodingSubtypesStatics3_Interface;
   type IMediaEncodingSubtypesStatics3 is access all IMediaEncodingSubtypesStatics3_Interface'Class;
   type IMediaEncodingSubtypesStatics3_Ptr is access all IMediaEncodingSubtypesStatics3;
   type IH264ProfileIdsStatics_Interface;
   type IH264ProfileIdsStatics is access all IH264ProfileIdsStatics_Interface'Class;
   type IH264ProfileIdsStatics_Ptr is access all IH264ProfileIdsStatics;
   type IMpeg2ProfileIdsStatics_Interface;
   type IMpeg2ProfileIdsStatics is access all IMpeg2ProfileIdsStatics_Interface'Class;
   type IMpeg2ProfileIdsStatics_Ptr is access all IMpeg2ProfileIdsStatics;
   type IVideoEncodingProperties2_Interface;
   type IVideoEncodingProperties2 is access all IVideoEncodingProperties2_Interface'Class;
   type IVideoEncodingProperties2_Ptr is access all IVideoEncodingProperties2;
   type IVideoEncodingProperties3_Interface;
   type IVideoEncodingProperties3 is access all IVideoEncodingProperties3_Interface'Class;
   type IVideoEncodingProperties3_Ptr is access all IVideoEncodingProperties3;
   type IVideoEncodingProperties4_Interface;
   type IVideoEncodingProperties4 is access all IVideoEncodingProperties4_Interface'Class;
   type IVideoEncodingProperties4_Ptr is access all IVideoEncodingProperties4;
   type IVideoEncodingPropertiesStatics_Interface;
   type IVideoEncodingPropertiesStatics is access all IVideoEncodingPropertiesStatics_Interface'Class;
   type IVideoEncodingPropertiesStatics_Ptr is access all IVideoEncodingPropertiesStatics;
   type IVideoEncodingPropertiesStatics2_Interface;
   type IVideoEncodingPropertiesStatics2 is access all IVideoEncodingPropertiesStatics2_Interface'Class;
   type IVideoEncodingPropertiesStatics2_Ptr is access all IVideoEncodingPropertiesStatics2;
   type IImageEncodingProperties_Interface;
   type IImageEncodingProperties is access all IImageEncodingProperties_Interface'Class;
   type IImageEncodingProperties_Ptr is access all IImageEncodingProperties;
   type IImageEncodingPropertiesStatics_Interface;
   type IImageEncodingPropertiesStatics is access all IImageEncodingPropertiesStatics_Interface'Class;
   type IImageEncodingPropertiesStatics_Ptr is access all IImageEncodingPropertiesStatics;
   type IImageEncodingPropertiesStatics2_Interface;
   type IImageEncodingPropertiesStatics2 is access all IImageEncodingPropertiesStatics2_Interface'Class;
   type IImageEncodingPropertiesStatics2_Ptr is access all IImageEncodingPropertiesStatics2;
   type IContainerEncodingProperties_Interface;
   type IContainerEncodingProperties is access all IContainerEncodingProperties_Interface'Class;
   type IContainerEncodingProperties_Ptr is access all IContainerEncodingProperties;
   type IMediaEncodingProfileStatics_Interface;
   type IMediaEncodingProfileStatics is access all IMediaEncodingProfileStatics_Interface'Class;
   type IMediaEncodingProfileStatics_Ptr is access all IMediaEncodingProfileStatics;
   type IMediaEncodingProfileStatics2_Interface;
   type IMediaEncodingProfileStatics2 is access all IMediaEncodingProfileStatics2_Interface'Class;
   type IMediaEncodingProfileStatics2_Ptr is access all IMediaEncodingProfileStatics2;
   type IMediaEncodingProfileStatics3_Interface;
   type IMediaEncodingProfileStatics3 is access all IMediaEncodingProfileStatics3_Interface'Class;
   type IMediaEncodingProfileStatics3_Ptr is access all IMediaEncodingProfileStatics3;
   type IMediaEncodingProfile_Interface;
   type IMediaEncodingProfile is access all IMediaEncodingProfile_Interface'Class;
   type IMediaEncodingProfile_Ptr is access all IMediaEncodingProfile;
   type IMediaEncodingProfile2_Interface;
   type IMediaEncodingProfile2 is access all IMediaEncodingProfile2_Interface'Class;
   type IMediaEncodingProfile2_Ptr is access all IMediaEncodingProfile2;
   type IAsyncOperation_IMediaEncodingProfile_Interface;
   type IAsyncOperation_IMediaEncodingProfile is access all IAsyncOperation_IMediaEncodingProfile_Interface'Class;
   type IAsyncOperation_IMediaEncodingProfile_Ptr is access all IAsyncOperation_IMediaEncodingProfile;
   type IIterator_IMediaEncodingProperties_Interface;
   type IIterator_IMediaEncodingProperties is access all IIterator_IMediaEncodingProperties_Interface'Class;
   type IIterator_IMediaEncodingProperties_Ptr is access all IIterator_IMediaEncodingProperties;
   type IIterable_IMediaEncodingProperties_Interface;
   type IIterable_IMediaEncodingProperties is access all IIterable_IMediaEncodingProperties_Interface'Class;
   type IIterable_IMediaEncodingProperties_Ptr is access all IIterable_IMediaEncodingProperties;
   type IVectorView_IMediaEncodingProperties_Interface;
   type IVectorView_IMediaEncodingProperties is access all IVectorView_IMediaEncodingProperties_Interface'Class;
   type IVectorView_IMediaEncodingProperties_Ptr is access all IVectorView_IMediaEncodingProperties;
   type IIterator_IVideoEncodingProperties_Interface;
   type IIterator_IVideoEncodingProperties is access all IIterator_IVideoEncodingProperties_Interface'Class;
   type IIterator_IVideoEncodingProperties_Ptr is access all IIterator_IVideoEncodingProperties;
   type IIterable_IVideoEncodingProperties_Interface;
   type IIterable_IVideoEncodingProperties is access all IIterable_IVideoEncodingProperties_Interface'Class;
   type IIterable_IVideoEncodingProperties_Ptr is access all IIterable_IVideoEncodingProperties;
   type IVectorView_IVideoEncodingProperties_Interface;
   type IVectorView_IVideoEncodingProperties is access all IVectorView_IVideoEncodingProperties_Interface'Class;
   type IVectorView_IVideoEncodingProperties_Ptr is access all IVectorView_IVideoEncodingProperties;
   type IIterator_IAudioEncodingProperties_Interface;
   type IIterator_IAudioEncodingProperties is access all IIterator_IAudioEncodingProperties_Interface'Class;
   type IIterator_IAudioEncodingProperties_Ptr is access all IIterator_IAudioEncodingProperties;
   type IIterable_IAudioEncodingProperties_Interface;
   type IIterable_IAudioEncodingProperties is access all IIterable_IAudioEncodingProperties_Interface'Class;
   type IIterable_IAudioEncodingProperties_Ptr is access all IIterable_IAudioEncodingProperties;
   type IVectorView_IAudioEncodingProperties_Interface;
   type IVectorView_IAudioEncodingProperties is access all IVectorView_IAudioEncodingProperties_Interface'Class;
   type IVectorView_IAudioEncodingProperties_Ptr is access all IVectorView_IAudioEncodingProperties;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMediaRatio : aliased constant Windows.IID := (3536912101, 35113, 16413, (172, 120, 125, 53, 126, 55, 129, 99 ));
   
   type IMediaRatio_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Numerator
   (
      This       : access IMediaRatio_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Numerator
   (
      This       : access IMediaRatio_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Denominator
   (
      This       : access IMediaRatio_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Denominator
   (
      This       : access IMediaRatio_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMap_Guid_Object : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
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
   
   ------------------------------------------------------------------------
   
   IID_IMediaEncodingProperties : aliased constant Windows.IID := (3019909878, 44244, 20058, (162, 75, 93, 116, 152, 168, 184, 196 ));
   
   type IMediaEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Properties
   (
      This       : access IMediaEncodingProperties_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMap_Guid_Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IMediaEncodingProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Subtype
   (
      This       : access IMediaEncodingProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subtype
   (
      This       : access IMediaEncodingProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioEncodingProperties : aliased constant Windows.IID := (1656519190, 92, 19259, (138, 11, 10, 9, 14, 150, 135, 243 ));
   
   type IAudioEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Bitrate
   (
      This       : access IAudioEncodingProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Bitrate
   (
      This       : access IAudioEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ChannelCount
   (
      This       : access IAudioEncodingProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ChannelCount
   (
      This       : access IAudioEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_SampleRate
   (
      This       : access IAudioEncodingProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_SampleRate
   (
      This       : access IAudioEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_BitsPerSample
   (
      This       : access IAudioEncodingProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BitsPerSample
   (
      This       : access IAudioEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioEncodingPropertiesWithFormatUserData : aliased constant Windows.IID := (2565934457, 5098, 18943, (190, 112, 38, 115, 219, 105, 112, 44 ));
   
   type IAudioEncodingPropertiesWithFormatUserData_Interface is interface and Windows.IInspectable_Interface;
   
   function SetFormatUserData
   (
      This       : access IAudioEncodingPropertiesWithFormatUserData_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetFormatUserData
   (
      This       : access IAudioEncodingPropertiesWithFormatUserData_Interface
      ; value : access Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioEncodingProperties2 : aliased constant Windows.IID := (3294450906, 32957, 19491, (128, 213, 114, 212, 161, 129, 232, 148 ));
   
   type IAudioEncodingProperties2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSpatial
   (
      This       : access IAudioEncodingProperties2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioEncodingPropertiesStatics : aliased constant Windows.IID := (212677420, 60393, 17703, (179, 109, 228, 42, 19, 207, 56, 219 ));
   
   type IAudioEncodingPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAac
   (
      This       : access IAudioEncodingPropertiesStatics_Interface
      ; sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function CreateAacAdts
   (
      This       : access IAudioEncodingPropertiesStatics_Interface
      ; sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function CreateMp3
   (
      This       : access IAudioEncodingPropertiesStatics_Interface
      ; sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function CreatePcm
   (
      This       : access IAudioEncodingPropertiesStatics_Interface
      ; sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitsPerSample : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function CreateWma
   (
      This       : access IAudioEncodingPropertiesStatics_Interface
      ; sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioEncodingPropertiesStatics2 : aliased constant Windows.IID := (1955148143, 30624, 17213, (142, 213, 64, 64, 40, 14, 134, 101 ));
   
   type IAudioEncodingPropertiesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAlac
   (
      This       : access IAudioEncodingPropertiesStatics2_Interface
      ; sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitsPerSample : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function CreateFlac
   (
      This       : access IAudioEncodingPropertiesStatics2_Interface
      ; sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitsPerSample : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoEncodingProperties : aliased constant Windows.IID := (1995336858, 14274, 20266, (136, 10, 18, 130, 187, 180, 55, 61 ));
   
   type IVideoEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Bitrate
   (
      This       : access IVideoEncodingProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Bitrate
   (
      This       : access IVideoEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Width
   (
      This       : access IVideoEncodingProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IVideoEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Height
   (
      This       : access IVideoEncodingProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IVideoEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameRate
   (
      This       : access IVideoEncodingProperties_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaRatio
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelAspectRatio
   (
      This       : access IVideoEncodingProperties_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaRatio
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaEncodingSubtypesStatics : aliased constant Windows.IID := (934696974, 41329, 17508, (186, 90, 83, 24, 158, 72, 193, 200 ));
   
   type IMediaEncodingSubtypesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Aac
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AacAdts
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Ac3
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AmrNb
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AmrWb
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Argb32
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Asf
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Avi
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Bgra8
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Bmp
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Eac3
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Float
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Gif
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_H263
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_H264
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_H264Es
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Hevc
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HevcEs
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Iyuv
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Jpeg
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_JpegXr
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Mjpg
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Mpeg
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Mpeg1
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Mpeg2
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Mp3
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Mpeg4
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Nv12
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Pcm
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Png
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Rgb24
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Rgb32
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Tiff
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Wave
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Wma8
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Wma9
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Wmv3
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Wvc1
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Yuy2
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Yv12
   (
      This       : access IMediaEncodingSubtypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaEncodingSubtypesStatics2 : aliased constant Windows.IID := (1266471485, 17151, 19763, (133, 49, 6, 38, 190, 228, 181, 45 ));
   
   type IMediaEncodingSubtypesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Vp9
   (
      This       : access IMediaEncodingSubtypesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_L8
   (
      This       : access IMediaEncodingSubtypesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_L16
   (
      This       : access IMediaEncodingSubtypesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_D16
   (
      This       : access IMediaEncodingSubtypesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaEncodingSubtypesStatics3 : aliased constant Windows.IID := (3122926820, 34877, 17998, (164, 79, 9, 125, 160, 142, 247, 255 ));
   
   type IMediaEncodingSubtypesStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Alac
   (
      This       : access IMediaEncodingSubtypesStatics3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Flac
   (
      This       : access IMediaEncodingSubtypesStatics3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IH264ProfileIdsStatics : aliased constant Windows.IID := (946162855, 33898, 20375, (162, 229, 195, 161, 91, 191, 112, 253 ));
   
   type IH264ProfileIdsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConstrainedBaseline
   (
      This       : access IH264ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Baseline
   (
      This       : access IH264ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Extended
   (
      This       : access IH264ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Main
   (
      This       : access IH264ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_High
   (
      This       : access IH264ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_High10
   (
      This       : access IH264ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_High422
   (
      This       : access IH264ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_High444
   (
      This       : access IH264ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_StereoHigh
   (
      This       : access IH264ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MultiviewHigh
   (
      This       : access IH264ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMpeg2ProfileIdsStatics : aliased constant Windows.IID := (2757885829, 58746, 16680, (155, 33, 213, 51, 27, 4, 35, 92 ));
   
   type IMpeg2ProfileIdsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Simple
   (
      This       : access IMpeg2ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Main
   (
      This       : access IMpeg2ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SignalNoiseRatioScalable
   (
      This       : access IMpeg2ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SpatiallyScalable
   (
      This       : access IMpeg2ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_High
   (
      This       : access IMpeg2ProfileIdsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoEncodingProperties2 : aliased constant Windows.IID := (4148404719, 54373, 17040, (169, 75, 239, 15, 21, 40, 248, 227 ));
   
   type IVideoEncodingProperties2_Interface is interface and Windows.IInspectable_Interface;
   
   function SetFormatUserData
   (
      This       : access IVideoEncodingProperties2_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetFormatUserData
   (
      This       : access IVideoEncodingProperties2_Interface
      ; value : access Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function put_ProfileId
   (
      This       : access IVideoEncodingProperties2_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ProfileId
   (
      This       : access IVideoEncodingProperties2_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoEncodingProperties3 : aliased constant Windows.IID := (946589124, 34618, 18335, (179, 235, 86, 193, 252, 190, 198, 215 ));
   
   type IVideoEncodingProperties3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StereoscopicVideoPackingMode
   (
      This       : access IVideoEncodingProperties3_Interface
      ; RetVal : access Windows.Media.MediaProperties.StereoscopicVideoPackingMode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoEncodingProperties4 : aliased constant Windows.IID := (1917775892, 49420, 16626, (157, 114, 62, 225, 59, 69, 250, 142 ));
   
   type IVideoEncodingProperties4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SphericalVideoFrameFormat
   (
      This       : access IVideoEncodingProperties4_Interface
      ; RetVal : access Windows.Media.MediaProperties.SphericalVideoFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoEncodingPropertiesStatics : aliased constant Windows.IID := (1021398340, 7621, 17371, (159, 56, 235, 235, 249, 1, 82, 203 ));
   
   type IVideoEncodingPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateH264
   (
      This       : access IVideoEncodingPropertiesStatics_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function CreateMpeg2
   (
      This       : access IVideoEncodingPropertiesStatics_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function CreateUncompressed
   (
      This       : access IVideoEncodingPropertiesStatics_Interface
      ; subtype_x : Windows.String
      ; width : Windows.UInt32
      ; height : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoEncodingPropertiesStatics2 : aliased constant Windows.IID := (3474898269, 18942, 19712, (181, 154, 207, 164, 223, 197, 25, 68 ));
   
   type IVideoEncodingPropertiesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateHevc
   (
      This       : access IVideoEncodingPropertiesStatics2_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IImageEncodingProperties : aliased constant Windows.IID := (2019710517, 62257, 16777, (177, 195, 180, 141, 90, 224, 52, 241 ));
   
   type IImageEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Width
   (
      This       : access IImageEncodingProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IImageEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Height
   (
      This       : access IImageEncodingProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IImageEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IImageEncodingPropertiesStatics : aliased constant Windows.IID := (628910300, 35737, 17310, (170, 89, 145, 58, 54, 22, 18, 151 ));
   
   type IImageEncodingPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateJpeg
   (
      This       : access IImageEncodingPropertiesStatics_Interface
      ; RetVal : access Windows.Media.MediaProperties.IImageEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function CreatePng
   (
      This       : access IImageEncodingPropertiesStatics_Interface
      ; RetVal : access Windows.Media.MediaProperties.IImageEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function CreateJpegXR
   (
      This       : access IImageEncodingPropertiesStatics_Interface
      ; RetVal : access Windows.Media.MediaProperties.IImageEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IImageEncodingPropertiesStatics2 : aliased constant Windows.IID := (4139932457, 14372, 18096, (149, 110, 80, 19, 41, 225, 190, 60 ));
   
   type IImageEncodingPropertiesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateUncompressed
   (
      This       : access IImageEncodingPropertiesStatics2_Interface
      ; format : Windows.Media.MediaProperties.MediaPixelFormat
      ; RetVal : access Windows.Media.MediaProperties.IImageEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function CreateBmp
   (
      This       : access IImageEncodingPropertiesStatics2_Interface
      ; RetVal : access Windows.Media.MediaProperties.IImageEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContainerEncodingProperties : aliased constant Windows.IID := (1504455255, 45866, 18334, (138, 97, 75, 127, 46, 158, 126, 160 ));
   
   type IContainerEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMediaEncodingProfileStatics : aliased constant Windows.IID := (427767084, 11998, 19013, (168, 150, 129, 122, 72, 84, 248, 254 ));
   
   type IMediaEncodingProfileStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateM4a
   (
      This       : access IMediaEncodingProfileStatics_Interface
      ; quality : Windows.Media.MediaProperties.AudioEncodingQuality
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function CreateMp3
   (
      This       : access IMediaEncodingProfileStatics_Interface
      ; quality : Windows.Media.MediaProperties.AudioEncodingQuality
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function CreateWma
   (
      This       : access IMediaEncodingProfileStatics_Interface
      ; quality : Windows.Media.MediaProperties.AudioEncodingQuality
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function CreateMp4
   (
      This       : access IMediaEncodingProfileStatics_Interface
      ; quality : Windows.Media.MediaProperties.VideoEncodingQuality
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function CreateWmv
   (
      This       : access IMediaEncodingProfileStatics_Interface
      ; quality : Windows.Media.MediaProperties.VideoEncodingQuality
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromFileAsync
   (
      This       : access IMediaEncodingProfileStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStreamAsync
   (
      This       : access IMediaEncodingProfileStatics_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaEncodingProfileStatics2 : aliased constant Windows.IID := (3465406287, 27380, 17032, (143, 226, 121, 173, 241, 247, 154, 67 ));
   
   type IMediaEncodingProfileStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWav
   (
      This       : access IMediaEncodingProfileStatics2_Interface
      ; quality : Windows.Media.MediaProperties.AudioEncodingQuality
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function CreateAvi
   (
      This       : access IMediaEncodingProfileStatics2_Interface
      ; quality : Windows.Media.MediaProperties.VideoEncodingQuality
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaEncodingProfileStatics3 : aliased constant Windows.IID := (2430256554, 53110, 17044, (169, 237, 26, 20, 32, 245, 31, 107 ));
   
   type IMediaEncodingProfileStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAlac
   (
      This       : access IMediaEncodingProfileStatics3_Interface
      ; quality : Windows.Media.MediaProperties.AudioEncodingQuality
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function CreateFlac
   (
      This       : access IMediaEncodingProfileStatics3_Interface
      ; quality : Windows.Media.MediaProperties.AudioEncodingQuality
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function CreateHevc
   (
      This       : access IMediaEncodingProfileStatics3_Interface
      ; quality : Windows.Media.MediaProperties.VideoEncodingQuality
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaEncodingProfile : aliased constant Windows.IID := (3889952168, 7609, 18307, (135, 107, 61, 254, 18, 172, 253, 179 ));
   
   type IMediaEncodingProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Audio
   (
      This       : access IMediaEncodingProfile_Interface
      ; value : Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Audio
   (
      This       : access IMediaEncodingProfile_Interface
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function put_Video
   (
      This       : access IMediaEncodingProfile_Interface
      ; value : Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Video
   (
      This       : access IMediaEncodingProfile_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function put_Container
   (
      This       : access IMediaEncodingProfile_Interface
      ; value : Windows.Media.MediaProperties.IContainerEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Container
   (
      This       : access IMediaEncodingProfile_Interface
      ; RetVal : access Windows.Media.MediaProperties.IContainerEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMediaEncodingProfile2 : aliased constant Windows.IID := (882589194, 16437, 18574, (152, 119, 133, 99, 40, 101, 237, 16 ));
   
   type IMediaEncodingProfile2_Interface is interface and Windows.IInspectable_Interface;
   
   function SetAudioTracks
   (
      This       : access IMediaEncodingProfile2_Interface
      ; value : Windows.Media.Core.IIterable_IAudioStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function GetAudioTracks
   (
      This       : access IMediaEncodingProfile2_Interface
      ; RetVal : access Windows.Media.Core.IVector_IAudioStreamDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetVideoTracks
   (
      This       : access IMediaEncodingProfile2_Interface
      ; value : Windows.Media.Core.IIterable_IVideoStreamDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function GetVideoTracks
   (
      This       : access IMediaEncodingProfile2_Interface
      ; RetVal : access Windows.Media.Core.IVector_IVideoStreamDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMediaEncodingProfile : aliased constant Windows.IID := (3573051158, 50895, 22472, (151, 67, 94, 194, 12, 49, 171, 121 ));
   
   type IAsyncOperation_IMediaEncodingProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMediaEncodingProfile_Interface
      ; handler : Windows.Media.MediaProperties.AsyncOperationCompletedHandler_IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMediaEncodingProfile_Interface
      ; RetVal : access Windows.Media.MediaProperties.AsyncOperationCompletedHandler_IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMediaEncodingProfile_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMediaEncodingProperties : aliased constant Windows.IID := (2080983788, 51443, 24393, (153, 199, 182, 109, 132, 20, 32, 14 ));
   
   type IIterator_IMediaEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaEncodingProperties_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaEncodingProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaEncodingProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaEncodingProperties_Interface
      ; items : Windows.Media.MediaProperties.IMediaEncodingProperties_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMediaEncodingProperties : aliased constant Windows.IID := (3623646677, 13458, 23483, (155, 52, 218, 195, 226, 78, 121, 208 ));
   
   type IIterable_IMediaEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaEncodingProperties_Interface
      ; RetVal : access Windows.Media.MediaProperties.IIterator_IMediaEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMediaEncodingProperties : aliased constant Windows.IID := (258751371, 22552, 23743, (191, 38, 102, 22, 191, 195, 8, 196 ));
   
   type IVectorView_IMediaEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaEncodingProperties_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaEncodingProperties_Interface
      ; value : Windows.Media.MediaProperties.IMediaEncodingProperties
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaEncodingProperties_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.MediaProperties.IMediaEncodingProperties_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVideoEncodingProperties : aliased constant Windows.IID := (155281135, 44639, 21269, (163, 191, 254, 84, 232, 195, 95, 205 ));
   
   type IIterator_IVideoEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVideoEncodingProperties_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVideoEncodingProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVideoEncodingProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVideoEncodingProperties_Interface
      ; items : Windows.Media.MediaProperties.IVideoEncodingProperties_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVideoEncodingProperties : aliased constant Windows.IID := (1942434172, 34434, 24449, (132, 162, 48, 196, 37, 250, 45, 36 ));
   
   type IIterable_IVideoEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVideoEncodingProperties_Interface
      ; RetVal : access Windows.Media.MediaProperties.IIterator_IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVideoEncodingProperties : aliased constant Windows.IID := (80198330, 1239, 20955, (164, 227, 81, 71, 150, 62, 197, 255 ));
   
   type IVectorView_IVideoEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVideoEncodingProperties_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVideoEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVideoEncodingProperties_Interface
      ; value : Windows.Media.MediaProperties.IVideoEncodingProperties
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVideoEncodingProperties_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.MediaProperties.IVideoEncodingProperties_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAudioEncodingProperties : aliased constant Windows.IID := (105605871, 15312, 21603, (132, 80, 114, 198, 22, 154, 245, 212 ));
   
   type IIterator_IAudioEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAudioEncodingProperties_Interface
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAudioEncodingProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAudioEncodingProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAudioEncodingProperties_Interface
      ; items : Windows.Media.MediaProperties.IAudioEncodingProperties_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAudioEncodingProperties : aliased constant Windows.IID := (9671784, 9688, 21311, (133, 78, 79, 32, 243, 108, 81, 220 ));
   
   type IIterable_IAudioEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAudioEncodingProperties_Interface
      ; RetVal : access Windows.Media.MediaProperties.IIterator_IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAudioEncodingProperties : aliased constant Windows.IID := (1689014380, 52432, 22219, (176, 136, 177, 163, 110, 135, 85, 223 ));
   
   type IVectorView_IAudioEncodingProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAudioEncodingProperties_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAudioEncodingProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAudioEncodingProperties_Interface
      ; value : Windows.Media.MediaProperties.IAudioEncodingProperties
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAudioEncodingProperties_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.MediaProperties.IAudioEncodingProperties_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMediaEncodingProfile : aliased constant Windows.IID := (925462465, 34522, 22688, (144, 192, 200, 7, 189, 148, 57, 94 ));
   
   type AsyncOperationCompletedHandler_IMediaEncodingProfile_Interface(Callback : access procedure (asyncInfo : Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMediaEncodingProfile'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaEncodingProfile_Interface
      ; asyncInfo : Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MediaRatio is Windows.Media.MediaProperties.IMediaRatio;
   subtype MediaPropertySet is Windows.Media.MediaProperties.IMap_Guid_Object;
   function CreateMediaPropertySet return Windows.Media.MediaProperties.IMap_Guid_Object;
   
   subtype AudioEncodingProperties is Windows.Media.MediaProperties.IAudioEncodingProperties;
   function CreateAudioEncodingProperties return Windows.Media.MediaProperties.IAudioEncodingProperties;
   
   subtype VideoEncodingProperties is Windows.Media.MediaProperties.IVideoEncodingProperties;
   function CreateVideoEncodingProperties return Windows.Media.MediaProperties.IVideoEncodingProperties;
   
   subtype ImageEncodingProperties is Windows.Media.MediaProperties.IImageEncodingProperties;
   function CreateImageEncodingProperties return Windows.Media.MediaProperties.IImageEncodingProperties;
   
   subtype ContainerEncodingProperties is Windows.Media.MediaProperties.IContainerEncodingProperties;
   function CreateContainerEncodingProperties return Windows.Media.MediaProperties.IContainerEncodingProperties;
   
   subtype MediaEncodingProfile is Windows.Media.MediaProperties.IMediaEncodingProfile;
   function CreateMediaEncodingProfile return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateAlac
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitsPerSample : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties;
   
   function CreateFlac
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitsPerSample : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties;
   
   function CreateAac
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties;
   
   function CreateAacAdts
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties;
   
   function CreateMp3
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties;
   
   function CreatePcm
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitsPerSample : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties;
   
   function CreateWma
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties;
   
   function get_Aac
   return Windows.String;
   
   function get_AacAdts
   return Windows.String;
   
   function get_Ac3
   return Windows.String;
   
   function get_AmrNb
   return Windows.String;
   
   function get_AmrWb
   return Windows.String;
   
   function get_Argb32
   return Windows.String;
   
   function get_Asf
   return Windows.String;
   
   function get_Avi
   return Windows.String;
   
   function get_Bgra8
   return Windows.String;
   
   function get_Bmp
   return Windows.String;
   
   function get_Eac3
   return Windows.String;
   
   function get_Float
   return Windows.String;
   
   function get_Gif
   return Windows.String;
   
   function get_H263
   return Windows.String;
   
   function get_H264
   return Windows.String;
   
   function get_H264Es
   return Windows.String;
   
   function get_Hevc
   return Windows.String;
   
   function get_HevcEs
   return Windows.String;
   
   function get_Iyuv
   return Windows.String;
   
   function get_Jpeg
   return Windows.String;
   
   function get_JpegXr
   return Windows.String;
   
   function get_Mjpg
   return Windows.String;
   
   function get_Mpeg
   return Windows.String;
   
   function get_Mpeg1
   return Windows.String;
   
   function get_Mpeg2
   return Windows.String;
   
   function get_Mp3
   return Windows.String;
   
   function get_Mpeg4
   return Windows.String;
   
   function get_Nv12
   return Windows.String;
   
   function get_Pcm
   return Windows.String;
   
   function get_Png
   return Windows.String;
   
   function get_Rgb24
   return Windows.String;
   
   function get_Rgb32
   return Windows.String;
   
   function get_Tiff
   return Windows.String;
   
   function get_Wave
   return Windows.String;
   
   function get_Wma8
   return Windows.String;
   
   function get_Wma9
   return Windows.String;
   
   function get_Wmv3
   return Windows.String;
   
   function get_Wvc1
   return Windows.String;
   
   function get_Yuy2
   return Windows.String;
   
   function get_Yv12
   return Windows.String;
   
   function get_Alac
   return Windows.String;
   
   function get_Flac
   return Windows.String;
   
   function get_Vp9
   return Windows.String;
   
   function get_L8
   return Windows.String;
   
   function get_L16
   return Windows.String;
   
   function get_D16
   return Windows.String;
   
   function get_ConstrainedBaseline
   return Windows.Int32;
   
   function get_Baseline
   return Windows.Int32;
   
   function get_Extended
   return Windows.Int32;
   
   function get_Main
   return Windows.Int32;
   
   function get_High
   return Windows.Int32;
   
   function get_High10
   return Windows.Int32;
   
   function get_High422
   return Windows.Int32;
   
   function get_High444
   return Windows.Int32;
   
   function get_StereoHigh
   return Windows.Int32;
   
   function get_MultiviewHigh
   return Windows.Int32;
   
   function get_Simple
   return Windows.Int32;
   
   function get_Main_Mpeg2ProfileIds
   return Windows.Int32;
   
   function get_SignalNoiseRatioScalable
   return Windows.Int32;
   
   function get_SpatiallyScalable
   return Windows.Int32;
   
   function get_High_Mpeg2ProfileIds
   return Windows.Int32;
   
   function CreateH264
   return Windows.Media.MediaProperties.IVideoEncodingProperties;
   
   function CreateMpeg2
   return Windows.Media.MediaProperties.IVideoEncodingProperties;
   
   function CreateUncompressed
   (
      subtype_x : Windows.String
      ; width : Windows.UInt32
      ; height : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IVideoEncodingProperties;
   
   function CreateHevc
   return Windows.Media.MediaProperties.IVideoEncodingProperties;
   
   function CreateJpeg
   return Windows.Media.MediaProperties.IImageEncodingProperties;
   
   function CreatePng
   return Windows.Media.MediaProperties.IImageEncodingProperties;
   
   function CreateJpegXR
   return Windows.Media.MediaProperties.IImageEncodingProperties;
   
   function CreateUncompressed
   (
      format : Windows.Media.MediaProperties.MediaPixelFormat
   )
   return Windows.Media.MediaProperties.IImageEncodingProperties;
   
   function CreateBmp
   return Windows.Media.MediaProperties.IImageEncodingProperties;
   
   function CreateM4a
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
   function CreateMp3
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
   function CreateWma
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
   function CreateMp4
   (
      quality : Windows.Media.MediaProperties.VideoEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
   function CreateWmv
   (
      quality : Windows.Media.MediaProperties.VideoEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
   function CreateFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile;
   
   function CreateFromStreamAsync
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile;
   
   function CreateWav
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
   function CreateAvi
   (
      quality : Windows.Media.MediaProperties.VideoEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
   function CreateAlac
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
   function CreateFlac
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
   function CreateHevc
   (
      quality : Windows.Media.MediaProperties.VideoEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile;
   
end;
