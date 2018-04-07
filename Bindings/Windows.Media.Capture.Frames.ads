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
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Media.Devices.Core;
limited with Windows.Devices.Enumeration;
with Windows; use Windows;
limited with Windows.Perception.Spatial;
limited with Windows.Media.Devices;
limited with Windows.Media.MediaProperties;
limited with Windows.Storage.Streams;
limited with Windows.Graphics.Imaging;
limited with Windows.Graphics.DirectX.Direct3D11;
--------------------------------------------------------------------------------
package Windows.Media.Capture.Frames is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MediaFrameReaderStartStatus is (
      Success,
      UnknownFailure,
      DeviceNotAvailable,
      OutputFormatNotSupported,
      ExclusiveControlNotAvailable
   );
   for MediaFrameReaderStartStatus use (
      Success => 0,
      UnknownFailure => 1,
      DeviceNotAvailable => 2,
      OutputFormatNotSupported => 3,
      ExclusiveControlNotAvailable => 4
   );
   for MediaFrameReaderStartStatus'Size use 32;
   
   type MediaFrameReaderStartStatus_Ptr is access MediaFrameReaderStartStatus;
   
   type MediaFrameSourceSetPropertyStatus is (
      Success,
      UnknownFailure,
      NotSupported,
      InvalidValue,
      DeviceNotAvailable,
      NotInControl
   );
   for MediaFrameSourceSetPropertyStatus use (
      Success => 0,
      UnknownFailure => 1,
      NotSupported => 2,
      InvalidValue => 3,
      DeviceNotAvailable => 4,
      NotInControl => 5
   );
   for MediaFrameSourceSetPropertyStatus'Size use 32;
   
   type MediaFrameSourceSetPropertyStatus_Ptr is access MediaFrameSourceSetPropertyStatus;
   
   type MediaFrameSourceGetPropertyStatus is (
      Success,
      UnknownFailure,
      NotSupported,
      DeviceNotAvailable,
      MaxPropertyValueSizeTooSmall,
      MaxPropertyValueSizeRequired
   );
   for MediaFrameSourceGetPropertyStatus use (
      Success => 0,
      UnknownFailure => 1,
      NotSupported => 2,
      DeviceNotAvailable => 3,
      MaxPropertyValueSizeTooSmall => 4,
      MaxPropertyValueSizeRequired => 5
   );
   for MediaFrameSourceGetPropertyStatus'Size use 32;
   
   type MediaFrameSourceGetPropertyStatus_Ptr is access MediaFrameSourceGetPropertyStatus;
   
   type MediaFrameSourceKind is (
      Custom,
      Color,
      Infrared,
      Depth
   );
   for MediaFrameSourceKind use (
      Custom => 0,
      Color => 1,
      Infrared => 2,
      Depth => 3
   );
   for MediaFrameSourceKind'Size use 32;
   
   type MediaFrameSourceKind_Ptr is access MediaFrameSourceKind;
   
   type MultiSourceMediaFrameReaderStartStatus is (
      Success,
      NotSupported,
      InsufficientResources,
      DeviceNotAvailable,
      UnknownFailure
   );
   for MultiSourceMediaFrameReaderStartStatus use (
      Success => 0,
      NotSupported => 1,
      InsufficientResources => 2,
      DeviceNotAvailable => 3,
      UnknownFailure => 4
   );
   for MultiSourceMediaFrameReaderStartStatus'Size use 32;
   
   type MultiSourceMediaFrameReaderStartStatus_Ptr is access MultiSourceMediaFrameReaderStartStatus;
   
   type MediaFrameReaderAcquisitionMode is (
      Realtime,
      Buffered
   );
   for MediaFrameReaderAcquisitionMode use (
      Realtime => 0,
      Buffered => 1
   );
   for MediaFrameReaderAcquisitionMode'Size use 32;
   
   type MediaFrameReaderAcquisitionMode_Ptr is access MediaFrameReaderAcquisitionMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMediaFrameReader_Interface;
   type AsyncOperationCompletedHandler_IMediaFrameReader is access all AsyncOperationCompletedHandler_IMediaFrameReader_Interface'Class;
   type AsyncOperationCompletedHandler_IMediaFrameReader_Ptr is access all AsyncOperationCompletedHandler_IMediaFrameReader;
   type AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader_Interface;
   type AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader is access all AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader_Interface'Class;
   type AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader_Ptr is access all AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader;
   type AsyncOperationCompletedHandler_IMediaFrameSourceGroup_Interface;
   type AsyncOperationCompletedHandler_IMediaFrameSourceGroup is access all AsyncOperationCompletedHandler_IMediaFrameSourceGroup_Interface'Class;
   type AsyncOperationCompletedHandler_IMediaFrameSourceGroup_Ptr is access all AsyncOperationCompletedHandler_IMediaFrameSourceGroup;
   type TypedEventHandler_IMediaFrameSource_add_FormatChanged_Interface;
   type TypedEventHandler_IMediaFrameSource_add_FormatChanged is access all TypedEventHandler_IMediaFrameSource_add_FormatChanged_Interface'Class;
   type TypedEventHandler_IMediaFrameSource_add_FormatChanged_Ptr is access all TypedEventHandler_IMediaFrameSource_add_FormatChanged;
   type TypedEventHandler_IMediaFrameReader_add_FrameArrived_Interface;
   type TypedEventHandler_IMediaFrameReader_add_FrameArrived is access all TypedEventHandler_IMediaFrameReader_add_FrameArrived_Interface'Class;
   type TypedEventHandler_IMediaFrameReader_add_FrameArrived_Ptr is access all TypedEventHandler_IMediaFrameReader_add_FrameArrived;
   type AsyncOperationCompletedHandler_MediaFrameReaderStartStatus_Interface;
   type AsyncOperationCompletedHandler_MediaFrameReaderStartStatus is access all AsyncOperationCompletedHandler_MediaFrameReaderStartStatus_Interface'Class;
   type AsyncOperationCompletedHandler_MediaFrameReaderStartStatus_Ptr is access all AsyncOperationCompletedHandler_MediaFrameReaderStartStatus;
   type TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived_Interface;
   type TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived is access all TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived_Interface'Class;
   type TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived_Ptr is access all TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived;
   type AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus_Interface;
   type AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus is access all AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus_Interface'Class;
   type AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus_Ptr is access all AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus;
   type AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult_Interface;
   type AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult is access all AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult_Ptr is access all AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult;
   type AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus_Interface;
   type AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus is access all AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus_Interface'Class;
   type AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus_Ptr is access all AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMediaFrameSourceGroup_Interface;
   type IMediaFrameSourceGroup is access all IMediaFrameSourceGroup_Interface'Class;
   type IMediaFrameSourceGroup_Ptr is access all IMediaFrameSourceGroup;
   type IMediaFrameSourceGroupStatics_Interface;
   type IMediaFrameSourceGroupStatics is access all IMediaFrameSourceGroupStatics_Interface'Class;
   type IMediaFrameSourceGroupStatics_Ptr is access all IMediaFrameSourceGroupStatics;
   type IMediaFrameSourceInfo_Interface;
   type IMediaFrameSourceInfo is access all IMediaFrameSourceInfo_Interface'Class;
   type IMediaFrameSourceInfo_Ptr is access all IMediaFrameSourceInfo;
   type IMediaFrameSource_Interface;
   type IMediaFrameSource is access all IMediaFrameSource_Interface'Class;
   type IMediaFrameSource_Ptr is access all IMediaFrameSource;
   type IMediaFrameArrivedEventArgs_Interface;
   type IMediaFrameArrivedEventArgs is access all IMediaFrameArrivedEventArgs_Interface'Class;
   type IMediaFrameArrivedEventArgs_Ptr is access all IMediaFrameArrivedEventArgs;
   type IMediaFrameReader_Interface;
   type IMediaFrameReader is access all IMediaFrameReader_Interface'Class;
   type IMediaFrameReader_Ptr is access all IMediaFrameReader;
   type IMediaFrameReader2_Interface;
   type IMediaFrameReader2 is access all IMediaFrameReader2_Interface'Class;
   type IMediaFrameReader2_Ptr is access all IMediaFrameReader2;
   type IMultiSourceMediaFrameArrivedEventArgs_Interface;
   type IMultiSourceMediaFrameArrivedEventArgs is access all IMultiSourceMediaFrameArrivedEventArgs_Interface'Class;
   type IMultiSourceMediaFrameArrivedEventArgs_Ptr is access all IMultiSourceMediaFrameArrivedEventArgs;
   type IMultiSourceMediaFrameReader_Interface;
   type IMultiSourceMediaFrameReader is access all IMultiSourceMediaFrameReader_Interface'Class;
   type IMultiSourceMediaFrameReader_Ptr is access all IMultiSourceMediaFrameReader;
   type IMultiSourceMediaFrameReader2_Interface;
   type IMultiSourceMediaFrameReader2 is access all IMultiSourceMediaFrameReader2_Interface'Class;
   type IMultiSourceMediaFrameReader2_Ptr is access all IMultiSourceMediaFrameReader2;
   type IMediaFrameSourceController_Interface;
   type IMediaFrameSourceController is access all IMediaFrameSourceController_Interface'Class;
   type IMediaFrameSourceController_Ptr is access all IMediaFrameSourceController;
   type IMediaFrameSourceController2_Interface;
   type IMediaFrameSourceController2 is access all IMediaFrameSourceController2_Interface'Class;
   type IMediaFrameSourceController2_Ptr is access all IMediaFrameSourceController2;
   type IMediaFrameSourceGetPropertyResult_Interface;
   type IMediaFrameSourceGetPropertyResult is access all IMediaFrameSourceGetPropertyResult_Interface'Class;
   type IMediaFrameSourceGetPropertyResult_Ptr is access all IMediaFrameSourceGetPropertyResult;
   type IMediaFrameFormat_Interface;
   type IMediaFrameFormat is access all IMediaFrameFormat_Interface'Class;
   type IMediaFrameFormat_Ptr is access all IMediaFrameFormat;
   type IVideoMediaFrameFormat_Interface;
   type IVideoMediaFrameFormat is access all IVideoMediaFrameFormat_Interface'Class;
   type IVideoMediaFrameFormat_Ptr is access all IVideoMediaFrameFormat;
   type IMediaFrameReference_Interface;
   type IMediaFrameReference is access all IMediaFrameReference_Interface'Class;
   type IMediaFrameReference_Ptr is access all IMediaFrameReference;
   type IMultiSourceMediaFrameReference_Interface;
   type IMultiSourceMediaFrameReference is access all IMultiSourceMediaFrameReference_Interface'Class;
   type IMultiSourceMediaFrameReference_Ptr is access all IMultiSourceMediaFrameReference;
   type IBufferMediaFrame_Interface;
   type IBufferMediaFrame is access all IBufferMediaFrame_Interface'Class;
   type IBufferMediaFrame_Ptr is access all IBufferMediaFrame;
   type IVideoMediaFrame_Interface;
   type IVideoMediaFrame is access all IVideoMediaFrame_Interface'Class;
   type IVideoMediaFrame_Ptr is access all IVideoMediaFrame;
   type IInfraredMediaFrame_Interface;
   type IInfraredMediaFrame is access all IInfraredMediaFrame_Interface'Class;
   type IInfraredMediaFrame_Ptr is access all IInfraredMediaFrame;
   type IDepthMediaFrame_Interface;
   type IDepthMediaFrame is access all IDepthMediaFrame_Interface'Class;
   type IDepthMediaFrame_Ptr is access all IDepthMediaFrame;
   type IDepthMediaFrame2_Interface;
   type IDepthMediaFrame2 is access all IDepthMediaFrame2_Interface'Class;
   type IDepthMediaFrame2_Ptr is access all IDepthMediaFrame2;
   type IDepthMediaFrameFormat_Interface;
   type IDepthMediaFrameFormat is access all IDepthMediaFrameFormat_Interface'Class;
   type IDepthMediaFrameFormat_Ptr is access all IDepthMediaFrameFormat;
   type IAsyncOperation_IMediaFrameReader_Interface;
   type IAsyncOperation_IMediaFrameReader is access all IAsyncOperation_IMediaFrameReader_Interface'Class;
   type IAsyncOperation_IMediaFrameReader_Ptr is access all IAsyncOperation_IMediaFrameReader;
   type IAsyncOperation_IMultiSourceMediaFrameReader_Interface;
   type IAsyncOperation_IMultiSourceMediaFrameReader is access all IAsyncOperation_IMultiSourceMediaFrameReader_Interface'Class;
   type IAsyncOperation_IMultiSourceMediaFrameReader_Ptr is access all IAsyncOperation_IMultiSourceMediaFrameReader;
   type IIterator_IMediaFrameSource_Interface;
   type IIterator_IMediaFrameSource is access all IIterator_IMediaFrameSource_Interface'Class;
   type IIterator_IMediaFrameSource_Ptr is access all IIterator_IMediaFrameSource;
   type IIterable_IMediaFrameSource_Interface;
   type IIterable_IMediaFrameSource is access all IIterable_IMediaFrameSource_Interface'Class;
   type IIterable_IMediaFrameSource_Ptr is access all IIterable_IMediaFrameSource;
   type IIterator_IMediaFrameSourceInfo_Interface;
   type IIterator_IMediaFrameSourceInfo is access all IIterator_IMediaFrameSourceInfo_Interface'Class;
   type IIterator_IMediaFrameSourceInfo_Ptr is access all IIterator_IMediaFrameSourceInfo;
   type IIterable_IMediaFrameSourceInfo_Interface;
   type IIterable_IMediaFrameSourceInfo is access all IIterable_IMediaFrameSourceInfo_Interface'Class;
   type IIterable_IMediaFrameSourceInfo_Ptr is access all IIterable_IMediaFrameSourceInfo;
   type IVectorView_IMediaFrameSourceInfo_Interface;
   type IVectorView_IMediaFrameSourceInfo is access all IVectorView_IMediaFrameSourceInfo_Interface'Class;
   type IVectorView_IMediaFrameSourceInfo_Ptr is access all IVectorView_IMediaFrameSourceInfo;
   type IAsyncOperation_IMediaFrameSourceGroup_Interface;
   type IAsyncOperation_IMediaFrameSourceGroup is access all IAsyncOperation_IMediaFrameSourceGroup_Interface'Class;
   type IAsyncOperation_IMediaFrameSourceGroup_Ptr is access all IAsyncOperation_IMediaFrameSourceGroup;
   type IIterator_IMediaFrameFormat_Interface;
   type IIterator_IMediaFrameFormat is access all IIterator_IMediaFrameFormat_Interface'Class;
   type IIterator_IMediaFrameFormat_Ptr is access all IIterator_IMediaFrameFormat;
   type IIterable_IMediaFrameFormat_Interface;
   type IIterable_IMediaFrameFormat is access all IIterable_IMediaFrameFormat_Interface'Class;
   type IIterable_IMediaFrameFormat_Ptr is access all IIterable_IMediaFrameFormat;
   type IVectorView_IMediaFrameFormat_Interface;
   type IVectorView_IMediaFrameFormat is access all IVectorView_IMediaFrameFormat_Interface'Class;
   type IVectorView_IMediaFrameFormat_Ptr is access all IVectorView_IMediaFrameFormat;
   type IAsyncOperation_MediaFrameReaderStartStatus_Interface;
   type IAsyncOperation_MediaFrameReaderStartStatus is access all IAsyncOperation_MediaFrameReaderStartStatus_Interface'Class;
   type IAsyncOperation_MediaFrameReaderStartStatus_Ptr is access all IAsyncOperation_MediaFrameReaderStartStatus;
   type IAsyncOperation_MultiSourceMediaFrameReaderStartStatus_Interface;
   type IAsyncOperation_MultiSourceMediaFrameReaderStartStatus is access all IAsyncOperation_MultiSourceMediaFrameReaderStartStatus_Interface'Class;
   type IAsyncOperation_MultiSourceMediaFrameReaderStartStatus_Ptr is access all IAsyncOperation_MultiSourceMediaFrameReaderStartStatus;
   type IAsyncOperation_IMediaFrameSourceGetPropertyResult_Interface;
   type IAsyncOperation_IMediaFrameSourceGetPropertyResult is access all IAsyncOperation_IMediaFrameSourceGetPropertyResult_Interface'Class;
   type IAsyncOperation_IMediaFrameSourceGetPropertyResult_Ptr is access all IAsyncOperation_IMediaFrameSourceGetPropertyResult;
   type IAsyncOperation_MediaFrameSourceSetPropertyStatus_Interface;
   type IAsyncOperation_MediaFrameSourceSetPropertyStatus is access all IAsyncOperation_MediaFrameSourceSetPropertyStatus_Interface'Class;
   type IAsyncOperation_MediaFrameSourceSetPropertyStatus_Ptr is access all IAsyncOperation_MediaFrameSourceSetPropertyStatus;
   
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
   type IMediaFrameSourceGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IMediaFrameSourceGroup_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IMediaFrameSourceGroup_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceInfos
   (
      This       : access IMediaFrameSourceGroup_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IVectorView_IMediaFrameSourceInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameSourceGroup : aliased constant Windows.IID := (2137021319, 18482, 19295, (174, 61, 65, 47, 170, 179, 125, 52 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameSourceGroupStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAllAsync
   (
      This       : access IMediaFrameSourceGroupStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IMediaFrameSourceGroupStatics_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGroup -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IMediaFrameSourceGroupStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameSourceGroupStatics : aliased constant Windows.IID := (474529733, 17263, 17672, (148, 207, 213, 216, 183, 50, 100, 69 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameSourceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaStreamType
   (
      This       : access IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.Media.Capture.MediaStreamType
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceKind
   (
      This       : access IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.Media.Capture.Frames.MediaFrameSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceGroup
   (
      This       : access IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameSourceGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceInformation
   (
      This       : access IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CoordinateSystem
   (
      This       : access IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameSourceInfo : aliased constant Windows.IID := (2277362125, 17921, 16527, (145, 207, 3, 131, 24, 205, 10, 243 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Info
   (
      This       : access IMediaFrameSource_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameSourceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Controller
   (
      This       : access IMediaFrameSource_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameSourceController
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedFormats
   (
      This       : access IMediaFrameSource_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IVectorView_IMediaFrameFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentFormat
   (
      This       : access IMediaFrameSource_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function SetFormatAsync
   (
      This       : access IMediaFrameSource_Interface
      ; format : Windows.Media.Capture.Frames.IMediaFrameFormat
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_FormatChanged
   (
      This       : access IMediaFrameSource_Interface
      ; handler : TypedEventHandler_IMediaFrameSource_add_FormatChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FormatChanged
   (
      This       : access IMediaFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function TryGetCameraIntrinsics
   (
      This       : access IMediaFrameSource_Interface
      ; format : Windows.Media.Capture.Frames.IMediaFrameFormat
      ; RetVal : access Windows.Media.Devices.Core.ICameraIntrinsics
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameSource : aliased constant Windows.IID := (3598199123, 37083, 18088, (138, 221, 42, 168, 132, 168, 210, 83 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameArrivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IMediaFrameArrivedEventArgs : aliased constant Windows.IID := (188943069, 42128, 17461, (173, 161, 154, 255, 213, 82, 57, 247 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameReader_Interface is interface and Windows.IInspectable_Interface;
   
   function add_FrameArrived
   (
      This       : access IMediaFrameReader_Interface
      ; handler : TypedEventHandler_IMediaFrameReader_add_FrameArrived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FrameArrived
   (
      This       : access IMediaFrameReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function TryAcquireLatestFrame
   (
      This       : access IMediaFrameReader_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameReference
   )
   return Windows.HRESULT is abstract;
   
   function StartAsync
   (
      This       : access IMediaFrameReader_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_MediaFrameReaderStartStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StopAsync
   (
      This       : access IMediaFrameReader_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameReader : aliased constant Windows.IID := (3838395285, 8232, 18669, (144, 176, 209, 193, 177, 98, 226, 76 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameReader2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_AcquisitionMode
   (
      This       : access IMediaFrameReader2_Interface
      ; value : Windows.Media.Capture.Frames.MediaFrameReaderAcquisitionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_AcquisitionMode
   (
      This       : access IMediaFrameReader2_Interface
      ; RetVal : access Windows.Media.Capture.Frames.MediaFrameReaderAcquisitionMode
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameReader2 : aliased constant Windows.IID := (2266048435, 34097, 16464, (135, 204, 161, 55, 51, 207, 62, 155 ));
   
   ------------------------------------------------------------------------
   type IMultiSourceMediaFrameArrivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IMultiSourceMediaFrameArrivedEventArgs : aliased constant Windows.IID := (1662082561, 53073, 18685, (170, 176, 109, 105, 62, 180, 129, 39 ));
   
   ------------------------------------------------------------------------
   type IMultiSourceMediaFrameReader_Interface is interface and Windows.IInspectable_Interface;
   
   function add_FrameArrived
   (
      This       : access IMultiSourceMediaFrameReader_Interface
      ; handler : TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FrameArrived
   (
      This       : access IMultiSourceMediaFrameReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function TryAcquireLatestFrame
   (
      This       : access IMultiSourceMediaFrameReader_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMultiSourceMediaFrameReference
   )
   return Windows.HRESULT is abstract;
   
   function StartAsync
   (
      This       : access IMultiSourceMediaFrameReader_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_MultiSourceMediaFrameReaderStartStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StopAsync
   (
      This       : access IMultiSourceMediaFrameReader_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IMultiSourceMediaFrameReader : aliased constant Windows.IID := (2366915586, 63331, 18573, (152, 242, 180, 55, 188, 240, 117, 231 ));
   
   ------------------------------------------------------------------------
   type IMultiSourceMediaFrameReader2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_AcquisitionMode
   (
      This       : access IMultiSourceMediaFrameReader2_Interface
      ; value : Windows.Media.Capture.Frames.MediaFrameReaderAcquisitionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_AcquisitionMode
   (
      This       : access IMultiSourceMediaFrameReader2_Interface
      ; RetVal : access Windows.Media.Capture.Frames.MediaFrameReaderAcquisitionMode
   )
   return Windows.HRESULT is abstract;
   
   IID_IMultiSourceMediaFrameReader2 : aliased constant Windows.IID := (4015819453, 64604, 19563, (157, 129, 60, 185, 204, 99, 124, 38 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameSourceController_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPropertyAsync
   (
      This       : access IMediaFrameSourceController_Interface
      ; propertyId : Windows.String
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGetPropertyResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyAsync
   (
      This       : access IMediaFrameSourceController_Interface
      ; propertyId : Windows.String
      ; propertyValue : Windows.Object
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_MediaFrameSourceSetPropertyStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoDeviceController
   (
      This       : access IMediaFrameSourceController_Interface
      ; RetVal : access Windows.Media.Devices.IVideoDeviceController
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameSourceController : aliased constant Windows.IID := (1829201461, 12653, 19343, (183, 182, 238, 176, 74, 140, 101, 37 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameSourceController2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPropertyByExtendedIdAsync
   (
      This       : access IMediaFrameSourceController2_Interface
      ; extendedPropertyId : Windows.UInt8_Ptr
      ; maxPropertyValueSize : Windows.Foundation.IReference_UInt32
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGetPropertyResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyByExtendedIdAsync
   (
      This       : access IMediaFrameSourceController2_Interface
      ; extendedPropertyId : Windows.UInt8_Ptr
      ; propertyValue : Windows.UInt8_Ptr
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_MediaFrameSourceSetPropertyStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameSourceController2 : aliased constant Windows.IID := (4022640596, 64754, 18947, (180, 228, 172, 150, 40, 115, 155, 238 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameSourceGetPropertyResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IMediaFrameSourceGetPropertyResult_Interface
      ; RetVal : access Windows.Media.Capture.Frames.MediaFrameSourceGetPropertyStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IMediaFrameSourceGetPropertyResult_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameSourceGetPropertyResult : aliased constant Windows.IID := (143005378, 14948, 19413, (189, 43, 231, 200, 152, 210, 243, 122 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MajorType
   (
      This       : access IMediaFrameFormat_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subtype
   (
      This       : access IMediaFrameFormat_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameRate
   (
      This       : access IMediaFrameFormat_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaRatio
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IMediaFrameFormat_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormat
   (
      This       : access IMediaFrameFormat_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IVideoMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameFormat : aliased constant Windows.IID := (1905273678, 45689, 19095, (169, 219, 189, 90, 47, 183, 143, 57 ));
   
   ------------------------------------------------------------------------
   type IVideoMediaFrameFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MediaFrameFormat
   (
      This       : access IVideoMediaFrameFormat_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_DepthFormat
   (
      This       : access IVideoMediaFrameFormat_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IDepthMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IVideoMediaFrameFormat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IVideoMediaFrameFormat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoMediaFrameFormat : aliased constant Windows.IID := (1174568896, 55067, 17863, (143, 20, 109, 154, 10, 230, 4, 228 ));
   
   ------------------------------------------------------------------------
   type IMediaFrameReference_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceKind
   (
      This       : access IMediaFrameReference_Interface
      ; RetVal : access Windows.Media.Capture.Frames.MediaFrameSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Format
   (
      This       : access IMediaFrameReference_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemRelativeTime
   (
      This       : access IMediaFrameReference_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IMediaFrameReference_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IMediaFrameReference_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BufferMediaFrame
   (
      This       : access IMediaFrameReference_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IBufferMediaFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoMediaFrame
   (
      This       : access IMediaFrameReference_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IVideoMediaFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_CoordinateSystem
   (
      This       : access IMediaFrameReference_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrameReference : aliased constant Windows.IID := (4139288129, 61660, 16452, (141, 201, 150, 28, 237, 208, 91, 173 ));
   
   ------------------------------------------------------------------------
   type IMultiSourceMediaFrameReference_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetFrameReferenceBySourceId
   (
      This       : access IMultiSourceMediaFrameReference_Interface
      ; sourceId : Windows.String
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameReference
   )
   return Windows.HRESULT is abstract;
   
   IID_IMultiSourceMediaFrameReference : aliased constant Windows.IID := (563497754, 32738, 17622, (146, 229, 41, 142, 109, 40, 16, 233 ));
   
   ------------------------------------------------------------------------
   type IBufferMediaFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameReference
   (
      This       : access IBufferMediaFrame_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Buffer
   (
      This       : access IBufferMediaFrame_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_IBufferMediaFrame : aliased constant Windows.IID := (3048297415, 39812, 16482, (183, 156, 163, 101, 178, 89, 104, 84 ));
   
   ------------------------------------------------------------------------
   type IVideoMediaFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameReference
   (
      This       : access IVideoMediaFrame_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameReference
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoFormat
   (
      This       : access IVideoMediaFrame_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IVideoMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_SoftwareBitmap
   (
      This       : access IVideoMediaFrame_Interface
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function get_Direct3DSurface
   (
      This       : access IVideoMediaFrame_Interface
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraIntrinsics
   (
      This       : access IVideoMediaFrame_Interface
      ; RetVal : access Windows.Media.Devices.Core.ICameraIntrinsics
   )
   return Windows.HRESULT is abstract;
   
   function get_InfraredMediaFrame
   (
      This       : access IVideoMediaFrame_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IInfraredMediaFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_DepthMediaFrame
   (
      This       : access IVideoMediaFrame_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IDepthMediaFrame
   )
   return Windows.HRESULT is abstract;
   
   function GetVideoFrame
   (
      This       : access IVideoMediaFrame_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoMediaFrame : aliased constant Windows.IID := (14503115, 12989, 20449, (160, 19, 124, 193, 60, 245, 219, 207 ));
   
   ------------------------------------------------------------------------
   type IInfraredMediaFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameReference
   (
      This       : access IInfraredMediaFrame_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameReference
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoMediaFrame
   (
      This       : access IInfraredMediaFrame_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IVideoMediaFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_IsIlluminated
   (
      This       : access IInfraredMediaFrame_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IInfraredMediaFrame : aliased constant Windows.IID := (1070675203, 75, 20238, (145, 172, 70, 82, 153, 180, 22, 88 ));
   
   ------------------------------------------------------------------------
   type IDepthMediaFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameReference
   (
      This       : access IDepthMediaFrame_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameReference
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoMediaFrame
   (
      This       : access IDepthMediaFrame_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IVideoMediaFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_DepthFormat
   (
      This       : access IDepthMediaFrame_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IDepthMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateCoordinateMapper
   (
      This       : access IDepthMediaFrame_Interface
      ; cameraIntrinsics : Windows.Media.Devices.Core.ICameraIntrinsics
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Media.Devices.Core.IDepthCorrelatedCoordinateMapper
   )
   return Windows.HRESULT is abstract;
   
   IID_IDepthMediaFrame : aliased constant Windows.IID := (1192451663, 34121, 17856, (146, 91, 128, 211, 94, 253, 177, 10 ));
   
   ------------------------------------------------------------------------
   type IDepthMediaFrame2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxReliableDepth
   (
      This       : access IDepthMediaFrame2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MinReliableDepth
   (
      This       : access IDepthMediaFrame2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IDepthMediaFrame2 : aliased constant Windows.IID := (1825195837, 50340, 16758, (176, 205, 51, 234, 227, 179, 90, 163 ));
   
   ------------------------------------------------------------------------
   type IDepthMediaFrameFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoFormat
   (
      This       : access IDepthMediaFrameFormat_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IVideoMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_DepthScaleInMeters
   (
      This       : access IDepthMediaFrameFormat_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IDepthMediaFrameFormat : aliased constant Windows.IID := (3272789824, 55081, 17726, (135, 128, 46, 4, 241, 64, 210, 142 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IMediaFrameReader_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMediaFrameReader_Interface
      ; handler : Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_IMediaFrameReader
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMediaFrameReader_Interface
      ; RetVal : access Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_IMediaFrameReader
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMediaFrameReader_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameReader
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IMediaFrameReader : aliased constant Windows.IID := (2701963597, 31029, 23687, (144, 38, 138, 190, 121, 42, 59, 229 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IMultiSourceMediaFrameReader_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMultiSourceMediaFrameReader_Interface
      ; handler : Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMultiSourceMediaFrameReader_Interface
      ; RetVal : access Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMultiSourceMediaFrameReader_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IMultiSourceMediaFrameReader : aliased constant Windows.IID := (1406495720, 61712, 21030, (156, 225, 168, 194, 106, 87, 37, 118 ));
   
   ------------------------------------------------------------------------
   type IIterator_IMediaFrameSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaFrameSource_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameSource
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaFrameSource_Interface
      ; items : Windows.Media.Capture.Frames.IMediaFrameSource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IMediaFrameSource : aliased constant Windows.IID := (3495842765, 48108, 24503, (142, 78, 222, 134, 17, 91, 94, 136 ));
   
   ------------------------------------------------------------------------
   type IIterable_IMediaFrameSource_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaFrameSource_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IIterator_IMediaFrameSource
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IMediaFrameSource : aliased constant Windows.IID := (222591971, 35985, 22557, (128, 113, 23, 152, 75, 139, 89, 148 ));
   
   ------------------------------------------------------------------------
   type IIterator_IMediaFrameSourceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameSourceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaFrameSourceInfo_Interface
      ; items : Windows.Media.Capture.Frames.IMediaFrameSourceInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IMediaFrameSourceInfo : aliased constant Windows.IID := (1144807640, 8334, 21401, (188, 68, 237, 198, 254, 240, 34, 147 ));
   
   ------------------------------------------------------------------------
   type IIterable_IMediaFrameSourceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IIterator_IMediaFrameSourceInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IMediaFrameSourceInfo : aliased constant Windows.IID := (774489520, 27305, 20722, (145, 164, 91, 103, 165, 89, 143, 46 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IMediaFrameSourceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaFrameSourceInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameSourceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaFrameSourceInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaFrameSourceInfo_Interface
      ; value : Windows.Media.Capture.Frames.IMediaFrameSourceInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaFrameSourceInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Capture.Frames.IMediaFrameSourceInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IMediaFrameSourceInfo : aliased constant Windows.IID := (3688593734, 39728, 20944, (156, 140, 199, 16, 90, 246, 144, 224 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IMediaFrameSourceGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMediaFrameSourceGroup_Interface
      ; handler : Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_IMediaFrameSourceGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMediaFrameSourceGroup_Interface
      ; RetVal : access Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_IMediaFrameSourceGroup
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMediaFrameSourceGroup_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameSourceGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IMediaFrameSourceGroup : aliased constant Windows.IID := (4079315591, 45519, 22851, (182, 100, 159, 25, 54, 125, 39, 121 ));
   
   ------------------------------------------------------------------------
   type IIterator_IMediaFrameFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaFrameFormat_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaFrameFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaFrameFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaFrameFormat_Interface
      ; items : Windows.Media.Capture.Frames.IMediaFrameFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IMediaFrameFormat : aliased constant Windows.IID := (2208354218, 25926, 23139, (140, 215, 246, 33, 82, 167, 93, 39 ));
   
   ------------------------------------------------------------------------
   type IIterable_IMediaFrameFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaFrameFormat_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IIterator_IMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IMediaFrameFormat : aliased constant Windows.IID := (520264231, 4387, 21386, (146, 97, 138, 56, 14, 18, 186, 198 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IMediaFrameFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaFrameFormat_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaFrameFormat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaFrameFormat_Interface
      ; value : Windows.Media.Capture.Frames.IMediaFrameFormat
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaFrameFormat_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Capture.Frames.IMediaFrameFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IMediaFrameFormat : aliased constant Windows.IID := (3135394941, 16302, 21965, (178, 9, 69, 195, 181, 178, 248, 22 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_MediaFrameReaderStartStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_MediaFrameReaderStartStatus_Interface
      ; handler : Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_MediaFrameReaderStartStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_MediaFrameReaderStartStatus_Interface
      ; RetVal : access Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_MediaFrameReaderStartStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_MediaFrameReaderStartStatus_Interface
      ; RetVal : access Windows.Media.Capture.Frames.MediaFrameReaderStartStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_MediaFrameReaderStartStatus : aliased constant Windows.IID := (3683525914, 44486, 22355, (135, 132, 196, 75, 77, 124, 91, 7 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_MultiSourceMediaFrameReaderStartStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_MultiSourceMediaFrameReaderStartStatus_Interface
      ; handler : Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_MultiSourceMediaFrameReaderStartStatus_Interface
      ; RetVal : access Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_MultiSourceMediaFrameReaderStartStatus_Interface
      ; RetVal : access Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_MultiSourceMediaFrameReaderStartStatus : aliased constant Windows.IID := (2722281810, 30378, 21733, (161, 59, 168, 112, 124, 16, 152, 225 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IMediaFrameSourceGetPropertyResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMediaFrameSourceGetPropertyResult_Interface
      ; handler : Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMediaFrameSourceGetPropertyResult_Interface
      ; RetVal : access Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMediaFrameSourceGetPropertyResult_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IMediaFrameSourceGetPropertyResult : aliased constant Windows.IID := (2147498361, 18822, 21159, (178, 39, 174, 107, 228, 210, 181, 205 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_MediaFrameSourceSetPropertyStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_MediaFrameSourceSetPropertyStatus_Interface
      ; handler : Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_MediaFrameSourceSetPropertyStatus_Interface
      ; RetVal : access Windows.Media.Capture.Frames.AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_MediaFrameSourceSetPropertyStatus_Interface
      ; RetVal : access Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_MediaFrameSourceSetPropertyStatus : aliased constant Windows.IID := (2706406422, 24452, 22638, (140, 169, 34, 79, 55, 224, 224, 222 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IMediaFrameReader_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameReader ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IMediaFrameReader_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaFrameReader_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameReader
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IMediaFrameReader : aliased constant Windows.IID := (2787200429, 47383, 23689, (160, 104, 227, 44, 154, 112, 55, 211 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMultiSourceMediaFrameReader ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMultiSourceMediaFrameReader
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader : aliased constant Windows.IID := (1771648888, 42124, 20684, (166, 240, 83, 104, 245, 138, 41, 122 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IMediaFrameSourceGroup_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGroup ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IMediaFrameSourceGroup_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaFrameSourceGroup_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGroup
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IMediaFrameSourceGroup : aliased constant Windows.IID := (2918256363, 40901, 21819, (145, 100, 41, 66, 70, 153, 42, 42 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaFrameSource_add_FormatChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.Frames.IMediaFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaFrameSource_add_FormatChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaFrameSource_add_FormatChanged_Interface
      ; sender : Windows.Media.Capture.Frames.IMediaFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaFrameSource_add_FormatChanged : aliased constant Windows.IID := (3353746087, 18198, 21780, (169, 19, 239, 23, 150, 185, 141, 189 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaFrameReader_add_FrameArrived_Interface(Callback : access procedure (sender : Windows.Media.Capture.Frames.IMediaFrameReader ; args : Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaFrameReader_add_FrameArrived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Media.Capture.Frames.IMediaFrameReader
      ; args : Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaFrameReader_add_FrameArrived : aliased constant Windows.IID := (3554494923, 36133, 22810, (128, 247, 131, 99, 213, 192, 62, 201 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_MediaFrameReaderStartStatus_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_MediaFrameReaderStartStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_MediaFrameReaderStartStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_MediaFrameReaderStartStatus_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_MediaFrameReaderStartStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_MediaFrameReaderStartStatus : aliased constant Windows.IID := (2672407269, 12136, 23640, (141, 139, 18, 23, 111, 246, 234, 80 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived_Interface(Callback : access procedure (sender : Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader ; args : Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader
      ; args : Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived : aliased constant Windows.IID := (2192682317, 39047, 22260, (154, 158, 58, 177, 139, 2, 25, 140 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_MultiSourceMediaFrameReaderStartStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_MultiSourceMediaFrameReaderStartStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus : aliased constant Windows.IID := (418312778, 13106, 24558, (160, 240, 114, 206, 237, 51, 6, 69 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGetPropertyResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGetPropertyResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult : aliased constant Windows.IID := (3495395085, 52806, 23623, (143, 124, 74, 229, 98, 108, 199, 109 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_MediaFrameSourceSetPropertyStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_MediaFrameSourceSetPropertyStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus : aliased constant Windows.IID := (4128466490, 50821, 24000, (177, 51, 96, 217, 67, 3, 166, 227 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MediaFrameSourceGroup is Windows.Media.Capture.Frames.IMediaFrameSourceGroup;
   subtype MediaFrameSource is Windows.Media.Capture.Frames.IMediaFrameSource;
   subtype MediaFrameReader is Windows.Media.Capture.Frames.IMediaFrameReader;
   subtype MultiSourceMediaFrameReader is Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader;
   subtype MediaFrameSourceInfo is Windows.Media.Capture.Frames.IMediaFrameSourceInfo;
   subtype MediaFrameSourceController is Windows.Media.Capture.Frames.IMediaFrameSourceController;
   subtype MediaFrameFormat is Windows.Media.Capture.Frames.IMediaFrameFormat;
   subtype MediaFrameArrivedEventArgs is Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs;
   subtype MediaFrameReference is Windows.Media.Capture.Frames.IMediaFrameReference;
   subtype MultiSourceMediaFrameArrivedEventArgs is Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs;
   subtype MultiSourceMediaFrameReference is Windows.Media.Capture.Frames.IMultiSourceMediaFrameReference;
   subtype MediaFrameSourceGetPropertyResult is Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult;
   subtype VideoMediaFrameFormat is Windows.Media.Capture.Frames.IVideoMediaFrameFormat;
   subtype DepthMediaFrameFormat is Windows.Media.Capture.Frames.IDepthMediaFrameFormat;
   subtype BufferMediaFrame is Windows.Media.Capture.Frames.IBufferMediaFrame;
   subtype VideoMediaFrame is Windows.Media.Capture.Frames.IVideoMediaFrame;
   subtype InfraredMediaFrame is Windows.Media.Capture.Frames.IInfraredMediaFrame;
   subtype DepthMediaFrame is Windows.Media.Capture.Frames.IDepthMediaFrame;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FindAllAsync
   return Windows.Address;
   
   function FromIdAsync
   (
      id : Windows.String
   )
   return Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGroup;
   
   function GetDeviceSelector
   return Windows.String;

end;
