--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.Graphics.Printing;
with Windows.Foundation.Collections;
limited with Windows.Storage;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Devices.Scanners is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ImageScannerFormat is (
      Jpeg,
      Png,
      DeviceIndependentBitmap,
      Tiff,
      Xps,
      OpenXps,
      Pdf
   );
   for ImageScannerFormat use (
      Jpeg => 0,
      Png => 1,
      DeviceIndependentBitmap => 2,
      Tiff => 3,
      Xps => 4,
      OpenXps => 5,
      Pdf => 6
   );
   for ImageScannerFormat'Size use 32;
   
   type ImageScannerFormat_Ptr is access ImageScannerFormat;
   
   type ImageScannerAutoCroppingMode is (
      Disabled,
      SingleRegion,
      MultipleRegion
   );
   for ImageScannerAutoCroppingMode use (
      Disabled => 0,
      SingleRegion => 1,
      MultipleRegion => 2
   );
   for ImageScannerAutoCroppingMode'Size use 32;
   
   type ImageScannerAutoCroppingMode_Ptr is access ImageScannerAutoCroppingMode;
   
   type ImageScannerColorMode is (
      Color,
      Grayscale,
      Monochrome,
      AutoColor
   );
   for ImageScannerColorMode use (
      Color => 0,
      Grayscale => 1,
      Monochrome => 2,
      AutoColor => 3
   );
   for ImageScannerColorMode'Size use 32;
   
   type ImageScannerColorMode_Ptr is access ImageScannerColorMode;
   
   type ImageScannerScanSource is (
      Default,
      Flatbed,
      Feeder,
      AutoConfigured
   );
   for ImageScannerScanSource use (
      Default => 0,
      Flatbed => 1,
      Feeder => 2,
      AutoConfigured => 3
   );
   for ImageScannerScanSource'Size use 32;
   
   type ImageScannerScanSource_Ptr is access ImageScannerScanSource;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ScannerDeviceContract is null record;
   pragma Convention (C_Pass_By_Copy , ScannerDeviceContract);
   
   type ScannerDeviceContract_Ptr is access ScannerDeviceContract;
   
   type ImageScannerResolution is record
      DpiX : Windows.Single;
      DpiY : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , ImageScannerResolution);
   
   type ImageScannerResolution_Ptr is access ImageScannerResolution;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IImageScannerPreviewResult_Interface;
   type AsyncOperationCompletedHandler_IImageScannerPreviewResult is access all AsyncOperationCompletedHandler_IImageScannerPreviewResult_Interface'Class;
   type AsyncOperationCompletedHandler_IImageScannerPreviewResult_Ptr is access all AsyncOperationCompletedHandler_IImageScannerPreviewResult;
   type AsyncOperationCompletedHandler_IImageScanner_Interface;
   type AsyncOperationCompletedHandler_IImageScanner is access all AsyncOperationCompletedHandler_IImageScanner_Interface'Class;
   type AsyncOperationCompletedHandler_IImageScanner_Ptr is access all AsyncOperationCompletedHandler_IImageScanner;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IImageScannerFormatConfiguration_Interface;
   type IImageScannerFormatConfiguration is access all IImageScannerFormatConfiguration_Interface'Class;
   type IImageScannerFormatConfiguration_Ptr is access all IImageScannerFormatConfiguration;
   type IImageScannerSourceConfiguration_Interface;
   type IImageScannerSourceConfiguration is access all IImageScannerSourceConfiguration_Interface'Class;
   type IImageScannerSourceConfiguration_Ptr is access all IImageScannerSourceConfiguration;
   type IImageScannerFeederConfiguration_Interface;
   type IImageScannerFeederConfiguration is access all IImageScannerFeederConfiguration_Interface'Class;
   type IImageScannerFeederConfiguration_Ptr is access all IImageScannerFeederConfiguration;
   type IImageScannerScanResult_Interface;
   type IImageScannerScanResult is access all IImageScannerScanResult_Interface'Class;
   type IImageScannerScanResult_Ptr is access all IImageScannerScanResult;
   type IImageScannerPreviewResult_Interface;
   type IImageScannerPreviewResult is access all IImageScannerPreviewResult_Interface'Class;
   type IImageScannerPreviewResult_Ptr is access all IImageScannerPreviewResult;
   type IImageScanner_Interface;
   type IImageScanner is access all IImageScanner_Interface'Class;
   type IImageScanner_Ptr is access all IImageScanner;
   type IImageScannerStatics_Interface;
   type IImageScannerStatics is access all IImageScannerStatics_Interface'Class;
   type IImageScannerStatics_Ptr is access all IImageScannerStatics;
   type IAsyncOperation_IImageScannerPreviewResult_Interface;
   type IAsyncOperation_IImageScannerPreviewResult is access all IAsyncOperation_IImageScannerPreviewResult_Interface'Class;
   type IAsyncOperation_IImageScannerPreviewResult_Ptr is access all IAsyncOperation_IImageScannerPreviewResult;
   type IAsyncOperation_IImageScanner_Interface;
   type IAsyncOperation_IImageScanner is access all IAsyncOperation_IImageScanner_Interface'Class;
   type IAsyncOperation_IImageScanner_Ptr is access all IAsyncOperation_IImageScanner;
   
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
   type IImageScannerFormatConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DefaultFormat
   (
      This       : access IImageScannerFormatConfiguration_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Format
   (
      This       : access IImageScannerFormatConfiguration_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_Format
   (
      This       : access IImageScannerFormatConfiguration_Interface
      ; value : Windows.Devices.Scanners.ImageScannerFormat
   )
   return Windows.HRESULT is abstract;
   
   function IsFormatSupported
   (
      This       : access IImageScannerFormatConfiguration_Interface
      ; value : Windows.Devices.Scanners.ImageScannerFormat
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageScannerFormatConfiguration : aliased constant Windows.IID := (2921815313, 56031, 16400, (191, 16, 204, 165, 200, 61, 203, 176 ));
   
   ------------------------------------------------------------------------
   type IImageScannerSourceConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinScanArea
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxScanArea
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedScanRegion
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedScanRegion
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoCroppingMode
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerAutoCroppingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoCroppingMode
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; value : Windows.Devices.Scanners.ImageScannerAutoCroppingMode
   )
   return Windows.HRESULT is abstract;
   
   function IsAutoCroppingModeSupported
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; value : Windows.Devices.Scanners.ImageScannerAutoCroppingMode
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MinResolution
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerResolution
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxResolution
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerResolution
   )
   return Windows.HRESULT is abstract;
   
   function get_OpticalResolution
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerResolution
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredResolution
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerResolution
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredResolution
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; value : Windows.Devices.Scanners.ImageScannerResolution
   )
   return Windows.HRESULT is abstract;
   
   function get_ActualResolution
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerResolution
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultColorMode
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerColorMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorMode
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerColorMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ColorMode
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; value : Windows.Devices.Scanners.ImageScannerColorMode
   )
   return Windows.HRESULT is abstract;
   
   function IsColorModeSupported
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; value : Windows.Devices.Scanners.ImageScannerColorMode
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MinBrightness
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBrightness
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_BrightnessStep
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultBrightness
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Brightness
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Brightness
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MinContrast
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxContrast
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ContrastStep
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultContrast
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Contrast
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Contrast
   (
      This       : access IImageScannerSourceConfiguration_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageScannerSourceConfiguration : aliased constant Windows.IID := (3216310357, 2884, 19586, (158, 137, 32, 95, 156, 35, 78, 89 ));
   
   ------------------------------------------------------------------------
   type IImageScannerFeederConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanAutoDetectPageSize
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoDetectPageSize
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoDetectPageSize
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PageSize
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintMediaSize
   )
   return Windows.HRESULT is abstract;
   
   function put_PageSize
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; value : Windows.Graphics.Printing.PrintMediaSize
   )
   return Windows.HRESULT is abstract;
   
   function get_PageOrientation
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; RetVal : access Windows.Graphics.Printing.PrintOrientation
   )
   return Windows.HRESULT is abstract;
   
   function put_PageOrientation
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; value : Windows.Graphics.Printing.PrintOrientation
   )
   return Windows.HRESULT is abstract;
   
   function get_PageSizeDimensions
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function IsPageSizeSupported
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; pageSize : Windows.Graphics.Printing.PrintMediaSize
      ; pageOrientation : Windows.Graphics.Printing.PrintOrientation
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxNumberOfPages
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxNumberOfPages
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CanScanDuplex
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Duplex
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Duplex
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanScanAhead
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ScanAhead
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ScanAhead
   (
      This       : access IImageScannerFeederConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageScannerFeederConfiguration : aliased constant Windows.IID := (1958587630, 64151, 19479, (130, 128, 64, 227, 156, 109, 204, 103 ));
   
   ------------------------------------------------------------------------
   type IImageScannerScanResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ScannedFiles
   (
      This       : access IImageScannerScanResult_Interface
      ; RetVal : access Windows.Storage.IVectorView_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageScannerScanResult : aliased constant Windows.IID := (3373671629, 36919, 20040, (132, 193, 172, 9, 117, 7, 107, 197 ));
   
   ------------------------------------------------------------------------
   type IImageScannerPreviewResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Succeeded
   (
      This       : access IImageScannerPreviewResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Format
   (
      This       : access IImageScannerPreviewResult_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerFormat
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageScannerPreviewResult : aliased constant Windows.IID := (146275982, 34961, 17437, (190, 156, 23, 111, 161, 9, 200, 187 ));
   
   ------------------------------------------------------------------------
   type IImageScanner_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IImageScanner_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultScanSource
   (
      This       : access IImageScanner_Interface
      ; RetVal : access Windows.Devices.Scanners.ImageScannerScanSource
   )
   return Windows.HRESULT is abstract;
   
   function IsScanSourceSupported
   (
      This       : access IImageScanner_Interface
      ; value : Windows.Devices.Scanners.ImageScannerScanSource
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FlatbedConfiguration
   (
      This       : access IImageScanner_Interface
      ; RetVal : access Windows.Devices.Scanners.IImageScannerFormatConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function get_FeederConfiguration
   (
      This       : access IImageScanner_Interface
      ; RetVal : access Windows.Devices.Scanners.IImageScannerFormatConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoConfiguration
   (
      This       : access IImageScanner_Interface
      ; RetVal : access Windows.Devices.Scanners.IImageScannerFormatConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function IsPreviewSupported
   (
      This       : access IImageScanner_Interface
      ; scanSource : Windows.Devices.Scanners.ImageScannerScanSource
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ScanPreviewToStreamAsync
   (
      This       : access IImageScanner_Interface
      ; scanSource : Windows.Devices.Scanners.ImageScannerScanSource
      ; targetStream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Devices.Scanners.IAsyncOperation_IImageScannerPreviewResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ScanFilesToFolderAsync
   (
      This       : access IImageScanner_Interface
      ; scanSource : Windows.Devices.Scanners.ImageScannerScanSource
      ; storageFolder : Windows.Storage.IStorageFolder
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageScanner : aliased constant Windows.IID := (1403555704, 21144, 18592, (141, 163, 128, 135, 81, 150, 101, 224 ));
   
   ------------------------------------------------------------------------
   type IImageScannerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IImageScannerStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Scanners.IAsyncOperation_IImageScanner -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IImageScannerStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageScannerStatics : aliased constant Windows.IID := (3159877390, 55300, 17527, (159, 181, 185, 17, 181, 71, 56, 151 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IImageScannerPreviewResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IImageScannerPreviewResult_Interface
      ; handler : Windows.Devices.Scanners.AsyncOperationCompletedHandler_IImageScannerPreviewResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IImageScannerPreviewResult_Interface
      ; RetVal : access Windows.Devices.Scanners.AsyncOperationCompletedHandler_IImageScannerPreviewResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IImageScannerPreviewResult_Interface
      ; RetVal : access Windows.Devices.Scanners.IImageScannerPreviewResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IImageScannerPreviewResult : aliased constant Windows.IID := (796153711, 1176, 21320, (188, 59, 167, 13, 26, 119, 23, 24 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IImageScanner_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IImageScanner_Interface
      ; handler : Windows.Devices.Scanners.AsyncOperationCompletedHandler_IImageScanner
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IImageScanner_Interface
      ; RetVal : access Windows.Devices.Scanners.AsyncOperationCompletedHandler_IImageScanner
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IImageScanner_Interface
      ; RetVal : access Windows.Devices.Scanners.IImageScanner
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IImageScanner : aliased constant Windows.IID := (1977059126, 27730, 21790, (171, 95, 80, 103, 79, 50, 52, 49 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IImageScannerPreviewResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Scanners.IAsyncOperation_IImageScannerPreviewResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IImageScannerPreviewResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IImageScannerPreviewResult_Interface
      ; asyncInfo : Windows.Devices.Scanners.IAsyncOperation_IImageScannerPreviewResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IImageScannerPreviewResult : aliased constant Windows.IID := (3226772496, 44092, 21331, (177, 238, 232, 94, 120, 250, 243, 241 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IImageScanner_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Scanners.IAsyncOperation_IImageScanner ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IImageScanner_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IImageScanner_Interface
      ; asyncInfo : Windows.Devices.Scanners.IAsyncOperation_IImageScanner
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IImageScanner : aliased constant Windows.IID := (3009074868, 3488, 21057, (135, 255, 238, 243, 161, 136, 50, 67 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ImageScannerAutoConfiguration is Windows.Devices.Scanners.IImageScannerFormatConfiguration;
   subtype ImageScannerFlatbedConfiguration is Windows.Devices.Scanners.IImageScannerFormatConfiguration;
   subtype ImageScannerFeederConfiguration is Windows.Devices.Scanners.IImageScannerFormatConfiguration;
   subtype ImageScannerScanResult is Windows.Devices.Scanners.IImageScannerScanResult;
   subtype ImageScannerPreviewResult is Windows.Devices.Scanners.IImageScannerPreviewResult;
   subtype ImageScanner is Windows.Devices.Scanners.IImageScanner;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Scanners.IAsyncOperation_IImageScanner;
   
   function GetDeviceSelector
   return Windows.String;

end;
