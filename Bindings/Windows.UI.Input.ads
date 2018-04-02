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
limited with Windows.UI.Core;
limited with Windows.Devices.Input;
with Windows.Foundation.Collections;
limited with Windows.Devices.Haptics;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.UI.Input is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type EdgeGestureKind is (
      Touch,
      Keyboard,
      Mouse
   );
   for EdgeGestureKind use (
      Touch => 0,
      Keyboard => 1,
      Mouse => 2
   );
   for EdgeGestureKind'Size use 32;
   
   type EdgeGestureKind_Ptr is access EdgeGestureKind;
   
   type HoldingState is (
      Started,
      Completed,
      Canceled
   );
   for HoldingState use (
      Started => 0,
      Completed => 1,
      Canceled => 2
   );
   for HoldingState'Size use 32;
   
   type HoldingState_Ptr is access HoldingState;
   
   type DraggingState is (
      Started,
      Continuing,
      Completed
   );
   for DraggingState use (
      Started => 0,
      Continuing => 1,
      Completed => 2
   );
   for DraggingState'Size use 32;
   
   type DraggingState_Ptr is access DraggingState;
   
   type CrossSlidingState is (
      Started,
      Dragging,
      Selecting,
      SelectSpeedBumping,
      SpeedBumping,
      Rearranging,
      Completed
   );
   for CrossSlidingState use (
      Started => 0,
      Dragging => 1,
      Selecting => 2,
      SelectSpeedBumping => 3,
      SpeedBumping => 4,
      Rearranging => 5,
      Completed => 6
   );
   for CrossSlidingState'Size use 32;
   
   type CrossSlidingState_Ptr is access CrossSlidingState;
   
   type GestureSettings is (
      None,
      Tap,
      DoubleTap,
      Hold,
      HoldWithMouse,
      RightTap,
      Drag,
      ManipulationTranslateX,
      ManipulationTranslateY,
      ManipulationTranslateRailsX,
      ManipulationTranslateRailsY,
      ManipulationRotate,
      ManipulationScale,
      ManipulationTranslateInertia,
      ManipulationRotateInertia,
      ManipulationScaleInertia,
      CrossSlide,
      ManipulationMultipleFingerPanning
   );
   for GestureSettings use (
      None => 0,
      Tap => 1,
      DoubleTap => 2,
      Hold => 4,
      HoldWithMouse => 8,
      RightTap => 16,
      Drag => 32,
      ManipulationTranslateX => 64,
      ManipulationTranslateY => 128,
      ManipulationTranslateRailsX => 256,
      ManipulationTranslateRailsY => 512,
      ManipulationRotate => 1024,
      ManipulationScale => 2048,
      ManipulationTranslateInertia => 4096,
      ManipulationRotateInertia => 8192,
      ManipulationScaleInertia => 16384,
      CrossSlide => 32768,
      ManipulationMultipleFingerPanning => 65536
   );
   for GestureSettings'Size use 32;
   
   type GestureSettings_Ptr is access GestureSettings;
   
   type PointerUpdateKind is (
      Other,
      LeftButtonPressed,
      LeftButtonReleased,
      RightButtonPressed,
      RightButtonReleased,
      MiddleButtonPressed,
      MiddleButtonReleased,
      XButton1Pressed,
      XButton1Released,
      XButton2Pressed,
      XButton2Released
   );
   for PointerUpdateKind use (
      Other => 0,
      LeftButtonPressed => 1,
      LeftButtonReleased => 2,
      RightButtonPressed => 3,
      RightButtonReleased => 4,
      MiddleButtonPressed => 5,
      MiddleButtonReleased => 6,
      XButton1Pressed => 7,
      XButton1Released => 8,
      XButton2Pressed => 9,
      XButton2Released => 10
   );
   for PointerUpdateKind'Size use 32;
   
   type PointerUpdateKind_Ptr is access PointerUpdateKind;
   
   type RadialControllerSystemMenuItemKind is (
      Scroll,
      Zoom,
      UndoRedo,
      Volume,
      NextPreviousTrack
   );
   for RadialControllerSystemMenuItemKind use (
      Scroll => 0,
      Zoom => 1,
      UndoRedo => 2,
      Volume => 3,
      NextPreviousTrack => 4
   );
   for RadialControllerSystemMenuItemKind'Size use 32;
   
   type RadialControllerSystemMenuItemKind_Ptr is access RadialControllerSystemMenuItemKind;
   
   type RadialControllerMenuKnownIcon is (
      Scroll,
      Zoom,
      UndoRedo,
      Volume,
      NextPreviousTrack,
      Ruler,
      InkColor,
      InkThickness,
      PenType
   );
   for RadialControllerMenuKnownIcon use (
      Scroll => 0,
      Zoom => 1,
      UndoRedo => 2,
      Volume => 3,
      NextPreviousTrack => 4,
      Ruler => 5,
      InkColor => 6,
      InkThickness => 7,
      PenType => 8
   );
   for RadialControllerMenuKnownIcon'Size use 32;
   
   type RadialControllerMenuKnownIcon_Ptr is access RadialControllerMenuKnownIcon;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ManipulationDelta is record
      Translation : Windows.Foundation.Point;
      Scale : Windows.Single;
      Rotation : Windows.Single;
      Expansion : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , ManipulationDelta);
   
   type ManipulationDelta_Ptr is access ManipulationDelta;
   
   type ManipulationVelocities is record
      Linear : Windows.Foundation.Point;
      Angular : Windows.Single;
      Expansion : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , ManipulationVelocities);
   
   type ManipulationVelocities_Ptr is access ManipulationVelocities;
   
   type CrossSlideThresholds is record
      SelectionStart : Windows.Single;
      SpeedBumpStart : Windows.Single;
      SpeedBumpEnd : Windows.Single;
      RearrangeStart : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , CrossSlideThresholds);
   
   type CrossSlideThresholds_Ptr is access CrossSlideThresholds;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IEdgeGesture_add_Starting_Interface;
   type TypedEventHandler_IEdgeGesture_add_Starting is access all TypedEventHandler_IEdgeGesture_add_Starting_Interface'Class;
   type TypedEventHandler_IEdgeGesture_add_Starting_Ptr is access all TypedEventHandler_IEdgeGesture_add_Starting;
   type TypedEventHandler_IEdgeGesture_add_Completed_Interface;
   type TypedEventHandler_IEdgeGesture_add_Completed is access all TypedEventHandler_IEdgeGesture_add_Completed_Interface'Class;
   type TypedEventHandler_IEdgeGesture_add_Completed_Ptr is access all TypedEventHandler_IEdgeGesture_add_Completed;
   type TypedEventHandler_IEdgeGesture_add_Canceled_Interface;
   type TypedEventHandler_IEdgeGesture_add_Canceled is access all TypedEventHandler_IEdgeGesture_add_Canceled_Interface'Class;
   type TypedEventHandler_IEdgeGesture_add_Canceled_Ptr is access all TypedEventHandler_IEdgeGesture_add_Canceled;
   type TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown_Interface;
   type TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown is access all TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown_Interface'Class;
   type TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown_Ptr is access all TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown;
   type TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp_Interface;
   type TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp is access all TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp_Interface'Class;
   type TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp_Ptr is access all TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp;
   type TypedEventHandler_IGestureRecognizer_add_Tapped_Interface;
   type TypedEventHandler_IGestureRecognizer_add_Tapped is access all TypedEventHandler_IGestureRecognizer_add_Tapped_Interface'Class;
   type TypedEventHandler_IGestureRecognizer_add_Tapped_Ptr is access all TypedEventHandler_IGestureRecognizer_add_Tapped;
   type TypedEventHandler_IGestureRecognizer_add_RightTapped_Interface;
   type TypedEventHandler_IGestureRecognizer_add_RightTapped is access all TypedEventHandler_IGestureRecognizer_add_RightTapped_Interface'Class;
   type TypedEventHandler_IGestureRecognizer_add_RightTapped_Ptr is access all TypedEventHandler_IGestureRecognizer_add_RightTapped;
   type TypedEventHandler_IGestureRecognizer_add_Holding_Interface;
   type TypedEventHandler_IGestureRecognizer_add_Holding is access all TypedEventHandler_IGestureRecognizer_add_Holding_Interface'Class;
   type TypedEventHandler_IGestureRecognizer_add_Holding_Ptr is access all TypedEventHandler_IGestureRecognizer_add_Holding;
   type TypedEventHandler_IGestureRecognizer_add_Dragging_Interface;
   type TypedEventHandler_IGestureRecognizer_add_Dragging is access all TypedEventHandler_IGestureRecognizer_add_Dragging_Interface'Class;
   type TypedEventHandler_IGestureRecognizer_add_Dragging_Ptr is access all TypedEventHandler_IGestureRecognizer_add_Dragging;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationStarted_Interface;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationStarted is access all TypedEventHandler_IGestureRecognizer_add_ManipulationStarted_Interface'Class;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationStarted_Ptr is access all TypedEventHandler_IGestureRecognizer_add_ManipulationStarted;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated_Interface;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated is access all TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated_Interface'Class;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated_Ptr is access all TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting_Interface;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting is access all TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting_Interface'Class;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting_Ptr is access all TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted_Interface;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted is access all TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted_Interface'Class;
   type TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted_Ptr is access all TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted;
   type TypedEventHandler_IGestureRecognizer_add_CrossSliding_Interface;
   type TypedEventHandler_IGestureRecognizer_add_CrossSliding is access all TypedEventHandler_IGestureRecognizer_add_CrossSliding_Interface'Class;
   type TypedEventHandler_IGestureRecognizer_add_CrossSliding_Ptr is access all TypedEventHandler_IGestureRecognizer_add_CrossSliding;
   type TypedEventHandler_IRadialController_add_ScreenContactStarted_Interface;
   type TypedEventHandler_IRadialController_add_ScreenContactStarted is access all TypedEventHandler_IRadialController_add_ScreenContactStarted_Interface'Class;
   type TypedEventHandler_IRadialController_add_ScreenContactStarted_Ptr is access all TypedEventHandler_IRadialController_add_ScreenContactStarted;
   type TypedEventHandler_IRadialController_add_ScreenContactEnded_Interface;
   type TypedEventHandler_IRadialController_add_ScreenContactEnded is access all TypedEventHandler_IRadialController_add_ScreenContactEnded_Interface'Class;
   type TypedEventHandler_IRadialController_add_ScreenContactEnded_Ptr is access all TypedEventHandler_IRadialController_add_ScreenContactEnded;
   type TypedEventHandler_IRadialController_add_ScreenContactContinued_Interface;
   type TypedEventHandler_IRadialController_add_ScreenContactContinued is access all TypedEventHandler_IRadialController_add_ScreenContactContinued_Interface'Class;
   type TypedEventHandler_IRadialController_add_ScreenContactContinued_Ptr is access all TypedEventHandler_IRadialController_add_ScreenContactContinued;
   type TypedEventHandler_IRadialController_add_ControlLost_Interface;
   type TypedEventHandler_IRadialController_add_ControlLost is access all TypedEventHandler_IRadialController_add_ControlLost_Interface'Class;
   type TypedEventHandler_IRadialController_add_ControlLost_Ptr is access all TypedEventHandler_IRadialController_add_ControlLost;
   type TypedEventHandler_IRadialController_add_RotationChanged_Interface;
   type TypedEventHandler_IRadialController_add_RotationChanged is access all TypedEventHandler_IRadialController_add_RotationChanged_Interface'Class;
   type TypedEventHandler_IRadialController_add_RotationChanged_Ptr is access all TypedEventHandler_IRadialController_add_RotationChanged;
   type TypedEventHandler_IRadialController_add_ButtonClicked_Interface;
   type TypedEventHandler_IRadialController_add_ButtonClicked is access all TypedEventHandler_IRadialController_add_ButtonClicked_Interface'Class;
   type TypedEventHandler_IRadialController_add_ButtonClicked_Ptr is access all TypedEventHandler_IRadialController_add_ButtonClicked;
   type TypedEventHandler_IRadialController_add_ControlAcquired_Interface;
   type TypedEventHandler_IRadialController_add_ControlAcquired is access all TypedEventHandler_IRadialController_add_ControlAcquired_Interface'Class;
   type TypedEventHandler_IRadialController_add_ControlAcquired_Ptr is access all TypedEventHandler_IRadialController_add_ControlAcquired;
   type TypedEventHandler_IRadialController2_add_ButtonPressed_Interface;
   type TypedEventHandler_IRadialController2_add_ButtonPressed is access all TypedEventHandler_IRadialController2_add_ButtonPressed_Interface'Class;
   type TypedEventHandler_IRadialController2_add_ButtonPressed_Ptr is access all TypedEventHandler_IRadialController2_add_ButtonPressed;
   type TypedEventHandler_IRadialController2_add_ButtonHolding_Interface;
   type TypedEventHandler_IRadialController2_add_ButtonHolding is access all TypedEventHandler_IRadialController2_add_ButtonHolding_Interface'Class;
   type TypedEventHandler_IRadialController2_add_ButtonHolding_Ptr is access all TypedEventHandler_IRadialController2_add_ButtonHolding;
   type TypedEventHandler_IRadialController2_add_ButtonReleased_Interface;
   type TypedEventHandler_IRadialController2_add_ButtonReleased is access all TypedEventHandler_IRadialController2_add_ButtonReleased_Interface'Class;
   type TypedEventHandler_IRadialController2_add_ButtonReleased_Ptr is access all TypedEventHandler_IRadialController2_add_ButtonReleased;
   type TypedEventHandler_IRadialControllerMenuItem_add_Invoked_Interface;
   type TypedEventHandler_IRadialControllerMenuItem_add_Invoked is access all TypedEventHandler_IRadialControllerMenuItem_add_Invoked_Interface'Class;
   type TypedEventHandler_IRadialControllerMenuItem_add_Invoked_Ptr is access all TypedEventHandler_IRadialControllerMenuItem_add_Invoked;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IEdgeGestureEventArgs_Interface;
   type IEdgeGestureEventArgs is access all IEdgeGestureEventArgs_Interface'Class;
   type IEdgeGestureEventArgs_Ptr is access all IEdgeGestureEventArgs;
   type IEdgeGestureStatics_Interface;
   type IEdgeGestureStatics is access all IEdgeGestureStatics_Interface'Class;
   type IEdgeGestureStatics_Ptr is access all IEdgeGestureStatics;
   type IEdgeGesture_Interface;
   type IEdgeGesture is access all IEdgeGesture_Interface'Class;
   type IEdgeGesture_Ptr is access all IEdgeGesture;
   type IKeyboardDeliveryInterceptor_Interface;
   type IKeyboardDeliveryInterceptor is access all IKeyboardDeliveryInterceptor_Interface'Class;
   type IKeyboardDeliveryInterceptor_Ptr is access all IKeyboardDeliveryInterceptor;
   type IKeyboardDeliveryInterceptorStatics_Interface;
   type IKeyboardDeliveryInterceptorStatics is access all IKeyboardDeliveryInterceptorStatics_Interface'Class;
   type IKeyboardDeliveryInterceptorStatics_Ptr is access all IKeyboardDeliveryInterceptorStatics;
   type ITappedEventArgs_Interface;
   type ITappedEventArgs is access all ITappedEventArgs_Interface'Class;
   type ITappedEventArgs_Ptr is access all ITappedEventArgs;
   type IRightTappedEventArgs_Interface;
   type IRightTappedEventArgs is access all IRightTappedEventArgs_Interface'Class;
   type IRightTappedEventArgs_Ptr is access all IRightTappedEventArgs;
   type IHoldingEventArgs_Interface;
   type IHoldingEventArgs is access all IHoldingEventArgs_Interface'Class;
   type IHoldingEventArgs_Ptr is access all IHoldingEventArgs;
   type IDraggingEventArgs_Interface;
   type IDraggingEventArgs is access all IDraggingEventArgs_Interface'Class;
   type IDraggingEventArgs_Ptr is access all IDraggingEventArgs;
   type IManipulationStartedEventArgs_Interface;
   type IManipulationStartedEventArgs is access all IManipulationStartedEventArgs_Interface'Class;
   type IManipulationStartedEventArgs_Ptr is access all IManipulationStartedEventArgs;
   type IManipulationUpdatedEventArgs_Interface;
   type IManipulationUpdatedEventArgs is access all IManipulationUpdatedEventArgs_Interface'Class;
   type IManipulationUpdatedEventArgs_Ptr is access all IManipulationUpdatedEventArgs;
   type IManipulationInertiaStartingEventArgs_Interface;
   type IManipulationInertiaStartingEventArgs is access all IManipulationInertiaStartingEventArgs_Interface'Class;
   type IManipulationInertiaStartingEventArgs_Ptr is access all IManipulationInertiaStartingEventArgs;
   type IManipulationCompletedEventArgs_Interface;
   type IManipulationCompletedEventArgs is access all IManipulationCompletedEventArgs_Interface'Class;
   type IManipulationCompletedEventArgs_Ptr is access all IManipulationCompletedEventArgs;
   type ICrossSlidingEventArgs_Interface;
   type ICrossSlidingEventArgs is access all ICrossSlidingEventArgs_Interface'Class;
   type ICrossSlidingEventArgs_Ptr is access all ICrossSlidingEventArgs;
   type IMouseWheelParameters_Interface;
   type IMouseWheelParameters is access all IMouseWheelParameters_Interface'Class;
   type IMouseWheelParameters_Ptr is access all IMouseWheelParameters;
   type IGestureRecognizer_Interface;
   type IGestureRecognizer is access all IGestureRecognizer_Interface'Class;
   type IGestureRecognizer_Ptr is access all IGestureRecognizer;
   type IPointerPointStatics_Interface;
   type IPointerPointStatics is access all IPointerPointStatics_Interface'Class;
   type IPointerPointStatics_Ptr is access all IPointerPointStatics;
   type IPointerPointTransform_Interface;
   type IPointerPointTransform is access all IPointerPointTransform_Interface'Class;
   type IPointerPointTransform_Ptr is access all IPointerPointTransform;
   type IPointerPoint_Interface;
   type IPointerPoint is access all IPointerPoint_Interface'Class;
   type IPointerPoint_Ptr is access all IPointerPoint;
   type IPointerPointProperties_Interface;
   type IPointerPointProperties is access all IPointerPointProperties_Interface'Class;
   type IPointerPointProperties_Ptr is access all IPointerPointProperties;
   type IPointerPointProperties2_Interface;
   type IPointerPointProperties2 is access all IPointerPointProperties2_Interface'Class;
   type IPointerPointProperties2_Ptr is access all IPointerPointProperties2;
   type IPointerVisualizationSettings_Interface;
   type IPointerVisualizationSettings is access all IPointerVisualizationSettings_Interface'Class;
   type IPointerVisualizationSettings_Ptr is access all IPointerVisualizationSettings;
   type IPointerVisualizationSettingsStatics_Interface;
   type IPointerVisualizationSettingsStatics is access all IPointerVisualizationSettingsStatics_Interface'Class;
   type IPointerVisualizationSettingsStatics_Ptr is access all IPointerVisualizationSettingsStatics;
   type IRadialControllerScreenContact_Interface;
   type IRadialControllerScreenContact is access all IRadialControllerScreenContact_Interface'Class;
   type IRadialControllerScreenContact_Ptr is access all IRadialControllerScreenContact;
   type IRadialControllerRotationChangedEventArgs_Interface;
   type IRadialControllerRotationChangedEventArgs is access all IRadialControllerRotationChangedEventArgs_Interface'Class;
   type IRadialControllerRotationChangedEventArgs_Ptr is access all IRadialControllerRotationChangedEventArgs;
   type IRadialControllerRotationChangedEventArgs2_Interface;
   type IRadialControllerRotationChangedEventArgs2 is access all IRadialControllerRotationChangedEventArgs2_Interface'Class;
   type IRadialControllerRotationChangedEventArgs2_Ptr is access all IRadialControllerRotationChangedEventArgs2;
   type IRadialControllerButtonPressedEventArgs_Interface;
   type IRadialControllerButtonPressedEventArgs is access all IRadialControllerButtonPressedEventArgs_Interface'Class;
   type IRadialControllerButtonPressedEventArgs_Ptr is access all IRadialControllerButtonPressedEventArgs;
   type IRadialControllerButtonHoldingEventArgs_Interface;
   type IRadialControllerButtonHoldingEventArgs is access all IRadialControllerButtonHoldingEventArgs_Interface'Class;
   type IRadialControllerButtonHoldingEventArgs_Ptr is access all IRadialControllerButtonHoldingEventArgs;
   type IRadialControllerButtonReleasedEventArgs_Interface;
   type IRadialControllerButtonReleasedEventArgs is access all IRadialControllerButtonReleasedEventArgs_Interface'Class;
   type IRadialControllerButtonReleasedEventArgs_Ptr is access all IRadialControllerButtonReleasedEventArgs;
   type IRadialControllerScreenContactStartedEventArgs_Interface;
   type IRadialControllerScreenContactStartedEventArgs is access all IRadialControllerScreenContactStartedEventArgs_Interface'Class;
   type IRadialControllerScreenContactStartedEventArgs_Ptr is access all IRadialControllerScreenContactStartedEventArgs;
   type IRadialControllerScreenContactStartedEventArgs2_Interface;
   type IRadialControllerScreenContactStartedEventArgs2 is access all IRadialControllerScreenContactStartedEventArgs2_Interface'Class;
   type IRadialControllerScreenContactStartedEventArgs2_Ptr is access all IRadialControllerScreenContactStartedEventArgs2;
   type IRadialControllerScreenContactContinuedEventArgs_Interface;
   type IRadialControllerScreenContactContinuedEventArgs is access all IRadialControllerScreenContactContinuedEventArgs_Interface'Class;
   type IRadialControllerScreenContactContinuedEventArgs_Ptr is access all IRadialControllerScreenContactContinuedEventArgs;
   type IRadialControllerScreenContactContinuedEventArgs2_Interface;
   type IRadialControllerScreenContactContinuedEventArgs2 is access all IRadialControllerScreenContactContinuedEventArgs2_Interface'Class;
   type IRadialControllerScreenContactContinuedEventArgs2_Ptr is access all IRadialControllerScreenContactContinuedEventArgs2;
   type IRadialControllerScreenContactEndedEventArgs_Interface;
   type IRadialControllerScreenContactEndedEventArgs is access all IRadialControllerScreenContactEndedEventArgs_Interface'Class;
   type IRadialControllerScreenContactEndedEventArgs_Ptr is access all IRadialControllerScreenContactEndedEventArgs;
   type IRadialControllerButtonClickedEventArgs_Interface;
   type IRadialControllerButtonClickedEventArgs is access all IRadialControllerButtonClickedEventArgs_Interface'Class;
   type IRadialControllerButtonClickedEventArgs_Ptr is access all IRadialControllerButtonClickedEventArgs;
   type IRadialControllerButtonClickedEventArgs2_Interface;
   type IRadialControllerButtonClickedEventArgs2 is access all IRadialControllerButtonClickedEventArgs2_Interface'Class;
   type IRadialControllerButtonClickedEventArgs2_Ptr is access all IRadialControllerButtonClickedEventArgs2;
   type IRadialControllerControlAcquiredEventArgs_Interface;
   type IRadialControllerControlAcquiredEventArgs is access all IRadialControllerControlAcquiredEventArgs_Interface'Class;
   type IRadialControllerControlAcquiredEventArgs_Ptr is access all IRadialControllerControlAcquiredEventArgs;
   type IRadialControllerControlAcquiredEventArgs2_Interface;
   type IRadialControllerControlAcquiredEventArgs2 is access all IRadialControllerControlAcquiredEventArgs2_Interface'Class;
   type IRadialControllerControlAcquiredEventArgs2_Ptr is access all IRadialControllerControlAcquiredEventArgs2;
   type IRadialController_Interface;
   type IRadialController is access all IRadialController_Interface'Class;
   type IRadialController_Ptr is access all IRadialController;
   type IRadialController2_Interface;
   type IRadialController2 is access all IRadialController2_Interface'Class;
   type IRadialController2_Ptr is access all IRadialController2;
   type IRadialControllerStatics_Interface;
   type IRadialControllerStatics is access all IRadialControllerStatics_Interface'Class;
   type IRadialControllerStatics_Ptr is access all IRadialControllerStatics;
   type IRadialControllerMenu_Interface;
   type IRadialControllerMenu is access all IRadialControllerMenu_Interface'Class;
   type IRadialControllerMenu_Ptr is access all IRadialControllerMenu;
   type IRadialControllerMenuItemStatics_Interface;
   type IRadialControllerMenuItemStatics is access all IRadialControllerMenuItemStatics_Interface'Class;
   type IRadialControllerMenuItemStatics_Ptr is access all IRadialControllerMenuItemStatics;
   type IRadialControllerMenuItemStatics2_Interface;
   type IRadialControllerMenuItemStatics2 is access all IRadialControllerMenuItemStatics2_Interface'Class;
   type IRadialControllerMenuItemStatics2_Ptr is access all IRadialControllerMenuItemStatics2;
   type IRadialControllerMenuItem_Interface;
   type IRadialControllerMenuItem is access all IRadialControllerMenuItem_Interface'Class;
   type IRadialControllerMenuItem_Ptr is access all IRadialControllerMenuItem;
   type IRadialControllerConfiguration_Interface;
   type IRadialControllerConfiguration is access all IRadialControllerConfiguration_Interface'Class;
   type IRadialControllerConfiguration_Ptr is access all IRadialControllerConfiguration;
   type IRadialControllerConfigurationStatics_Interface;
   type IRadialControllerConfigurationStatics is access all IRadialControllerConfigurationStatics_Interface'Class;
   type IRadialControllerConfigurationStatics_Ptr is access all IRadialControllerConfigurationStatics;
   type IRadialControllerConfiguration2_Interface;
   type IRadialControllerConfiguration2 is access all IRadialControllerConfiguration2_Interface'Class;
   type IRadialControllerConfiguration2_Ptr is access all IRadialControllerConfiguration2;
   type IRadialControllerConfigurationStatics2_Interface;
   type IRadialControllerConfigurationStatics2 is access all IRadialControllerConfigurationStatics2_Interface'Class;
   type IRadialControllerConfigurationStatics2_Ptr is access all IRadialControllerConfigurationStatics2;
   type IIterator_IPointerPoint_Interface;
   type IIterator_IPointerPoint is access all IIterator_IPointerPoint_Interface'Class;
   type IIterator_IPointerPoint_Ptr is access all IIterator_IPointerPoint;
   type IIterable_IPointerPoint_Interface;
   type IIterable_IPointerPoint is access all IIterable_IPointerPoint_Interface'Class;
   type IIterable_IPointerPoint_Ptr is access all IIterable_IPointerPoint;
   type IVectorView_IPointerPoint_Interface;
   type IVectorView_IPointerPoint is access all IVectorView_IPointerPoint_Interface'Class;
   type IVectorView_IPointerPoint_Ptr is access all IVectorView_IPointerPoint;
   type IVector_IPointerPoint_Interface;
   type IVector_IPointerPoint is access all IVector_IPointerPoint_Interface'Class;
   type IVector_IPointerPoint_Ptr is access all IVector_IPointerPoint;
   type IIterator_IRadialControllerMenuItem_Interface;
   type IIterator_IRadialControllerMenuItem is access all IIterator_IRadialControllerMenuItem_Interface'Class;
   type IIterator_IRadialControllerMenuItem_Ptr is access all IIterator_IRadialControllerMenuItem;
   type IIterable_IRadialControllerMenuItem_Interface;
   type IIterable_IRadialControllerMenuItem is access all IIterable_IRadialControllerMenuItem_Interface'Class;
   type IIterable_IRadialControllerMenuItem_Ptr is access all IIterable_IRadialControllerMenuItem;
   type IVectorView_IRadialControllerMenuItem_Interface;
   type IVectorView_IRadialControllerMenuItem is access all IVectorView_IRadialControllerMenuItem_Interface'Class;
   type IVectorView_IRadialControllerMenuItem_Ptr is access all IVectorView_IRadialControllerMenuItem;
   type IVector_IRadialControllerMenuItem_Interface;
   type IVector_IRadialControllerMenuItem is access all IVector_IRadialControllerMenuItem_Interface'Class;
   type IVector_IRadialControllerMenuItem_Ptr is access all IVector_IRadialControllerMenuItem;
   type IIterator_RadialControllerSystemMenuItemKind_Interface;
   type IIterator_RadialControllerSystemMenuItemKind is access all IIterator_RadialControllerSystemMenuItemKind_Interface'Class;
   type IIterator_RadialControllerSystemMenuItemKind_Ptr is access all IIterator_RadialControllerSystemMenuItemKind;
   type IIterable_RadialControllerSystemMenuItemKind_Interface;
   type IIterable_RadialControllerSystemMenuItemKind is access all IIterable_RadialControllerSystemMenuItemKind_Interface'Class;
   type IIterable_RadialControllerSystemMenuItemKind_Ptr is access all IIterable_RadialControllerSystemMenuItemKind;
   
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
   type IEdgeGestureEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IEdgeGestureEventArgs_Interface
      ; RetVal : access Windows.UI.Input.EdgeGestureKind
   )
   return Windows.HRESULT is abstract;
   
   IID_IEdgeGestureEventArgs : aliased constant Windows.IID := (1157253668, 11529, 17121, (139, 94, 54, 130, 8, 121, 106, 76 ));
   
   ------------------------------------------------------------------------
   type IEdgeGestureStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IEdgeGestureStatics_Interface
      ; RetVal : access Windows.UI.Input.IEdgeGesture
   )
   return Windows.HRESULT is abstract;
   
   IID_IEdgeGestureStatics : aliased constant Windows.IID := (3161097497, 6382, 16451, (152, 57, 79, 197, 132, 214, 10, 20 ));
   
   ------------------------------------------------------------------------
   type IEdgeGesture_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Starting
   (
      This       : access IEdgeGesture_Interface
      ; handler : TypedEventHandler_IEdgeGesture_add_Starting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Starting
   (
      This       : access IEdgeGesture_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Completed
   (
      This       : access IEdgeGesture_Interface
      ; handler : TypedEventHandler_IEdgeGesture_add_Completed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Completed
   (
      This       : access IEdgeGesture_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Canceled
   (
      This       : access IEdgeGesture_Interface
      ; handler : TypedEventHandler_IEdgeGesture_add_Canceled
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Canceled
   (
      This       : access IEdgeGesture_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IEdgeGesture : aliased constant Windows.IID := (1477268114, 10929, 18858, (167, 240, 51, 189, 63, 141, 249, 241 ));
   
   ------------------------------------------------------------------------
   type IKeyboardDeliveryInterceptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsInterceptionEnabledWhenInForeground
   (
      This       : access IKeyboardDeliveryInterceptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsInterceptionEnabledWhenInForeground
   (
      This       : access IKeyboardDeliveryInterceptor_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_KeyDown
   (
      This       : access IKeyboardDeliveryInterceptor_Interface
      ; handler : TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_KeyDown
   (
      This       : access IKeyboardDeliveryInterceptor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_KeyUp
   (
      This       : access IKeyboardDeliveryInterceptor_Interface
      ; handler : TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_KeyUp
   (
      This       : access IKeyboardDeliveryInterceptor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IKeyboardDeliveryInterceptor : aliased constant Windows.IID := (3032150120, 36681, 17516, (141, 181, 140, 15, 254, 133, 204, 158 ));
   
   ------------------------------------------------------------------------
   type IKeyboardDeliveryInterceptorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IKeyboardDeliveryInterceptorStatics_Interface
      ; RetVal : access Windows.UI.Input.IKeyboardDeliveryInterceptor
   )
   return Windows.HRESULT is abstract;
   
   IID_IKeyboardDeliveryInterceptorStatics : aliased constant Windows.IID := (4193663906, 52922, 18261, (138, 126, 20, 192, 255, 236, 210, 57 ));
   
   ------------------------------------------------------------------------
   type ITappedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access ITappedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access ITappedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_TapCount
   (
      This       : access ITappedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_ITappedEventArgs : aliased constant Windows.IID := (3483444964, 9530, 19516, (149, 59, 57, 92, 55, 174, 211, 9 ));
   
   ------------------------------------------------------------------------
   type IRightTappedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IRightTappedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IRightTappedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IRightTappedEventArgs : aliased constant Windows.IID := (1287602365, 44922, 18998, (148, 118, 177, 220, 225, 65, 112, 154 ));
   
   ------------------------------------------------------------------------
   type IHoldingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IHoldingEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IHoldingEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_HoldingState
   (
      This       : access IHoldingEventArgs_Interface
      ; RetVal : access Windows.UI.Input.HoldingState
   )
   return Windows.HRESULT is abstract;
   
   IID_IHoldingEventArgs : aliased constant Windows.IID := (737629637, 59289, 16820, (187, 64, 36, 47, 64, 149, 155, 113 ));
   
   ------------------------------------------------------------------------
   type IDraggingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IDraggingEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IDraggingEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_DraggingState
   (
      This       : access IDraggingEventArgs_Interface
      ; RetVal : access Windows.UI.Input.DraggingState
   )
   return Windows.HRESULT is abstract;
   
   IID_IDraggingEventArgs : aliased constant Windows.IID := (479220612, 2108, 19411, (181, 89, 23, 156, 221, 235, 51, 236 ));
   
   ------------------------------------------------------------------------
   type IManipulationStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IManipulationStartedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IManipulationStartedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Cumulative
   (
      This       : access IManipulationStartedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   IID_IManipulationStartedEventArgs : aliased constant Windows.IID := (3723265854, 53198, 18738, (140, 29, 60, 61, 1, 26, 52, 192 ));
   
   ------------------------------------------------------------------------
   type IManipulationUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IManipulationUpdatedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IManipulationUpdatedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Delta
   (
      This       : access IManipulationUpdatedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function get_Cumulative
   (
      This       : access IManipulationUpdatedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function get_Velocities
   (
      This       : access IManipulationUpdatedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationVelocities
   )
   return Windows.HRESULT is abstract;
   
   IID_IManipulationUpdatedEventArgs : aliased constant Windows.IID := (3409267941, 43960, 20383, (179, 206, 129, 129, 170, 97, 173, 130 ));
   
   ------------------------------------------------------------------------
   type IManipulationInertiaStartingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IManipulationInertiaStartingEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IManipulationInertiaStartingEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Delta
   (
      This       : access IManipulationInertiaStartingEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function get_Cumulative
   (
      This       : access IManipulationInertiaStartingEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function get_Velocities
   (
      This       : access IManipulationInertiaStartingEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationVelocities
   )
   return Windows.HRESULT is abstract;
   
   IID_IManipulationInertiaStartingEventArgs : aliased constant Windows.IID := (3711412376, 9919, 18042, (156, 229, 204, 243, 251, 17, 55, 30 ));
   
   ------------------------------------------------------------------------
   type IManipulationCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IManipulationCompletedEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IManipulationCompletedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Cumulative
   (
      This       : access IManipulationCompletedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationDelta
   )
   return Windows.HRESULT is abstract;
   
   function get_Velocities
   (
      This       : access IManipulationCompletedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.ManipulationVelocities
   )
   return Windows.HRESULT is abstract;
   
   IID_IManipulationCompletedEventArgs : aliased constant Windows.IID := (3008016939, 53659, 18175, (159, 56, 222, 199, 117, 75, 185, 231 ));
   
   ------------------------------------------------------------------------
   type ICrossSlidingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access ICrossSlidingEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access ICrossSlidingEventArgs_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_CrossSlidingState
   (
      This       : access ICrossSlidingEventArgs_Interface
      ; RetVal : access Windows.UI.Input.CrossSlidingState
   )
   return Windows.HRESULT is abstract;
   
   IID_ICrossSlidingEventArgs : aliased constant Windows.IID := (3912714040, 28552, 16857, (135, 32, 120, 224, 142, 57, 131, 73 ));
   
   ------------------------------------------------------------------------
   type IMouseWheelParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CharTranslation
   (
      This       : access IMouseWheelParameters_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_CharTranslation
   (
      This       : access IMouseWheelParameters_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_DeltaScale
   (
      This       : access IMouseWheelParameters_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_DeltaScale
   (
      This       : access IMouseWheelParameters_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_DeltaRotationAngle
   (
      This       : access IMouseWheelParameters_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_DeltaRotationAngle
   (
      This       : access IMouseWheelParameters_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_PageTranslation
   (
      This       : access IMouseWheelParameters_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_PageTranslation
   (
      This       : access IMouseWheelParameters_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IMouseWheelParameters : aliased constant Windows.IID := (3939551812, 40429, 16439, (129, 73, 94, 76, 194, 86, 68, 104 ));
   
   ------------------------------------------------------------------------
   type IGestureRecognizer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GestureSettings
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.UI.Input.GestureSettings
   )
   return Windows.HRESULT is abstract;
   
   function put_GestureSettings
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.UI.Input.GestureSettings
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInertial
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsActive
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShowGestureFeedback
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShowGestureFeedback
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PivotCenter
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function put_PivotCenter
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_PivotRadius
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_PivotRadius
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_InertiaTranslationDeceleration
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_InertiaTranslationDeceleration
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_InertiaRotationDeceleration
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_InertiaRotationDeceleration
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_InertiaExpansionDeceleration
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_InertiaExpansionDeceleration
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_InertiaTranslationDisplacement
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_InertiaTranslationDisplacement
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_InertiaRotationAngle
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_InertiaRotationAngle
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_InertiaExpansion
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_InertiaExpansion
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_ManipulationExact
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ManipulationExact
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CrossSlideThresholds
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.UI.Input.CrossSlideThresholds
   )
   return Windows.HRESULT is abstract;
   
   function put_CrossSlideThresholds
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.UI.Input.CrossSlideThresholds
   )
   return Windows.HRESULT is abstract;
   
   function get_CrossSlideHorizontally
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CrossSlideHorizontally
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CrossSlideExact
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CrossSlideExact
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoProcessInertia
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoProcessInertia
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MouseWheelParameters
   (
      This       : access IGestureRecognizer_Interface
      ; RetVal : access Windows.UI.Input.IMouseWheelParameters
   )
   return Windows.HRESULT is abstract;
   
   function CanBeDoubleTap
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.UI.Input.IPointerPoint
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ProcessDownEvent
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function ProcessMoveEvents
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.UI.Input.IVector_IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function ProcessUpEvent
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function ProcessMouseWheelEvent
   (
      This       : access IGestureRecognizer_Interface
      ; value : Windows.UI.Input.IPointerPoint
      ; isShiftKeyDown : Windows.Boolean
      ; isControlKeyDown : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ProcessInertia
   (
      This       : access IGestureRecognizer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function CompleteGesture
   (
      This       : access IGestureRecognizer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_Tapped
   (
      This       : access IGestureRecognizer_Interface
      ; handler : TypedEventHandler_IGestureRecognizer_add_Tapped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Tapped
   (
      This       : access IGestureRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RightTapped
   (
      This       : access IGestureRecognizer_Interface
      ; handler : TypedEventHandler_IGestureRecognizer_add_RightTapped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RightTapped
   (
      This       : access IGestureRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Holding
   (
      This       : access IGestureRecognizer_Interface
      ; handler : TypedEventHandler_IGestureRecognizer_add_Holding
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Holding
   (
      This       : access IGestureRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Dragging
   (
      This       : access IGestureRecognizer_Interface
      ; handler : TypedEventHandler_IGestureRecognizer_add_Dragging
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Dragging
   (
      This       : access IGestureRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationStarted
   (
      This       : access IGestureRecognizer_Interface
      ; handler : TypedEventHandler_IGestureRecognizer_add_ManipulationStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationStarted
   (
      This       : access IGestureRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationUpdated
   (
      This       : access IGestureRecognizer_Interface
      ; handler : TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationUpdated
   (
      This       : access IGestureRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationInertiaStarting
   (
      This       : access IGestureRecognizer_Interface
      ; handler : TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationInertiaStarting
   (
      This       : access IGestureRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ManipulationCompleted
   (
      This       : access IGestureRecognizer_Interface
      ; handler : TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ManipulationCompleted
   (
      This       : access IGestureRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CrossSliding
   (
      This       : access IGestureRecognizer_Interface
      ; handler : TypedEventHandler_IGestureRecognizer_add_CrossSliding
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CrossSliding
   (
      This       : access IGestureRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IGestureRecognizer : aliased constant Windows.IID := (3027908543, 15723, 20360, (131, 232, 109, 203, 64, 18, 255, 176 ));
   
   ------------------------------------------------------------------------
   type IPointerPointStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentPoint
   (
      This       : access IPointerPointStatics_Interface
      ; pointerId : Windows.UInt32
      ; RetVal : access Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function GetIntermediatePoints
   (
      This       : access IPointerPointStatics_Interface
      ; pointerId : Windows.UInt32
      ; RetVal : access Windows.UI.Input.IVector_IPointerPoint -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentPointTransformed
   (
      This       : access IPointerPointStatics_Interface
      ; pointerId : Windows.UInt32
      ; transform : Windows.UI.Input.IPointerPointTransform
      ; RetVal : access Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function GetIntermediatePointsTransformed
   (
      This       : access IPointerPointStatics_Interface
      ; pointerId : Windows.UInt32
      ; transform : Windows.UI.Input.IPointerPointTransform
      ; RetVal : access Windows.UI.Input.IVector_IPointerPoint -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerPointStatics : aliased constant Windows.IID := (2768659341, 10778, 16702, (188, 117, 159, 56, 56, 28, 192, 105 ));
   
   ------------------------------------------------------------------------
   type IPointerPointTransform_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Inverse
   (
      This       : access IPointerPointTransform_Interface
      ; RetVal : access Windows.UI.Input.IPointerPointTransform
   )
   return Windows.HRESULT is abstract;
   
   function TryTransform
   (
      This       : access IPointerPointTransform_Interface
      ; inPoint : Windows.Foundation.Point
      ; outPoint : access Windows.Foundation.Point
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TransformBounds
   (
      This       : access IPointerPointTransform_Interface
      ; rect : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerPointTransform : aliased constant Windows.IID := (1298129231, 47228, 16424, (188, 156, 89, 233, 148, 127, 176, 86 ));
   
   ------------------------------------------------------------------------
   type IPointerPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDevice
   (
      This       : access IPointerPoint_Interface
      ; RetVal : access Windows.Devices.Input.IPointerDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IPointerPoint_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_RawPosition
   (
      This       : access IPointerPoint_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerId
   (
      This       : access IPointerPoint_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameId
   (
      This       : access IPointerPoint_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access IPointerPoint_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInContact
   (
      This       : access IPointerPoint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPointerPoint_Interface
      ; RetVal : access Windows.UI.Input.IPointerPointProperties
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerPoint : aliased constant Windows.IID := (3918868861, 29334, 17113, (130, 51, 197, 190, 115, 183, 74, 74 ));
   
   ------------------------------------------------------------------------
   type IPointerPointProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Pressure
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInverted
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEraser
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_XTilt
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_YTilt
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Twist
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_ContactRect
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_ContactRectRaw
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_TouchConfidence
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLeftButtonPressed
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRightButtonPressed
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMiddleButtonPressed
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MouseWheelDelta
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHorizontalMouseWheel
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPrimary
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInRange
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCanceled
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBarrelButtonPressed
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsXButton1Pressed
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsXButton2Pressed
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerUpdateKind
   (
      This       : access IPointerPointProperties_Interface
      ; RetVal : access Windows.UI.Input.PointerUpdateKind
   )
   return Windows.HRESULT is abstract;
   
   function HasUsage
   (
      This       : access IPointerPointProperties_Interface
      ; usagePage : Windows.UInt32
      ; usageId : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetUsageValue
   (
      This       : access IPointerPointProperties_Interface
      ; usagePage : Windows.UInt32
      ; usageId : Windows.UInt32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerPointProperties : aliased constant Windows.IID := (3348990539, 49507, 20199, (128, 63, 103, 206, 121, 249, 151, 45 ));
   
   ------------------------------------------------------------------------
   type IPointerPointProperties2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ZDistance
   (
      This       : access IPointerPointProperties2_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerPointProperties2 : aliased constant Windows.IID := (583222074, 51259, 16832, (162, 150, 94, 35, 45, 100, 214, 175 ));
   
   ------------------------------------------------------------------------
   type IPointerVisualizationSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsContactFeedbackEnabled
   (
      This       : access IPointerVisualizationSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsContactFeedbackEnabled
   (
      This       : access IPointerVisualizationSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsBarrelButtonFeedbackEnabled
   (
      This       : access IPointerVisualizationSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBarrelButtonFeedbackEnabled
   (
      This       : access IPointerVisualizationSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerVisualizationSettings : aliased constant Windows.IID := (1293837409, 34039, 18845, (189, 145, 42, 54, 226, 183, 170, 162 ));
   
   ------------------------------------------------------------------------
   type IPointerVisualizationSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IPointerVisualizationSettingsStatics_Interface
      ; RetVal : access Windows.UI.Input.IPointerVisualizationSettings
   )
   return Windows.HRESULT is abstract;
   
   IID_IPointerVisualizationSettingsStatics : aliased constant Windows.IID := (1753681627, 5723, 16916, (180, 243, 88, 78, 202, 140, 138, 105 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerScreenContact_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Bounds
   (
      This       : access IRadialControllerScreenContact_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IRadialControllerScreenContact_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerScreenContact : aliased constant Windows.IID := (543859764, 58961, 4581, (191, 98, 44, 39, 215, 64, 78, 133 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerRotationChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RotationDeltaInDegrees
   (
      This       : access IRadialControllerRotationChangedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Contact
   (
      This       : access IRadialControllerRotationChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerScreenContact
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerRotationChangedEventArgs : aliased constant Windows.IID := (543859765, 58961, 4581, (191, 98, 44, 39, 215, 64, 78, 133 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerRotationChangedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsButtonPressed
   (
      This       : access IRadialControllerRotationChangedEventArgs2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SimpleHapticsController
   (
      This       : access IRadialControllerRotationChangedEventArgs2_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerRotationChangedEventArgs2 : aliased constant Windows.IID := (1029144300, 19694, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerButtonPressedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Contact
   (
      This       : access IRadialControllerButtonPressedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerScreenContact
   )
   return Windows.HRESULT is abstract;
   
   function get_SimpleHapticsController
   (
      This       : access IRadialControllerButtonPressedEventArgs_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerButtonPressedEventArgs : aliased constant Windows.IID := (1029144301, 19694, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerButtonHoldingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Contact
   (
      This       : access IRadialControllerButtonHoldingEventArgs_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerScreenContact
   )
   return Windows.HRESULT is abstract;
   
   function get_SimpleHapticsController
   (
      This       : access IRadialControllerButtonHoldingEventArgs_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerButtonHoldingEventArgs : aliased constant Windows.IID := (1029144302, 15598, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerButtonReleasedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Contact
   (
      This       : access IRadialControllerButtonReleasedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerScreenContact
   )
   return Windows.HRESULT is abstract;
   
   function get_SimpleHapticsController
   (
      This       : access IRadialControllerButtonReleasedEventArgs_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerButtonReleasedEventArgs : aliased constant Windows.IID := (1029144303, 15598, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerScreenContactStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Contact
   (
      This       : access IRadialControllerScreenContactStartedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerScreenContact
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerScreenContactStartedEventArgs : aliased constant Windows.IID := (543859766, 58961, 4581, (191, 98, 44, 39, 215, 64, 78, 133 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerScreenContactStartedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsButtonPressed
   (
      This       : access IRadialControllerScreenContactStartedEventArgs2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SimpleHapticsController
   (
      This       : access IRadialControllerScreenContactStartedEventArgs2_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerScreenContactStartedEventArgs2 : aliased constant Windows.IID := (1029144304, 15598, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerScreenContactContinuedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Contact
   (
      This       : access IRadialControllerScreenContactContinuedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerScreenContact
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerScreenContactContinuedEventArgs : aliased constant Windows.IID := (543859767, 58961, 4581, (191, 98, 44, 39, 215, 64, 78, 133 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerScreenContactContinuedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsButtonPressed
   (
      This       : access IRadialControllerScreenContactContinuedEventArgs2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SimpleHapticsController
   (
      This       : access IRadialControllerScreenContactContinuedEventArgs2_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerScreenContactContinuedEventArgs2 : aliased constant Windows.IID := (1029144305, 15598, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerScreenContactEndedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsButtonPressed
   (
      This       : access IRadialControllerScreenContactEndedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SimpleHapticsController
   (
      This       : access IRadialControllerScreenContactEndedEventArgs_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerScreenContactEndedEventArgs : aliased constant Windows.IID := (1029144306, 15598, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerButtonClickedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Contact
   (
      This       : access IRadialControllerButtonClickedEventArgs_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerScreenContact
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerButtonClickedEventArgs : aliased constant Windows.IID := (543859768, 58961, 4581, (191, 98, 44, 39, 215, 64, 78, 133 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerButtonClickedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SimpleHapticsController
   (
      This       : access IRadialControllerButtonClickedEventArgs2_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerButtonClickedEventArgs2 : aliased constant Windows.IID := (1029144307, 15598, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerControlAcquiredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Contact
   (
      This       : access IRadialControllerControlAcquiredEventArgs_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerScreenContact
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerControlAcquiredEventArgs : aliased constant Windows.IID := (543859769, 58961, 4581, (191, 98, 44, 39, 215, 64, 78, 133 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerControlAcquiredEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsButtonPressed
   (
      This       : access IRadialControllerControlAcquiredEventArgs2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SimpleHapticsController
   (
      This       : access IRadialControllerControlAcquiredEventArgs2_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerControlAcquiredEventArgs2 : aliased constant Windows.IID := (1029144308, 15598, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Menu
   (
      This       : access IRadialController_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerMenu
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationResolutionInDegrees
   (
      This       : access IRadialController_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationResolutionInDegrees
   (
      This       : access IRadialController_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_UseAutomaticHapticFeedback
   (
      This       : access IRadialController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_UseAutomaticHapticFeedback
   (
      This       : access IRadialController_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_ScreenContactStarted
   (
      This       : access IRadialController_Interface
      ; handler : TypedEventHandler_IRadialController_add_ScreenContactStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ScreenContactStarted
   (
      This       : access IRadialController_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ScreenContactEnded
   (
      This       : access IRadialController_Interface
      ; handler : TypedEventHandler_IRadialController_add_ScreenContactEnded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ScreenContactEnded
   (
      This       : access IRadialController_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ScreenContactContinued
   (
      This       : access IRadialController_Interface
      ; handler : TypedEventHandler_IRadialController_add_ScreenContactContinued
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ScreenContactContinued
   (
      This       : access IRadialController_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ControlLost
   (
      This       : access IRadialController_Interface
      ; handler : TypedEventHandler_IRadialController_add_ControlLost
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ControlLost
   (
      This       : access IRadialController_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RotationChanged
   (
      This       : access IRadialController_Interface
      ; handler : TypedEventHandler_IRadialController_add_RotationChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RotationChanged
   (
      This       : access IRadialController_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ButtonClicked
   (
      This       : access IRadialController_Interface
      ; handler : TypedEventHandler_IRadialController_add_ButtonClicked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ButtonClicked
   (
      This       : access IRadialController_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ControlAcquired
   (
      This       : access IRadialController_Interface
      ; handler : TypedEventHandler_IRadialController_add_ControlAcquired
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ControlAcquired
   (
      This       : access IRadialController_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialController : aliased constant Windows.IID := (810930632, 57169, 17364, (178, 59, 14, 16, 55, 70, 122, 9 ));
   
   ------------------------------------------------------------------------
   type IRadialController2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ButtonPressed
   (
      This       : access IRadialController2_Interface
      ; handler : TypedEventHandler_IRadialController2_add_ButtonPressed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ButtonPressed
   (
      This       : access IRadialController2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ButtonHolding
   (
      This       : access IRadialController2_Interface
      ; handler : TypedEventHandler_IRadialController2_add_ButtonHolding
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ButtonHolding
   (
      This       : access IRadialController2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ButtonReleased
   (
      This       : access IRadialController2_Interface
      ; handler : TypedEventHandler_IRadialController2_add_ButtonReleased
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ButtonReleased
   (
      This       : access IRadialController2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialController2 : aliased constant Windows.IID := (1029144319, 19694, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access IRadialControllerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CreateForCurrentView
   (
      This       : access IRadialControllerStatics_Interface
      ; RetVal : access Windows.UI.Input.IRadialController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerStatics : aliased constant Windows.IID := (4208906423, 47180, 18580, (135, 170, 143, 37, 170, 95, 40, 139 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerMenu_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Items
   (
      This       : access IRadialControllerMenu_Interface
      ; RetVal : access Windows.UI.Input.IVector_IRadialControllerMenuItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access IRadialControllerMenu_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access IRadialControllerMenu_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetSelectedMenuItem
   (
      This       : access IRadialControllerMenu_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function SelectMenuItem
   (
      This       : access IRadialControllerMenu_Interface
      ; menuItem : Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function TrySelectPreviouslySelectedMenuItem
   (
      This       : access IRadialControllerMenu_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerMenu : aliased constant Windows.IID := (2231808861, 63040, 17426, (171, 160, 186, 208, 119, 229, 234, 138 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerMenuItemStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromIcon
   (
      This       : access IRadialControllerMenuItemStatics_Interface
      ; displayText : Windows.String
      ; icon : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromKnownIcon
   (
      This       : access IRadialControllerMenuItemStatics_Interface
      ; displayText : Windows.String
      ; value : Windows.UI.Input.RadialControllerMenuKnownIcon
      ; RetVal : access Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerMenuItemStatics : aliased constant Windows.IID := (614336647, 55362, 17700, (157, 248, 224, 214, 71, 237, 200, 135 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerMenuItemStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromFontGlyph
   (
      This       : access IRadialControllerMenuItemStatics2_Interface
      ; displayText : Windows.String
      ; glyph : Windows.String
      ; fontFamily : Windows.String
      ; RetVal : access Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromFontGlyphWithUri
   (
      This       : access IRadialControllerMenuItemStatics2_Interface
      ; displayText : Windows.String
      ; glyph : Windows.String
      ; fontFamily : Windows.String
      ; fontUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerMenuItemStatics2 : aliased constant Windows.IID := (213610686, 32318, 18621, (190, 4, 44, 127, 202, 169, 193, 255 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerMenuItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayText
   (
      This       : access IRadialControllerMenuItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access IRadialControllerMenuItem_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Tag
   (
      This       : access IRadialControllerMenuItem_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function add_Invoked
   (
      This       : access IRadialControllerMenuItem_Interface
      ; handler : TypedEventHandler_IRadialControllerMenuItem_add_Invoked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Invoked
   (
      This       : access IRadialControllerMenuItem_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerMenuItem : aliased constant Windows.IID := (3356477837, 44299, 19612, (143, 47, 19, 106, 35, 115, 166, 186 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function SetDefaultMenuItems
   (
      This       : access IRadialControllerConfiguration_Interface
      ; buttons : Windows.UI.Input.IIterable_RadialControllerSystemMenuItemKind
   )
   return Windows.HRESULT is abstract;
   
   function ResetToDefaultMenuItems
   (
      This       : access IRadialControllerConfiguration_Interface
   )
   return Windows.HRESULT is abstract;
   
   function TrySelectDefaultMenuItem
   (
      This       : access IRadialControllerConfiguration_Interface
      ; type_x : Windows.UI.Input.RadialControllerSystemMenuItemKind
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerConfiguration : aliased constant Windows.IID := (2797051595, 27218, 17456, (145, 12, 86, 55, 10, 157, 107, 66 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerConfigurationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IRadialControllerConfigurationStatics_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerConfiguration
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerConfigurationStatics : aliased constant Windows.IID := (2042015973, 1690, 17542, (169, 157, 141, 183, 114, 185, 100, 47 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerConfiguration2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ActiveControllerWhenMenuIsSuppressed
   (
      This       : access IRadialControllerConfiguration2_Interface
      ; value : Windows.UI.Input.IRadialController
   )
   return Windows.HRESULT is abstract;
   
   function get_ActiveControllerWhenMenuIsSuppressed
   (
      This       : access IRadialControllerConfiguration2_Interface
      ; RetVal : access Windows.UI.Input.IRadialController
   )
   return Windows.HRESULT is abstract;
   
   function put_IsMenuSuppressed
   (
      This       : access IRadialControllerConfiguration2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMenuSuppressed
   (
      This       : access IRadialControllerConfiguration2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerConfiguration2 : aliased constant Windows.IID := (1029144311, 15598, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IRadialControllerConfigurationStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_AppController
   (
      This       : access IRadialControllerConfigurationStatics2_Interface
      ; value : Windows.UI.Input.IRadialController
   )
   return Windows.HRESULT is abstract;
   
   function get_AppController
   (
      This       : access IRadialControllerConfigurationStatics2_Interface
      ; RetVal : access Windows.UI.Input.IRadialController
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAppControllerEnabled
   (
      This       : access IRadialControllerConfigurationStatics2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAppControllerEnabled
   (
      This       : access IRadialControllerConfigurationStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IRadialControllerConfigurationStatics2 : aliased constant Windows.IID := (1407224599, 57861, 18643, (156, 175, 128, 255, 71, 196, 215, 199 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPointerPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPointerPoint_Interface
      ; RetVal : access Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPointerPoint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPointerPoint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPointerPoint_Interface
      ; items : Windows.UI.Input.IPointerPoint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPointerPoint : aliased constant Windows.IID := (1914691612, 23252, 21090, (176, 120, 58, 179, 69, 16, 93, 184 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPointerPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPointerPoint_Interface
      ; RetVal : access Windows.UI.Input.IIterator_IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPointerPoint : aliased constant Windows.IID := (4143106982, 28790, 23385, (150, 49, 246, 172, 50, 181, 118, 149 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IPointerPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPointerPoint_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPointerPoint_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPointerPoint_Interface
      ; value : Windows.UI.Input.IPointerPoint
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPointerPoint_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.IPointerPoint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IPointerPoint : aliased constant Windows.IID := (4042617873, 30598, 20852, (135, 82, 76, 94, 131, 75, 109, 162 ));
   
   ------------------------------------------------------------------------
   type IVector_IPointerPoint_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPointerPoint_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPointerPoint_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPointerPoint_Interface
      ; RetVal : access Windows.UI.Input.IVectorView_IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPointerPoint_Interface
      ; value : Windows.UI.Input.IPointerPoint
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPointerPoint_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPointerPoint_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPointerPoint_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPointerPoint_Interface
      ; value : Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPointerPoint_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPointerPoint_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPointerPoint_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.IPointerPoint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPointerPoint_Interface
      ; items : Windows.UI.Input.IPointerPoint_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IPointerPoint : aliased constant Windows.IID := (3752220111, 64999, 20552, (180, 191, 201, 9, 35, 27, 126, 219 ));
   
   ------------------------------------------------------------------------
   type IIterator_IRadialControllerMenuItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRadialControllerMenuItem_Interface
      ; RetVal : access Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRadialControllerMenuItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRadialControllerMenuItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRadialControllerMenuItem_Interface
      ; items : Windows.UI.Input.IRadialControllerMenuItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IRadialControllerMenuItem : aliased constant Windows.IID := (1517764132, 55656, 21342, (150, 154, 118, 206, 54, 2, 166, 55 ));
   
   ------------------------------------------------------------------------
   type IIterable_IRadialControllerMenuItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRadialControllerMenuItem_Interface
      ; RetVal : access Windows.UI.Input.IIterator_IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IRadialControllerMenuItem : aliased constant Windows.IID := (447173299, 56337, 23502, (178, 185, 205, 27, 248, 242, 53, 190 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IRadialControllerMenuItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IRadialControllerMenuItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IRadialControllerMenuItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IRadialControllerMenuItem_Interface
      ; value : Windows.UI.Input.IRadialControllerMenuItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IRadialControllerMenuItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.IRadialControllerMenuItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IRadialControllerMenuItem : aliased constant Windows.IID := (3105518402, 16331, 20779, (174, 241, 253, 164, 113, 46, 88, 23 ));
   
   ------------------------------------------------------------------------
   type IVector_IRadialControllerMenuItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
      ; RetVal : access Windows.UI.Input.IVectorView_IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
      ; value : Windows.UI.Input.IRadialControllerMenuItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
      ; value : Windows.UI.Input.IRadialControllerMenuItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Input.IRadialControllerMenuItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IRadialControllerMenuItem_Interface
      ; items : Windows.UI.Input.IRadialControllerMenuItem_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_IRadialControllerMenuItem : aliased constant Windows.IID := (3219035367, 28920, 23744, (152, 226, 140, 15, 140, 229, 36, 171 ));
   
   ------------------------------------------------------------------------
   type IIterator_RadialControllerSystemMenuItemKind_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_RadialControllerSystemMenuItemKind_Interface
      ; RetVal : access Windows.UI.Input.RadialControllerSystemMenuItemKind
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_RadialControllerSystemMenuItemKind_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_RadialControllerSystemMenuItemKind_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_RadialControllerSystemMenuItemKind_Interface
      ; items : Windows.UI.Input.RadialControllerSystemMenuItemKind_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_RadialControllerSystemMenuItemKind : aliased constant Windows.IID := (1069291608, 42046, 21724, (176, 226, 139, 9, 139, 221, 172, 246 ));
   
   ------------------------------------------------------------------------
   type IIterable_RadialControllerSystemMenuItemKind_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_RadialControllerSystemMenuItemKind_Interface
      ; RetVal : access Windows.UI.Input.IIterator_RadialControllerSystemMenuItemKind
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_RadialControllerSystemMenuItemKind : aliased constant Windows.IID := (1159069967, 64920, 24093, (191, 63, 174, 175, 121, 241, 243, 218 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEdgeGesture_add_Starting_Interface(Callback : access procedure (sender : Windows.UI.Input.IEdgeGesture ; args : Windows.UI.Input.IEdgeGestureEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEdgeGesture_add_Starting_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEdgeGesture_add_Starting_Interface
      ; sender : Windows.UI.Input.IEdgeGesture
      ; args : Windows.UI.Input.IEdgeGestureEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEdgeGesture_add_Starting : aliased constant Windows.IID := (3056434961, 51121, 23536, (163, 71, 51, 102, 37, 45, 180, 206 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEdgeGesture_add_Completed_Interface(Callback : access procedure (sender : Windows.UI.Input.IEdgeGesture ; args : Windows.UI.Input.IEdgeGestureEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEdgeGesture_add_Completed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEdgeGesture_add_Completed_Interface
      ; sender : Windows.UI.Input.IEdgeGesture
      ; args : Windows.UI.Input.IEdgeGestureEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEdgeGesture_add_Completed : aliased constant Windows.IID := (3056434961, 51121, 23536, (163, 71, 51, 102, 37, 45, 180, 206 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IEdgeGesture_add_Canceled_Interface(Callback : access procedure (sender : Windows.UI.Input.IEdgeGesture ; args : Windows.UI.Input.IEdgeGestureEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IEdgeGesture_add_Canceled_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEdgeGesture_add_Canceled_Interface
      ; sender : Windows.UI.Input.IEdgeGesture
      ; args : Windows.UI.Input.IEdgeGestureEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IEdgeGesture_add_Canceled : aliased constant Windows.IID := (3056434961, 51121, 23536, (163, 71, 51, 102, 37, 45, 180, 206 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown_Interface(Callback : access procedure (sender : Windows.UI.Input.IKeyboardDeliveryInterceptor ; args : Windows.UI.Core.IKeyEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown_Interface
      ; sender : Windows.UI.Input.IKeyboardDeliveryInterceptor
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyDown : aliased constant Windows.IID := (740077329, 40303, 24079, (169, 234, 76, 124, 115, 77, 115, 214 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp_Interface(Callback : access procedure (sender : Windows.UI.Input.IKeyboardDeliveryInterceptor ; args : Windows.UI.Core.IKeyEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp_Interface
      ; sender : Windows.UI.Input.IKeyboardDeliveryInterceptor
      ; args : Windows.UI.Core.IKeyEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IKeyboardDeliveryInterceptor_add_KeyUp : aliased constant Windows.IID := (740077329, 40303, 24079, (169, 234, 76, 124, 115, 77, 115, 214 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGestureRecognizer_add_Tapped_Interface(Callback : access procedure (sender : Windows.UI.Input.IGestureRecognizer ; args : Windows.UI.Input.ITappedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGestureRecognizer_add_Tapped_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_Tapped_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.ITappedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGestureRecognizer_add_Tapped : aliased constant Windows.IID := (670281047, 35220, 22290, (139, 131, 169, 59, 161, 124, 3, 194 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGestureRecognizer_add_RightTapped_Interface(Callback : access procedure (sender : Windows.UI.Input.IGestureRecognizer ; args : Windows.UI.Input.IRightTappedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGestureRecognizer_add_RightTapped_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_RightTapped_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IRightTappedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGestureRecognizer_add_RightTapped : aliased constant Windows.IID := (2216743490, 47668, 23319, (146, 243, 143, 118, 127, 29, 13, 228 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGestureRecognizer_add_Holding_Interface(Callback : access procedure (sender : Windows.UI.Input.IGestureRecognizer ; args : Windows.UI.Input.IHoldingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGestureRecognizer_add_Holding_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_Holding_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IHoldingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGestureRecognizer_add_Holding : aliased constant Windows.IID := (2604533, 26952, 21495, (175, 190, 212, 216, 254, 80, 15, 235 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGestureRecognizer_add_Dragging_Interface(Callback : access procedure (sender : Windows.UI.Input.IGestureRecognizer ; args : Windows.UI.Input.IDraggingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGestureRecognizer_add_Dragging_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_Dragging_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IDraggingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGestureRecognizer_add_Dragging : aliased constant Windows.IID := (3195849282, 39133, 23922, (158, 145, 151, 97, 19, 215, 152, 94 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGestureRecognizer_add_ManipulationStarted_Interface(Callback : access procedure (sender : Windows.UI.Input.IGestureRecognizer ; args : Windows.UI.Input.IManipulationStartedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGestureRecognizer_add_ManipulationStarted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_ManipulationStarted_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IManipulationStartedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGestureRecognizer_add_ManipulationStarted : aliased constant Windows.IID := (286094792, 47710, 21602, (139, 45, 74, 21, 130, 87, 75, 97 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated_Interface(Callback : access procedure (sender : Windows.UI.Input.IGestureRecognizer ; args : Windows.UI.Input.IManipulationUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IManipulationUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGestureRecognizer_add_ManipulationUpdated : aliased constant Windows.IID := (3948025589, 522, 24128, (156, 75, 72, 145, 44, 105, 14, 45 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting_Interface(Callback : access procedure (sender : Windows.UI.Input.IGestureRecognizer ; args : Windows.UI.Input.IManipulationInertiaStartingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IManipulationInertiaStartingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGestureRecognizer_add_ManipulationInertiaStarting : aliased constant Windows.IID := (889877163, 13477, 20883, (145, 61, 61, 76, 89, 131, 132, 44 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted_Interface(Callback : access procedure (sender : Windows.UI.Input.IGestureRecognizer ; args : Windows.UI.Input.IManipulationCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.IManipulationCompletedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGestureRecognizer_add_ManipulationCompleted : aliased constant Windows.IID := (3259979269, 12377, 21196, (189, 243, 112, 152, 20, 109, 52, 215 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGestureRecognizer_add_CrossSliding_Interface(Callback : access procedure (sender : Windows.UI.Input.IGestureRecognizer ; args : Windows.UI.Input.ICrossSlidingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGestureRecognizer_add_CrossSliding_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGestureRecognizer_add_CrossSliding_Interface
      ; sender : Windows.UI.Input.IGestureRecognizer
      ; args : Windows.UI.Input.ICrossSlidingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGestureRecognizer_add_CrossSliding : aliased constant Windows.IID := (532802416, 3110, 23792, (158, 80, 132, 58, 52, 8, 54, 19 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialController_add_ScreenContactStarted_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialController ; args : Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialController_add_ScreenContactStarted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ScreenContactStarted_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialController_add_ScreenContactStarted : aliased constant Windows.IID := (523065422, 15064, 20553, (180, 81, 58, 68, 161, 2, 250, 130 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialController_add_ScreenContactEnded_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialController ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialController_add_ScreenContactEnded_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ScreenContactEnded_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialController_add_ScreenContactEnded : aliased constant Windows.IID := (1578079153, 49906, 21329, (130, 170, 108, 245, 244, 194, 208, 104 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialController_add_ScreenContactContinued_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialController ; args : Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialController_add_ScreenContactContinued_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ScreenContactContinued_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialController_add_ScreenContactContinued : aliased constant Windows.IID := (811048551, 64335, 23864, (131, 180, 156, 182, 16, 9, 13, 239 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialController_add_ControlLost_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialController ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialController_add_ControlLost_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ControlLost_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialController_add_ControlLost : aliased constant Windows.IID := (1578079153, 49906, 21329, (130, 170, 108, 245, 244, 194, 208, 104 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialController_add_RotationChanged_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialController ; args : Windows.UI.Input.IRadialControllerRotationChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialController_add_RotationChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_RotationChanged_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerRotationChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialController_add_RotationChanged : aliased constant Windows.IID := (2414295753, 35382, 20818, (129, 93, 3, 49, 14, 232, 191, 133 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialController_add_ButtonClicked_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialController ; args : Windows.UI.Input.IRadialControllerButtonClickedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialController_add_ButtonClicked_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ButtonClicked_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerButtonClickedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialController_add_ButtonClicked : aliased constant Windows.IID := (3499990988, 60856, 22208, (133, 109, 112, 228, 119, 169, 221, 243 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialController_add_ControlAcquired_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialController ; args : Windows.UI.Input.IRadialControllerControlAcquiredEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialController_add_ControlAcquired_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController_add_ControlAcquired_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerControlAcquiredEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialController_add_ControlAcquired : aliased constant Windows.IID := (1321595901, 45591, 21586, (162, 189, 151, 37, 206, 159, 102, 117 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialController2_add_ButtonPressed_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialController ; args : Windows.UI.Input.IRadialControllerButtonPressedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialController2_add_ButtonPressed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController2_add_ButtonPressed_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerButtonPressedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialController2_add_ButtonPressed : aliased constant Windows.IID := (1712057930, 20461, 23138, (170, 93, 129, 19, 180, 119, 188, 105 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialController2_add_ButtonHolding_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialController ; args : Windows.UI.Input.IRadialControllerButtonHoldingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialController2_add_ButtonHolding_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController2_add_ButtonHolding_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerButtonHoldingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialController2_add_ButtonHolding : aliased constant Windows.IID := (1279587071, 14922, 20922, (160, 31, 159, 32, 2, 71, 31, 89 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialController2_add_ButtonReleased_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialController ; args : Windows.UI.Input.IRadialControllerButtonReleasedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialController2_add_ButtonReleased_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialController2_add_ButtonReleased_Interface
      ; sender : Windows.UI.Input.IRadialController
      ; args : Windows.UI.Input.IRadialControllerButtonReleasedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialController2_add_ButtonReleased : aliased constant Windows.IID := (3257923116, 50754, 23888, (147, 64, 254, 22, 49, 34, 114, 12 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IRadialControllerMenuItem_add_Invoked_Interface(Callback : access procedure (sender : Windows.UI.Input.IRadialControllerMenuItem ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IRadialControllerMenuItem_add_Invoked_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IRadialControllerMenuItem_add_Invoked_Interface
      ; sender : Windows.UI.Input.IRadialControllerMenuItem
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IRadialControllerMenuItem_add_Invoked : aliased constant Windows.IID := (1552996091, 58616, 23522, (133, 68, 157, 227, 63, 130, 196, 26 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype EdgeGestureEventArgs is Windows.UI.Input.IEdgeGestureEventArgs;
   subtype EdgeGesture is Windows.UI.Input.IEdgeGesture;
   subtype KeyboardDeliveryInterceptor is Windows.UI.Input.IKeyboardDeliveryInterceptor;
   subtype MouseWheelParameters is Windows.UI.Input.IMouseWheelParameters;
   subtype GestureRecognizer is Windows.UI.Input.IGestureRecognizer;
   
   function CreateGestureRecognizer return Windows.UI.Input.IGestureRecognizer;
   
   subtype TappedEventArgs is Windows.UI.Input.ITappedEventArgs;
   subtype RightTappedEventArgs is Windows.UI.Input.IRightTappedEventArgs;
   subtype HoldingEventArgs is Windows.UI.Input.IHoldingEventArgs;
   subtype DraggingEventArgs is Windows.UI.Input.IDraggingEventArgs;
   subtype ManipulationStartedEventArgs is Windows.UI.Input.IManipulationStartedEventArgs;
   subtype ManipulationUpdatedEventArgs is Windows.UI.Input.IManipulationUpdatedEventArgs;
   subtype ManipulationInertiaStartingEventArgs is Windows.UI.Input.IManipulationInertiaStartingEventArgs;
   subtype ManipulationCompletedEventArgs is Windows.UI.Input.IManipulationCompletedEventArgs;
   subtype CrossSlidingEventArgs is Windows.UI.Input.ICrossSlidingEventArgs;
   subtype PointerPoint is Windows.UI.Input.IPointerPoint;
   subtype PointerPointProperties is Windows.UI.Input.IPointerPointProperties;
   subtype PointerVisualizationSettings is Windows.UI.Input.IPointerVisualizationSettings;
   subtype RadialControllerScreenContact is Windows.UI.Input.IRadialControllerScreenContact;
   subtype RadialControllerMenu is Windows.UI.Input.IRadialControllerMenu;
   subtype RadialController is Windows.UI.Input.IRadialController;
   subtype RadialControllerScreenContactStartedEventArgs is Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs;
   subtype RadialControllerScreenContactContinuedEventArgs is Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs;
   subtype RadialControllerRotationChangedEventArgs is Windows.UI.Input.IRadialControllerRotationChangedEventArgs;
   subtype RadialControllerButtonClickedEventArgs is Windows.UI.Input.IRadialControllerButtonClickedEventArgs;
   subtype RadialControllerControlAcquiredEventArgs is Windows.UI.Input.IRadialControllerControlAcquiredEventArgs;
   subtype RadialControllerButtonPressedEventArgs is Windows.UI.Input.IRadialControllerButtonPressedEventArgs;
   subtype RadialControllerButtonHoldingEventArgs is Windows.UI.Input.IRadialControllerButtonHoldingEventArgs;
   subtype RadialControllerButtonReleasedEventArgs is Windows.UI.Input.IRadialControllerButtonReleasedEventArgs;
   subtype RadialControllerMenuItem is Windows.UI.Input.IRadialControllerMenuItem;
   subtype RadialControllerConfiguration is Windows.UI.Input.IRadialControllerConfiguration;
   subtype RadialControllerScreenContactEndedEventArgs is Windows.UI.Input.IRadialControllerScreenContactEndedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForCurrentView
   return Windows.UI.Input.IEdgeGesture;
   
   function GetForCurrentView
   return Windows.UI.Input.IKeyboardDeliveryInterceptor;
   
   function GetCurrentPoint
   (
      pointerId : Windows.UInt32
   )
   return Windows.UI.Input.IPointerPoint;
   
   function GetIntermediatePoints
   (
      pointerId : Windows.UInt32
   )
   return Windows.UI.Input.IVector_IPointerPoint;
   
   function GetCurrentPointTransformed
   (
      pointerId : Windows.UInt32
      ; transform : Windows.UI.Input.IPointerPointTransform
   )
   return Windows.UI.Input.IPointerPoint;
   
   function GetIntermediatePointsTransformed
   (
      pointerId : Windows.UInt32
      ; transform : Windows.UI.Input.IPointerPointTransform
   )
   return Windows.UI.Input.IVector_IPointerPoint;
   
   function GetForCurrentView
   return Windows.UI.Input.IPointerVisualizationSettings;
   
   function IsSupported
   return Windows.Boolean;
   
   function CreateForCurrentView
   return Windows.UI.Input.IRadialController;
   
   function CreateFromIcon
   (
      displayText : Windows.String
      ; icon : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.UI.Input.IRadialControllerMenuItem;
   
   function CreateFromKnownIcon
   (
      displayText : Windows.String
      ; value : Windows.UI.Input.RadialControllerMenuKnownIcon
   )
   return Windows.UI.Input.IRadialControllerMenuItem;
   
   function CreateFromFontGlyph
   (
      displayText : Windows.String
      ; glyph : Windows.String
      ; fontFamily : Windows.String
   )
   return Windows.UI.Input.IRadialControllerMenuItem;
   
   function CreateFromFontGlyphWithUri
   (
      displayText : Windows.String
      ; glyph : Windows.String
      ; fontFamily : Windows.String
      ; fontUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.UI.Input.IRadialControllerMenuItem;
   
   procedure put_AppController
   (
      value : Windows.UI.Input.IRadialController
   )
   ;
   
   function get_AppController
   return Windows.UI.Input.IRadialController;
   
   procedure put_IsAppControllerEnabled
   (
      value : Windows.Boolean
   )
   ;
   
   function get_IsAppControllerEnabled
   return Windows.Boolean;
   
   function GetForCurrentView
   return Windows.UI.Input.IRadialControllerConfiguration;

end;
