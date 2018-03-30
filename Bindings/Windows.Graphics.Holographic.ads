--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Graphics.DirectX.Direct3D11;
limited with Windows.UI.Core;
limited with Windows.Perception.Spatial;
limited with Windows.Perception;
with Windows.Foundation.Numerics;
limited with Windows.Graphics.DirectX;
--------------------------------------------------------------------------------
package Windows.Graphics.Holographic is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type HolographicFramePresentResult is (
      Success,
      DeviceRemoved
   );
   for HolographicFramePresentResult use (
      Success => 0,
      DeviceRemoved => 1
   );
   for HolographicFramePresentResult'Size use 32;
   
   type HolographicFramePresentResult_Ptr is access HolographicFramePresentResult;
   
   type HolographicFramePresentWaitBehavior is (
      WaitForFrameToFinish,
      DoNotWaitForFrameToFinish
   );
   for HolographicFramePresentWaitBehavior use (
      WaitForFrameToFinish => 0,
      DoNotWaitForFrameToFinish => 1
   );
   for HolographicFramePresentWaitBehavior'Size use 32;
   
   type HolographicFramePresentWaitBehavior_Ptr is access HolographicFramePresentWaitBehavior;
   
   type HolographicReprojectionMode is (
      PositionAndOrientation,
      OrientationOnly,
      Disabled
   );
   for HolographicReprojectionMode use (
      PositionAndOrientation => 0,
      OrientationOnly => 1,
      Disabled => 2
   );
   for HolographicReprojectionMode'Size use 32;
   
   type HolographicReprojectionMode_Ptr is access HolographicReprojectionMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type HolographicStereoTransform is record
      Left : Windows.Foundation.Numerics.Matrix4x4;
      Right : Windows.Foundation.Numerics.Matrix4x4;
   end record;
   pragma Convention (C_Pass_By_Copy , HolographicStereoTransform);
   
   type HolographicStereoTransform_Ptr is access HolographicStereoTransform;
   
   type HolographicAdapterId is record
      LowPart : Windows.UInt32;
      HighPart : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , HolographicAdapterId);
   
   type HolographicAdapterId_Ptr is access HolographicAdapterId;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IHolographicSpace_add_CameraAdded_Interface;
   type TypedEventHandler_IHolographicSpace_add_CameraAdded is access all TypedEventHandler_IHolographicSpace_add_CameraAdded_Interface'Class;
   type TypedEventHandler_IHolographicSpace_add_CameraAdded_Ptr is access all TypedEventHandler_IHolographicSpace_add_CameraAdded;
   type TypedEventHandler_IHolographicSpace_add_CameraRemoved_Interface;
   type TypedEventHandler_IHolographicSpace_add_CameraRemoved is access all TypedEventHandler_IHolographicSpace_add_CameraRemoved_Interface'Class;
   type TypedEventHandler_IHolographicSpace_add_CameraRemoved_Ptr is access all TypedEventHandler_IHolographicSpace_add_CameraRemoved;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IHolographicCamera_Interface;
   type IHolographicCamera is access all IHolographicCamera_Interface'Class;
   type IHolographicCamera_Ptr is access all IHolographicCamera;
   type IHolographicSpaceCameraAddedEventArgs_Interface;
   type IHolographicSpaceCameraAddedEventArgs is access all IHolographicSpaceCameraAddedEventArgs_Interface'Class;
   type IHolographicSpaceCameraAddedEventArgs_Ptr is access all IHolographicSpaceCameraAddedEventArgs;
   type IHolographicSpaceCameraRemovedEventArgs_Interface;
   type IHolographicSpaceCameraRemovedEventArgs is access all IHolographicSpaceCameraRemovedEventArgs_Interface'Class;
   type IHolographicSpaceCameraRemovedEventArgs_Ptr is access all IHolographicSpaceCameraRemovedEventArgs;
   type IHolographicSpace_Interface;
   type IHolographicSpace is access all IHolographicSpace_Interface'Class;
   type IHolographicSpace_Ptr is access all IHolographicSpace;
   type IHolographicSpaceStatics_Interface;
   type IHolographicSpaceStatics is access all IHolographicSpaceStatics_Interface'Class;
   type IHolographicSpaceStatics_Ptr is access all IHolographicSpaceStatics;
   type IHolographicSpaceStatics2_Interface;
   type IHolographicSpaceStatics2 is access all IHolographicSpaceStatics2_Interface'Class;
   type IHolographicSpaceStatics2_Ptr is access all IHolographicSpaceStatics2;
   type IHolographicSpaceStatics3_Interface;
   type IHolographicSpaceStatics3 is access all IHolographicSpaceStatics3_Interface'Class;
   type IHolographicSpaceStatics3_Ptr is access all IHolographicSpaceStatics3;
   type IHolographicCameraPose_Interface;
   type IHolographicCameraPose is access all IHolographicCameraPose_Interface'Class;
   type IHolographicCameraPose_Ptr is access all IHolographicCameraPose;
   type IHolographicFramePrediction_Interface;
   type IHolographicFramePrediction is access all IHolographicFramePrediction_Interface'Class;
   type IHolographicFramePrediction_Ptr is access all IHolographicFramePrediction;
   type IHolographicCameraRenderingParameters_Interface;
   type IHolographicCameraRenderingParameters is access all IHolographicCameraRenderingParameters_Interface'Class;
   type IHolographicCameraRenderingParameters_Ptr is access all IHolographicCameraRenderingParameters;
   type IHolographicFrame_Interface;
   type IHolographicFrame is access all IHolographicFrame_Interface'Class;
   type IHolographicFrame_Ptr is access all IHolographicFrame;
   type IHolographicFrame2_Interface;
   type IHolographicFrame2 is access all IHolographicFrame2_Interface'Class;
   type IHolographicFrame2_Ptr is access all IHolographicFrame2;
   type IHolographicCameraRenderingParameters2_Interface;
   type IHolographicCameraRenderingParameters2 is access all IHolographicCameraRenderingParameters2_Interface'Class;
   type IHolographicCameraRenderingParameters2_Ptr is access all IHolographicCameraRenderingParameters2;
   type IHolographicCameraRenderingParameters3_Interface;
   type IHolographicCameraRenderingParameters3 is access all IHolographicCameraRenderingParameters3_Interface'Class;
   type IHolographicCameraRenderingParameters3_Ptr is access all IHolographicCameraRenderingParameters3;
   type IHolographicCameraViewportParameters_Interface;
   type IHolographicCameraViewportParameters is access all IHolographicCameraViewportParameters_Interface'Class;
   type IHolographicCameraViewportParameters_Ptr is access all IHolographicCameraViewportParameters;
   type IHolographicCamera2_Interface;
   type IHolographicCamera2 is access all IHolographicCamera2_Interface'Class;
   type IHolographicCamera2_Ptr is access all IHolographicCamera2;
   type IHolographicCamera3_Interface;
   type IHolographicCamera3 is access all IHolographicCamera3_Interface'Class;
   type IHolographicCamera3_Ptr is access all IHolographicCamera3;
   type IHolographicDisplay_Interface;
   type IHolographicDisplay is access all IHolographicDisplay_Interface'Class;
   type IHolographicDisplay_Ptr is access all IHolographicDisplay;
   type IHolographicDisplay2_Interface;
   type IHolographicDisplay2 is access all IHolographicDisplay2_Interface'Class;
   type IHolographicDisplay2_Ptr is access all IHolographicDisplay2;
   type IHolographicDisplayStatics_Interface;
   type IHolographicDisplayStatics is access all IHolographicDisplayStatics_Interface'Class;
   type IHolographicDisplayStatics_Ptr is access all IHolographicDisplayStatics;
   type IHolographicQuadLayer_Interface;
   type IHolographicQuadLayer is access all IHolographicQuadLayer_Interface'Class;
   type IHolographicQuadLayer_Ptr is access all IHolographicQuadLayer;
   type IHolographicQuadLayerFactory_Interface;
   type IHolographicQuadLayerFactory is access all IHolographicQuadLayerFactory_Interface'Class;
   type IHolographicQuadLayerFactory_Ptr is access all IHolographicQuadLayerFactory;
   type IHolographicQuadLayerUpdateParameters_Interface;
   type IHolographicQuadLayerUpdateParameters is access all IHolographicQuadLayerUpdateParameters_Interface'Class;
   type IHolographicQuadLayerUpdateParameters_Ptr is access all IHolographicQuadLayerUpdateParameters;
   type IReference_HolographicStereoTransform_Interface;
   type IReference_HolographicStereoTransform is access all IReference_HolographicStereoTransform_Interface'Class;
   type IReference_HolographicStereoTransform_Ptr is access all IReference_HolographicStereoTransform;
   type IIterator_IHolographicCameraPose_Interface;
   type IIterator_IHolographicCameraPose is access all IIterator_IHolographicCameraPose_Interface'Class;
   type IIterator_IHolographicCameraPose_Ptr is access all IIterator_IHolographicCameraPose;
   type IIterable_IHolographicCameraPose_Interface;
   type IIterable_IHolographicCameraPose is access all IIterable_IHolographicCameraPose_Interface'Class;
   type IIterable_IHolographicCameraPose_Ptr is access all IIterable_IHolographicCameraPose;
   type IVectorView_IHolographicCameraPose_Interface;
   type IVectorView_IHolographicCameraPose is access all IVectorView_IHolographicCameraPose_Interface'Class;
   type IVectorView_IHolographicCameraPose_Ptr is access all IVectorView_IHolographicCameraPose;
   type IIterator_IHolographicCamera_Interface;
   type IIterator_IHolographicCamera is access all IIterator_IHolographicCamera_Interface'Class;
   type IIterator_IHolographicCamera_Ptr is access all IIterator_IHolographicCamera;
   type IIterable_IHolographicCamera_Interface;
   type IIterable_IHolographicCamera is access all IIterable_IHolographicCamera_Interface'Class;
   type IIterable_IHolographicCamera_Ptr is access all IIterable_IHolographicCamera;
   type IVectorView_IHolographicCamera_Interface;
   type IVectorView_IHolographicCamera is access all IVectorView_IHolographicCamera_Interface'Class;
   type IVectorView_IHolographicCamera_Ptr is access all IVectorView_IHolographicCamera;
   type IIterator_IHolographicQuadLayer_Interface;
   type IIterator_IHolographicQuadLayer is access all IIterator_IHolographicQuadLayer_Interface'Class;
   type IIterator_IHolographicQuadLayer_Ptr is access all IIterator_IHolographicQuadLayer;
   type IIterable_IHolographicQuadLayer_Interface;
   type IIterable_IHolographicQuadLayer is access all IIterable_IHolographicQuadLayer_Interface'Class;
   type IIterable_IHolographicQuadLayer_Ptr is access all IIterable_IHolographicQuadLayer;
   type IVectorView_IHolographicQuadLayer_Interface;
   type IVectorView_IHolographicQuadLayer is access all IVectorView_IHolographicQuadLayer_Interface'Class;
   type IVectorView_IHolographicQuadLayer_Ptr is access all IVectorView_IHolographicQuadLayer;
   type IVector_IHolographicQuadLayer_Interface;
   type IVector_IHolographicQuadLayer is access all IVector_IHolographicQuadLayer_Interface'Class;
   type IVector_IHolographicQuadLayer_Ptr is access all IVector_IHolographicQuadLayer;
   
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
   type IHolographicCamera_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RenderTargetSize
   (
      This       : access IHolographicCamera_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewportScaleFactor
   (
      This       : access IHolographicCamera_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ViewportScaleFactor
   (
      This       : access IHolographicCamera_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStereo
   (
      This       : access IHolographicCamera_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IHolographicCamera_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetNearPlaneDistance
   (
      This       : access IHolographicCamera_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetFarPlaneDistance
   (
      This       : access IHolographicCamera_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicCamera : aliased constant Windows.IID := (3840508997, 39917, 18816, (155, 160, 232, 118, 128, 209, 203, 116 ));
   
   ------------------------------------------------------------------------
   type IHolographicSpaceCameraAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Camera
   (
      This       : access IHolographicSpaceCameraAddedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicCamera
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IHolographicSpaceCameraAddedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicSpaceCameraAddedEventArgs : aliased constant Windows.IID := (1492245045, 48051, 15503, (153, 61, 108, 128, 231, 254, 185, 159 ));
   
   ------------------------------------------------------------------------
   type IHolographicSpaceCameraRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Camera
   (
      This       : access IHolographicSpaceCameraRemovedEventArgs_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicCamera
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicSpaceCameraRemovedEventArgs : aliased constant Windows.IID := (2153006248, 62126, 12846, (141, 169, 131, 106, 10, 149, 164, 193 ));
   
   ------------------------------------------------------------------------
   type IHolographicSpace_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrimaryAdapterId
   (
      This       : access IHolographicSpace_Interface
      ; RetVal : access Windows.Graphics.Holographic.HolographicAdapterId
   )
   return Windows.HRESULT is abstract;
   
   function SetDirect3D11Device
   (
      This       : access IHolographicSpace_Interface
      ; value : Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
   )
   return Windows.HRESULT is abstract;
   
   function add_CameraAdded
   (
      This       : access IHolographicSpace_Interface
      ; handler : TypedEventHandler_IHolographicSpace_add_CameraAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CameraAdded
   (
      This       : access IHolographicSpace_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CameraRemoved
   (
      This       : access IHolographicSpace_Interface
      ; handler : TypedEventHandler_IHolographicSpace_add_CameraRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CameraRemoved
   (
      This       : access IHolographicSpace_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CreateNextFrame
   (
      This       : access IHolographicSpace_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicSpace : aliased constant Windows.IID := (1132518310, 24184, 17231, (128, 124, 52, 51, 209, 239, 232, 183 ));
   
   ------------------------------------------------------------------------
   type IHolographicSpaceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateForCoreWindow
   (
      This       : access IHolographicSpaceStatics_Interface
      ; window : Windows.UI.Core.ICoreWindow
      ; RetVal : access Windows.Graphics.Holographic.IHolographicSpace
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicSpaceStatics : aliased constant Windows.IID := (911106148, 51442, 15265, (131, 145, 102, 184, 72, 158, 103, 253 ));
   
   ------------------------------------------------------------------------
   type IHolographicSpaceStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSupported
   (
      This       : access IHolographicSpaceStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAvailable
   (
      This       : access IHolographicSpaceStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_IsAvailableChanged
   (
      This       : access IHolographicSpaceStatics2_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsAvailableChanged
   (
      This       : access IHolographicSpaceStatics2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicSpaceStatics2 : aliased constant Windows.IID := (242708616, 30204, 18607, (135, 88, 6, 82, 246, 240, 124, 89 ));
   
   ------------------------------------------------------------------------
   type IHolographicSpaceStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsConfigured
   (
      This       : access IHolographicSpaceStatics3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicSpaceStatics3 : aliased constant Windows.IID := (989912637, 45475, 19966, (142, 121, 254, 197, 144, 158, 109, 248 ));
   
   ------------------------------------------------------------------------
   type IHolographicCameraPose_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HolographicCamera
   (
      This       : access IHolographicCameraPose_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicCamera
   )
   return Windows.HRESULT is abstract;
   
   function get_Viewport
   (
      This       : access IHolographicCameraPose_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function TryGetViewTransform
   (
      This       : access IHolographicCameraPose_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Graphics.Holographic.IReference_HolographicStereoTransform -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ProjectionTransform
   (
      This       : access IHolographicCameraPose_Interface
      ; RetVal : access Windows.Graphics.Holographic.HolographicStereoTransform
   )
   return Windows.HRESULT is abstract;
   
   function TryGetCullingFrustum
   (
      This       : access IHolographicCameraPose_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Perception.Spatial.IReference_SpatialBoundingFrustum -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryGetVisibleFrustum
   (
      This       : access IHolographicCameraPose_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Perception.Spatial.IReference_SpatialBoundingFrustum -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NearPlaneDistance
   (
      This       : access IHolographicCameraPose_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FarPlaneDistance
   (
      This       : access IHolographicCameraPose_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicCameraPose : aliased constant Windows.IID := (226328112, 4830, 17853, (145, 43, 199, 246, 86, 21, 153, 209 ));
   
   ------------------------------------------------------------------------
   type IHolographicFramePrediction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CameraPoses
   (
      This       : access IHolographicFramePrediction_Interface
      ; RetVal : access Windows.Graphics.Holographic.IVectorView_IHolographicCameraPose -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access IHolographicFramePrediction_Interface
      ; RetVal : access Windows.Perception.IPerceptionTimestamp
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicFramePrediction : aliased constant Windows.IID := (1376734689, 23562, 20089, (168, 30, 106, 190, 2, 187, 39, 57 ));
   
   ------------------------------------------------------------------------
   type IHolographicCameraRenderingParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function SetFocusPoint
   (
      This       : access IHolographicCameraRenderingParameters_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; position : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function SetFocusPointWithNormal
   (
      This       : access IHolographicCameraRenderingParameters_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; position : Windows.Foundation.Numerics.Vector3
      ; normal : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function SetFocusPointWithNormalLinearVelocity
   (
      This       : access IHolographicCameraRenderingParameters_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; position : Windows.Foundation.Numerics.Vector3
      ; normal : Windows.Foundation.Numerics.Vector3
      ; linearVelocity : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Direct3D11Device
   (
      This       : access IHolographicCameraRenderingParameters_Interface
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Direct3D11BackBuffer
   (
      This       : access IHolographicCameraRenderingParameters_Interface
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicCameraRenderingParameters : aliased constant Windows.IID := (2393648849, 23540, 19990, (130, 54, 174, 8, 0, 193, 29, 13 ));
   
   ------------------------------------------------------------------------
   type IHolographicFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AddedCameras
   (
      This       : access IHolographicFrame_Interface
      ; RetVal : access Windows.Graphics.Holographic.IVectorView_IHolographicCamera -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RemovedCameras
   (
      This       : access IHolographicFrame_Interface
      ; RetVal : access Windows.Graphics.Holographic.IVectorView_IHolographicCamera -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRenderingParameters
   (
      This       : access IHolographicFrame_Interface
      ; cameraPose : Windows.Graphics.Holographic.IHolographicCameraPose
      ; RetVal : access Windows.Graphics.Holographic.IHolographicCameraRenderingParameters
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IHolographicFrame_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentPrediction
   (
      This       : access IHolographicFrame_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicFramePrediction
   )
   return Windows.HRESULT is abstract;
   
   function UpdateCurrentPrediction
   (
      This       : access IHolographicFrame_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PresentUsingCurrentPrediction
   (
      This       : access IHolographicFrame_Interface
      ; RetVal : access Windows.Graphics.Holographic.HolographicFramePresentResult
   )
   return Windows.HRESULT is abstract;
   
   function PresentUsingCurrentPredictionWithBehavior
   (
      This       : access IHolographicFrame_Interface
      ; waitBehavior : Windows.Graphics.Holographic.HolographicFramePresentWaitBehavior
      ; RetVal : access Windows.Graphics.Holographic.HolographicFramePresentResult
   )
   return Windows.HRESULT is abstract;
   
   function WaitForFrameToFinish
   (
      This       : access IHolographicFrame_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicFrame : aliased constant Windows.IID := (3331886774, 43193, 12372, (166, 235, 214, 36, 182, 83, 99, 117 ));
   
   ------------------------------------------------------------------------
   type IHolographicFrame2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetQuadLayerUpdateParameters
   (
      This       : access IHolographicFrame2_Interface
      ; layer : Windows.Graphics.Holographic.IHolographicQuadLayer
      ; RetVal : access Windows.Graphics.Holographic.IHolographicQuadLayerUpdateParameters
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicFrame2 : aliased constant Windows.IID := (675231679, 15346, 24209, (102, 51, 135, 5, 116, 230, 242, 23 ));
   
   ------------------------------------------------------------------------
   type IHolographicCameraRenderingParameters2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ReprojectionMode
   (
      This       : access IHolographicCameraRenderingParameters2_Interface
      ; RetVal : access Windows.Graphics.Holographic.HolographicReprojectionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ReprojectionMode
   (
      This       : access IHolographicCameraRenderingParameters2_Interface
      ; value : Windows.Graphics.Holographic.HolographicReprojectionMode
   )
   return Windows.HRESULT is abstract;
   
   function CommitDirect3D11DepthBuffer
   (
      This       : access IHolographicCameraRenderingParameters2_Interface
      ; value : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicCameraRenderingParameters2 : aliased constant Windows.IID := (638742755, 46742, 17972, (148, 214, 190, 6, 129, 100, 53, 153 ));
   
   ------------------------------------------------------------------------
   type IHolographicCameraRenderingParameters3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsContentProtectionEnabled
   (
      This       : access IHolographicCameraRenderingParameters3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsContentProtectionEnabled
   (
      This       : access IHolographicCameraRenderingParameters3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicCameraRenderingParameters3 : aliased constant Windows.IID := (2980729151, 4973, 19206, (185, 212, 228, 185, 20, 205, 6, 131 ));
   
   ------------------------------------------------------------------------
   type IHolographicCameraViewportParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HiddenAreaMesh
   (
      This       : access IHolographicCameraViewportParameters_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_VisibleAreaMesh
   (
      This       : access IHolographicCameraViewportParameters_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicCameraViewportParameters : aliased constant Windows.IID := (2160980983, 33834, 16865, (147, 237, 86, 146, 171, 31, 187, 16 ));
   
   ------------------------------------------------------------------------
   type IHolographicCamera2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LeftViewportParameters
   (
      This       : access IHolographicCamera2_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicCameraViewportParameters
   )
   return Windows.HRESULT is abstract;
   
   function get_RightViewportParameters
   (
      This       : access IHolographicCamera2_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicCameraViewportParameters
   )
   return Windows.HRESULT is abstract;
   
   function get_Display
   (
      This       : access IHolographicCamera2_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicDisplay
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicCamera2 : aliased constant Windows.IID := (3042680602, 47756, 20356, (173, 121, 46, 126, 30, 36, 80, 243 ));
   
   ------------------------------------------------------------------------
   type IHolographicCamera3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPrimaryLayerEnabled
   (
      This       : access IHolographicCamera3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPrimaryLayerEnabled
   (
      This       : access IHolographicCamera3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxQuadLayerCount
   (
      This       : access IHolographicCamera3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_QuadLayers
   (
      This       : access IHolographicCamera3_Interface
      ; RetVal : access Windows.Graphics.Holographic.IVector_IHolographicQuadLayer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicCamera3 : aliased constant Windows.IID := (1168789427, 31577, 21070, (74, 63, 74, 106, 214, 101, 4, 119 ));
   
   ------------------------------------------------------------------------
   type IHolographicDisplay_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IHolographicDisplay_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxViewportSize
   (
      This       : access IHolographicDisplay_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStereo
   (
      This       : access IHolographicDisplay_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOpaque
   (
      This       : access IHolographicDisplay_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AdapterId
   (
      This       : access IHolographicDisplay_Interface
      ; RetVal : access Windows.Graphics.Holographic.HolographicAdapterId
   )
   return Windows.HRESULT is abstract;
   
   function get_SpatialLocator
   (
      This       : access IHolographicDisplay_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialLocator
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicDisplay : aliased constant Windows.IID := (2597233684, 7583, 16528, (163, 136, 144, 192, 111, 110, 174, 156 ));
   
   ------------------------------------------------------------------------
   type IHolographicDisplay2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RefreshRate
   (
      This       : access IHolographicDisplay2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicDisplay2 : aliased constant Windows.IID := (1974222722, 59221, 17260, (141, 150, 77, 50, 209, 49, 71, 62 ));
   
   ------------------------------------------------------------------------
   type IHolographicDisplayStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IHolographicDisplayStatics_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicDisplay
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicDisplayStatics : aliased constant Windows.IID := (3409398147, 59312, 18497, (131, 85, 58, 229, 181, 54, 233, 164 ));
   
   ------------------------------------------------------------------------
   type IHolographicQuadLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PixelFormat
   (
      This       : access IHolographicQuadLayer_Interface
      ; RetVal : access Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IHolographicQuadLayer_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicQuadLayer : aliased constant Windows.IID := (2419351753, 51673, 23900, (65, 172, 162, 213, 171, 15, 211, 49 ));
   
   ------------------------------------------------------------------------
   type IHolographicQuadLayerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHolographicQuadLayerFactory_Interface
      ; size : Windows.Foundation.Size
      ; RetVal : access Windows.Graphics.Holographic.IHolographicQuadLayer
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithPixelFormat
   (
      This       : access IHolographicQuadLayerFactory_Interface
      ; size : Windows.Foundation.Size
      ; pixelFormat : Windows.Graphics.DirectX.DirectXPixelFormat
      ; RetVal : access Windows.Graphics.Holographic.IHolographicQuadLayer
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicQuadLayerFactory : aliased constant Windows.IID := (2792700147, 23060, 23056, (72, 154, 69, 80, 101, 179, 123, 118 ));
   
   ------------------------------------------------------------------------
   type IHolographicQuadLayerUpdateParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function AcquireBufferToUpdateContent
   (
      This       : access IHolographicQuadLayerUpdateParameters_Interface
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   function UpdateViewport
   (
      This       : access IHolographicQuadLayerUpdateParameters_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function UpdateContentProtectionEnabled
   (
      This       : access IHolographicQuadLayerUpdateParameters_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function UpdateExtents
   (
      This       : access IHolographicQuadLayerUpdateParameters_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function UpdateLocationWithStationaryMode
   (
      This       : access IHolographicQuadLayerUpdateParameters_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; position : Windows.Foundation.Numerics.Vector3
      ; orientation : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function UpdateLocationWithDisplayRelativeMode
   (
      This       : access IHolographicQuadLayerUpdateParameters_Interface
      ; position : Windows.Foundation.Numerics.Vector3
      ; orientation : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   IID_IHolographicQuadLayerUpdateParameters : aliased constant Windows.IID := (722379696, 31117, 23498, (85, 194, 44, 12, 118, 46, 187, 8 ));
   
   ------------------------------------------------------------------------
   type IReference_HolographicStereoTransform_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_HolographicStereoTransform_Interface
      ; RetVal : access Windows.Graphics.Holographic.HolographicStereoTransform
   )
   return Windows.HRESULT is abstract;
   
   IID_IReference_HolographicStereoTransform : aliased constant Windows.IID := (1852296824, 52327, 21184, (182, 53, 153, 29, 176, 191, 245, 202 ));
   
   ------------------------------------------------------------------------
   type IIterator_IHolographicCameraPose_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHolographicCameraPose_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicCameraPose
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHolographicCameraPose_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHolographicCameraPose_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHolographicCameraPose_Interface
      ; items : Windows.Graphics.Holographic.IHolographicCameraPose_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IHolographicCameraPose : aliased constant Windows.IID := (2481094580, 13099, 22814, (174, 107, 97, 146, 250, 10, 16, 9 ));
   
   ------------------------------------------------------------------------
   type IIterable_IHolographicCameraPose_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHolographicCameraPose_Interface
      ; RetVal : access Windows.Graphics.Holographic.IIterator_IHolographicCameraPose
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IHolographicCameraPose : aliased constant Windows.IID := (2450594559, 36300, 21390, (174, 61, 49, 253, 37, 42, 10, 213 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IHolographicCameraPose_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHolographicCameraPose_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Holographic.IHolographicCameraPose
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHolographicCameraPose_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHolographicCameraPose_Interface
      ; value : Windows.Graphics.Holographic.IHolographicCameraPose
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHolographicCameraPose_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Holographic.IHolographicCameraPose_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IHolographicCameraPose : aliased constant Windows.IID := (398843825, 28295, 23063, (167, 145, 172, 7, 248, 238, 146, 146 ));
   
   ------------------------------------------------------------------------
   type IIterator_IHolographicCamera_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHolographicCamera_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicCamera
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHolographicCamera_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHolographicCamera_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHolographicCamera_Interface
      ; items : Windows.Graphics.Holographic.IHolographicCamera_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IHolographicCamera : aliased constant Windows.IID := (1791788406, 12266, 22045, (132, 221, 74, 26, 176, 95, 199, 237 ));
   
   ------------------------------------------------------------------------
   type IIterable_IHolographicCamera_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHolographicCamera_Interface
      ; RetVal : access Windows.Graphics.Holographic.IIterator_IHolographicCamera
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IHolographicCamera : aliased constant Windows.IID := (2997866836, 36272, 23474, (173, 122, 104, 74, 253, 71, 146, 100 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IHolographicCamera_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHolographicCamera_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Holographic.IHolographicCamera
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHolographicCamera_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHolographicCamera_Interface
      ; value : Windows.Graphics.Holographic.IHolographicCamera
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHolographicCamera_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Holographic.IHolographicCamera_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IHolographicCamera : aliased constant Windows.IID := (30851246, 44453, 20656, (133, 98, 65, 251, 18, 5, 187, 74 ));
   
   ------------------------------------------------------------------------
   type IIterator_IHolographicQuadLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHolographicQuadLayer_Interface
      ; RetVal : access Windows.Graphics.Holographic.IHolographicQuadLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHolographicQuadLayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHolographicQuadLayer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHolographicQuadLayer_Interface
      ; items : Windows.Graphics.Holographic.IHolographicQuadLayer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IHolographicQuadLayer : aliased constant Windows.IID := (2239123824, 18779, 21532, (174, 240, 116, 146, 133, 109, 227, 223 ));
   
   ------------------------------------------------------------------------
   type IIterable_IHolographicQuadLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHolographicQuadLayer_Interface
      ; RetVal : access Windows.Graphics.Holographic.IIterator_IHolographicQuadLayer
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IHolographicQuadLayer : aliased constant Windows.IID := (2222212705, 38110, 22630, (161, 93, 158, 251, 25, 169, 154, 84 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IHolographicQuadLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHolographicQuadLayer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Holographic.IHolographicQuadLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHolographicQuadLayer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHolographicQuadLayer_Interface
      ; value : Windows.Graphics.Holographic.IHolographicQuadLayer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHolographicQuadLayer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Holographic.IHolographicQuadLayer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IHolographicQuadLayer : aliased constant Windows.IID := (525462751, 53037, 23422, (170, 233, 214, 98, 138, 81, 141, 190 ));
   
   ------------------------------------------------------------------------
   type IVector_IHolographicQuadLayer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IHolographicQuadLayer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Holographic.IHolographicQuadLayer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IHolographicQuadLayer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IHolographicQuadLayer_Interface
      ; RetVal : access Windows.Graphics.Holographic.IVectorView_IHolographicQuadLayer
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IHolographicQuadLayer_Interface
      ; value : Windows.Graphics.Holographic.IHolographicQuadLayer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IHolographicQuadLayer_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Holographic.IHolographicQuadLayer
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IHolographicQuadLayer_Interface
      ; index : Windows.UInt32
      ; value : Windows.Graphics.Holographic.IHolographicQuadLayer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IHolographicQuadLayer_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IHolographicQuadLayer_Interface
      ; value : Windows.Graphics.Holographic.IHolographicQuadLayer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IHolographicQuadLayer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IHolographicQuadLayer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IHolographicQuadLayer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Holographic.IHolographicQuadLayer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IHolographicQuadLayer_Interface
      ; items : Windows.Graphics.Holographic.IHolographicQuadLayer_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IHolographicQuadLayer : aliased constant Windows.IID := (3659849676, 19540, 20883, (146, 29, 198, 133, 181, 125, 229, 89 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IHolographicSpace_add_CameraAdded_Interface(Callback : access procedure (sender : Windows.Graphics.Holographic.IHolographicSpace ; args : Windows.Graphics.Holographic.IHolographicSpaceCameraAddedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IHolographicSpace_add_CameraAdded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IHolographicSpace_add_CameraAdded_Interface
      ; sender : Windows.Graphics.Holographic.IHolographicSpace
      ; args : Windows.Graphics.Holographic.IHolographicSpaceCameraAddedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IHolographicSpace_add_CameraAdded : aliased constant Windows.IID := (1909984124, 7463, 20738, (131, 209, 79, 14, 252, 124, 157, 111 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IHolographicSpace_add_CameraRemoved_Interface(Callback : access procedure (sender : Windows.Graphics.Holographic.IHolographicSpace ; args : Windows.Graphics.Holographic.IHolographicSpaceCameraRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IHolographicSpace_add_CameraRemoved_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IHolographicSpace_add_CameraRemoved_Interface
      ; sender : Windows.Graphics.Holographic.IHolographicSpace
      ; args : Windows.Graphics.Holographic.IHolographicSpaceCameraRemovedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IHolographicSpace_add_CameraRemoved : aliased constant Windows.IID := (3681079235, 2164, 20522, (163, 185, 43, 31, 232, 108, 103, 190 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype HolographicCamera is Windows.Graphics.Holographic.IHolographicCamera;
   subtype HolographicSpace is Windows.Graphics.Holographic.IHolographicSpace;
   subtype HolographicSpaceCameraAddedEventArgs is Windows.Graphics.Holographic.IHolographicSpaceCameraAddedEventArgs;
   subtype HolographicSpaceCameraRemovedEventArgs is Windows.Graphics.Holographic.IHolographicSpaceCameraRemovedEventArgs;
   subtype HolographicFrame is Windows.Graphics.Holographic.IHolographicFrame;
   subtype HolographicCameraPose is Windows.Graphics.Holographic.IHolographicCameraPose;
   subtype HolographicCameraRenderingParameters is Windows.Graphics.Holographic.IHolographicCameraRenderingParameters;
   subtype HolographicFramePrediction is Windows.Graphics.Holographic.IHolographicFramePrediction;
   subtype HolographicQuadLayer is Windows.Graphics.Holographic.IHolographicQuadLayer;
   
   function Create
   (
      size : Windows.Foundation.Size
   )
   return Windows.Graphics.Holographic.IHolographicQuadLayer;
   
   function CreateWithPixelFormat
   (
      size : Windows.Foundation.Size
      ; pixelFormat : Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.Graphics.Holographic.IHolographicQuadLayer;
   
   subtype HolographicQuadLayerUpdateParameters is Windows.Graphics.Holographic.IHolographicQuadLayerUpdateParameters;
   subtype HolographicCameraViewportParameters is Windows.Graphics.Holographic.IHolographicCameraViewportParameters;
   subtype HolographicDisplay is Windows.Graphics.Holographic.IHolographicDisplay;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateForCoreWindow
   (
      window : Windows.UI.Core.ICoreWindow
   )
   return Windows.Graphics.Holographic.IHolographicSpace;
   
   function get_IsConfigured
   return Windows.Boolean;
   
   function get_IsSupported
   return Windows.Boolean;
   
   function get_IsAvailable
   return Windows.Boolean;
   
   function add_IsAvailableChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_IsAvailableChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function GetDefault
   return Windows.Graphics.Holographic.IHolographicDisplay;

end;
