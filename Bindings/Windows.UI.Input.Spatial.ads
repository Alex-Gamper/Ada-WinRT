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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
limited with Windows.Perception.Spatial;
with Windows.Foundation.Numerics;
with Windows.Foundation;
limited with Windows.Perception;
limited with Windows.Devices.Haptics;
limited with Windows.Storage.Streams;
limited with Windows.Devices.Power;
limited with Windows.Perception.People;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.UI.Input.Spatial is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SpatialGestureSettings is (
      None,
      Tap,
      DoubleTap,
      Hold,
      ManipulationTranslate,
      NavigationX,
      NavigationY,
      NavigationZ,
      NavigationRailsX,
      NavigationRailsY,
      NavigationRailsZ
   );
   for SpatialGestureSettings use (
      None => 0,
      Tap => 1,
      DoubleTap => 2,
      Hold => 4,
      ManipulationTranslate => 8,
      NavigationX => 16,
      NavigationY => 32,
      NavigationZ => 64,
      NavigationRailsX => 128,
      NavigationRailsY => 256,
      NavigationRailsZ => 512
   );
   for SpatialGestureSettings'Size use 32;
   
   type SpatialGestureSettings_Ptr is access SpatialGestureSettings;
   
   type SpatialInteractionSourceKind is (
      Other,
      Hand,
      Voice,
      Controller
   );
   for SpatialInteractionSourceKind use (
      Other => 0,
      Hand => 1,
      Voice => 2,
      Controller => 3
   );
   for SpatialInteractionSourceKind'Size use 32;
   
   type SpatialInteractionSourceKind_Ptr is access SpatialInteractionSourceKind;
   
   type SpatialInteractionPressKind is (
      None,
      Select_x,
      Menu,
      Grasp,
      Touchpad,
      Thumbstick
   );
   for SpatialInteractionPressKind use (
      None => 0,
      Select_x => 1,
      Menu => 2,
      Grasp => 3,
      Touchpad => 4,
      Thumbstick => 5
   );
   for SpatialInteractionPressKind'Size use 32;
   
   type SpatialInteractionPressKind_Ptr is access SpatialInteractionPressKind;
   
   type SpatialInteractionSourceHandedness is (
      Unspecified,
      Left,
      Right
   );
   for SpatialInteractionSourceHandedness use (
      Unspecified => 0,
      Left => 1,
      Right => 2
   );
   for SpatialInteractionSourceHandedness'Size use 32;
   
   type SpatialInteractionSourceHandedness_Ptr is access SpatialInteractionSourceHandedness;
   
   type SpatialInteractionSourcePositionAccuracy is (
      High,
      Approximate
   );
   for SpatialInteractionSourcePositionAccuracy use (
      High => 0,
      Approximate => 1
   );
   for SpatialInteractionSourcePositionAccuracy'Size use 32;
   
   type SpatialInteractionSourcePositionAccuracy_Ptr is access SpatialInteractionSourcePositionAccuracy;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted is access all TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted;
   type TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded is access all TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded;
   type TypedEventHandler_ISpatialGestureRecognizer_add_Tapped_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_Tapped is access all TypedEventHandler_ISpatialGestureRecognizer_add_Tapped_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_Tapped_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_Tapped;
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted is access all TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted;
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted is access all TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted;
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled is access all TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted is access all TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated is access all TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted is access all TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled is access all TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted is access all TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated is access all TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted is access all TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled_Interface;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled is access all TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled_Interface'Class;
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled_Ptr is access all TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceDetected_Interface;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceDetected is access all TypedEventHandler_ISpatialInteractionManager_add_SourceDetected_Interface'Class;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceDetected_Ptr is access all TypedEventHandler_ISpatialInteractionManager_add_SourceDetected;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceLost_Interface;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceLost is access all TypedEventHandler_ISpatialInteractionManager_add_SourceLost_Interface'Class;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceLost_Ptr is access all TypedEventHandler_ISpatialInteractionManager_add_SourceLost;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated_Interface;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated is access all TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated_Interface'Class;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated_Ptr is access all TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated;
   type TypedEventHandler_ISpatialInteractionManager_add_SourcePressed_Interface;
   type TypedEventHandler_ISpatialInteractionManager_add_SourcePressed is access all TypedEventHandler_ISpatialInteractionManager_add_SourcePressed_Interface'Class;
   type TypedEventHandler_ISpatialInteractionManager_add_SourcePressed_Ptr is access all TypedEventHandler_ISpatialInteractionManager_add_SourcePressed;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceReleased_Interface;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceReleased is access all TypedEventHandler_ISpatialInteractionManager_add_SourceReleased_Interface'Class;
   type TypedEventHandler_ISpatialInteractionManager_add_SourceReleased_Ptr is access all TypedEventHandler_ISpatialInteractionManager_add_SourceReleased;
   type TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected_Interface;
   type TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected is access all TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected_Interface'Class;
   type TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected_Ptr is access all TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISpatialRecognitionStartedEventArgs_Interface;
   type ISpatialRecognitionStartedEventArgs is access all ISpatialRecognitionStartedEventArgs_Interface'Class;
   type ISpatialRecognitionStartedEventArgs_Ptr is access all ISpatialRecognitionStartedEventArgs;
   type ISpatialRecognitionEndedEventArgs_Interface;
   type ISpatialRecognitionEndedEventArgs is access all ISpatialRecognitionEndedEventArgs_Interface'Class;
   type ISpatialRecognitionEndedEventArgs_Ptr is access all ISpatialRecognitionEndedEventArgs;
   type ISpatialTappedEventArgs_Interface;
   type ISpatialTappedEventArgs is access all ISpatialTappedEventArgs_Interface'Class;
   type ISpatialTappedEventArgs_Ptr is access all ISpatialTappedEventArgs;
   type ISpatialHoldStartedEventArgs_Interface;
   type ISpatialHoldStartedEventArgs is access all ISpatialHoldStartedEventArgs_Interface'Class;
   type ISpatialHoldStartedEventArgs_Ptr is access all ISpatialHoldStartedEventArgs;
   type ISpatialHoldCompletedEventArgs_Interface;
   type ISpatialHoldCompletedEventArgs is access all ISpatialHoldCompletedEventArgs_Interface'Class;
   type ISpatialHoldCompletedEventArgs_Ptr is access all ISpatialHoldCompletedEventArgs;
   type ISpatialHoldCanceledEventArgs_Interface;
   type ISpatialHoldCanceledEventArgs is access all ISpatialHoldCanceledEventArgs_Interface'Class;
   type ISpatialHoldCanceledEventArgs_Ptr is access all ISpatialHoldCanceledEventArgs;
   type ISpatialManipulationDelta_Interface;
   type ISpatialManipulationDelta is access all ISpatialManipulationDelta_Interface'Class;
   type ISpatialManipulationDelta_Ptr is access all ISpatialManipulationDelta;
   type ISpatialManipulationStartedEventArgs_Interface;
   type ISpatialManipulationStartedEventArgs is access all ISpatialManipulationStartedEventArgs_Interface'Class;
   type ISpatialManipulationStartedEventArgs_Ptr is access all ISpatialManipulationStartedEventArgs;
   type ISpatialManipulationUpdatedEventArgs_Interface;
   type ISpatialManipulationUpdatedEventArgs is access all ISpatialManipulationUpdatedEventArgs_Interface'Class;
   type ISpatialManipulationUpdatedEventArgs_Ptr is access all ISpatialManipulationUpdatedEventArgs;
   type ISpatialManipulationCompletedEventArgs_Interface;
   type ISpatialManipulationCompletedEventArgs is access all ISpatialManipulationCompletedEventArgs_Interface'Class;
   type ISpatialManipulationCompletedEventArgs_Ptr is access all ISpatialManipulationCompletedEventArgs;
   type ISpatialManipulationCanceledEventArgs_Interface;
   type ISpatialManipulationCanceledEventArgs is access all ISpatialManipulationCanceledEventArgs_Interface'Class;
   type ISpatialManipulationCanceledEventArgs_Ptr is access all ISpatialManipulationCanceledEventArgs;
   type ISpatialNavigationStartedEventArgs_Interface;
   type ISpatialNavigationStartedEventArgs is access all ISpatialNavigationStartedEventArgs_Interface'Class;
   type ISpatialNavigationStartedEventArgs_Ptr is access all ISpatialNavigationStartedEventArgs;
   type ISpatialNavigationUpdatedEventArgs_Interface;
   type ISpatialNavigationUpdatedEventArgs is access all ISpatialNavigationUpdatedEventArgs_Interface'Class;
   type ISpatialNavigationUpdatedEventArgs_Ptr is access all ISpatialNavigationUpdatedEventArgs;
   type ISpatialNavigationCompletedEventArgs_Interface;
   type ISpatialNavigationCompletedEventArgs is access all ISpatialNavigationCompletedEventArgs_Interface'Class;
   type ISpatialNavigationCompletedEventArgs_Ptr is access all ISpatialNavigationCompletedEventArgs;
   type ISpatialNavigationCanceledEventArgs_Interface;
   type ISpatialNavigationCanceledEventArgs is access all ISpatialNavigationCanceledEventArgs_Interface'Class;
   type ISpatialNavigationCanceledEventArgs_Ptr is access all ISpatialNavigationCanceledEventArgs;
   type ISpatialGestureRecognizer_Interface;
   type ISpatialGestureRecognizer is access all ISpatialGestureRecognizer_Interface'Class;
   type ISpatialGestureRecognizer_Ptr is access all ISpatialGestureRecognizer;
   type ISpatialGestureRecognizerFactory_Interface;
   type ISpatialGestureRecognizerFactory is access all ISpatialGestureRecognizerFactory_Interface'Class;
   type ISpatialGestureRecognizerFactory_Ptr is access all ISpatialGestureRecognizerFactory;
   type ISpatialInteractionSourceLocation_Interface;
   type ISpatialInteractionSourceLocation is access all ISpatialInteractionSourceLocation_Interface'Class;
   type ISpatialInteractionSourceLocation_Ptr is access all ISpatialInteractionSourceLocation;
   type ISpatialInteractionSourceLocation2_Interface;
   type ISpatialInteractionSourceLocation2 is access all ISpatialInteractionSourceLocation2_Interface'Class;
   type ISpatialInteractionSourceLocation2_Ptr is access all ISpatialInteractionSourceLocation2;
   type ISpatialInteractionSourceLocation3_Interface;
   type ISpatialInteractionSourceLocation3 is access all ISpatialInteractionSourceLocation3_Interface'Class;
   type ISpatialInteractionSourceLocation3_Ptr is access all ISpatialInteractionSourceLocation3;
   type ISpatialPointerInteractionSourcePose_Interface;
   type ISpatialPointerInteractionSourcePose is access all ISpatialPointerInteractionSourcePose_Interface'Class;
   type ISpatialPointerInteractionSourcePose_Ptr is access all ISpatialPointerInteractionSourcePose;
   type ISpatialPointerInteractionSourcePose2_Interface;
   type ISpatialPointerInteractionSourcePose2 is access all ISpatialPointerInteractionSourcePose2_Interface'Class;
   type ISpatialPointerInteractionSourcePose2_Ptr is access all ISpatialPointerInteractionSourcePose2;
   type ISpatialInteractionSource_Interface;
   type ISpatialInteractionSource is access all ISpatialInteractionSource_Interface'Class;
   type ISpatialInteractionSource_Ptr is access all ISpatialInteractionSource;
   type ISpatialInteractionSource2_Interface;
   type ISpatialInteractionSource2 is access all ISpatialInteractionSource2_Interface'Class;
   type ISpatialInteractionSource2_Ptr is access all ISpatialInteractionSource2;
   type ISpatialInteractionSource3_Interface;
   type ISpatialInteractionSource3 is access all ISpatialInteractionSource3_Interface'Class;
   type ISpatialInteractionSource3_Ptr is access all ISpatialInteractionSource3;
   type ISpatialInteractionSourceProperties_Interface;
   type ISpatialInteractionSourceProperties is access all ISpatialInteractionSourceProperties_Interface'Class;
   type ISpatialInteractionSourceProperties_Ptr is access all ISpatialInteractionSourceProperties;
   type ISpatialInteractionController_Interface;
   type ISpatialInteractionController is access all ISpatialInteractionController_Interface'Class;
   type ISpatialInteractionController_Ptr is access all ISpatialInteractionController;
   type ISpatialInteractionController2_Interface;
   type ISpatialInteractionController2 is access all ISpatialInteractionController2_Interface'Class;
   type ISpatialInteractionController2_Ptr is access all ISpatialInteractionController2;
   type ISpatialInteractionController3_Interface;
   type ISpatialInteractionController3 is access all ISpatialInteractionController3_Interface'Class;
   type ISpatialInteractionController3_Ptr is access all ISpatialInteractionController3;
   type ISpatialPointerPose_Interface;
   type ISpatialPointerPose is access all ISpatialPointerPose_Interface'Class;
   type ISpatialPointerPose_Ptr is access all ISpatialPointerPose;
   type ISpatialPointerPose2_Interface;
   type ISpatialPointerPose2 is access all ISpatialPointerPose2_Interface'Class;
   type ISpatialPointerPose2_Ptr is access all ISpatialPointerPose2;
   type ISpatialPointerPoseStatics_Interface;
   type ISpatialPointerPoseStatics is access all ISpatialPointerPoseStatics_Interface'Class;
   type ISpatialPointerPoseStatics_Ptr is access all ISpatialPointerPoseStatics;
   type ISpatialInteractionSourceState_Interface;
   type ISpatialInteractionSourceState is access all ISpatialInteractionSourceState_Interface'Class;
   type ISpatialInteractionSourceState_Ptr is access all ISpatialInteractionSourceState;
   type ISpatialInteractionSourceState2_Interface;
   type ISpatialInteractionSourceState2 is access all ISpatialInteractionSourceState2_Interface'Class;
   type ISpatialInteractionSourceState2_Ptr is access all ISpatialInteractionSourceState2;
   type ISpatialInteractionControllerProperties_Interface;
   type ISpatialInteractionControllerProperties is access all ISpatialInteractionControllerProperties_Interface'Class;
   type ISpatialInteractionControllerProperties_Ptr is access all ISpatialInteractionControllerProperties;
   type ISpatialInteraction_Interface;
   type ISpatialInteraction is access all ISpatialInteraction_Interface'Class;
   type ISpatialInteraction_Ptr is access all ISpatialInteraction;
   type ISpatialInteractionDetectedEventArgs_Interface;
   type ISpatialInteractionDetectedEventArgs is access all ISpatialInteractionDetectedEventArgs_Interface'Class;
   type ISpatialInteractionDetectedEventArgs_Ptr is access all ISpatialInteractionDetectedEventArgs;
   type ISpatialInteractionDetectedEventArgs2_Interface;
   type ISpatialInteractionDetectedEventArgs2 is access all ISpatialInteractionDetectedEventArgs2_Interface'Class;
   type ISpatialInteractionDetectedEventArgs2_Ptr is access all ISpatialInteractionDetectedEventArgs2;
   type ISpatialInteractionSourceEventArgs_Interface;
   type ISpatialInteractionSourceEventArgs is access all ISpatialInteractionSourceEventArgs_Interface'Class;
   type ISpatialInteractionSourceEventArgs_Ptr is access all ISpatialInteractionSourceEventArgs;
   type ISpatialInteractionSourceEventArgs2_Interface;
   type ISpatialInteractionSourceEventArgs2 is access all ISpatialInteractionSourceEventArgs2_Interface'Class;
   type ISpatialInteractionSourceEventArgs2_Ptr is access all ISpatialInteractionSourceEventArgs2;
   type ISpatialInteractionManager_Interface;
   type ISpatialInteractionManager is access all ISpatialInteractionManager_Interface'Class;
   type ISpatialInteractionManager_Ptr is access all ISpatialInteractionManager;
   type ISpatialInteractionManagerStatics_Interface;
   type ISpatialInteractionManagerStatics is access all ISpatialInteractionManagerStatics_Interface'Class;
   type ISpatialInteractionManagerStatics_Ptr is access all ISpatialInteractionManagerStatics;
   type IIterator_ISpatialInteractionSourceState_Interface;
   type IIterator_ISpatialInteractionSourceState is access all IIterator_ISpatialInteractionSourceState_Interface'Class;
   type IIterator_ISpatialInteractionSourceState_Ptr is access all IIterator_ISpatialInteractionSourceState;
   type IIterable_ISpatialInteractionSourceState_Interface;
   type IIterable_ISpatialInteractionSourceState is access all IIterable_ISpatialInteractionSourceState_Interface'Class;
   type IIterable_ISpatialInteractionSourceState_Ptr is access all IIterable_ISpatialInteractionSourceState;
   type IVectorView_ISpatialInteractionSourceState_Interface;
   type IVectorView_ISpatialInteractionSourceState is access all IVectorView_ISpatialInteractionSourceState_Interface'Class;
   type IVectorView_ISpatialInteractionSourceState_Ptr is access all IVectorView_ISpatialInteractionSourceState;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISpatialRecognitionStartedEventArgs : aliased constant Windows.IID := (618271375, 8, 19053, (170, 80, 42, 118, 249, 207, 178, 100 ));
   
   type ISpatialRecognitionStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialRecognitionStartedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function TryGetPointerPose
   (
      This       : access ISpatialRecognitionStartedEventArgs_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialPointerPose
   )
   return Windows.HRESULT is abstract;
   
   function IsGesturePossible
   (
      This       : access ISpatialRecognitionStartedEventArgs_Interface
      ; gesture : Windows.UI.Input.Spatial.SpatialGestureSettings
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialRecognitionEndedEventArgs : aliased constant Windows.IID := (238417355, 16245, 17395, (172, 129, 209, 220, 45, 249, 177, 251 ));
   
   type ISpatialRecognitionEndedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialRecognitionEndedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialTappedEventArgs : aliased constant Windows.IID := (695043038, 62532, 19105, (178, 191, 157, 200, 141, 86, 125, 166 ));
   
   type ISpatialTappedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialTappedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function TryGetPointerPose
   (
      This       : access ISpatialTappedEventArgs_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialPointerPose
   )
   return Windows.HRESULT is abstract;
   
   function get_TapCount
   (
      This       : access ISpatialTappedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialHoldStartedEventArgs : aliased constant Windows.IID := (2385788281, 44214, 16708, (134, 21, 44, 251, 168, 163, 203, 63 ));
   
   type ISpatialHoldStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialHoldStartedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function TryGetPointerPose
   (
      This       : access ISpatialHoldStartedEventArgs_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialPointerPose
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialHoldCompletedEventArgs : aliased constant Windows.IID := (1063536395, 19709, 17370, (141, 196, 230, 69, 82, 23, 57, 113 ));
   
   type ISpatialHoldCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialHoldCompletedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialHoldCanceledEventArgs : aliased constant Windows.IID := (1576842855, 19626, 16531, (140, 53, 182, 1, 168, 57, 243, 27 ));
   
   type ISpatialHoldCanceledEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialHoldCanceledEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialManipulationDelta : aliased constant Windows.IID := (2817300090, 53539, 14977, (161, 91, 153, 41, 35, 220, 190, 145 ));
   
   type ISpatialManipulationDelta_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Translation
   (
      This       : access ISpatialManipulationDelta_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialManipulationStartedEventArgs : aliased constant Windows.IID := (2715204558, 17061, 14203, (173, 166, 210, 142, 61, 56, 71, 55 ));
   
   type ISpatialManipulationStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialManipulationStartedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function TryGetPointerPose
   (
      This       : access ISpatialManipulationStartedEventArgs_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialPointerPose
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialManipulationUpdatedEventArgs : aliased constant Windows.IID := (1596132251, 24774, 19910, (189, 201, 159, 74, 111, 21, 254, 73 ));
   
   type ISpatialManipulationUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialManipulationUpdatedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function TryGetCumulativeDelta
   (
      This       : access ISpatialManipulationUpdatedEventArgs_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialManipulationCompletedEventArgs : aliased constant Windows.IID := (84436994, 62209, 17219, (146, 80, 47, 186, 165, 248, 122, 55 ));
   
   type ISpatialManipulationCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialManipulationCompletedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function TryGetCumulativeDelta
   (
      This       : access ISpatialManipulationCompletedEventArgs_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialManipulationCanceledEventArgs : aliased constant Windows.IID := (759222731, 59354, 16928, (176, 191, 129, 147, 1, 103, 71, 128 ));
   
   type ISpatialManipulationCanceledEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialManipulationCanceledEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialNavigationStartedEventArgs : aliased constant Windows.IID := (1967797386, 64356, 18006, (142, 189, 157, 238, 202, 175, 228, 117 ));
   
   type ISpatialNavigationStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialNavigationStartedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function TryGetPointerPose
   (
      This       : access ISpatialNavigationStartedEventArgs_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialPointerPose
   )
   return Windows.HRESULT is abstract;
   
   function get_IsNavigatingX
   (
      This       : access ISpatialNavigationStartedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsNavigatingY
   (
      This       : access ISpatialNavigationStartedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsNavigatingZ
   (
      This       : access ISpatialNavigationStartedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialNavigationUpdatedEventArgs : aliased constant Windows.IID := (2607890391, 33693, 19060, (135, 50, 69, 70, 111, 192, 68, 181 ));
   
   type ISpatialNavigationUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialNavigationUpdatedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizedOffset
   (
      This       : access ISpatialNavigationUpdatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialNavigationCompletedEventArgs : aliased constant Windows.IID := (19824823, 44859, 17090, (158, 65, 186, 170, 14, 114, 31, 58 ));
   
   type ISpatialNavigationCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialNavigationCompletedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizedOffset
   (
      This       : access ISpatialNavigationCompletedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialNavigationCanceledEventArgs : aliased constant Windows.IID := (3461365468, 59557, 18160, (146, 212, 60, 18, 43, 53, 17, 42 ));
   
   type ISpatialNavigationCanceledEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialNavigationCanceledEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialGestureRecognizer : aliased constant Windows.IID := (1902140364, 3125, 18035, (173, 189, 204, 4, 202, 166, 239, 69 ));
   
   type ISpatialGestureRecognizer_Interface is interface and Windows.IInspectable_Interface;
   
   function add_RecognitionStarted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RecognitionStarted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RecognitionEnded
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RecognitionEnded
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Tapped
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_Tapped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Tapped
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_HoldStarted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HoldStarted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_HoldCompleted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HoldCompleted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_HoldCanceled
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HoldCanceled
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationStarted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationStarted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationUpdated
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationUpdated
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationCompleted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationCompleted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationCanceled
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationCanceled
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NavigationStarted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NavigationStarted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NavigationUpdated
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NavigationUpdated
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NavigationCompleted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NavigationCompleted
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NavigationCanceled
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; handler : TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NavigationCanceled
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CaptureInteraction
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; interaction : Windows.UI.Input.Spatial.ISpatialInteraction
   )
   return Windows.HRESULT is abstract;
   
   function CancelPendingGestures
   (
      This       : access ISpatialGestureRecognizer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function TrySetGestureSettings
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; settings : Windows.UI.Input.Spatial.SpatialGestureSettings
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_GestureSettings
   (
      This       : access ISpatialGestureRecognizer_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialGestureSettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialGestureRecognizerFactory : aliased constant Windows.IID := (1998668166, 22457, 12624, (131, 130, 105, 139, 36, 226, 100, 208 ));
   
   type ISpatialGestureRecognizerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISpatialGestureRecognizerFactory_Interface
      ; settings : Windows.UI.Input.Spatial.SpatialGestureSettings
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialGestureRecognizer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSourceLocation : aliased constant Windows.IID := (3930494660, 32395, 12490, (188, 197, 199, 113, 137, 206, 163, 10 ));
   
   type ISpatialInteractionSourceLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access ISpatialInteractionSourceLocation_Interface
      ; RetVal : access Windows.Foundation.Numerics.IReference_Vector3 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Velocity
   (
      This       : access ISpatialInteractionSourceLocation_Interface
      ; RetVal : access Windows.Foundation.Numerics.IReference_Vector3 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSourceLocation2 : aliased constant Windows.IID := (1281822789, 14615, 16636, (169, 172, 49, 201, 207, 95, 249, 27 ));
   
   type ISpatialInteractionSourceLocation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Orientation
   (
      This       : access ISpatialInteractionSourceLocation2_Interface
      ; RetVal : access Windows.Foundation.Numerics.IReference_Quaternion -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSourceLocation3 : aliased constant Windows.IID := (1728243294, 59669, 19707, (156, 27, 5, 56, 239, 200, 102, 135 ));
   
   type ISpatialInteractionSourceLocation3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PositionAccuracy
   (
      This       : access ISpatialInteractionSourceLocation3_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourcePositionAccuracy
   )
   return Windows.HRESULT is abstract;
   
   function get_AngularVelocity
   (
      This       : access ISpatialInteractionSourceLocation3_Interface
      ; RetVal : access Windows.Foundation.Numerics.IReference_Vector3 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SourcePointerPose
   (
      This       : access ISpatialInteractionSourceLocation3_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialPointerInteractionSourcePose
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialPointerInteractionSourcePose : aliased constant Windows.IID := (2802860807, 11307, 19770, (146, 167, 128, 206, 215, 196, 160, 208 ));
   
   type ISpatialPointerInteractionSourcePose_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access ISpatialPointerInteractionSourcePose_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_ForwardDirection
   (
      This       : access ISpatialPointerInteractionSourcePose_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_UpDirection
   (
      This       : access ISpatialPointerInteractionSourcePose_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialPointerInteractionSourcePose2 : aliased constant Windows.IID := (3972892344, 21211, 18079, (158, 63, 128, 196, 127, 116, 188, 233 ));
   
   type ISpatialPointerInteractionSourcePose2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Orientation
   (
      This       : access ISpatialPointerInteractionSourcePose2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionAccuracy
   (
      This       : access ISpatialPointerInteractionSourcePose2_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourcePositionAccuracy
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSource : aliased constant Windows.IID := (4216599482, 45235, 12616, (159, 59, 233, 245, 222, 86, 143, 93 ));
   
   type ISpatialInteractionSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ISpatialInteractionSource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access ISpatialInteractionSource_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSource2 : aliased constant Windows.IID := (3838162700, 1136, 16424, (136, 192, 160, 235, 68, 211, 78, 254 ));
   
   type ISpatialInteractionSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPointingSupported
   (
      This       : access ISpatialInteractionSource2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMenuSupported
   (
      This       : access ISpatialInteractionSource2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGraspSupported
   (
      This       : access ISpatialInteractionSource2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Controller
   (
      This       : access ISpatialInteractionSource2_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionController
   )
   return Windows.HRESULT is abstract;
   
   function TryGetStateAtTimestamp
   (
      This       : access ISpatialInteractionSource2_Interface
      ; timestamp : Windows.Perception.IPerceptionTimestamp
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionSourceState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSource3 : aliased constant Windows.IID := (67557881, 39677, 17657, (133, 220, 112, 0, 35, 169, 98, 227 ));
   
   type ISpatialInteractionSource3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handedness
   (
      This       : access ISpatialInteractionSource3_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceHandedness
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSourceProperties : aliased constant Windows.IID := (90195266, 16119, 12834, (159, 83, 99, 201, 203, 126, 59, 199 ));
   
   type ISpatialInteractionSourceProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetSourceLossMitigationDirection
   (
      This       : access ISpatialInteractionSourceProperties_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Foundation.Numerics.IReference_Vector3 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceLossRisk
   (
      This       : access ISpatialInteractionSourceProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function TryGetLocation
   (
      This       : access ISpatialInteractionSourceProperties_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionSourceLocation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionController : aliased constant Windows.IID := (1594776483, 2388, 20119, (134, 197, 231, 243, 11, 17, 77, 253 ));
   
   type ISpatialInteractionController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HasTouchpad
   (
      This       : access ISpatialInteractionController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasThumbstick
   (
      This       : access ISpatialInteractionController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SimpleHapticsController
   (
      This       : access ISpatialInteractionController_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   function get_VendorId
   (
      This       : access ISpatialInteractionController_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_ProductId
   (
      This       : access ISpatialInteractionController_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Version
   (
      This       : access ISpatialInteractionController_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionController2 : aliased constant Windows.IID := (901175588, 51106, 18871, (183, 46, 84, 54, 178, 251, 143, 156 ));
   
   type ISpatialInteractionController2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetRenderableModelAsync
   (
      This       : access ISpatialInteractionController2_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionController3 : aliased constant Windows.IID := (1652844192, 40337, 18955, (136, 141, 22, 94, 103, 10, 140, 213 ));
   
   type ISpatialInteractionController3_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetBatteryReport
   (
      This       : access ISpatialInteractionController3_Interface
      ; RetVal : access Windows.Devices.Power.IBatteryReport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialPointerPose : aliased constant Windows.IID := (1767089198, 49534, 13693, (151, 161, 114, 105, 208, 237, 45, 16 ));
   
   type ISpatialPointerPose_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ISpatialPointerPose_Interface
      ; RetVal : access Windows.Perception.IPerceptionTimestamp
   )
   return Windows.HRESULT is abstract;
   
   function get_Head
   (
      This       : access ISpatialPointerPose_Interface
      ; RetVal : access Windows.Perception.People.IHeadPose
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialPointerPose2 : aliased constant Windows.IID := (2636131095, 38222, 19980, (150, 209, 182, 121, 11, 111, 194, 253 ));
   
   type ISpatialPointerPose2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetInteractionSourcePose
   (
      This       : access ISpatialPointerPose2_Interface
      ; source : Windows.UI.Input.Spatial.ISpatialInteractionSource
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialPointerInteractionSourcePose
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialPointerPoseStatics : aliased constant Windows.IID := (2723516841, 44193, 16096, (152, 22, 120, 92, 251, 46, 63, 184 ));
   
   type ISpatialPointerPoseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetAtTimestamp
   (
      This       : access ISpatialPointerPoseStatics_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; timestamp : Windows.Perception.IPerceptionTimestamp
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialPointerPose
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSourceState : aliased constant Windows.IID := (3586422255, 19299, 14316, (152, 185, 159, 198, 82, 185, 210, 242 ));
   
   type ISpatialInteractionSourceState_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access ISpatialInteractionSourceState_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access ISpatialInteractionSourceState_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionSourceProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPressed
   (
      This       : access ISpatialInteractionSourceState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access ISpatialInteractionSourceState_Interface
      ; RetVal : access Windows.Perception.IPerceptionTimestamp
   )
   return Windows.HRESULT is abstract;
   
   function TryGetPointerPose
   (
      This       : access ISpatialInteractionSourceState_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialPointerPose
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSourceState2 : aliased constant Windows.IID := (1173803197, 6003, 18734, (155, 163, 138, 193, 203, 231, 124, 8 ));
   
   type ISpatialInteractionSourceState2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSelectPressed
   (
      This       : access ISpatialInteractionSourceState2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMenuPressed
   (
      This       : access ISpatialInteractionSourceState2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGrasped
   (
      This       : access ISpatialInteractionSourceState2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectPressedValue
   (
      This       : access ISpatialInteractionSourceState2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ControllerProperties
   (
      This       : access ISpatialInteractionSourceState2_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionControllerProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionControllerProperties : aliased constant Windows.IID := (1627746225, 31657, 20021, (185, 63, 146, 114, 203, 169, 178, 139 ));
   
   type ISpatialInteractionControllerProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTouchpadTouched
   (
      This       : access ISpatialInteractionControllerProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTouchpadPressed
   (
      This       : access ISpatialInteractionControllerProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsThumbstickPressed
   (
      This       : access ISpatialInteractionControllerProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ThumbstickX
   (
      This       : access ISpatialInteractionControllerProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ThumbstickY
   (
      This       : access ISpatialInteractionControllerProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TouchpadX
   (
      This       : access ISpatialInteractionControllerProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TouchpadY
   (
      This       : access ISpatialInteractionControllerProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteraction : aliased constant Windows.IID := (4237719097, 35046, 17990, (145, 18, 67, 68, 170, 236, 157, 250 ));
   
   type ISpatialInteraction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceState
   (
      This       : access ISpatialInteraction_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionSourceState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionDetectedEventArgs : aliased constant Windows.IID := (123238628, 22881, 15169, (157, 251, 206, 165, 216, 156, 195, 138 ));
   
   type ISpatialInteractionDetectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSourceKind
   (
      This       : access ISpatialInteractionDetectedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionSourceKind
   )
   return Windows.HRESULT is abstract;
   
   function TryGetPointerPose
   (
      This       : access ISpatialInteractionDetectedEventArgs_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialPointerPose
   )
   return Windows.HRESULT is abstract;
   
   function get_Interaction
   (
      This       : access ISpatialInteractionDetectedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteraction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionDetectedEventArgs2 : aliased constant Windows.IID := (2066103955, 24339, 16796, (151, 213, 131, 70, 120, 38, 106, 166 ));
   
   type ISpatialInteractionDetectedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSource
   (
      This       : access ISpatialInteractionDetectedEventArgs2_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSourceEventArgs : aliased constant Windows.IID := (599230159, 60451, 14713, (178, 124, 235, 14, 18, 254, 183, 199 ));
   
   type ISpatialInteractionSourceEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access ISpatialInteractionSourceEventArgs_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionSourceState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionSourceEventArgs2 : aliased constant Windows.IID := (3635721319, 58952, 19794, (171, 73, 224, 210, 39, 25, 159, 99 ));
   
   type ISpatialInteractionSourceEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PressKind
   (
      This       : access ISpatialInteractionSourceEventArgs2_Interface
      ; RetVal : access Windows.UI.Input.Spatial.SpatialInteractionPressKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionManager : aliased constant Windows.IID := (849759912, 41306, 14741, (184, 189, 128, 81, 60, 181, 173, 239 ));
   
   type ISpatialInteractionManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SourceDetected
   (
      This       : access ISpatialInteractionManager_Interface
      ; handler : TypedEventHandler_ISpatialInteractionManager_add_SourceDetected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceDetected
   (
      This       : access ISpatialInteractionManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceLost
   (
      This       : access ISpatialInteractionManager_Interface
      ; handler : TypedEventHandler_ISpatialInteractionManager_add_SourceLost
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceLost
   (
      This       : access ISpatialInteractionManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceUpdated
   (
      This       : access ISpatialInteractionManager_Interface
      ; handler : TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceUpdated
   (
      This       : access ISpatialInteractionManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourcePressed
   (
      This       : access ISpatialInteractionManager_Interface
      ; handler : TypedEventHandler_ISpatialInteractionManager_add_SourcePressed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourcePressed
   (
      This       : access ISpatialInteractionManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceReleased
   (
      This       : access ISpatialInteractionManager_Interface
      ; handler : TypedEventHandler_ISpatialInteractionManager_add_SourceReleased
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceReleased
   (
      This       : access ISpatialInteractionManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_InteractionDetected
   (
      This       : access ISpatialInteractionManager_Interface
      ; handler : TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_InteractionDetected
   (
      This       : access ISpatialInteractionManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetDetectedSourcesAtTimestamp
   (
      This       : access ISpatialInteractionManager_Interface
      ; timeStamp : Windows.Perception.IPerceptionTimestamp
      ; RetVal : access Windows.UI.Input.Spatial.IVectorView_ISpatialInteractionSourceState -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialInteractionManagerStatics : aliased constant Windows.IID := (14884774, 36002, 12479, (145, 254, 217, 203, 74, 0, 137, 144 ));
   
   type ISpatialInteractionManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ISpatialInteractionManagerStatics_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ISpatialInteractionSourceState : aliased constant Windows.IID := (603258930, 36990, 23923, (187, 220, 247, 86, 61, 230, 85, 196 ));
   
   type IIterator_ISpatialInteractionSourceState_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISpatialInteractionSourceState_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionSourceState
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISpatialInteractionSourceState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISpatialInteractionSourceState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISpatialInteractionSourceState_Interface
      ; items : Windows.UI.Input.Spatial.ISpatialInteractionSourceState_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ISpatialInteractionSourceState : aliased constant Windows.IID := (2127356149, 2164, 20591, (141, 66, 76, 149, 25, 21, 100, 7 ));
   
   type IIterable_ISpatialInteractionSourceState_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISpatialInteractionSourceState_Interface
      ; RetVal : access Windows.UI.Input.Spatial.IIterator_ISpatialInteractionSourceState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ISpatialInteractionSourceState : aliased constant Windows.IID := (3755798673, 28220, 24155, (161, 147, 3, 172, 196, 20, 201, 33 ));
   
   type IVectorView_ISpatialInteractionSourceState_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISpatialInteractionSourceState_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionSourceState
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISpatialInteractionSourceState_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISpatialInteractionSourceState_Interface
      ; value : Windows.UI.Input.Spatial.ISpatialInteractionSourceState
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISpatialInteractionSourceState_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.Spatial.ISpatialInteractionSourceState_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted : aliased constant Windows.IID := (4072511958, 39418, 21913, (161, 74, 31, 122, 122, 146, 227, 215 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialRecognitionStartedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionStarted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialRecognitionStartedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded : aliased constant Windows.IID := (2947021527, 16343, 23681, (136, 2, 25, 92, 82, 63, 110, 123 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialRecognitionEndedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_RecognitionEnded_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialRecognitionEndedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_Tapped : aliased constant Windows.IID := (1661076900, 12179, 20514, (183, 184, 196, 62, 212, 40, 73, 138 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_Tapped_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialTappedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_Tapped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_Tapped_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialTappedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted : aliased constant Windows.IID := (1966595346, 696, 20786, (143, 247, 144, 200, 14, 244, 84, 209 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialHoldStartedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_HoldStarted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialHoldStartedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted : aliased constant Windows.IID := (3827685390, 35864, 21365, (182, 0, 29, 215, 161, 29, 186, 94 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialHoldCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_HoldCompleted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialHoldCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled : aliased constant Windows.IID := (1785813347, 50335, 24381, (191, 236, 149, 39, 0, 48, 136, 96 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialHoldCanceledEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_HoldCanceled_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialHoldCanceledEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted : aliased constant Windows.IID := (2703435051, 53224, 23803, (182, 28, 242, 220, 1, 30, 177, 46 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialManipulationStartedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationStarted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialManipulationStartedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated : aliased constant Windows.IID := (3469467683, 15433, 21262, (160, 16, 140, 12, 60, 189, 48, 136 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialManipulationUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationUpdated_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialManipulationUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted : aliased constant Windows.IID := (282773780, 48802, 23911, (134, 7, 220, 71, 14, 161, 220, 216 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialManipulationCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCompleted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialManipulationCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled : aliased constant Windows.IID := (3106563924, 14662, 21331, (184, 249, 42, 7, 235, 14, 136, 134 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialManipulationCanceledEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_ManipulationCanceled_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialManipulationCanceledEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted : aliased constant Windows.IID := (1410976476, 9728, 21115, (147, 152, 23, 68, 49, 141, 6, 24 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialNavigationStartedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_NavigationStarted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialNavigationStartedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated : aliased constant Windows.IID := (2803985296, 49525, 23080, (181, 0, 164, 69, 240, 117, 28, 91 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialNavigationUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_NavigationUpdated_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialNavigationUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted : aliased constant Windows.IID := (4040448479, 60371, 21384, (176, 169, 95, 68, 188, 214, 245, 143 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialNavigationCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCompleted_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialNavigationCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled : aliased constant Windows.IID := (2571627150, 60237, 24467, (159, 217, 42, 222, 100, 112, 188, 93 ));
   
   type TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer ; args : Windows.UI.Input.Spatial.ISpatialNavigationCanceledEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialGestureRecognizer_add_NavigationCanceled_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialGestureRecognizer
      ; args : Windows.UI.Input.Spatial.ISpatialNavigationCanceledEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialInteractionManager_add_SourceDetected : aliased constant Windows.IID := (2927828326, 28912, 21361, (134, 111, 163, 252, 139, 96, 226, 216 ));
   
   type TypedEventHandler_ISpatialInteractionManager_add_SourceDetected_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialInteractionManager ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialInteractionManager_add_SourceDetected'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_SourceDetected_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialInteractionManager_add_SourceLost : aliased constant Windows.IID := (2927828326, 28912, 21361, (134, 111, 163, 252, 139, 96, 226, 216 ));
   
   type TypedEventHandler_ISpatialInteractionManager_add_SourceLost_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialInteractionManager ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialInteractionManager_add_SourceLost'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_SourceLost_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated : aliased constant Windows.IID := (2927828326, 28912, 21361, (134, 111, 163, 252, 139, 96, 226, 216 ));
   
   type TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialInteractionManager ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_SourceUpdated_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialInteractionManager_add_SourcePressed : aliased constant Windows.IID := (2927828326, 28912, 21361, (134, 111, 163, 252, 139, 96, 226, 216 ));
   
   type TypedEventHandler_ISpatialInteractionManager_add_SourcePressed_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialInteractionManager ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialInteractionManager_add_SourcePressed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_SourcePressed_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialInteractionManager_add_SourceReleased : aliased constant Windows.IID := (2927828326, 28912, 21361, (134, 111, 163, 252, 139, 96, 226, 216 ));
   
   type TypedEventHandler_ISpatialInteractionManager_add_SourceReleased_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialInteractionManager ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialInteractionManager_add_SourceReleased'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_SourceReleased_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected : aliased constant Windows.IID := (253902735, 61984, 21384, (143, 230, 179, 183, 231, 147, 9, 135 ));
   
   type TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected_Interface(Callback : access procedure (sender : Windows.UI.Input.Spatial.ISpatialInteractionManager ; args : Windows.UI.Input.Spatial.ISpatialInteractionDetectedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialInteractionManager_add_InteractionDetected_Interface
      ; sender : Windows.UI.Input.Spatial.ISpatialInteractionManager
      ; args : Windows.UI.Input.Spatial.ISpatialInteractionDetectedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SpatialManipulationDelta is Windows.UI.Input.Spatial.ISpatialManipulationDelta;
   subtype SpatialGestureRecognizer is Windows.UI.Input.Spatial.ISpatialGestureRecognizer;
   function Create
   (
      settings : Windows.UI.Input.Spatial.SpatialGestureSettings
   )
   return Windows.UI.Input.Spatial.ISpatialGestureRecognizer;
   
   subtype SpatialRecognitionStartedEventArgs is Windows.UI.Input.Spatial.ISpatialRecognitionStartedEventArgs;
   subtype SpatialRecognitionEndedEventArgs is Windows.UI.Input.Spatial.ISpatialRecognitionEndedEventArgs;
   subtype SpatialTappedEventArgs is Windows.UI.Input.Spatial.ISpatialTappedEventArgs;
   subtype SpatialHoldStartedEventArgs is Windows.UI.Input.Spatial.ISpatialHoldStartedEventArgs;
   subtype SpatialHoldCompletedEventArgs is Windows.UI.Input.Spatial.ISpatialHoldCompletedEventArgs;
   subtype SpatialHoldCanceledEventArgs is Windows.UI.Input.Spatial.ISpatialHoldCanceledEventArgs;
   subtype SpatialManipulationStartedEventArgs is Windows.UI.Input.Spatial.ISpatialManipulationStartedEventArgs;
   subtype SpatialManipulationUpdatedEventArgs is Windows.UI.Input.Spatial.ISpatialManipulationUpdatedEventArgs;
   subtype SpatialManipulationCompletedEventArgs is Windows.UI.Input.Spatial.ISpatialManipulationCompletedEventArgs;
   subtype SpatialManipulationCanceledEventArgs is Windows.UI.Input.Spatial.ISpatialManipulationCanceledEventArgs;
   subtype SpatialNavigationStartedEventArgs is Windows.UI.Input.Spatial.ISpatialNavigationStartedEventArgs;
   subtype SpatialNavigationUpdatedEventArgs is Windows.UI.Input.Spatial.ISpatialNavigationUpdatedEventArgs;
   subtype SpatialNavigationCompletedEventArgs is Windows.UI.Input.Spatial.ISpatialNavigationCompletedEventArgs;
   subtype SpatialNavigationCanceledEventArgs is Windows.UI.Input.Spatial.ISpatialNavigationCanceledEventArgs;
   subtype SpatialPointerInteractionSourcePose is Windows.UI.Input.Spatial.ISpatialPointerInteractionSourcePose;
   subtype SpatialInteractionController is Windows.UI.Input.Spatial.ISpatialInteractionController;
   subtype SpatialInteractionSourceState is Windows.UI.Input.Spatial.ISpatialInteractionSourceState;
   subtype SpatialInteractionSourceLocation is Windows.UI.Input.Spatial.ISpatialInteractionSourceLocation;
   subtype SpatialInteractionSource is Windows.UI.Input.Spatial.ISpatialInteractionSource;
   subtype SpatialPointerPose is Windows.UI.Input.Spatial.ISpatialPointerPose;
   subtype SpatialInteractionSourceProperties is Windows.UI.Input.Spatial.ISpatialInteractionSourceProperties;
   subtype SpatialInteractionControllerProperties is Windows.UI.Input.Spatial.ISpatialInteractionControllerProperties;
   subtype SpatialInteraction is Windows.UI.Input.Spatial.ISpatialInteraction;
   subtype SpatialInteractionManager is Windows.UI.Input.Spatial.ISpatialInteractionManager;
   subtype SpatialInteractionSourceEventArgs is Windows.UI.Input.Spatial.ISpatialInteractionSourceEventArgs;
   subtype SpatialInteractionDetectedEventArgs is Windows.UI.Input.Spatial.ISpatialInteractionDetectedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function TryGetAtTimestamp
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; timestamp : Windows.Perception.IPerceptionTimestamp
   )
   return Windows.UI.Input.Spatial.ISpatialPointerPose;
   
   function GetForCurrentView
   return Windows.UI.Input.Spatial.ISpatialInteractionManager;
   
end;
