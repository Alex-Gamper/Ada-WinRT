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
limited with Windows.Media.MediaProperties;
with Windows.Foundation.Collections;
with Windows.Foundation;
with Windows.Foundation.Numerics;
limited with Windows.Perception.Spatial;
--------------------------------------------------------------------------------
package Windows.Media.Devices.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type FrameFlashMode is (
      Disable,
      Enable,
      Global
   );
   for FrameFlashMode use (
      Disable => 0,
      Enable => 1,
      Global => 2
   );
   for FrameFlashMode'Size use 32;
   
   type FrameFlashMode_Ptr is access FrameFlashMode;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IFrameExposureCapabilities_Interface;
   type IFrameExposureCapabilities is access all IFrameExposureCapabilities_Interface'Class;
   type IFrameExposureCapabilities_Ptr is access all IFrameExposureCapabilities;
   type IFrameExposureCompensationCapabilities_Interface;
   type IFrameExposureCompensationCapabilities is access all IFrameExposureCompensationCapabilities_Interface'Class;
   type IFrameExposureCompensationCapabilities_Ptr is access all IFrameExposureCompensationCapabilities;
   type IFrameIsoSpeedCapabilities_Interface;
   type IFrameIsoSpeedCapabilities is access all IFrameIsoSpeedCapabilities_Interface'Class;
   type IFrameIsoSpeedCapabilities_Ptr is access all IFrameIsoSpeedCapabilities;
   type IFrameFocusCapabilities_Interface;
   type IFrameFocusCapabilities is access all IFrameFocusCapabilities_Interface'Class;
   type IFrameFocusCapabilities_Ptr is access all IFrameFocusCapabilities;
   type IFrameFlashCapabilities_Interface;
   type IFrameFlashCapabilities is access all IFrameFlashCapabilities_Interface'Class;
   type IFrameFlashCapabilities_Ptr is access all IFrameFlashCapabilities;
   type IFrameControlCapabilities_Interface;
   type IFrameControlCapabilities is access all IFrameControlCapabilities_Interface'Class;
   type IFrameControlCapabilities_Ptr is access all IFrameControlCapabilities;
   type IFrameControlCapabilities2_Interface;
   type IFrameControlCapabilities2 is access all IFrameControlCapabilities2_Interface'Class;
   type IFrameControlCapabilities2_Ptr is access all IFrameControlCapabilities2;
   type IFrameExposureControl_Interface;
   type IFrameExposureControl is access all IFrameExposureControl_Interface'Class;
   type IFrameExposureControl_Ptr is access all IFrameExposureControl;
   type IFrameExposureCompensationControl_Interface;
   type IFrameExposureCompensationControl is access all IFrameExposureCompensationControl_Interface'Class;
   type IFrameExposureCompensationControl_Ptr is access all IFrameExposureCompensationControl;
   type IFrameIsoSpeedControl_Interface;
   type IFrameIsoSpeedControl is access all IFrameIsoSpeedControl_Interface'Class;
   type IFrameIsoSpeedControl_Ptr is access all IFrameIsoSpeedControl;
   type IFrameFocusControl_Interface;
   type IFrameFocusControl is access all IFrameFocusControl_Interface'Class;
   type IFrameFocusControl_Ptr is access all IFrameFocusControl;
   type IFrameFlashControl_Interface;
   type IFrameFlashControl is access all IFrameFlashControl_Interface'Class;
   type IFrameFlashControl_Ptr is access all IFrameFlashControl;
   type IFrameController_Interface;
   type IFrameController is access all IFrameController_Interface'Class;
   type IFrameController_Ptr is access all IFrameController;
   type IFrameController2_Interface;
   type IFrameController2 is access all IFrameController2_Interface'Class;
   type IFrameController2_Ptr is access all IFrameController2;
   type IVariablePhotoSequenceController_Interface;
   type IVariablePhotoSequenceController is access all IVariablePhotoSequenceController_Interface'Class;
   type IVariablePhotoSequenceController_Ptr is access all IVariablePhotoSequenceController;
   type ICameraIntrinsicsFactory_Interface;
   type ICameraIntrinsicsFactory is access all ICameraIntrinsicsFactory_Interface'Class;
   type ICameraIntrinsicsFactory_Ptr is access all ICameraIntrinsicsFactory;
   type ICameraIntrinsics_Interface;
   type ICameraIntrinsics is access all ICameraIntrinsics_Interface'Class;
   type ICameraIntrinsics_Ptr is access all ICameraIntrinsics;
   type ICameraIntrinsics2_Interface;
   type ICameraIntrinsics2 is access all ICameraIntrinsics2_Interface'Class;
   type ICameraIntrinsics2_Ptr is access all ICameraIntrinsics2;
   type IDepthCorrelatedCoordinateMapper_Interface;
   type IDepthCorrelatedCoordinateMapper is access all IDepthCorrelatedCoordinateMapper_Interface'Class;
   type IDepthCorrelatedCoordinateMapper_Ptr is access all IDepthCorrelatedCoordinateMapper;
   type IIterator_IFrameController_Interface;
   type IIterator_IFrameController is access all IIterator_IFrameController_Interface'Class;
   type IIterator_IFrameController_Ptr is access all IIterator_IFrameController;
   type IIterable_IFrameController_Interface;
   type IIterable_IFrameController is access all IIterable_IFrameController_Interface'Class;
   type IIterable_IFrameController_Ptr is access all IIterable_IFrameController;
   type IVectorView_IFrameController_Interface;
   type IVectorView_IFrameController is access all IVectorView_IFrameController_Interface'Class;
   type IVectorView_IFrameController_Ptr is access all IVectorView_IFrameController;
   type IVector_IFrameController_Interface;
   type IVector_IFrameController is access all IVector_IFrameController_Interface'Class;
   type IVector_IFrameController_Ptr is access all IVector_IFrameController;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IFrameExposureCapabilities : aliased constant Windows.IID := (3183385827, 14725, 20082, (151, 194, 5, 144, 214, 19, 7, 161 ));
   
   type IFrameExposureCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IFrameExposureCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Min
   (
      This       : access IFrameExposureCapabilities_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IFrameExposureCapabilities_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IFrameExposureCapabilities_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameExposureCompensationCapabilities : aliased constant Windows.IID := (3112740899, 32869, 16878, (176, 79, 114, 34, 101, 149, 69, 0 ));
   
   type IFrameExposureCompensationCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IFrameExposureCompensationCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Min
   (
      This       : access IFrameExposureCompensationCapabilities_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IFrameExposureCompensationCapabilities_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IFrameExposureCompensationCapabilities_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameIsoSpeedCapabilities : aliased constant Windows.IID := (381550433, 28150, 19145, (185, 42, 159, 110, 205, 26, 210, 250 ));
   
   type IFrameIsoSpeedCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IFrameIsoSpeedCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Min
   (
      This       : access IFrameIsoSpeedCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IFrameIsoSpeedCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IFrameIsoSpeedCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameFocusCapabilities : aliased constant Windows.IID := (2066074968, 448, 16485, (156, 64, 193, 167, 33, 66, 92, 26 ));
   
   type IFrameFocusCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IFrameFocusCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Min
   (
      This       : access IFrameFocusCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Max
   (
      This       : access IFrameFocusCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Step
   (
      This       : access IFrameFocusCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameFlashCapabilities : aliased constant Windows.IID := (3146989986, 24254, 20322, (130, 35, 14, 43, 5, 191, 187, 208 ));
   
   type IFrameFlashCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IFrameFlashCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RedEyeReductionSupported
   (
      This       : access IFrameFlashCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerSupported
   (
      This       : access IFrameFlashCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameControlCapabilities : aliased constant Windows.IID := (2835328608, 20126, 17271, (167, 137, 226, 76, 74, 231, 229, 68 ));
   
   type IFrameControlCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Exposure
   (
      This       : access IFrameControlCapabilities_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameExposureCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_ExposureCompensation
   (
      This       : access IFrameControlCapabilities_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameExposureCompensationCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_IsoSpeed
   (
      This       : access IFrameControlCapabilities_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameIsoSpeedCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_Focus
   (
      This       : access IFrameControlCapabilities_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameFocusCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotoConfirmationSupported
   (
      This       : access IFrameControlCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameControlCapabilities2 : aliased constant Windows.IID := (3466265700, 18224, 17423, (189, 62, 239, 232, 168, 242, 48, 168 ));
   
   type IFrameControlCapabilities2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Flash
   (
      This       : access IFrameControlCapabilities2_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameFlashCapabilities
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameExposureControl : aliased constant Windows.IID := (2975881825, 65455, 18258, (182, 33, 245, 182, 241, 23, 244, 50 ));
   
   type IFrameExposureControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Auto
   (
      This       : access IFrameExposureControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Auto
   (
      This       : access IFrameExposureControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IFrameExposureControl_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IFrameExposureControl_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameExposureCompensationControl : aliased constant Windows.IID := (3914897097, 63481, 18634, (133, 145, 162, 101, 49, 203, 21, 120 ));
   
   type IFrameExposureCompensationControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IFrameExposureCompensationControl_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IFrameExposureCompensationControl_Interface
      ; value : Windows.Foundation.IReference_Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameIsoSpeedControl : aliased constant Windows.IID := (436465645, 30826, 19573, (165, 87, 122, 185, 168, 95, 88, 140 ));
   
   type IFrameIsoSpeedControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Auto
   (
      This       : access IFrameIsoSpeedControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Auto
   (
      This       : access IFrameIsoSpeedControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IFrameIsoSpeedControl_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IFrameIsoSpeedControl_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameFocusControl : aliased constant Windows.IID := (657322448, 55570, 16916, (166, 123, 227, 138, 141, 72, 216, 198 ));
   
   type IFrameFocusControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IFrameFocusControl_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IFrameFocusControl_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameFlashControl : aliased constant Windows.IID := (1976956615, 48453, 20395, (147, 117, 69, 172, 4, 179, 50, 194 ));
   
   type IFrameFlashControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mode
   (
      This       : access IFrameFlashControl_Interface
      ; RetVal : access Windows.Media.Devices.Core.FrameFlashMode
   )
   return Windows.HRESULT is abstract;
   
   function put_Mode
   (
      This       : access IFrameFlashControl_Interface
      ; value : Windows.Media.Devices.Core.FrameFlashMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Auto
   (
      This       : access IFrameFlashControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Auto
   (
      This       : access IFrameFlashControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RedEyeReduction
   (
      This       : access IFrameFlashControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RedEyeReduction
   (
      This       : access IFrameFlashControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerPercent
   (
      This       : access IFrameFlashControl_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_PowerPercent
   (
      This       : access IFrameFlashControl_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameController : aliased constant Windows.IID := (3244579289, 47855, 16466, (145, 119, 72, 175, 242, 175, 117, 34 ));
   
   type IFrameController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExposureControl
   (
      This       : access IFrameController_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameExposureControl
   )
   return Windows.HRESULT is abstract;
   
   function get_ExposureCompensationControl
   (
      This       : access IFrameController_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameExposureCompensationControl
   )
   return Windows.HRESULT is abstract;
   
   function get_IsoSpeedControl
   (
      This       : access IFrameController_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameIsoSpeedControl
   )
   return Windows.HRESULT is abstract;
   
   function get_FocusControl
   (
      This       : access IFrameController_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameFocusControl
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotoConfirmationEnabled
   (
      This       : access IFrameController_Interface
      ; RetVal : access Windows.Foundation.IReference_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_PhotoConfirmationEnabled
   (
      This       : access IFrameController_Interface
      ; value : Windows.Foundation.IReference_Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameController2 : aliased constant Windows.IID := (13876341, 55420, 18523, (138, 9, 92, 53, 133, 104, 180, 39 ));
   
   type IFrameController2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FlashControl
   (
      This       : access IFrameController2_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameFlashControl
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVariablePhotoSequenceController : aliased constant Windows.IID := (2143287424, 60812, 17405, (167, 195, 179, 88, 9, 228, 34, 154 ));
   
   type IVariablePhotoSequenceController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Supported
   (
      This       : access IVariablePhotoSequenceController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPhotosPerSecond
   (
      This       : access IVariablePhotoSequenceController_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotosPerSecondLimit
   (
      This       : access IVariablePhotoSequenceController_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_PhotosPerSecondLimit
   (
      This       : access IVariablePhotoSequenceController_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function GetHighestConcurrentFrameRate
   (
      This       : access IVariablePhotoSequenceController_Interface
      ; captureProperties : Windows.Media.MediaProperties.IMediaEncodingProperties
      ; RetVal : access Windows.Media.MediaProperties.IMediaRatio
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentFrameRate
   (
      This       : access IVariablePhotoSequenceController_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaRatio
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameCapabilities
   (
      This       : access IVariablePhotoSequenceController_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameControlCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredFrameControllers
   (
      This       : access IVariablePhotoSequenceController_Interface
      ; RetVal : access Windows.Media.Devices.Core.IVector_IFrameController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICameraIntrinsicsFactory : aliased constant Windows.IID := (3235759238, 8498, 18996, (166, 89, 155, 254, 42, 5, 87, 18 ));
   
   type ICameraIntrinsicsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ICameraIntrinsicsFactory_Interface
      ; focalLength : Windows.Foundation.Numerics.Vector2
      ; principalPoint : Windows.Foundation.Numerics.Vector2
      ; radialDistortion : Windows.Foundation.Numerics.Vector3
      ; tangentialDistortion : Windows.Foundation.Numerics.Vector2
      ; imageWidth : Windows.UInt32
      ; imageHeight : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.Core.ICameraIntrinsics
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICameraIntrinsics : aliased constant Windows.IID := (178711858, 25993, 18906, (175, 222, 89, 66, 112, 202, 10, 172 ));
   
   type ICameraIntrinsics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FocalLength
   (
      This       : access ICameraIntrinsics_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_PrincipalPoint
   (
      This       : access ICameraIntrinsics_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_RadialDistortion
   (
      This       : access ICameraIntrinsics_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_TangentialDistortion
   (
      This       : access ICameraIntrinsics_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_ImageWidth
   (
      This       : access ICameraIntrinsics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ImageHeight
   (
      This       : access ICameraIntrinsics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ProjectOntoFrame
   (
      This       : access ICameraIntrinsics_Interface
      ; coordinate : Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function UnprojectAtUnitDepth
   (
      This       : access ICameraIntrinsics_Interface
      ; pixelCoordinate : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function ProjectManyOntoFrame
   (
      This       : access ICameraIntrinsics_Interface
      ; coordinates : Windows.Foundation.Numerics.Vector3_Ptr
      ; results : Windows.Foundation.Point_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function UnprojectPixelsAtUnitDepth
   (
      This       : access ICameraIntrinsics_Interface
      ; pixelCoordinates : Windows.Foundation.Point_Ptr
      ; results : Windows.Foundation.Numerics.Vector2_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICameraIntrinsics2 : aliased constant Windows.IID := (215655495, 1944, 19277, (131, 159, 197, 236, 65, 77, 178, 122 ));
   
   type ICameraIntrinsics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UndistortedProjectionTransform
   (
      This       : access ICameraIntrinsics2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix4x4
   )
   return Windows.HRESULT is abstract;
   
   function DistortPoint
   (
      This       : access ICameraIntrinsics2_Interface
      ; input : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function DistortPoints
   (
      This       : access ICameraIntrinsics2_Interface
      ; inputs : Windows.Foundation.Point_Ptr
      ; results : Windows.Foundation.Point_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function UndistortPoint
   (
      This       : access ICameraIntrinsics2_Interface
      ; input : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function UndistortPoints
   (
      This       : access ICameraIntrinsics2_Interface
      ; inputs : Windows.Foundation.Point_Ptr
      ; results : Windows.Foundation.Point_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDepthCorrelatedCoordinateMapper : aliased constant Windows.IID := (4183656955, 35568, 19632, (146, 109, 105, 104, 102, 229, 4, 106 ));
   
   type IDepthCorrelatedCoordinateMapper_Interface is interface and Windows.IInspectable_Interface;
   
   function UnprojectPoint
   (
      This       : access IDepthCorrelatedCoordinateMapper_Interface
      ; sourcePoint : Windows.Foundation.Point
      ; targetCoordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function UnprojectPoints
   (
      This       : access IDepthCorrelatedCoordinateMapper_Interface
      ; sourcePoints : Windows.Foundation.Point_Ptr
      ; targetCoordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; results : Windows.Foundation.Numerics.Vector3_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function MapPoint
   (
      This       : access IDepthCorrelatedCoordinateMapper_Interface
      ; sourcePoint : Windows.Foundation.Point
      ; targetCoordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; targetCameraIntrinsics : Windows.Media.Devices.Core.ICameraIntrinsics
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function MapPoints
   (
      This       : access IDepthCorrelatedCoordinateMapper_Interface
      ; sourcePoints : Windows.Foundation.Point_Ptr
      ; targetCoordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; targetCameraIntrinsics : Windows.Media.Devices.Core.ICameraIntrinsics
      ; results : Windows.Foundation.Point_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IFrameController : aliased constant Windows.IID := (339795080, 25599, 23041, (187, 147, 57, 12, 118, 116, 36, 136 ));
   
   type IIterator_IFrameController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IFrameController_Interface
      ; RetVal : access Windows.Media.Devices.Core.IFrameController
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IFrameController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IFrameController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IFrameController_Interface
      ; items : Windows.Media.Devices.Core.IFrameController_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IFrameController : aliased constant Windows.IID := (3180260060, 11737, 23256, (172, 93, 243, 177, 59, 148, 185, 194 ));
   
   type IIterable_IFrameController_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IFrameController_Interface
      ; RetVal : access Windows.Media.Devices.Core.IIterator_IFrameController
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IFrameController : aliased constant Windows.IID := (4241924771, 46847, 21874, (145, 43, 153, 235, 175, 149, 22, 93 ));
   
   type IVectorView_IFrameController_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IFrameController_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.Core.IFrameController
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IFrameController_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IFrameController_Interface
      ; value : Windows.Media.Devices.Core.IFrameController
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IFrameController_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.Core.IFrameController_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IFrameController : aliased constant Windows.IID := (479167094, 47258, 20627, (161, 237, 175, 73, 223, 183, 42, 137 ));
   
   type IVector_IFrameController_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IFrameController_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Devices.Core.IFrameController
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IFrameController_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IFrameController_Interface
      ; RetVal : access Windows.Media.Devices.Core.IVectorView_IFrameController
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IFrameController_Interface
      ; value : Windows.Media.Devices.Core.IFrameController
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IFrameController_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Devices.Core.IFrameController
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IFrameController_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Devices.Core.IFrameController
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IFrameController_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IFrameController_Interface
      ; value : Windows.Media.Devices.Core.IFrameController
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IFrameController_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IFrameController_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IFrameController_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Devices.Core.IFrameController_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IFrameController_Interface
      ; items : Windows.Media.Devices.Core.IFrameController_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype VariablePhotoSequenceController is Windows.Media.Devices.Core.IVariablePhotoSequenceController;
   subtype FrameExposureCapabilities is Windows.Media.Devices.Core.IFrameExposureCapabilities;
   subtype FrameExposureCompensationCapabilities is Windows.Media.Devices.Core.IFrameExposureCompensationCapabilities;
   subtype FrameIsoSpeedCapabilities is Windows.Media.Devices.Core.IFrameIsoSpeedCapabilities;
   subtype FrameFocusCapabilities is Windows.Media.Devices.Core.IFrameFocusCapabilities;
   subtype FrameFlashCapabilities is Windows.Media.Devices.Core.IFrameFlashCapabilities;
   subtype FrameControlCapabilities is Windows.Media.Devices.Core.IFrameControlCapabilities;
   subtype FrameExposureControl is Windows.Media.Devices.Core.IFrameExposureControl;
   subtype FrameExposureCompensationControl is Windows.Media.Devices.Core.IFrameExposureCompensationControl;
   subtype FrameIsoSpeedControl is Windows.Media.Devices.Core.IFrameIsoSpeedControl;
   subtype FrameFocusControl is Windows.Media.Devices.Core.IFrameFocusControl;
   subtype FrameFlashControl is Windows.Media.Devices.Core.IFrameFlashControl;
   subtype FrameController is Windows.Media.Devices.Core.IFrameController;
   
   function CreateFrameController return Windows.Media.Devices.Core.IFrameController;
   
   subtype CameraIntrinsics is Windows.Media.Devices.Core.ICameraIntrinsics;
   subtype DepthCorrelatedCoordinateMapper is Windows.Media.Devices.Core.IDepthCorrelatedCoordinateMapper;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
