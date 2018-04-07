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
limited with Windows.Storage.Streams;
with Windows; use Windows;
limited with Windows.Graphics.DirectX.Direct3D11;
--------------------------------------------------------------------------------
package Windows.Graphics.Imaging is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type BitmapInterpolationMode is (
      NearestNeighbor,
      Linear,
      Cubic,
      Fant
   );
   for BitmapInterpolationMode use (
      NearestNeighbor => 0,
      Linear => 1,
      Cubic => 2,
      Fant => 3
   );
   for BitmapInterpolationMode'Size use 32;
   
   type BitmapInterpolationMode_Ptr is access BitmapInterpolationMode;
   
   type BitmapFlip is (
      None,
      Horizontal,
      Vertical
   );
   for BitmapFlip use (
      None => 0,
      Horizontal => 1,
      Vertical => 2
   );
   for BitmapFlip'Size use 32;
   
   type BitmapFlip_Ptr is access BitmapFlip;
   
   type BitmapRotation is (
      None,
      Clockwise90Degrees,
      Clockwise180Degrees,
      Clockwise270Degrees
   );
   for BitmapRotation use (
      None => 0,
      Clockwise90Degrees => 1,
      Clockwise180Degrees => 2,
      Clockwise270Degrees => 3
   );
   for BitmapRotation'Size use 32;
   
   type BitmapRotation_Ptr is access BitmapRotation;
   
   type ColorManagementMode is (
      DoNotColorManage,
      ColorManageToSRgb
   );
   for ColorManagementMode use (
      DoNotColorManage => 0,
      ColorManageToSRgb => 1
   );
   for ColorManagementMode'Size use 32;
   
   type ColorManagementMode_Ptr is access ColorManagementMode;
   
   type ExifOrientationMode is (
      IgnoreExifOrientation,
      RespectExifOrientation
   );
   for ExifOrientationMode use (
      IgnoreExifOrientation => 0,
      RespectExifOrientation => 1
   );
   for ExifOrientationMode'Size use 32;
   
   type ExifOrientationMode_Ptr is access ExifOrientationMode;
   
   type PngFilterMode is (
      Automatic,
      None,
      Sub,
      Up,
      Average,
      Paeth,
      Adaptive
   );
   for PngFilterMode use (
      Automatic => 0,
      None => 1,
      Sub => 2,
      Up => 3,
      Average => 4,
      Paeth => 5,
      Adaptive => 6
   );
   for PngFilterMode'Size use 32;
   
   type PngFilterMode_Ptr is access PngFilterMode;
   
   type TiffCompressionMode is (
      Automatic,
      None,
      Ccitt3,
      Ccitt4,
      Lzw,
      Rle,
      Zip,
      LzwhDifferencing
   );
   for TiffCompressionMode use (
      Automatic => 0,
      None => 1,
      Ccitt3 => 2,
      Ccitt4 => 3,
      Lzw => 4,
      Rle => 5,
      Zip => 6,
      LzwhDifferencing => 7
   );
   for TiffCompressionMode'Size use 32;
   
   type TiffCompressionMode_Ptr is access TiffCompressionMode;
   
   type JpegSubsamplingMode is (
      Default,
      Y4Cb2Cr0,
      Y4Cb2Cr2,
      Y4Cb4Cr4
   );
   for JpegSubsamplingMode use (
      Default => 0,
      Y4Cb2Cr0 => 1,
      Y4Cb2Cr2 => 2,
      Y4Cb4Cr4 => 3
   );
   for JpegSubsamplingMode'Size use 32;
   
   type JpegSubsamplingMode_Ptr is access JpegSubsamplingMode;
   
   type BitmapPixelFormat is (
      Unknown,
      Rgba16,
      Rgba8,
      Gray16,
      Gray8,
      Bgra8,
      Nv12,
      Yuy2
   );
   for BitmapPixelFormat use (
      Unknown => 0,
      Rgba16 => 12,
      Rgba8 => 30,
      Gray16 => 57,
      Gray8 => 62,
      Bgra8 => 87,
      Nv12 => 103,
      Yuy2 => 107
   );
   for BitmapPixelFormat'Size use 32;
   
   type BitmapPixelFormat_Ptr is access BitmapPixelFormat;
   
   type BitmapAlphaMode is (
      Premultiplied,
      Straight,
      Ignore
   );
   for BitmapAlphaMode use (
      Premultiplied => 0,
      Straight => 1,
      Ignore => 2
   );
   for BitmapAlphaMode'Size use 32;
   
   type BitmapAlphaMode_Ptr is access BitmapAlphaMode;
   
   type BitmapBufferAccessMode is (
      Read,
      ReadWrite,
      Write
   );
   for BitmapBufferAccessMode use (
      Read => 0,
      ReadWrite => 1,
      Write => 2
   );
   for BitmapBufferAccessMode'Size use 32;
   
   type BitmapBufferAccessMode_Ptr is access BitmapBufferAccessMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type BitmapBounds is record
      X : Windows.UInt32;
      Y : Windows.UInt32;
      Width : Windows.UInt32;
      Height : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , BitmapBounds);
   
   type BitmapBounds_Ptr is access BitmapBounds;
   
   type BitmapSize is record
      Width : Windows.UInt32;
      Height : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , BitmapSize);
   
   type BitmapSize_Ptr is access BitmapSize;
   
   type BitmapPlaneDescription is record
      StartIndex : Windows.Int32;
      Width : Windows.Int32;
      Height : Windows.Int32;
      Stride : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , BitmapPlaneDescription);
   
   type BitmapPlaneDescription_Ptr is access BitmapPlaneDescription;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue_Interface;
   type AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue is access all AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue_Interface'Class;
   type AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue_Ptr is access all AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue;
   type AsyncOperationCompletedHandler_IPixelDataProvider_Interface;
   type AsyncOperationCompletedHandler_IPixelDataProvider is access all AsyncOperationCompletedHandler_IPixelDataProvider_Interface'Class;
   type AsyncOperationCompletedHandler_IPixelDataProvider_Ptr is access all AsyncOperationCompletedHandler_IPixelDataProvider;
   type AsyncOperationCompletedHandler_ISoftwareBitmap_Interface;
   type AsyncOperationCompletedHandler_ISoftwareBitmap is access all AsyncOperationCompletedHandler_ISoftwareBitmap_Interface'Class;
   type AsyncOperationCompletedHandler_ISoftwareBitmap_Ptr is access all AsyncOperationCompletedHandler_ISoftwareBitmap;
   type AsyncOperationCompletedHandler_IBitmapDecoder_Interface;
   type AsyncOperationCompletedHandler_IBitmapDecoder is access all AsyncOperationCompletedHandler_IBitmapDecoder_Interface'Class;
   type AsyncOperationCompletedHandler_IBitmapDecoder_Ptr is access all AsyncOperationCompletedHandler_IBitmapDecoder;
   type AsyncOperationCompletedHandler_IBitmapFrame_Interface;
   type AsyncOperationCompletedHandler_IBitmapFrame is access all AsyncOperationCompletedHandler_IBitmapFrame_Interface'Class;
   type AsyncOperationCompletedHandler_IBitmapFrame_Ptr is access all AsyncOperationCompletedHandler_IBitmapFrame;
   type AsyncOperationCompletedHandler_IBitmapEncoder_Interface;
   type AsyncOperationCompletedHandler_IBitmapEncoder is access all AsyncOperationCompletedHandler_IBitmapEncoder_Interface'Class;
   type AsyncOperationCompletedHandler_IBitmapEncoder_Ptr is access all AsyncOperationCompletedHandler_IBitmapEncoder;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IBitmapTransform_Interface;
   type IBitmapTransform is access all IBitmapTransform_Interface'Class;
   type IBitmapTransform_Ptr is access all IBitmapTransform;
   type IBitmapTypedValue_Interface;
   type IBitmapTypedValue is access all IBitmapTypedValue_Interface'Class;
   type IBitmapTypedValue_Ptr is access all IBitmapTypedValue;
   type IBitmapTypedValueFactory_Interface;
   type IBitmapTypedValueFactory is access all IBitmapTypedValueFactory_Interface'Class;
   type IBitmapTypedValueFactory_Ptr is access all IBitmapTypedValueFactory;
   type IMap_String_BitmapTypedValue_Interface;
   type IMap_String_BitmapTypedValue is access all IMap_String_BitmapTypedValue_Interface'Class;
   type IMap_String_BitmapTypedValue_Ptr is access all IMap_String_BitmapTypedValue;
   type IIterable_BitmapTypedValue_Interface;
   type IIterable_BitmapTypedValue is access all IIterable_BitmapTypedValue_Interface'Class;
   type IIterable_BitmapTypedValue_Ptr is access all IIterable_BitmapTypedValue;
   type IBitmapPropertiesView_Interface;
   type IBitmapPropertiesView is access all IBitmapPropertiesView_Interface'Class;
   type IBitmapPropertiesView_Ptr is access all IBitmapPropertiesView;
   type IBitmapProperties_Interface;
   type IBitmapProperties is access all IBitmapProperties_Interface'Class;
   type IBitmapProperties_Ptr is access all IBitmapProperties;
   type IPixelDataProvider_Interface;
   type IPixelDataProvider is access all IPixelDataProvider_Interface'Class;
   type IPixelDataProvider_Ptr is access all IPixelDataProvider;
   type IBitmapFrame_Interface;
   type IBitmapFrame is access all IBitmapFrame_Interface'Class;
   type IBitmapFrame_Ptr is access all IBitmapFrame;
   type IBitmapFrameWithSoftwareBitmap_Interface;
   type IBitmapFrameWithSoftwareBitmap is access all IBitmapFrameWithSoftwareBitmap_Interface'Class;
   type IBitmapFrameWithSoftwareBitmap_Ptr is access all IBitmapFrameWithSoftwareBitmap;
   type IBitmapCodecInformation_Interface;
   type IBitmapCodecInformation is access all IBitmapCodecInformation_Interface'Class;
   type IBitmapCodecInformation_Ptr is access all IBitmapCodecInformation;
   type IBitmapDecoderStatics_Interface;
   type IBitmapDecoderStatics is access all IBitmapDecoderStatics_Interface'Class;
   type IBitmapDecoderStatics_Ptr is access all IBitmapDecoderStatics;
   type IBitmapDecoder_Interface;
   type IBitmapDecoder is access all IBitmapDecoder_Interface'Class;
   type IBitmapDecoder_Ptr is access all IBitmapDecoder;
   type IBitmapEncoderStatics_Interface;
   type IBitmapEncoderStatics is access all IBitmapEncoderStatics_Interface'Class;
   type IBitmapEncoderStatics_Ptr is access all IBitmapEncoderStatics;
   type IBitmapEncoder_Interface;
   type IBitmapEncoder is access all IBitmapEncoder_Interface'Class;
   type IBitmapEncoder_Ptr is access all IBitmapEncoder;
   type IBitmapEncoderWithSoftwareBitmap_Interface;
   type IBitmapEncoderWithSoftwareBitmap is access all IBitmapEncoderWithSoftwareBitmap_Interface'Class;
   type IBitmapEncoderWithSoftwareBitmap_Ptr is access all IBitmapEncoderWithSoftwareBitmap;
   type ISoftwareBitmap_Interface;
   type ISoftwareBitmap is access all ISoftwareBitmap_Interface'Class;
   type ISoftwareBitmap_Ptr is access all ISoftwareBitmap;
   type ISoftwareBitmapFactory_Interface;
   type ISoftwareBitmapFactory is access all ISoftwareBitmapFactory_Interface'Class;
   type ISoftwareBitmapFactory_Ptr is access all ISoftwareBitmapFactory;
   type ISoftwareBitmapStatics_Interface;
   type ISoftwareBitmapStatics is access all ISoftwareBitmapStatics_Interface'Class;
   type ISoftwareBitmapStatics_Ptr is access all ISoftwareBitmapStatics;
   type IBitmapBuffer_Interface;
   type IBitmapBuffer is access all IBitmapBuffer_Interface'Class;
   type IBitmapBuffer_Ptr is access all IBitmapBuffer;
   type IRandomAccessStreamWithContentType_Imported_Interface;
   type IRandomAccessStreamWithContentType_Imported is access all IRandomAccessStreamWithContentType_Imported_Interface'Class;
   type IRandomAccessStreamWithContentType_Imported_Ptr is access all IRandomAccessStreamWithContentType_Imported;
   type IContentTypeProvider_Imported_Interface;
   type IContentTypeProvider_Imported is access all IContentTypeProvider_Imported_Interface'Class;
   type IContentTypeProvider_Imported_Ptr is access all IContentTypeProvider_Imported;
   type IRandomAccessStream_Imported_Interface;
   type IRandomAccessStream_Imported is access all IRandomAccessStream_Imported_Interface'Class;
   type IRandomAccessStream_Imported_Ptr is access all IRandomAccessStream_Imported;
   type IOutputStream_Imported_Interface;
   type IOutputStream_Imported is access all IOutputStream_Imported_Interface'Class;
   type IOutputStream_Imported_Ptr is access all IOutputStream_Imported;
   type IInputStream_Imported_Interface;
   type IInputStream_Imported is access all IInputStream_Imported_Interface'Class;
   type IInputStream_Imported_Ptr is access all IInputStream_Imported;
   type IAsyncOperation_IMap_String_BitmapTypedValue_Interface;
   type IAsyncOperation_IMap_String_BitmapTypedValue is access all IAsyncOperation_IMap_String_BitmapTypedValue_Interface'Class;
   type IAsyncOperation_IMap_String_BitmapTypedValue_Ptr is access all IAsyncOperation_IMap_String_BitmapTypedValue;
   type IAsyncOperation_IPixelDataProvider_Interface;
   type IAsyncOperation_IPixelDataProvider is access all IAsyncOperation_IPixelDataProvider_Interface'Class;
   type IAsyncOperation_IPixelDataProvider_Ptr is access all IAsyncOperation_IPixelDataProvider;
   type IAsyncOperation_ISoftwareBitmap_Interface;
   type IAsyncOperation_ISoftwareBitmap is access all IAsyncOperation_ISoftwareBitmap_Interface'Class;
   type IAsyncOperation_ISoftwareBitmap_Ptr is access all IAsyncOperation_ISoftwareBitmap;
   type IIterator_IBitmapCodecInformation_Interface;
   type IIterator_IBitmapCodecInformation is access all IIterator_IBitmapCodecInformation_Interface'Class;
   type IIterator_IBitmapCodecInformation_Ptr is access all IIterator_IBitmapCodecInformation;
   type IIterable_IBitmapCodecInformation_Interface;
   type IIterable_IBitmapCodecInformation is access all IIterable_IBitmapCodecInformation_Interface'Class;
   type IIterable_IBitmapCodecInformation_Ptr is access all IIterable_IBitmapCodecInformation;
   type IVectorView_IBitmapCodecInformation_Interface;
   type IVectorView_IBitmapCodecInformation is access all IVectorView_IBitmapCodecInformation_Interface'Class;
   type IVectorView_IBitmapCodecInformation_Ptr is access all IVectorView_IBitmapCodecInformation;
   type IAsyncOperation_IBitmapDecoder_Interface;
   type IAsyncOperation_IBitmapDecoder is access all IAsyncOperation_IBitmapDecoder_Interface'Class;
   type IAsyncOperation_IBitmapDecoder_Ptr is access all IAsyncOperation_IBitmapDecoder;
   type IAsyncOperation_IBitmapFrame_Interface;
   type IAsyncOperation_IBitmapFrame is access all IAsyncOperation_IBitmapFrame_Interface'Class;
   type IAsyncOperation_IBitmapFrame_Ptr is access all IAsyncOperation_IBitmapFrame;
   type IAsyncOperation_IBitmapEncoder_Interface;
   type IAsyncOperation_IBitmapEncoder is access all IAsyncOperation_IBitmapEncoder_Interface'Class;
   type IAsyncOperation_IBitmapEncoder_Ptr is access all IAsyncOperation_IBitmapEncoder;
   type IIterator_BitmapPixelFormat_Interface;
   type IIterator_BitmapPixelFormat is access all IIterator_BitmapPixelFormat_Interface'Class;
   type IIterator_BitmapPixelFormat_Ptr is access all IIterator_BitmapPixelFormat;
   type IIterable_BitmapPixelFormat_Interface;
   type IIterable_BitmapPixelFormat is access all IIterable_BitmapPixelFormat_Interface'Class;
   type IIterable_BitmapPixelFormat_Ptr is access all IIterable_BitmapPixelFormat;
   type IVectorView_BitmapPixelFormat_Interface;
   type IVectorView_BitmapPixelFormat is access all IVectorView_BitmapPixelFormat_Interface'Class;
   type IVectorView_BitmapPixelFormat_Ptr is access all IVectorView_BitmapPixelFormat;
   type IIterator_ISoftwareBitmap_Interface;
   type IIterator_ISoftwareBitmap is access all IIterator_ISoftwareBitmap_Interface'Class;
   type IIterator_ISoftwareBitmap_Ptr is access all IIterator_ISoftwareBitmap;
   type IIterable_ISoftwareBitmap_Interface;
   type IIterable_ISoftwareBitmap is access all IIterable_ISoftwareBitmap_Interface'Class;
   type IIterable_ISoftwareBitmap_Ptr is access all IIterable_ISoftwareBitmap;
   
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
   type IBitmapTransform_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ScaledWidth
   (
      This       : access IBitmapTransform_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaledWidth
   (
      This       : access IBitmapTransform_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaledHeight
   (
      This       : access IBitmapTransform_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaledHeight
   (
      This       : access IBitmapTransform_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_InterpolationMode
   (
      This       : access IBitmapTransform_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapInterpolationMode
   )
   return Windows.HRESULT is abstract;
   
   function put_InterpolationMode
   (
      This       : access IBitmapTransform_Interface
      ; value : Windows.Graphics.Imaging.BitmapInterpolationMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Flip
   (
      This       : access IBitmapTransform_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapFlip
   )
   return Windows.HRESULT is abstract;
   
   function put_Flip
   (
      This       : access IBitmapTransform_Interface
      ; value : Windows.Graphics.Imaging.BitmapFlip
   )
   return Windows.HRESULT is abstract;
   
   function get_Rotation
   (
      This       : access IBitmapTransform_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapRotation
   )
   return Windows.HRESULT is abstract;
   
   function put_Rotation
   (
      This       : access IBitmapTransform_Interface
      ; value : Windows.Graphics.Imaging.BitmapRotation
   )
   return Windows.HRESULT is abstract;
   
   function get_Bounds
   (
      This       : access IBitmapTransform_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapBounds
   )
   return Windows.HRESULT is abstract;
   
   function put_Bounds
   (
      This       : access IBitmapTransform_Interface
      ; value : Windows.Graphics.Imaging.BitmapBounds
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapTransform : aliased constant Windows.IID := (2926924612, 57960, 19765, (173, 207, 233, 149, 211, 26, 141, 52 ));
   
   ------------------------------------------------------------------------
   type IBitmapTypedValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IBitmapTypedValue_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IBitmapTypedValue_Interface
      ; RetVal : access Windows.Foundation.PropertyType
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapTypedValue : aliased constant Windows.IID := (3447735465, 9283, 16384, (176, 205, 121, 49, 108, 86, 245, 137 ));
   
   ------------------------------------------------------------------------
   type IBitmapTypedValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IBitmapTypedValueFactory_Interface
      ; value : Windows.Object
      ; type_x : Windows.Foundation.PropertyType
      ; RetVal : access Windows.Graphics.Imaging.IBitmapTypedValue
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapTypedValueFactory : aliased constant Windows.IID := (2463872409, 52755, 18107, (149, 69, 203, 58, 63, 99, 235, 139 ));
   
   ------------------------------------------------------------------------
   type IMap_String_BitmapTypedValue_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_BitmapTypedValue_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_BitmapTypedValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_BitmapTypedValue_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_BitmapTypedValue_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapTypedValue
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_BitmapTypedValue_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_BitmapTypedValue_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_BitmapTypedValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMap_String_BitmapTypedValue : aliased constant Windows.IID := (745598861, 23884, 20869, (141, 183, 254, 216, 119, 40, 22, 93 ));
   
   ------------------------------------------------------------------------
   type IIterable_BitmapTypedValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_BitmapTypedValue_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_BitmapTypedValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IBitmapPropertiesView_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPropertiesAsync
   (
      This       : access IBitmapPropertiesView_Interface
      ; propertiesToRetrieve : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_IMap_String_BitmapTypedValue -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapPropertiesView : aliased constant Windows.IID := (2114971770, 14960, 18680, (156, 85, 25, 108, 245, 165, 69, 245 ));
   
   ------------------------------------------------------------------------
   type IBitmapProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function SetPropertiesAsync
   (
      This       : access IBitmapProperties_Interface
      ; propertiesToSet : Windows.Address
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapProperties : aliased constant Windows.IID := (3936309019, 46341, 17488, (164, 209, 232, 202, 148, 82, 157, 141 ));
   
   ------------------------------------------------------------------------
   type IPixelDataProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function DetachPixelData
   (
      This       : access IPixelDataProvider_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPixelDataProvider : aliased constant Windows.IID := (3716357925, 6236, 17813, (159, 185, 204, 190, 110, 193, 138, 111 ));
   
   ------------------------------------------------------------------------
   type IBitmapFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function GetThumbnailAsync
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapProperties
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapPropertiesView
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapPixelFormat
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapAlphaMode
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.HRESULT is abstract;
   
   function get_DpiX
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DpiY
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelWidth
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelHeight
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_OrientedPixelWidth
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_OrientedPixelHeight
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetPixelDataAsync
   (
      This       : access IBitmapFrame_Interface
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_IPixelDataProvider -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPixelDataTransformedAsync
   (
      This       : access IBitmapFrame_Interface
      ; pixelFormat : Windows.Graphics.Imaging.BitmapPixelFormat
      ; alphaMode : Windows.Graphics.Imaging.BitmapAlphaMode
      ; transform : Windows.Graphics.Imaging.IBitmapTransform
      ; exifOrientationMode : Windows.Graphics.Imaging.ExifOrientationMode
      ; colorManagementMode : Windows.Graphics.Imaging.ColorManagementMode
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_IPixelDataProvider -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapFrame : aliased constant Windows.IID := (1923389980, 32897, 17293, (145, 188, 148, 236, 252, 129, 133, 198 ));
   
   ------------------------------------------------------------------------
   type IBitmapFrameWithSoftwareBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function GetSoftwareBitmapAsync
   (
      This       : access IBitmapFrameWithSoftwareBitmap_Interface
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSoftwareBitmapConvertedAsync
   (
      This       : access IBitmapFrameWithSoftwareBitmap_Interface
      ; pixelFormat : Windows.Graphics.Imaging.BitmapPixelFormat
      ; alphaMode : Windows.Graphics.Imaging.BitmapAlphaMode
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSoftwareBitmapTransformedAsync
   (
      This       : access IBitmapFrameWithSoftwareBitmap_Interface
      ; pixelFormat : Windows.Graphics.Imaging.BitmapPixelFormat
      ; alphaMode : Windows.Graphics.Imaging.BitmapAlphaMode
      ; transform : Windows.Graphics.Imaging.IBitmapTransform
      ; exifOrientationMode : Windows.Graphics.Imaging.ExifOrientationMode
      ; colorManagementMode : Windows.Graphics.Imaging.ColorManagementMode
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapFrameWithSoftwareBitmap : aliased constant Windows.IID := (4264066202, 16908, 18787, (135, 173, 105, 20, 54, 224, 131, 131 ));
   
   ------------------------------------------------------------------------
   type IBitmapCodecInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CodecId
   (
      This       : access IBitmapCodecInformation_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_FileExtensions
   (
      This       : access IBitmapCodecInformation_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FriendlyName
   (
      This       : access IBitmapCodecInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MimeTypes
   (
      This       : access IBitmapCodecInformation_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapCodecInformation : aliased constant Windows.IID := (1074572018, 50352, 17298, (163, 176, 111, 111, 155, 169, 92, 180 ));
   
   ------------------------------------------------------------------------
   type IBitmapDecoderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BmpDecoderId
   (
      This       : access IBitmapDecoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_JpegDecoderId
   (
      This       : access IBitmapDecoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_PngDecoderId
   (
      This       : access IBitmapDecoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TiffDecoderId
   (
      This       : access IBitmapDecoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GifDecoderId
   (
      This       : access IBitmapDecoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_JpegXRDecoderId
   (
      This       : access IBitmapDecoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_IcoDecoderId
   (
      This       : access IBitmapDecoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function GetDecoderInformationEnumerator
   (
      This       : access IBitmapDecoderStatics_Interface
      ; RetVal : access Windows.Graphics.Imaging.IVectorView_IBitmapCodecInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateAsync
   (
      This       : access IBitmapDecoderStatics_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithIdAsync
   (
      This       : access IBitmapDecoderStatics_Interface
      ; decoderId : Windows.Guid
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapDecoderStatics : aliased constant Windows.IID := (1133300518, 48367, 20117, (186, 214, 35, 168, 34, 229, 141, 1 ));
   
   ------------------------------------------------------------------------
   type IBitmapDecoder_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BitmapContainerProperties
   (
      This       : access IBitmapDecoder_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapPropertiesView
   )
   return Windows.HRESULT is abstract;
   
   function get_DecoderInformation
   (
      This       : access IBitmapDecoder_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapCodecInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameCount
   (
      This       : access IBitmapDecoder_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetPreviewAsync
   (
      This       : access IBitmapDecoder_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFrameAsync
   (
      This       : access IBitmapDecoder_Interface
      ; frameIndex : Windows.UInt32
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_IBitmapFrame -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapDecoder : aliased constant Windows.IID := (2901353146, 7540, 19601, (157, 252, 150, 32, 116, 82, 51, 230 ));
   
   ------------------------------------------------------------------------
   type IBitmapEncoderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BmpEncoderId
   (
      This       : access IBitmapEncoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_JpegEncoderId
   (
      This       : access IBitmapEncoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_PngEncoderId
   (
      This       : access IBitmapEncoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TiffEncoderId
   (
      This       : access IBitmapEncoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GifEncoderId
   (
      This       : access IBitmapEncoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_JpegXREncoderId
   (
      This       : access IBitmapEncoderStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function GetEncoderInformationEnumerator
   (
      This       : access IBitmapEncoderStatics_Interface
      ; RetVal : access Windows.Graphics.Imaging.IVectorView_IBitmapCodecInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateAsync
   (
      This       : access IBitmapEncoderStatics_Interface
      ; encoderId : Windows.Guid
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithEncodingOptionsAsync
   (
      This       : access IBitmapEncoderStatics_Interface
      ; encoderId : Windows.Guid
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; encodingOptions : Windows.Address
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateForTranscodingAsync
   (
      This       : access IBitmapEncoderStatics_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; bitmapDecoder : Windows.Graphics.Imaging.IBitmapDecoder
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateForInPlacePropertyEncodingAsync
   (
      This       : access IBitmapEncoderStatics_Interface
      ; bitmapDecoder : Windows.Graphics.Imaging.IBitmapDecoder
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapEncoderStatics : aliased constant Windows.IID := (2806208167, 42212, 20153, (142, 64, 86, 77, 231, 225, 204, 178 ));
   
   ------------------------------------------------------------------------
   type IBitmapEncoder_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EncoderInformation
   (
      This       : access IBitmapEncoder_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapCodecInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapProperties
   (
      This       : access IBitmapEncoder_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapContainerProperties
   (
      This       : access IBitmapEncoder_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_IsThumbnailGenerated
   (
      This       : access IBitmapEncoder_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsThumbnailGenerated
   (
      This       : access IBitmapEncoder_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_GeneratedThumbnailWidth
   (
      This       : access IBitmapEncoder_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_GeneratedThumbnailWidth
   (
      This       : access IBitmapEncoder_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_GeneratedThumbnailHeight
   (
      This       : access IBitmapEncoder_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_GeneratedThumbnailHeight
   (
      This       : access IBitmapEncoder_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapTransform
   (
      This       : access IBitmapEncoder_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapTransform
   )
   return Windows.HRESULT is abstract;
   
   function SetPixelData
   (
      This       : access IBitmapEncoder_Interface
      ; pixelFormat : Windows.Graphics.Imaging.BitmapPixelFormat
      ; alphaMode : Windows.Graphics.Imaging.BitmapAlphaMode
      ; width : Windows.UInt32
      ; height : Windows.UInt32
      ; dpiX : Windows.Double
      ; dpiY : Windows.Double
      ; pixels : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GoToNextFrameAsync
   (
      This       : access IBitmapEncoder_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GoToNextFrameWithEncodingOptionsAsync
   (
      This       : access IBitmapEncoder_Interface
      ; encodingOptions : Windows.Address
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function FlushAsync
   (
      This       : access IBitmapEncoder_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapEncoder : aliased constant Windows.IID := (734292195, 57848, 19284, (149, 232, 50, 145, 149, 81, 206, 98 ));
   
   ------------------------------------------------------------------------
   type IBitmapEncoderWithSoftwareBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function SetSoftwareBitmap
   (
      This       : access IBitmapEncoderWithSoftwareBitmap_Interface
      ; bitmap : Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapEncoderWithSoftwareBitmap : aliased constant Windows.IID := (1751962177, 17200, 19575, (172, 228, 3, 52, 150, 139, 23, 104 ));
   
   ------------------------------------------------------------------------
   type ISoftwareBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BitmapPixelFormat
   (
      This       : access ISoftwareBitmap_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapAlphaMode
   (
      This       : access ISoftwareBitmap_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelWidth
   (
      This       : access ISoftwareBitmap_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelHeight
   (
      This       : access ISoftwareBitmap_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsReadOnly
   (
      This       : access ISoftwareBitmap_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DpiX
   (
      This       : access ISoftwareBitmap_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DpiX
   (
      This       : access ISoftwareBitmap_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DpiY
   (
      This       : access ISoftwareBitmap_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DpiY
   (
      This       : access ISoftwareBitmap_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function LockBuffer
   (
      This       : access ISoftwareBitmap_Interface
      ; mode : Windows.Graphics.Imaging.BitmapBufferAccessMode
      ; RetVal : access Windows.Graphics.Imaging.IBitmapBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CopyTo
   (
      This       : access ISoftwareBitmap_Interface
      ; bitmap : Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function CopyFromBuffer
   (
      This       : access ISoftwareBitmap_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CopyToBuffer
   (
      This       : access ISoftwareBitmap_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function GetReadOnlyView
   (
      This       : access ISoftwareBitmap_Interface
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   IID_ISoftwareBitmap : aliased constant Windows.IID := (1755186952, 32495, 18495, (150, 63, 218, 147, 136, 24, 224, 115 ));
   
   ------------------------------------------------------------------------
   type ISoftwareBitmapFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISoftwareBitmapFactory_Interface
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAlpha
   (
      This       : access ISoftwareBitmapFactory_Interface
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   IID_ISoftwareBitmapFactory : aliased constant Windows.IID := (3382700905, 11618, 19783, (166, 179, 79, 219, 106, 7, 253, 248 ));
   
   ------------------------------------------------------------------------
   type ISoftwareBitmapStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Copy
   (
      This       : access ISoftwareBitmapStatics_Interface
      ; source : Windows.Graphics.Imaging.ISoftwareBitmap
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function Convert
   (
      This       : access ISoftwareBitmapStatics_Interface
      ; source : Windows.Graphics.Imaging.ISoftwareBitmap
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function ConvertWithAlpha
   (
      This       : access ISoftwareBitmapStatics_Interface
      ; source : Windows.Graphics.Imaging.ISoftwareBitmap
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function CreateCopyFromBuffer
   (
      This       : access ISoftwareBitmapStatics_Interface
      ; source : Windows.Storage.Streams.IBuffer
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function CreateCopyWithAlphaFromBuffer
   (
      This       : access ISoftwareBitmapStatics_Interface
      ; source : Windows.Storage.Streams.IBuffer
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function CreateCopyFromSurfaceAsync
   (
      This       : access ISoftwareBitmapStatics_Interface
      ; surface : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateCopyWithAlphaFromSurfaceAsync
   (
      This       : access ISoftwareBitmapStatics_Interface
      ; surface : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
      ; RetVal : access Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISoftwareBitmapStatics : aliased constant Windows.IID := (3741550043, 26415, 19101, (128, 110, 194, 68, 47, 52, 62, 134 ));
   
   ------------------------------------------------------------------------
   type IBitmapBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPlaneCount
   (
      This       : access IBitmapBuffer_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetPlaneDescription
   (
      This       : access IBitmapBuffer_Interface
      ; index : Windows.Int32
      ; RetVal : access Windows.Graphics.Imaging.BitmapPlaneDescription
   )
   return Windows.HRESULT is abstract;
   
   IID_IBitmapBuffer : aliased constant Windows.IID := (2772305092, 14748, 17292, (178, 143, 166, 58, 107, 131, 209, 161 ));
   
   ------------------------------------------------------------------------
   type IRandomAccessStreamWithContentType_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   type IContentTypeProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentType
   (
      This       : access IContentTypeProvider_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IRandomAccessStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Size
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_Size
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function GetInputStreamAt
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function GetOutputStreamAt
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function Seek
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function CloneStream
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRead
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanWrite
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IOutputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function WriteAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FlushAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IInputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadAsync
   (
      This       : access IInputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; count : Windows.UInt32
      ; options : Windows.Storage.Streams.InputStreamOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IMap_String_BitmapTypedValue_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMap_String_BitmapTypedValue_Interface
      ; handler : Windows.Graphics.Imaging.AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMap_String_BitmapTypedValue_Interface
      ; RetVal : access Windows.Graphics.Imaging.AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMap_String_BitmapTypedValue_Interface
      ; RetVal : access Windows.Graphics.Imaging.IMap_String_BitmapTypedValue
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IMap_String_BitmapTypedValue : aliased constant Windows.IID := (1179303936, 45553, 21062, (130, 104, 145, 42, 37, 147, 216, 137 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPixelDataProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPixelDataProvider_Interface
      ; handler : Windows.Graphics.Imaging.AsyncOperationCompletedHandler_IPixelDataProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPixelDataProvider_Interface
      ; RetVal : access Windows.Graphics.Imaging.AsyncOperationCompletedHandler_IPixelDataProvider
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPixelDataProvider_Interface
      ; RetVal : access Windows.Graphics.Imaging.IPixelDataProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPixelDataProvider : aliased constant Windows.IID := (2351824560, 27682, 22627, (136, 216, 133, 193, 251, 199, 86, 151 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISoftwareBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISoftwareBitmap_Interface
      ; handler : Windows.Graphics.Imaging.AsyncOperationCompletedHandler_ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISoftwareBitmap_Interface
      ; RetVal : access Windows.Graphics.Imaging.AsyncOperationCompletedHandler_ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISoftwareBitmap_Interface
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISoftwareBitmap : aliased constant Windows.IID := (3298888064, 29003, 21761, (141, 162, 219, 218, 204, 231, 15, 115 ));
   
   ------------------------------------------------------------------------
   type IIterator_IBitmapCodecInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IBitmapCodecInformation_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapCodecInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IBitmapCodecInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IBitmapCodecInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IBitmapCodecInformation_Interface
      ; items : Windows.Graphics.Imaging.IBitmapCodecInformation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IBitmapCodecInformation : aliased constant Windows.IID := (1341305563, 37670, 21375, (184, 220, 76, 147, 215, 127, 187, 132 ));
   
   ------------------------------------------------------------------------
   type IIterable_IBitmapCodecInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IBitmapCodecInformation_Interface
      ; RetVal : access Windows.Graphics.Imaging.IIterator_IBitmapCodecInformation
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IBitmapCodecInformation : aliased constant Windows.IID := (728488848, 42219, 20802, (181, 130, 60, 203, 30, 220, 87, 137 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IBitmapCodecInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IBitmapCodecInformation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Imaging.IBitmapCodecInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IBitmapCodecInformation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IBitmapCodecInformation_Interface
      ; value : Windows.Graphics.Imaging.IBitmapCodecInformation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IBitmapCodecInformation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Imaging.IBitmapCodecInformation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IBitmapCodecInformation : aliased constant Windows.IID := (2548031126, 65309, 23201, (134, 58, 144, 17, 106, 49, 184, 107 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IBitmapDecoder_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBitmapDecoder_Interface
      ; handler : Windows.Graphics.Imaging.AsyncOperationCompletedHandler_IBitmapDecoder
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBitmapDecoder_Interface
      ; RetVal : access Windows.Graphics.Imaging.AsyncOperationCompletedHandler_IBitmapDecoder
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBitmapDecoder_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapDecoder
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IBitmapDecoder : aliased constant Windows.IID := (2861881577, 51951, 21494, (130, 61, 145, 182, 232, 52, 5, 16 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IBitmapFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBitmapFrame_Interface
      ; handler : Windows.Graphics.Imaging.AsyncOperationCompletedHandler_IBitmapFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBitmapFrame_Interface
      ; RetVal : access Windows.Graphics.Imaging.AsyncOperationCompletedHandler_IBitmapFrame
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBitmapFrame_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IBitmapFrame : aliased constant Windows.IID := (3407119313, 5220, 23545, (147, 70, 213, 55, 115, 93, 251, 214 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IBitmapEncoder_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBitmapEncoder_Interface
      ; handler : Windows.Graphics.Imaging.AsyncOperationCompletedHandler_IBitmapEncoder
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBitmapEncoder_Interface
      ; RetVal : access Windows.Graphics.Imaging.AsyncOperationCompletedHandler_IBitmapEncoder
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBitmapEncoder_Interface
      ; RetVal : access Windows.Graphics.Imaging.IBitmapEncoder
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IBitmapEncoder : aliased constant Windows.IID := (354144709, 18037, 23285, (162, 137, 0, 30, 220, 102, 184, 106 ));
   
   ------------------------------------------------------------------------
   type IIterator_BitmapPixelFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_BitmapPixelFormat_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_BitmapPixelFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_BitmapPixelFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_BitmapPixelFormat_Interface
      ; items : Windows.Graphics.Imaging.BitmapPixelFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_BitmapPixelFormat : aliased constant Windows.IID := (2143478419, 4228, 23877, (184, 184, 147, 225, 6, 146, 188, 200 ));
   
   ------------------------------------------------------------------------
   type IIterable_BitmapPixelFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_BitmapPixelFormat_Interface
      ; RetVal : access Windows.Graphics.Imaging.IIterator_BitmapPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_BitmapPixelFormat : aliased constant Windows.IID := (3911506413, 41278, 23515, (158, 216, 101, 161, 71, 77, 194, 116 ));
   
   ------------------------------------------------------------------------
   type IVectorView_BitmapPixelFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_BitmapPixelFormat_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_BitmapPixelFormat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_BitmapPixelFormat_Interface
      ; value : Windows.Graphics.Imaging.BitmapPixelFormat
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_BitmapPixelFormat_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Imaging.BitmapPixelFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_BitmapPixelFormat : aliased constant Windows.IID := (1991003074, 49564, 21916, (178, 135, 22, 148, 192, 220, 58, 13 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISoftwareBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISoftwareBitmap_Interface
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISoftwareBitmap_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISoftwareBitmap_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISoftwareBitmap_Interface
      ; items : Windows.Graphics.Imaging.ISoftwareBitmap_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISoftwareBitmap : aliased constant Windows.IID := (3440567491, 36008, 23526, (182, 75, 32, 74, 1, 79, 198, 32 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISoftwareBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISoftwareBitmap_Interface
      ; RetVal : access Windows.Graphics.Imaging.IIterator_ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISoftwareBitmap : aliased constant Windows.IID := (584295183, 2200, 24212, (153, 163, 175, 165, 149, 29, 252, 212 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IMap_String_BitmapTypedValue ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IMap_String_BitmapTypedValue
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPixelDataProvider_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IPixelDataProvider ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPixelDataProvider_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPixelDataProvider_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IPixelDataProvider
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPixelDataProvider : aliased constant Windows.IID := (935195838, 12089, 22828, (164, 247, 209, 106, 9, 210, 178, 219 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISoftwareBitmap_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISoftwareBitmap_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISoftwareBitmap_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISoftwareBitmap : aliased constant Windows.IID := (3063526995, 13293, 24109, (167, 95, 2, 191, 144, 227, 38, 25 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IBitmapDecoder_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IBitmapDecoder_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBitmapDecoder_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IBitmapDecoder : aliased constant Windows.IID := (3143963890, 15611, 22127, (130, 188, 96, 170, 189, 48, 45, 83 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IBitmapFrame_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IBitmapFrame ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IBitmapFrame_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBitmapFrame_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IBitmapFrame
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IBitmapFrame : aliased constant Windows.IID := (672613722, 38975, 23046, (159, 228, 251, 150, 55, 104, 67, 32 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IBitmapEncoder_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IBitmapEncoder_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBitmapEncoder_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IBitmapEncoder : aliased constant Windows.IID := (1576120261, 18317, 21981, (179, 23, 2, 66, 116, 6, 42, 13 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype BitmapTransform is Windows.Graphics.Imaging.IBitmapTransform;
   
   function CreateBitmapTransform return Windows.Graphics.Imaging.IBitmapTransform;
   
   subtype BitmapTypedValue is Windows.Graphics.Imaging.IBitmapTypedValue;
   
   function Create
   (
      value : Windows.Object
      ; type_x : Windows.Foundation.PropertyType
   )
   return Windows.Graphics.Imaging.IBitmapTypedValue;
   
   subtype BitmapPropertySet is Windows.Graphics.Imaging.IMap_String_BitmapTypedValue;
   
   function CreateBitmapPropertySet return Windows.Graphics.Imaging.IMap_String_BitmapTypedValue;
   
   subtype BitmapPropertiesView is Windows.Graphics.Imaging.IBitmapPropertiesView;
   subtype BitmapProperties is Windows.Graphics.Imaging.IBitmapProperties;
   subtype PixelDataProvider is Windows.Graphics.Imaging.IPixelDataProvider;
   subtype ImageStream is Windows.Storage.Streams.IRandomAccessStreamWithContentType;
   subtype BitmapFrame is Windows.Graphics.Imaging.IBitmapFrame;
   subtype BitmapCodecInformation is Windows.Graphics.Imaging.IBitmapCodecInformation;
   subtype BitmapDecoder is Windows.Graphics.Imaging.IBitmapDecoder;
   subtype BitmapEncoder is Windows.Graphics.Imaging.IBitmapEncoder;
   subtype BitmapBuffer is Windows.Graphics.Imaging.IBitmapBuffer;
   subtype SoftwareBitmap is Windows.Graphics.Imaging.ISoftwareBitmap;
   
   function Create
   (
      format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap;
   
   function CreateWithAlpha
   (
      format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_BmpDecoderId
   return Windows.Guid;
   
   function get_JpegDecoderId
   return Windows.Guid;
   
   function get_PngDecoderId
   return Windows.Guid;
   
   function get_TiffDecoderId
   return Windows.Guid;
   
   function get_GifDecoderId
   return Windows.Guid;
   
   function get_JpegXRDecoderId
   return Windows.Guid;
   
   function get_IcoDecoderId
   return Windows.Guid;
   
   function GetDecoderInformationEnumerator
   return Windows.Graphics.Imaging.IVectorView_IBitmapCodecInformation;
   
   function CreateAsync
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder;
   
   function CreateWithIdAsync
   (
      decoderId : Windows.Guid
      ; stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder;
   
   function get_BmpEncoderId
   return Windows.Guid;
   
   function get_JpegEncoderId
   return Windows.Guid;
   
   function get_PngEncoderId
   return Windows.Guid;
   
   function get_TiffEncoderId
   return Windows.Guid;
   
   function get_GifEncoderId
   return Windows.Guid;
   
   function get_JpegXREncoderId
   return Windows.Guid;
   
   function GetEncoderInformationEnumerator
   return Windows.Graphics.Imaging.IVectorView_IBitmapCodecInformation;
   
   function CreateAsync
   (
      encoderId : Windows.Guid
      ; stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder;
   
   function CreateWithEncodingOptionsAsync
   (
      encoderId : Windows.Guid
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; encodingOptions : Windows.Address
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder;
   
   function CreateForTranscodingAsync
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; bitmapDecoder : Windows.Graphics.Imaging.IBitmapDecoder
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder;
   
   function CreateForInPlacePropertyEncodingAsync
   (
      bitmapDecoder : Windows.Graphics.Imaging.IBitmapDecoder
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder;
   
   function Copy
   (
      source : Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap;
   
   function Convert
   (
      source : Windows.Graphics.Imaging.ISoftwareBitmap
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap;
   
   function ConvertWithAlpha
   (
      source : Windows.Graphics.Imaging.ISoftwareBitmap
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap;
   
   function CreateCopyFromBuffer
   (
      source : Windows.Storage.Streams.IBuffer
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap;
   
   function CreateCopyWithAlphaFromBuffer
   (
      source : Windows.Storage.Streams.IBuffer
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap;
   
   function CreateCopyFromSurfaceAsync
   (
      surface : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap;
   
   function CreateCopyWithAlphaFromSurfaceAsync
   (
      surface : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap;

end;
