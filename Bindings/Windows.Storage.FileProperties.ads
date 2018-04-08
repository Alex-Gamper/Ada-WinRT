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
limited with Windows.Devices.Geolocation;
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Storage.FileProperties is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PropertyPrefetchOptions is (
      None,
      MusicProperties_x,
      VideoProperties_x,
      ImageProperties_x,
      DocumentProperties_x,
      BasicProperties_x
   );
   for PropertyPrefetchOptions use (
      None => 0,
      MusicProperties_x => 1,
      VideoProperties_x => 2,
      ImageProperties_x => 4,
      DocumentProperties_x => 8,
      BasicProperties_x => 16
   );
   for PropertyPrefetchOptions'Size use 32;
   
   type PropertyPrefetchOptions_Ptr is access PropertyPrefetchOptions;
   
   type ThumbnailType is (
      Image,
      Icon
   );
   for ThumbnailType use (
      Image => 0,
      Icon => 1
   );
   for ThumbnailType'Size use 32;
   
   type ThumbnailType_Ptr is access ThumbnailType;
   
   type ThumbnailMode is (
      PicturesView,
      VideosView,
      MusicView,
      DocumentsView,
      ListView,
      SingleItem
   );
   for ThumbnailMode use (
      PicturesView => 0,
      VideosView => 1,
      MusicView => 2,
      DocumentsView => 3,
      ListView => 4,
      SingleItem => 5
   );
   for ThumbnailMode'Size use 32;
   
   type ThumbnailMode_Ptr is access ThumbnailMode;
   
   type ThumbnailOptions is (
      None,
      ReturnOnlyIfCached,
      ResizeThumbnail,
      UseCurrentScale
   );
   for ThumbnailOptions use (
      None => 0,
      ReturnOnlyIfCached => 1,
      ResizeThumbnail => 2,
      UseCurrentScale => 4
   );
   for ThumbnailOptions'Size use 32;
   
   type ThumbnailOptions_Ptr is access ThumbnailOptions;
   
   type PhotoOrientation is (
      Unspecified,
      Normal,
      FlipHorizontal,
      Rotate180,
      FlipVertical,
      Transpose,
      Rotate270,
      Transverse,
      Rotate90
   );
   for PhotoOrientation use (
      Unspecified => 0,
      Normal => 1,
      FlipHorizontal => 2,
      Rotate180 => 3,
      FlipVertical => 4,
      Transpose => 5,
      Rotate270 => 6,
      Transverse => 7,
      Rotate90 => 8
   );
   for PhotoOrientation'Size use 32;
   
   type PhotoOrientation_Ptr is access PhotoOrientation;
   
   type VideoOrientation is (
      Normal,
      Rotate90,
      Rotate180,
      Rotate270
   );
   for VideoOrientation use (
      Normal => 0,
      Rotate90 => 90,
      Rotate180 => 180,
      Rotate270 => 270
   );
   for VideoOrientation'Size use 32;
   
   type VideoOrientation_Ptr is access VideoOrientation;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMusicProperties_Interface;
   type AsyncOperationCompletedHandler_IMusicProperties is access all AsyncOperationCompletedHandler_IMusicProperties_Interface'Class;
   type AsyncOperationCompletedHandler_IMusicProperties_Ptr is access all AsyncOperationCompletedHandler_IMusicProperties;
   type AsyncOperationCompletedHandler_IVideoProperties_Interface;
   type AsyncOperationCompletedHandler_IVideoProperties is access all AsyncOperationCompletedHandler_IVideoProperties_Interface'Class;
   type AsyncOperationCompletedHandler_IVideoProperties_Ptr is access all AsyncOperationCompletedHandler_IVideoProperties;
   type AsyncOperationCompletedHandler_IImageProperties_Interface;
   type AsyncOperationCompletedHandler_IImageProperties is access all AsyncOperationCompletedHandler_IImageProperties_Interface'Class;
   type AsyncOperationCompletedHandler_IImageProperties_Ptr is access all AsyncOperationCompletedHandler_IImageProperties;
   type AsyncOperationCompletedHandler_IDocumentProperties_Interface;
   type AsyncOperationCompletedHandler_IDocumentProperties is access all AsyncOperationCompletedHandler_IDocumentProperties_Interface'Class;
   type AsyncOperationCompletedHandler_IDocumentProperties_Ptr is access all AsyncOperationCompletedHandler_IDocumentProperties;
   type AsyncOperationCompletedHandler_IBasicProperties_Interface;
   type AsyncOperationCompletedHandler_IBasicProperties is access all AsyncOperationCompletedHandler_IBasicProperties_Interface'Class;
   type AsyncOperationCompletedHandler_IBasicProperties_Ptr is access all AsyncOperationCompletedHandler_IBasicProperties;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGeotagHelperStatics_Interface;
   type IGeotagHelperStatics is access all IGeotagHelperStatics_Interface'Class;
   type IGeotagHelperStatics_Ptr is access all IGeotagHelperStatics;
   type IThumbnailProperties_Interface;
   type IThumbnailProperties is access all IThumbnailProperties_Interface'Class;
   type IThumbnailProperties_Ptr is access all IThumbnailProperties;
   type IStorageItemExtraProperties_Interface;
   type IStorageItemExtraProperties is access all IStorageItemExtraProperties_Interface'Class;
   type IStorageItemExtraProperties_Ptr is access all IStorageItemExtraProperties;
   type IStorageItemContentProperties_Interface;
   type IStorageItemContentProperties is access all IStorageItemContentProperties_Interface'Class;
   type IStorageItemContentProperties_Ptr is access all IStorageItemContentProperties;
   type IMusicProperties_Interface;
   type IMusicProperties is access all IMusicProperties_Interface'Class;
   type IMusicProperties_Ptr is access all IMusicProperties;
   type IImageProperties_Interface;
   type IImageProperties is access all IImageProperties_Interface'Class;
   type IImageProperties_Ptr is access all IImageProperties;
   type IVideoProperties_Interface;
   type IVideoProperties is access all IVideoProperties_Interface'Class;
   type IVideoProperties_Ptr is access all IVideoProperties;
   type IDocumentProperties_Interface;
   type IDocumentProperties is access all IDocumentProperties_Interface'Class;
   type IDocumentProperties_Ptr is access all IDocumentProperties;
   type IBasicProperties_Interface;
   type IBasicProperties is access all IBasicProperties_Interface'Class;
   type IBasicProperties_Ptr is access all IBasicProperties;
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
   type IAsyncOperation_IMusicProperties_Interface;
   type IAsyncOperation_IMusicProperties is access all IAsyncOperation_IMusicProperties_Interface'Class;
   type IAsyncOperation_IMusicProperties_Ptr is access all IAsyncOperation_IMusicProperties;
   type IAsyncOperation_IVideoProperties_Interface;
   type IAsyncOperation_IVideoProperties is access all IAsyncOperation_IVideoProperties_Interface'Class;
   type IAsyncOperation_IVideoProperties_Ptr is access all IAsyncOperation_IVideoProperties;
   type IAsyncOperation_IImageProperties_Interface;
   type IAsyncOperation_IImageProperties is access all IAsyncOperation_IImageProperties_Interface'Class;
   type IAsyncOperation_IImageProperties_Ptr is access all IAsyncOperation_IImageProperties;
   type IAsyncOperation_IDocumentProperties_Interface;
   type IAsyncOperation_IDocumentProperties is access all IAsyncOperation_IDocumentProperties_Interface'Class;
   type IAsyncOperation_IDocumentProperties_Ptr is access all IAsyncOperation_IDocumentProperties;
   type IAsyncOperation_IBasicProperties_Interface;
   type IAsyncOperation_IBasicProperties is access all IAsyncOperation_IBasicProperties_Interface'Class;
   type IAsyncOperation_IBasicProperties_Ptr is access all IAsyncOperation_IBasicProperties;
   
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
   
   IID_IGeotagHelperStatics : aliased constant Windows.IID := (1095316036, 9508, 18005, (134, 166, 237, 22, 245, 252, 113, 107 ));
   
   type IGeotagHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetGeotagAsync
   (
      This       : access IGeotagHelperStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Devices.Geolocation.IAsyncOperation_IGeopoint -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetGeotagFromGeolocatorAsync
   (
      This       : access IGeotagHelperStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; geolocator : Windows.Devices.Geolocation.IGeolocator
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetGeotagAsync
   (
      This       : access IGeotagHelperStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; geopoint : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IThumbnailProperties : aliased constant Windows.IID := (1765659695, 56295, 18869, (179, 179, 40, 147, 172, 93, 52, 35 ));
   
   type IThumbnailProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OriginalWidth
   (
      This       : access IThumbnailProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginalHeight
   (
      This       : access IThumbnailProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReturnedSmallerCachedSize
   (
      This       : access IThumbnailProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IThumbnailProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.ThumbnailType
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStorageItemExtraProperties : aliased constant Windows.IID := (3309527474, 21709, 17195, (189, 188, 75, 25, 196, 180, 112, 215 ));
   
   type IStorageItemExtraProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function RetrievePropertiesAsync
   (
      This       : access IStorageItemExtraProperties_Interface
      ; propertiesToRetrieve : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SavePropertiesAsync
   (
      This       : access IStorageItemExtraProperties_Interface
      ; propertiesToSave : Windows.Address
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SavePropertiesAsyncOverloadDefault
   (
      This       : access IStorageItemExtraProperties_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IStorageItemContentProperties : aliased constant Windows.IID := (86592429, 48184, 18623, (133, 215, 119, 14, 14, 42, 224, 186 ));
   
   type IStorageItemContentProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function GetMusicPropertiesAsync
   (
      This       : access IStorageItemContentProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.IAsyncOperation_IMusicProperties -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetVideoPropertiesAsync
   (
      This       : access IStorageItemContentProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.IAsyncOperation_IVideoProperties -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetImagePropertiesAsync
   (
      This       : access IStorageItemContentProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.IAsyncOperation_IImageProperties -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDocumentPropertiesAsync
   (
      This       : access IStorageItemContentProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.IAsyncOperation_IDocumentProperties -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMusicProperties : aliased constant Windows.IID := (3163204450, 26348, 16794, (188, 93, 202, 101, 164, 203, 70, 218 ));
   
   type IMusicProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Album
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Album
   (
      This       : access IMusicProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Artist
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Artist
   (
      This       : access IMusicProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Genre
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TrackNumber
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_TrackNumber
   (
      This       : access IMusicProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IMusicProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Rating
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Rating
   (
      This       : access IMusicProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Bitrate
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AlbumArtist
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AlbumArtist
   (
      This       : access IMusicProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Composers
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Conductors
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Subtitle
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Subtitle
   (
      This       : access IMusicProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Producers
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Publisher
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Publisher
   (
      This       : access IMusicProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Writers
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Year
   (
      This       : access IMusicProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Year
   (
      This       : access IMusicProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IImageProperties : aliased constant Windows.IID := (1379701796, 64767, 17013, (175, 238, 236, 219, 154, 180, 121, 115 ));
   
   type IImageProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Rating
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Rating
   (
      This       : access IImageProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Keywords
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DateTaken
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_DateTaken
   (
      This       : access IImageProperties_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IImageProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Latitude
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Longitude
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraManufacturer
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CameraManufacturer
   (
      This       : access IImageProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraModel
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CameraModel
   (
      This       : access IImageProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.PhotoOrientation
   )
   return Windows.HRESULT is abstract;
   
   function get_PeopleNames
   (
      This       : access IImageProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVideoProperties : aliased constant Windows.IID := (1905976583, 26846, 19896, (151, 222, 73, 153, 140, 5, 159, 47 ));
   
   type IVideoProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Rating
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Rating
   (
      This       : access IVideoProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Keywords
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Latitude
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Longitude
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IVideoProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subtitle
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Subtitle
   (
      This       : access IVideoProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Producers
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Publisher
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Publisher
   (
      This       : access IVideoProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Writers
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Year
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Year
   (
      This       : access IVideoProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Bitrate
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Directors
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access IVideoProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.VideoOrientation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDocumentProperties : aliased constant Windows.IID := (2125142460, 6177, 18723, (180, 169, 10, 234, 64, 77, 0, 112 ));
   
   type IDocumentProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Author
   (
      This       : access IDocumentProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IDocumentProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IDocumentProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Keywords
   (
      This       : access IDocumentProperties_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Comment
   (
      This       : access IDocumentProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Comment
   (
      This       : access IDocumentProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IBasicProperties : aliased constant Windows.IID := (3495777755, 30814, 19046, (190, 2, 155, 238, 197, 138, 234, 129 ));
   
   type IBasicProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Size
   (
      This       : access IBasicProperties_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_DateModified
   (
      This       : access IBasicProperties_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemDate
   (
      This       : access IBasicProperties_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
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
   
   IID_IAsyncOperation_IMusicProperties : aliased constant Windows.IID := (218250102, 8359, 22259, (132, 171, 206, 49, 230, 84, 75, 113 ));
   
   type IAsyncOperation_IMusicProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMusicProperties_Interface
      ; handler : Windows.Storage.FileProperties.AsyncOperationCompletedHandler_IMusicProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMusicProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.AsyncOperationCompletedHandler_IMusicProperties
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMusicProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.IMusicProperties
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IVideoProperties : aliased constant Windows.IID := (1149060496, 54265, 22719, (172, 88, 111, 154, 80, 131, 158, 254 ));
   
   type IAsyncOperation_IVideoProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IVideoProperties_Interface
      ; handler : Windows.Storage.FileProperties.AsyncOperationCompletedHandler_IVideoProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IVideoProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.AsyncOperationCompletedHandler_IVideoProperties
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IVideoProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.IVideoProperties
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IImageProperties : aliased constant Windows.IID := (4241519889, 59384, 23514, (140, 4, 121, 90, 99, 157, 174, 143 ));
   
   type IAsyncOperation_IImageProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IImageProperties_Interface
      ; handler : Windows.Storage.FileProperties.AsyncOperationCompletedHandler_IImageProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IImageProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.AsyncOperationCompletedHandler_IImageProperties
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IImageProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.IImageProperties
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IDocumentProperties : aliased constant Windows.IID := (1820780924, 22169, 22272, (141, 53, 211, 80, 173, 62, 77, 242 ));
   
   type IAsyncOperation_IDocumentProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDocumentProperties_Interface
      ; handler : Windows.Storage.FileProperties.AsyncOperationCompletedHandler_IDocumentProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDocumentProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.AsyncOperationCompletedHandler_IDocumentProperties
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDocumentProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.IDocumentProperties
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IBasicProperties : aliased constant Windows.IID := (1367741210, 17511, 20555, (151, 122, 7, 133, 168, 35, 4, 133 ));
   
   type IAsyncOperation_IBasicProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBasicProperties_Interface
      ; handler : Windows.Storage.FileProperties.AsyncOperationCompletedHandler_IBasicProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBasicProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.AsyncOperationCompletedHandler_IBasicProperties
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBasicProperties_Interface
      ; RetVal : access Windows.Storage.FileProperties.IBasicProperties
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMusicProperties : aliased constant Windows.IID := (3628995346, 54881, 23423, (149, 102, 116, 33, 189, 237, 193, 234 ));
   
   type AsyncOperationCompletedHandler_IMusicProperties_Interface(Callback : access procedure (asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IMusicProperties ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMusicProperties'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMusicProperties_Interface
      ; asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IMusicProperties
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IVideoProperties : aliased constant Windows.IID := (1128275252, 25003, 23794, (146, 31, 85, 182, 22, 99, 29, 29 ));
   
   type AsyncOperationCompletedHandler_IVideoProperties_Interface(Callback : access procedure (asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IVideoProperties ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IVideoProperties'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVideoProperties_Interface
      ; asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IVideoProperties
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IImageProperties : aliased constant Windows.IID := (3325503932, 58563, 22092, (177, 55, 44, 180, 245, 150, 106, 131 ));
   
   type AsyncOperationCompletedHandler_IImageProperties_Interface(Callback : access procedure (asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IImageProperties ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IImageProperties'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IImageProperties_Interface
      ; asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IImageProperties
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IDocumentProperties : aliased constant Windows.IID := (1146285388, 25643, 20507, (150, 23, 125, 104, 180, 172, 60, 102 ));
   
   type AsyncOperationCompletedHandler_IDocumentProperties_Interface(Callback : access procedure (asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IDocumentProperties ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IDocumentProperties'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDocumentProperties_Interface
      ; asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IDocumentProperties
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IBasicProperties : aliased constant Windows.IID := (3362101934, 18726, 21165, (143, 96, 216, 159, 229, 168, 223, 95 ));
   
   type AsyncOperationCompletedHandler_IBasicProperties_Interface(Callback : access procedure (asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IBasicProperties ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IBasicProperties'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBasicProperties_Interface
      ; asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IBasicProperties
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype StorageItemThumbnail is Windows.Storage.Streams.IRandomAccessStreamWithContentType;
   subtype MusicProperties is Windows.Storage.FileProperties.IMusicProperties;
   subtype VideoProperties is Windows.Storage.FileProperties.IVideoProperties;
   subtype ImageProperties is Windows.Storage.FileProperties.IImageProperties;
   subtype DocumentProperties is Windows.Storage.FileProperties.IDocumentProperties;
   subtype StorageItemContentProperties is Windows.Storage.FileProperties.IStorageItemContentProperties;
   subtype BasicProperties is Windows.Storage.FileProperties.IBasicProperties;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetGeotagAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Devices.Geolocation.IAsyncOperation_IGeopoint;
   
   function SetGeotagFromGeolocatorAsync
   (
      file : Windows.Storage.IStorageFile
      ; geolocator : Windows.Devices.Geolocation.IGeolocator
   )
   return Windows.Foundation.IAsyncAction;
   
   function SetGeotagAsync
   (
      file : Windows.Storage.IStorageFile
      ; geopoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Foundation.IAsyncAction;

end;
