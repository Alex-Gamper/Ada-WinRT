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
limited with Windows.ApplicationModel.Background;
limited with Windows.Graphics.Imaging;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Media.Imaging is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type BitmapCreateOptions is (
      None,
      IgnoreImageCache
   );
   for BitmapCreateOptions use (
      None => 0,
      IgnoreImageCache => 8
   );
   for BitmapCreateOptions'Size use 32;
   
   type BitmapCreateOptions_Ptr is access BitmapCreateOptions;
   
   type DecodePixelType is (
      Physical,
      Logical
   );
   for DecodePixelType use (
      Physical => 0,
      Logical => 1
   );
   for DecodePixelType'Size use 32;
   
   type DecodePixelType_Ptr is access DecodePixelType;
   
   type SvgImageSourceLoadStatus is (
      Success,
      NetworkError,
      InvalidFormat,
      Other
   );
   for SvgImageSourceLoadStatus use (
      Success => 0,
      NetworkError => 1,
      InvalidFormat => 2,
      Other => 3
   );
   for SvgImageSourceLoadStatus'Size use 32;
   
   type SvgImageSourceLoadStatus_Ptr is access SvgImageSourceLoadStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type DownloadProgressEventHandler_Interface;
   type DownloadProgressEventHandler is access all DownloadProgressEventHandler_Interface'Class;
   type DownloadProgressEventHandler_Ptr is access all DownloadProgressEventHandler;
   type TypedEventHandler_ISvgImageSource_add_Opened_Interface;
   type TypedEventHandler_ISvgImageSource_add_Opened is access all TypedEventHandler_ISvgImageSource_add_Opened_Interface'Class;
   type TypedEventHandler_ISvgImageSource_add_Opened_Ptr is access all TypedEventHandler_ISvgImageSource_add_Opened;
   type TypedEventHandler_ISvgImageSource_add_OpenFailed_Interface;
   type TypedEventHandler_ISvgImageSource_add_OpenFailed is access all TypedEventHandler_ISvgImageSource_add_OpenFailed_Interface'Class;
   type TypedEventHandler_ISvgImageSource_add_OpenFailed_Ptr is access all TypedEventHandler_ISvgImageSource_add_OpenFailed;
   type AsyncOperationCompletedHandler_SvgImageSourceLoadStatus_Interface;
   type AsyncOperationCompletedHandler_SvgImageSourceLoadStatus is access all AsyncOperationCompletedHandler_SvgImageSourceLoadStatus_Interface'Class;
   type AsyncOperationCompletedHandler_SvgImageSourceLoadStatus_Ptr is access all AsyncOperationCompletedHandler_SvgImageSourceLoadStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDownloadProgressEventArgs_Interface;
   type IDownloadProgressEventArgs is access all IDownloadProgressEventArgs_Interface'Class;
   type IDownloadProgressEventArgs_Ptr is access all IDownloadProgressEventArgs;
   type IBitmapSource_Interface;
   type IBitmapSource is access all IBitmapSource_Interface'Class;
   type IBitmapSource_Ptr is access all IBitmapSource;
   type IBitmapSourceStatics_Interface;
   type IBitmapSourceStatics is access all IBitmapSourceStatics_Interface'Class;
   type IBitmapSourceStatics_Ptr is access all IBitmapSourceStatics;
   type IBitmapSourceFactory_Interface;
   type IBitmapSourceFactory is access all IBitmapSourceFactory_Interface'Class;
   type IBitmapSourceFactory_Ptr is access all IBitmapSourceFactory;
   type IRenderTargetBitmap_Interface;
   type IRenderTargetBitmap is access all IRenderTargetBitmap_Interface'Class;
   type IRenderTargetBitmap_Ptr is access all IRenderTargetBitmap;
   type IRenderTargetBitmapStatics_Interface;
   type IRenderTargetBitmapStatics is access all IRenderTargetBitmapStatics_Interface'Class;
   type IRenderTargetBitmapStatics_Ptr is access all IRenderTargetBitmapStatics;
   type ISurfaceImageSource_Interface;
   type ISurfaceImageSource is access all ISurfaceImageSource_Interface'Class;
   type ISurfaceImageSource_Ptr is access all ISurfaceImageSource;
   type ISurfaceImageSourceFactory_Interface;
   type ISurfaceImageSourceFactory is access all ISurfaceImageSourceFactory_Interface'Class;
   type ISurfaceImageSourceFactory_Ptr is access all ISurfaceImageSourceFactory;
   type IBitmapImage_Interface;
   type IBitmapImage is access all IBitmapImage_Interface'Class;
   type IBitmapImage_Ptr is access all IBitmapImage;
   type IBitmapImageStatics_Interface;
   type IBitmapImageStatics is access all IBitmapImageStatics_Interface'Class;
   type IBitmapImageStatics_Ptr is access all IBitmapImageStatics;
   type IBitmapImageFactory_Interface;
   type IBitmapImageFactory is access all IBitmapImageFactory_Interface'Class;
   type IBitmapImageFactory_Ptr is access all IBitmapImageFactory;
   type IBitmapImage2_Interface;
   type IBitmapImage2 is access all IBitmapImage2_Interface'Class;
   type IBitmapImage2_Ptr is access all IBitmapImage2;
   type IBitmapImageStatics2_Interface;
   type IBitmapImageStatics2 is access all IBitmapImageStatics2_Interface'Class;
   type IBitmapImageStatics2_Ptr is access all IBitmapImageStatics2;
   type IBitmapImage3_Interface;
   type IBitmapImage3 is access all IBitmapImage3_Interface'Class;
   type IBitmapImage3_Ptr is access all IBitmapImage3;
   type IBitmapImageStatics3_Interface;
   type IBitmapImageStatics3 is access all IBitmapImageStatics3_Interface'Class;
   type IBitmapImageStatics3_Ptr is access all IBitmapImageStatics3;
   type IVirtualSurfaceImageSource_Interface;
   type IVirtualSurfaceImageSource is access all IVirtualSurfaceImageSource_Interface'Class;
   type IVirtualSurfaceImageSource_Ptr is access all IVirtualSurfaceImageSource;
   type IVirtualSurfaceImageSourceFactory_Interface;
   type IVirtualSurfaceImageSourceFactory is access all IVirtualSurfaceImageSourceFactory_Interface'Class;
   type IVirtualSurfaceImageSourceFactory_Ptr is access all IVirtualSurfaceImageSourceFactory;
   type IWriteableBitmap_Interface;
   type IWriteableBitmap is access all IWriteableBitmap_Interface'Class;
   type IWriteableBitmap_Ptr is access all IWriteableBitmap;
   type IWriteableBitmapFactory_Interface;
   type IWriteableBitmapFactory is access all IWriteableBitmapFactory_Interface'Class;
   type IWriteableBitmapFactory_Ptr is access all IWriteableBitmapFactory;
   type ISvgImageSourceFailedEventArgs_Interface;
   type ISvgImageSourceFailedEventArgs is access all ISvgImageSourceFailedEventArgs_Interface'Class;
   type ISvgImageSourceFailedEventArgs_Ptr is access all ISvgImageSourceFailedEventArgs;
   type ISvgImageSourceOpenedEventArgs_Interface;
   type ISvgImageSourceOpenedEventArgs is access all ISvgImageSourceOpenedEventArgs_Interface'Class;
   type ISvgImageSourceOpenedEventArgs_Ptr is access all ISvgImageSourceOpenedEventArgs;
   type IXamlRenderingBackgroundTask_Interface;
   type IXamlRenderingBackgroundTask is access all IXamlRenderingBackgroundTask_Interface'Class;
   type IXamlRenderingBackgroundTask_Ptr is access all IXamlRenderingBackgroundTask;
   type IXamlRenderingBackgroundTaskOverrides_Interface;
   type IXamlRenderingBackgroundTaskOverrides is access all IXamlRenderingBackgroundTaskOverrides_Interface'Class;
   type IXamlRenderingBackgroundTaskOverrides_Ptr is access all IXamlRenderingBackgroundTaskOverrides;
   type IXamlRenderingBackgroundTaskFactory_Interface;
   type IXamlRenderingBackgroundTaskFactory is access all IXamlRenderingBackgroundTaskFactory_Interface'Class;
   type IXamlRenderingBackgroundTaskFactory_Ptr is access all IXamlRenderingBackgroundTaskFactory;
   type ISoftwareBitmapSource_Interface;
   type ISoftwareBitmapSource is access all ISoftwareBitmapSource_Interface'Class;
   type ISoftwareBitmapSource_Ptr is access all ISoftwareBitmapSource;
   type ISvgImageSource_Interface;
   type ISvgImageSource is access all ISvgImageSource_Interface'Class;
   type ISvgImageSource_Ptr is access all ISvgImageSource;
   type ISvgImageSourceStatics_Interface;
   type ISvgImageSourceStatics is access all ISvgImageSourceStatics_Interface'Class;
   type ISvgImageSourceStatics_Ptr is access all ISvgImageSourceStatics;
   type ISvgImageSourceFactory_Interface;
   type ISvgImageSourceFactory is access all ISvgImageSourceFactory_Interface'Class;
   type ISvgImageSourceFactory_Ptr is access all ISvgImageSourceFactory;
   type IAsyncOperation_SvgImageSourceLoadStatus_Interface;
   type IAsyncOperation_SvgImageSourceLoadStatus is access all IAsyncOperation_SvgImageSourceLoadStatus_Interface'Class;
   type IAsyncOperation_SvgImageSourceLoadStatus_Ptr is access all IAsyncOperation_SvgImageSourceLoadStatus;
   
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
   
   IID_IDownloadProgressEventArgs : aliased constant Windows.IID := (1930551508, 65172, 20080, (155, 144, 205, 212, 122, 194, 58, 251 ));
   
   type IDownloadProgressEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Progress
   (
      This       : access IDownloadProgressEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Progress
   (
      This       : access IDownloadProgressEventArgs_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBitmapSource : aliased constant Windows.IID := (601383953, 8239, 16818, (140, 91, 168, 163, 179, 51, 128, 11 ));
   
   type IBitmapSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PixelWidth
   (
      This       : access IBitmapSource_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelHeight
   (
      This       : access IBitmapSource_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetSource
   (
      This       : access IBitmapSource_Interface
      ; streamSource : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function SetSourceAsync
   (
      This       : access IBitmapSource_Interface
      ; streamSource : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBitmapSourceStatics : aliased constant Windows.IID := (2593954177, 33403, 20049, (137, 27, 138, 21, 181, 17, 132, 45 ));
   
   type IBitmapSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PixelWidthProperty
   (
      This       : access IBitmapSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelHeightProperty
   (
      This       : access IBitmapSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBitmapSourceFactory : aliased constant Windows.IID := (3795862030, 54439, 18852, (160, 180, 165, 159, 221, 119, 229, 8 ));
   
   type IBitmapSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IBitmapSourceFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.IBitmapSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRenderTargetBitmap : aliased constant Windows.IID := (1343090305, 35132, 19466, (143, 236, 70, 120, 172, 113, 117, 137 ));
   
   type IRenderTargetBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PixelWidth
   (
      This       : access IRenderTargetBitmap_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelHeight
   (
      This       : access IRenderTargetBitmap_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function RenderAsync
   (
      This       : access IRenderTargetBitmap_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RenderToSizeAsync
   (
      This       : access IRenderTargetBitmap_Interface
      ; element : Windows.UI.Xaml.IUIElement
      ; scaledWidth : Windows.Int32
      ; scaledHeight : Windows.Int32
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetPixelsAsync
   (
      This       : access IRenderTargetBitmap_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRenderTargetBitmapStatics : aliased constant Windows.IID := (4037144558, 49457, 19776, (156, 71, 247, 215, 207, 43, 7, 127 ));
   
   type IRenderTargetBitmapStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PixelWidthProperty
   (
      This       : access IRenderTargetBitmapStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelHeightProperty
   (
      This       : access IRenderTargetBitmapStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISurfaceImageSource : aliased constant Windows.IID := (1660408854, 50964, 19532, (130, 115, 248, 57, 188, 88, 19, 92 ));
   
   type ISurfaceImageSource_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISurfaceImageSourceFactory : aliased constant Windows.IID := (984752426, 61285, 19039, (191, 172, 115, 153, 62, 140, 18, 201 ));
   
   type ISurfaceImageSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithDimensions
   (
      This       : access ISurfaceImageSourceFactory_Interface
      ; pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.ISurfaceImageSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithDimensionsAndOpacity
   (
      This       : access ISurfaceImageSourceFactory_Interface
      ; pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; isOpaque : Windows.Boolean
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.ISurfaceImageSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBitmapImage : aliased constant Windows.IID := (833565297, 58292, 17453, (163, 65, 76, 2, 38, 178, 114, 91 ));
   
   type IBitmapImage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CreateOptions
   (
      This       : access IBitmapImage_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.BitmapCreateOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_CreateOptions
   (
      This       : access IBitmapImage_Interface
      ; value : Windows.UI.Xaml.Media.Imaging.BitmapCreateOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_UriSource
   (
      This       : access IBitmapImage_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_UriSource
   (
      This       : access IBitmapImage_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_DecodePixelWidth
   (
      This       : access IBitmapImage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_DecodePixelWidth
   (
      This       : access IBitmapImage_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_DecodePixelHeight
   (
      This       : access IBitmapImage_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_DecodePixelHeight
   (
      This       : access IBitmapImage_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function add_DownloadProgress
   (
      This       : access IBitmapImage_Interface
      ; value : Windows.UI.Xaml.Media.Imaging.DownloadProgressEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DownloadProgress
   (
      This       : access IBitmapImage_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ImageOpened
   (
      This       : access IBitmapImage_Interface
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ImageOpened
   (
      This       : access IBitmapImage_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ImageFailed
   (
      This       : access IBitmapImage_Interface
      ; value : Windows.UI.Xaml.ExceptionRoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ImageFailed
   (
      This       : access IBitmapImage_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBitmapImageStatics : aliased constant Windows.IID := (2653430083, 28904, 17276, (159, 164, 44, 191, 41, 92, 255, 132 ));
   
   type IBitmapImageStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CreateOptionsProperty
   (
      This       : access IBitmapImageStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_UriSourceProperty
   (
      This       : access IBitmapImageStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DecodePixelWidthProperty
   (
      This       : access IBitmapImageStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DecodePixelHeightProperty
   (
      This       : access IBitmapImageStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBitmapImageFactory : aliased constant Windows.IID := (3373476216, 18448, 20062, (128, 135, 3, 103, 30, 230, 13, 133 ));
   
   type IBitmapImageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithUriSource
   (
      This       : access IBitmapImageFactory_Interface
      ; uriSource : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.IBitmapImage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBitmapImage2 : aliased constant Windows.IID := (275366326, 35995, 18274, (190, 61, 117, 159, 86, 152, 242, 179 ));
   
   type IBitmapImage2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DecodePixelType
   (
      This       : access IBitmapImage2_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.DecodePixelType
   )
   return Windows.HRESULT is abstract;
   
   function put_DecodePixelType
   (
      This       : access IBitmapImage2_Interface
      ; value : Windows.UI.Xaml.Media.Imaging.DecodePixelType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBitmapImageStatics2 : aliased constant Windows.IID := (3321190250, 30127, 16804, (184, 147, 143, 233, 31, 238, 40, 130 ));
   
   type IBitmapImageStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DecodePixelTypeProperty
   (
      This       : access IBitmapImageStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBitmapImage3 : aliased constant Windows.IID := (4057886502, 15475, 17727, (167, 186, 155, 133, 193, 139, 55, 51 ));
   
   type IBitmapImage3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAnimatedBitmap
   (
      This       : access IBitmapImage3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPlaying
   (
      This       : access IBitmapImage3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoPlay
   (
      This       : access IBitmapImage3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoPlay
   (
      This       : access IBitmapImage3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Play
   (
      This       : access IBitmapImage3_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IBitmapImage3_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBitmapImageStatics3 : aliased constant Windows.IID := (725934861, 63189, 17425, (168, 205, 191, 118, 3, 196, 250, 160 ));
   
   type IBitmapImageStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAnimatedBitmapProperty
   (
      This       : access IBitmapImageStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPlayingProperty
   (
      This       : access IBitmapImageStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoPlayProperty
   (
      This       : access IBitmapImageStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVirtualSurfaceImageSource : aliased constant Windows.IID := (1248927722, 49068, 4576, (160, 106, 157, 228, 71, 36, 1, 155 ));
   
   type IVirtualSurfaceImageSource_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IVirtualSurfaceImageSourceFactory : aliased constant Windows.IID := (984752426, 49068, 4576, (138, 146, 105, 228, 71, 36, 1, 155 ));
   
   type IVirtualSurfaceImageSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithDimensions
   (
      This       : access IVirtualSurfaceImageSourceFactory_Interface
      ; pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithDimensionsAndOpacity
   (
      This       : access IVirtualSurfaceImageSourceFactory_Interface
      ; pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; isOpaque : Windows.Boolean
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWriteableBitmap : aliased constant Windows.IID := (3205201519, 57212, 19077, (132, 19, 161, 33, 98, 133, 131, 92 ));
   
   type IWriteableBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PixelBuffer
   (
      This       : access IWriteableBitmap_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function Invalidate
   (
      This       : access IWriteableBitmap_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWriteableBitmapFactory : aliased constant Windows.IID := (1432611761, 16114, 17093, (156, 109, 28, 245, 220, 192, 65, 255 ));
   
   type IWriteableBitmapFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithDimensions
   (
      This       : access IWriteableBitmapFactory_Interface
      ; pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.IWriteableBitmap
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISvgImageSourceFailedEventArgs : aliased constant Windows.IID := (1757098352, 15564, 16437, (172, 1, 152, 52, 84, 61, 116, 78 ));
   
   type ISvgImageSourceFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ISvgImageSourceFailedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISvgImageSourceOpenedEventArgs : aliased constant Windows.IID := (2247052310, 29838, 16392, (149, 199, 106, 35, 221, 115, 22, 219 ));
   
   type ISvgImageSourceOpenedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IXamlRenderingBackgroundTask : aliased constant Windows.IID := (1566566826, 21310, 17592, (169, 117, 252, 95, 30, 59, 255, 82 ));
   
   type IXamlRenderingBackgroundTask_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IXamlRenderingBackgroundTaskOverrides : aliased constant Windows.IID := (2620025239, 43272, 18193, (180, 178, 169, 96, 219, 61, 142, 90 ));
   
   type IXamlRenderingBackgroundTaskOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function OnRun
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface
      ; taskInstance : Windows.ApplicationModel.Background.IBackgroundTaskInstance
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IXamlRenderingBackgroundTaskFactory : aliased constant Windows.IID := (2748431203, 14584, 19875, (159, 202, 253, 129, 40, 162, 203, 249 ));
   
   type IXamlRenderingBackgroundTaskFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IXamlRenderingBackgroundTaskFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTask
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISoftwareBitmapSource : aliased constant Windows.IID := (3537739472, 54213, 16470, (145, 181, 183, 193, 209, 232, 19, 14 ));
   
   type ISoftwareBitmapSource_Interface is interface and Windows.IInspectable_Interface;
   
   function SetBitmapAsync
   (
      This       : access ISoftwareBitmapSource_Interface
      ; softwareBitmap : Windows.Graphics.Imaging.ISoftwareBitmap
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISvgImageSource : aliased constant Windows.IID := (65130179, 3240, 19022, (141, 124, 200, 8, 160, 131, 133, 134 ));
   
   type ISvgImageSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UriSource
   (
      This       : access ISvgImageSource_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_UriSource
   (
      This       : access ISvgImageSource_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_RasterizePixelWidth
   (
      This       : access ISvgImageSource_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RasterizePixelWidth
   (
      This       : access ISvgImageSource_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RasterizePixelHeight
   (
      This       : access ISvgImageSource_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RasterizePixelHeight
   (
      This       : access ISvgImageSource_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function add_Opened
   (
      This       : access ISvgImageSource_Interface
      ; value : TypedEventHandler_ISvgImageSource_add_Opened
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Opened
   (
      This       : access ISvgImageSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_OpenFailed
   (
      This       : access ISvgImageSource_Interface
      ; value : TypedEventHandler_ISvgImageSource_add_OpenFailed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OpenFailed
   (
      This       : access ISvgImageSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function SetSourceAsync
   (
      This       : access ISvgImageSource_Interface
      ; streamSource : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.IAsyncOperation_SvgImageSourceLoadStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISvgImageSourceStatics : aliased constant Windows.IID := (2623944910, 48849, 19115, (172, 187, 211, 226, 24, 93, 49, 90 ));
   
   type ISvgImageSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UriSourceProperty
   (
      This       : access ISvgImageSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RasterizePixelWidthProperty
   (
      This       : access ISvgImageSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RasterizePixelHeightProperty
   (
      This       : access ISvgImageSourceStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISvgImageSourceFactory : aliased constant Windows.IID := (3348425191, 53027, 19826, (191, 26, 223, 170, 22, 216, 234, 82 ));
   
   type ISvgImageSourceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ISvgImageSourceFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.ISvgImageSource
   )
   return Windows.HRESULT is abstract;
   
   function CreateInstanceWithUriSource
   (
      This       : access ISvgImageSourceFactory_Interface
      ; uriSource : Windows.Foundation.IUriRuntimeClass
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.ISvgImageSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_SvgImageSourceLoadStatus : aliased constant Windows.IID := (4053661122, 11128, 21417, (141, 56, 92, 168, 219, 181, 219, 198 ));
   
   type IAsyncOperation_SvgImageSourceLoadStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SvgImageSourceLoadStatus_Interface
      ; handler : Windows.UI.Xaml.Media.Imaging.AsyncOperationCompletedHandler_SvgImageSourceLoadStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SvgImageSourceLoadStatus_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.AsyncOperationCompletedHandler_SvgImageSourceLoadStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SvgImageSourceLoadStatus_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_DownloadProgressEventHandler : aliased constant Windows.IID := (448458275, 29934, 19655, (153, 186, 177, 113, 227, 205, 166, 30 ));
   
   type DownloadProgressEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Media.Imaging.IDownloadProgressEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_DownloadProgressEventHandler'access) with null record;
   function Invoke
   (
      This       : access DownloadProgressEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Media.Imaging.IDownloadProgressEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISvgImageSource_add_Opened : aliased constant Windows.IID := (2654081361, 35623, 24088, (158, 163, 80, 82, 10, 206, 183, 239 ));
   
   type TypedEventHandler_ISvgImageSource_add_Opened_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Media.Imaging.ISvgImageSource ; args : Windows.UI.Xaml.Media.Imaging.ISvgImageSourceOpenedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISvgImageSource_add_Opened'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISvgImageSource_add_Opened_Interface
      ; sender : Windows.UI.Xaml.Media.Imaging.ISvgImageSource
      ; args : Windows.UI.Xaml.Media.Imaging.ISvgImageSourceOpenedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISvgImageSource_add_OpenFailed : aliased constant Windows.IID := (3609432973, 61422, 23052, (171, 62, 30, 29, 179, 201, 162, 22 ));
   
   type TypedEventHandler_ISvgImageSource_add_OpenFailed_Interface(Callback : access procedure (sender : Windows.UI.Xaml.Media.Imaging.ISvgImageSource ; args : Windows.UI.Xaml.Media.Imaging.ISvgImageSourceFailedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISvgImageSource_add_OpenFailed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISvgImageSource_add_OpenFailed_Interface
      ; sender : Windows.UI.Xaml.Media.Imaging.ISvgImageSource
      ; args : Windows.UI.Xaml.Media.Imaging.ISvgImageSourceFailedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_SvgImageSourceLoadStatus : aliased constant Windows.IID := (2089535080, 19979, 22820, (183, 231, 35, 74, 17, 214, 61, 97 ));
   
   type AsyncOperationCompletedHandler_SvgImageSourceLoadStatus_Interface(Callback : access procedure (asyncInfo : Windows.UI.Xaml.Media.Imaging.IAsyncOperation_SvgImageSourceLoadStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_SvgImageSourceLoadStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SvgImageSourceLoadStatus_Interface
      ; asyncInfo : Windows.UI.Xaml.Media.Imaging.IAsyncOperation_SvgImageSourceLoadStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DownloadProgressEventArgs is Windows.UI.Xaml.Media.Imaging.IDownloadProgressEventArgs;
   subtype BitmapSource is Windows.UI.Xaml.Media.Imaging.IBitmapSource;
   
   type IBitmapSource_Interface_Impl is new IBitmapSource_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IBitmapSource := null;
      m_IBitmapSource : IBitmapSource := null;
   end record;
   
   type IBitmapSource_Impl is access all IBitmapSource_Interface_Impl'Class;
   type IBitmapSource_Impl_Ptr is access all IBitmapSource_Impl;
   
   function QueryInterface
   (
      This       : access IBitmapSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IBitmapSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IBitmapSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IBitmapSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IBitmapSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IBitmapSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_PixelWidth
   (
      This       : access IBitmapSource_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function get_PixelHeight
   (
      This       : access IBitmapSource_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT;
   
   function SetSource
   (
      This       : access IBitmapSource_Interface_Impl
      ; streamSource : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT;
   
   function SetSourceAsync
   (
      This       : access IBitmapSource_Interface_Impl
      ; streamSource : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT;
   
   
   subtype RenderTargetBitmap is Windows.UI.Xaml.Media.Imaging.IRenderTargetBitmap;
   
   function CreateRenderTargetBitmap return Windows.UI.Xaml.Media.Imaging.IRenderTargetBitmap;
   
   subtype SurfaceImageSource is Windows.UI.Xaml.Media.Imaging.ISurfaceImageSource;
   
   subtype BitmapImage is Windows.UI.Xaml.Media.Imaging.IBitmapImage;
   function CreateInstanceWithUriSource
   (
      uriSource : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.UI.Xaml.Media.Imaging.IBitmapImage;
   
   
   subtype VirtualSurfaceImageSource is Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource;
   function CreateInstanceWithDimensions
   (
      pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
   )
   return Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource;
   
   function CreateInstanceWithDimensionsAndOpacity
   (
      pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; isOpaque : Windows.Boolean
   )
   return Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource;
   
   
   subtype WriteableBitmap is Windows.UI.Xaml.Media.Imaging.IWriteableBitmap;
   function CreateInstanceWithDimensions
   (
      pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
   )
   return Windows.UI.Xaml.Media.Imaging.IWriteableBitmap;
   
   
   subtype SvgImageSourceFailedEventArgs is Windows.UI.Xaml.Media.Imaging.ISvgImageSourceFailedEventArgs;
   subtype SvgImageSourceOpenedEventArgs is Windows.UI.Xaml.Media.Imaging.ISvgImageSourceOpenedEventArgs;
   subtype XamlRenderingBackgroundTask is Windows.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTask;
   
   type IXamlRenderingBackgroundTaskOverrides_Interface_Impl is new IXamlRenderingBackgroundTaskOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IXamlRenderingBackgroundTaskOverrides := null;
      m_IXamlRenderingBackgroundTask : IXamlRenderingBackgroundTask := null;
   end record;
   
   type IXamlRenderingBackgroundTaskOverrides_Impl is access all IXamlRenderingBackgroundTaskOverrides_Interface_Impl'Class;
   type IXamlRenderingBackgroundTaskOverrides_Impl_Ptr is access all IXamlRenderingBackgroundTaskOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function OnRun
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl
      ; taskInstance : Windows.ApplicationModel.Background.IBackgroundTaskInstance
   )
   return Windows.HRESULT;
   
   
   type IXamlRenderingBackgroundTask_Interface_Impl is new IXamlRenderingBackgroundTask_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IXamlRenderingBackgroundTask := null;
      m_IXamlRenderingBackgroundTask : IXamlRenderingBackgroundTask := null;
   end record;
   
   type IXamlRenderingBackgroundTask_Impl is access all IXamlRenderingBackgroundTask_Interface_Impl'Class;
   type IXamlRenderingBackgroundTask_Impl_Ptr is access all IXamlRenderingBackgroundTask_Impl;
   
   function QueryInterface
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype SoftwareBitmapSource is Windows.UI.Xaml.Media.Imaging.ISoftwareBitmapSource;
   
   function CreateSoftwareBitmapSource return Windows.UI.Xaml.Media.Imaging.ISoftwareBitmapSource;
   
   subtype SvgImageSource is Windows.UI.Xaml.Media.Imaging.ISvgImageSource;
   
   type ISvgImageSource_Interface_Impl is new ISvgImageSource_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased ISvgImageSource := null;
      m_ISvgImageSource : ISvgImageSource := null;
   end record;
   
   type ISvgImageSource_Impl is access all ISvgImageSource_Interface_Impl'Class;
   type ISvgImageSource_Impl_Ptr is access all ISvgImageSource_Impl;
   
   function QueryInterface
   (
      This       : access ISvgImageSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ISvgImageSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ISvgImageSource_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ISvgImageSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ISvgImageSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ISvgImageSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_UriSource
   (
      This       : access ISvgImageSource_Interface_Impl
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT;
   
   function put_UriSource
   (
      This       : access ISvgImageSource_Interface_Impl
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT;
   
   function get_RasterizePixelWidth
   (
      This       : access ISvgImageSource_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_RasterizePixelWidth
   (
      This       : access ISvgImageSource_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_RasterizePixelHeight
   (
      This       : access ISvgImageSource_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_RasterizePixelHeight
   (
      This       : access ISvgImageSource_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function add_Opened
   (
      This       : access ISvgImageSource_Interface_Impl
      ; value : TypedEventHandler_ISvgImageSource_add_Opened
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_Opened
   (
      This       : access ISvgImageSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function add_OpenFailed
   (
      This       : access ISvgImageSource_Interface_Impl
      ; value : TypedEventHandler_ISvgImageSource_add_OpenFailed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function remove_OpenFailed
   (
      This       : access ISvgImageSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT;
   
   function SetSourceAsync
   (
      This       : access ISvgImageSource_Interface_Impl
      ; streamSource : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.IAsyncOperation_SvgImageSourceLoadStatus -- Generic Parameter Type
   )
   return Windows.HRESULT;
   
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_PixelWidthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PixelHeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.IBitmapSource;
   
   function get_PixelWidthProperty_IRenderTargetBitmap
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PixelHeightProperty_IRenderTargetBitmap
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstanceWithDimensions
   (
      pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.ISurfaceImageSource;
   
   function CreateInstanceWithDimensionsAndOpacity
   (
      pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; isOpaque : Windows.Boolean
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.ISurfaceImageSource;
   
   function get_IsAnimatedBitmapProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_IsPlayingProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_AutoPlayProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CreateOptionsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_UriSourceProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DecodePixelWidthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DecodePixelHeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DecodePixelTypeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTask;
   
   function get_UriSourceProperty_ISvgImageSource
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RasterizePixelWidthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RasterizePixelHeightProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.ISvgImageSource;
   
   function CreateInstanceWithUriSource
   (
      uriSource : Windows.Foundation.IUriRuntimeClass
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.ISvgImageSource;
   

end;
