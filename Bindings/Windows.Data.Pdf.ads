--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.UI;
with Windows; use Windows;
limited with Windows.Storage.Streams;
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.Data.Pdf is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PdfPageRotation is (
      Normal,
      Rotate90,
      Rotate180,
      Rotate270
   );
   for PdfPageRotation use (
      Normal => 0,
      Rotate90 => 1,
      Rotate180 => 2,
      Rotate270 => 3
   );
   for PdfPageRotation'Size use 32;
   
   type PdfPageRotation_Ptr is access PdfPageRotation;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IPdfDocument_Interface;
   type AsyncOperationCompletedHandler_IPdfDocument is access all AsyncOperationCompletedHandler_IPdfDocument_Interface'Class;
   type AsyncOperationCompletedHandler_IPdfDocument_Ptr is access all AsyncOperationCompletedHandler_IPdfDocument;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPdfPageDimensions_Interface;
   type IPdfPageDimensions is access all IPdfPageDimensions_Interface'Class;
   type IPdfPageDimensions_Ptr is access all IPdfPageDimensions;
   type IPdfPageRenderOptions_Interface;
   type IPdfPageRenderOptions is access all IPdfPageRenderOptions_Interface'Class;
   type IPdfPageRenderOptions_Ptr is access all IPdfPageRenderOptions;
   type IPdfPage_Interface;
   type IPdfPage is access all IPdfPage_Interface'Class;
   type IPdfPage_Ptr is access all IPdfPage;
   type IPdfDocument_Interface;
   type IPdfDocument is access all IPdfDocument_Interface'Class;
   type IPdfDocument_Ptr is access all IPdfDocument;
   type IPdfDocumentStatics_Interface;
   type IPdfDocumentStatics is access all IPdfDocumentStatics_Interface'Class;
   type IPdfDocumentStatics_Ptr is access all IPdfDocumentStatics;
   type IAsyncOperation_IPdfDocument_Interface;
   type IAsyncOperation_IPdfDocument is access all IAsyncOperation_IPdfDocument_Interface'Class;
   type IAsyncOperation_IPdfDocument_Ptr is access all IAsyncOperation_IPdfDocument;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPdfPageDimensions : aliased constant Windows.IID := (571933809, 12606, 17640, (131, 93, 99, 163, 231, 98, 74, 16 ));
   
   type IPdfPageDimensions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MediaBox
   (
      This       : access IPdfPageDimensions_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_CropBox
   (
      This       : access IPdfPageDimensions_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_BleedBox
   (
      This       : access IPdfPageDimensions_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_TrimBox
   (
      This       : access IPdfPageDimensions_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_ArtBox
   (
      This       : access IPdfPageDimensions_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPdfPageRenderOptions : aliased constant Windows.IID := (1016595823, 47055, 19497, (154, 4, 82, 217, 2, 103, 244, 37 ));
   
   type IPdfPageRenderOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceRect
   (
      This       : access IPdfPageRenderOptions_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_SourceRect
   (
      This       : access IPdfPageRenderOptions_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_DestinationWidth
   (
      This       : access IPdfPageRenderOptions_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_DestinationWidth
   (
      This       : access IPdfPageRenderOptions_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DestinationHeight
   (
      This       : access IPdfPageRenderOptions_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_DestinationHeight
   (
      This       : access IPdfPageRenderOptions_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access IPdfPageRenderOptions_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundColor
   (
      This       : access IPdfPageRenderOptions_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_IsIgnoringHighContrast
   (
      This       : access IPdfPageRenderOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsIgnoringHighContrast
   (
      This       : access IPdfPageRenderOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapEncoderId
   (
      This       : access IPdfPageRenderOptions_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_BitmapEncoderId
   (
      This       : access IPdfPageRenderOptions_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPdfPage : aliased constant Windows.IID := (2645864648, 21280, 19708, (173, 118, 73, 63, 218, 208, 229, 148 ));
   
   type IPdfPage_Interface is interface and Windows.IInspectable_Interface;
   
   function RenderToStreamAsync
   (
      This       : access IPdfPage_Interface
      ; outputStream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RenderWithOptionsToStreamAsync
   (
      This       : access IPdfPage_Interface
      ; outputStream : Windows.Storage.Streams.IRandomAccessStream
      ; options : Windows.Data.Pdf.IPdfPageRenderOptions
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function PreparePageAsync
   (
      This       : access IPdfPage_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Index
   (
      This       : access IPdfPage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IPdfPage_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_Dimensions
   (
      This       : access IPdfPage_Interface
      ; RetVal : access Windows.Data.Pdf.IPdfPageDimensions
   )
   return Windows.HRESULT is abstract;
   
   function get_Rotation
   (
      This       : access IPdfPage_Interface
      ; RetVal : access Windows.Data.Pdf.PdfPageRotation
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferredZoom
   (
      This       : access IPdfPage_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPdfDocument : aliased constant Windows.IID := (2893987549, 33018, 16521, (132, 110, 129, 183, 127, 245, 168, 108 ));
   
   type IPdfDocument_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPage
   (
      This       : access IPdfDocument_Interface
      ; pageIndex : Windows.UInt32
      ; RetVal : access Windows.Data.Pdf.IPdfPage
   )
   return Windows.HRESULT is abstract;
   
   function get_PageCount
   (
      This       : access IPdfDocument_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPasswordProtected
   (
      This       : access IPdfDocument_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPdfDocumentStatics : aliased constant Windows.IID := (1127877471, 49159, 18312, (144, 242, 8, 20, 61, 146, 37, 153 ));
   
   type IPdfDocumentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadFromFileAsync
   (
      This       : access IPdfDocumentStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Data.Pdf.IAsyncOperation_IPdfDocument -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadFromFileWithPasswordAsync
   (
      This       : access IPdfDocumentStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; password : Windows.String
      ; RetVal : access Windows.Data.Pdf.IAsyncOperation_IPdfDocument -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadFromStreamAsync
   (
      This       : access IPdfDocumentStatics_Interface
      ; inputStream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Data.Pdf.IAsyncOperation_IPdfDocument -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LoadFromStreamWithPasswordAsync
   (
      This       : access IPdfDocumentStatics_Interface
      ; inputStream : Windows.Storage.Streams.IRandomAccessStream
      ; password : Windows.String
      ; RetVal : access Windows.Data.Pdf.IAsyncOperation_IPdfDocument -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPdfDocument : aliased constant Windows.IID := (3601950444, 2458, 24290, (173, 46, 244, 200, 134, 20, 170, 187 ));
   
   type IAsyncOperation_IPdfDocument_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPdfDocument_Interface
      ; handler : Windows.Data.Pdf.AsyncOperationCompletedHandler_IPdfDocument
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPdfDocument_Interface
      ; RetVal : access Windows.Data.Pdf.AsyncOperationCompletedHandler_IPdfDocument
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPdfDocument_Interface
      ; RetVal : access Windows.Data.Pdf.IPdfDocument
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPdfDocument : aliased constant Windows.IID := (2370392243, 25245, 23933, (132, 204, 4, 192, 220, 247, 148, 43 ));
   
   type AsyncOperationCompletedHandler_IPdfDocument_Interface(Callback : access procedure (asyncInfo : Windows.Data.Pdf.IAsyncOperation_IPdfDocument ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPdfDocument'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPdfDocument_Interface
      ; asyncInfo : Windows.Data.Pdf.IAsyncOperation_IPdfDocument
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PdfPageRenderOptions is Windows.Data.Pdf.IPdfPageRenderOptions;
   function Create return Windows.Data.Pdf.IPdfPageRenderOptions;
   
   subtype PdfPageDimensions is Windows.Data.Pdf.IPdfPageDimensions;
   subtype PdfPage is Windows.Data.Pdf.IPdfPage;
   subtype PdfDocument is Windows.Data.Pdf.IPdfDocument;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function LoadFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   
   function LoadFromFileWithPasswordAsync
   (
      file : Windows.Storage.IStorageFile
      ; password : Windows.String
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   
   function LoadFromStreamAsync
   (
      inputStream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   
   function LoadFromStreamWithPasswordAsync
   (
      inputStream : Windows.Storage.Streams.IRandomAccessStream
      ; password : Windows.String
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   
end;
