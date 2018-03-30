--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
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
   -- Record types
   ------------------------------------------------------------------------
   
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
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
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
   
   IID_IPdfPageDimensions : aliased constant Windows.IID := (571933809, 12606, 17640, (131, 93, 99, 163, 231, 98, 74, 16 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IPdfPageRenderOptions : aliased constant Windows.IID := (1016595823, 47055, 19497, (154, 4, 82, 217, 2, 103, 244, 37 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IPdfPage : aliased constant Windows.IID := (2645864648, 21280, 19708, (173, 118, 73, 63, 218, 208, 229, 148 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IPdfDocument : aliased constant Windows.IID := (2893987549, 33018, 16521, (132, 110, 129, 183, 127, 245, 168, 108 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IPdfDocumentStatics : aliased constant Windows.IID := (1127877471, 49159, 18312, (144, 242, 8, 20, 61, 146, 37, 153 ));
   
   ------------------------------------------------------------------------
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
   
   IID_IAsyncOperation_IPdfDocument : aliased constant Windows.IID := (3601950444, 2458, 24290, (173, 46, 244, 200, 134, 20, 170, 187 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPdfDocument_Interface(Callback : access procedure (asyncInfo : Windows.Data.Pdf.IAsyncOperation_IPdfDocument ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPdfDocument_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPdfDocument_Interface
      ; asyncInfo : Windows.Data.Pdf.IAsyncOperation_IPdfDocument
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPdfDocument : aliased constant Windows.IID := (2370392243, 25245, 23933, (132, 204, 4, 192, 220, 247, 148, 43 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PdfPageRenderOptions is Windows.Data.Pdf.IPdfPageRenderOptions;
   
   function CreatePdfPageRenderOptions return Windows.Data.Pdf.IPdfPageRenderOptions;
   
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
